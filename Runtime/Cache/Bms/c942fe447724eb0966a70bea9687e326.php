<?php if (!defined('THINK_PATH')) exit();?><!--避免重复加载-->
<?php if($plugins_param['is_first'] == 1): ?><script type="text/javascript" src="/Public/Static/uploadify/jquery.uploadify.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/Public/Static/uploadify/uploadify.css" media="all">
    <script type="text/javascript" src="/Public/Static/jquery.dragsort-0.5.1.min.js"></script><?php endif; ?>
<input type="file" name="upload_file_<?php echo ($plugins_param['unique_sign']); ?>" id="upload_file_<?php echo ($plugins_param['unique_sign']); ?>">
<input type="hidden" name="<?php echo ($plugins_param['field_name']); ?>" id="upload_file_input_<?php echo ($plugins_param['unique_sign']); ?>" value=""/>
<div class="upload-file-box upload-file-box-<?php echo ($plugins_param['unique_sign']); ?> img-enlarge-box">
    <?php $files = $plugins_param['field_value']; ?>
    <!--判断是传文件还是图片-->
    <?php if(!empty($files)): if(empty($plugins_param['type']) or ($plugins_param['type'] == 'picture')): if(is_array($files)): foreach($files as $key=>$file): ?><div class="upload-pre-item" val="<?php echo ($file['id']); ?>">
                    <img src="<?php echo ($file['path']); ?>" class="img-enlarge"/>
                    <i class="fa fa-remove" onclick="removeFile<?php echo ($plugins_param['unique_sign']); ?>(this)"></i>
                </div><?php endforeach; endif; ?>
        <?php else: ?>
            <?php if(is_array($files)): foreach($files as $key=>$file): ?><div class="upload-pre-item" val="<?php echo ($file['id']); ?>">
                    <a href="<?php echo U('UpDownLoad/download',array('id'=>$file['id']));?>"><?php echo ($file['name']); ?></a>
                    <i class="fa fa-remove" onclick="removeFile<?php echo ($plugins_param['unique_sign']); ?>(this)"></i>
                </div><?php endforeach; endif; endif; endif; ?>
