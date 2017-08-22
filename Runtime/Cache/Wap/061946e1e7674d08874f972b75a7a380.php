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
    <div class="center sliding">购物车</div>
    <div class="right">
        <span class="b">
            <a href="javascript:void(0);" class="b_bj">编辑</a>
            <a href="javascript:void(0);" class="b_ok">完成</a>
        </span>
    </div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="position:static">
        <div class="machine">
            <?php if(empty($carts)): ?><div class="none">您的购物车为空</div>
            <?php else: ?>
            <div class="exist">
                <?php if(is_array($carts)): $i = 0; $__LIST__ = $carts;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cart): $mod = ($i % 2 );++$i;?><!--start-->
                <div class="list clearfix" data-cart-id="<?php echo ($cart['cart_id']); ?>" data-product-id="<?php echo ($cart['product_id']); ?>" data-goods-id="<?php echo ($cart['goods_id']); ?>">
                    <div class="left"><a href="<?php echo U('Goods/detail', array('goods_id'=>$cart['goods_id']));?>"><img src="<?php echo ($cart['cover']); ?>"></a></div>
                    <div class="right">
                        <div class="about"><?php echo ($cart['goods_name']); ?></div>
                        <div class="size"><span><?php echo ($cart['goods_attr_desc']); ?></span></div>
                        <div class="price">
                            <span class="fl">￥<?php echo ($cart['price']); ?></span>
                            <span class="fr">
                                <input id="min" type="button" class="min" value="-" disabled/>
                                <input class="txt1 number" type="text" value="<?php echo ($cart['number']); ?>" data-price="<?php echo ($cart['price']); ?>"/>
                                <input id="add" type="button" class="add" value="+" disabled/>
                            </span>
                        </div>
                    </div>
                    <div class="choice">
                        <input type="checkbox" id="checkbox-<?php echo ($key); ?>" class="choice_box1 cart-id" name="box" value="<?php echo ($cart['cart_id']); ?>"/>
                        <label for="checkbox-<?php echo ($key); ?>" class="cart-id-label"></label>
                    </div>
                </div>
                <!--end--><?php endforeach; endif; else: echo "" ;endif; ?>
            </div><?php endif; ?>
        </div>
        <div class="suspend">
            <div class="fl"><span>
                <input type="checkbox" id="r_1" class="choice_box1" value="1" onclick="check()" checked="checked"/>
                <label for="r_1" onclick="check()"></label>全选</span><span class="mn">合计：￥<i>50.00</i></span>
            </div>
            <div class="fr">
                <a href="javascript:void(0);" class="ban">去结算</a>
                <a href="javascript:void(0);" class="del del-cart">删除</a>
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
        
    <script type="text/javascript" src="/Public/Wap/js/common.js"></script>
    <script type="text/javascript">
    $(function(){
        $(".b_bj").click(function() {
            okReset(this);
            //$(".suspend a.ban,.suspend span.mn").hide();
        });
        $(".b_ok").click(function() {
            var data_array = [], that = this;
            $('.cart-edit').each(function(key, obj){
                var goods_id = $(obj).attr('data-goods-id'), product_id = $(obj).attr('data-product-id'), number = $(obj).find('.number').val();
                data_array.push('{"goods_id":'+goods_id+',"product_id":'+product_id+',"number":'+number+'}');
            });
            if(data_array.length == 0) {
                bjReset(that); return;
            }
            var data = '['+data_array.join(',')+']';
            $.post('<?php echo U("Cart/updCart");?>', {data:data}).success(function (data) {
                if (data.status == 1) {
                    showPop(data.info, 'success', 1500, '');
                    bjReset(that);
                } else {
                    showPop(data.info, 'error', 1500, '');
                }
            });
        });
        $('.del-cart').click(function(){
            if(confirm('确认要将商品删除购物车吗？')) {
                var that = $('.b_ok'), cart_ids = getCartIds();
                if (cart_ids == '') {
                    bjReset(that);
                    return;
                }
                $.post('<?php echo U("Cart/delFromCart");?>', {cart_ids: cart_ids}).success(function (data) {
                    if (data.status == 1) {
                        showPop(data.info, 'success', 1500, 'callback');
                        bjReset(that);
                    } else {
                        showPop(data.info, 'error', 1500, '');
                    }
                });
            }
        });
        $('.ban').click(function(){
            var cart_ids = getCartIds();
            if(cart_ids == '') {
                showPop('请选择要结算的商品！', 'error', 1500, ''); return;
            }
            window.location.href = '<?php echo U("Flow/confirmOrder");?>/cart_ids/' + cart_ids;
        });

        $('.cart-id-label').click(function(){
            setTimeout(function(){
                setTotal();
            }, 300);
        });
    })
    function getCartIds() {
        var cart_id_array = [];
        $('.cart-id').each(function(key, obj){
            if($(obj).attr('checked') != null) {
                cart_id_array.push($(obj).val());
            }
        });
        return cart_id_array.join(',');
    }
    </script>
    <script type="text/javascript">
        function check(){
            var checkbox = document.getElementById('r_1');
            checkbox.value == 1 ? checkbox.value = 2 : checkbox.value = 1;
            var checkboxs = document.getElementsByName('box');
            for(var i=0; i<checkboxs.length;i++){
                if(checkbox.value==1){
                    checkboxs[i].checked=false;
                }else{
                    checkboxs[i].checked=true;
                }
            }
            setTotal();
        }
        function setTotal(){ //重置合计价格
            var s = 0;
            $(".list").each(function(){
                if($(this).find('.choice').find('.cart-id').attr('checked') != null) {
                    s += parseInt($(this).find('.price').find('input[class*=txt1]').val()) * parseInt($(this).find('.price').find('input[class*=txt1]').attr('data-price'));
                }
            });
            $(".mn i").html(s.toFixed(2));
        }
        function bjReset(obj) {
            $(obj).prev().show();
            $(obj).hide();
            $('.min').prop('disabled',true);
            $('.add').prop('disabled',true);
            $(".suspend a.del").hide().css("display","none");
            $(".suspend a.ban").show().css("display","block");
        }
        function okReset(obj) {
            $(obj).next().show();
            $(obj).hide();
            $('.min').prop('disabled',false);
            $('.add').prop('disabled',false);
            $(".suspend a.del").show().css("display","block");
            $(".suspend a.ban").hide().css("display","none");
        }
        $(function() {
            setTotal();check();
            $(".add").click(function () {
                var t = $(this).parent().find('input[class*=txt1]');
                t.val(parseInt(t.val()) + 1);
                $(this).parents('.list').addClass('cart-edit');
                setTotal();
            });
            $(".min").click(function () {
                var t = $(this).parent().find('input[class*=txt1]');
                t.val(parseInt(t.val()) - 1);
                if (parseInt(t.val()) < 0) {
                    t.val(0);
                }
                $(this).parents('.list').addClass('cart-edit');
                setTotal();
            });
            $(".none").css("height",$(window).height()-196)
        });
    </script>
    <script>
        //提示弹出层 回调方法
        function success_callback() {window.location.reload();}
        function error_callback() {}
    </script>

    </body>
</html>