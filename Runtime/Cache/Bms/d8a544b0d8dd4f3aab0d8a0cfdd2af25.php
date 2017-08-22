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
                <!--<div class="widget-title">
                    <span class="icon">
                        <i class="fa fa-plus"></i>
                    </span>
                    <h5>更新行为信息</h5>
                </div>-->
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab1">基本信息</a></li>
                    <li class=""><a data-toggle="tab" href="#tab2">图文详情</a></li>
                    <li class=""><a data-toggle="tab" href="#tab3">属性信息</a></li>
                </ul>

                <br>
                <form class="form-horizontal text-height-27-form" method="post" action="<?php echo U('Goods/update');?>">
                    <div class="widget-content tab-content no-padding">
                        <div id="tab1" class="tab-pane active">
                            <input type="hidden" name="model" value="Goods">
                            <input type="hidden" name="id" value="<?php echo ($row['id']); ?>">
                            <div class="control-group">
                                <label class="control-label">商品名称</label>
                                <div class="controls">
                                    <input type="text" name="goods_name" value="<?php echo ($row['goods_name']); ?>" class="text-width-30" maxlength="30">
                                    <span class="help-block">* 商品名称必须</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">商品货号</label>
                                <div class="controls">
                                    <input type="text" name="goods_sn" value="<?php echo ($row['goods_sn']); ?>" class="text-width-20" maxlength="12">
                                    <span class="help-block">* 商品货号必须，12个字母或数字以内</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">商品分类</label>
                                <div class="controls">
                                    <?php echo ($select); ?>
                                    <span class="help-block">* 选择商品所属的分类</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">售价</label>
                                <div class="controls">
                                    <span class="input-append">
                                        <input type="text" name="price" value="<?php echo ($row['price']); ?>" class="decimal-only text-width-40">
                                        <div class="add-on">元</div>
                                    </span>
                                    <span class="help-block">* 商品的基础销售价格， 如果商品存在属性价格则 最终的售价为：基础销售价格+属性价格</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">库存</label>
                                <div class="controls">
                                    <input type="text" name="stock" value="<?php echo ($row['stock']); ?>" class="text-width-10">
                                    <span class="help-block">* 商品的剩余库存，设为-1则不限库存，如果商品有多个单选属性，则要设置货品属性库存</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">关键字</label>
                                <div class="controls">
                                    <input type="text" name="keywords" value="<?php echo ($row['keywords']); ?>" class="text-width-20" maxlength="12">
                                    <span class="help-block">商品关键字，增加搜索准确性，12字符以内</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">封面图片</label>
                                <div class="controls">
                                    <?php echo hook('upload',array('is_first'=>1,'unique_sign'=>'cover','field_name'=>'cover','field_value'=>$row['cover'],'save_path'=>'Goods'));?>
                                    <span class="help-block">* 商品封面图，在列表中显示</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">相册</label>
                                <div class="controls">
                                    <?php echo hook('upload',array('queue_limit'=>'5','unique_sign'=>'pictures','field_name'=>'pictures','field_value'=>$row['pictures'],'save_path'=>'Goods'));?>
                                    <span class="help-block">商品相册，在详情中轮播显示</span>
                                </div>
                            </div>
                            <!--<div class="control-group">
                                <label class="control-label">是否上架</label>
                                <div class="controls">
                                    <label style="margin-right:20px;display:inline">
                                        <div class="radio"><span><input name="is_on_sale" style="opacity: 0;" type="radio" value="1" <?php if(!isset($row['is_on_sale']) or $row['is_on_sale'] == 1): ?>checked<?php endif; ?>></span></div> 是
                                    </label>
                                    <label style="margin-right:20px;display:inline">
                                        <div class="radio"><span><input name="is_on_sale" style="opacity: 0;" type="radio" value="0" <?php if(isset($row['is_on_sale']) and $row['is_on_sale'] == 0): ?>checked<?php endif; ?>></span></div> 否
                                    </label>
                                    <span class="help-block">是否上架该商品</span>
                                </div>
                            </div>-->
                            <div class="control-group">
                                <label class="control-label">是否可用积分抵扣</label>
                                <div class="controls">
                                    <label style="margin-right:20px;display:inline">
                                        <div class="radio"><span><input name="is_integral" style="opacity: 0;" type="radio" value="1" <?php if($row['is_integral'] == 1): ?>checked<?php endif; ?>></span></div> 是
                                    </label>
                                    <label style="margin-right:20px;display:inline">
                                        <div class="radio"><span><input name="is_integral" style="opacity: 0;" type="radio" value="0" <?php if(empty($row['is_integral'])): ?>checked<?php endif; ?>></span></div> 否
                                    </label>
                                    <span class="help-block">是否可用积分抵扣商品价格，有抵扣比例</span>
                                </div>
                            </div>
                            <!--<div class="control-group">
                                <label class="control-label">是否推荐到首页</label>
                                <div class="controls">
                                    <label style="margin-right:20px;display:inline">
                                        <div class="radio"><span><input name="is_best" style="opacity: 0;" type="radio" value="1" <?php if($row['is_best'] == 1): ?>checked<?php endif; ?>></span></div> 是
                                    </label>
                                    <label style="margin-right:20px;display:inline">
                                        <div class="radio"><span><input name="is_best" style="opacity: 0;" type="radio" value="0" <?php if(empty($row['is_best'])): ?>checked<?php endif; ?>></span></div> 否
                                    </label>
                                    <span class="help-block">设置为是 则出现在首页</span>
                                </div>
                            </div>-->
                            <div class="control-group">
                                <label class="control-label">排序</label>
                                <div class="controls">
                                    <input type="text" name="sort" value="<?php echo ($row['sort']); ?>" class="text-width-20" maxlength="15">
                                    <span class="help-block">自定义商品排序，数值越大越靠前</span>
                                </div>
                            </div>

                        </div>

                        <div id="tab2" class="tab-pane">
                            <textarea name="goods_desc"><?php echo ($row['goods_desc']); ?></textarea>
                            <?php echo hook('adminArticleEdit', array('is_first'=>1,'name'=>'goods_desc','value'=>$row['goods_desc'],'width'=>1010,'height'=>1000));?>
                        </div>

                        <div id="tab3" class="tab-pane">
                            <div class="control-group">
                                <label class="control-label">商品类型：</label>
                                <div class="controls">
                                    <select name="type_id" class="type-select select-height-35" data-id="<?php echo ((isset($row['id']) && ($row['id'] !== ""))?($row['id']):0); ?>">
                                        <option value="0">--请选择商品类型--</option>
                                        <?php if(is_array($type_list)): $i = 0; $__LIST__ = $type_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$type): $mod = ($i % 2 );++$i;?><option value="<?php echo ($type['type_id']); ?>" <?php if(($row['type_id']) == $type['type_id']): ?>selected<?php endif; ?>><?php echo ($type['type_name']); ?></option><?php endforeach; endif; else: echo "" ;endif; ?>
                                    </select>
                                    <span class="help-block">请选择商品的所属类型，进而完善此商品的属性</span>
                                </div>
                            </div>
                            <div id="attr-form">
                                <?php echo ($goods_attr_form); ?>
                            </div>
                        </div>

                        <div class="form-actions">
                            <button class="btn" onclick="javascript:history.back(-1);return false;">返 回</button>　
                            <button class="btn btn-info ajax-post" target-form="form-horizontal" type="submit">保 存</button>
                        </div>
                    </div>
                </form>
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
        $(function(){
            //获取属性
            $(".type-select").change(function(){
                var goods_id = $(this).attr('data-id'), type_id = $(this).val();
                if(type_id == 0) {
                    $('#attr-form').html('');
                } else {
                    $.ajax({
                        url:'<?php echo U("Goods/ajaxAttrForm");?>', type:'POST', dataType:'json', data:{goods_id:goods_id,type_id:type_id},
                        success:function(data){
                            $('#attr-form').html(data.form);
                        }
                    });
                }
            });
        });
        //增加一个节点
        function addSpec(obj) {
            var html = '<div class="control-group">' +
                        '<label class="control-label">' + $(obj).parent().parent().find('label').html() + '</label>' +
                        '<div class="controls">' + $(obj).parent().html().replace(/(.*)(addSpec)(.*)(\[)(\+)/i, "$1removeSpec$3$4-") + '</div>' +
                       '</div>';
            $(obj).parent().parent().next('.add-area').append(html);
        }
        //删除一个节点
        function removeSpec(obj) {
            $(obj).parent().parent().remove();
        }
    </script>

	</body>
</html>