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
                                <i class="icon-tag"></i>
                                <span>用户既得总数：<?php echo ((isset($result['get_total']) && ($result['get_total'] !== ""))?($result['get_total']):0); ?></span>
                                <span>用户消费总数：<?php echo ((isset($result['spend_total']) && ($result['spend_total'] !== ""))?($result['spend_total']):0); ?></span>
                                <span>用户剩余总数：<?php echo ($result['get_total']-$result['spend_total']); ?></span>
                            </a>
                        </li>
                    </ul>
                    <form action="<?php echo U('IntegralLog/index');?>" method="post" class="form">
                        <!--<span class="date-group date">
                            <input type="text" name="start_time" class="form-control date-group-addon" value="<?php echo ($_REQUEST['start_time']); ?>" placeholder="注册时间" readonly>
                        </span>-->
                        <input type="text" name="account" value="<?php echo ($_REQUEST['account']); ?>" placeholder="会员账号">　
                        <div class="btn-group">
                            <button type="button" class="btn checked" data-default="--积分动向--"></button>
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                <!--<span class="checked" data-default="--选择分组--"></span>--><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li data-value="0" data-title="--取消选择--"><a href="javascript:void(0)">--取消选择--</a></li>
                                <li data-value="1" data-title="签到赠" <?php if(($_REQUEST['trend']) == "1"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">签到赠</a></li>
                                <li data-value="2" data-title="成单赠" <?php if(($_REQUEST['trend']) == "2"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">成单赠</a></li>
                                <li data-value="3" data-title="发帖赠" <?php if(($_REQUEST['trend']) == "3"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">发帖赠</a></li>
                                <li data-value="4" data-title="评价赠" <?php if(($_REQUEST['trend']) == "4"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">评价赠</a></li>
                                <li data-value="5" data-title="下单抵扣" <?php if(($_REQUEST['trend']) == "5"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">下单抵扣</a></li>
                                <li data-value="6" data-title="后台更改" <?php if(($_REQUEST['trend']) == "6"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">后台更改</a></li>
                            </ul>
                        </div>
                        <input type="hidden" name="trend" value="<?php echo ($row['trend']); ?>">
                        <div class="input-daterange" id="datepicker" style="display:inline">
                            <input type="text" name="start_time" value="<?php echo ($_REQUEST['start_time']); ?>" class="text-width-10" placeholder="起始时间" readonly>
                            --
                            <input type="text" name="end_time" value="<?php echo ($_REQUEST['end_time']); ?>" class="text-width-10" placeholder="结束时间" readonly>
                            <button class="btn btn-inverse">查询</button>
                        </div>
                        <!--<button type="button" class="btn btn-warning senior">高级</button>
                        <div class="senior-search" style="width: 300px;height: 300px;">
                            <p>
                                <input type="text" name="id" value="<?php echo ($_REQUEST['id']); ?>" placeholder="会员ID">
                            </p>
                        </div>-->
                    </form>
                </div>

                <div class="widget-content no-padding no-border">
                    <table class="table table-bordered table-striped reset-checkbox">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>用户信息</th>
                            <th>积分动向</th>
                            <th>数量信息</th>
                            <th>变动原因</th>
                            <th>关联订单</th>
                            <th>创建时间</th>
                        </tr>
                        </thead>
                        <tbody class="tbody">
                        <?php if(empty($list)): ?><tr><td colspan="30">Aho！没有查询结果！！</td></tr><?php endif; ?>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$row): $mod = ($i % 2 );++$i;?><tr>
                                <td><?php echo ($row['id']); ?></td>
                                <td><?php echo ($row['account']); ?>-<?php echo ($row['nickname']); ?></td>
                                <td><?php echo ($row['trend_name']); ?></td>
                                <td>
                                    变动数量：<span <?php if($row['symbol'] == 1): ?>class="green-1"<?php else: ?>class="red-1"<?php endif; ?>><?php echo ($row['symbol_name']); ?> <?php echo ($row['number']); ?></span><br>
                                    　变动前：<?php echo ($row['before_number']); ?>　
                                    变动后：<?php echo ($row['after_number']); ?>
                                </td>
                                <td><?php echo ((isset($row['reason']) && ($row['reason'] !== ""))?($row['reason']):'---'); ?></td>
                                <td>
                                    <?php if(!empty($row['order_id'])): ?><a href=""><?php echo ($row['order_sn']); ?></a>
                                        <?php else: ?>
                                        ---<?php endif; ?>
                                </td>
                                <td><?php echo (timestamp2date($row['create_time'])); ?></td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        <tr>
                            <td colspan="3"></td>
                            <td colspan="10">
                                <span class="yellow-1">当前条件用户既得总数：<?php echo ((isset($result['now_get_total']) && ($result['now_get_total'] !== ""))?($result['now_get_total']):0); ?><br>
                                当前条件用户消费总数：<?php echo ((isset($result['now_spend_total']) && ($result['now_spend_total'] !== ""))?($result['now_spend_total']):0); ?><br>
                                当前条件用户剩余总数：<?php echo ($result['now_get_total']-$result['now_spend_total']); ?></span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="pagination alternate">
                    <?php echo ($page); ?>
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
		
    <!--日历 start-->
    <link href="/Public/Static/plugins/datepicker/datepicker3.css" rel="stylesheet">
    <script src="/Public/Static/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!--日历 end-->
    <script>
        $(function(){
            $('.input-daterange').datepicker({
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true
            });
        })
    </script>

	</body>
</html>