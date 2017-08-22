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
        
    <link rel="stylesheet" href="/Public/Bms/css/style/style.file.min.css" />
    <link rel="stylesheet" href="/Public/Bms/css/style/style.mail.min.css" />

        
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
        <div class="alert alert-block alert-info">
            <a class="close" data-dismiss="alert" href="javascript:void(0)">×</a>
            <p>1、如要发送具有广告嫌疑的短信内容（例：优惠、活动推广等），需联系短信商，开通发送广告信息的通道，并且短信内容需具有一定格式，否则后果严重！<span class="label label-warning">重要</span></p>
            <p>2、发送邮件时，遇到接收者数量过大的情况，可考虑使用批量发送邮件的软件工具，在此发送将需要很长时间！<span class="label label-warning">重要</span></p>
            <p>3、对于批量发送的信息类型（短信、推送），所记录的发送成功的条数可能不准确！</p>
            <p>4、可选择已有信息模板进行发送，选择模板后，将按模板内容发送！</p>
        </div>
        <br>
        <div class="row" style="padding-right: 15px;">
            <div class="span4">
                <div class="mailbox-content">
                    <div class="file-manager">
                        <div class="space-25"></div>
                        <h5>　发信模板　<span class="mailbox-notify">您可以选择已有模板进行发送！模板优先于右侧手写内容</span></h5>
                        <ul class="category-list m-b-md">
                            <?php if(is_array($templates)): $i = 0; $__LIST__ = $templates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$temp): $mod = ($i % 2 );++$i;?><li>
                                    <a href="javascript:void(0)" title="<?php echo (get_config_title($temp['type'],SEND_TEMPLATE_TYPES)); ?>" <?php if(($temp['status']) == "1"): ?>class="choice-temp"<?php endif; ?> data-type="<?php echo ($temp['type']); ?>" data-temp-type="<?php echo (get_send_icon($temp['type'])); ?>" data-temp-unique="<?php echo ($temp['unique_code']); ?>" data-temp-desc="<?php echo ($temp['description']); ?>">
                                    <i class="fa <?php echo (get_send_icon($temp['type'])); ?>"></i>
                                    <span <?php if(($temp['status']) == "1"): ?>class="label label-warning label-warning-hover"<?php else: ?>class="label label-hover"<?php endif; ?>>标识：<?php echo ($temp['unique_code']); ?>　　模板描述：<?php echo ($temp['description']); ?></span>　
                                    </a>
                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul>
                        <br>

                        <!--接收者-->
                        <h5>　消息接收者　<span class="mailbox-notify">你可以筛选出你要发信的接收对象</span></h5>
<?php if(empty($receivers['list'])): ?><div style="margin-left: 15px;margin-top: 20px;">
        <form class="send-search-form form-horizontal" method="" action="">
            <input type="text" name="id" class="text-width-35" autocomplete="off" placeholder="ID">　
            <input type="text" name="account" class="text-width-35" autocomplete="off" placeholder="账号">　
            <!--<br><br><div class="btn-group">
                <button type="button" class="btn checked" data-default="--排序--"></button>
                <button class="btn dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li data-value="" data-title="--取消选择--"><a href="javascript:void(0)">--取消选择--</a></li>
                    <li data-value="id:DESC" data-title="ID降序"><a href="javascript:void(0)">ID降序</a></li>
                </ul>
            </div>
            <input type="hidden" name="sort" value="">-->
            <button class="btn btn-success btn-send-search" type="button">查询</button>
        </form>
    </div><?php endif; ?>
