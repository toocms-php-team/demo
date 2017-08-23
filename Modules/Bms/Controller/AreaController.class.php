<?php
namespace Bms\Controller;

/**
 * Class ArticleController
 * @package Bms\Controller
 * 文章 控制器
 */
class AreaController extends BmsBaseController {

//     function getIndexRelation() {
//         cookie('__relation_goods_ids__', null);
//         $this->assign('select',D('Article','Logic')->getSelect('art_cate_id',I('request.art_cate_id')));
//     }

//     function getUpdateRelation() {
//         $row = $this->get('row');
//         $this->assign('select',D('Article','Logic')->getSelect('art_cate_id',$row['art_cate_id']));
//         cookie('__relation_goods_ids__', null);
//     }

//     function getAddRelation() {
//         $this->assign('select',D('Article','Logic')->getSelect('art_cate_id',I('get.art_cate_id')));
//     }

//     /**
//      * 移动文章
//      */
//     function move() {
//         //权限验证
//         $this->checkRule(self::$rule);
//         $result = self::$logicObject->move(I('request.'));
//         if($result) {
//             $this->success(self::$logicObject->getLogicInfo());
//         } else {
//             $this->error(self::$logicObject->getLogicInfo());
//         }
//     }

//     /**
//      * 选择关联商品
//      */
//     function choiceGoods() {
//         $ids = cookie('__relation_goods_ids__');
//         //判断是否已存在
//         if(false === strpos($ids, I('request.goods_id')))
//             cookie('__relation_goods_ids__', $ids . I('request.goods_id') . ',', array('expire'=>1800));
//         $this->success('操作成功！');
//     }

//     /**
//      * 取消选择关联商品
//      */
//     function cancelGoods() {
//         $ids = cookie('__relation_goods_ids__');
//         cookie('__relation_goods_ids__', str_replace(I('request.goods_id') . ',', '', $ids), array('expire'=>1800));
//         $this->success('操作成功！');
//     }

//     function saveRG() {
//         if(!isset($_REQUEST['relation_goods']))
//             $data['relation_goods'] = substr(cookie('__relation_goods_ids__'), 0, -1);
//         else
//             $data['relation_goods'] = I('request.relation_goods');
//         if(false === M('Article')->where(array('id'=>I('request.art_id')))->data($data)->save())
//             $this->error('保存失败！');

//         cookie('__relation_goods_ids__', null);
//         $this->success('操作成功！', cookie('__forward__'));
//     }
// }

    function index(){
       $row = D('area')->where('id=1')->find();

       $allimg['1']['id']= $row['img1'];
       $allimg['2']['id']= $row['img2'];
       $allimg['3']['id']= $row['img3'];
      

     //获取图片路径
       for ($i=1; $i <4 ; $i++) { 
           $img[$i]=D('file')->where($allimg[$i])->field('path')->find();
       }
           
      
        // print_r($img);
        $this->assign('row', $row);
        $this->assign('img', $img);
        $this->display('index');
    }

//更新模板
    public function add(){
        // print_r($_POST);
        $data=array();
      
        $data['cate_id']=$_POST['buju'];
        $data['img1'] = $_POST['cover1'];
        $data['img2'] = $_POST['cover2'];
        $data['img3'] = $_POST['cover3'];
        $data['url1']=$_POST['url1'];
        $data['url2']=$_POST['url2'];
        $data['url3']=$_POST['url3'];
        $data['time']=time();
        $result = D('area')->where('id=1')->data($data)->save();
        $this->success('修改成功','./index');
    }

    public function update(){
        $row = D('area')->where('id=1')->find();
        $this->assign('row', $row);
        $this->display('update');
    }

}