<?php if (!defined('THINK_PATH')) exit(); if($_REQUEST['sort'] == $plugins_param['field'].':ASC') { ?>
        <a href="<?php echo U(''.CONTROLLER_NAME.'/'.ACTION_NAME.'',array_merge($_REQUEST, array('sort'=>$plugins_param['field'].':DESC')));?>" style="color:#666666;"><?php echo ($plugins_param['title']); ?></a>
        <i class="fa fa-sort-asc" style="font-size: <?php echo ($plugins_config['size']); ?>"></i>
<?php } elseif($_REQUEST['sort'] == $plugins_param['field'].':DESC') { ?>
        <a href="<?php echo U(''.CONTROLLER_NAME.'/'.ACTION_NAME.'',array_merge($_REQUEST, array('sort'=>$plugins_param['field'].':ASC')));?>" style="color:#666666;"><?php echo ($plugins_param['title']); ?></a>
        <i class="fa fa-sort-desc" style="font-size: <?php echo ($plugins_config['size']); ?>"></i>
<?php } else { ?>
        <a href="<?php echo U(''.CONTROLLER_NAME.'/'.ACTION_NAME.'',array_merge($_REQUEST, array('sort'=>$plugins_param['field'].':DESC')));?>" style="color:#666666;"><?php echo ($plugins_param['title']); ?></a>
        <i class="fa fa-sort" style="font-size: <?php echo ($plugins_config['size']); ?>"></i>
<?php } ?>