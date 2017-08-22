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
    <div class="center sliding">登录</div>
    <div class="right"><a href="<?php echo U('Passport/register/step/1');?>" class="item-link">注册</a></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <div class="content-block">
            <div class="content-block-inner">
                <div class="login_logo"><a href="/"><img src="/Public/Wap/img/logo.png"></a></div>
                <form action="<?php echo U('Passport/login');?>" method="post" class="form-horizontal">
                <div class="login_top">
                    <p class="a">
                        <input type="number" name="account" placeholder="请输入手机号" class="text text1" datatype="m" nullmsg="请输入手机号！" errormsg="手机号格式不正确！">
                    </p>
                    <p class="a">
                        <input type="password" name="password" placeholder="请输入密码" class="text text2" datatype="s6-18" nullmsg="请输入密码！" errormsg="密码长度在6-18位！">
                        <i><a href="<?php echo U('Passport/findPass/step/1');?>">忘记密码?</a></i>
                    </p>
                </div>
                <div class="login_bot">
                    <input type="submit" value="立即登录" class="btn do-login submit-btn">
                </div>
                </form>
                <div class="third">
                    <p><span>合作账号登录</span></p>
                    <ul class="clearfix">
                        <?php echo hook('interconnect');?>
                    </ul>
                </div>
            </div>
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
        
    <script src="/Public/Static/validform_5.3.2/Validform_v5.3.2_min.js"></script>
    <script src="/Public/Wap/js/validform.js"></script>
    <script src="/Public/Wap/js/common.js"></script>
    <script>
        $(function() { });
        //提示弹出层 回调方法
        function success_callback() {}
        function error_callback() {}
    </script>

    </body>
</html>