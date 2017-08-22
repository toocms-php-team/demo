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
    <div class="center sliding">文章</div>
    <div class="right"><span class="n"><img src="/Public/Wap/img/nav.png"></span></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content infinite-scroll" style="position:static">
        <div class="filtrate">
            <a href="<?php echo U('Article/artList',array('art_cate_id'=>$_REQUEST['art_cate_id']));?>" <?php if(empty($_REQUEST['sort'])): ?>class="focus"<?php endif; ?>>默认</a>
            <a href="<?php echo U('Article/artList',array('art_cate_id'=>$_REQUEST['art_cate_id'],'sort'=>1));?>" <?php if($_REQUEST['sort'] == 1): ?>class="focus"<?php endif; ?>>最新发布</a>
            <a href="<?php echo U('Article/artList',array('art_cate_id'=>$_REQUEST['art_cate_id'],'sort'=>2));?>" <?php if($_REQUEST['sort'] == 2): ?>class="focus"<?php endif; ?>>浏览最多</a>
            <?php if(!in_array($_REQUEST['sort'],array(3,4)) or $_REQUEST['sort'] == 4): ?><a href="<?php echo U('Article/artList',array('art_cate_id'=>$_REQUEST['art_cate_id'],'sort'=>3));?>" <?php if($_REQUEST['sort'] == 4): ?>class="focus"<?php endif; ?>><i>收藏次数</i></a>
            <?php elseif($_REQUEST['sort'] == 3): ?>
                <a href="<?php echo U('Article/artList',array('art_cate_id'=>$_REQUEST['art_cate_id'],'sort'=>4));?>" <?php if($_REQUEST['sort'] == 3): ?>class="focus"<?php endif; ?>><i>收藏次数</i></a><?php endif; ?>
        </div>
        <div class="index_find index_fd">
            <div class="clearfix scroll-append-box">

            </div>
            <!-- 加载提示符 -->
<div class="infinite-scroll-preloader">
    <div class="preloader"></div>
</div>
        </div>
        <!--导航分类start-->
        <div class="bg"></div>
        <div class="filtrate_list" style="z-index: 100">
            <p>分类</p>
            <ul>
                <li><a href="<?php echo U('Article/artList');?>">全部</a></li>
                <?php if(is_array($cates)): $i = 0; $__LIST__ = $cates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('Article/artList', array('art_cate_id'=>$cate['art_cate_id']));?>"><?php echo ($cate['name']); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </div>
        <!--导航分类end-->
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
        var target = '<?php echo U("Article/getArticles");?>';
        function getHtml(data) {
            return '<div class="list"> ' +
            '<div class="all"> ' +
            '<div class="content"> ' +
            '<div class="pic"><a href="<?php echo U('Article/art');?>/art_id/'+data['art_id']+'" class="item-link"><img src="'+data['cover']+'"></a></div> ' +
            '<div class="about">'+data['title']+'</div> ' +
            '<div class="price"><span>'+data['short_desc']+'</span></div> ' +
            '</div> ' +
            '</div> ' +
            '</div>';
        }
        //创建ajax data参数
        function getQuery() {
            return {p:p,art_cate_id:'<?php echo ($_REQUEST["art_cate_id"]); ?>',sort:'<?php echo ($_REQUEST["sort"]); ?>'};
        }
    </script>
    <script type="text/javascript" src="/Public/Wap/js/scroll.js"></script>
    <script>
        $(function() {
            $("span.n").click(function() {
                $(".filtrate_list,.bg").fadeIn();
            });
            $(".filtrate_list a,.bg").click(function() {
                $(".filtrate_list,.bg").fadeOut();
            })
        })
    </script>

    </body>
</html>