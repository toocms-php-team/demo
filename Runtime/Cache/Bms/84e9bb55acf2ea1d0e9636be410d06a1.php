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
                <!--<ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab1">调整余额</a></li>
                    <li class=""><a data-toggle="tab" href="#tab2">调整积分</a></li>
                </ul>-->
                <br>
                <div class="widget-content tab-content no-padding">
                    <form class="form-horizontal text-height-27-form" method="post" action="<?php echo U(''.$_REQUEST['model'].'/adjust');?>" autocomplete="off">
                        <input type="hidden" name="model" value="<?php echo ($_REQUEST['model']); ?>">
                        <input type="hidden" name="ids" value="<?php echo ($_REQUEST['ids']); ?>">
                        <div class="control-group">
                            <label class="control-label">选择调整资料</label>
                            <div class="controls">
                                <div class="btn-group">
                                    <button type="button" class="btn checked" data-default="--选择调整资料--"></button>
                                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                                        <!--<span class="checked" data-default="--选择分组--"></span>--><span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-field">
                                        <!--<li data-value="balance" data-title="余额(元)" data-field-value="<?php echo ((isset($info['balance']) && ($info['balance'] !== ""))?($info['balance']):0.0); ?>"><a href="javascript:void(0)">余额(元)</a></li>-->
                                        <li data-value="integral" data-title="积分(个)" data-field-value="<?php echo ((isset($info['integral']) && ($info['integral'] !== ""))?($info['integral']):0); ?>"><a href="javascript:void(0)">积分(个)</a></li>
                                    </ul>
                                </div>
                                <input type="hidden" name="field" value="">
                                <span class="help-block">* 选择要调整的用户资料，目前可选（余额、积分）</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">当前额度</label>
                            <div class="controls">
                                <input type="text" name="now_value" value="" class="text-width-10" disabled>
                                <span class="help-block">* 用户余额或者积分的当前额度</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">调整额度</label>
                            <div class="controls">
                                <input type="text" name="adjust_value" value="" class="decimal-only text-width-10">
                                <span class="help-block">* 将要 加+ 或 减- 的额度</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">调整规则</label>
                            <div class="controls">
                                <div class="btn-group">
                                    <button type="button" class="btn checked" data-default="--选择调整规则--"></button>
                                    <button class="btn dropdown-toggle" data-toggle="dropdown">
                                        <!--<span class="checked" data-default="--选择分组--"></span>--><span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-rule">
                                        <li data-value="1" data-title="加 +"><a href="javascript:void(0)">加 +</a></li>
                                        <li data-value="2" data-title="减 -"><a href="javascript:void(0)">减 -</a></li>
                                    </ul>
                                </div>
                                <input type="hidden" name="rule" value="">
                                <span class="help-block">* 选择调整规则，在原有基础上 加+ 或 减-</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">调整后额度</label>
                            <div class="controls">
                                <input type="text" name="after_value" value="" class="text-width-10" disabled>
                                <span class="help-block">调整后应有的额度</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">调整原因</label>
                            <div class="controls">
                                <textarea name="reason" class="text-width-30"></textarea>
                                <span class="help-block">* 说明调整用户该资料的原因，必填</span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">相关订单号</label>
                            <div class="controls">
                                <input type="text" name="order_sn" value="<?php echo ($_REQUEST['order_sn']); ?>" class="text-width-20">
                                <span class="help-block">可选 与该调整有关系的订单号</span>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button class="btn" onclick="javascript:history.back(-1);return false;">返 回</button>　
                            <button class="btn btn-info ajax-post" target-form="form-horizontal" type="submit">保 存</button>
                        </div>
                    </form>
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
        //下拉菜单点击事件
        $('ul.dropdown-menu-field li').bind('click',function(){
            var that = $(this);
            that.parents('div.btn-group').find('button.checked').html(that.attr('data-title'));
            that.parents('div.btn-group').next('input').val(that.attr('data-value'));
            field_callback(this);
        });
        function field_callback(obj) {
            //alert(11);
            $("input[name='now_value']").val($(obj).attr('data-field-value'));
        }
        //下拉菜单点击事件
        $('ul.dropdown-menu-rule li').bind('click',function(){
            var that = $(this);
            that.parents('div.btn-group').find('button.checked').html(that.attr('data-title'));
            that.parents('div.btn-group').next('input').val(that.attr('data-value'));
            rule_callback(this);
        });
        function rule_callback(obj) {
            var now_value = $("input[name='now_value']").val(), adjust_value = $("input[name='adjust_value']").val();
            if(now_value == '') {
                updateAlert('请选择要调整的资料！','alert-error'); hideAlert(); return;
            }if(adjust_value == '') {
                updateAlert('请输入要调整的额度！','alert-error'); hideAlert(); return;
            }
            if($(obj).attr('data-value') == 1) {
                var after_value = parseFloat($("input[name='now_value']").val()) + parseFloat($("input[name='adjust_value']").val());
            } else {
                var after_value = parseFloat($("input[name='now_value']").val()) - parseFloat($("input[name='adjust_value']").val());
            }
            $("input[name='after_value']").val(after_value);
        }
        function hideAlert() {
            setTimeout(function() {
                $('.top-alert').hide();
            },1500);
        }
    </script>

	</body>
</html>