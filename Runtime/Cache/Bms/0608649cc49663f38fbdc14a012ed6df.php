<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
	<head>
		<title><?php echo ($content_header); ?>--晟轩科技--后台管理系统</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!--基本-->
		<!--<link rel="stylesheet" href="/Public/Bms/css/bootstrap.1.0.min.css" />-->
        <link rel="stylesheet" href="/Public/Bms/css/bootstrap.2.3.2.min.css" />
        <link rel="stylesheet" href="/Public/Bms/css/font-awesome-4.4.0/font-awesome.min.css" />
        <link rel="stylesheet" href="/Public/Bms/css/unicorn.main.min.css" />
        <link rel="stylesheet" href="/Public/Bms/css/unicorn.<?php echo C('BACK_STYLE');?>.min.css" class="skin-color" />
        <!--基本-->
        <!--表单表格-->
        <link rel="stylesheet" href="/Public/Bms/css/uniform.min.css" />
        <!--表单表格-->
        <!--扩展样式-->
        <link rel="stylesheet" href="/Public/Bms/css/custom.css" />
        <!--扩展样式-->
        <!--弹出提示框-->
        <link rel="stylesheet" href="/Public/Bms/css/jquery.gritter.min.css" />
        <!--弹出提示框-->
        <!--jquery-->
        <script src="/Public/Static/jquery.min.js"></script>
        <!--jquery-->
        
        
	</head>
	<body>

        <!--logo-->
		<div id="header">
			<h1><a href="./dashboard.html"></a></h1>
		</div>

        <!--右侧 管理员 退出-->
		<div id="user-nav" class="navbar navbar-inverse">
            <ul class="nav btn-group">
                <li class="btn btn-inverse">
                    <a title="" href="javascript:void(0)">
                        <i class="fa fa-user font-size-13"></i> <span class="text"><?php echo session('admin.account');?></span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="<?php echo U('Administrator/rePass');?>">
                        <i class="fa fa-lock font-size-13"></i> <span class="text">修改密码</span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="<?php echo U('System/clearCache');?>" class="ajax-get no-refresh">
                        <i class="fa fa-trash font-size-13"></i> <span class="text">清除缓存</span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="#help" data-toggle="modal">
                        <i class="fa fa-question font-size-13"></i> <span class="text">帮助</span>
                    </a>
                </li>
                <li class="btn btn-inverse">
                    <a title="" href="<?php echo U('Login/logOut');?>">
                        <i class="fa fa-power-off font-size-13"></i> <span class="text">退出</span>
                    </a>
                </li>
            </ul>
        </div>
        <div id="help" class="modal hide" style="z-index: 99999999">
    <div class="modal-header">
        <button data-dismiss="modal" class="close" type="button">×</button>
        <h3>帮助信息</h3>
    </div>
    <div class="modal-body">
        <p>一、双击文本框可清空内容！</p>
        <p>二、列表中头部标题存在“<i class="fa fa-pencil"></i>”的列可双击修改！</p>
        <p>三、带有“*”的表单为必填信息</p>
        <p>四、文档信息管理中“注册协议”、“车位出租协议”、“关于我们”三个文档请勿删除</p>
        <p>五、图标展示地址：<a href="http://9iphp.com/fa-icons" target="_blank">http://9iphp.com/fa-icons</a></p>
        <p>六、图片拖动可以排序，排序后不要忘记保存哦！</p>
        <p>七、“系统配置”中的内容不可更改，否则会影响整个网站的访问！</p>
    </div>
