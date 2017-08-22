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
    <div class="center sliding">我的积分</div>
    <div class="right"><a href="<?php echo U('Article/art', array('flag'=>'itg_rule'));?>">积分规则</a></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content infinite-scroll">
        <div class="record">
            <div class="ye">
                <div class="all">
                    <p>当前积分</p>
                    <h1><?php echo ($integral); ?><i>分</i></h1>
                </div>
            </div>
            <div class="notes">
                <h1>查看积分记录</h1>
                <!--<div class="none">暂无明细记录</div>-->
                <div class="exist">
                    <ul class="scroll-append-box">

                    </ul>
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
        
    <script>
        var target = '<?php echo U("Center/getMyIntegrals");?>';
        function getHtml(data) {
            return '<li>' +
                        '<span class="fl"><em>'+data['trend_name']+'</em><i>'+data['create_time']+'</i></span>' +
                        '<span class="fr"><i>'+data['symbol_name']+data['number']+'</i></span>' +
                    '</li>';
        }
        //创建ajax data参数
        function getQuery() {
            return {p:p};
        }
    </script>
    <script type="text/javascript" src="/Public/Wap/js/scroll.js"></script>

    </body>
</html>