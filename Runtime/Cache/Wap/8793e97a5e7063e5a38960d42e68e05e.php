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
                        
    <div class="left"><a href="javascript:void(0)" class="back link" onclick="javascript:history.back(-1);return false;"> <i class="icon icon-back"></i></a></div>
    <div class="center sliding">订单详情</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="position:static">
        <div class="backing">
            <div class="share_adress">
                <p><span>收货人：<?php echo ($result['consignee']); ?>　　<?php echo ($result['mobile']); ?></span>
                    <em>收货地址：<?php echo ($result['province_name']); echo ($result['city_name']); echo ($result['area_name']); echo ($result['address']); ?></em></p>
            </div>
            <div class="share_list">
                <h1><span><img src="/Public/Wap/img/c_04.png"></span>商品清单</h1>
                <?php if(is_array($result['goods_list'])): $i = 0; $__LIST__ = $result['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><div class="list">
                    <div class="clearfix">
                        <div class="left"><span><img src="<?php echo ($goods['cover']); ?>"></span></div>
                        <div class="right">
                            <p><?php echo ($goods['goods_name']); ?></p>
                            <span>￥<?php echo ($goods['price']); ?></span> <em><i class="fl"><?php echo ($goods['goods_attr_desc']); ?></i><i class="fr">x<?php echo ($goods['number']); ?></i></em>
                        </div>
                    </div>
                </div><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <div class="share_about">
                <ul>
                    <li>订单编号：<span><?php echo ($result['order_sn']); ?></span></li>
                    <li>订单状态：<em><?php echo ($result['status_name']); ?></em></li>
                </ul>
                <p><span><?php echo ((isset($result['remark']) && ($result['remark'] !== ""))?($result['remark']):'无备注'); ?></span></p>
            </div>
            <div class="orders_mn">
                <ul>
                    <li><span class="fl">商品总额</span><span class="fr"><i>￥<?php echo ($result['goods_amounts']); ?></i></span></li>
                    <li><span class="fl">优惠券</span><span class="fr"><i>-￥<?php echo ($result['coupon_amounts']); ?></i></span></li>
                    <li><span class="fl">使用积分</span><span class="fr"><i>-￥<?php echo ($result['integral_ded_amounts']); ?></i></span></li>
                </ul>
                <p class="date"> <span>实付款：<i>￥<?php echo ($result['pay_amounts']); ?></i></span> <em>下单时间：<?php echo ($result['create_time']); ?></em> </p>
            </div>
            <div class="logistics">
                <h1>物流详情</h1>
                <div class="xq">
                    <ul>
                        <?php if(is_array($result['logistics'])): $i = 0; $__LIST__ = $result['logistics'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$logis): $mod = ($i % 2 );++$i;?><li <?php if(empty($result['logistics'][$key+1])): ?>class="new"<?php endif; ?>>
                            <p class="tit"><?php echo ($logis['context']); ?></p>
                            <p class="name"></p>
                            <p class="date"><?php echo ($logis['time']); ?></p>
                            <i></i>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                        <!--<li class="new">
                            <p class="tit">[天津市]望海楼快递员正在派件</p>
                            <p class="name"><span>派件员：李大大</span><span class="tel"><a href="tel:13569854798">13569854798</a></span></p>
                            <p class="date">2016-09-06 07:20</p>
                            <i></i>
                        </li>-->
                    </ul>
                </div>
            </div>
        </div>

        <div class="suspend">
            <p>
            <?php if($result['status'] == 1): ?><a href="<?php echo U('OrderInfo/cancelOrder', array('order_id'=>$result['order_id']));?>" class="qx ajax-get confirm" data-confirm="确定要取消订单吗？">取消订单</a>
                <a href="" class="bc tx">支付</a>
            <?php elseif($result['status'] == 2): ?>
                <a href="<?php echo U('OrderInfo/cancelOrder', array('order_id'=>$result['order_id']));?>" class="qx ajax-get confirm" data-confirm="确定要取消订单吗？">取消订单</a>
                <a href="<?php echo U('OrderInfo/urge', array('order_id'=>$result['order_id']));?>" class="bc tx ajax-get">提醒发货</a>
            <?php elseif($result['status'] == 3): ?>
                <a href="<?php echo U('OrderInfo/refund', array('order_id'=>$result['order_id']));?>" class="qx">退款</a>
                <a href="<?php echo U('OrderInfo/signFor', array('order_id'=>$result['order_id']));?>" class="bc tx ajax-get confirm" data-confirm="确定要确认收货吗？">确认收货</a>
            <?php elseif($result['status'] == 4): ?>
                <a href="<?php echo U('OrderInfo/refund', array('order_id'=>$result['order_id']));?>" class="qx">退款</a>
                <a href="<?php echo U('OrderInfo/comment', array('order_id'=>$result['order_id']));?>" class="bc tx">评价</a>
            <?php elseif($result['status'] == 5): ?>

            <?php elseif($result['status'] == 7): ?>
                <a href="<?php echo U('OrderInfo/cancelRefund', array('order_id'=>$result['order_id']));?>" class="bc tx ajax-get confirm" data-confirm="确定要取消退款吗？">取消退款</a><?php endif; ?>
            </p>
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
        $(function() {
            $("a.tx").click(function() {
                $(".bg,.warn").fadeIn();
            });
            $(".warn p span").click(function() {
                $(".bg,.warn").fadeOut();
            });
            $(".none").css("height",$(window).height()-196);
        })
    </script>
    <script>
        //提示弹出层 回调方法
        function success_callback() {window.location.reload();}
        function error_callback() {}
    </script>

    </body>
</html>