</div>
<div class="clear"></div>
<script type="text/javascript">
    var queue_limit_<?php echo ($plugins_param['unique_sign']); ?> = '<?php echo ($plugins_param["queue_limit"]); ?>',
            type_<?php echo ($plugins_param['unique_sign']); ?> = '<?php echo ($plugins_param["type"]); ?>',
            file_type_exts<?php echo ($plugins_param['unique_sign']); ?> = '<?php echo ($plugins_param["exts"]); ?>';
    queue_limit_<?php echo ($plugins_param['unique_sign']); ?> == '' ? queue_limit_<?php echo ($plugins_param['unique_sign']); ?> = 1 : '';
    file_type_exts<?php echo ($plugins_param['unique_sign']); ?> != '' ? file_type_exts<?php echo ($plugins_param['unique_sign']); ?>='*.'+file_type_exts<?php echo ($plugins_param['unique_sign']); ?> : '';
    file_type_exts<?php echo ($plugins_param['unique_sign']); ?> == '' && '<?php echo ($plugins_param["type"]); ?>'=='attachment' ? file_type_exts<?php echo ($plugins_param['unique_sign']); ?> = '*.zip;*.rar;*.tar;*.gz;*.7z;*.doc;*.docx;*.txt;*.xml;*.xls' : '';
    file_type_exts<?php echo ($plugins_param['unique_sign']); ?> == '' && ('<?php echo ($plugins_param["type"]); ?>'=='picture'||'<?php echo ($plugins_param["type"]); ?>'=='') ? file_type_exts<?php echo ($plugins_param['unique_sign']); ?> = "*.jpg;*.gif;*.png;*.jpeg" : '';
    /* 初始化上传插件 */
    $("#upload_file_<?php echo ($plugins_param['unique_sign']); ?>").uploadify({
        //"auto" : true, //默认值true
        //"buttonClass" : "", //string 默认值 ""
        //"buttonCursor" : "pointer", //string 默认值 hand
        //"buttonImage" : "",//string 默认值 null
        //"checkExisting" : "",//string 默认值 false
        //"debug" : false,//boolean  默认值false
        //"fileSizeLimit" : "", //number
        //"fileTypeDesc" : "",//string  默认值All Files
        "fileTypeExts" : file_type_exts<?php echo ($plugins_param['unique_sign']); ?>,//string 默认值*.*
        //"formData" : {},  //json //默认值
        //"method" : "",//默认值post
        //"multi" : false, //一次能选几个文件 false只能选一个//默认值true
        //"removeCompleted" : true,  //成功后是否移除//默认值true
        //"successTimeout" : 30, //等待服务器响应时间成功后//默认值30
        //"uploadLimit" : 999,//默认值999 一次允许上传数量
        "height"          : <?php echo ($plugins_config['height']); ?>,
        "swf"             : "/Public/Static/uploadify/uploadify.swf",
        "fileObjName"     : "fileData",  //string 默认值fileData
        "buttonText"      : "上传文件",
        "uploader"        : "<?php echo U('UpDownLoad/upload',array('session_id'=>session_id(),'type'=>$plugins_param['type'],'save_path'=>$plugins_param['save_path'],'exts'=>$plugins_param['exts'],'max_size'=>$plugins_param['max_size'],'is_water'=>$plugins_param['is_water'],'is_thumb'=>$plugins_param['is_thumb'],'thumb_width'=>$plugins_param['thumb_width'],'thumb_height'=>$plugins_param['thumb_height'],'thumb_prefix'=>$plugins_param['thumb_prefix'],'thumb_suffix'=>$plugins_param['thumb_suffix']));?>",
        "width"           : <?php echo ($plugins_config['width']); ?>,
        'removeTimeout'	  : 0.5, //默认值3
        'queueSizeLimit'  : queue_limit_<?php echo ($plugins_param['unique_sign']); ?>, //默认值999
        //"onUploadStart"   : function(file) {alert(0); return false;},
        "onUploadSuccess" : uploadPicture<?php echo ($plugins_param['unique_sign']); ?>, //file,data,response

        //"onCancel" : function(file) {},
        //"onClearQueue" : function(queueItemCount) {},
        //"onDestroy" : function() {},
        //"onDialogClose" : function(queueData) {},
        //"onDialogOpen" : function() {},
        //"onDisable" : function() {},
        //"onEnable" : function() {},
        //"onSWFReady" : function() {},
        //"onUploadComplete" : function(file) {},
        //"onUploadError" : function(file,errorCode,errorMsg,errorString) {},
        //"onUploadProgress" : function(file,bytesUploaded,bytesTotal) {},
        //"onInit" : function(instance) {},
        //"onQueueComplete" : function(queueData) {},
        //"onSelect" : function(file) {alert(0); return false;}
        //"onSelectError" : function() {},
        "onFallback" : function() {
            alert('未检测到兼容版本的Flash.');
        }
    });

    function uploadPicture<?php echo ($plugins_param['unique_sign']); ?>(file, data){
        var data = $.parseJSON(data);
        var src = '';
        if(data.status){
            //判断是图片还是文件 显示方式不同
            var html = '<div class="upload-pre-item" val="' + data.id + '">';
            if (type_<?php echo ($plugins_param['unique_sign']); ?> == '' || type_<?php echo ($plugins_param['unique_sign']); ?> == 'picture') {
                src = data.url || '' + data.path;
                html += '<img src="' + src + '" class="img-enlarge"/>';
            } else {
                html += '<a href="'+data.download_url+'">'+data.name+'</a>';
            }
            html += '<i class="fa fa-remove" onclick="removeFile<?php echo ($plugins_param['unique_sign']); ?>(this)"></i></div>';

            if(queue_limit_<?php echo ($plugins_param['unique_sign']); ?> == 1) {
                //单个文件
                $("#upload_file_<?php echo ($plugins_param['unique_sign']); ?>").parent().find('.upload-file-box').html(html);
            } else {
                //多个文件
                $("#upload_file_<?php echo ($plugins_param['unique_sign']); ?>").parent().find('.upload-file-box').append(html);
            }
            setFileIds<?php echo ($plugins_param['unique_sign']); ?>();
        } else {
            updateAlert(data.info,'alert-error');
            setTimeout(function(){
                $('.alert').hide();
            },2500);
        }
    }
    //删除文件
    function removeFile<?php echo ($plugins_param['unique_sign']); ?>(o){
        var p = $(o).parent().parent();
        $(o).parent().remove();
        setFileIds<?php echo ($plugins_param['unique_sign']); ?>();
    }
    //重置ids
    function setFileIds<?php echo ($plugins_param['unique_sign']); ?>(){
        var ids = [];
        $("#upload_file_<?php echo ($plugins_param['unique_sign']); ?>").parent().find('.upload-file-box').find('.upload-pre-item').each(function(){
            ids.push($(this).attr('val'));
        });
        if(ids.length > 0)
            $("#upload_file_input_<?php echo ($plugins_param['unique_sign']); ?>").val(ids.join(','));
        else
            $("#upload_file_input_<?php echo ($plugins_param['unique_sign']); ?>").val('');
    }
    setFileIds<?php echo ($plugins_param['unique_sign']); ?>();

    $(".upload-file-box-<?php echo ($plugins_param['unique_sign']); ?>").dragsort({
        dragSelector:'div',
        placeHolderTemplate: '<div class="upload-pre-item">&nbsp;</div>',
        dragEnd:function(){setFileIds<?php echo ($plugins_param['unique_sign']); ?>();}
    });
</script>