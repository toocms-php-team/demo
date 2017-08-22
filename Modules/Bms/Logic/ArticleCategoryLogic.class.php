<?php
namespace Bms\Logic;

/**
 * Class ArticleCategoryLogic
 * @package Bms\Logic
 * 文章分类 逻辑处理
 */
class ArticleCategoryLogic extends BmsBaseLogic {

    /**
     * @param array $request
     * @return array
     * 获取文章分类列表
     */
    function getList($request = array()) {
        //判断是否存在缓存  缓存在分类 修改或添加后清空
        $result = false;//S('ArticleCategory_Cache');
        if(!$result) {
            //查询的字段
            $param['field'] = 'id,parent_id,name,sort,description,status';
            //获取数据
            $result = D('ArticleCategory')->getList($param);
            //设置缓存
            //S('ArticleCategory_Cache', $result);
        }

        //将数据转换成树状结构  调用分类api 生成操作html
        $tree_data = list_to_tree(api('Category/handleOperate',array($result,'ArticleCategory',$this->_getProhibit(),$this->_getAllow())));

        //获取某分类下的所有子分类
        //$list[] = D('ArticleCategory')->findRow(array('where'=>array('id'=>1)));
        //var_dump(api('Tree/getAllChild',array($tree_data, $list)));
        //获取某分类的所有父分类
        //var_dump(api('Tree/getAllParent',array($result, 45)));

        //分类模板
        $template = "<tr>
                        <td>{id}</td>
                        <td>{top_class}{name}</td>
                        <td class='quick-edit' data-model='ArticleCategory' data-id='{id}' data-field='sort'>{sort}</td>
                        <td>{description}</td>
                        <td>{operate}</td>
                    </tr>";

        //设置初始数据
        api('Tree/init',array($tree_data,$template,array('id','name','sort','description','operate')));
        //生成树状页面
        $html = api('Tree/toFormatTree');

        return array('list'=>$html);
    }

    /**
     * @param string $field_name 隐藏文本框name名称
     * @param string $index_value 默认选中的值
     * @param string $index_field 默认选中字段
     * @return string
     * 获取分类树状下拉菜单
     */
    function getSelect($field_name = '', $index_value = '', $index_field = 'id') {
        //查询的字段
        $param['field'] = 'id,parent_id,name';
        //获取数据
        $result = D('ArticleCategory')->getList($param);
        //返回数据
        return api('Category/getSelect',array($result,$field_name,$index_value,$index_field));
    }

    /**
     * @param array $data
     * @param array $request
     * @return array
     */
    protected function processData($data = array(), $request = array()) {
        //是否可以添加子分类
        if(in_array($request['parent_id'], $this->_getProhibit())) {
            $this->setLogicInfo('该分类禁止添加子分类！'); return false;
        }
        //分类等级
        if(!empty($request['parent_id'])) {
            $level = M('ArticleCategory')->where(array('id'=>$request['parent_id']))->getField('level');
            $data['level'] = $level + 1;
        }
        return $data;
    }

    /**
     * @return array
     * 获取禁止某些操作的ID
     */
    private function _getProhibit() {
        $ids = M('ArticleCategory')->where(array('level'=>array('GT',1)))->field('id')->select();
        return array_column($ids, 'id');
    }

    /**
     * @return array
     * 获取允许的操作
     */
    private function _getAllow() {
        return array('edit','set_status','delete');
    }

    /**
     * @param array $request
     * @return bool
     * 删除分类前操作 验证是否该分类下存在文章
     */
    protected function beforeRemove($request = array()) {
        //判断给分类下是否存在文章
        $where['art_cate_id'] = $request['ids'];
        //存在文章 报错
        if(D('Article')->where($where)->count()) {
            $this->setLogicInfo('该分类下存在文章，请先删除该分类下的全部文章！'); return false;
        }
        return true;
    }

    /**
     * @param int $result
     * @param array $request
     * @return boolean
     * 新增、更新、修改状态、删除后执行
     */
    protected function afterAll($result = 0, $request = array()) {
        S('ArticleCategory_Cache', null);
        return true;
    }

    /**
     * @param array $request
     * @return mixed
     */
    function findRow($request = array()) {
        if(!empty($request['id'])) {
            $param['where']['id'] = $request['id'];
        } else {
            $this->setLogicInfo('参数错误！'); return false;
        }

        $row = D('ArticleCategory')->findRow($param);

        if(!$row) {
            $this->setLogicInfo('未查到此记录！'); return false;
        }
        //获取文件
        $row['icon'] = api('File/getFiles',array($row['icon']));
        return $row;
    }
}