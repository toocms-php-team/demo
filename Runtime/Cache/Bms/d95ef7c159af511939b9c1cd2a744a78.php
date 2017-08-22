<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
	<head>
		<title><?php echo ($content_header); ?>--晟轩科技--后台管理系统</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!--基本-->
		<!--<link rel="stylesheet" href="/Public/Bms/css/bootstrap.1.0.min.css" />-->
        <link rel="stylesheet" href="/Public/Bms/css/bootstrap.2.3.2.min.css" />
        <link rel="stylesheet" href="/Public/Bms/css/font-awesome-4.4.0/font-awesome.min.css" />
        <link rel="stylesheet" href="/Public/Bms/css/unicorn.main.min.css" />
        <link rel="stylesheet" href="/Public/Bms/css/unicorn.<?php echo C('BACK_STYLE');?>.min.css" class="skin-color" />
        <!--基本-->
        <!--表单表格-->
        <link rel="stylesheet" href="/Public/Bms/css/uniform.min.css" />
        <!--表单表格-->
        <!--扩展样式-->
        <link rel="stylesheet" href="/Public/Bms/css/custom.css" />
        <!--扩展样式-->
        <!--弹出提示框-->
        <link rel="stylesheet" href="/Public/Bms/css/jquery.gritter.min.css" />
        <!--弹出提示框-->
        <!--jquery-->
        <script src="/Public/Static/jquery.min.js"></script>
        <!--jquery-->
        
        
	</head>
	<body>

        <!--logo-->
		<div id="header">
			<h1><a href="./dashboard.html"></a></h1>
		</div>

        <!--右侧 管理员 退出-->
		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse">
                    <a title="" href="javascript:void(0)">
                        <i class="fa fa-user font-size-13"></i> <span class="text"><?php echo session('admin.account');?></span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="<?php echo U('Administrator/rePass');?>">
                        <i class="fa fa-lock font-size-13"></i> <span class="text">修改密码</span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="<?php echo U('System/clearCache');?>" class="ajax-get no-refresh">
                        <i class="fa fa-trash font-size-13"></i> <span class="text">清除缓存</span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="#help" data-toggle="modal">
                        <i class="fa fa-question font-size-13"></i> <span class="text">帮助</span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="<?php echo U('Login/logOut');?>">
                        <i class="fa fa-power-off font-size-13"></i> <span class="text">退出</span>
                    </a>
                </li>
            </ul>
        </div>
        <div id="help" class="modal hide" style="z-index: 99999999">
    <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button">×</button>
        <h3>帮助信息</h3>
    </div>
    <div class="modal-body">
        <p>一、双击文本框可清空内容！</p>
        <p>二、列表中头部标题存在“<i class="fa fa-pencil"></i>”的列可双击修改！</p>
        <p>三、带有“*”的表单为必填信息</p>
        <p>四、文档信息管理中“注册协议”、“车位出租协议”、“关于我们”三个文档请勿删除</p>
        <p>五、图标展示地址：<a href="http://9iphp.com/fa-icons" target="_blank">http://9iphp.com/fa-icons</a></p>
        <p>六、图片拖动可以排序，排序后不要忘记保存哦！</p>
        <p>七、“系统配置”中的内容不可更改，否则会影响整个网站的访问！</p>
    </div>
