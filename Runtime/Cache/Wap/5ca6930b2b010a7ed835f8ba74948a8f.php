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
    <div class="center sliding">收银台</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="position:static">
        <div class="confirm_list">
            <div class="c_ticket">
                <ul>
                    <li>
                        <span class="fl">微信支付</span>
                        <span class="fr">
                            <input type="radio" id="checkbox-1" class="choice_box1" name="box"/>
                            <label for="checkbox-1"></label>
                        </span>
                    </li>
                    <!--<li>
                        <span class="fl">支付宝支付</span>
                        <span class="fr">
                            <input type="radio" id="checkbox-2" class="choice_box1" name="box"/>
                            <label for="checkbox-2"></label>
                        </span>
                    </li>-->
                </ul>
            </div>
        </div>
        <div class="suspend">
            <div class="fl"><em>支付：<i>￥1380.00</i></em></div>
            <div class="fr"><a href="#">付款</a></div>
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
        
    <script type="text/javascript">
        //调用微信JS api 支付
        function jsApiCall() {
            WeixinJSBridge.invoke(
                    'getBrandWCPayRequest',
                    <?php echo ($jsApiParameters); ?>,
                    function(res){
                        WeixinJSBridge.log(res.err_msg);
                        if(res.err_msg == "get_brand_wcpay_request:ok"){
                            //alert(res.err_code+res.err_desc+res.err_msg);
                            window.location.href="<?php echo ($forward); ?>";
                        }else{
                            //返回跳转到订单详情页面
                            //alert('支付失败');
                            //alert(res.err_code+res.err_desc+res.err_msg);
                            window.location.href="<?php echo ($forward); ?>";
                        }
                        //alert(res.err_code+res.err_desc+res.err_msg);
                    }
            );
        }

        function callpay() {
            if (typeof WeixinJSBridge == "undefined"){
                if( document.addEventListener ){
                    document.addEventListener('WeixinJSBridgeReady', jsApiCall, false);
                }else if (document.attachEvent){
                    document.attachEvent('WeixinJSBridgeReady', jsApiCall);
                    document.attachEvent('onWeixinJSBridgeReady', jsApiCall);
                }
            }else{
                jsApiCall();
            }
        }
    </script>
    <script>
        $(function() {
            $(".none").css("height",$(window).height()-46)
        })
    </script>

    </body>
</html>