</div>
        <!--菜单 start-->
		<div id="sidebar">
			<ul>
                <?php if(is_array($menus)): $i = 0; $__LIST__ = $menus;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$menu): $mod = ($i % 2 );++$i;?><li class="<?php if(!empty($menu['_child'])): ?>submenu<?php endif; ?> <?php echo ($menu['group']['class']); ?>">
                    <!--菜单组-->
                        <a <?php if(empty($menu['_child'])): ?>href="<?php echo (U($menu['group']['url'])); ?>"<?php endif; ?>>
                            <i class="fa <?php echo ($menu['group']['icon']); ?>"></i>
                            <span><?php echo ($menu['group']['title']); ?></span>
                            <?php if(count($menu['_child']) > 0): ?><span class="label"><?php echo count($menu['_child']);?></span><?php endif; ?>
                        </a>
                    <!--菜单组-->
                    <!--子菜单-->
                        <?php if(!empty($menu['_child'])): ?><ul <?php if(($menu['group']['class']) == "active"): ?>style="display: block"<?php endif; ?>>
                            <?php if(is_array($menu['_child'])): $i = 0; $__LIST__ = $menu['_child'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$child): $mod = ($i % 2 );++$i;?><li class="<?php echo ($child['class']); ?>"><a href="<?php echo (U($child['url'])); ?>"><?php echo ($child['title']); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
                        </ul><?php endif; ?>
                    <!--子菜单-->
                    </li>
                    </notempty><?php endforeach; endif; else: echo "" ;endif; ?>
			</ul>
		</div>
        <!--菜单 end-->

        <div id="style-switcher">
            <i class="fa fa-arrow-left" style="color:#fff;height:25px;vertical-align:middle"></i>
            <span>Style:</span>
            <a href="<?php echo U('Config/quickEdit',array('model'=>'Config','ids'=>54,'field'=>'value','value'=>'grey'));?>" style="background-color: #555555;" class="ajax-get"></a>
            <a href="<?php echo U('Config/quickEdit',array('model'=>'Config','ids'=>54,'field'=>'value','value'=>'blue'));?>" style="background-color: #2D2F57;" class="ajax-get"></a>
            <a href="<?php echo U('Config/quickEdit',array('model'=>'Config','ids'=>54,'field'=>'value','value'=>'red'));?>" style="background-color: #673232;" class="ajax-get"></a>
        </div>

        <!--主体内容-->
		<div id="content">
            <div id="content-header">
                <h1><?php echo ($content_header); ?></h1>
                <div class="btn-group">
                    <!--<a href="<?php echo U('Withdraw/index',array('status'=>0));?>" class="btn btn-large tip-bottom refresh no-handle-withdraw" title="未处理提现">
                        <i class="fa fa-credit-card"></i>
                    </a>
                    <a class="btn btn-large tip-bottom refresh no-read-message" title="消息">
                        <i class="fa fa-envelope-square"></i>
                    </a>-->
                    <a class="btn btn-large tip-bottom refresh" title="刷新"><i class="fa fa-refresh"></i></a>
                </div>
            </div>

            <!--导航-->
            <div id="breadcrumb">
                <a href="<?php echo U('Index/index');?>" title="" class=""><i class="fa fa-home font-size-14"></i> 首页</a>
                <a href="javascript:void(0)" class=""><?php echo ($content_header); ?></a>
                <a href="javascript:void(0)" class=""><?php echo ($breadcrumb_nav); ?></a>
            </div>

            <div class="alert top-alert" style="display:none;position:fixed;z-index:10000000;width:100%;padding: 11px 35px 11px 14px;top:112px;border-radius: 0px;">
	<button class="close" data-dismiss="alert"></button>
	<strong></strong>
</div>
<!--<div class="alert alert-success" style="display: none">
	<button class="close" data-dismiss="alert">×</button>
	<strong>Success!</strong>
</div>
<div class="alert alert-info" style="display: none">
	<button class="close" data-dismiss="alert">×</button>
	<strong>Info!</strong>
</div>
<div class="alert alert-error" style="display: none">
	<button class="close" data-dismiss="alert">×</button>
	<strong>Error!</strong>
