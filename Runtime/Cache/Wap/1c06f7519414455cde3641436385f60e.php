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
    <div class="center sliding">更改手机号</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <div class="content-block">
            <div class="content-block-inner">
                <form action="<?php echo U('Center/doModifyAccount');?>" method="post" class="form-horizontal">
                    <input type="hidden" name="account" value="<?php echo ($_POST['account']); ?>" datatype="m" nullmsg="请输入手机号！" errormsg="手机号格式不正确！">
                <div class="forget_password">
                    <p>
                        <span>
                            <em class="fl">新手机号</em>
                            <em class="fr">
                                <input type="number" name="new_account" placeholder="请输入新手机号" class="text" datatype="m" nullmsg="请输入新手机号！" errormsg="手机号格式不正确！">
                            </em>
                        </span>
                    </p>
                    <p class="a1">
                        <span><em class="fl">验证码</em>
                            <em class="fr">
                                <input type="number" name="verify" placeholder="请输入验证码" class="text" datatype="n" nullmsg="请输入验证码！" errormsg="验证码格式不正确！">
                            </em>
                        </span>
                        <input type="button" value="获取验证码" id="hq_btn" class="get-verify">
                    </p>
                    <p class="a2">
                        <input type="submit" value="确认" class="btn submit-btn">
                    </p>
                </div>
                </form>
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
        $(function() {
            $('.get-verify').click(function() {
                getSmsVerify($('input[name="new_account"]').val(), 'register', '<?php echo U("SmsVerify/getSmsVerify");?>', this);
            });
        });
        //提示弹出层 回调方法
        function success_callback() {}
        function error_callback() {}
    </script>

    </body>
</html>