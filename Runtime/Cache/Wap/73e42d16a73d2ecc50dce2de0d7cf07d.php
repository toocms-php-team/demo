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
    <div class="center sliding">发表评价</div>
    <div class="right"><!--<a href="#">发表</a>--></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <form action="<?php echo U('OrderInfo/comment');?>" method="post" class="form-horizontal">
            <input type="hidden" value="<?php echo ($_REQUEST['order_id']); ?>" name="order_id">
        <div class="assess">
            <?php if(is_array($goods_list)): $i = 0; $__LIST__ = $goods_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$goods): $mod = ($i % 2 );++$i;?><!--start-->
            <div class="list">
                <div class="share_list">
                    <div class="list">
                        <div class="clearfix">
                            <div class="left"><span><img src="<?php echo ($goods['cover']); ?>"></span></div>
                            <div class="right">
                                <p><?php echo ($goods['goods_name']); ?></p>
                                <span>￥<?php echo ($goods['price']); ?></span> <em><i class="fl"><?php echo ($goods['goods_attr_desc']); ?></i><i class="fr">x<?php echo ($goods['number']); ?></i></em>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" value="<?php echo ($goods['goods_id']); ?>" name="goods_id[]">
                </div>
                <div class="stars">
                    <p><em>总体评价</em>
                        <span class="level">
                            <i class="leveltit" cjmark=""></i>
                            <i class="leveltit" cjmark=""></i>
                            <i class="leveltit" cjmark=""></i>
                            <i class="leveltit" cjmark=""></i>
                            <i class="leveltit" cjmark=""></i>
                        </span>
                        <input type="hidden" value="5" class="level" name="level[]">
                    </p>
                </div>
                <div class="assess_txt">
                    <textarea name="content[]" class="textarea" placeholder="亲，说点什么吧！对他人有帮助"></textarea>
                </div>
                <div class="c_photo">
                    <p>亲，您可上传4张图片哦!</p>
                    <div class="pn clearfix">
                        <div class="c_pic">
                            <ul class="clearfix file-box-<?php echo ($goods['goods_id']); ?>">

                            </ul>
                        </div>
                        <div class="c_btn">
                            <span class="pic<?php echo ($goods['goods_id']); ?>"><input type="button" value="" class="btn3"></span>
                        </div>
                    </div>
                </div>
                <input type="hidden" value="" class="pictures-input<?php echo ($goods['goods_id']); ?>" name="pictures[]">
            </div>
            <!--end-->
                <script>
                    $(document).ready(function(){
                        var uploader<?php echo ($goods["goods_id"]); ?> = WebUploader.create({
                            // 选完文件后，是否自动上传。
                            auto: true,
                            // swf文件路径
                            swf: '/Public/webuploader/Uploader.swf',
                            // 文件接收服务端。
                            server: '<?php echo U("UpDownLoad/upload", array("save_path"=>"Goods"));?>',
                            //提交信息
                            formData: {goods_id:'<?php echo ($goods["goods_id"]); ?>'},
                            // 选择文件的按钮。可选。
                            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                            pick: {
                                id: '.pic<?php echo ($goods["goods_id"]); ?>',
                                multiple : false
                            },
                            // 只允许选择图片文件。
                            accept: {
                                title: 'Images',
                                extensions: 'gif,jpg,jpeg,bmp,png',
                                mimeTypes: 'image/*'
                            },
                            duplicate: true
                        });
                        // 当有文件添加进来的时候
                        uploader<?php echo ($goods["goods_id"]); ?>.on( 'fileQueued', function( file ) {
                            var ids = [];
                            $(".file-box-<?php echo ($goods['goods_id']); ?>").find('li').each(function(){
                                ids.push($(this).attr('val'));
                            });
                            if(ids.length > 3) {
                                uploader<?php echo ($goods["goods_id"]); ?>.cancelFile( file ); return false;
                            }
                            $('.file-box-<?php echo ($goods["goods_id"]); ?>').append('<li class="loading"><span><i><img src="/Public/Wap/img/loading.gif"></i></span></li>');
                        });
                        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
                        uploader<?php echo ($goods["goods_id"]); ?>.on( 'uploadSuccess', function( file,data ) {
                            if(data.status){
                                $('.loading').remove();
                                var html = '<li val="'+data.id+'">' +
                                        '<span><i><img src="'+data.abs_url+'"></i><em onclick="removeFile<?php echo ($goods["goods_id"]); ?>(this)"><img src="/Public/Wap/img/del.png"></em></span>' +
                                        '</li>';
                                $('.file-box-<?php echo ($goods["goods_id"]); ?>').append(html);
                                setFileIds<?php echo ($goods["goods_id"]); ?>();
                            } else {
                                showPop(data.info, 'error', 1500, '');
                            }
                        });
                        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
                        uploader<?php echo ($goods["goods_id"]); ?>.on( 'uploadProgress', function( file,data ) {
                            //$('.file-box-<?php echo ($goods["goods_id"]); ?>').append('<li class="loading"><span><i><img src="/Public/Wap/img/loading.gif"></i></span></li>');
                        });
                    });
                    //删除文件
                    function removeFile<?php echo ($goods["goods_id"]); ?>(o){
                        $(o).parent().parent().remove();
                        setFileIds<?php echo ($goods["goods_id"]); ?>();
                    }
                    //重置ids
                    function setFileIds<?php echo ($goods["goods_id"]); ?>(){
                        var ids = [];
                        $(".file-box-<?php echo ($goods['goods_id']); ?>").find('li').each(function(){
                            ids.push($(this).attr('val'));
                        });
                        if(ids.length > 0)
                            $(".pictures-input<?php echo ($goods['goods_id']); ?>").val(ids.join(','));
                        else
                            $(".pictures-input<?php echo ($goods['goods_id']); ?>").val('');
                    }
                </script><?php endforeach; endif; else: echo "" ;endif; ?>
        </div>
            <p><a href="javascript:void(0)">
                <input type="submit" value="提交评价" class="btn submit-btn"></a>
            </p>
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
        
    <script src='/Public/Wap/js/webuploader.js'></script>
    <link rel="stylesheet" href="/Public/Wap/css/webuploader.css">
    <script src="/Public/Static/validform_5.3.2/Validform_v5.3.2_min.js"></script>
    <script src="/Public/Wap/js/validform.js"></script>
    <script src="/Public/Wap/js/common.js"></script>
    <script>
        $(function() { });
        //提示弹出层 回调方法
        function success_callback() {}
        function error_callback() {}
    </script>
    <script>
        $(function() {
            $(document).on('mouseover','i[cjmark]',function(){
                var num = $(this).index();
                var pmark = $(this).parents('.stars');
                var mark = pmark.prevAll('input');
                if(mark.prop('checked')) return false;
                var list = $(this).parent().find('i');
                for(var i=0;i<=num;i++){
                    list.eq(i).attr('class','leveltit');
                }
                for(var i=num+1,len=list.length-1;i<=len;i++){
                    list.eq(i).attr('class','levelbot');
                }
                $(this).parent().next().val([num+1]);
            });
        })
    </script>

    </body>
</html>