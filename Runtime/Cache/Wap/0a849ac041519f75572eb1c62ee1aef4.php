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
                        
        <div class="left"></div>
        <div class="center sliding">超级麻利</div>
        <div class="right"><a href="<?php echo U('SiteMessage/messages');?>" class="item-link">消息
            <?php if($result['not_read'] > 0): ?><i></i><?php endif; ?></a>
        </div>
    
                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
        <div class="page-content" style="position:static">
        <div class="banner">
            <div class="banner_con">
                <div class="banner_cx" id="banner_cx">
                    <?php if(is_array($result['adverts_1'])): $i = 0; $__LIST__ = $result['adverts_1'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ad_1): $mod = ($i % 2 );++$i;?><div class="banner_slide"><a href="<?php echo ($ad_1['link_url']); ?>"><img src="<?php echo ($ad_1['abs_url']); ?>"></a></div><?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
            <div class="paging"></div>
        </div>
        <div class="index_nav">
            <div class="row">
                <div class="col-33"><a href="<?php echo U('Reservation/submitR', array('type'=>2));?>" class="item-link"><img src="<?php echo ($result['channels'][0]['abs_url']); ?>"></a></div>
                <div class="col-33"><a href="<?php echo U('Reservation/submitR', array('type'=>1));?>" class="item-link"><img src="<?php echo ($result['channels'][1]['abs_url']); ?>"></a></div>
                <div class="col-33"><a href="<?php echo U('Goods/goodsList', array('flag'=>'b'));?>" class="item-link"><img src="<?php echo ($result['channels'][2]['abs_url']); ?>"></a></div>
            </div>
            <p><a href="<?php echo U('Center/sign');?>" title="每日签到" class="ajax-get" data-cz="sign">每日签到</a></p>
        </div>
        <div class="index_advert">
            <h1>
                <span><img src="/Public/Wap/img/index_icon_1.png"></span>
                <em>温馨时刻<i>· warm moment</i></em>
            </h1>
            <p><a href="<?php echo ($result['adverts_2']['link_url']); ?>" class="item-link"><img src="<?php echo ($result['adverts_2']['abs_url']); ?>"></a></p>
        </div>
        <div class="index_find">
            <h1><span class="fl">发现美家<i>· discover beauty</i></span><span class="fr"><a href="<?php echo U('Article/artList');?>">更多</a></span></h1>
            <div class="clearfix">
                <?php if(is_array($result['articles'])): $i = 0; $__LIST__ = $result['articles'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$art): $mod = ($i % 2 );++$i;?><!--start-->
                <div class="list">
                    <div class="all">
                        <a href="<?php echo U('Article/art', array('art_id'=>$art['art_id']));?>" class="item-link">
                        <div class="content">
                            <div class="pic"><img src="<?php echo ($art['cover']); ?>"></div>
                            <div class="about"><?php echo ($art['title']); echo ($art['title']); echo ($art['title']); echo ($art['title']); ?></div>
                            <div class="price"><?php echo ($art['short_desc']); ?></div>
                        </div>
                        </a>
                    </div>
                </div>
                <!--end--><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <!--签到start-->
        <div class="bg"></div>
        <div class="sign">
            <h1><img src="/Public/Wap/img/index_05.png"></h1>
            <div class="sign-con">

            </div>
        </div>
        <!--签到end-->
        <div class="footer">
            <ul>
                <li class="focus"><a href="/"><i><img src="/Public/Wap/img/icon_01_bak.png"></i><span>首页</span></a></li>
                <li><a href="<?php echo U('Goods/goodsList');?>"><i><img src="/Public/Wap/img/icon_02.png"></i><span>商城</span></a></li>
                <li><a href="<?php echo U('Center/index');?>"><i><img src="/Public/Wap/img/icon_03.png"></i><span>我的</span></a></li>
            </ul>
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
        
        <script src="/Public/Wap/js/swiper-2.1.min.js"></script>
        <script src="/Public/Wap/js/cygz.js"></script>
        <script type="text/javascript" src="/Public/Wap/js/common.js"></script>
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
                $(".index_nav p a").click(function() {
                    $(".bg,.sign").fadeIn();
                });
                $(".bg").click(function() {
                    $(".bg,.sign").fadeOut();
                })
            })
            //提示弹出层 回调方法
            function success_callback() {}
            function error_callback() {}
        </script>
    
    </body>
</html>