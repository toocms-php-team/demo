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
                        
    <div class="left"></div>
    <div class="center sliding">我的</div>
    <div class="right"><a href="<?php echo U('SiteMessage/messages');?>">消息<?php if($not_read > 0): ?><i></i><?php endif; ?></a></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="position:static">
        <div class="homepage">
            <div class="avatar">
                <?php if(session('member.m_id') != null): ?><div class="exist">
                        <a href="<?php echo U('Center/myInfo');?>"><span><img src="<?php echo ($info['head']); ?>"> </span><i><?php echo ($info['nickname']); ?></i></a>
                    </div>
                <?php else: ?>
                    <div class="no">
                        <span><img src="/Public/Wap/img/head.png"></span>
                        <i><a href="<?php echo U('Passport/login');?>" class="item-link">登录</a></i> | <a href="<?php echo U('Passport/register/step/1');?>">注册</a>
                    </div><?php endif; ?>
            </div>
            <div class="list_icon">
                <div class="h_icon"> <a href="<?php echo U('OrderInfo/myOrders');?>" class="item-link">我的订单</a> </div>
                <div class="h_nav row">
                    <div class="col-20"> <a href="<?php echo U('OrderInfo/myOrders',array('status'=>1));?>" class="item-link"><span><img src="/Public/Wap/img/list_nav_2.png"></span><em>待付款</em></a> </div>
                    <div class="col-20"> <a href="<?php echo U('OrderInfo/myOrders',array('status'=>2));?>" class="item-link"><span><img src="/Public/Wap/img/list_nav_3.png"></span><em>待发货</em></a> </div>
                    <div class="col-20"> <a href="<?php echo U('OrderInfo/myOrders',array('status'=>3));?>" class="item-link"><span><img src="/Public/Wap/img/list_nav_4.png"></span><em>待收货</em></a> </div>
                    <div class="col-20"> <a href="<?php echo U('OrderInfo/myOrders',array('status'=>4));?>" class="item-link"><span><img src="/Public/Wap/img/list_nav_5.png"></span><em>待评价</em></a> </div>
                    <div class="col-20"> <a href="<?php echo U('OrderInfo/myOrders',array('status'=>'7,8,9'));?>" class="item-link"><span><img src="/Public/Wap/img/list_nav_6.png"></span><em>退款</em></a> </div>
                </div>
            </div>
            <div class="h_project row">
                <div class="col-33"><a href="<?php echo U('Center/myKeeper');?>" class="item-link"><span><img src="/Public/Wap/img/nav_01.png"></span><em>我的管家</em></a></div>
                <div class="col-33"><a href="<?php echo U('Center/myIntegrals');?>" class="item-link"><span><img src="/Public/Wap/img/nav_02.png"></span><em>我的积分</em></a></div>
                <div class="col-33"><a href="<?php echo U('Center/addresses');?>" class="item-link"><span><img src="/Public/Wap/img/nav_03.png"></span><em>收货地址</em></a></div>
                <div class="col-33"><a href="<?php echo U('Center/myCoupons');?>" class="item-link"><span><img src="/Public/Wap/img/nav_04.png"></span><em>优惠券</em></a></div>
                <div class="col-33"><a href="<?php echo U('Center/myCollGoods');?>" class="item-link"><span><img src="/Public/Wap/img/nav_05.png"></span><em>我的收藏</em></a></div>
                <div class="col-33"><a href="http://www.sobot.com/chat/h5/index.html?sysNum=15e920265dcb412db03e42edea98aa5c" class="item-link"><span><img src="/Public/Wap/img/nav_06.png"></span><em>帮助中心</em></a></div>
                <div class="col-33"><a href="<?php echo U('System/feedback');?>" class="item-link"><span><img src="/Public/Wap/img/nav_07.png"></span><em>意见反馈</em></a></div>
                <div class="col-33"><a href="<?php echo U('Center/set');?>" class="item-link"><span><img src="/Public/Wap/img/nav_08.png"></span><em>设置</em></a></div>
            </div>
        </div>
        <div class="footer">
            <ul>
                <li><a href="/"><i><img src="/Public/Wap/img/icon_01.png"></i><span>首页</span></a></li>
                <li><a href="<?php echo U('Goods/goodsList');?>"><i><img src="/Public/Wap/img/icon_02.png"></i><span>商城</span></a></li>
                <li class="focus"><a href="<?php echo U('Center/index');?>"><i><img src="/Public/Wap/img/icon_03_bak.png"></i><span>我的</span></a></li>
            </ul>
        </div>
    </div>

                        <!--start-->
<div class="bg"></div>
<div class="comment_one lyq-notification">
    <h1 style="border-bottom: none"></h1>
    <!--<p><a href="javascript:void(0);" class="c_qx">取消</a><a href="javascript:void(0);" class="c_qd">确定</a></p>-->
</div>
<!--end-->
                    </div>
                </div>
                <img class="share" style="position:fixed;right:-5px;top:0px;width:100%;z-index:2100;padding:0px 0;display:none;" src="/Public/Wap/img/bg-share.png">
            </div>
        </div>

        <script type="text/javascript" src="/Public/Wap/js/framework7.min.js"></script>
        <script type="text/javascript" src="/Public/Wap/js/my-app.js"></script>
        <script>
            $(function() {
                //$(".none").css("height",$(window).height()-46)
                $('.do-share').click(function(){ $('.bg,.share').toggle(); });
                $('.share').click(function(){ $('.bg,.share').toggle(); });
            })
        </script>
        
    </body>
</html>