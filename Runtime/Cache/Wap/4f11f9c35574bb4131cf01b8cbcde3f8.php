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
    <div class="center sliding">文章详情</div>
    <div class="right">
        <?php if(empty($_REQUEST['flag'])): ?><span class="c">
            <?php if($art['is_coll'] == 0): ?><a href="<?php echo U('Article/artCollection',array('art_id'=>$art['art_id'],'is_coll'=>$art['is_coll']));?>" title="收藏" class="ajax-get"><img src="/Public/Wap/img/star_collect.png" class="c_s"></a>
                <?php else: ?>
                <a href="<?php echo U('Article/artCollection',array('art_id'=>$art['art_id'],'is_coll'=>$art['is_coll']));?>" title="取消收藏" class="ajax-get"><img src="/Public/Wap/img/star_collect_bak.png" class="c_s"></a><?php endif; ?>
        </span><?php endif; ?>
    </div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="position:static">
        <div class="detail">
            <div class="de_top">
                <?php if(!empty($art['pictures'])): ?><div class="banner">
                    <div class="banner_con">
                        <div class="banner_cx" id="banner_cx">
                            <?php if(is_array($art['pictures'])): $i = 0; $__LIST__ = $art['pictures'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;?><div class="banner_slide"><a href="javascript:void(0)"><img src="<?php echo ($pic['abs_url']); ?>"></a></div><?php endforeach; endif; else: echo "" ;endif; ?>
                        </div>
                    </div>
                    <div class="paging"></div>
                </div><?php endif; ?>
                <div class="about"><?php echo ($art['title']); ?></div>
                <div class="price" style="height: 25px;"><span><?php echo ($art['short_desc']); ?></span></div>
                <div class="xq">
                    <?php echo ($art['content']); ?>
                </div>
            </div>
            <?php if(!empty($art['relation_goods'])): ?><div class="swiper-container swiper-2">
                <h1>推荐单品</h1>
                <div class="swiper-wrapper">
                    <?php if(is_array($art['relation_goods'])): $i = 0; $__LIST__ = $art['relation_goods'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><div class="swiper-slide">
                        <div class="entry">
                        <div class="all">
                            <div class="content">
                                <div class="pic">
                                    <a href="<?php echo U('Goods/detail', array('goods_id'=>$goods['goods_id']));?>" class="item-link"><img src="<?php echo ($goods['cover']); ?>"></a>
                                </div>
                                <div class="about"><?php echo ($goods['goods_name']); ?></div>
                                <div class="price"><em>￥<?php echo ($goods['price']); ?></em></div>
                            </div>
                        </div>
                        </div>
                    </div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div><?php endif; ?>
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
        
    <script>
    var mySwiper2 = myApp.swiper('.swiper-2', {
      spaceBetween: 10,
      slidesPerView: 2
    });
    </script>
    <script src="/Public/Wap/js/swiper-2.1.min.js"></script>
    <script src="/Public/Wap/js/cygz.js"></script>
    <script>
        $(function() {
             var newSlideSize = function slideSize(){
                var w = Math.ceil($(".banner_con").width()/2);
                $(".banner_con,.banner_cx,.banner_slide").height(w);
            };
            newSlideSize();
            $(window).resize(function(){
                newSlideSize();
            });
        });
    </script>
    <script type="text/javascript" src="/Public/Wap/js/common.js"></script>
    <script>
        //提示弹出层 回调方法
        function success_callback() {window.location.reload();}
        function error_callback() {}
    </script>

    </body>
</html>