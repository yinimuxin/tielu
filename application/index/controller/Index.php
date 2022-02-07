<?php

namespace app\index\controller;

use app\admin\model\Area;
use app\admin\model\AreaLong;
use app\admin\model\Station;
use app\admin\model\StationRelation;
use app\admin\model\UserRelation;
use app\common\controller\Frontend;

class Index extends Frontend
{

    protected $noNeedLogin = ['index'];
    protected $noNeedRight = '*';
    protected $layout = '';

    public function index()
    {

        $from = 0;
        $to = 0;
        $day = date("Y-m-d", time());
        $newArea = [];
        if ($this->request->isPost()) {
            $parames = $_POST;
            $relationModel = new StationRelation();
            $getAreaList = $relationModel->where(["start_station" => $parames["from"], "end_station" => $parames["to"], "day" => strtotime($parames["day"])])->with("stationinfo,toarea,fromarea")->select();
            $longModel = new AreaLong();
            $long = $longModel->where(["form" => $parames["from"], "to" => $parames["to"]])->find();
            $money = $long["area_long"] * 7;
            foreach ($getAreaList as $k => $value) {
                $newArea[] = [
                    "id" => $value["id"],
                    "checi" => $value["stationinfo"]["name"],
                    "from" => $value["fromarea"]["name"],
                    "to" => $value["toarea"]["name"],
                    "start" => date("Y-m-d H:i:s", $value["start_time"]),
                    "end" => date("Y-m-d H:i:s", $value["end_time"]),
                    "site" => $value["stationinfo"]["ying_remain"],
                    "no_site" => $value["stationinfo"]["ruan_remain"],
                    "money" => $money
                ];
            }
            $from = $parames["from"];
            $to = $parames["to"];
            $day = date("Y-m-d", strtotime($parames["day"]));

        }
        $areaModel = new Area();
        $areaArray = $areaModel->field("id,name")->select();
        $areaList = [];
        foreach ($areaArray as $k => $area) {
            $areaList[$area["id"]] = $area["name"];
        }
        $this->assign("newArea", $newArea);
        $this->assign("areaList", $areaList);
        $this->assign("from", $from);
        $this->assign("to", $to);
        $this->assign("day", $day);
        return $this->view->fetch();
    }

    /**
     * 购票详情
     * @return string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function detail()
    {

        $model = new StationRelation();
        $stationInfo = $model->where(["id" => $_GET["id"]])->with("stationinfo,toarea,fromarea")->find();
        $userModel = new \app\admin\model\User();
        $user = $userModel->where(["id" => $this->auth->id])->find();

        $longModel = new AreaLong();
        $long = $longModel->where(["form" => $stationInfo["start_station"], "to" => $stationInfo["end_station"]])->find();

        if ($_GET["type"] ==2) {
            $setnumber = $stationInfo["stationinfo"]["ying_number"] - $stationInfo["stationinfo"]["ying_remain"] + 1;
            $setnumber2 = $setnumber;
            $setnumber = "硬座-" . $setnumber . "号";
            $type = 2;
            $stationInfo["money"] = $long["area_long"] * 7;
        } else {
            $setnumber = $stationInfo["stationinfo"]["ruan_number"] - $stationInfo["stationinfo"]["ruan_remain"] + 1;
            $setnumber2 = $setnumber;
            $setnumber = "硬卧-" . $setnumber . "号";
            $stationInfo["money"] = $long["area_long"] * 14;
            $type = 1;
        }
        $stationInfo["setnumber"] = $setnumber;
        $stationInfo["setnumber2"] = $setnumber2;
        $stationInfo["settype"] = $type;
        $this->assign("user", $user);
        $this->assign("info", $stationInfo);
        return $this->view->fetch();
    }

    public function add_person()
    {
        $relationId = $_POST["relation_id"];
        $stationId = $_POST["station_id"];
        $personId = $this->auth->id;
        $settype = $_POST["settype"];
        $setnumber = $_POST["setnumber"];
        $money = $_POST["money"];
        $data = [
            "relation_id"=>$relationId,
            "station_id"=>$stationId,
            "settype"=>$settype,
            "setnumber"=>$setnumber,
            "money"=>$money,
            "user_id"=>$personId,
            "create_time"=>time(),
            "status"=>0,
        ];
        $model = new UserRelation();
        $stationModel = new Station();
        if($settype ==2){
            $stationModel->where(["id"=>$stationId])->setDec("ying_remain",1);
        }
        if($settype ==1){
            $stationModel->where(["id"=>$stationId])->setDec("ruan_remain",1);
        }
        $model->save($data);
        $this->redirect("user/relationLog");
    }

}
