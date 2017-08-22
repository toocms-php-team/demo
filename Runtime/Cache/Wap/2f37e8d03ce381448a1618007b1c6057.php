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
    <div class="center sliding">确认订单</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="position:static">
        <form action="" method="post" autocomplete="off">
            <div class="order-box">
            <div class="backing">
                <div class="share_adress show-address">
                    <?php if(empty($result['address'])): ?><p class="none"><a href="javascript:void(0)">选择收货地址</a></p>
                    <?php else: ?>
                        <p>
                            <a href="javascript:void(0)" class="now-address">
                                <span>收货人：<?php echo ($result['address']['contacts']); ?>  　<?php echo ($result['address']['mobile']); ?></span>
                                <em>收货地址：<?php echo ($result['address']['province_name']); echo ($result['address']['city_name']); echo ($result['address']['area_name']); echo ($result['address']['address']); ?></em>
                            </a>
                        </p><?php endif; ?>
                </div>
                <div class="share_pay">
                    <ul>
                        <li>
                            <span class="fl">可用<?php echo ($result['integral_info']['available_integral']); ?>积分抵用<?php echo ($result['integral_info']['integral_ded_amounts']); ?>元</span>
                            <span class="fr p_x">
                                <?php if(!empty($result['integral_info']['integral_ded_amounts']) and $result['integral_info']['integral_ded_amounts'] != '0.00'): ?><input type="checkbox" name="uer_itg" value="1" data-integral-ded-amounts="<?php echo ($result['integral_info']['integral_ded_amounts']); ?>" id="checkbox-1" class="choice_box2 use-itg" onclick="useitg(this);"/>
                                <label for="checkbox-1" data-integral-ded-amounts="<?php echo ($result['integral_info']['integral_ded_amounts']); ?>" onclick="useitg(this);"></label><?php endif; ?>
                            </span>
                        </li>
                        <li class="show-coupon">
                            <a href="javascript:void(0)">
                                <span class="fl">优惠券</span><span class="fr">
                                <i class="use-coupon">使用优惠券</i></span>
                            </a>
                        </li>
                    </ul>
                </div>
                <script>
                    var pay_amounts = <?php echo ((isset($result['pay_amounts']) && ($result['pay_amounts'] !== ""))?($result['pay_amounts']):0); ?>, coupon_amounts = 0, integral_ded_amounts = 0, adr_id = '<?php echo ((isset($result["address"]["adr_id"]) && ($result["address"]["adr_id"] !== ""))?($result["address"]["adr_id"]):0); ?>', uer_itg = 0, m_cpn_id = 0, cart_ids = '<?php echo ($_REQUEST["cart_ids"]); ?>';
                    $(function(){
                        $('.show-address').click(function(){
                            $('.order-box').hide();
                            $('.address-box').show();
                        });
                        $('.choice-address').click(function(){
                            $('.order-box').show();
                            $('.address-box').hide();
                            adr_id = $(this).attr('data-adr-id');
                            $('.show-address').html('<p><a href="javascript:void(0)"><span>收货人：'+$(this).find('.contacts').html()+'  　'+$(this).find('.mobile').html()+'</span> <em>收货地址：'+$(this).find('.address').html()+'</em> </a></p>');
                        });
                        $('.show-coupon').click(function(){
                            $('.order-box').hide();
                            $('.coupon-box').show();
                        });
                        $('.choice-coupon').click(function(){
                            //实付金额
                            pay_amounts = parseFloat(pay_amounts) + parseFloat(coupon_amounts);
                            //优惠券金额
                            coupon_amounts = parseFloat($(this).attr('data-face-value')).toFixed(2);
                            $('.use-coupon').html('<b>-￥'+coupon_amounts+'</b>');
                            $('.coupon-amounts').html(coupon_amounts);
                            //实付金额
                            pay_amounts = parseFloat(pay_amounts) - parseFloat(coupon_amounts);
                            $('.pay-amounts').html(pay_amounts);

                            m_cpn_id = $(this).attr('data-cpn-id');
                            //页面处理
                            $('.order-box').show(); $('.coupon-box').hide();
                        });
                        $('.not-use-coupon').click(function(){
                            if($('.cancel-coupon').attr('checked') != null) {
                                $('.use-coupon').html('使用优惠券'); $('.coupon-amounts').html('0.00');
                                //实付金额
                                pay_amounts = parseFloat(pay_amounts) + parseFloat(coupon_amounts);
                                $('.pay-amounts').html(pay_amounts);
                                //页面处理
                                $('.order-box').show(); $('.coupon-box').hide();
                            }
                        });
                    });
                    function useitg(obj) {
                        integral_ded_amounts = parseFloat($(obj).attr('data-integral-ded-amounts')).toFixed(2);
                        if($(obj).prev().attr('checked') == null) {
                            $('.integral-ded-amounts').html(integral_ded_amounts);
                            pay_amounts = parseFloat(pay_amounts) - parseFloat(integral_ded_amounts);
                            uer_itg = 1;
                        } else {
                            $('.integral-ded-amounts').html('0.00');
                            pay_amounts = parseFloat(pay_amounts) + parseFloat(integral_ded_amounts);
                            uer_itg = 0;
                        }
                        $('.pay-amounts').html(pay_amounts);
                    }
                </script>
                <div class="share_list">
                    <h1><span><img src="/Public/Wap/img/c_04.png"></span>商品清单</h1>
                    <?php if(is_array($result['goods_list'])): $i = 0; $__LIST__ = $result['goods_list'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><div class="list">
                        <div class="clearfix">
                            <div class="left"><span><img src="<?php echo ($goods['cover']); ?>"></span></div>
                            <div class="right">
                                <p><?php echo ($goods['goods_name']); ?></p>
                                <span>￥<?php echo ($goods['price']); ?></span> <em><i class="fl"><?php echo ($goods['goods_attr_desc']); ?></i><i class="fr">x<?php echo ($goods['number']); ?></i></em>
                            </div>
                        </div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
                <div class="orders_mn">
                    <ul>
                        <li><span class="fl">商品总额</span><span class="fr"><i>￥<?php echo ((isset($result['goods_amounts']) && ($result['goods_amounts'] !== ""))?($result['goods_amounts']):'0.00'); ?></i></span></li>
                        <li><span class="fl">优惠券</span><span class="fr"><i>-￥<span class="coupon-amounts"><?php echo ((isset($result['coupon_amounts']) && ($result['coupon_amounts'] !== ""))?($result['coupon_amounts']):'0.00'); ?></span></i></span></li>
                        <li><span class="fl">使用积分</span><span class="fr"><i>-￥<span class="integral-ded-amounts"><?php echo ((isset($result['integral_ded_amounts']) && ($result['integral_ded_amounts'] !== ""))?($result['integral_ded_amounts']):'0.00'); ?></span></i></span></li>
                    </ul>
                    <p>
                        <input type="text" class="text remark" placeholder="订单补充说明">
                    </p>
                </div>
            </div>
            <div class="suspend">
                <div class="fl"><em>实付款：<i>￥<span class="pay-amounts"><?php echo ((isset($result['pay_amounts']) && ($result['pay_amounts'] !== ""))?($result['pay_amounts']):'0.00'); ?></span></i></em></div>
                <div class="fr"><a href="javascript:void(0)" class="submit-order">提交订单</a></div>
            </div>
            </div>
        </form>

        <div class="coupon-box" style="display: none">
            <div class="coupon">
                <?php if(empty($result['coupons'])): ?><div class="none">暂无可用优惠券</div>
                <?php else: ?>
                    <div class="exist">
                        <?php if(is_array($result['coupons'])): $i = 0; $__LIST__ = $result['coupons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$coupon): $mod = ($i % 2 );++$i;?><div class="list choice-coupon" data-face-value="<?php echo ($coupon['face_value']); ?>" data-cpn-id="<?php echo ($coupon['m_cpn_id']); ?>" style="cursor: pointer">
                                <div class="clearfix green">
                                    <div class="left"><span>￥<b><?php echo ($coupon['face_value']); ?></b></span><em>满<?php echo ($coupon['use_condition']); ?>元可用</em></div>
                                    <div class="right"><span><?php echo ($coupon['can_use']); ?></span><em><?php echo ($coupon['desc']); ?></em><i>有效期至：<?php echo ($coupon['end_use_time']); ?></i></div>
                                </div>
                            </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    </div><?php endif; ?>
            </div>
            <div class="suspend">
                <div class="fl">
                    <span>
                        <input type="checkbox" id="checkbox-2" class="choice_box2 cancel-coupon" checked="checked"/>
                        <label for="checkbox-2"></label>不使用优惠券
                    </span>
                </div>
                <div class="fr"><a href="javascript:void(0)" class="not-use-coupon">确定</a></div>
            </div>
        </div>

        <div class="consignee address-box" style="display: none">
            <?php if(empty($addresses)): ?><div class="none" style="padding: 40px;">
                    您还没有添加过任何地址，
                    <a href="<?php echo U('Center/updAddress', array('flag'=>'confirm'));?>" style="text-decoration: underline;font-size: 16px;">去添加</a>
                </div>
            <?php else: ?>
                <form autocomplete="off">
                    <div class="exist">
                        <?php if(is_array($addresses)): $i = 0; $__LIST__ = $addresses;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$adr): $mod = ($i % 2 );++$i;?><!--start-->
                            <div class="list choice-address" data-adr-id="<?php echo ($adr['adr_id']); ?>" style="cursor: pointer">
                                <p class="name"><span class="fl contacts"><?php echo ($adr['contacts']); ?></span><span class="fr mobile"><?php echo ($adr['mobile']); ?></span></p>
                                <p class="dz">
                                    <span class="address"><?php echo ($adr['province_name']); echo ($adr['city_name']); echo ($adr['area_name']); echo ($adr['address']); ?></span>
                                    <span class="fr" style="color:green"><?php if($adr['is_default'] == 1): ?>默认地址<?php endif; ?></span>
                                </p>
                                <div class="clearfix"></div>
                                <!--<p class="set"></p>-->
                                <!--<p class="set">
                                    <span class="fl focus">
                                        <?php if($adr['is_default'] == 1): ?><input type="radio" id="checkbox-<?php echo ($key); ?>" class="choice_box2" name="box" checked="checked"/>
                                            <?php else: ?>
                                            <input type="radio" id="checkbox-<?php echo ($key); ?>" class="choice_box2 confirm ajax-get" name="box" url="<?php echo U('Center/setDefault', array('adr_id'=>$adr['adr_id']));?>" title="设为默认"/><?php endif; ?>
                                        <label for="checkbox-<?php echo ($key); ?>"></label>默认地址
                                    </span>
                                    <span class="fr">
                                        <a href="<?php echo U('Center/updAddress', array('adr_id'=>$adr['adr_id']));?>" class="bj">编辑</a>
                                        <a href="<?php echo U('Center/delAddress', array('adr_id'=>$adr['adr_id']));?>" title="删除" class="del confirm ajax-get">删除</a>
                                    </span>
                                </p>-->
                            </div>
                            <!--end--><?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                </form><?php endif; ?>
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
        
    <script src="/Public/Wap/js/common.js"></script>
    <script>
        $(function() {
            $('.submit-order').click(function(){
                if(adr_id == 0) {
                    showPop('请选择收货地址！', 'error', 1500, ''); return;
                }
                var remark = $('.remark').val();
                $(this).prop('disabled', true);
                $.post('<?php echo U("Flow/submitOrder");?>', {adr_id:adr_id,uer_itg:uer_itg,m_cpn_id:m_cpn_id,cart_ids:cart_ids,remark:remark}).success(function (data) {
                    if (data.status == 1) {
                        alert(data.url);
                        //showPop(data.info, 'success', 1500, data.url);
                    } else {
                        showPop(data.info, 'error', 1500, '');
                    }
                    $(this).prop('disabled', false);
                });
            });
        });
        //提示弹出层 回调方法
        function success_callback() {}
        function error_callback() {}
    </script>

    </body>
</html>