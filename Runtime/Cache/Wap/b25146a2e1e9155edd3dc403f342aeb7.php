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
    <div class="center sliding">设置</div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="pages navbar-through toolbar-through">
        <div data-page="index" class="page" style="position:static">
            <div class="page-content">
                <div class="homepage">
                    <div class="fit">
                        <ul>
                            <li><a href="<?php echo U('System/feedback');?>">意见反馈</a></li>
                            <li><a href="<?php echo U('Article/art', array('flag'=>'about'));?>">关于我们</a></li>
                            <li><a href="javascript:void(0);" class="tel"><span class="fl">客服电话</span><span class="fr"><em><?php echo ($config[1]); ?></em></span></a></li>
                        </ul>
                        <p class="exit">
                            <input type="button" value="退出登录" class="btn logout">
                        </p>
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
        $$('.tel').on('click', function () {
            myApp.confirm('您确定拨打电话吗？','',function(){window.location.href = 'tel:<?php echo ($config[1]); ?>';});
        });
        $$('.logout').on('click', function () {
            myApp.confirm('确定要退出吗？','',
                    function(){
                       window.location.href = '<?php echo U("Center/logout");?>';
                    },
                    function(){

                    }
            );
        });
    </script>

    </body>
</html>