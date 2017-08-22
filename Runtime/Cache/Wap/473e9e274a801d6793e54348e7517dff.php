<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <title>---</title>
        <link rel="stylesheet" href="/Public/Wap/css/ios.min.css">
        <link rel="stylesheet" href="/Public/Wap/css/colors.min.css">
        <link rel="stylesheet" href="/Public/Wap/css/style.css">
        
        
    </head>

    <body>
        <div class="views">
            <div class="view view-main">
                <div class="navbar">
                    <div class="navbar-inner">
                        
    <div class="left"><a href="#" class="back link"> <i class="icon icon-back"></i></a></div>
    <div class="center sliding">设置新密码</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <form action="<?php echo U('Passport/doFindPass');?>" method="post" class="findpass-form-2 form-horizontal">
        <div class="set_password">
            <input type="hidden" name="account" value="<?php echo ($_POST['account']); ?>" datatype="m" nullmsg="请输入手机号！" errormsg="手机号格式不正确！">
            <div class="sex_box">
                <p>
                    <input type="password" name="password" placeholder="输入密码" class="text" datatype="s6-18" nullmsg="请输入密码！" errormsg="密码长度在6-18位！">
                </p>
                <p>
                    <input type="password" name="re_password" placeholder="再次输入密码" class="text" datatype="s6-18" recheck="password" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！">
                </p>
            </div>
            <div class="sex_ref">
                <input type="submit" value="确定" class="btn submit-btn">
            </div>
        </div>
        </form>
    </div>

                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript" src="/Public/Wap/js/framework7.min.js"></script>
        <script type="text/javascript" src="/Public/Wap/js/my-app.js"></script>
        <script type="text/javascript" src="/Public/Wap/js/jquery-1.8.3.min.js"></script>
        <script>
            $(function() {
                //$(".none").css("height",$(window).height()-46)
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