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
    <div class="center sliding">个人信息</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <div class="homepage">
            <div class="portrait">
                <div class="pt_head clearfix">
                    <span class="fl">头像</span>
                    <span class="fr ig"><a href="#" class="item-link"><img src="<?php echo ($info['head']); ?>"></a></span>
                </div>
                <hr class="comment_line">
                <ul>
                    <li><a href="<?php echo U('Center/modifyInfo');?>" class="item-link"><span class="fl">昵称</span><span class="fr"><?php echo ($info['nickname']); ?></span></a></li>
                    <li><a href="<?php echo U('Center/modifyPass');?>" class="item-link"><span class="fl">修改登录密码</span><span class="fr"></span></a></li>
                    <li><a href="<?php echo U('Center/modifyAccount/step/1');?>" class="item-link"><span class="fl">已绑定手机号码</span><span class="fr"><?php echo ($info['account']); ?></span></a></li>
                </ul>
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
        
    <script src='/Public/Wap/js/webuploader.js'></script>
    <link rel="stylesheet" href="/Public/Wap/css/webuploader.css">
    <script>
        $(document).ready(function(){
            var uploader = WebUploader.create({
                // 选完文件后，是否自动上传。
                auto: true,
                // swf文件路径
                swf: '/Public/webuploader/Uploader.swf',
                // 文件接收服务端。
                server: '<?php echo U("Center/modifyHead");?>',
                // 选择文件的按钮。可选。
                // 内部根据当前运行是创建，可能是input元素，也可能是flash.
                pick: {
                    id: '.ig',
                    multiple : false
                },
//      fileSingleSizeLimit:500*1024,
                // 只允许选择图片文件。
                accept: {
                    title: 'Images',
                    extensions: 'gif,jpg,jpeg,bmp,png',
                    mimeTypes: 'image/*'
                },
                duplicate: true
            });

            // 当有文件添加进来的时候
            uploader.on( 'fileQueued', function( file ) {
                $('.ig img').attr('src','/Public/Wap/img/loading.gif');
//            var $li = $(
//                            '<div id="' + file.id + '" class="file-item thumbnail">' +
//                            '<img id="img_crop">' +
//                            '</div>'
//                    ),
//                    $img = $li.find('img');
//
//            // 创建缩略图
//            // 如果为非图片文件，可以不用调用此方法。
//            // thumbnailWidth x thumbnailHeight 为 100 x 100
//            uploader.makeThumb( file, function( error, src ) {
//                if ( error ) {
//                    $img.replaceWith('<span>不能预览</span>');
//                    return;
//                }
//                $img.attr( 'src', src );
//                $('#pic_show #img').html( $img );
//
//                $("html,body").animate({scrollTop:0});
//                crop();         //裁切上传图片
//            },1,1);
//            $('.main').hide();
//            $('#pic_show').show();
//            cover = $('input[name="m_head"]').val();
            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on( 'uploadSuccess', function( file,data ) {
                //alert(data.head);
                $('.ig img').attr('src',data.head);
                //$('input[name="head_pic"]').val(data.file);
                //$('.ig img').attr('src',data.url);
                //$('input[name="img_w"]').val($('#img_crop').css('width'));
                //$('input[name="img_h"]').val($('#img_crop').css('height'));
            });

            // 文件上传成功，给item添加成功class, 用样式标记上传成功。
            uploader.on( 'uploadProgress', function( file,data ) {
                $('.ig img').attr('src','/Public/Wap/img/loading.gif');
                //<img src="__WEBPUBLIC__/Wap/images/default_head_1.png">
                //alert(0);
                //$('input[name="head_pic"]').val('111');
                //$('input[name="img_w"]').val($('#img_crop').css('width'));
                //$('input[name="img_h"]').val($('#img_crop').css('height'));
            });
        });
    </script>

    </body>
</html>