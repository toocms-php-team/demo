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
    <div class="center sliding">退款</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="position:static;background:#fff">
        <form action="<?php echo U('OrderInfo/applyRefund');?>" method="post" class="form-horizontal">
            <input type="hidden" value="<?php echo ($_REQUEST['order_id']); ?>" name="order_id">
        <div class="refund">
            <h1>选择您的退款原因</h1>
            <ul class="clearfix">
                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;?><li>
                    <span>
                        <input type="radio" id="checkbox-<?php echo ($key); ?>" class="choice_box3 choice-reason" name="box" value="<?php echo ($r['reason']); ?>"/>
                        <label for="checkbox-<?php echo ($key); ?>"></label>
                    </span><?php echo ($r['reason']); ?>
                </li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
            <p>
                <span>
                    <textarea name="reason" class="textarea" placeholder="请描述您的退款原因" datatype="*" nullmsg="请输入退款原因！" errormsg="请输入退款原因！"></textarea>
                </span>
            </p>
        </div>
        <div class="suspend">
            <p class="tj">
                <input type="submit" value="提交" class="btn submit-btn">
            </p>
        </div>
        </form>
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
        $(function() {
            $('.choice-reason').click(function(){
                $('textarea[name="reason"]').val($(this).val());
            });
        });
        //提示弹出层 回调方法
        function success_callback() {}
        function error_callback() {}
    </script>

    </body>
</html>