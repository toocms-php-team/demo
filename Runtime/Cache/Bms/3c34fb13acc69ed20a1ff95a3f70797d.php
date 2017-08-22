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
                    <?php if(in_array($_REQUEST['type'], array(2))): ?><ul class="quick-actions-horizontal">
                            <li>
                                <?php if($_REQUEST['type'] == 2): ?><a href="javascript:void(0)"><i class="icon-tag"></i><span>未处理退款单：<?php echo ($count_1); ?> 单</span></a><?php endif; ?>
                            </li>
                        </ul><?php endif; ?>
                    <?php if($_REQUEST['type'] == 1): ?><button class="btn btn-success ajax-post confirm" url="<?php echo U('OrderInfo/delivery');?>" target-form="ids">确认发货</button>&nbsp;
                    <button class="btn btn-warning ajax-post confirm" url="<?php echo U('OrderInfo/receiving');?>" target-form="ids">确认完成</button>&nbsp;<?php endif; ?>
                    <form action="<?php echo U(''.controller_by_order_type($_REQUEST['type']).'/index');?>" method="post" class="form">
                        <input type="hidden" name="type" value="<?php echo ($_REQUEST['type']); ?>">
                        <input type="text" name="account" value="<?php echo ($_REQUEST['account']); ?>" placeholder="会员账号">
                        <input type="text" name="order_sn" value="<?php echo ($_REQUEST['order_sn']); ?>" placeholder="订单号">
                        <?php if($_REQUEST['type'] == 1): ?><div class="btn-group">
                            <button type="button" class="btn checked" data-default="--订单状态--"></button>
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                <!--<span class="checked" data-default="--选择分组--"></span>--><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li data-value="0" data-title="--取消选择--"><a href="javascript:void(0)">--取消选择--</a></li>
                                <li data-value="1" data-title="待支付" <?php if(($_REQUEST['status']) == "1"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">待支付</a></li>
                                <li data-value="2" data-title="待发货" <?php if(($_REQUEST['status']) == "2"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">待发货</a></li>
                                <li data-value="3" data-title="待收货" <?php if(($_REQUEST['status']) == "3"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">待收货</a></li>
                                <li data-value="4" data-title="待评价" <?php if(($_REQUEST['status']) == "4"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">待评价</a></li>
                            </ul>
                        </div>
                        <?php elseif($_REQUEST['type'] == 2): ?>
                            <div class="btn-group">
                                <button type="button" class="btn checked" data-default="--订单状态--"></button>
                                <button class="btn dropdown-toggle" data-toggle="dropdown">
                                    <!--<span class="checked" data-default="--选择分组--"></span>--><span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li data-value="0" data-title="--取消选择--"><a href="javascript:void(0)">--取消选择--</a></li>
                                    <li data-value="7" data-title="申请退款" <?php if(($_REQUEST['status']) == "7"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">申请退款</a></li>
                                    <li data-value="8" data-title="退款完成" <?php if(($_REQUEST['status']) == "8"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">退款完成</a></li>
                                    <li data-value="9" data-title="取消退款" <?php if(($_REQUEST['status']) == "9"): ?>class="selected"<?php endif; ?>><a href="javascript:void(0)">取消退款</a></li>
                                </ul>
                            </div><?php endif; ?>
                        <input type="hidden" name="status" value="<?php echo ($row['status']); ?>">
                        <!--<span class="date-group date">
                            <input type="text" name="start_time" class="form-control date-group-addon" value="<?php echo ($_REQUEST['start_time']); ?>" placeholder="注册时间" readonly>
                        </span>-->
                        <button class="btn btn-inverse">查询</button>
                        <!--<button type="button" class="btn btn-warning senior">高级</button>-->
                        <div class="senior-search" style="width: 300px;height: 300px;">
                            <p>
                                <input type="text" name="id" value="<?php echo ($_REQUEST['id']); ?>" placeholder="会员ID">
                            </p>
                        </div>

                    </form>
                </div>

                <div class="widget-content no-padding no-border">
                    <table class="table table-bordered table-striped with-check reset-checkbox">
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="title-checkbox" name="title-checkbox" class="check-all"/><!--<i class="icon-resize-vertical"></i>--></th>
                            <th>ID</th>
                            <th>订单号</th>
                            <th>收货人信息</th>
                            <th>支付信息</th>
                            <th>费用信息</th>
                            <th>下单时间</th>
                            <th>状态</th>
                            <th>操作</th>
                            <th><i class="fa fa-pencil"></i>快递单号</th>
                        </tr>
                        </thead>
                        <tbody class="tbody">
                        <?php if(empty($list)): ?><tr><td colspan="30">Aho！没有查询结果！！</td></tr><?php endif; ?>
                        <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$row): $mod = ($i % 2 );++$i;?><tr>
                                <td><input type="checkbox" name="ids[]" value="<?php echo ($row['id']); ?>" class="ids"/></td>
                                <td><?php echo ($row['id']); ?></td>
                                <td><?php echo ($row['order_sn']); ?></td>
                                <td>
                                    姓名：<?php echo ((isset($row['consignee']) && ($row['consignee'] !== ""))?($row['consignee']):'---'); ?>　电话：<?php echo ((isset($row['mobile']) && ($row['mobile'] !== ""))?($row['mobile']):'---'); ?><br>
                                    地址：<?php echo ($row['province_name']); echo ($row['city_name']); echo ($row['area_name']); echo ($row['address']); ?>
                                    <?php if($row['urge'] > 0): ?><br><span class="red-1">提醒发货：<?php echo ($row['urge']); ?> 次</span><?php endif; ?>
                                </td>
                                <td>
                                    支付状态：<?php if($row['pay_status'] == 1): ?><span class="yellow-1">已支付</span><?php else: ?><span class="red-1">未支付</span><?php endif; ?><br>
                                    支付方式：<?php echo (get_payment_name($row['payment'])); ?><br>
                                    支付时间：<?php echo (timestamp2date($row['pay_time'])); ?>
                                </td>
                                <td><span class="yellow-1">
                                    商品总额：￥<?php echo ($row['goods_amounts']); ?><br>
                                    积分抵扣：￥<?php echo ($row['integral_ded_amounts']); ?>　优惠券抵扣：<?php echo ($row['coupon_amounts']); ?><br>
                                    实付款：￥<?php echo ($row['pay_amounts']); ?></span>
                                </td>
                                <td><?php echo (timestamp2date($row['create_time'])); ?></td>
                                <td><?php echo ($row['status_name']); ?></td>
                                <td>
                                    <a href="<?php echo U(''.controller_by_order_type($_REQUEST['type']).'/update',array('id'=>$row['id']));?>" title="详情" class="">
                                        <span class="label label-hover">详情</span></a>&nbsp;
                                    <?php if($row['status'] == 1): ?><a href="<?php echo U('OrderInfo/cancel',array('ids'=>$row['id']));?>" title="取消订单" class="ajax-get confirm">
                                            <span class="label label-important label-important-hover">取消订单</span></a>&nbsp;<?php endif; ?>
                                    <?php if($row['status'] == 2): ?><a href="<?php echo U('OrderInfo/delivery',array('ids'=>$row['id']));?>" title="确认发货" class="ajax-get confirm">
                                            <span class="label label-success label-success-hover">确认发货</span></a>&nbsp;<?php endif; ?>
                                    <?php if($row['status'] == 3): ?><a href="<?php echo U('OrderInfo/receiving',array('ids'=>$row['id']));?>" title="确认完成" class="ajax-get confirm">
                                            <span class="label label-warning label-warning-hover">确认完成</span></a>&nbsp;<?php endif; ?>
                                </td>
                                <td class="quick-edit" data-model="OrderInfo" data-id="<?php echo ($row['id']); ?>" data-field="logistics_number"><?php echo ($row['logistics_number']); ?></td>
                            </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>

                <div class="pagination alternate">
                    <?php echo ($page); ?>
                </div>

            </div>
        </div>
    </div>

    <div id="modal-assign" class="modal-860 modal hide">
    <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button">×</button>
        <h3>指派管家</h3>
    </div>
    <div class="modal-body">
        <Iframe src="" width="100%" height="500" scrolling="yes" frameborder="0" id="dispatch-Iframe"></Iframe>
    </div>
    <div class="modal-footer">
        <a data-dismiss="modal" class="btn" href="javascript:void(0)">取消</a>
    </div>
</div>
<script>
    function setSrc(obj) {
        var id = $(obj).attr('data-id'), type = $(obj).attr('data-type'), city_id = $(obj).attr('data-city-id'), reason = $(obj).attr('data-reason');
        if(type == 1)
            $('#dispatch-Iframe').attr('src', '<?php echo C("NOW_HOST");?>Keeper/dispatch/m_id/'+id);
        if(type == 3)
            $('#dispatch-Iframe').attr('src', '<?php echo C("NOW_HOST");?>Business/dispatch/order_id/'+id+'/city_id/'+city_id+'');
    }
</script>



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
            $('span.date-group').datepicker({
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                calendarWeeks: false, //显示第几周
                autoclose: true
            });
        })
    </script>

	</body>
</html>