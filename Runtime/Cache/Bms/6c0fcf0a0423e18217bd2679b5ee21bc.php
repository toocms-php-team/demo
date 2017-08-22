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
        
    <style>
        .bill-table {  width: 70%;  border-left: #ccc solid 1px;border-top: #ccc solid 1px;}
        .bill-table .bg-tr {background:#f0f0f0; font-size: 15px; font-weight: bold}
        .bill-table .wb-tr td{font-weight: bold}
        .bill-table td {  padding: 10px;  border-bottom: #ccc solid 1px;border-right: #ccc solid 1px;}
        .bill-table > tr > td:first-child {  width: 15%;  }
    </style>
    <link rel="stylesheet" href="/Public/Bms/css/style/style.base.css" />
    <link rel="stylesheet" href="/Public/Bms/css/style/style.timeline.v1.css" />

        
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
        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#tab1">订单详情</a></li>
            <li class=""><a data-toggle="tab" href="#tab2">物流信息</a></li>
            <?php if(in_array($row['status'], array(7,8,9))): ?><li class=""><a data-toggle="tab" href="#tab3">退款信息</a></li><?php endif; ?>
        </ul>
        <!--<div class="widget-title"></div>-->
        <br>
        <div class="widget-content tab-content no-padding">
        <div id="tab1" class="tab-pane active">
            <table class="bill-table">
                <tr class="bg-tr">
                    <td colspan="5" align="center">订单基本信息</td>
                </tr>
                <tr>
                    <td width="15%">订单号</td><td colspan="4"><?php echo ($row['order_sn']); ?></td>
                </tr>
                <tr>
                    <td>物流单号 <i class="fa fa-pencil"></i></td>
                    <td colspan="4" class="quick-edit" data-model="OrderInfo" data-id="<?php echo ($row['id']); ?>" data-field="logistics_number"><?php echo ($row['logistics_number']); ?></td>
                    <!--<td colspan="4"><?php echo ((isset($row['logistics_number']) && ($row['logistics_number'] !== ""))?($row['logistics_number']):'---'); ?></td>-->
                </tr>
                <tr>
                    <td>备注</td><td colspan="4"><?php echo ((isset($row['remark']) && ($row['remark'] !== ""))?($row['remark']):'---'); ?></td>
                </tr>
                <tr>
                    <td>订单状态</td><td colspan="4"><?php echo ($row['status_name']); ?></td>
                </tr>
                <tr class="bg-tr">
                    <td colspan="5" align="center">用户及收货人信息</td>
                </tr>
                <tr>
                    <td>下单人信息</td><td colspan="10">昵称：<?php echo ((isset($row['nickname']) && ($row['nickname'] !== ""))?($row['nickname']):'---'); ?>　账号：<?php echo ($row['account']); ?></td>
                </tr>
                <tr>
                    <td>收货人</td><td colspan="4"><?php echo ($row['consignee']); ?></td>
                </tr>
                <tr>
                    <td>收获电话</td><td colspan="4"><?php echo ($row['mobile']); ?></td>
                </tr>
                <tr>
                    <td>收货地址</td><td colspan="4"><?php echo ($row['province_name']); echo ($row['city_name']); echo ($row['area_name']); echo ($row['address']); ?></td>
                </tr>
                <tr class="bg-tr">
                    <td colspan="5" align="center">商品清单</td>
                </tr>
                <?php if(is_array($row['goods_list'])): $i = 0; $__LIST__ = $row['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><tr>
                        <td><img src="<?php echo ($goods['cover']); ?>" width="80"/></td>
                        <td><?php echo ($goods['goods_name']); ?></td>
                        <td>规格：<?php echo ((isset($goods['goods_attr_desc']) && ($goods['goods_attr_desc'] !== ""))?($goods['goods_attr_desc']):"---"); ?></td>
                        <td>数量：×&ensp;<?php echo ($goods['number']); ?></td>
                        <td>单价：￥ <?php echo ($goods['price']); ?>&ensp;元<br>小计：￥ <?php echo ($goods['price']*$goods['number']); ?>&ensp;元</td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                <tr class="bg-tr">
                    <td colspan="5" align="center">费用明细</td>
                </tr>
                <tr>
                    <td>商品总额</td><td colspan="4">＋&ensp;￥&ensp;<?php echo ($row['goods_amounts']); ?>&ensp;元</td>
                </tr>
                <tr>
                    <td>积分抵扣</td><td colspan="4">－&ensp;￥&ensp;<?php echo ($row['integral_ded_amounts']); ?>&ensp;元</td>
                </tr>
                <tr>
                    <td>优惠券抵扣</td><td colspan="4">－&ensp;￥&ensp;<?php echo ($row['coupon_amounts']); ?>&ensp;元</td>
                </tr>
                <tr>
                    <td>实际支付</td><td colspan="4">&ensp;￥&ensp;<?php echo ($row['pay_amounts']); ?>&ensp;元</td>
                </tr>
                <tr class="bg-tr">
                    <td colspan="5" align="center">支付信息</td>
                </tr>
                <tr>
                    <td>支付状态</td><td colspan="4"><?php if($row['pay_status'] == 1): ?><span class="yellow-1">已支付</span><?php else: ?><span class="red-1">未支付</span><?php endif; ?></td>
                </tr>
                <tr>
                    <td>支付方式</td><td colspan="4"><?php echo (get_payment_name($row['payment'])); ?></td>
                </tr>
                <tr>
                    <td>支付时间</td><td colspan="4"><?php echo (timestamp2date($row['pay_time'])); ?></td>
                </tr>
                <tr class="bg-tr">
                    <td colspan="5" align="center">时间明细</td>
                </tr>
                <tr>
                    <td>下单时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['create_time'])); ?></td>
                </tr>
                <tr>
                    <td>支付时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['pay_time'])); ?></td>
                </tr>
                <tr>
                    <td>发货时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['delivery_time'])); ?></td>
                </tr>
                <tr>
                    <td>收货时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['receiving_time'])); ?></td>
                </tr>
                <tr>
                    <td>申请退款时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['apply_refund_time'])); ?></td>
                </tr>
                <tr>
                    <td>取消退款时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['cancel_refund_time'])); ?></td>
                </tr>
                <tr>
                    <td>完成退款时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['finish_refund_time'])); ?></td>
                </tr>
                <tr>
                    <td>取消订单时间</td>
                    <td colspan="4"><?php echo (timestamp2date($row['cancel_order_time'])); ?></td>
                </tr>
                <tr class="bg-tr">
                    <td colspan="5" align="center">订单操作</td>
                </tr>
                <tr>
                    <td>操作</td>
                    <td colspan="4">
                        <input type="hidden" name="ids[]" value="<?php echo ($row['id']); ?>" class="ids"/>
                        <?php switch($row['status']): case "2": ?><button class="btn btn-success ajax-post confirm" url="<?php echo U('OrderInfo/delivery');?>" target-form="ids">确认发货</button>&nbsp;<?php break;?>
                            <?php case "3": ?><button class="btn btn-warning ajax-post confirm" url="<?php echo U('OrderInfo/receiving');?>" target-form="ids">确认完成</button>&nbsp;<?php break;?>
                            <?php case "1": ?><button class="btn btn-danger ajax-post confirm" url="<?php echo U('OrderInfo/cancel');?>" target-form="ids">取消订单</button>&nbsp;<?php break;?>
                            <?php default: ?>
                            无<?php endswitch;?>
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab2" class="tab-pane">
            <div class="ibox-content timeline">
                <?php if(is_array($row['logistics'])): $i = 0; $__LIST__ = $row['logistics'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$lts): $mod = ($i % 2 );++$i;?><div class="timeline-item">
                        <div class="row">
                            <div class="col-xs-3 date">
                                <i class="fa fa-circle"></i><?php echo ($lts['time']); ?><br>
                            </div>
                            <div class="col-xs-5 content no-top-border">
                                <p class="m-b-xs">
                                    <strong><?php echo ($lts['time']); ?></strong>
                                </p>
                                <p><?php echo ($lts['context']); ?></p>
                            </div>
                        </div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <div id="tab3" class="tab-pane">
            <form action="<?php echo U('RefundOrder/refund');?>" method="post" class="refund-form" autocomplete="off">
                <input type="hidden" name="order_id" value="<?php echo ($row['id']); ?>">
                <input type="hidden" name="payment" value="<?php echo ($row['payment']); ?>">
                <input type="hidden" name="turnover_number" value="<?php echo ($row['turnover_number']); ?>">
                <input type="hidden" name="module" value="<?php echo ($row['module']); ?>">
                <table class="bill-table">
                    <tr class="bg-tr">
                        <td colspan="10" align="center">退款信息</td>
                    </tr>
                    <tr class="wb-tr">
                        <td>申请退款时间</td>
                        <td>退款原因</td>
                        <td>退款状态</td>
                        <td>用户实付金额</td>
                        <td>支付方式</td>
                        <td>支付流水号</td>
                        <td>退款金额</td>
                        <td>退款完成时间</td>
                        <td>取消退款时间</td>
                    </tr>
                    <tr>
                        <td><?php echo (timestamp2date($row['apply_refund_time'])); ?></td>
                        <td><?php echo ((isset($row['refund_reason']) && ($row['refund_reason'] !== ""))?($row['refund_reason']):'---'); ?></td>
                        <td><?php echo ($row['status_name']); ?></td>
                        <td>￥ <?php echo ($row['pay_amounts']); ?> 元</td>
                        <td><?php echo (get_payment_name($row['payment'])); ?></td>
                        <td><?php echo ((isset($row['turnover_number']) && ($row['turnover_number'] !== ""))?($row['turnover_number']):'---'); ?></td>
                        <td>￥ <?php echo ((isset($row['refund_amounts']) && ($row['refund_amounts'] !== ""))?($row['refund_amounts']):'0.0'); ?> 元</td>
                        <td><?php echo (timestamp2date($row['finish_refund_time'])); ?></td>
                        <td><?php echo (timestamp2date($row['cancel_refund_time'])); ?></td>
                    </tr>
                    <?php if($row['status'] == 7): ?><tr class="bg-tr">
                            <td colspan="10" align="center">处理退款</td>
                        </tr>
                        <!--<tr>
                            <td>退款金额</td>
                            <td colspan="10">
                                <input type="text" name="refund_fee" value="<?php echo ($row['pay_amounts']); ?>" class="decimal-only">
                            </td>
                        </tr>-->
                        <tr>
                            <td colspan="10">
                                退款金额：<input type="text" name="refund_amounts" value="<?php echo ($row['pay_amounts']); ?>" class="decimal-only">
                                                    <span class="help-block">
                                                        注：1、如果不修改退款金额则是全额退款！<br>
                                                        　　2、退款中不要进行其他的操作或刷新页面！
                                                    </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="10">
                                <!--<button class="btn btn-success ajax-post" target-form="refund-form" type="submit">确认退款</button>　-->
                                <?php if($row['payment'] == 1): ?><button class="btn btn-info refund" type="button">确认退款</button>　
                                <?php elseif($row['payment'] == 2): ?>
                                    <button class="btn btn-info ajax-post confirm" data-confirm="确认要执行退款吗？" target-form="refund-form" type="submit" data-ing-html="请稍后进行其他操作，退款中...">确认退款</button>　<?php endif; ?>

                                    <?php if($row['before_status'] != 2): ?><button href="<?php echo U('RefundOrder/cancelRefund',array('ids'=>$row['id']));?>" class="btn ajax-get confirm" data-confirm="确认要操作此订单取消退款吗？">取消退款</button>　<?php endif; ?>
                            </td>
                        </tr><?php endif; ?>
                </table>
            </form>
            <script>
                $(function() {
                    $('.refund').click(function(){
                        var refund_amounts = $('input[name="refund_amounts"]').val(), that = this;
                        if(refund_amounts == '' || refund_amounts == 0) {
                            updateAlert('请输入退款金额！','alert-error'); return;
                        }
                        if(confirm('确定要执行退款吗？')) {
                            $(that).addClass('disabled').attr('autocomplete','off').prop('disabled',true);
                            window.onbeforeunload = function () {return "正在退款，请不要关闭此页面！"}
                            setInterval("checkStatus()", 2000);
                            $('.refund-form').attr('target', '_blank');
                            $('.refund-form').submit();
                        }
                        //$(that).removeClass('disabled').prop('disabled',false);
                    });
                });
                //定时请求订单状态
                function checkStatus() {
                    $.post('<?php echo U("RefundCallback/checkStatus");?>', {order_id:'<?php echo ($row["id"]); ?>'}).success(function(data) {
                        if(data.status == 1) {
                            window.location.reload();
                        }
                    });
                }
            </script>
        </div>
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
        function beforePost() {
            var t1 = setInterval("checkStatus()", 1000);
            window.onbeforeunload = function () {return "正在退款，请不要关闭此页面！"}
        }
        function afterPost() {
            //window.onbeforeunload = function () {return null;}
        }
    </script>

	</body>
</html>