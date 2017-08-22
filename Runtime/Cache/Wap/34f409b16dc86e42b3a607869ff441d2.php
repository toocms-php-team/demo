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
        <div class="center sliding">家居服务</div>
        <div class="right"></div>
    
                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
        <div class="page-content infinite-scroll" style="position:static">
        <div class="index_find index_fd">
            <div class="clearfix scroll-append-box">
            </div>
        </div>
        <div class="g_cart"><a href="<?php echo U('Cart/cartList');?>" class="item-link"><img src="/Public/Wap/img/gwc_01.png"></a></div>
        <!-- 加载提示符 -->
<div class="infinite-scroll-preloader">
    <div class="preloader"></div>
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
        
        <script>
            var target = '<?php echo U("Goods/getGoodsList");?>';
            function getHtml(data) {
                return '<div class="list">' +
                        '<div class="all">' +
                            '<div class="content">' +
                                '<div class="pic"><a href="<?php echo U('Goods/detail');?>/goods_id/'+data['goods_id']+'" class="item-link"><img src="'+data['cover']+'"></a></div>' +
                                '<div class="about">'+data['goods_name']+'</div>' +
                                '<div class="price"><em>￥'+data['price']+'</em></div>' +
                            '</div>' +
                        '</div>' +
                        '</div>';
            }
            //创建ajax data参数
            function getQuery() {
                return {p:p,flag:'<?php echo ($_REQUEST["flag"]); ?>'};
            }
        </script>
        <script type="text/javascript" src="/Public/Wap/js/scroll.js"></script>
    
    </body>
</html>