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
    <div class="center sliding">消息</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content infinite-scroll">
        <div class="dope">
            <ul class="scroll-append-box">

            </ul>
        </div>
        <!-- 加载提示符 -->
<div class="infinite-scroll-preloader">
    <div class="preloader"></div>
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
        var target = '<?php echo U("SiteMessage/getMessages");?>';
        function getHtml(data) {
            var html = '<a href="<?php echo U('SiteMessage/detail');?>/site_msg_id/'+data['site_msg_id']+'"><li> ' +
            '<span><em class="fl">【'+data['subject']+'】</em><em class="fr">'+data['create_time']+'</em>';
             if(data['status'] == 0) {
                 html += '<i></i>';
             }
            html += '</span> ' +
            '<p>'+data['content']+'</p> ' +
            '</li></a>';

            return html;
        }
        //创建ajax data参数
        function getQuery() {
            return {p:p};
        }
    </script>
    <script type="text/javascript" src="/Public/Wap/js/scroll.js"></script>

    </body>
</html>