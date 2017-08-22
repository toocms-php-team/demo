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
    <div class="center sliding">我的地址</div>
    <div class="right"><a href="<?php echo U('Center/updAddress');?>" class="item-link">添加</a></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <div class="consignee">
            <?php if(empty($addresses)): ?><div class="none">您还没有添加过任何地址</div>
            <?php else: ?>
                <form autocomplete="off">
            <div class="exist">
                <?php if(is_array($addresses)): $i = 0; $__LIST__ = $addresses;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$adr): $mod = ($i % 2 );++$i;?><!--start-->
                <div class="list">
                    <p class="name"><span class="fl"><?php echo ($adr['contacts']); ?></span><span class="fr"><?php echo ($adr['mobile']); ?></span></p>
                    <p class="dz"><?php echo ($adr['province_name']); echo ($adr['city_name']); echo ($adr['area_name']); echo ($adr['address']); ?></p>
                    <p class="set">
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
                    </p>
                </div>
                <!--end--><?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
                </form><?php endif; ?>
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