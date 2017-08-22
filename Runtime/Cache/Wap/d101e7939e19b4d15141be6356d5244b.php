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
    <div class="center sliding">评价</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content infinite-scroll">
        <div class="evaluate index_fb">
            <div class="overall">
                <p>总评价(<?php echo ($count['best']+$count['better']+$count['bad']); ?>)</p>
                <p><span class="a1">好评(<?php echo ($count['best']); ?>)</span>　<span class="a2">中评(<?php echo ($count['better']); ?>)</span>　<span class="a3">差评(<?php echo ($count['bad']); ?>)</span></p>
            </div>
            <div class="exist">
                <ul class="scroll-append-box">

                </ul>
                <!-- 加载提示符 -->
<div class="infinite-scroll-preloader">
    <div class="preloader"></div>
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
        var target = '<?php echo U("Goods/getGoodsComments");?>';
        function getHtml(data) {
            var html = '<li> ' +
            '<h1><span class="fl"><i><img src="'+data.head+'"></i>'+data.nickname+'</span><span class="fr">';
            for(var i=1; i<data.level; i++) {
                html += '<img src="/Public/Wap/img/star.png">';
            }
            html += '</span></h1> ' +
            '<p>'+data.content+'</p> ' +
            '<div class="pic clearfix"> ';
            for(var i in data.pictures) {
                html += '<a href="javascript:void(0)"><span><img src="'+data.pictures[i]['abs_url']+'"></span></a> ';
            }
            html += '</div> ' +
            '<p class="date">'+data.create_time+'</p> ' +
            '</li>';
            return html;
        }
        //创建ajax data参数
        function getQuery() {
            return {p:p,goods_id:'<?php echo ($_REQUEST["goods_id"]); ?>'};
        }
    </script>
    <script type="text/javascript" src="/Public/Wap/js/scroll.js"></script>

    </body>
</html>