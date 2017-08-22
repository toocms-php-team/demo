<?php if (!defined('THINK_PATH')) exit(); switch($plugins_config["editor_type"]): case "1": ?>
		<input type="hidden" name="parse" value="0">
		<script type="text/javascript">
			$('textarea[name="<?php echo ($plugins_data["name"]); ?>"]').height('<?php echo ($plugins_config["editor_height"]); ?>');
		</script><?php break;?>
	<?php case "2": ?>
		<input type="hidden" name="parse" value="0">
		<?php if(($plugins_config["editor_wysiwyg"]) == "1"): if($plugins_data['is_first'] == 1): ?><link rel="stylesheet" href="/Public/Static/kindeditor/default/default.css" />
			<script charset="utf-8" src="/Public/Static/kindeditor/kindeditor-min.js"></script>
			<script charset="utf-8" src="/Public/Static/kindeditor/zh_CN.js"></script><?php endif; ?>
			<script type="text/javascript">
				var editor<?php echo ($plugins_data["name"]); ?>;
				KindEditor.ready(function(K) {
					editor<?php echo ($plugins_data["name"]); ?> = K.create('textarea[name="<?php echo ($plugins_data["name"]); ?>"]', {
						allowFileManager : false,
						themesPath: K.basePath,
						width: '<?php echo ($plugins_data["width"]); ?>%',
						height: '<?php echo ($plugins_config["editor_height"]); ?>',
						resizeType: <?php if(($plugins_config["editor_resize_type"]) == "1"): ?>1<?php else: ?>0<?php endif; ?>,
						pasteType : 2,
						urlType : 'absolute',
						fileManagerJson : '<?php echo U('fileManagerJson');?>',
						//uploadJson : '<?php echo U('uploadJson');?>' }
						uploadJson : '<?php echo plugins_url("EditorForAdmin://Upload/ke_upimg");?>'
                    /*items:["source","|","undo","redo","|","preview","print","template","code","cut","copy","paste","plainpaste","wordpaste","|","justifyleft","justifycenter","justifyright","justifyfull","insertorderedlist","insertunorderedlist","indent","outdent","subscript","superscript","clearhtml","quickformat","selectall","|","fullscreen","/","formatblock",
                        "fontname","fontsize","|","forecolor","hilitecolor","bold","italic","underline","strikethrough","lineheight","removeformat","|","image","multiimage","flash","media","insertfile","table","hr","emoticons","baidumap","pagebreak","anchor","link","unlink","|","about"]*/
					});
				});

				$(function(){
					//传统表单提交同步
					$('textarea[name="<?php echo ($plugins_data["name"]); ?>"]').closest('form').submit(function(){
						editor<?php echo ($plugins_data["name"]); ?>.sync();
					});
					//ajax提交之前同步
					$('button[type="submit"],#submit,.ajax-post').click(function(){
						editor<?php echo ($plugins_data["name"]); ?>.sync();
					});
				})
			</script>

		<?php else: ?>
            <?php if($plugins_data['is_first'] == 1): ?><script type="text/javascript" charset="utf-8" src="/Public/Static/ueditor/ueditor.config.js"></script>
			<script type="text/javascript" charset="utf-8" src="/Public/Static/ueditor/ueditor.all.min.js"></script>
			<script type="text/javascript" charset="utf-8" src="/Public/Static/ueditor/lang/zh-cn/zh-cn.js"></script><?php endif; ?>
			<script type="text/javascript">
				$('textarea[name="<?php echo ($plugins_data["name"]); ?>"]').attr('id', 'editor_id_<?php echo ($plugins_data["name"]); ?>');
				window.UEDITOR_HOME_URL = "/Public/Static/ueditor";
				window.UEDITOR_CONFIG.initialFrameHeight = parseInt('<?php echo ($plugins_config["editor_height"]); ?>');
				window.UEDITOR_CONFIG.scaleEnabled = <?php if(($plugins_config["editor_resize_type"]) == "1"): ?>true<?php else: ?>false<?php endif; ?>;
				window.UEDITOR_CONFIG.imageUrl = '<?php echo plugins_url("EditorForAdmin://Upload/ue_upimg");?>';
				window.UEDITOR_CONFIG.imagePath = '';
				window.UEDITOR_CONFIG.imageFieldName = 'imgFile';
                window.UEDITOR_CONFIG.initialFrameWidth = <?php echo ($plugins_data["width"]); ?>;  //初始化编辑器宽度,默认1000
                window.UEDITOR_CONFIG.initialFrameHeight = <?php echo ((isset($plugins_data["height"]) && ($plugins_data["height"] !== ""))?($plugins_data["height"]):300); ?>;  //初始化编辑器宽度,默认1000
                window.UEDITOR_CONFIG.toolbars = [["fullscreen","source","undo","redo","insertunorderedlist","insertorderedlist","unlink","link","cleardoc","selectall","print","searchreplace","preview","help","insertimage","snapscreen","emotion","horizontal","anchor","spechars","blockquote","insertcode","bold","italic","underline","strikethrough","forecolor","backcolor","superscript","subscript","justifyleft","justifycenter","justifyright","justifyjustify","touppercase","tolowercase","directionalityltr","directionalityrtl","indent","removeformat","formatmatch","autotypeset","customstyle","paragraph","rowspacingbottom","rowspacingtop","lineheight","fontfamily","fontsize"]];
                /*toolbars: [[
                    'fullscreen', 'source', '|', 'undo', 'redo', '|',
                    'bold', 'italic', 'underline', 'fontborder', 'strikethrough', 'superscript', 'subscript', 'removeformat', 'formatmatch', 'autotypeset', 'blockquote', 'pasteplain', '|', 'forecolor', 'backcolor', 'insertorderedlist', 'insertunorderedlist', 'selectall', 'cleardoc', '|',
                    'rowspacingtop', 'rowspacingbottom', 'lineheight', '|',
                    'customstyle', 'paragraph', 'fontfamily', 'fontsize', '|',
                    'directionalityltr', 'directionalityrtl', 'indent', '|',
                    'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'touppercase', 'tolowercase', '|',
                    'link', 'unlink', 'anchor', '|', 'imagenone', 'imageleft', 'imageright', 'imagecenter', '|',
                    'simpleupload', 'insertimage', 'emotion', 'scrawl', 'insertvideo', 'music', 'attachment', 'map', 'gmap', 'insertframe', 'insertcode', 'webapp', 'pagebreak', 'template', 'background', '|',
                    'horizontal', 'date', 'time', 'spechars', 'snapscreen', 'wordimage', '|',
                    'inserttable', 'deletetable', 'insertparagraphbeforetable', 'insertrow', 'deleterow', 'insertcol', 'deletecol', 'mergecells', 'mergeright', 'mergedown', 'splittocells', 'splittorows', 'splittocols', 'charts', '|',
                    'print', 'preview', 'searchreplace', 'drafts', 'help'
                ]]*/
                var editor<?php echo ($plugins_data["name"]); ?> = UE.getEditor('editor_id_<?php echo ($plugins_data["name"]); ?>');
                $(function(){
                    //传统表单提交同步
                    $('textarea[name="<?php echo ($plugins_data["name"]); ?>"]').closest('form').submit(function(){
                        editor<?php echo ($plugins_data["name"]); ?>.sync();
                    });
                    //ajax提交之前同步
                    $('button[type="submit"],#submit,.ajax-post').click(function(){
                        editor<?php echo ($plugins_data["name"]); ?>.sync();
                    });
                })
			</script><?php endif; break;?>
	<?php case "3": ?>
		<script type="text/javascript" src="/Public/Static/jquery-migrate-1.2.1.min.js"></script>
		<script charset="utf-8" src="/Public/Static/xheditor/xheditor-1.2.1.min.js"></script>
		<script charset="utf-8" src="/Public/Static/xheditor/xheditor_lang/zh-cn.js"></script>
		<script type="text/javascript" src="/Public/Static/xheditor/xheditor_plugins/ubb.js"></script>
		<script type="text/javascript">
		var submitForm = function (){
			$('textarea[name="<?php echo ($plugins_data["name"]); ?>"]').closest('form').submit();
		}
		$('textarea[name="<?php echo ($plugins_data["name"]); ?>"]').attr('id', 'editor_id_<?php echo ($plugins_data["name"]); ?>')
		$('#editor_id_<?php echo ($plugins_data["name"]); ?>').xheditor({
			tools:'full',
			showBlocktag:false,
			forcePtag:false,
			beforeSetSource:ubb2html,
			beforeGetSource:html2ubb,
			shortcuts:{'ctrl+enter':submitForm},
			'height':'<?php echo ($plugins_config["editor_height"]); ?>',
			'width' :'100%'
		});
		</script>
		<input type="hidden" name="parse" value="1"><?php break;?>
	<?php case "4": ?>
		<link rel="stylesheet" href="/Public/Static/thinkeditor/skin/default/style.css">
		<script type="text/javascript" src="/Public/Static/jquery-migrate-1.2.1.min.js"></script>
		<script type="text/javascript" src="/Public/Static/thinkeditor/jquery.thinkeditor.js"></script>
		<script type="text/javascript">
			$(function(){
				$('textarea[name="<?php echo ($plugins_data["name"]); ?>"]').attr('id', 'editor_id_<?php echo ($plugins_data["name"]); ?>');
				var options = {
					"items"  : "h1,h2,h3,h4,h5,h6,-,link,image,-,bold,italic,code,-,ul,ol,blockquote,hr,-,fullscreen",
			        "width"  : "100%", //宽度
			        "height" : "{plugins_config.editor_height}", //高度
			        "lang"   : "zh-cn", //语言
			        "tab"    : "    ", //Tab键插入的字符， 默认为四个空格
					"uploader": "<?php echo plugins_url('Editor://Upload/upload');?>"
			    };
			    $('#editor_id_<?php echo ($plugins_data["name"]); ?>').thinkeditor(options);
			})
		</script>
		<input type="hidden" name="parse" value="2"><?php break; endswitch;?>