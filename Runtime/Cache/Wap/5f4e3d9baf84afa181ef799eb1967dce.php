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
        <div class="center sliding">
            <?php if($_REQUEST['type'] == 1): ?>家装服务<?php endif; ?>
            <?php if($_REQUEST['type'] == 2): ?>维修安装<?php endif; ?>
        </div>
        <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content" style="background:#fff">
        <form action="<?php echo U('Reservation/submitR');?>" method="post" class="form-horizontal">
            <input type="hidden" name="type" value="<?php echo ($_REQUEST['type']); ?>">
        <div class="site consignee">
            <ul>
                <li>
                    <span class="fl">所在地区：</span>
                    <span class="fr">
                        <a href="javascript:void(0)" class="item-link area-text" onclick="getArea(1,0,'')">选择地区</a>
                    </span>
                </li>
                <input type="hidden" name="province_name" value="<?php echo ($row['province_name']); ?>" datatype="s" nullmsg="请选择省！" errormsg="请选择省！">
                <input type="hidden" name="city_name" value="<?php echo ($row['city_name']); ?>" datatype="s" nullmsg="请选择市！" errormsg="请选择市！">
                <input type="hidden" name="area_name" value="<?php echo ($row['area_name']); ?>" datatype="s" nullmsg="请选择区！" errormsg="请选择区！">
                <li>
                    <span class="fl">小区名字：</span>
                    <span class="fr">
                        <input type="text" name="address_detail" class="text" datatype="s" nullmsg="请输入小区名称！" errormsg="请输入小区名称！">
                    </span>
                </li>
                <?php if($_REQUEST['type'] == 1): ?><li>
                    <span class="fl">房屋面积：</span>
                    <span class="fr">
                        <input type="text" name="acreage" class="text" datatype="s" nullmsg="请输入房屋面积！" errormsg="请输入房屋面积！">
                    </span>
                </li><?php endif; ?>
                <?php if($_REQUEST['type'] == 2): ?><li>
                        <span class="fl">维修说明：</span>
                    <span class="fr">
                        <input type="text" name="instruction" class="text" datatype="s" nullmsg="请输入维修说明！" errormsg="请输入维修说明！">
                    </span>
                    </li><?php endif; ?>
                <li>
                    <span class="fl">联系人：</span>
                    <span class="fr">
                        <input type="text" name="contacts" class="text" datatype="s" nullmsg="请联系人姓名！" errormsg="请联系人姓名！">
                    </span>
                </li>
                <li>
                    <span class="fl">联系电话：</span>
                    <span class="fr">
                        <input type="text" name="mobile" class="text" datatype="s" nullmsg="请输入联系电话！" errormsg="请输入联系电话！">
                    </span>
                </li>
            </ul>
            <p><a href="javascript:void(0)"><input type="submit" value="提交预约" class="btn submit-btn"></a></p>
        </div>
        </form>
        <div class="add_city area-list" style="background:#fff;display: none"></div>

    </div>
    <script>
    //getArea(1,0,'');
    function getArea(reg_id,region_type,region_name) {
        if(region_type == 1) {
            $("input[name='province_name']").val(region_name);
            $("input[name='province_id']").val(reg_id);
            $('.area-text').html(region_name);
        } if(region_type == 2) {
            $("input[name='city_name']").val(region_name);
            $("input[name='city_id']").val(reg_id);
            $('.area-text').append(region_name);
        } if(region_type == 3) {
            $("input[name='area_name']").val(region_name);
            $("input[name='area_id']").val(reg_id);
            $('.area-text').append(region_name);
        }
        if(region_type == 3) {
            $('.consignee').show();
            $('.area-list').hide();
            return;
        } else {
            $('.consignee').hide();
            $('.area-list').show();
        }
        $.ajax({
            url :'<?php echo U("System/getRegion");?>', type:'post', data:{reg_id:reg_id}, dataType:'Json',
            success:function(data){
                if(data) {
                    var html = '<ul>'
                    for(var i in data.data) {
                        html += '<li onclick="getArea('+data.data[i]['reg_id']+','+data.data[i]['region_type']+',\''+data.data[i]['region_name']+'\')">' +
                        '<a href="javascript:void(0);" class="area">'+data.data[i]['region_name']+'</a>' +
                        '</li>';
                    }
                    html += '</ul>';
                    $('div.area-list').html(html);
                } else {
                    $('#page').text('没有更多数据了！！！');
                    setTimeout(function() {
                        $('#page').hide();
                    },2000);
                }
            }
        });
    }
</script>
 
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
        
    <script src="/Public/Static/validform_5.3.2/Validform_v5.3.2_min.js"></script>
    <script src="/Public/Wap/js/validform.js"></script>
    <script src="/Public/Wap/js/common.js"></script>
    <script>
        $(function() { });
        //提示弹出层 回调方法
        function success_callback() {window.location.href = '/'}
        function error_callback() {}
    </script>

    </body>
</html>