<br><br>
<div id="receivers-scroll-div">
    <ul class="folder-list m-b-md">
        <?php if(is_array($receivers['list'])): $i = 0; $__LIST__ = $receivers['list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rec): $mod = ($i % 2 );++$i;?><li>
                <a href="javascript:void(0)"> <i class="fa fa-user"></i>
                    <input type="checkbox" class="receiver-ids" value="<?php echo ($rec['id']); ?>" checked="true" autocomplete="off" style="display: none">
                    <span class="label label-info">ID：<?php echo ($rec['id']); ?></span>　
                    <span class="label label-info"><i class="fa fa-phone" style="color: #fff"></i><?php echo ((isset($rec['mobile']) && ($rec['mobile'] !== ""))?($rec['mobile']):'---'); ?></span>　
                    <span class="label label-info"><i class="fa fa-envelope-o" style="color: #fff"></i><?php echo ((isset($rec['email']) && ($rec['email'] !== ""))?($rec['email']):'---'); ?></span>
                </a>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </if>
    </ul>
</div>
<!--<script src="/Public/Static/jquery.nicescroll.min.js"></script>
<script type="text/javascript">
    $("#receivers-scroll-div").niceScroll({
        cursorcolor:"#ccc", cursoropacitymax:1, touchbehavior:false, cursorwidth:"10px", cursorborder:"0", cursorborderradius:"5px"
    });
</script>-->
<?php if(empty($receivers['list'])): ?><script type="text/javascript">
        $(document).ready(function() {
            getReceivers();
        });
    </script><?php endif; ?>
                        <!--接收者-->

                        <div class="clear"></div>
                    </div>
                </div>
            </div>
            <div class="span8">

                <!--发送头部-->
                <div class="mail-box-header">
    <div class="pull-right tooltip-demo">
        <?php if(empty($receivers['list'])): ?><div class="btn-group">
                <button type="button" class="btn checked" data-default="--选择接收规则--"></button>
                <button class="btn dropdown-toggle" data-toggle="dropdown">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu select-type">
                    <?php if(is_array($receive_rules)): $i = 0; $__LIST__ = $receive_rules;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rule): $mod = ($i % 2 );++$i;?><li data-value="<?php echo ($key); ?>" data-title="<?php echo ($rule); ?>">
                            <a href="javascript:void(0)"><?php echo ($rule); ?></a>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div><?php endif; ?>
        <input type="hidden" name="receive_rule" value="<?php echo ($_REQUEST['receive_rule']); ?>" autocomplete="off">&nbsp;
        <button class="btn btn-success do-send" type="button" data-ing-html="发送中  <i class='fa fa-spinner fa-spin'></i>">
            <i class="fa fa-mail-reply"></i>
            确认发送</button>&nbsp;
        <button class="btn" type="button" onclick="javascript:history.back(-1);return false;">
            <i class="fa fa-backward"></i>
            返 回</button>　
    </div>
    <h2 class="after-send-notify">
        给用户
    </h2>
    <h2>
        <span class="mailbox-notify">发送进度</span>
        <span class="mailbox-notify text-bar"></span>
        <div class="progress progress-striped active">
            <div style="width:0%;" class="bar"></div>
        </div>
    </h2>
