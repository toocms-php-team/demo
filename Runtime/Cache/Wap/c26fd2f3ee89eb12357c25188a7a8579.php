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
    <div class="center sliding">修改昵称</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <div class="homepage">
            <div class="feedback nickname">
                <form action="<?php echo U('Center/modifyInfo');?>" method="post" class="form-horizontal">
                <input type="hidden" name="field" value="1">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td><input type="text" name="value" class="txt" placeholder="请输入昵称" value='' datatype="*1-15" nullmsg="请输入昵称！" errormsg=""></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="保存" class="btn submit-btn"></td>
                    </tr>
                </table>
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