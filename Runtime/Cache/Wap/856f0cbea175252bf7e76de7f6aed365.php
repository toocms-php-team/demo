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
        <div class="center sliding">商品详情</div>
        <div class="right">
            <span class="c">
                <?php if($goods['is_coll'] == 0): ?><a href="<?php echo U('Goods/goodsCollection',array('goods_id'=>$goods['goods_id'],'is_coll'=>$goods['is_coll']));?>" title="收藏" class="ajax-get"><img src="/Public/Wap/img/star_collect.png" class="c_s"></a>
                <?php else: ?>
                    <a href="<?php echo U('Goods/goodsCollection',array('goods_id'=>$goods['goods_id'],'is_coll'=>$goods['is_coll']));?>" title="取消收藏" class="ajax-get"><img src="/Public/Wap/img/star_collect_bak.png" class="c_s"></a><?php endif; ?>
            </span>
            <span class="s do-share">
                <img src="/Public/Wap/img/share.png">
            </span>
        </div>
    
                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
        <div class="page-content" style="position:static">
            <div class="details">
                <div class="de_top">
                    <div class="banner">
                        <div class="banner_con">
                            <div class="banner_cx" id="banner_cx">
                                <?php if(is_array($goods['pictures'])): $i = 0; $__LIST__ = $goods['pictures'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;?><div class="banner_slide"><a href="javascript:void(0)"><img src="<?php echo ($pic['abs_url']); ?>"></a></div><?php endforeach; endif; else: echo "" ;endif; ?>
                            </div>
                        </div>
                        <div class="paging"></div>
                    </div>
                    <div class="about"><?php echo ($goods['goods_name']); ?></div>
                    <div class="price">￥<span><?php echo ($goods['price']); ?></span></div>
                </div>
                <div class="norms">
                    <?php if(!empty($goods['goods_attr'])): ?><h1>规格</h1><?php endif; ?>
                    <?php if(is_array($goods['goods_attr'])): $i = 0; $__LIST__ = $goods['goods_attr'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$g_attr): $mod = ($i % 2 );++$i;?><div class="clearfix goods-attr">
                        <div class="fl"><?php echo ($g_attr['attr_name']); ?></div>
                        <div class="fr">
                            <?php if(is_array($g_attr['attr_values'])): $i = 0; $__LIST__ = $g_attr['attr_values'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$val): $mod = ($i % 2 );++$i;?><a href="javascript:void(0);" class="y choice-attr" data-goods-attr-id="<?php echo ($val['goods_attr_id']); ?>"><?php echo ($val['attr_value']); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
                            <!--<a href="javascript:void(0);" class="focus y">1500mm*1800mm</a>
                            <a href="javascript:void(0);" class="n">1800mm*2000mm</a>-->
                        </div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                    <script>
                        var goods_id = '<?php echo ($goods["goods_id"]); ?>', post = true, goods_attr_id_array = [], goods_attr_ids = '',
                                goods_attr_desc_array = [], goods_attr_desc = '', stock = 0, product_id = 0;
                        $(function() {
                            clGoodsAttr();
                            $('.choice-attr').click(function() {
                                post = true; goods_attr_id_array = []; goods_attr_ids = ''; goods_attr_desc_array = []; goods_attr_desc = '';//初始化
                                $(this).parents('.goods-attr').find('.choice-attr').removeClass('focus');
                                $(this).addClass('focus');
                                clGoodsAttr();
                                //调数据
                                if(post) {
                                    goods_attr_ids = goods_attr_id_array.join('|');
                                    $.post('<?php echo U("Goods/getStockPrice");?>', {goods_id: goods_id, goods_attr_ids: goods_attr_ids}).success(function (data) {
                                        if (data.status == 1) {
                                            $('.price span').html(data.data.price); stock = data.data.stock, product_id = data.data.product_id;
                                        } else {
                                            showPop(data.info, 'error', 1500, '');
                                        }
                                    });
                                }
                            });
                            $('.add-to-cart').click(function(){
                                if(!post) {
                                    showPop('请选择完整商品规格！', 'error', 1500, ''); return;
                                }
                                var goods_attr_desc = goods_attr_desc_array.join('，'), number = $('.number').val();
                                $.post('<?php echo U("Cart/addToCart");?>', {goods_id:goods_id,number:number,goods_attr_ids:goods_attr_ids,goods_attr_desc:goods_attr_desc}).success(function (data) {
                                    if (data.status == 1) {
                                        showPop(data.info, 'success', 1500, '');
                                        $('.carts').html(parseInt($('.carts').html()) + parseInt(number));
                                    } else {
                                        showPop(data.info, 'error', 1500, data.url);
                                    }
                                });
                            });
                        });
                        function clGoodsAttr() {
                            $('.goods-attr').each(function(key, obj){
                                if($(obj).find('.focus').html() != null) {
                                    goods_attr_id_array.push($(obj).find('.focus').attr('data-goods-attr-id'));
                                    goods_attr_desc_array.push($(obj).find('.fl').html()+'：'+$(obj).find('.focus').html());
                                } else {
                                    post = false;
                                }
                            });
                        }
                    </script>
                    <div class="clearfix">
                        <div class="fl">数量</div>
                        <div class="fr">
                            <input class="min" type="button" value="-" />
                            <input class="txt1 number" type="text" value="1" />
                            <input class="add" type="button" value="+" />
                        </div>
                    </div>
                </div>
                <div class="evaluate">
                    <?php if(empty($goods['comments'])): ?><div class="no">该商品暂无评价</div>
                    <?php else: ?>
                        <div class="exist">
                            <ul>
                                <?php if(is_array($goods['comments'])): $i = 0; $__LIST__ = $goods['comments'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$comm): $mod = ($i % 2 );++$i;?><li>
                                        <h1>
                                            <span class="fl"><i><img src="<?php echo ($comm['head']); ?>"></i><?php echo ($comm['nickname']); ?></span>
                                            <span class="fr">
                                                <?php $__FOR_START_19242__=1;$__FOR_END_19242__=$comm['level'];for($i=$__FOR_START_19242__;$i < $__FOR_END_19242__;$i+=1){ ?><img src="/Public/Wap/img/star.png"><?php } ?>
                                            </span>
                                        </h1>
                                        <p><?php echo ($comm['content']); ?></p>
                                        <div class="pic clearfix">
                                            <?php if(is_array($comm['pictures'])): $i = 0; $__LIST__ = $comm['pictures'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$c_pic): $mod = ($i % 2 );++$i;?><a href="javascript:void(0)"><span><img src="<?php echo ($c_pic['abs_url']); ?>"></span></a><?php endforeach; endif; else: echo "" ;endif; ?>
                                        </div>
                                        <p class="date"><?php echo ($comm['create_time']); ?></p>
                                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                            </ul>
                            <h2><a href="<?php echo U('Goods/comments', array('goods_id'=>$goods['goods_id']));?>">查看更多评价<i>(<?php echo ($goods['comm_count']); ?>)</i></a></h2>
                        </div><?php endif; ?>
                </div>
                <div class="graphic">
                    <h1><span>图文详情</span></h1>
                    <p>
                        <?php echo ($goods['goods_desc']); ?>
                    </p>
                </div>
            </div>
            <div class="suspend">
                <div class="left">
                    <a href="<?php echo U('Cart/cartList');?>"><span><em><img src="/Public/Wap/img/gwc.png"></em><i class="carts"><?php echo ((isset($goods['carts']) && ($goods['carts'] !== ""))?($goods['carts']):0); ?></i></span>购物车</a>
                </div>
                <div class="right">
                    <a href="javascript:void(0);" class="item-link add-to-cart">加入购物车</a>
                </div>
            </div>
            <!--分享好友start-->
            <!--<div class="bg"></div>-->
            <!--<div class="request">
                <ul class="clearfix">
                    <li><a href="#"><img src="/Public/Wap/img/weibo.png"></a></li>
                    <li><a href="#"><img src="/Public/Wap/img/qq.png"></a></li>
                    <li><a href="#"><img src="/Public/Wap/img/space.png"></a></li>
                    <li><a href="#"><img src="/Public/Wap/img/weixin.png"></a></li>
                    <li><a href="#"><img src="/Public/Wap/img/weixin_quan.png"></a></li>
                </ul>
            </div>-->
            <!--分享好友end-->
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
        
        <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
        <script src="/Public/Wap/js/wx.init.js"></script>
        <script>
            wx_init('<?php echo C("WX_APP_ID");?>', <?php echo ($timestamp); ?>, '<?php echo ($noncestr); ?>', '<?php echo ($signature); ?>', false);
            wx.ready(function(){
                // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，
                // 则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
                wx.onMenuShareAppMessage({
                    title: '超级麻利', // 分享标题
                    desc: '<?php echo ($goods["goods_name"]); ?>', // 分享描述
                    link: 'http://cjml-wap.toocms.com/Goods/detail/goods_id/<?php echo ($goods["goods_id"]); ?>', // 分享链接
                    imgUrl: '<?php echo ($goods["pictures"][0]["abs_url"]); ?>', // 分享图标
                    type: '', // 分享类型,music、video或link，不填默认为link
                    dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
                    success: function () {
                        // 用户确认分享后执行的回调函数
                        alert('分享成功！');
                        //window.location.reload();
                        $('.bg,.share').toggle();
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                        alert('分享取消！');
                        $('.bg,.share').toggle();
                    }
                });
                wx.onMenuShareTimeline({
                    title: '超级麻利', // 分享标题
                    link: 'http://cjml-wap.toocms.com/Goods/detail/goods_id/<?php echo ($goods["goods_id"]); ?>', // 分享链接
                    imgUrl: '<?php echo ($goods["pictures"][0]["abs_url"]); ?>', // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                        alert('分享成功！');
                        $('.bg,.share').toggle();
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                        alert('分享取消！');
                        $('.bg,.share').toggle();
                    }
                });
                wx.onMenuShareQQ({
                    title: '超级麻利', // 分享标题
                    desc: '<?php echo ($goods["goods_name"]); ?>', // 分享描述
                    link: 'http://cjml-wap.toocms.com/Goods/detail/goods_id/<?php echo ($goods["goods_id"]); ?>', // 分享链接
                    imgUrl: '<?php echo ($goods["pictures"][0]["abs_url"]); ?>', // 分享图标
                    success: function () {
                        // 用户确认分享后执行的回调函数
                        alert('分享成功！');
                        $('.bg,.share').toggle();
                    },
                    cancel: function () {
                        // 用户取消分享后执行的回调函数
                        alert('分享取消！');
                        $('.bg,.share').toggle();
                    }
                });
            });
        </script>
        <script src="/Public/Wap/js/swiper-2.1.min.js"></script>
        <script src="/Public/Wap/js/cygz.js"></script>
        <script>
            $(function() {
                 var newSlideSize = function slideSize(){
                    var w = Math.ceil($(".banner_con").width());
                    $(".banner_con,.banner_cx,.banner_slide").height(w);
                };
                newSlideSize();
                $(window).resize(function(){ newSlideSize(); });
            })
        </script>
        <script type="text/javascript">
        $(function(){
            $(".add").click(function(){
                var t=$(this).parent().find('input[class*=txt1]');
                t.val(parseInt(t.val())+1)
            })
            $(".min").click(function(){
                var t=$(this).parent().find('input[class*=txt1]');
                if(parseInt(t.val())<2){return;}
                t.val(parseInt(t.val())-1)
            })
        })
        </script>
        <script type="text/javascript" src="/Public/Wap/js/common.js"></script>
        <script>
            //提示弹出层 回调方法
            function success_callback() {window.location.reload();}
            function error_callback() {}
        </script>
    
    </body>
</html>