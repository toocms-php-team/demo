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
                        
    <div class="left"><a href="<?php echo U('Goods/goodsList');?>" class="back link"> <i class="icon icon-back"></i></a></div>
    <form action="<?php echo U('Goods/goodsList');?>" method="post" autocomplete="off" class="search_list">
    <div class="center sliding">
        <span class="sousou">
            <input type="text" name="keywords" class="text7" placeholder="请输入商品名称">
            <input type="button" value="" class="btn1">
        </span>
    </div>
    <div class="right"><input type="submit" value="搜索" class="btn"></div>
    </form>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <div class="search">
            <h1>推荐搜索</h1>
            <div class="content tag">
                <?php if(is_array($hots)): $i = 0; $__LIST__ = $hots;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$hot): $mod = ($i % 2 );++$i;?><a href="<?php echo U('Goods/goodsList', array('keywords'=>$hot['keywords']));?>"><?php echo ($hot['keywords']); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <h2>搜索历史</h2>
            <div class="content">
                <ul>
                    <?php if(is_array($history)): $i = 0; $__LIST__ = $history;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$his): $mod = ($i % 2 );++$i;?><li><a href="<?php echo U('Goods/goodsList', array('keywords'=>$his));?>"><?php echo ($his); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
                <?php if(!empty($history)): ?><p><a href="<?php echo U('Goods/clearHistory');?>" title="清空搜索历史" class="ajax-get">清空搜索历史</a></p><?php endif; ?>
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
        
    <script type="text/javascript" src="/Public/Wap/js/common.js"></script>
    <script>
        $(function() {
            $(".none").css("height",$(window).height()-196);
        })
        //提示弹出层 回调方法
        function success_callback() {window.location.reload();}
        function error_callback() {}
    </script>

    </body>
</html>