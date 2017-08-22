<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <title><?php echo ($content_header); ?>--晟轩科技--后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--基本-->
    <link rel="stylesheet" href="/Public/Bms/css/bootstrap.2.3.2.min.css" />
    <link rel="stylesheet" href="/Public/Bms/css/font-awesome-4.4.0/font-awesome.min.css" />
    <link rel="stylesheet" href="/Public/Bms/css/unicorn.main.min.css" />
    <!--基本-->
    <!--表单表格-->
    <link rel="stylesheet" href="/Public/Bms/css/uniform.min.css" />
    <!--表单表格-->
    <!--扩展样式-->
    <link rel="stylesheet" href="/Public/Bms/css/custom.css" />
    <!--扩展样式-->
    <!--jquery-->
    <script src="/Public/Static/jquery.min.js"></script>
    <!--jquery-->
    <script src="/Public/Bms/js/common.js"></script>
    <script src="/Public/Bms/js/js.js"></script>
    <style>
        body{background-color:#fff }
    </style>
</head>
<body>
<div class="alert top-alert" style="display:none;z-index:10000000;width:100%;padding: 11px 35px 11px 14px;top:0px;border-radius: 0px;">
    <button class="close" data-dismiss="alert"></button>
    <strong></strong>
</div>
<table class="table table-striped no-border">
    <thead>
    <tr>
        <th>ID</th>
        <th>编号</th>
        <th>姓名</th>
        <th>联系电话</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody class="tbody">
    <?php if(empty($list)): ?><tr><td colspan="30">Aho！没有查询结果！！</td></tr><?php endif; ?>
    <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$row): $mod = ($i % 2 );++$i;?><tr>
            <td><?php echo ($row['id']); ?></td>
            <td><?php echo ($row['kp_sn']); ?></td>
            <td><?php echo ((isset($row['name']) && ($row['name'] !== ""))?($row['name']):'---'); ?></td>
            <td><?php echo ((isset($row['mobile']) && ($row['mobile'] !== ""))?($row['mobile']):'---'); ?></td>
            <td><?php echo (get_status_title($row['status'])); ?></td>
            <td>
                <a href="<?php echo U('Keeper/dispatchKP',array('m_id'=>$_REQUEST['m_id'],'kp_id'=>$row['id']));?>" title="确认分配" class="ajax-get confirm no-refresh" data-confirm="确认要分配此管家吗？">
                    <span class="label label-success label-success-hover">确认分配</span></a>&nbsp;
            </td>
        </tr><?php endforeach; endif; else: echo "" ;endif; ?>
    </tbody>
</table>

<script>
    function afterAjaxGetSuccess() {
        parent.$('.modal-backdrop').hide();
        parent.$('.modal').hide();
        parent.location.reload();
    }
</script>
</body>
</html>