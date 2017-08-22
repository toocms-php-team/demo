<?php
/**
 * 菜单配置列表
 * group  父菜单 title标题名称  icon改组图标 class是否选中 默认为空 url链接地址 check_level验证级别 1控制器+方法
 * child 子菜单 同上
 */
return array(
    'MENUS' => array(
        array(
            'group' => array('title' => '主页', 'icon' => 'fa-home', 'url' => 'Index/index'),
        ),
        array(
            'group' => array('title'=>'文章管理','icon'=>'fa-book'),
            '_child' => array(
                array('title'=>'文章列表','url'=>'Article/index'),
                array('title'=>'文章分类','url'=>'ArticleCategory/index')
            )
        ),
        array(
            'group' => array('title'=>'系统设置','icon'=>'fa-cogs'),
            '_child' => array(
                array('title'=>'网站设置','url'=>'ConfigSet/index/config_group/1'),
                array('title'=>'配置管理','url'=>'Config/index'),
            )
        ),
        array(
            'group' => array('title'=>'管理员操作','icon'=>'fa-group'),
            '_child' => array(
                array('title'=>'管理员信息','url'=>'Administrator/index'),
            )
        ),
    ),

    /*菜单映射设置 CURRENT设置当前控制器或者控制器+方法  MAPPING为映射的控制器  键值需一致  及可使访问当前控制器使映射控制器菜单高亮*/
    'CURRENT'   => array(),
    'MAPPING'   => array()
);