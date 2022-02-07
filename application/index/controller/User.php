<?php

namespace app\index\controller;

use addons\wechat\model\WechatCaptcha;
use app\admin\model\Area;
use app\admin\model\Station;
use app\admin\model\StationRelation;
use app\admin\model\UserRelation;
use app\common\controller\Frontend;
use app\common\library\Ems;
use app\common\library\Sms;
use app\common\model\Attachment;
use think\Config;
use think\Cookie;
use think\Hook;
use think\Session;
use think\Validate;

/**
 * 会员中心
 */
class User extends Frontend
{
    protected $layout = 'default';
    protected $noNeedLogin = ['login', 'register', 'third'];
    protected $noNeedRight = ['*'];

    public function _initialize()
    {
        parent::_initialize();
        $auth = $this->auth;

        if (!Config::get('fastadmin.usercenter')) {
            $this->error(__('User center already closed'));
        }

        //监听注册登录退出的事件
        Hook::add('user_login_successed', function ($user) use ($auth) {
            $expire = input('post.keeplogin') ? 30 * 86400 : 0;
            Cookie::set('uid', $user->id, $expire);
            Cookie::set('token', $auth->getToken(), $expire);
        });
        Hook::add('user_register_successed', function ($user) use ($auth) {
            Cookie::set('uid', $user->id);
            Cookie::set('token', $auth->getToken());
        });
        Hook::add('user_delete_successed', function ($user) use ($auth) {
            Cookie::delete('uid');
            Cookie::delete('token');
        });
        Hook::add('user_logout_successed', function ($user) use ($auth) {
            Cookie::delete('uid');
            Cookie::delete('token');
        });
    }

    /**
     * 会员中心
     */
    public function index()
    {
        $this->view->assign('title', __('User center'));
        return $this->view->fetch();
    }

