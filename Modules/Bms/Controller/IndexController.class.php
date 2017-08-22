<?php
namespace Bms\Controller;

/**
 * Class IndexController
 * @package Bms\Controller
 * 首页控制器
 */
class IndexController extends BmsBaseController {

    /**
     * 首页
     */
    public function index() {

//        $total_1 = M('Member')->where('')->count();
//        $total_2 = M('Reservation')->where('')->count();
//        $total_3 = M('Goods')->where('')->count();
//        $total_4 = M('OrderInfo')->where('')->count();
//        $total_5 = M('Post')->where('')->count();
//        $total_6 = M('Article')->where('')->count();
//
//        $this->assign('total_1', $total_1);
//        $this->assign('total_2', $total_2);
//        $this->assign('total_3', $total_3);
//        $this->assign('total_4', $total_4);
//        $this->assign('total_5', $total_5);
//        $this->assign('total_6', $total_6);


        //相关数量线状统计
        //$this->assign('day_quantity_line',D('Statistics','Logic')->usersQuantityLine(array(), array('unit'=>'d','start_date'=>date('Y-m-d',strtotime('-10 Day')),'end_date'=>date('Y-m-d'))));
        //总数统计
        //$this->assign('total_stat', D('Statistics','Logic')->totalStat());
        $this->display('index');
    }
}