</div>
                <!--发送头部-->

                <!--发送主体-->
                <form class="form-horizontal text-height-27-form" autocomplete="off">
                    <div class="mail-box">
                        <div class="mail-body">
                            <div class="control-group">
                                <div class="send-temp" style="display: none">
                                    <a class="close send-temp-close" href="javascript:void(0)" title="取消使用模板">×</a>
                                    <p>模板类型： <span class="data-temp-type">短信</span></p>
                                    <p>模板标识： <span class="data-temp-unique">register</span></p>
                                    <p>模板描述： <span class="data-temp-desc">注册时出发</span></p>
                                </div>
                            </div>
                            <div class="control-group no-send-temp">
                                <div class="controls" style="margin-left: 50px;">
                                    <div class="btn-group">
                                        <button type="button" class="btn checked" data-default="--发信类型--"></button>
                                        <button class="btn dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu select-type">
                                            <?php if(is_array($types)): $i = 0; $__LIST__ = $types;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$type): $mod = ($i % 2 );++$i;?><li data-value="<?php echo ($key); ?>" data-title="<i class='fa <?php echo (get_send_icon($key)); ?>'></i> <?php echo ($type); ?>">
                                                    <a href="javascript:void(0)"><i class="fa <?php echo (get_send_icon($key)); ?>"></i> <?php echo ($type); ?></a>
                                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                        </ul>
                                    </div>
                                    <input type="hidden" name="type" value="" autocomplete="off">
                                </div>
                            </div>
                            <div class="control-group no-send-temp">
                                <div class="controls" style="margin-left: 50px;">
                                    <input type="text" name="subject" value="" class="text-width-80" placeholder="标题  主要是邮件标题、站内信标题">
                                </div>
                            </div>
                            <div class="control-group no-send-temp">
                                <div class="controls" style="margin-left: 50px;">
                                    <textarea name="content"></textarea>
                                    <?php echo hook('adminArticleEdit', array('is_first'=>1,'name'=>'content','value'=>'','width'=>825));?>
                                </div>
                            </div>
                            <div class="control-group no-send-temp">
                                <div class="controls" style="margin-left: 50px;">
                                    <div class="btn-group">
                                        <button type="button" class="btn checked" data-default="--跳转规则--"></button>
                                        <button class="btn dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <?php if(is_array($target_rules)): $i = 0; $__LIST__ = $target_rules;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rule): $mod = ($i % 2 );++$i;?><li data-value="<?php echo ($key); ?>" data-title="<?php echo ($rule); ?>" <?php if(($key) == $row['target_rule']): ?>class="selected"<?php endif; ?>>
                                                <a href="javascript:void(0)"><?php echo ($rule); ?></a>
                                                </li><?php endforeach; endif; else: echo "" ;endif; ?>
                                        </ul>
                                    </div>
                                    <input type="hidden" name="target_rule" value="<?php echo ($row['target_rule']); ?>">　
                                    <input type="text" name="param" value="<?php echo ($row['param']); ?>" class="text-width-60" placeholder="">
                                    <span class="help-block">
                                        跳转规则，添加APP推送类型的模板时设置！<br>
                                        后接跳转规则对应参数：<br>
                                        　添加我的--无参数、商品详情--商品ID、文章详情--文章ID
                                    </span>
                                </div>
                            </div>
                            <div class="control-group no-send-temp">
                                <div class="controls" style="margin-left: 50px;">
                            <button class="btn btn-primary save-to-temp" type="button" href="#save-to-template" data-toggle="modal" title="存为模板">
                                <i class="fa fa-pencil"></i>
                                存为模板</button>&nbsp;
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </form>
                <!--发送主体-->

                <!--存为模板弹出层-->
                <div id="save-to-template" class="modal hide" style="z-index: 99999999">
                    <div class="modal-header">
                        <button data-dismiss="modal" class="close" type="button">×</button>
                        <h3>保存为模板</h3>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal text-height-27-form">
                            <div class="control-group">
                                <div class="controls" style="margin-left: 50px;">
                                    <input type="text" name="unique_code" value="" class="text-width-90" placeholder="模板标识 英文字母">
                                    <span class="help-block">* 必须为英文字母</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="controls" style="margin-left: 50px;">
                                    <input type="text" name="description" value="" class="text-width-90" placeholder="模板描述">
                                    <span class="help-block">该模板在什么时机使用</span>
                                </div>
                            </div>
                            <div class="" style="padding: 20px 50px;">
                                <button class="btn btn-info sure-save-to-template" type="button">确定保存</button>
                            </div>
                        </form>
                    </div>
                </div>
                <!--存为模板弹出层-->
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
		
    <script type="text/javascript">
        var unique_code = '', type = 0, subject = '', content = '', target_rule = 0, param = '';
        /***********************选择模板**************************/
        $('a.choice-temp').click(function(){
            if(!is_sending) {
                $('.send-temp .data-temp-type').html('<i class="fa ' + $(this).attr('data-temp-type') + '"></i> ' + $(this).attr('title'));
                $('.send-temp .data-temp-unique').html($(this).attr('data-temp-unique'));
                $('.send-temp .data-temp-desc').html($(this).attr('data-temp-desc'));
                unique_code = $(this).attr('data-temp-unique'); type = $(this).attr('data-type');
                $('.send-temp').show();
                $('.no-send-temp').hide();
            }
        });
        $('a.send-temp-close').click(function(){
            if(!is_sending) {
                unique_code = ''; type = 0;
                $('.send-temp').hide();
                $('.no-send-temp').show();
            }
        });
        /***********************选择模板**************************/

        //设置发送参数
        function setQuery() {
            type    = type == 0 ? $("input[name='type']").val() : type;
            subject = subject == '' ? $("input[name='subject']").val() : subject;
            content = content == '' ? $("textarea[name='content']").val() : content;
            target_rule = target_rule == 0 ? $("input[name='target_rule']").val() : target_rule;
            param = param == '' ? $("input[name='param']").val() : param;
        }
        ///重置参数
        function rid() {
            type = 0; subject = ''; content = ''; send_p = 1; count = 0; suc = 0; fail = 0; is_sending = false; target_rule == 0; param == ''
        }
        //创建ajax data参数
        function getQuery() {
            return {type:type,subject:subject,content:content,receive_rule:receive_rule,where:where,model:model,time:time,p:send_p,count:count,success:suc,fail:fail,unique_code:unique_code,target_rule:target_rule,param:param};
        }

        /********************存为模板**************************/
        $('.sure-save-to-template').click(function(){
            var type = $("input[name='type']").val(), subject = $("input[name='subject']").val();
            var content = $("textarea[name='content']").val(), unique_code = $("input[name='unique_code']").val();
            var description = $("input[name='description']").val(), target_rule = $("input[name='target_rule']").val(), param = $("input[name='param']").val();
            var query = {type:type,subject:subject,template:content,unique_code:unique_code,description:description,target_rule:target_rule,param:param,model:'SendTemplate'};
            $.post('<?php echo U("SendTemplate/update");?>', query).success(function(data){
                if (data.status==1) {
                    updateAlert(data.info,'alert-success');
                    setTimeout(function() {$('.top-alert').hide();$('.modal').hide(); $('.modal-backdrop').hide();},1500);
                } else {
                    updateAlert(data.info,'alert-error');
                    setTimeout(function() {$('.top-alert').hide();},1500);
                }
            });
        });
        /*********************存为模板*************************/
    </script>
    <script type="text/javascript">
    var receive_rule = 0, where = '', model = '<?php echo ($_REQUEST["model"]); ?>', time = '<?php echo time();?>', send_p = 1, count = 0, suc = 0, fail = 0, sel_p = 1, is_sending = false;
    $(document).ready(function() {
        /***********************获取接收对象******************************/
        $('.btn-send-search').click(function(){
            sel_p = 1; where = $('.send-search-form').serialize();
            getReceivers('html');
        });

        $("#receivers-scroll-div").scroll(function(){
            if($("#receivers-scroll-div")[0].scrollTop >= ($("#receivers-scroll-div")[0].scrollHeight - $("#receivers-scroll-div").height()))  {
                sel_p++;
                getReceivers('append');
            }
        });
        /***********************获取接收对象******************************/

        /***********************执行发送**********************/
        $('.do-send').click(function() {
            if(!setWhereAndRule()) {
                return;
            }
            $('.bar').css('width', '0%');
            var that = this;
            var data_ing_html = $(that).attr('data-ing-html');
            //禁用按钮
            $('.btn').addClass('disabled').attr('autocomplete','off').prop('disabled',true);
            //按钮文字
            if(data_ing_html != null) {
                $(that).html('<i class="fa fa-mail-reply"></i>&nbsp;'+data_ing_html);
            }
            //设置参数
            setQuery();
            //序列化参数
            var query = getQuery();
            //第一次请求
            $.post('<?php echo U("ToUsers/toUsers");?>', query).success(function(data){
                is_sending = true;
                //成功调用成功后处理方法
                success(data);
            });
            //关闭页面前提示
            window.onbeforeunload = function(){ return "发送中...，请不要关闭页面！"; }
            return false;

            function success(data) {
                if(data.status == 1) {
                    //提示文字
                    $('h2.after-send-notify').html('请勿关闭页面！发送中...');
                    //页号  总数  发送成功条数  发送失败条数
                    send_p = data.p; count = data.count; suc = data.log_num.success; fail = data.log_num.fail;
                    //获取参数
                    query = getQuery();
                    //进度
                    $('.bar').css('width', data.rate + '%'); $('span.text-bar').html(parseInt(data.rate) + '%');
                    //不到百分之百  继续请求 递归
                    if (data.rate != 100) {
                        //间隔0.5秒
                        setTimeout(function () {
                            $.post('<?php echo U("ToUsers/toUsers");?>', query).success(function (data) {
                                success(data);
                            });
                        }, 150);
                    } else {
                        //达到100%  释放页面提示   提示发送完成
                        setTimeout(function () {
                            ridWindow(); ridBtn(that); rid();
                            $('h2.after-send-notify').html(data.info);
                        }, 1000);
                    }
                } else {
                    updateAlert(data.info,'alert-error');
                    setTimeout(function() { $('.top-alert').hide(); },1500);
                    ridWindow(); ridBtn(that); rid();
                }
            }
        });
        /***********************执行发送**********************/
    });
    //选择发送对象
    function check(obj) {
        if($(obj).attr('data-checked') == 0) {
            $(obj).find('input').attr('checked', true);
            $(obj).find('span').addClass('label-info');
            $(obj).attr('data-checked',1);
        } else {
            $(obj).find('input').attr('checked', false);
            $(obj).find('span').removeClass('label-info');
            $(obj).attr('data-checked',0);
        }
    }
    //获取接收对象列表
    function getReceivers(func) {
        var query = {receive_rule:2,where:where,model:model,p:sel_p}
        $.post('<?php echo U("ToUsers/getReceivers");?>', query).success(function(data){
            var html = ''
            for(var i in data.list) {
                data.list[i]['mobile'] = (data.list[i]['mobile'] == '') ? '---' : data.list[i]['mobile'];
                data.list[i]['email']  = (data.list[i]['email'] == '')  ? '---' : data.list[i]['email'];
                html += '<li onclick="check(this)" data-checked="0"> ' +
                '<a href="javascript:void(0)"> <i class="fa fa-user"></i> ' +
                '<input type="checkbox" class="receiver-ids" value="'+data.list[i]['id']+'"  autocomplete="off" style="display: none">'+
                '<span class="label">ID：'+data.list[i]['id']+'</span>　 ' +
                '<span class="label"><i class="fa fa-phone" style="color: #fff"></i>'+data.list[i]['mobile']+'</span>　 ' +
                '<span class="label"><i class="fa fa-envelope-o" style="color: #fff"></i>'+data.list[i]['email']+'</span> ' +
                '</a> ' +
                '</li>';
            }
            if(func == 'html') {
                $('ul.folder-list').html(html);
            } else {
                $('ul.folder-list').append(html);
            }
        });
    }
    //设置 筛选条件 发送规则
    function setWhereAndRule() {
        where = '', receive_rule = $("input[name='receive_rule']").val();
        if(receive_rule == 0 || receive_rule == '') {
            updateAlert('未选择接收规则！','alert-error');
            setTimeout(function() { $('.top-alert').hide(); },1500);
            return false;
        }
        if(receive_rule == '3') {
            $('input.receiver-ids').each(function (key, obj) {
                if ($(obj).is(':checked') == true) {
                    where += obj.value + ',';
                }
            });
            if(where == '') {
                updateAlert('请选择接收对象','alert-error');
                setTimeout(function() { $('.top-alert').hide(); },1500);
                return false;
            }
        } else if(receive_rule == '2') {
            where = $('.send-search-form').serialize();
        }
        return true;
    }
    //重置btn
    function ridBtn(obj) {
        $('.btn').removeClass('disabled').prop('disabled',false);
        $(obj).html('<i class="fa fa-mail-reply"></i>&nbsp;重新发送');
    }
    function ridWindow() {
        window.onbeforeunload = function () { return null; }
    }
</script>

	</body>
</html>