    /**
     * 注册会员
     */
    public function register()
    {
        $url = $this->request->request('url', '', 'trim');
        if ($this->auth->id) {
            $this->success(__('You\'ve logged in, do not login again'), $url ? $url : url('user/index'));
        }
        if ($this->request->isPost()) {
            $username = $this->request->post('username');
            $password = $this->request->post('password');
            $rePassword = $this->request->post('re_password');
            $idcard = $this->request->post('idcard');
            $mobile = $this->request->post('mobile', '');
            if($password != $rePassword){
                $this->error("两次密码不一样，请重新输入!");
            }

            $token = $this->request->post('__token__');
            $rule = [
                'username' => 'require|length:3,30',
                'password' => 'require|length:6,30',
                'idcard' => 'require',
                'mobile' => 'regex:/^1\d{10}$/',
                '__token__' => 'require|token',
            ];

            $msg = [
                'username.require' => 'Username can not be empty',
                'username.length' => 'Username must be 3 to 30 characters',
                'password.require' => 'Password can not be empty',
                'password.length' => 'Password must be 6 to 30 characters',
                'idcard' => "身份证不能为空",
                'mobile' => 'Mobile is incorrect',
            ];
            $data = [
                'username' => $username,
                'password' => $password,
                'idcard' => $idcard,
                'mobile' => $mobile,
                '__token__' => $token,
            ];

            $validate = new Validate($rule, $msg);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()), null, ['token' => $this->request->token()]);
            }
            if ($this->auth->register($username, $password, $idcard, $mobile)) {
                $this->success(__('Sign up successful'), $url ? $url : url('user/login'));
            } else {
                $this->error($this->auth->getError(), null, ['token' => $this->request->token()]);
            }
        }
        //判断来源
        $referer = $this->request->server('HTTP_REFERER');
        if (!$url && (strtolower(parse_url($referer, PHP_URL_HOST)) == strtolower($this->request->host()))
            && !preg_match("/(user\/login|user\/register|user\/logout)/i", $referer)) {
            $url = $referer;
        }
        $this->view->assign('captchaType', config('fastadmin.user_register_captcha'));
        $this->view->assign('url', $url);
        $this->view->assign('title', __('Register'));
        return $this->view->fetch();
    }

    /**
     * 会员登录
     */
    public function login()
    {
        $url = $this->request->request('url', '', 'trim');
        if ($this->auth->id) {
            $this->success(__('You\'ve logged in, do not login again'), $url ? $url : url('user/index'));
        }
        if ($this->request->isPost()) {
            $account = $this->request->post('account');
            $password = $this->request->post('password');
            $keeplogin = (int)$this->request->post('keeplogin');
            $captcha = $this->request->post('captcha');
            $token = $this->request->post('__token__');
            $rule = [
                'account' => 'require|length:3,50',
                'password' => 'require|length:6,30',
                '__token__' => 'require|token',
            ];

            $msg = [
                'account.require' => 'Account can not be empty',
                'account.length' => 'Account must be 3 to 50 characters',
                'password.require' => 'Password can not be empty',
                'password.length' => 'Password must be 6 to 30 characters',
            ];
            $data = [
                'account' => $account,
                'password' => $password,
                '__token__' => $token,
            ];
            //验证码
            $captchaResult = true;
            $captchaType = config("fastadmin.user_register_captcha");
            if ($captchaType) {
                if ($captchaType == 'wechat') {
                    $captchaResult = WechatCaptcha::check($captcha, 'register');
                } elseif ($captchaType == 'text') {
                    $captchaResult = \think\Validate::is($captcha, 'captcha');
                }
            }
            if (!$captchaResult) {
                $this->error(__('Captcha is incorrect'));
            }

            $validate = new Validate($rule, $msg);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()), null, ['token' => $this->request->token()]);
                return false;
            }
            if ($this->auth->login($account, $password)) {
                $this->success(__('Logged in successful'), $url ? $url : url('index/index'));
            } else {
                $this->error($this->auth->getError(), null, ['token' => $this->request->token()]);
            }
        }
        //判断来源
        $referer = $this->request->server('HTTP_REFERER');
        if (!$url && (strtolower(parse_url($referer, PHP_URL_HOST)) == strtolower($this->request->host()))
            && !preg_match("/(user\/login|user\/register|user\/logout)/i", $referer)) {
            $url = $referer;
        }
        $this->view->assign('captchaType', config('fastadmin.user_register_captcha'));
        $this->view->assign('url', $url);
        $this->view->assign('title', __('Login'));
        return $this->view->fetch();
    }

    /**
     * 退出登录
     */
    public function logout()
    {
        //退出本站
        $this->auth->logout();
        $this->success(__('Logout successful'), url('index/index'));
    }

    /**
     * 个人信息
     */
    public function profile()
    {
        $this->view->assign('title', __('Profile'));
        return $this->view->fetch();
    }

    /**
     * 修改密码
     */
    public function changepwd()
    {
        if ($this->request->isPost()) {
            $oldpassword = $this->request->post("oldpassword");
            $newpassword = $this->request->post("newpassword");
            $renewpassword = $this->request->post("renewpassword");
            $token = $this->request->post('__token__');
            $rule = [
                'oldpassword' => 'require|length:6,30',
                'newpassword' => 'require|length:6,30',
                'renewpassword' => 'require|length:6,30|confirm:newpassword',
                '__token__' => 'token',
            ];

            $msg = [
                'renewpassword.confirm' => __('Password and confirm password don\'t match')
            ];
            $data = [
                'oldpassword' => $oldpassword,
                'newpassword' => $newpassword,
                'renewpassword' => $renewpassword,
                '__token__' => $token,
            ];
            $field = [
                'oldpassword' => __('Old password'),
                'newpassword' => __('New password'),
                'renewpassword' => __('Renew password')
            ];
            $validate = new Validate($rule, $msg, $field);
            $result = $validate->check($data);
            if (!$result) {
                $this->error(__($validate->getError()), null, ['token' => $this->request->token()]);
                return false;
            }

            $ret = $this->auth->changepwd($newpassword, $oldpassword);
            if ($ret) {
                $this->success(__('Reset password successful'), url('user/login'));
            } else {
                $this->error($this->auth->getError(), null, ['token' => $this->request->token()]);
            }
        }
        $this->view->assign('title', __('Change password'));
        return $this->view->fetch();
    }

    public function attachment()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax()) {
            $mimetypeQuery = [];
            $where = [];
            $filter = $this->request->request('filter');
            $filterArr = (array)json_decode($filter, true);
            if (isset($filterArr['mimetype']) && preg_match("/[]\,|\*]/", $filterArr['mimetype'])) {
                $this->request->get(['filter' => json_encode(array_diff_key($filterArr, ['mimetype' => '']))]);
                $mimetypeQuery = function ($query) use ($filterArr) {
                    $mimetypeArr = explode(',', $filterArr['mimetype']);
                    foreach ($mimetypeArr as $index => $item) {
                        if (stripos($item, "/*") !== false) {
                            $query->whereOr('mimetype', 'like', str_replace("/*", "/", $item) . '%');
                        } else {
                            $query->whereOr('mimetype', 'like', '%' . $item . '%');
                        }
                    }
                };
            } elseif (isset($filterArr['mimetype'])) {
                $where['mimetype'] = ['like', '%' . $filterArr['mimetype'] . '%'];
            }

            if (isset($filterArr['filename'])) {
                $where['filename'] = ['like', '%' . $filterArr['filename'] . '%'];
            }

            if (isset($filterArr['createtime'])) {
                $timeArr = explode(' - ', $filterArr['createtime']);
                $where['createtime'] = ['between', [strtotime($timeArr[0]), strtotime($timeArr[1])]];
            }

            $model = new Attachment();
            $offset = $this->request->get("offset", 0);
            $limit = $this->request->get("limit", 0);
            $total = $model
                ->where($where)
                ->where($mimetypeQuery)
                ->where('user_id', $this->auth->id)
                ->order("id", "DESC")
                ->count();

            $list = $model
                ->where($where)
                ->where($mimetypeQuery)
                ->where('user_id', $this->auth->id)
                ->order("id", "DESC")
                ->limit($offset, $limit)
                ->select();
            $cdnurl = preg_replace("/\/(\w+)\.php$/i", '', $this->request->root());
            foreach ($list as $k => &$v) {
                $v['fullurl'] = ($v['storage'] == 'local' ? $cdnurl : $this->view->config['upload']['cdnurl']) . $v['url'];
            }
            unset($v);
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        $this->view->assign("mimetypeList", \app\common\model\Attachment::getMimetypeList());
        return $this->view->fetch();
    }

    /**
     * 车票列表
     * @return string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function relationLog()
    {
        $areaModel = new Area();
        $model = new UserRelation();
        $data = $model->where(["user_id"=>$this->auth->id])->with("station,relations")->select();
        foreach ($data as $k =>$datum){
            $in = $areaModel->field("name")->where(["id"=>$datum["relations"]["start_station"]])->find();
            $out = $areaModel->field("name")->where(["id"=>$datum["relations"]["end_station"]])->find();
            $data[$k]["in"] = $in["name"];
            $data[$k]["out"] = $out["name"];
            $data[$k]["date"] = date("Y-m-d",$datum["relations"]["day"]);
            $data[$k]["push"] = date("H:i",$datum["relations"]["start_time"]);
        }
        $this->view->assign("relationlog",$data);
        return $this->view->fetch();
    }

    /**
     * 车票详情
     * @return string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function relationDetail()
    {
        $model = new UserRelation();
        $areaModel = new Area();
        $data = $model->where(["id"=>$_GET["id"]])->with("station,relations,userinfo")->find();
        $in = $areaModel->field("name")->where(["id"=>$data["relations"]["start_station"]])->find();
        $out = $areaModel->field("name")->where(["id"=>$data["relations"]["end_station"]])->find();
        $setValue = "";
        if($data["settype"] == 2){
            $setValue.="硬座-".$data["setnumber"]."号";
        }else{
            $setValue.="硬卧-".$data["setnumber"]."号";
        }
        if($data["status"] ==0){
            $data["statusValue"] = "未使用";
        }else if($data["status"] == 1){
            $data["statusValue"] = "已使用";
        }else if($data["status"] == 2){
            $data["statusValue"] = "已退款";
        }
        $data["in"] = $in["name"];
        $data["out"] = $out["name"];
        $data["setInfo"] = $setValue;
        $this->view->assign("info",$data);
        return $this->view->fetch();
    }

    /**
     * 退票
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function delpiao()
    {
        $model = new UserRelation();
        $data = $model->where(["id"=>$_GET["id"]])->find();
        if($data["status"] !=0){
            $this->error("不可退票！");
        }
        UserRelation::update(["status"=>2],["id"=>$data["id"]]);
        $this->redirect("user/relationLog");
    }
}
