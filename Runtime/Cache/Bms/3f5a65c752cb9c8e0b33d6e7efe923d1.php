<?php if (!defined('THINK_PATH')) exit();?><div class="span6">
    <div class="widget-box">
        <div class="widget-title">
            <span class="icon">
                <i class="fa fa-cog"></i>
            </span>
            <h5><?php echo ($plugins_config['title']); ?></h5>
        </div>
        <div class="widget-content no-padding no-border">
            <table class="table table-bordered">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <td>系统版本</td>
                    <td>1.0.1</td>
                </tr>
                <tr>
                    <td>ThinkPHP版本</td>
                    <td><?php echo (THINK_VERSION); ?></td>
                </tr>
                <tr>
                    <td>域名</td>
                    <td><?php echo ($_SERVER["HTTP_HOST"]); ?></td>
                </tr>
                <tr>
                    <td>服务器操作系统</td>
                    <td><?php echo (PHP_OS); ?></td>
                </tr>
                <tr>
                    <td>运行环境</td>
                    <td><?php echo ($_SERVER['SERVER_SOFTWARE']); ?></td>
                </tr>
                <tr>
                    <td>MySql版本</td>
                    <?php $system_info_mysql = M()->query("select version() as v;"); ?>
                    <td><?php echo ($system_info_mysql["0"]["v"]); ?></td>
                </tr>
                <tr>
                    <td>上传限制</td>
                    <td><?php echo ini_get('upload_max_filesize');?></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>