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
                        
    <div class="left"><a href="#" class="back link"> <i class="icon icon-back"></i></a></div>
    <div class="center sliding">收藏</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content infinite-scroll">
        <div class="c_silde">
            <div class="hd">
                <ul>
                    <li><a href="<?php echo U('Center/MyCollGoods');?>" class="focus">商品</a></li>
                    <li><a href="<?php echo U('Center/myCollArt');?>">文章</a></li>
                </ul>
            </div>
            <div class="bd">
                <div class="content">
                    <div class="machine">
                        <!--<div class="none">你还没有收藏过任何商品</div> -->
                        <div class="exist scroll-append-box">

                        </div>
                    </div>
                    <!-- 加载提示符 -->
<div class="infinite-scroll-preloader">
    <div class="preloader"></div>
</div>
                </div>
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
        
    <script>
        var target = '<?php echo U("Center/getMyCollGoods");?>';
        function getHtml(data) {
            return '<div class="list clearfix"> <a href="<?php echo U('Goods/detail');?>/goods_id/'+data['goods_id']+'">' +
                        '<div class="left"><img src="'+data['cover']+'"></div> ' +
                        '<div class="right"> ' +
                        '<div class="about">'+data['goods_name']+'</div> ' +
                        '<div class="rate"><em>￥'+data['price']+'</em></div> ' +
                        '</div> </a>' +
                    '</div>';
        }
        //创建ajax data参数
        function getQuery() {
            return {p:p};
        }
    </script>
    <script type="text/javascript" src="/Public/Wap/js/scroll.js"></script>

    </body>
</html>