</div>
        <!--菜单 start-->
		<div id="sidebar">
			<ul>
                <?php if(is_array($menus)): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php if(!empty($menu['_child'])): ?>submenu<?php endif; ?> <?php echo ($menu['group']['class']); ?>">
                    <!--菜单组-->
                        <a <?php if(empty($menu['_child'])): ?>href="<?php echo (U($menu['group']['url'])); ?>"<?php endif; ?>>
                            <i class="fa <?php echo ($menu['group']['icon']); ?>"></i>
                            <span><?php echo ($menu['group']['title']); ?></span>
                            <?php if(count($menu['_child']) > 0): ?><span class="label"><?php echo count($menu['_child']);?></span><?php endif; ?>
                        </a>
                    <!--菜单组-->
                    <!--子菜单-->
                        <?php if(!empty($menu['_child'])): ?><ul <?php if(($menu['group']['class']) == "active"): ?>style="display: block"<?php endif; ?>>
                            <?php if(is_array($menu['_child'])): $i = 0; $__LIST__ = $menu['_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$child): $mod = ($i % 2 );++$i;?><li class="<?php echo ($child['class']); ?>"><a href="<?php echo (U($child['url'])); ?>"><?php echo ($child['title']); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!--子菜单-->
                    </li>
                    </notempty><?php endforeach; endif; else: echo "" ;endif; ?>
			</ul>
		</div>
        <!--菜单 end-->

        <div id="style-switcher">
            <i class="fa fa-arrow-left" style="color:#fff;height:25px;vertical-align:middle"></i>
            <span>Style:</span>
            <a href="<?php echo U('Config/quickEdit',array('model'=>'Config','ids'=>54,'field'=>'value','value'=>'grey'));?>" style="background-color: #555555;" class="ajax-get"></a>
            <a href="<?php echo U('Config/quickEdit',array('model'=>'Config','ids'=>54,'field'=>'value','value'=>'blue'));?>" style="background-color: #2D2F57;" class="ajax-get"></a>
            <a href="<?php echo U('Config/quickEdit',array('model'=>'Config','ids'=>54,'field'=>'value','value'=>'red'));?>" style="background-color: #673232;" class="ajax-get"></a>
        </div>

        <!--主体内容-->
		<div id="content">
            <div id="content-header">
                <h1><?php echo ($content_header); ?></h1>
                <div class="btn-group">
                    <!--<a href="<?php echo U('Withdraw/index',array('status'=>0));?>" class="btn btn-large tip-bottom refresh no-handle-withdraw" title="未处理提现">
                        <i class="fa fa-credit-card"></i>
                    </a>
                    <a class="btn btn-large tip-bottom refresh no-read-message" title="消息">
                        <i class="fa fa-envelope-square"></i>
                    </a>-->
                    <a class="btn btn-large tip-bottom refresh" title="刷新"><i class="fa fa-refresh"></i></a>
                </div>
            </div>

            <!--导航-->
            <div id="breadcrumb">
                <a href="<?php echo U('Index/index');?>" title="" class=""><i class="fa fa-home font-size-14"></i> 首页</a>
                <a href="javascript:void(0)" class=""><?php echo ($content_header); ?></a>
                <a href="javascript:void(0)" class=""><?php echo ($breadcrumb_nav); ?></a>
            </div>

            <div class="alert top-alert" style="display:none;position:fixed;z-index:10000000;width:100%;padding: 11px 35px 11px 14px;top:112px;border-radius: 0px;">
	<button class="close" data-dismiss="alert"></button>
	<strong></strong>
</div>
<!--<div class="alert alert-success" style="display: none">
	<button class="close" data-dismiss="alert">×</button>
	<strong>Success!</strong>
</div>
<div class="alert alert-info" style="display: none">
	<button class="close" data-dismiss="alert">×</button>
	<strong>Info!</strong>
</div>
<div class="alert alert-error" style="display: none">
	<button class="close" data-dismiss="alert">×</button>
	<strong>Error!</strong>
</div>-->

            <div class="container-fluid">

                
    <div class="row-fluid main-row-fluid">

        <div class="span12">
            <div class="widget-box">

                <div class="widget-title widget-title-search list-widget-title">
                    <ul class="quick-actions-horizontal">
                        <li>
                            <a href="javascript:void(0)">
                                <!--<i class="icon-tag"></i>-->
                                <span><?php echo ($goods['goods_sn']); ?>：<?php echo ($goods['goods_name']); ?></span>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="widget-content no-padding no-border">
                    <form action="<?php echo U('Products/update');?>" class="form-horizontal" method="post" id="form">
                        <input type="hidden" name="goods_id" value="<?php echo ($goods['goods_id']); ?>">
                        <table class="table table-bordered table-striped reset-checkbox" id="product-table">
                            <thead>
                            <tr>
                                <?php if(is_array($goods_attr_list)): $i = 0; $__LIST__ = $goods_attr_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods_attr): $mod = ($i % 2 );++$i;?><th><?php echo ($goods_attr['attr_name']); ?> *</th><?php endforeach; endif; else: echo "" ;endif; ?>
                                <th><i class="fa fa-pencil"></i>货品号</th>
                                <th><i class="fa fa-pencil"></i>库存</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody class="tbody">
                            <!--<?php if(empty($list)): ?><tr><td colspan="30">Aho！没有查询结果！！</td></tr><?php endif; ?>-->
                            <?php if(is_array($products)): $i = 0; $__LIST__ = $products;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pro): $mod = ($i % 2 );++$i;?><tr>
                                    <?php if(is_array($pro['goods_attr'])): $i = 0; $__LIST__ = $pro['goods_attr'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$attr_value): $mod = ($i % 2 );++$i;?><td><?php echo ($attr_value); ?></td><?php endforeach; endif; else: echo "" ;endif; ?>
                                    <td class="quick-edit" data-model="Products" data-id="<?php echo ($pro['id']); ?>" data-field="product_sn"><?php echo ($pro['product_sn']); ?></td>
                                    <td class="quick-edit" data-model="Products" data-id="<?php echo ($pro['id']); ?>" data-field="product_stock"><?php echo ($pro['product_stock']); ?></td>
                                    <td>
                                        <a href="<?php echo U('Products/delete',array('model'=>'Products','ids'=>$pro['id']));?>" title="删除" class="tip-bottom confirm ajax-get">
                                            <span class="label label-important label-important-hover">删除</span></a>
                                    </td>
                                </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                            <tr id="product-row">
                                <?php if(is_array($goods_attr_list)): $i = 0; $__LIST__ = $goods_attr_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods_attr): $mod = ($i % 2 );++$i;?><td>
                                    <select name="attr[<?php echo ($goods_attr["attr_id"]); ?>][]" style="margin-bottom: 0px;">
                                        <option value="" selected>--请选择--</option>
                                        <?php if(is_array($goods_attr['attr_values'])): $i = 0; $__LIST__ = $goods_attr['attr_values'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$value): $mod = ($i % 2 );++$i;?><option value="<?php echo ($value); ?>"><?php echo ($value); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                </td><?php endforeach; endif; else: echo "" ;endif; ?>
                                <td><input type="text" name="product_sn[]" style="margin-bottom: 0px;"></td>
                                <td><input type="text" name="product_stock[]" style="margin-bottom: 0px;"></td>
                                <td>
                                    <a href="javascript:void(0)" title="添加" class="" onclick="add_product_row();">
                                        <span class="label label-success label-label-success">添加</span></a>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="form-actions">
                            <button class="btn" onclick="javascript:history.back(-1);return false;">返 回</button>　
                            <button class="btn btn-info ajax-post no-refresh" type="submit" id="submit" target-form="form-horizontal">确认添加</button>
                        </div>
                    </form>
                </div>

                <div class="pagination alternate">

                </div>

            </div>
        </div>
    </div>


                <div class="row-fluid">
                    <div id="footer" class="span12">
                        Copyright TooCMS © 2015 <a href="http://www.toocms.com" target="_blank">晟轩网络科技有限公司</a>
                    </div>
                </div>
            </div>
		</div>

        <!--基本-->
        <script src="/Public/Bms/js/bootstrap.min.js"></script>
        <script src="/Public/Bms/js/unicorn.min.js"></script>
        <!--基本-->
        <!--表单加载-->
        <script src="/Public/Bms/js/jquery.uniform.min.js"></script>
        <!--表单加载-->
        <script src="/Public/Bms/js/common.js"></script>
        <script src="/Public/Bms/js/js.js"></script>
        <!--弹出提示框-->
        <script src="/Public/Bms/js/jquery.gritter.min.js"></script>
        <script src="/Public/Bms/js/jquery.peity.min.js"></script>
        <!--弹出提示框-->
        <script>
