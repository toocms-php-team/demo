<?php if (!defined('THINK_PATH')) exit();?><li><a href="<?php echo plugins_url('Interconnect://Login/transfer',array('encrypt'=>think_encrypt($plugins_config['qq_app_id'].'|'.$plugins_config['qq_app_key'],'',3600),'platform'=>'qq'));?>" title="QQ登录"><img src="/Public/Wap/img/qq.png" alt="扣扣登陆"></a></li>
<!--
<li><a href="<?php echo plugins_url('Interconnect://Login/transfer',array('encrypt'=>think_encrypt($plugins_config['sina_app_key'].'|'.$plugins_config['sina_app_secret'],'',3600),'platform'=>'sina'));?>" title="新浪微博登录"><img src="/Public/Wap/img/weixin.png" alt="新浪微博登陆"></a></li>-->

<li><a href='<?php echo plugins_url("Interconnect://Login/callback",array("encrypt"=>"","platform"=>"weChat"));?>' title="微信登陆"><img src="/Public/Wap/img/weixin.png" alt="微信登陆"></a></li>
<!--<li><a href='javascript:void(0)' title="微信登陆" onclick="wxLogin()"><img src="/Public/Wap/img/weixin.png" alt="微信登陆"></a></li>-->
<script>
    //function wxLogin() {$.post('{:plugins_url("Interconnect://Login/callback",array("encrypt"=>""))}', {platform: 'weChat'}).success(function (data) {if (data.status == 1) {showPop(data.info, 'success', 1500, data.url);} else { showPop(data.info, 'error', 1500, '');}});}
</script>