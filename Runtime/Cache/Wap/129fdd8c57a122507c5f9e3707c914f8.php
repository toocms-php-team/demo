<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <title>超级麻利</title>
        <link rel="stylesheet" href="/Public/Wap/css/ios.min.css">
        <link rel="stylesheet" href="/Public/Wap/css/colors.min.css">
        <link rel="stylesheet" href="/Public/Wap/css/style.css">
        
        <script type="text/javascript" src="/Public/Wap/js/jquery-1.8.3.min.js"></script>
        
    </head>

    <body>
        <div class="views">
            <div class="view view-main">
                <div class="navbar">
                    <div class="navbar-inner">
                        
    <div class="left"><a href="<?php echo U('Center/index');?>" class="back link"> <i class="icon icon-back"></i></a></div>
    <div class="center sliding">我的订单</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content infinite-scroll" style="position:static">
        <div class="orders">
            <?php if(empty($_REQUEST['status']) or in_array($_REQUEST['status'],array(1,2,3,4))): ?><div class="hd">
                <ul>
                    <li><a href="<?php echo U('OrderInfo/myOrders');?>" <?php if(empty($_REQUEST['status'])): ?>class="focus"<?php endif; ?>>全部</a></li>
                    <li><a href="<?php echo U('OrderInfo/myOrders',array('status'=>1));?>" <?php if($_REQUEST['status'] == 1): ?>class="focus"<?php endif; ?>>待付款</a></li>
                    <li><a href="<?php echo U('OrderInfo/myOrders',array('status'=>2));?>" <?php if($_REQUEST['status'] == 2): ?>class="focus"<?php endif; ?>>待发货</a></li>
                    <li><a href="<?php echo U('OrderInfo/myOrders',array('status'=>3));?>" <?php if($_REQUEST['status'] == 3): ?>class="focus"<?php endif; ?>>待收货</a></li>
                    <li><a href="<?php echo U('OrderInfo/myOrders',array('status'=>4));?>" <?php if($_REQUEST['status'] == 4): ?>class="focus"<?php endif; ?>>待评价</a></li>
                </ul>
            </div><?php endif; ?>
            <div class="bd">
                <div class="exist">
                    <div class="content scroll-append-box">

                    </div>
                </div>
            </div>
            <!-- 加载提示符 -->
<div class="infinite-scroll-preloader">
    <div class="preloader"></div>
</div>
        </div>
    </div>

                        <!--start-->
<div class="bg"></div>
<div class="comment_one lyq-notification">
    <h1>确定要删除吗?</h1>
    <!--<p><a href="javascript:void(0);" class="c_qx">取消</a><a href="javascript:void(0);" class="c_qd">确定</a></p>-->
</div>
<!--end-->
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="/Public/Wap/js/framework7.min.js"></script>
        <script type="text/javascript" src="/Public/Wap/js/my-app.js"></script>
        <script>
            $(function() {
                //$(".none").css("height",$(window).height()-46)
            })
        </script>
        
    <script type="text/javascript" src="/Public/Wap/js/common.js"></script>
    <script>
        var target = '<?php echo U("OrderInfo/getOrders");?>';
        function getHtml(data) {
            var html = '<div class="entry"> ' +
                    '<a href="<?php echo U('OrderInfo/orderDetail');?>/order_id/'+data.order_id+'"><div class="lb_head"> ' +
                        '<div class="fl">订单编号：'+data.order_sn+'</div> <div class="fr">'+data.status_name+'</div> ' +
                    '</div> ';
                for(var i in data.goods_list) {
                    html += '<div class="share_list"><div class="list"> ' +
                            '<div class="clearfix"> ' +
                                '<div class="left"><span><img src="'+data.goods_list[i]['cover']+'"></span></div> ' +
                                '<div class="right"> ' +
                                    '<p>'+data.goods_list[i]['goods_name']+'</p> ' +
                                    '<span>￥'+data.goods_list[i]['price']+'</span> ' +
                                    '<em>' +
                                    '<i class="fl">'+data.goods_list[i]['goods_attr_desc']+'</i>' +
                                    '<i class="fr">x'+data.goods_list[i]['number']+'</i>' +
                                    '</em> ' +
                                '</div> ' +
                            '</div> ' +
                            '</div> </div>';
                }
                html += '</a><div class="lb_bot"> ' +
                        '<span class="fl">总计：<i>￥'+data.pay_amounts+'</i></span> <span class="fr">';

                if(data.status == 1) {
                    html += '<a url="<?php echo U('OrderInfo/cancelOrder');?>/order_id/'+data.order_id+'" data-confirm="确定要取消订单吗？" class="a1 cancel-order confirm" onclick="ajaxGet(this);">取消订单</a>' +
                    '<a href="<?php echo U('Flow/pay');?>/order_id/'+data.order_id+'" class="a2">支付</a>';
                } else if(data.status == 2) {
                    html += '<a url="<?php echo U('OrderInfo/cancelOrder');?>/order_id/'+data.order_id+'" data-confirm="确定要取消订单吗？" class="a1 cancel-order confirm" onclick="ajaxGet(this);">取消订单</a>' +
                    '<a url="<?php echo U('OrderInfo/urge');?>/order_id/'+data.order_id+'" class="a2 tx urge" onclick="ajaxGet(this);">提醒发货</a>';
                } else if(data.status == 3) {
                    html += '<a href="<?php echo U('OrderInfo/refund');?>/order_id/'+data.order_id+'" class="a1 refund-order">退款</a>' +
                    '<a url="<?php echo U('OrderInfo/signFor');?>/order_id/'+data.order_id+'" data-confirm="确定要确认收货吗？" class="a2 sign-for confirm" onclick="ajaxGet(this);">确认收货</a>';
                } else if(data.status == 4) {
                    html += '<a href="<?php echo U('OrderInfo/refund');?>/order_id/'+data.order_id+'" class="a1 refund-order">退款</a>' +
                    '<a href="<?php echo U('OrderInfo/comment');?>/order_id/'+data.order_id+'" class="a2">去评价</a>';
                } else if(data.status == 5) {
                    html += '';
                } else if(data.status == 7) {
                    html += '<a url="<?php echo U('OrderInfo/cancelRefund');?>/order_id/'+data.order_id+'" data-confirm="确定要取消退款申请吗？" class="a2 cancel-refund confirm" onclick="ajaxGet(this);">取消申请</a>';
                }
                html += '</span></div></div>';

            return html;
        }
        //创建ajax data参数
        function getQuery() {
            return {p:p,status:'<?php echo ($_REQUEST["status"]); ?>'};
        }
    </script>
    <script>
        //提示弹出层 回调方法
        function success_callback() {window.location.reload();}
        function error_callback() {}
    </script>
    <script type="text/javascript" src="/Public/Wap/js/scroll.js"></script>
    <script>
        $(function() { $(".none").css("height",$(window).height()-196); })
    </script>

    </body>
</html>