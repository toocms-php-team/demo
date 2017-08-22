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
    <style>
        body{background-color:#fff }
    </style>
</head>
<body>
    <div class="alert top-alert" style="display:none;z-index:10000000;width:100%;padding: 11px 35px 11px 14px;top:0px;border-radius: 0px;">
        <button class="close" data-dismiss="alert"></button>
        <strong></strong>
    </div>
<!--<div class="row-fluid main-row-fluid">-->
    <!--<div class="span12">-->
    <div class="widget-box">

        <div class="widget-title widget-title-search list-widget-title">
            <form action="<?php echo U('Goods/modal');?>" method="post" class="form">
                <input type="text" name="goods_name" value="<?php echo ($_REQUEST['goods_name']); ?>" placeholder="商品名称">
                <?php echo ($select); ?>
                <button class="btn btn-inverse">查询</button>
            </form>
        </div>

        <div class="widget-content no-padding no-border">
            <table class="table table-bordered table-striped reset-checkbox">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>商品货号</th>
                    <th>商品名称</th>
                    <th>所属分类</th>
                    <!--<th>价格</th>-->
                    <th>库存</th>
                    <!--<th>是否上架</th>-->
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody class="tbody">
                <?php if(empty($list)): ?><tr><td colspan="30">Aho！没有查询结果！！</td></tr><?php endif; ?>
                <?php if(is_array($list)): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$row): $mod = ($i % 2 );++$i;?><tr>
                        <td><?php echo ($row['id']); ?></td>
                        <td><?php echo ($row['goods_sn']); ?></td>
                        <td><?php echo (msubstr($row['goods_name'],0,30)); ?></td>
                        <td><?php echo ($row['goods_cate_name']); ?></td>
                        <!--<td>￥ <?php echo ($row['price']); ?> 元</td>-->
                        <td><?php echo ($row['stock']); ?></td>
                        <!--<td><?php echo ($row['is_on_sale']); ?></td>-->
                        <td><?php echo (get_status_title($row['status'])); ?></td>
                        <td>
                            <?php if((false === strpos(cookie('__relation_goods_ids__'),$row['id']))): ?><a href="<?php echo U('Article/choiceGoods',array('goods_id'=>$row['id']));?>" title="选择" class="tip-bottom ajax-get">
                                    <span class="label label-success label-success-hover">选择</span></a>&nbsp;
                            <?php else: ?>
                                <a href="<?php echo U('Article/cancelGoods',array('goods_id'=>$row['id']));?>" title="取消选择" class="tip-bottom ajax-get">
                                    <span class="label label-important label-important-hover">取消选择</span></a>&nbsp;<?php endif; ?>
                        </td>
                    </tr><?php endforeach; endif; else: echo "" ;endif; ?>
                </tbody>
            </table>
        </div>

        <div class="pagination alternate">
            <?php echo ($page); ?>
        </div>

    </div>
    <!--</div>-->
<!--</div>-->
<!--基本-->
<script src="/Public/Bms/js/bootstrap.min.js"></script>
<script src="/Public/Bms/js/unicorn.min.js"></script>
<!--基本-->
<!--表单加载-->
<script src="/Public/Bms/js/jquery.uniform.min.js"></script>
<!--表单加载-->
<script src="/Public/Bms/js/common.js"></script>
<script src="/Public/Bms/js/js.js"></script>
<script>
    function afterAjaxGetSuccess() {
        parent.$('.modal-backdrop').hide();
        parent.$('.modal').hide();
        parent.location.reload();
    }
</script>
</body>
</html>