//            $.gritter.add({
//                image: 'fa fa-info-circle', sticky: false, title: '温馨提醒',time: 5000, speed: 500, position: 'top-right', class_name: 'gritter-success',
//                text: '您有未处理用户提现：'+data.no_handle_withdraw+''
//            });
//            $(document).ready(function(){
//                getTip();
//            });
            setInterval(function(){
                getTip();
            },30000);
            function getTip() {
                $.get('<?php echo U("System/tip");?>').success(function(data){
//                    if(data.no_handle_withdraw != 0) {
//                        $('a.no-handle-withdraw').append('<span class="label label-important no-read-message">'+data.no_handle_withdraw+'</span>');
//                    }
                    if(data.data.not_delivery_order != 0) {
                        $.gritter.add({
                            image: 'fa fa-info-circle', sticky: false, title: '温馨提醒',time: 5000, speed: 500, position: 'top-right', class_name: 'gritter-success',
                            text: '您有未发货的订单：'+data.data.not_delivery_order+'单'
                        });
                    }
                });
            }
        </script>
		
    <script>
        var tr_id = 100, tableObj = document.getElementById('product-table');
        $(function() {});

        //追加货品添加表格
        function add_product_row() {
            tr_id++;
            var attr_row, attr_col, new_row, new_col;
            //此行号为输入框所在行
            var index = tableObj.rows.length - 1;
            //获取数据行
            attr_row = document.getElementById('product-row');
            attr_col = attr_row.getElementsByTagName('td');
            //创建新行
            new_row = tableObj.insertRow(index);//新增行
            new_row.setAttribute("id", ''+tr_id+'');
            //创建新行的列
            for (var i = 0; i < attr_col.length; i++) {
                new_col = new_row.insertCell(-1);
                if (i + 1 == attr_col.length) {
                    new_col.innerHTML = '<a href="javascript:void(0)" title="删除" class="" onclick="minus_product_row(\'' + tr_id + '\');"> ' +
                    '<span class="label label-important label-important-hover">删除</span></a>'
                } else {
                    new_col.innerHTML = attr_col[i].innerHTML;
                }
            }
        }
        //删除追加的货品列表
        function minus_product_row(tr_id){
            if (tr_id.length > 0) {
                if (confirm("确定要删除该行吗？") == false) {
                    return false;
                }
                for (var i = 0; i < tableObj.rows.length; i++) {
                    if (tableObj.rows[i].id == tr_id) {
                        tableObj.deleteRow(i);
                    }
                }
            }
        }
    </script>

	</body>
</html>