</div>-->

            <div class="container-fluid">

                

    <div class="row-fluid main-row-fluid">

        <div class="span12">
            <div class="widget-box">
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#tab1">编辑信息</a></li>
                    <li class=""><a data-toggle="tab" href="#tab2">其他信息</a></li>
                    <li class=""><a data-toggle="tab" href="#tab3">他的管家</a></li>
                </ul>
                <!--<div class="widget-title"></div>-->
                <br>
                <div class="widget-content tab-content no-padding">
                    <div id="tab1" class="tab-pane active">
                        <form class="form-horizontal text-height-27-form" method="post" action="<?php echo U('Member/update');?>">
                            <input type="hidden" name="model" value="Member">
                            <input type="hidden" name="id" value="<?php echo ($row['id']); ?>">
                            <div class="control-group">
                                <label class="control-label">账号</label>
                                <div class="controls">
                                    <input type="text" name="account" value="<?php echo ($row['account']); ?>" class="number-only text-width-30" maxlength="11">
                                    <span class="help-block">* 用户的登录账号，手机号</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">登陆密码</label>
                                <div class="controls">
                                    <input type="text" name="password" value="" class="text-width-30" maxlength="18">
                                    <span class="help-block">* 用户的登录密码，6-18位</span>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label">昵称</label>
                                <div class="controls">
                                    <input type="text" name="nickname" value="<?php echo ($row['nickname']); ?>" class="text-width-30" maxlength="15">
                                    <span class="help-block">* 昵称，15个字符以内</span>
                                </div>
                            </div>
                            <div class="form-actions">
                                <button class="btn" onclick="javascript:history.back(-1);return false;">返 回</button>　
                                <button class="btn btn-info ajax-post" target-form="form-horizontal" type="submit">保 存</button>
                            </div>
                        </form>
                    </div>
                    <div id="tab2" class="tab-pane">
                        <div class="invoice-content">
                            <div class="invoice-head invoice-left">
                                <table style="margin-top:0;width:70%">
                                    <tr>
                                        <td>
                                            <div class="invoice-meta">
                                                登录账号<span class="invoice-number"></span>
                                            </div>
                                        </td>
                                        <td><div class="invoice-meta">昵称</div></td>
                                        <td><div class="invoice-meta">积分</div></td>
                                    </tr>
                                    <tr>
                                        <td><h5><?php echo ($row['account']); ?></h5></td>
                                        <td><h5><?php echo ((isset($row['nickname']) && ($row['nickname'] !== ""))?($row['nickname']):'---'); ?></h5></td>
                                        <td><h5><?php echo ($row['integral']); ?></h5></td>
                                    </tr>
                                    <tr>
                                        <td><div class="invoice-meta">登陆次数</div></td>
                                        <td><div class="invoice-meta">最后登录IP</div></td>
                                        <td><div class="invoice-meta">最后登录时间</div></td>
                                    </tr>
                                    <tr>
                                        <td><h5><?php echo ($row['login']); ?> 次</h5></td>
                                        <td><h5><?php echo long2ip($row['last_login_ip']);?></h5></td>
                                        <td><h5><?php echo (timestamp2date($row['last_login_time'])); ?></h5></td>
                                    </tr>
                                    <tr>
                                        <td><div class="invoice-meta">注册IP</div></td>
                                        <td><div class="invoice-meta">注册时间</div></td>
                                        <td><div class="invoice-meta">最后修改时间</div></td>
                                    </tr>
                                    <tr>
                                        <td><h5><?php echo long2ip($row['register_ip']);?></h5></td>
                                        <td><h5><?php echo (timestamp2date($row['create_time'])); ?></h5></td>
                                        <td><h5><?php echo (timestamp2date($row['update_time'])); ?></h5></td>
                                    </tr>
                                </table>
                                <br>
                                <!--<div class="invoice-meta">
                                    <i class="fa fa-area-chart"></i> 相关统计<span class="invoice-number"></span>
                                </div>
                                <h5>
                                    <br>
                                    <ul class="stat-boxes">
                                        
                                        
                                        
                                    </ul>
                                    <div class="clear"></div>
                                </h5>-->
                            </div>
                            <div class="invoice-head invoice-right">
                                <div class="invoice-meta">
                                    <i class="fa fa-user"></i> 头像<span class="invoice-number"></span>
                                </div>
                                <h5><img src="<?php echo ((isset($row['head_path']) && ($row['head_path'] !== ""))?($row['head_path']):'/Uploads/Head/default.jpg'); ?>" class="img-circle" width="200"></h5>
                                <!--<div class="invoice-meta">
                                    <i class="fa fa-credit-card"></i> 银行卡信息<span class="invoice-number"></span>
                                </div>
                                <h5>
                                    <?php if(empty($row['cards'])): ?><div class="credit-card float-left">未添加</div><?php endif; ?>
                                    <?php if(is_array($row['cards'])): $i = 0; $__LIST__ = $row['cards'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$card): $mod = ($i % 2 );++$i;?><div class="credit-card float-left">
                                            &lt;!&ndash;<img src="<?php echo (get_bank_icon($card['bank_short'])); ?>" width="24">&ndash;&gt; <?php echo ($card['bank_name']); ?> <br><?php echo (format_card_number($card['card_number'])); ?><br><?php echo ($card['open_name']); ?> <br> <?php echo ($card['mobile']); ?>
                                        </div><?php endforeach; endif; else: echo "" ;endif; ?>
                                    <div class="clear"></div>
                                </h5>-->
                                <br>
                                <button class="btn" onclick="javascript:history.back(-1);return false;">返 回</button>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div id="tab3" class="tab-pane">
                        <div class="invoice-content">
                            <?php if(empty($row['kp_name'])): ?>未分配管家！
                            <?php else: ?>
                            <div class="invoice-head invoice-left">
                                <table style="margin-top:0;width:70%">
                                    <tr>
                                        <td><div class="invoice-meta">昵称</div></td>
                                        <td><div class="invoice-meta">电话</div></td>
                                    </tr>
                                    <tr>
                                        <td><h5><?php echo ((isset($row['kp_name']) && ($row['kp_name'] !== ""))?($row['kp_name']):'---'); ?></h5></td>
                                        <td><h5><?php echo ((isset($row['kp_mobile']) && ($row['kp_mobile'] !== ""))?($row['kp_mobile']):'---'); ?></h5></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="invoice-head invoice-right">
                                <div class="invoice-meta">
                                    <i class="fa fa-user"></i> 头像<span class="invoice-number"></span>
                                </div>
                                <h5><img src="<?php echo ((isset($row['kp_head_path']) && ($row['kp_head_path'] !== ""))?($row['kp_head_path']):'/Uploads/Head/default.jpg'); ?>" class="img-circle" width="200"></h5>
                                <br>
                                <button class="btn" onclick="javascript:history.back(-1);return false;">返 回</button>
                            </div><?php endif; ?>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


                <div class="row-fluid">
                    <div id="footer" class="span12">
                        Copyright TooCMS © 2015 <a href="http://www.toocms.com" target="_blank">晟轩网络科技有限公司</a>
                    </div>
                </div>
            </div>
		</div>

        <!--基本-->
        <script src="/Public/Bms/js/bootstrap.min.js"></script>
        <script src="/Public/Bms/js/unicorn.min.js"></script>
        <!--基本-->
        <!--表单加载-->
        <script src="/Public/Bms/js/jquery.uniform.min.js"></script>
        <!--表单加载-->
        <script src="/Public/Bms/js/common.js"></script>
        <script src="/Public/Bms/js/js.js"></script>
        <!--弹出提示框-->
        <script src="/Public/Bms/js/jquery.gritter.min.js"></script>
        <script src="/Public/Bms/js/jquery.peity.min.js"></script>
        <!--弹出提示框-->
        <script>
//            $.gritter.add({
//                image: 'fa fa-info-circle', sticky: false, title: '温馨提醒',time: 5000, speed: 500, position: 'top-right', class_name: 'gritter-success',
//                text: '您有未处理用户提现：'+data.no_handle_withdraw+''
//            });
//            $(document).ready(function(){
//                getTip();
//            });
            setInterval(function(){
                getTip();
            },30000);
            function getTip() {
                $.get('<?php echo U("System/tip");?>').success(function(data){
//                    if(data.no_handle_withdraw != 0) {
//                        $('a.no-handle-withdraw').append('<span class="label label-important no-read-message">'+data.no_handle_withdraw+'</span>');
//                    }
                    if(data.data.not_delivery_order != 0) {
                        $.gritter.add({
                            image: 'fa fa-info-circle', sticky: false, title: '温馨提醒',time: 5000, speed: 500, position: 'top-right', class_name: 'gritter-success',
                            text: '您有未发货的订单：'+data.data.not_delivery_order+'单'
                        });
                    }
                });
            }
        </script>
		
	</body>
</html>