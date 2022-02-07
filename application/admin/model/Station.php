<?php

namespace app\admin\model;

use think\Model;


class Station extends Model
{

    

    

    // 表名
    protected $name = 'station';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    protected $deleteTime = false;

    // 追加属性
    protected $append = [

    ];

    public function fromarea()
    {
        return self::hasOne("area","id","station_start");
    }
    public function toarea()
    {
        return self::hasOne("area","id","station_end");
    }
    

    







}
