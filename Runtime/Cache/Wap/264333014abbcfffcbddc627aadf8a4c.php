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
    <div class="center sliding">添加地址</div>
    <div class="right"></div>

                    </div>
                </div>
                <div class="pages navbar-through toolbar-through">
                    <div data-page="index" class="page">
                        
    <div class="page-content">
        <form action="<?php echo U('Center/updAddress');?>" method="post" class="form-horizontal" autocomplete="off">
        <input type="hidden" class="text" name="adr_id" value="<?php echo ($row['adr_id']); ?>">
        <div class="consignee">
            <p class="a">
                <span>
                    <em class="fl">联系人：</em>
                    <em class="fr">
                        <input type="text" class="text" name="contacts" value="<?php echo ($row['contacts']); ?>" datatype="s1-9" nullmsg="请输入联系人！" errormsg="联系人格式不正确！">
                    </em>
                </span>
            </p>
            <p class="a">
                <span>
                    <em class="fl">手机号码：</em>
                    <em class="fr">
                        <input type="text" class="text" name="mobile" value="<?php echo ($row['mobile']); ?>" datatype="m" nullmsg="请输入手机号码！" errormsg="手机号码格式不正确！">
                    </em>
                </span>
            </p>
            <p class="a">
                <span>
                    <em class="fl">所在地址：</em>
                    <em class="fr">
                        <a href="javascript:void(0)" onclick="getArea(1,0,'')" class="area-text"><?php echo ($row['province_name']); echo ($row['city_name']); echo ($row['area_name']); ?></a>
                        <input type="hidden" name="province_name" value="<?php echo ($row['province_name']); ?>" datatype="s" nullmsg="请选择省！" errormsg="请选择省！">
                        <input type="hidden" name="province_id" value="<?php echo ($row['province_id']); ?>" datatype="s" nullmsg="请选择省！" errormsg="请选择省！">
                        <input type="hidden" name="city_name" value="<?php echo ($row['city_name']); ?>" datatype="s" nullmsg="请选择市！" errormsg="请选择市！">
                        <input type="hidden" name="city_id" value="<?php echo ($row['city_id']); ?>" datatype="s" nullmsg="请选择市！" errormsg="请选择市！">
                        <input type="hidden" name="area_name" value="<?php echo ($row['area_name']); ?>" datatype="s" nullmsg="请选择区！" errormsg="请选择区！">
                        <input type="hidden" name="area_id" value="<?php echo ($row['area_id']); ?>" datatype="s" nullmsg="请选择区！" errormsg="请选择区！">
                    </em>
                </span>
            </p>
            <p class="a">
                <span>
                    <em class="fl">详细地址：</em>
                    <em class="fr">
                        <input type="text" class="text" name="address" value="<?php echo ($row['address']); ?>" datatype="s1-30" nullmsg="请输入详细地址！" errormsg="详细地址格式不正确！">
                    </em>
                </span>
            </p>
            <p class="b">
                <input type="checkbox" id="checkbox-2" class="choice_box1" name="is_default" value="1" <?php if($row['is_default'] == 1): ?>checked='checked'<?php endif; ?>/>
                <label for="checkbox-2"></label>设为默认地址
            </p>
            <p class="c">
                <input type="submit" value="保存" class="btn submit-btn">
            </p>
        </div>
            <input type="hidden" name="flag" value="<?php echo ($_REQUEST['flag']); ?>">
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
        
    <script src="/Public/Static/validform_5.3.2/Validform_v5.3.2_min.js"></script>
    <script src="/Public/Wap/js/validform.js"></script>
    <script src="/Public/Wap/js/common.js"></script>
    <script>
        $(function() { });
        //提示弹出层 回调方法
        function success_callback() {}
        function error_callback() {}
    </script>

    </body>
</html>