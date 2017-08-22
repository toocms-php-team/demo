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
                        
    <div class="left"><a href="javascript:void(0)" class="back link" onclick="javascript:history.back(-1);return false;"> <i class="icon icon-back"></i></a></div>
    <div class="center sliding">注册</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <div class="content-block">
           <div class="content-block-inner">
               <form action="<?php echo U('Passport/register/step/2');?>" method="post" class="register-form-1">
               <div class="login_logo"><img src="/Public/Wap/img/logo.png"></div>
               <div class="login_top">
                   <p class="a">
                       <input type="number" name="account" placeholder="手机号码" class="text text3" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="11" size="11">
                   </p>
                   <p class="a">
                       <input type="text" name="verify" placeholder="请输入验证码" class="text text4" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')" maxlength="6" size="6">
                       <i class="a1">
                           <input type="button" value="获取验证码" id="hq_btn" class="get-verify">
                       </i>
                   </p>
               </div>
               <div class="login_bot">
                   <input type="button" value="下一步" class="btn next-step">
               </div>
               </form>
           </div>
        </div>
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
        
    <script src="/Public/Wap/js/common.js"></script>
    <script>
        $(function() {
            $('.get-verify').click(function() {
                getSmsVerify($('input[name="account"]').val(), 'register', '<?php echo U("SmsVerify/getSmsVerify");?>', this);
            });
            $('.next-step').click(function() {
                checkSmsVerify($('input[name="account"]').val(), 'register', '<?php echo U("SmsVerify/checkSmsVerify");?>', $('input[name="verify"]').val(), this, $('.register-form-1'));
            });
        });
        //提示弹出层 回调方法
        function success_callback() {}
        function error_callback() {}
    </script>

    </body>
</html>