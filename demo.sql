/*
Navicat MySQL Data Transfer
Source Host     : localhost:3306
Source Database : demo
Target Host     : localhost:3306
Target Database : demo
Date: 2017-08-24 09:12:08
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for toocms_action
-- ----------------------------
DROP TABLE IF EXISTS `toocms_action`;
CREATE TABLE `toocms_action` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `unique_code` char(20) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '行为名称',
  `remark` varchar(120) NOT NULL DEFAULT '' COMMENT '行为描述',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1正常 0禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_code` (`unique_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统管理员行为表 别名act';

-- ----------------------------
-- Records of toocms_action
-- ----------------------------

-- ----------------------------
-- Table structure for toocms_action_log
-- ----------------------------
DROP TABLE IF EXISTS `toocms_action_log`;
CREATE TABLE `toocms_action_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `act_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '行为id action表主键',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '执行者id即管理员id administrator表主键',
  `action_ip` int(10) NOT NULL COMMENT '执行行为者ip',
  `record_model` char(45) NOT NULL DEFAULT '' COMMENT '触发行为的模型',
  `record_id` varchar(225) NOT NULL DEFAULT '' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`act_id`),
  KEY `user_id_ix` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表 别名 act_log';

-- ----------------------------
-- Records of toocms_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for toocms_administrator
-- ----------------------------
DROP TABLE IF EXISTS `toocms_administrator`;
CREATE TABLE `toocms_administrator` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` char(15) NOT NULL COMMENT '登录账号',
  `unique_code` char(8) NOT NULL COMMENT '唯一编号',
  `password` char(32) NOT NULL COMMENT '密码',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所属组ID auth_group表主键',
  `login` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1可用 0禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`unique_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表 别名admin';

-- ----------------------------
-- Records of toocms_administrator
-- ----------------------------
INSERT INTO `toocms_administrator` VALUES ('1', 'admin', '8881', '0c909a141f1f2c0a1cb602b0b2d7d050', '1', '279', '1503450824', '2130706433', '1440000000', '1503450824', '1');
INSERT INTO `toocms_administrator` VALUES ('2', 'luchenzhi', '2862', '0c909a141f1f2c0a1cb602b0b2d7d050', '1', '0', '0', '0', '1503389772', '0', '1');

-- ----------------------------
-- Table structure for toocms_area
-- ----------------------------
DROP TABLE IF EXISTS `toocms_area`;
CREATE TABLE `toocms_area` (
  `id` tinyint(50) NOT NULL AUTO_INCREMENT,
  `cate_id` tinyint(5) NOT NULL DEFAULT '1',
  `img1` varchar(255) DEFAULT NULL,
  `url1` varchar(255) DEFAULT NULL,
  `img2` varchar(255) DEFAULT NULL,
  `url2` varchar(255) DEFAULT NULL,
  `img3` varchar(255) DEFAULT NULL,
  `url3` varchar(255) DEFAULT NULL,
  `time` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of toocms_area
-- ----------------------------
INSERT INTO `toocms_area` VALUES ('1', '3', '5', '568455', '', '999999', '', '999999', '1503483862');

-- ----------------------------
-- Table structure for toocms_article
-- ----------------------------
DROP TABLE IF EXISTS `toocms_article`;
CREATE TABLE `toocms_article` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID administrator表主键',
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '标题',
  `art_cate_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '所属分类 article_category主键',
  `short_desc` varchar(15) NOT NULL DEFAULT '' COMMENT '简短描述',
  `content` text NOT NULL COMMENT '内容',
  `link` varchar(105) NOT NULL DEFAULT '' COMMENT '外链',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `cover` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `pictures` varchar(225) NOT NULL DEFAULT '' COMMENT '展示图',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐 1--是 0--否',
  `collections` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收藏次数',
  `view` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1可用 0禁用',
  `relation_goods` varchar(225) NOT NULL DEFAULT '' COMMENT '关联商品',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`art_cate_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='文章咨询表  别名art';

-- ----------------------------
-- Records of toocms_article
-- ----------------------------
INSERT INTO `toocms_article` VALUES ('9', '1', '积分规则', '2', '', '<p>积分规则</p>', '', '0', '0', '', '0', '0', '0', '1476697422', '1476699549', '1', '');
INSERT INTO `toocms_article` VALUES ('10', '1', '关于我们', '2', '', '<p>常州然云信息科技有限公司</p>', '', '0', '0', '', '0', '0', '0', '1476697460', '1482479566', '1', '');
INSERT INTO `toocms_article` VALUES ('15', '1', '赶走雾霾 做有态度呼吸的自然人', '4', '赶走雾霾 做有态度呼吸的自然人', '<p><span style=\"color: rgb(50, 50, 50); font-family: SimSun, 宋体; line-height: 24px; text-indent: 32px;  background-color: rgb(250, 250, 250);\">2016年1月12日，中国气象局发布《2015年中国气候公报》显示，去年我国一共遭遇11次大范围雾霾过程，且持续时间长、范围广、污染程度重，而尤以华北、黄淮等地的雾霾最为突出。</span><img src=\"/Uploads/Editor/2016-12-17/58550ae8b4aa8.jpg\" title=\"38231460525205115.jpg\"/></p>', '', '997', '182', '183,182', '1', '22', '123', '1481968370', '1482115503', '1', '');
INSERT INTO `toocms_article` VALUES ('16', '1', '大自然家居万人疯抢秘籍', '7', '大自然家居万人疯抢秘籍', '<p><span style=\"color: rgb(50, 50, 50); font-family: SimSun, 宋体; line-height: 24px; text-indent: 32px;  background-color: rgb(250, 250, 250);\">大自然身边的小伙伴最近总是说4月16日越来越近了，那么多人疯抢，万一抢不到怎么办？莫名的紧张感一阵阵袭来……看着大家殷切的小眼神，大自然</span><a href=\"http://www.jia360.com/\" target=\"_blank\" class=\"keyWordALabel\" style=\"color: rgb(0, 150, 165); text-decoration: none; border-bottom-width: 1px; border-bottom-style: dashed; border-bottom-color: rgb(0, 150, 165); font-family: SimSun, 宋体; line-height: 24px; text-indent: 32px; white-space: normal; background-color: rgb(250, 250, 250);\">家居</a><span style=\"color: rgb(50, 50, 50); font-family: SimSun, 宋体; line-height: 24px; text-indent: 32px;  background-color: rgb(250, 250, 250);\">实在忍不了啦，疯抢秘籍大公开，睁大你的双眼吧！</span></p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 28px; background-color: rgb(250, 250, 250);\">都市的富贵浮华是迷人的，亦是燥人的。犬牙交错的钢铁森林让春风无路可走，路面扬起的烟霾尘埃甚至遮蔽住了春天的暖意阳光。这是否让您有了逃离的冲动？也许，选择好美家可以让您重新拥有这转瞬即逝的春天。好美家拼花地板为您在家中拼接出色彩斑斓的春日美景；让您在都市的天空下，归隐山林；在都市浮躁之中，贪享春天的静谧......</p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 28px; background-color: rgb(250, 250, 250);\">春天是一年中最美好的，也是最为短暂的。暖风熏人的时节仅仅存在清明之后，谷雨之前的短短时光中。不过，有好美家相伴，即使这美好只是说走就走的过客，在以后与您携手的时间里，我们也可以一遍遍的回首，追忆。</p><p><br/></p>', '', '996', '184', '185,184', '0', '1', '12', '1481968484', '1482115482', '1', '');
INSERT INTO `toocms_article` VALUES ('17', '1', '万事俱备 更有东风：纯实木已成为地热地板代名词', '6', '万事俱备 更有东风：纯实木已成', '<p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 32px; background-color: rgb(250, 250, 250);\">2016年3月下旬闭幕的第18届上海地材展，是中国乃至全亚洲地板潮流趋势的风向标。在本届展会上，无论是以“天格杯·第五届地暖地板技术论坛”为代表的主办方主题活动，还是展商们展出的品类布局，都有一个鲜明的特点，即侧重于实木地热地板。</p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 32px; background-color: rgb(250, 250, 250);\">根据在上海地材展上发布的《2016实木地热地板流行趋势报告》，相关数据显示：如今，包括上游产业发展、中游市场需求和终端消费理念在内的各个关键因素，都非常有利于地热地板的品类发展趋向于实木化，加之地板行业积极参与、推动的这一“东风”，实木地热地板已经成为地热地板的代名词。</p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 32px; background-color: rgb(250, 250, 250);\"><strong>上游机遇：地暖普及增速</strong></p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 32px; background-color: rgb(250, 250, 250);\">在“第五届地暖地板技术论坛”上，中国辐射供暖供冷委员会主任刘浩所作的“南方供暖行业发展现状及市场展望”报告，借以武汉市调统计：原有固定采暖设备或系统的家庭不足2%，而2015年采暖家庭数量乐观估计就已有40万户，并且随着消费群体逐步由高端向普通消费者转移的趋势，南方供暖市场需求将进一步增长。北方地暖普及率高居不下，南方地暖市场急速扩大，给实木地热地板创造了前所未有的发展机遇。</p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 32px; background-color: rgb(250, 250, 250);\"><strong>市场需求：地板取代瓷砖</strong></p><p><br/></p>', '', '995', '105', '105,187', '1', '5', '14', '1481968578', '1482115471', '1', '32,31');
INSERT INTO `toocms_article` VALUES ('14', '1', '发现生活之美 好美家地板邀您共渡温馨春季', '4', '好美家地板想说，我们给您的春天', '<p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 28px; background-color: rgb(250, 250, 250);\">如果冬天的高冷孤傲让您高山仰止；如果夏天的热情缠绵让您措手不及。那么两者间的中值，春天又是什么？自古而今，名人大家纵说风云。韩子说，春天是天街小雨润如酥般的温婉动人；刘梦得说，春天是病木前头万木春般的绽放新生；杜子美说春天是随风潜入夜，润物细无声般的岁月静好。而好美家地板想说，我们给您的春天包涵了一切美的元素，是温柔，是闲逸，更是与您呢喃私语的一份安详静谧。</p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 28px; background-color: rgb(250, 250, 250);\">春天的温柔——好美家实木地热地板</p><p><img src=\"/Uploads/Editor/2016-12-17/5855090744c38.png\" title=\"2711460535206178.png\"/></p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 28px; background-color: rgb(250, 250, 250);\">二月春风似剪刀，料峭的春寒与凌冽的严冬相比也不遑多让。好美家实木地热在温暖了您一个冬天之后，在早春时节仍延续着对您暖暖的爱。从霜降一直走到惊蛰，好美家实木地热的柔情暖意一直与您同在.......</p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 28px; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin: 10px 0cm; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 24px; color: rgb(50, 50, 50); white-space: normal; text-indent: 28px; background-color: rgb(250, 250, 250);\">春天的闲逸——好美家实木地板</p><p><img src=\"/Uploads/Editor/2016-12-17/5855091fe305b.png\" title=\"4141460535221771.png\"/></p>', '', '998', '179', '180,181', '1', '0', '0', '1481967913', '1482115514', '1', '');
INSERT INTO `toocms_article` VALUES ('18', '1', '大自然DFC整装首届环保整装节', '5', '大自然DFC整装首届环保整装节', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">提起装修，经历过的人都绕不开一个字：烦。跑卖场、蹲工地奔波劳碌，还要和材料商、施工队斗智斗勇。折腾一年半载，以为终于可以住进一个舒服的家，却发现被甲醛重重包围。当初说好的环保材料呢？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">去年，“互联网家装”横空出世，从设计、主材到施工，一条龙服务，消费者梦想的“一边度假一边装修”眼看要实现了，却发现没有金睛火眼去甄别主材的品质，依然不能解决环保问题。其实，无论是传统装修还是互联网家装，在行业缺乏完善监管体系的情况下，环保依然是家装之痛。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">依托大自然<a href=\"http://www.jia360.com/\" target=\"_blank\" class=\"keyWordALabel\" style=\"color: rgb(0, 150, 165); text-decoration: none; border-bottom-width: 1px; border-bottom-style: dashed; border-bottom-color: rgb(0, 150, 165);\">家居</a>超过20年的行业耕耘，大自然DFC整装一直致力于解决消费者的环保家装需求。今年4月，大自然DFC整装更发起首届环保整装节，向互联网家装行业的环保乱象宣战，并在全社会倡导绿色环保的理念。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><span style=\"line-height: 1.5em; text-indent: 2em;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><strong>从源头控环保，食品级原材料</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">大自然家居拥有多个自营的地板、木门、<a href=\"http://www.jia360.com/yigui/\" target=\"_blank\" class=\"keyWordALabel\" style=\"color: rgb(0, 150, 165); text-decoration: none; border-bottom-width: 1px; border-bottom-style: dashed; border-bottom-color: rgb(0, 150, 165);\">橱柜衣柜</a>生产基地，为DFC整装提供源头可控的环保主材。从原材料采集、加工到制作成品，大自然作为产品的生产商，具有别的互联网家装品牌无法比拟的优势——能够把控每个生产环节的环保和质量。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; text-align: center; background-color: rgb(250, 250, 250);\"><img src=\"http://pic.jia360.com/ueditor/jsp/upload/201604/12/18801460443469067.jpg\" alt=\"1\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; text-align: center; background-color: rgb(250, 250, 250);\">大自然家居专门使用天然大豆胶，大大降低板材中的甲醛含量</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; text-align: center; background-color: rgb(250, 250, 250);\"><img src=\"http://pic.jia360.com/ueditor/jsp/upload/201604/12/39101460443501232.jpg\" alt=\"2\" style=\"border: 0px; vertical-align: middle;\"/><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; text-align: center; background-color: rgb(250, 250, 250);\">瑞士进口的食品级环保木芯</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">大自然严格把控环保的程度可谓“变态”，一些材料甚至要做到“食品级”。比如地板等板材使用的胶水往往是甲醛重灾区，大自然为此专门使用零醛添加的天然大豆胶、环保水性漆、食品级瑞士进口木芯等环保原材料。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><span style=\"line-height: 1.5em; text-indent: 2em;\"><br/></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><strong>10年坚持植树育林，是情怀更是责任</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">自2006年与中国绿化基金会合作以来，大自然家居开展“中国绿色版图工程”植树活动，迄今已有10年。十年植树，已在全国建成了18个生态林，总面积超过15万㎡，植树60多万株，吸引了近5亿人次关注和支持环保事业。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">坚持植树10年，不仅大力建设生态林，还发动消费者去植树，不遗余力宣扬环保理念，这是一种情怀，更是一份沉甸甸的社会责任。</p><p><br/></p>', '', '994', '187', '185', '0', '8', '78', '1481968641', '1482115456', '1', '');
INSERT INTO `toocms_article` VALUES ('19', '1', '假如空气会说话', '4', '假如空气会说话', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">空气，我们一刻也离不开的生命基础，使地球生物多样性变为可能。空气的重要性不言而喻，没有食物，可以存活3周，没有水，可以存活3天，然而，没有空气，最多存活不过3分钟。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 28px; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\"><img src=\"http://pic.jia360.com/ueditor/jsp/upload/201604/13/75081460526383225.jpg\" alt=\"1\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">曾几何时，人类在大自然的怀抱里，自由畅快地呼吸，当人类利用自己创造的文明成果，从洪荒时代走到了文明的世纪，创造经济奇迹的同时，却又饱尝工业化进程对大自然无限掠夺的恶果。煤、油的燃烧，工业废气的排放，生态遭受破坏，大气严重污染。当空气被迫变成一个无形的杀手，我想如果空气也会说话，它会说：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">我是空气</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">对人们来说，我看不见摸不着，</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">却理所当然的存在。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">我化身大气层让白天温度不至过高，</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">夜间温度不会太低。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">我吸收来自太阳的紫外线，</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">又为风云雨雪的形成提供助力。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">还有人类呼吸必备的氧气，</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">和植物生存所需的二氧化碳。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">每个生命的存在，都需要我。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">我敢打赌：</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">离开我不到3分钟，生命就将灭亡。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">然而对于人类来说，我只是空气，</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">看不见摸不着，却肆无忌惮的伤害。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">你可知道雾霾吗？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">那就是我对人类的报复</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">如果人类再不知道保护环境，</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">超负荷的燃烧煤、油</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">未来，</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\">人类又要花多少代价才能呼吸得起？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">过去30多年来，我国的肺癌死亡率上升了464%，虽然吸烟和老龄化占据着一部分因素，但空气污染导致细颗粒物雾霾的致癌风险越来越高，无知与贪婪留下了恶果。研究显示，中国已经成为世界上每年因空气污染而导致人死亡数量最高的国家。据测算，在中国，每年因大气污染，过早死亡的人数是30万-50万人。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 28px; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\"><img src=\"http://pic.jia360.com/ueditor/jsp/upload/201604/13/79891460526471190.jpg\" alt=\"2\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">日前台媒称，其实康熙、乾隆等多位清帝都可能死于雾霾。近日，澳门镜湖医院心脏内科医生谭健锹专擅心血管疾病，出书《历史课听不到的奇闻：那些你不知道的医疗外史》剖析古代空气污染成为皇帝杀手，霾灾面前人人平等，康熙、乾隆等10位皇帝都死在北京寒冬，或因大量烧炭取暖致“霾灾”，成空气污染祭品。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 28px; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\"><img src=\"http://pic.jia360.com/ueditor/jsp/upload/201604/13/37331460526498690.jpg\" alt=\"3\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">经济的发展，工业化和工业文明的出现，让我们的物质与精神生活都得到了极大的满足，皇帝般待遇的烧炭取暖也已经被我们远远淘汰。但每年因霾灾死亡的人数却直线上升。买卖空气的现象时有发生，不论是钱多人傻，还是广告、炒作、行为艺术，其折射的当下城市雾霾越来越频繁的现状，已经成为一则值得认真研读的现代寓言。如果有一天连空气都需要购买了，不知道届时又有多少人可以呼吸得起？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 28px; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\"><img src=\"http://pic.jia360.com/ueditor/jsp/upload/201604/13/1901460526527166.jpg\" alt=\"4\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\">或许真正可怕的不是死亡，而是我们这样毫无节操的活着，制造或纵容着空气被一天天污染。将来有一天，我们都会离开这个世界，但是我们的孩子们还在，我们没有权利只破坏不建设，净化空气，就像净化自己，保护地球，就像保护家人。2016大自然<a href=\"http://www.jia360.com/\" target=\"_blank\" class=\"keyWordALabel\" style=\"color: rgb(0, 150, 165); text-decoration: none; border-bottom-width: 1px; border-bottom-style: dashed; border-bottom-color: rgb(0, 150, 165);\">家居</a>“我为呼吸种棵树”4月20日兰州，4月22日北京，我们一起行动，做有态度呼吸的自然人！</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 1.5em; color: rgb(50, 50, 50); white-space: normal; text-indent: 2em; background-color: rgb(250, 250, 250);\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; word-wrap: break-word; font-family: SimSun, 宋体; line-height: 28px; color: rgb(50, 50, 50); white-space: normal; text-align: center; background-color: rgb(250, 250, 250);\"><img src=\"http://pic.jia360.com/ueditor/jsp/upload/201604/13/54891460526556301.jpg\" alt=\"5\" style=\"border: 0px; vertical-align: middle;\"/></p><p><br/></p>', '', '993', '97', '97,106', '0', '8', '888', '1481968761', '1482115444', '1', '');
INSERT INTO `toocms_article` VALUES ('20', '1', '网点列表', '8', '网点列表', '<p><a href=\"https://yuntu.amap.com/share/JNr263\" target=\"_blank\" title=\"网点 列表\">网点 列表</a><iframe scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://yuntu.amap.com/share/JNr263\" width=\"100%\" height=\"440px\" frameborder=\"0\"></iframe><br/></p>', '', '0', '203', '', '1', '0', '0', '1482479121', '1482894802', '1', '32');
INSERT INTO `toocms_article` VALUES ('21', '1', '测试测试', '7', '测试测试测试测试测试测试', '<p><a href=\"https://yuntu.amap.com/share/JNr263\" target=\"_blank\" title=\"网点 列表\">网点 列表</a><iframe scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://yuntu.amap.com/share/JNr263\" width=\"100%\" height=\"440px\" frameborder=\"0\"></iframe><br/></p>', '', '0', '9', '', '0', '0', '0', '1482893813', '1482909498', '1', '');

-- ----------------------------
-- Table structure for toocms_article_category
-- ----------------------------
DROP TABLE IF EXISTS `toocms_article_category`;
CREATE TABLE `toocms_article_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `description` varchar(105) NOT NULL DEFAULT '' COMMENT '描述',
  `link` varchar(105) NOT NULL DEFAULT '' COMMENT '外链',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '层级 默认第一级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1可用 0禁用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='分类表 别名art_cate';

-- ----------------------------
-- Records of toocms_article_category
-- ----------------------------
INSERT INTO `toocms_article_category` VALUES ('2', '系统文章', '0', '0', '一些规则、使用帮助等（请不要删除该分类）', '', '0', '1', '1471864012', '1476697228', '1');
INSERT INTO `toocms_article_category` VALUES ('3', '共享文章', '0', '0', '风采展示、案例展示等等（请不要删除该分类）', '', '0', '1', '1471864021', '1476697235', '1');
INSERT INTO `toocms_article_category` VALUES ('4', '客厅装饰', '3', '0', '', '', '0', '2', '1476697157', '1476756871', '1');
INSERT INTO `toocms_article_category` VALUES ('5', '卧室装饰', '3', '0', '', '', '0', '2', '1476697172', '1476756880', '1');
INSERT INTO `toocms_article_category` VALUES ('6', '餐厅装修', '3', '0', '', '', '0', '2', '1476757307', '0', '1');
INSERT INTO `toocms_article_category` VALUES ('7', '卫浴', '3', '11', '', '', '0', '2', '1478138861', '1482487830', '1');
INSERT INTO `toocms_article_category` VALUES ('8', '发现美家', '0', '65535', '', '', '0', '1', '1481967764', '0', '1');

-- ----------------------------
-- Table structure for toocms_article_collection
-- ----------------------------
DROP TABLE IF EXISTS `toocms_article_collection`;
CREATE TABLE `toocms_article_collection` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `m_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `art_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章收藏表  别名art_coll';

-- ----------------------------
-- Records of toocms_article_collection
-- ----------------------------

-- ----------------------------
-- Table structure for toocms_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `toocms_auth_group`;
CREATE TABLE `toocms_auth_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '组类型',
  `title` varchar(15) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1可用 0禁用',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员分组表 表别名 auth_group';

-- ----------------------------
-- Records of toocms_auth_group
-- ----------------------------
INSERT INTO `toocms_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '拥有所有权限', '0', '1452667903', '1', '220,219,217,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,303,302,301,300,304,305,285,286,287,288,289,290,291,292,307,308,309');

-- ----------------------------
-- Table structure for toocms_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `toocms_auth_rule`;
CREATE TABLE `toocms_auth_rule` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '规则所属module',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '规则',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID',
  `sort` smallint(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='权限规则表 别名rule';

-- ----------------------------
-- Records of toocms_auth_rule
-- ----------------------------
INSERT INTO `toocms_auth_rule` VALUES ('1', 'Bms', '1', '', '行为信息', '0', '0', '1', '');

-- ----------------------------
-- Table structure for toocms_config
-- ----------------------------
DROP TABLE IF EXISTS `toocms_config`;
CREATE TABLE `toocms_config` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '配置说明',
  `config_group` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1可用 0禁用',
  `value` text NOT NULL COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`config_group`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='配置表 别名 conf';

-- ----------------------------
-- Records of toocms_config
-- ----------------------------
INSERT INTO `toocms_config` VALUES ('1', 'WEB_SITE_TITLE', '2', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1440952514', '1', '标题');
INSERT INTO `toocms_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '3', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '雅都市袋洗店描述描述描述描述描述');
INSERT INTO `toocms_config` VALUES ('3', 'WEB_SITE_KEYWORD', '3', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '雅都市袋洗店关键字关键字关键字关键字关键字');
INSERT INTO `toocms_config` VALUES ('4', 'WEB_SITE_CLOSE', '5', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1');
INSERT INTO `toocms_config` VALUES ('9', 'CONFIG_TYPE_LIST', '4', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '1:数字\r\n2:字符\r\n3:文本\r\n4:数组\r\n5:枚举\r\n6:图片');
INSERT INTO `toocms_config` VALUES ('10', 'WEB_SITE_ICP', '2', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '沪ICP备12007941号-2');
INSERT INTO `toocms_config` VALUES ('20', 'CONFIG_GROUP_LIST', '4', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统');
INSERT INTO `toocms_config` VALUES ('21', 'HOOKS_TYPE', '4', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器');
INSERT INTO `toocms_config` VALUES ('22', 'AUTH_CONFIG', '4', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:1');
INSERT INTO `toocms_config` VALUES ('25', 'LIST_ROWS', '1', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '12');
INSERT INTO `toocms_config` VALUES ('26', 'USER_ALLOW_REGISTER', '5', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1441677630', '1', '1');
INSERT INTO `toocms_config` VALUES ('33', 'ALLOW_VISIT', '4', '不受限控制器方法', '0', '', '所有管理员 不分权限都可以访问   在权限检查之前  检查', '1386644047', '1442049839', '1', '0:Manager/Article/draftbox');
INSERT INTO `toocms_config` VALUES ('34', 'DENY_VISIT', '4', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法 在权限检查之前 检查', '1386644141', '1442049816', '1', '0:Manager/Addons/addhook');
INSERT INTO `toocms_config` VALUES ('36', 'ADMIN_ALLOW_IP', '3', '后台允许访问IP', '1', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1450920692', '1', '');
INSERT INTO `toocms_config` VALUES ('42', 'SEND_TEMPLATE_TYPES', '4', '发信模板类型', '4', '', '创建发信模板时选择类型', '1442815406', '1447218592', '1', '1:短信\r\n2:邮件\r\n3:站内信\r\n4:APP推送');
INSERT INTO `toocms_config` VALUES ('54', 'BACK_STYLE', '5', '后台色调', '1', 'grey:灰\r\nred:红\r\nblue:蓝', '', '1446085682', '1467776406', '1', 'grey');
INSERT INTO `toocms_config` VALUES ('55', 'ADVERT_POSITION', '4', '广告位置', '4', '', '', '1448683376', '1471856305', '1', '1:首页轮播\r\n2:温馨时刻\r\n3:社区头部');
INSERT INTO `toocms_config` VALUES ('56', 'LOGO', '6', '站点LOGO', '1', '', '', '1450496422', '0', '1', '2');
INSERT INTO `toocms_config` VALUES ('57', 'RECEIVE_RULE', '4', '接收规则', '4', '', '', '1450823725', '1451339928', '1', '1:全部用户\r\n2:当前筛选\r\n3:已选中用户');
INSERT INTO `toocms_config` VALUES ('68', 'TARGET_RULES', '4', '跳转规则', '4', '', '', '1476761738', '0', '1', '1:商品详情\r\n2:文章详情\r\n3:网址');
INSERT INTO `toocms_config` VALUES ('61', 'SIGN_INTEGRAL', '1', '签到赠送积分额度', '1', '', '', '1469496461', '0', '1', '2');
INSERT INTO `toocms_config` VALUES ('67', 'SITE_MOBILE', '2', '400电话', '1', '', '', '1472113249', '1482283078', '1', '0519-68985882');

-- ----------------------------
-- Table structure for toocms_file
-- ----------------------------
DROP TABLE IF EXISTS `toocms_file`;
CREATE TABLE `toocms_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '文件原名',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `ext` varchar(9) NOT NULL DEFAULT '' COMMENT '扩展名',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件shal',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `savename` varchar(25) NOT NULL DEFAULT '' COMMENT '保存文件名',
  `savepath` varchar(45) NOT NULL DEFAULT '' COMMENT '保存路径',
  `location` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文件保存位置 0本地',
  `path` varchar(60) NOT NULL DEFAULT '' COMMENT '全相对路径',
  `abs_url` varchar(105) NOT NULL DEFAULT '' COMMENT '绝对地址',
  `thumb_prefix` varchar(105) NOT NULL DEFAULT '' COMMENT '缩略图前缀',
  `thumb_suffix` varchar(105) NOT NULL DEFAULT '' COMMENT '缩略图后缀',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文件表 别名 file';

-- ----------------------------
-- Records of toocms_file
-- ----------------------------
INSERT INTO `toocms_file` VALUES ('1', 'timg.jpg', '73793', 'jpg', '4da3664acdd5ffb863276ed6eabeb83a', 'a69893a02c3f9ad642a41042dd9138028a7041d7', 'application/octet-stream', '599cf17e5be17.jpg', 'Article/2017-08-23/', '0', '/Uploads/Article/2017-08-23/599cf17e5be17.jpg', 'http://cjml-file.toocms-project.com//Uploads/Article/2017-08-23/599cf17e5be17.jpg', '', '', '1503457662', '1');
INSERT INTO `toocms_file` VALUES ('2', 'timg1.jpg', '53753', 'jpg', '7c776cac9a26a74970e5af5d5e0bcb71', 'faf4825156fe8d096c6493f5398ec2d5c3756be8', 'application/octet-stream', '599cf18451a15.jpg', 'Article/2017-08-23/', '0', '/Uploads/Article/2017-08-23/599cf18451a15.jpg', 'http://cjml-file.toocms-project.com//Uploads/Article/2017-08-23/599cf18451a15.jpg', '', '', '1503457668', '1');
INSERT INTO `toocms_file` VALUES ('3', 'timg2.jpg', '63818', 'jpg', 'b54bfa69d3e832993a822bd4067f3212', '9e39dcb49b8316993b2149ab73e400352768f22d', 'application/octet-stream', '599cf189339ab.jpg', 'Article/2017-08-23/', '0', '/Uploads/Article/2017-08-23/599cf189339ab.jpg', 'http://cjml-file.toocms-project.com//Uploads/Article/2017-08-23/599cf189339ab.jpg', '', '', '1503457673', '1');
INSERT INTO `toocms_file` VALUES ('4', 'timg3.jpg', '89687', 'jpg', '2adebb5f40d2113df7078dd4da16e57a', '96ebf2dae23c1739e6ad673f3b444768d45c2e92', 'application/octet-stream', '599cf752b8324.jpg', 'Article/2017-08-23/', '0', '/Uploads/Article/2017-08-23/599cf752b8324.jpg', 'http://cjml-file.toocms-project.com//Uploads/Article/2017-08-23/599cf752b8324.jpg', '', '', '1503459154', '1');
INSERT INTO `toocms_file` VALUES ('5', 'timg4.jpg', '157113', 'jpg', '3ad894be47b67f194f0b0259fa4f47f6', '46097439757b23e44bfb7484dcd312e0dceee0e9', 'application/octet-stream', '599cf756ad056.jpg', 'Article/2017-08-23/', '0', '/Uploads/Article/2017-08-23/599cf756ad056.jpg', 'http://cjml-file.toocms-project.com//Uploads/Article/2017-08-23/599cf756ad056.jpg', '', '', '1503459158', '1');

-- ----------------------------
-- Table structure for toocms_file_extend
-- ----------------------------
DROP TABLE IF EXISTS `toocms_file_extend`;
CREATE TABLE `toocms_file_extend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'file表主键',
  `description` varchar(225) NOT NULL DEFAULT '' COMMENT '文件描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文件信息扩展表 别名file_ext';

-- ----------------------------
-- Records of toocms_file_extend
-- ----------------------------
INSERT INTO `toocms_file_extend` VALUES ('1', '1', '');
INSERT INTO `toocms_file_extend` VALUES ('2', '2', '');
INSERT INTO `toocms_file_extend` VALUES ('3', '3', '');
INSERT INTO `toocms_file_extend` VALUES ('4', '4', '');
INSERT INTO `toocms_file_extend` VALUES ('5', '5', '');

-- ----------------------------
-- Table structure for toocms_hooks
-- ----------------------------
DROP TABLE IF EXISTS `toocms_hooks`;
CREATE TABLE `toocms_hooks` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` varchar(225) NOT NULL DEFAULT '' COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `plugins` varchar(105) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='钩子表 别名hook';

-- ----------------------------
-- Records of toocms_hooks
-- ----------------------------
INSERT INTO `toocms_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', '0', 'Editor,Send');
INSERT INTO `toocms_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '0', '1378982734', 'EditorForAdmin');
INSERT INTO `toocms_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '0', '1452667784', 'SystemInfo,DevTeam');
INSERT INTO `toocms_hooks` VALUES ('19', 'upload', '文件上传', '1', '1442042949', '1443057821', 'UploadFile');
INSERT INTO `toocms_hooks` VALUES ('20', 'map', '地图标注', '1', '1446093397', '1448243398', 'Map');
INSERT INTO `toocms_hooks` VALUES ('22', 'interconnect', '第三方互联登录钩子', '1', '1450916265', '0', 'Interconnect');
INSERT INTO `toocms_hooks` VALUES ('23', 'statistics', '统计插件钩子', '1', '1451355106', '0', 'Statistics');
INSERT INTO `toocms_hooks` VALUES ('24', 'quickSort', '列表头部快速排序', '1', '1467712326', '1467712353', 'QuickSort');

-- ----------------------------
-- Table structure for toocms_plugins
-- ----------------------------
DROP TABLE IF EXISTS `toocms_plugins`;
CREATE TABLE `toocms_plugins` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` varchar(105) DEFAULT NULL COMMENT '插件描述',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1可用 0禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COMMENT='插件表 别名plug';

-- ----------------------------
-- Records of toocms_plugins
-- ----------------------------
INSERT INTO `toocms_plugins` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"2\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '1472449779', '1');
INSERT INTO `toocms_plugins` VALUES ('93', 'DevTeam', '开发团队信息', '开发团队成员信息', '{\"title\":\"\\u5f00\\u53d1\\u56e2\\u961f\",\"display\":\"1\",\"aaa\":\"1\",\"bbb\":[\"1\"],\"picture\":\"83,84\",\"comment_uid_youyan\":\"90040\",\"width\\uff11\":\"\\uff14\",\"picture_23\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', '黑暗中的武者', '0.1', '1442559113', '1443061204', '1');
INSERT INTO `toocms_plugins` VALUES ('94', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '{\"editor_type\":\"1\",\"editor_wysiwyg\":1,\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1442629108', '0', '1');
INSERT INTO `toocms_plugins` VALUES ('96', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"display\":\"1\"}', '黑暗中的武者', '0.1', '1446006364', '0', '1');
INSERT INTO `toocms_plugins` VALUES ('92', 'UploadFile', '文件上传', '文件上传', '{\"width\":\"120\",\"height\":\"30\"}', '黑暗中的武者', '0.1', '1442558514', '1448243391', '1');
INSERT INTO `toocms_plugins` VALUES ('111', 'Map', '地图标注', '地图标注', '{\"platform\":\"1\"}', '黑暗中的武者', '0.1', '1451424444', '1451424522', '1');
INSERT INTO `toocms_plugins` VALUES ('114', 'Statistics', '基本统计插件', '基本的柱形图、线形图、饼状图', '{\"height\":\"350px\"}', '黑暗中的武者', '0.1', '1452054563', '1452054607', '1');
INSERT INTO `toocms_plugins` VALUES ('113', 'Interconnect', '第三方互联登陆', '使用QQ、新浪微博、腾讯微博等登陆', '{\"qq_app_id\":\"101276783\",\"qq_app_key\":\"b1ccc87871ff7f19079f892c0c79f62f\",\"sina_app_key\":\"\",\"sina_app_secret\":\"\",\"wx_app_id\":\"wxbddbd138b27f303d\",\"wx_app_secret\":\"d20d5bc2fcc10820136ce286c3683265\"}', '黑暗中的武者', '0.1', '1451450843', '1482485873', '1');
INSERT INTO `toocms_plugins` VALUES ('118', 'QuickSort', '快速排序', '列表头部快速排序插件', '{\"size\":\"14px\"}', '黑暗中的武者', '0.1', '1467712420', '1467768758', '1');

-- ----------------------------
-- Table structure for toocms_recycle
-- ----------------------------
DROP TABLE IF EXISTS `toocms_recycle`;
CREATE TABLE `toocms_recycle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `model` varchar(45) NOT NULL DEFAULT '' COMMENT '数据模型名称',
  `record_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '删除数据ID',
  `data` text NOT NULL COMMENT '删除的数据 序列化',
  `is_relation_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否关联删除的记录',
  `relation_records` text NOT NULL COMMENT '关联删除的记录ID',
  `top_model` varchar(45) NOT NULL DEFAULT '' COMMENT '最顶级删除模型名称',
  `top_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '顶级删除的数据ID',
  `show_data` varchar(105) NOT NULL DEFAULT '' COMMENT '列表展示的一些数据',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `admin_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '删除者ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据库回收站 别名ryl';

-- ----------------------------
-- Records of toocms_recycle
-- ----------------------------

-- ----------------------------
-- Table structure for toocms_region
-- ----------------------------
DROP TABLE IF EXISTS `toocms_region`;
CREATE TABLE `toocms_region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `region_name` char(10) NOT NULL DEFAULT '' COMMENT '地区名称',
  `region_type` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '地区类型 1--国家 2--省 3--城市 4--区/县',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级地区ID',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否热门 0--否  1--是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0--不可用  1--可用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8 COMMENT='地区表  别名reg';

-- ----------------------------
-- Records of toocms_region
-- ----------------------------
INSERT INTO `toocms_region` VALUES ('1', '中国', '0', '0', '0', '1');
INSERT INTO `toocms_region` VALUES ('2', '北京', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('3', '安徽', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('4', '福建', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('5', '甘肃', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('6', '广东', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('7', '广西', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('8', '贵州', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('9', '海南', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('10', '河北', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('11', '河南', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('12', '黑龙江', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('13', '湖北', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('14', '湖南', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('15', '吉林', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('16', '江苏', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('17', '江西', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('18', '辽宁', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('19', '内蒙古', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('20', '宁夏', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('21', '青海', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('22', '山东', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('23', '山西', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('24', '陕西', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('25', '上海', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('26', '四川', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('27', '天津', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('28', '西藏', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('29', '新疆', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('30', '云南', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('31', '浙江', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('32', '重庆', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('33', '香港', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('34', '澳门', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('35', '台湾', '1', '1', '0', '1');
INSERT INTO `toocms_region` VALUES ('36', '安庆', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('37', '蚌埠', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('38', '巢湖', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('39', '池州', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('40', '滁州', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('41', '阜阳', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('42', '淮北', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('43', '淮南', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('44', '黄山', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('45', '六安', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('46', '马鞍山', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('47', '宿州', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('48', '铜陵', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('49', '芜湖', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('50', '宣城', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('51', '亳州', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('52', '北京', '2', '2', '0', '1');
INSERT INTO `toocms_region` VALUES ('53', '福州', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('54', '龙岩', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('55', '南平', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('56', '宁德', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('57', '莆田', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('58', '泉州', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('59', '三明', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('60', '厦门', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('61', '漳州', '2', '4', '0', '1');
INSERT INTO `toocms_region` VALUES ('62', '兰州', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('63', '白银', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('64', '定西', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('65', '甘南', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('66', '嘉峪关', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('67', '金昌', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('68', '酒泉', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('69', '临夏', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('70', '陇南', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('71', '平凉', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('72', '庆阳', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('73', '天水', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('74', '武威', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('75', '张掖', '2', '5', '0', '1');
INSERT INTO `toocms_region` VALUES ('76', '广州', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('77', '深圳', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('78', '潮州', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('79', '东莞', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('80', '佛山', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('81', '河源', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('82', '惠州', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('83', '江门', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('84', '揭阳', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('85', '茂名', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('86', '梅州', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('87', '清远', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('88', '汕头', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('89', '汕尾', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('90', '韶关', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('91', '阳江', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('92', '云浮', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('93', '湛江', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('94', '肇庆', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('95', '中山', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('96', '珠海', '2', '6', '0', '1');
INSERT INTO `toocms_region` VALUES ('97', '南宁', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('98', '桂林', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('99', '百色', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('100', '北海', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('101', '崇左', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('102', '防城港', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('103', '贵港', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('104', '河池', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('105', '贺州', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('106', '来宾', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('107', '柳州', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('108', '钦州', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('109', '梧州', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('110', '玉林', '2', '7', '0', '1');
INSERT INTO `toocms_region` VALUES ('111', '贵阳', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('112', '安顺', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('113', '毕节', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('114', '六盘水', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('115', '黔东南', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('116', '黔南', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('117', '黔西南', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('118', '铜仁', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('119', '遵义', '2', '8', '0', '1');
INSERT INTO `toocms_region` VALUES ('120', '海口', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('121', '三亚', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('122', '白沙', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('123', '保亭', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('124', '昌江', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('125', '澄迈县', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('126', '定安县', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('127', '东方', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('128', '乐东', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('129', '临高县', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('130', '陵水', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('131', '琼海', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('132', '琼中', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('133', '屯昌县', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('134', '万宁', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('135', '文昌', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('136', '五指山', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('137', '儋州', '2', '9', '0', '1');
INSERT INTO `toocms_region` VALUES ('138', '石家庄', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('139', '保定', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('140', '沧州', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('141', '承德', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('142', '邯郸', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('143', '衡水', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('144', '廊坊', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('145', '秦皇岛', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('146', '唐山', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('147', '邢台', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('148', '张家口', '2', '10', '0', '1');
INSERT INTO `toocms_region` VALUES ('149', '郑州', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('150', '洛阳', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('151', '开封', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('152', '安阳', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('153', '鹤壁', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('154', '济源', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('155', '焦作', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('156', '南阳', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('157', '平顶山', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('158', '三门峡', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('159', '商丘', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('160', '新乡', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('161', '信阳', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('162', '许昌', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('163', '周口', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('164', '驻马店', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('165', '漯河', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('166', '濮阳', '2', '11', '0', '1');
INSERT INTO `toocms_region` VALUES ('167', '哈尔滨', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('168', '大庆', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('169', '大兴安岭', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('170', '鹤岗', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('171', '黑河', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('172', '鸡西', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('173', '佳木斯', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('174', '牡丹江', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('175', '七台河', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('176', '齐齐哈尔', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('177', '双鸭山', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('178', '绥化', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('179', '伊春', '2', '12', '0', '1');
INSERT INTO `toocms_region` VALUES ('180', '武汉', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('181', '仙桃', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('182', '鄂州', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('183', '黄冈', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('184', '黄石', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('185', '荆门', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('186', '荆州', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('187', '潜江', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('188', '神农架林区', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('189', '十堰', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('190', '随州', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('191', '天门', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('192', '咸宁', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('193', '襄樊', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('194', '孝感', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('195', '宜昌', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('196', '恩施', '2', '13', '0', '1');
INSERT INTO `toocms_region` VALUES ('197', '长沙', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('198', '张家界', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('199', '常德', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('200', '郴州', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('201', '衡阳', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('202', '怀化', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('203', '娄底', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('204', '邵阳', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('205', '湘潭', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('206', '湘西', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('207', '益阳', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('208', '永州', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('209', '岳阳', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('210', '株洲', '2', '14', '0', '1');
INSERT INTO `toocms_region` VALUES ('211', '长春', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('212', '吉林', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('213', '白城', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('214', '白山', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('215', '辽源', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('216', '四平', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('217', '松原', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('218', '通化', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('219', '延边', '2', '15', '0', '1');
INSERT INTO `toocms_region` VALUES ('220', '南京', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('221', '苏州', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('222', '无锡', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('223', '常州', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('224', '淮安', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('225', '连云港', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('226', '南通', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('227', '宿迁', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('228', '泰州', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('229', '徐州', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('230', '盐城', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('231', '扬州', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('232', '镇江', '2', '16', '0', '1');
INSERT INTO `toocms_region` VALUES ('233', '南昌', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('234', '抚州', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('235', '赣州', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('236', '吉安', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('237', '景德镇', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('238', '九江', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('239', '萍乡', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('240', '上饶', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('241', '新余', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('242', '宜春', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('243', '鹰潭', '2', '17', '0', '1');
INSERT INTO `toocms_region` VALUES ('244', '沈阳', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('245', '大连', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('246', '鞍山', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('247', '本溪', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('248', '朝阳', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('249', '丹东', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('250', '抚顺', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('251', '阜新', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('252', '葫芦岛', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('253', '锦州', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('254', '辽阳', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('255', '盘锦', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('256', '铁岭', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('257', '营口', '2', '18', '0', '1');
INSERT INTO `toocms_region` VALUES ('258', '呼和浩特', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('259', '阿拉善盟', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('260', '巴彦淖尔盟', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('261', '包头', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('262', '赤峰', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('263', '鄂尔多斯', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('264', '呼伦贝尔', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('265', '通辽', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('266', '乌海', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('267', '乌兰察布市', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('268', '锡林郭勒盟', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('269', '兴安盟', '2', '19', '0', '1');
INSERT INTO `toocms_region` VALUES ('270', '银川', '2', '20', '0', '1');
INSERT INTO `toocms_region` VALUES ('271', '固原', '2', '20', '0', '1');
INSERT INTO `toocms_region` VALUES ('272', '石嘴山', '2', '20', '0', '1');
INSERT INTO `toocms_region` VALUES ('273', '吴忠', '2', '20', '0', '1');
INSERT INTO `toocms_region` VALUES ('274', '中卫', '2', '20', '0', '1');
INSERT INTO `toocms_region` VALUES ('275', '西宁', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('276', '果洛', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('277', '海北', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('278', '海东', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('279', '海南', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('280', '海西', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('281', '黄南', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('282', '玉树', '2', '21', '0', '1');
INSERT INTO `toocms_region` VALUES ('283', '济南', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('284', '青岛', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('285', '滨州', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('286', '德州', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('287', '东营', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('288', '菏泽', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('289', '济宁', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('290', '莱芜', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('291', '聊城', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('292', '临沂', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('293', '日照', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('294', '泰安', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('295', '威海', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('296', '潍坊', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('297', '烟台', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('298', '枣庄', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('299', '淄博', '2', '22', '0', '1');
INSERT INTO `toocms_region` VALUES ('300', '太原', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('301', '长治', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('302', '大同', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('303', '晋城', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('304', '晋中', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('305', '临汾', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('306', '吕梁', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('307', '朔州', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('308', '忻州', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('309', '阳泉', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('310', '运城', '2', '23', '0', '1');
INSERT INTO `toocms_region` VALUES ('311', '西安', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('312', '安康', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('313', '宝鸡', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('314', '汉中', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('315', '商洛', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('316', '铜川', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('317', '渭南', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('318', '咸阳', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('319', '延安', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('320', '榆林', '2', '24', '0', '1');
INSERT INTO `toocms_region` VALUES ('321', '上海', '2', '25', '0', '1');
INSERT INTO `toocms_region` VALUES ('322', '成都', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('323', '绵阳', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('324', '阿坝', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('325', '巴中', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('326', '达州', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('327', '德阳', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('328', '甘孜', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('329', '广安', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('330', '广元', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('331', '乐山', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('332', '凉山', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('333', '眉山', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('334', '南充', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('335', '内江', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('336', '攀枝花', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('337', '遂宁', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('338', '雅安', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('339', '宜宾', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('340', '资阳', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('341', '自贡', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('342', '泸州', '2', '26', '0', '1');
INSERT INTO `toocms_region` VALUES ('343', '天津', '2', '27', '0', '1');
INSERT INTO `toocms_region` VALUES ('344', '拉萨', '2', '28', '0', '1');
INSERT INTO `toocms_region` VALUES ('345', '阿里', '2', '28', '0', '1');
INSERT INTO `toocms_region` VALUES ('346', '昌都', '2', '28', '0', '1');
INSERT INTO `toocms_region` VALUES ('347', '林芝', '2', '28', '0', '1');
INSERT INTO `toocms_region` VALUES ('348', '那曲', '2', '28', '0', '1');
INSERT INTO `toocms_region` VALUES ('349', '日喀则', '2', '28', '0', '1');
INSERT INTO `toocms_region` VALUES ('350', '山南', '2', '28', '0', '1');
INSERT INTO `toocms_region` VALUES ('351', '乌鲁木齐', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('352', '阿克苏', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('353', '阿拉尔', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('354', '巴音郭楞', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('355', '博尔塔拉', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('356', '昌吉', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('357', '哈密', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('358', '和田', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('359', '喀什', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('360', '克拉玛依', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('361', '克孜勒苏', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('362', '石河子', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('363', '图木舒克', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('364', '吐鲁番', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('365', '五家渠', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('366', '伊犁', '2', '29', '0', '1');
INSERT INTO `toocms_region` VALUES ('367', '昆明', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('368', '怒江', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('369', '普洱', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('370', '丽江', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('371', '保山', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('372', '楚雄', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('373', '大理', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('374', '德宏', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('375', '迪庆', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('376', '红河', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('377', '临沧', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('378', '曲靖', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('379', '文山', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('380', '西双版纳', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('381', '玉溪', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('382', '昭通', '2', '30', '0', '1');
INSERT INTO `toocms_region` VALUES ('383', '杭州', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('384', '湖州', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('385', '嘉兴', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('386', '金华', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('387', '丽水', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('388', '宁波', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('389', '绍兴', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('390', '台州', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('391', '温州', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('392', '舟山', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('393', '衢州', '2', '31', '0', '1');
INSERT INTO `toocms_region` VALUES ('394', '重庆', '2', '32', '0', '1');
INSERT INTO `toocms_region` VALUES ('395', '香港', '2', '33', '0', '1');
INSERT INTO `toocms_region` VALUES ('396', '澳门', '2', '34', '0', '1');
INSERT INTO `toocms_region` VALUES ('397', '台湾', '2', '35', '0', '1');
INSERT INTO `toocms_region` VALUES ('398', '迎江区', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('399', '大观区', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('400', '宜秀区', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('401', '桐城市', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('402', '怀宁县', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('403', '枞阳县', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('404', '潜山县', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('405', '太湖县', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('406', '宿松县', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('407', '望江县', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('408', '岳西县', '3', '36', '0', '1');
INSERT INTO `toocms_region` VALUES ('409', '中市区', '3', '37', '0', '1');
INSERT INTO `toocms_region` VALUES ('410', '东市区', '3', '37', '0', '1');
INSERT INTO `toocms_region` VALUES ('411', '西市区', '3', '37', '0', '1');
INSERT INTO `toocms_region` VALUES ('412', '郊区', '3', '37', '0', '1');
INSERT INTO `toocms_region` VALUES ('413', '怀远县', '3', '37', '0', '1');
INSERT INTO `toocms_region` VALUES ('414', '五河县', '3', '37', '0', '1');
INSERT INTO `toocms_region` VALUES ('415', '固镇县', '3', '37', '0', '1');
INSERT INTO `toocms_region` VALUES ('416', '居巢区', '3', '38', '0', '1');
INSERT INTO `toocms_region` VALUES ('417', '庐江县', '3', '38', '0', '1');
INSERT INTO `toocms_region` VALUES ('418', '无为县', '3', '38', '0', '1');
INSERT INTO `toocms_region` VALUES ('419', '含山县', '3', '38', '0', '1');
INSERT INTO `toocms_region` VALUES ('420', '和县', '3', '38', '0', '1');
INSERT INTO `toocms_region` VALUES ('421', '贵池区', '3', '39', '0', '1');
INSERT INTO `toocms_region` VALUES ('422', '东至县', '3', '39', '0', '1');
INSERT INTO `toocms_region` VALUES ('423', '石台县', '3', '39', '0', '1');
INSERT INTO `toocms_region` VALUES ('424', '青阳县', '3', '39', '0', '1');
INSERT INTO `toocms_region` VALUES ('425', '琅琊区', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('426', '南谯区', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('427', '天长市', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('428', '明光市', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('429', '来安县', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('430', '全椒县', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('431', '定远县', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('432', '凤阳县', '3', '40', '0', '1');
INSERT INTO `toocms_region` VALUES ('433', '蚌山区', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('434', '龙子湖区', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('435', '禹会区', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('436', '淮上区', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('437', '颍州区', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('438', '颍东区', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('439', '颍泉区', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('440', '界首市', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('441', '临泉县', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('442', '太和县', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('443', '阜南县', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('444', '颖上县', '3', '41', '0', '1');
INSERT INTO `toocms_region` VALUES ('445', '相山区', '3', '42', '0', '1');
INSERT INTO `toocms_region` VALUES ('446', '杜集区', '3', '42', '0', '1');
INSERT INTO `toocms_region` VALUES ('447', '烈山区', '3', '42', '0', '1');
INSERT INTO `toocms_region` VALUES ('448', '濉溪县', '3', '42', '0', '1');
INSERT INTO `toocms_region` VALUES ('449', '田家庵区', '3', '43', '0', '1');
INSERT INTO `toocms_region` VALUES ('450', '大通区', '3', '43', '0', '1');
INSERT INTO `toocms_region` VALUES ('451', '谢家集区', '3', '43', '0', '1');
INSERT INTO `toocms_region` VALUES ('452', '八公山区', '3', '43', '0', '1');
INSERT INTO `toocms_region` VALUES ('453', '潘集区', '3', '43', '0', '1');
INSERT INTO `toocms_region` VALUES ('454', '凤台县', '3', '43', '0', '1');
INSERT INTO `toocms_region` VALUES ('455', '屯溪区', '3', '44', '0', '1');
INSERT INTO `toocms_region` VALUES ('456', '黄山区', '3', '44', '0', '1');
INSERT INTO `toocms_region` VALUES ('457', '徽州区', '3', '44', '0', '1');
INSERT INTO `toocms_region` VALUES ('458', '歙县', '3', '44', '0', '1');
INSERT INTO `toocms_region` VALUES ('459', '休宁县', '3', '44', '0', '1');
INSERT INTO `toocms_region` VALUES ('460', '黟县', '3', '44', '0', '1');
INSERT INTO `toocms_region` VALUES ('461', '祁门县', '3', '44', '0', '1');
INSERT INTO `toocms_region` VALUES ('462', '金安区', '3', '45', '0', '1');
INSERT INTO `toocms_region` VALUES ('463', '裕安区', '3', '45', '0', '1');
INSERT INTO `toocms_region` VALUES ('464', '寿县', '3', '45', '0', '1');
INSERT INTO `toocms_region` VALUES ('465', '霍邱县', '3', '45', '0', '1');
INSERT INTO `toocms_region` VALUES ('466', '舒城县', '3', '45', '0', '1');
INSERT INTO `toocms_region` VALUES ('467', '金寨县', '3', '45', '0', '1');
INSERT INTO `toocms_region` VALUES ('468', '霍山县', '3', '45', '0', '1');
INSERT INTO `toocms_region` VALUES ('469', '雨山区', '3', '46', '0', '1');
INSERT INTO `toocms_region` VALUES ('470', '花山区', '3', '46', '0', '1');
INSERT INTO `toocms_region` VALUES ('471', '金家庄区', '3', '46', '0', '1');
INSERT INTO `toocms_region` VALUES ('472', '当涂县', '3', '46', '0', '1');
INSERT INTO `toocms_region` VALUES ('473', '埇桥区', '3', '47', '0', '1');
INSERT INTO `toocms_region` VALUES ('474', '砀山县', '3', '47', '0', '1');
INSERT INTO `toocms_region` VALUES ('475', '萧县', '3', '47', '0', '1');
INSERT INTO `toocms_region` VALUES ('476', '灵璧县', '3', '47', '0', '1');
INSERT INTO `toocms_region` VALUES ('477', '泗县', '3', '47', '0', '1');
INSERT INTO `toocms_region` VALUES ('478', '铜官山区', '3', '48', '0', '1');
INSERT INTO `toocms_region` VALUES ('479', '狮子山区', '3', '48', '0', '1');
INSERT INTO `toocms_region` VALUES ('480', '郊区', '3', '48', '0', '1');
INSERT INTO `toocms_region` VALUES ('481', '铜陵县', '3', '48', '0', '1');
INSERT INTO `toocms_region` VALUES ('482', '镜湖区', '3', '49', '0', '1');
INSERT INTO `toocms_region` VALUES ('483', '弋江区', '3', '49', '0', '1');
INSERT INTO `toocms_region` VALUES ('484', '鸠江区', '3', '49', '0', '1');
INSERT INTO `toocms_region` VALUES ('485', '三山区', '3', '49', '0', '1');
INSERT INTO `toocms_region` VALUES ('486', '芜湖县', '3', '49', '0', '1');
INSERT INTO `toocms_region` VALUES ('487', '繁昌县', '3', '49', '0', '1');
INSERT INTO `toocms_region` VALUES ('488', '南陵县', '3', '49', '0', '1');
INSERT INTO `toocms_region` VALUES ('489', '宣州区', '3', '50', '0', '1');
INSERT INTO `toocms_region` VALUES ('490', '宁国市', '3', '50', '0', '1');
INSERT INTO `toocms_region` VALUES ('491', '郎溪县', '3', '50', '0', '1');
INSERT INTO `toocms_region` VALUES ('492', '广德县', '3', '50', '0', '1');
INSERT INTO `toocms_region` VALUES ('493', '泾县', '3', '50', '0', '1');
INSERT INTO `toocms_region` VALUES ('494', '绩溪县', '3', '50', '0', '1');
INSERT INTO `toocms_region` VALUES ('495', '旌德县', '3', '50', '0', '1');
INSERT INTO `toocms_region` VALUES ('496', '涡阳县', '3', '51', '0', '1');
INSERT INTO `toocms_region` VALUES ('497', '蒙城县', '3', '51', '0', '1');
INSERT INTO `toocms_region` VALUES ('498', '利辛县', '3', '51', '0', '1');
INSERT INTO `toocms_region` VALUES ('499', '谯城区', '3', '51', '0', '1');
INSERT INTO `toocms_region` VALUES ('500', '东城区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('501', '西城区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('502', '海淀区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('503', '朝阳区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('504', '崇文区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('505', '宣武区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('506', '丰台区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('507', '石景山区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('508', '房山区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('509', '门头沟区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('510', '通州区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('511', '顺义区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('512', '昌平区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('513', '怀柔区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('514', '平谷区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('515', '大兴区', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('516', '密云县', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('517', '延庆县', '3', '52', '0', '1');
INSERT INTO `toocms_region` VALUES ('518', '鼓楼区', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('519', '台江区', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('520', '仓山区', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('521', '马尾区', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('522', '晋安区', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('523', '福清市', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('524', '长乐市', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('525', '闽侯县', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('526', '连江县', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('527', '罗源县', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('528', '闽清县', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('529', '永泰县', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('530', '平潭县', '3', '53', '0', '1');
INSERT INTO `toocms_region` VALUES ('531', '新罗区', '3', '54', '0', '1');
INSERT INTO `toocms_region` VALUES ('532', '漳平市', '3', '54', '0', '1');
INSERT INTO `toocms_region` VALUES ('533', '长汀县', '3', '54', '0', '1');
INSERT INTO `toocms_region` VALUES ('534', '永定县', '3', '54', '0', '1');
INSERT INTO `toocms_region` VALUES ('535', '上杭县', '3', '54', '0', '1');
INSERT INTO `toocms_region` VALUES ('536', '武平县', '3', '54', '0', '1');
INSERT INTO `toocms_region` VALUES ('537', '连城县', '3', '54', '0', '1');
INSERT INTO `toocms_region` VALUES ('538', '延平区', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('539', '邵武市', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('540', '武夷山市', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('541', '建瓯市', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('542', '建阳市', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('543', '顺昌县', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('544', '浦城县', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('545', '光泽县', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('546', '松溪县', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('547', '政和县', '3', '55', '0', '1');
INSERT INTO `toocms_region` VALUES ('548', '蕉城区', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('549', '福安市', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('550', '福鼎市', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('551', '霞浦县', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('552', '古田县', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('553', '屏南县', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('554', '寿宁县', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('555', '周宁县', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('556', '柘荣县', '3', '56', '0', '1');
INSERT INTO `toocms_region` VALUES ('557', '城厢区', '3', '57', '0', '1');
INSERT INTO `toocms_region` VALUES ('558', '涵江区', '3', '57', '0', '1');
INSERT INTO `toocms_region` VALUES ('559', '荔城区', '3', '57', '0', '1');
INSERT INTO `toocms_region` VALUES ('560', '秀屿区', '3', '57', '0', '1');
INSERT INTO `toocms_region` VALUES ('561', '仙游县', '3', '57', '0', '1');
INSERT INTO `toocms_region` VALUES ('562', '鲤城区', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('563', '丰泽区', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('564', '洛江区', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('565', '清濛开发区', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('566', '泉港区', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('567', '石狮市', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('568', '晋江市', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('569', '南安市', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('570', '惠安县', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('571', '安溪县', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('572', '永春县', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('573', '德化县', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('574', '金门县', '3', '58', '0', '1');
INSERT INTO `toocms_region` VALUES ('575', '梅列区', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('576', '三元区', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('577', '永安市', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('578', '明溪县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('579', '清流县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('580', '宁化县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('581', '大田县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('582', '尤溪县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('583', '沙县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('584', '将乐县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('585', '泰宁县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('586', '建宁县', '3', '59', '0', '1');
INSERT INTO `toocms_region` VALUES ('587', '思明区', '3', '60', '0', '1');
INSERT INTO `toocms_region` VALUES ('588', '海沧区', '3', '60', '0', '1');
INSERT INTO `toocms_region` VALUES ('589', '湖里区', '3', '60', '0', '1');
INSERT INTO `toocms_region` VALUES ('590', '集美区', '3', '60', '0', '1');
INSERT INTO `toocms_region` VALUES ('591', '同安区', '3', '60', '0', '1');
INSERT INTO `toocms_region` VALUES ('592', '翔安区', '3', '60', '0', '1');
INSERT INTO `toocms_region` VALUES ('593', '芗城区', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('594', '龙文区', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('595', '龙海市', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('596', '云霄县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('597', '漳浦县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('598', '诏安县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('599', '长泰县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('600', '东山县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('601', '南靖县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('602', '平和县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('603', '华安县', '3', '61', '0', '1');
INSERT INTO `toocms_region` VALUES ('604', '皋兰县', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('605', '城关区', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('606', '七里河区', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('607', '西固区', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('608', '安宁区', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('609', '红古区', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('610', '永登县', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('611', '榆中县', '3', '62', '0', '1');
INSERT INTO `toocms_region` VALUES ('612', '白银区', '3', '63', '0', '1');
INSERT INTO `toocms_region` VALUES ('613', '平川区', '3', '63', '0', '1');
INSERT INTO `toocms_region` VALUES ('614', '会宁县', '3', '63', '0', '1');
INSERT INTO `toocms_region` VALUES ('615', '景泰县', '3', '63', '0', '1');
INSERT INTO `toocms_region` VALUES ('616', '靖远县', '3', '63', '0', '1');
INSERT INTO `toocms_region` VALUES ('617', '临洮县', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('618', '陇西县', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('619', '通渭县', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('620', '渭源县', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('621', '漳县', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('622', '岷县', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('623', '安定区', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('624', '安定区', '3', '64', '0', '1');
INSERT INTO `toocms_region` VALUES ('625', '合作市', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('626', '临潭县', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('627', '卓尼县', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('628', '舟曲县', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('629', '迭部县', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('630', '玛曲县', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('631', '碌曲县', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('632', '夏河县', '3', '65', '0', '1');
INSERT INTO `toocms_region` VALUES ('633', '嘉峪关市', '3', '66', '0', '1');
INSERT INTO `toocms_region` VALUES ('634', '金川区', '3', '67', '0', '1');
INSERT INTO `toocms_region` VALUES ('635', '永昌县', '3', '67', '0', '1');
INSERT INTO `toocms_region` VALUES ('636', '肃州区', '3', '68', '0', '1');
INSERT INTO `toocms_region` VALUES ('637', '玉门市', '3', '68', '0', '1');
INSERT INTO `toocms_region` VALUES ('638', '敦煌市', '3', '68', '0', '1');
INSERT INTO `toocms_region` VALUES ('639', '金塔县', '3', '68', '0', '1');
INSERT INTO `toocms_region` VALUES ('640', '瓜州县', '3', '68', '0', '1');
INSERT INTO `toocms_region` VALUES ('641', '肃北', '3', '68', '0', '1');
INSERT INTO `toocms_region` VALUES ('642', '阿克塞', '3', '68', '0', '1');
INSERT INTO `toocms_region` VALUES ('643', '临夏市', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('644', '临夏县', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('645', '康乐县', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('646', '永靖县', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('647', '广河县', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('648', '和政县', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('649', '东乡族自治县', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('650', '积石山', '3', '69', '0', '1');
INSERT INTO `toocms_region` VALUES ('651', '成县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('652', '徽县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('653', '康县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('654', '礼县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('655', '两当县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('656', '文县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('657', '西和县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('658', '宕昌县', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('659', '武都区', '3', '70', '0', '1');
INSERT INTO `toocms_region` VALUES ('660', '崇信县', '3', '71', '0', '1');
INSERT INTO `toocms_region` VALUES ('661', '华亭县', '3', '71', '0', '1');
INSERT INTO `toocms_region` VALUES ('662', '静宁县', '3', '71', '0', '1');
INSERT INTO `toocms_region` VALUES ('663', '灵台县', '3', '71', '0', '1');
INSERT INTO `toocms_region` VALUES ('664', '崆峒区', '3', '71', '0', '1');
INSERT INTO `toocms_region` VALUES ('665', '庄浪县', '3', '71', '0', '1');
INSERT INTO `toocms_region` VALUES ('666', '泾川县', '3', '71', '0', '1');
INSERT INTO `toocms_region` VALUES ('667', '合水县', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('668', '华池县', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('669', '环县', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('670', '宁县', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('671', '庆城县', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('672', '西峰区', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('673', '镇原县', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('674', '正宁县', '3', '72', '0', '1');
INSERT INTO `toocms_region` VALUES ('675', '甘谷县', '3', '73', '0', '1');
INSERT INTO `toocms_region` VALUES ('676', '秦安县', '3', '73', '0', '1');
INSERT INTO `toocms_region` VALUES ('677', '清水县', '3', '73', '0', '1');
INSERT INTO `toocms_region` VALUES ('678', '秦州区', '3', '73', '0', '1');
INSERT INTO `toocms_region` VALUES ('679', '麦积区', '3', '73', '0', '1');
INSERT INTO `toocms_region` VALUES ('680', '武山县', '3', '73', '0', '1');
INSERT INTO `toocms_region` VALUES ('681', '张家川', '3', '73', '0', '1');
INSERT INTO `toocms_region` VALUES ('682', '古浪县', '3', '74', '0', '1');
INSERT INTO `toocms_region` VALUES ('683', '民勤县', '3', '74', '0', '1');
INSERT INTO `toocms_region` VALUES ('684', '天祝', '3', '74', '0', '1');
INSERT INTO `toocms_region` VALUES ('685', '凉州区', '3', '74', '0', '1');
INSERT INTO `toocms_region` VALUES ('686', '高台县', '3', '75', '0', '1');
INSERT INTO `toocms_region` VALUES ('687', '临泽县', '3', '75', '0', '1');
INSERT INTO `toocms_region` VALUES ('688', '民乐县', '3', '75', '0', '1');
INSERT INTO `toocms_region` VALUES ('689', '山丹县', '3', '75', '0', '1');
INSERT INTO `toocms_region` VALUES ('690', '肃南', '3', '75', '0', '1');
INSERT INTO `toocms_region` VALUES ('691', '甘州区', '3', '75', '0', '1');
INSERT INTO `toocms_region` VALUES ('692', '从化市', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('693', '天河区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('694', '东山区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('695', '白云区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('696', '海珠区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('697', '荔湾区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('698', '越秀区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('699', '黄埔区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('700', '番禺区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('701', '花都区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('702', '增城区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('703', '从化区', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('704', '市郊', '3', '76', '0', '1');
INSERT INTO `toocms_region` VALUES ('705', '福田区', '3', '77', '0', '1');
INSERT INTO `toocms_region` VALUES ('706', '罗湖区', '3', '77', '0', '1');
INSERT INTO `toocms_region` VALUES ('707', '南山区', '3', '77', '0', '1');
INSERT INTO `toocms_region` VALUES ('708', '宝安区', '3', '77', '0', '1');
INSERT INTO `toocms_region` VALUES ('709', '龙岗区', '3', '77', '0', '1');
INSERT INTO `toocms_region` VALUES ('710', '盐田区', '3', '77', '0', '1');
INSERT INTO `toocms_region` VALUES ('711', '湘桥区', '3', '78', '0', '1');
INSERT INTO `toocms_region` VALUES ('712', '潮安县', '3', '78', '0', '1');
INSERT INTO `toocms_region` VALUES ('713', '饶平县', '3', '78', '0', '1');
INSERT INTO `toocms_region` VALUES ('714', '南城区', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('715', '东城区', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('716', '万江区', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('717', '莞城区', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('718', '石龙镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('719', '虎门镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('720', '麻涌镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('721', '道滘镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('722', '石碣镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('723', '沙田镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('724', '望牛墩镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('725', '洪梅镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('726', '茶山镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('727', '寮步镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('728', '大岭山镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('729', '大朗镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('730', '黄江镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('731', '樟木头', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('732', '凤岗镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('733', '塘厦镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('734', '谢岗镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('735', '厚街镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('736', '清溪镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('737', '常平镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('738', '桥头镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('739', '横沥镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('740', '东坑镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('741', '企石镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('742', '石排镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('743', '长安镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('744', '中堂镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('745', '高埗镇', '3', '79', '0', '1');
INSERT INTO `toocms_region` VALUES ('746', '禅城区', '3', '80', '0', '1');
INSERT INTO `toocms_region` VALUES ('747', '南海区', '3', '80', '0', '1');
INSERT INTO `toocms_region` VALUES ('748', '顺德区', '3', '80', '0', '1');
INSERT INTO `toocms_region` VALUES ('749', '三水区', '3', '80', '0', '1');
INSERT INTO `toocms_region` VALUES ('750', '高明区', '3', '80', '0', '1');
INSERT INTO `toocms_region` VALUES ('751', '东源县', '3', '81', '0', '1');
INSERT INTO `toocms_region` VALUES ('752', '和平县', '3', '81', '0', '1');
INSERT INTO `toocms_region` VALUES ('753', '源城区', '3', '81', '0', '1');
INSERT INTO `toocms_region` VALUES ('754', '连平县', '3', '81', '0', '1');
INSERT INTO `toocms_region` VALUES ('755', '龙川县', '3', '81', '0', '1');
INSERT INTO `toocms_region` VALUES ('756', '紫金县', '3', '81', '0', '1');
INSERT INTO `toocms_region` VALUES ('757', '惠阳区', '3', '82', '0', '1');
INSERT INTO `toocms_region` VALUES ('758', '惠城区', '3', '82', '0', '1');
INSERT INTO `toocms_region` VALUES ('759', '大亚湾', '3', '82', '0', '1');
INSERT INTO `toocms_region` VALUES ('760', '博罗县', '3', '82', '0', '1');
INSERT INTO `toocms_region` VALUES ('761', '惠东县', '3', '82', '0', '1');
INSERT INTO `toocms_region` VALUES ('762', '龙门县', '3', '82', '0', '1');
INSERT INTO `toocms_region` VALUES ('763', '江海区', '3', '83', '0', '1');
INSERT INTO `toocms_region` VALUES ('764', '蓬江区', '3', '83', '0', '1');
INSERT INTO `toocms_region` VALUES ('765', '新会区', '3', '83', '0', '1');
INSERT INTO `toocms_region` VALUES ('766', '台山市', '3', '83', '0', '1');
INSERT INTO `toocms_region` VALUES ('767', '开平市', '3', '83', '0', '1');
INSERT INTO `toocms_region` VALUES ('768', '鹤山市', '3', '83', '0', '1');
INSERT INTO `toocms_region` VALUES ('769', '恩平市', '3', '83', '0', '1');
INSERT INTO `toocms_region` VALUES ('770', '榕城区', '3', '84', '0', '1');
INSERT INTO `toocms_region` VALUES ('771', '普宁市', '3', '84', '0', '1');
INSERT INTO `toocms_region` VALUES ('772', '揭东县', '3', '84', '0', '1');
INSERT INTO `toocms_region` VALUES ('773', '揭西县', '3', '84', '0', '1');
INSERT INTO `toocms_region` VALUES ('774', '惠来县', '3', '84', '0', '1');
INSERT INTO `toocms_region` VALUES ('775', '茂南区', '3', '85', '0', '1');
INSERT INTO `toocms_region` VALUES ('776', '茂港区', '3', '85', '0', '1');
INSERT INTO `toocms_region` VALUES ('777', '高州市', '3', '85', '0', '1');
INSERT INTO `toocms_region` VALUES ('778', '化州市', '3', '85', '0', '1');
INSERT INTO `toocms_region` VALUES ('779', '信宜市', '3', '85', '0', '1');
INSERT INTO `toocms_region` VALUES ('780', '电白县', '3', '85', '0', '1');
INSERT INTO `toocms_region` VALUES ('781', '梅县', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('782', '梅江区', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('783', '兴宁市', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('784', '大埔县', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('785', '丰顺县', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('786', '五华县', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('787', '平远县', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('788', '蕉岭县', '3', '86', '0', '1');
INSERT INTO `toocms_region` VALUES ('789', '清城区', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('790', '英德市', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('791', '连州市', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('792', '佛冈县', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('793', '阳山县', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('794', '清新县', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('795', '连山', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('796', '连南', '3', '87', '0', '1');
INSERT INTO `toocms_region` VALUES ('797', '南澳县', '3', '88', '0', '1');
INSERT INTO `toocms_region` VALUES ('798', '潮阳区', '3', '88', '0', '1');
INSERT INTO `toocms_region` VALUES ('799', '澄海区', '3', '88', '0', '1');
INSERT INTO `toocms_region` VALUES ('800', '龙湖区', '3', '88', '0', '1');
INSERT INTO `toocms_region` VALUES ('801', '金平区', '3', '88', '0', '1');
INSERT INTO `toocms_region` VALUES ('802', '濠江区', '3', '88', '0', '1');
INSERT INTO `toocms_region` VALUES ('803', '潮南区', '3', '88', '0', '1');
INSERT INTO `toocms_region` VALUES ('804', '城区', '3', '89', '0', '1');
INSERT INTO `toocms_region` VALUES ('805', '陆丰市', '3', '89', '0', '1');
INSERT INTO `toocms_region` VALUES ('806', '海丰县', '3', '89', '0', '1');
INSERT INTO `toocms_region` VALUES ('807', '陆河县', '3', '89', '0', '1');
INSERT INTO `toocms_region` VALUES ('808', '曲江县', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('809', '浈江区', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('810', '武江区', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('811', '曲江区', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('812', '乐昌市', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('813', '南雄市', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('814', '始兴县', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('815', '仁化县', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('816', '翁源县', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('817', '新丰县', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('818', '乳源', '3', '90', '0', '1');
INSERT INTO `toocms_region` VALUES ('819', '江城区', '3', '91', '0', '1');
INSERT INTO `toocms_region` VALUES ('820', '阳春市', '3', '91', '0', '1');
INSERT INTO `toocms_region` VALUES ('821', '阳西县', '3', '91', '0', '1');
INSERT INTO `toocms_region` VALUES ('822', '阳东县', '3', '91', '0', '1');
INSERT INTO `toocms_region` VALUES ('823', '云城区', '3', '92', '0', '1');
INSERT INTO `toocms_region` VALUES ('824', '罗定市', '3', '92', '0', '1');
INSERT INTO `toocms_region` VALUES ('825', '新兴县', '3', '92', '0', '1');
INSERT INTO `toocms_region` VALUES ('826', '郁南县', '3', '92', '0', '1');
INSERT INTO `toocms_region` VALUES ('827', '云安县', '3', '92', '0', '1');
INSERT INTO `toocms_region` VALUES ('828', '赤坎区', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('829', '霞山区', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('830', '坡头区', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('831', '麻章区', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('832', '廉江市', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('833', '雷州市', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('834', '吴川市', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('835', '遂溪县', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('836', '徐闻县', '3', '93', '0', '1');
INSERT INTO `toocms_region` VALUES ('837', '肇庆市', '3', '94', '0', '1');
INSERT INTO `toocms_region` VALUES ('838', '高要市', '3', '94', '0', '1');
INSERT INTO `toocms_region` VALUES ('839', '四会市', '3', '94', '0', '1');
INSERT INTO `toocms_region` VALUES ('840', '广宁县', '3', '94', '0', '1');
INSERT INTO `toocms_region` VALUES ('841', '怀集县', '3', '94', '0', '1');
INSERT INTO `toocms_region` VALUES ('842', '封开县', '3', '94', '0', '1');
INSERT INTO `toocms_region` VALUES ('843', '德庆县', '3', '94', '0', '1');
INSERT INTO `toocms_region` VALUES ('844', '石岐街道', '3', '95', '0', '1');
INSERT INTO `toocms_region` VALUES ('845', '东区街道', '3', '95', '0', '1');
INSERT INTO `toocms_region` VALUES ('846', '西区街道', '3', '95', '0', '1');
INSERT INTO `toocms_region` VALUES ('847', '环城街道', '3', '95', '0', '1');
INSERT INTO `toocms_region` VALUES ('848', '中山港街道', '3', '95', '0', '1');
INSERT INTO `toocms_region` VALUES ('849', '五桂山街道', '3', '95', '0', '1');
INSERT INTO `toocms_region` VALUES ('850', '香洲区', '3', '96', '0', '1');
INSERT INTO `toocms_region` VALUES ('851', '斗门区', '3', '96', '0', '1');
INSERT INTO `toocms_region` VALUES ('852', '金湾区', '3', '96', '0', '1');
INSERT INTO `toocms_region` VALUES ('853', '邕宁区', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('854', '青秀区', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('855', '兴宁区', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('856', '良庆区', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('857', '西乡塘区', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('858', '江南区', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('859', '武鸣县', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('860', '隆安县', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('861', '马山县', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('862', '上林县', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('863', '宾阳县', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('864', '横县', '3', '97', '0', '1');
INSERT INTO `toocms_region` VALUES ('865', '秀峰区', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('866', '叠彩区', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('867', '象山区', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('868', '七星区', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('869', '雁山区', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('870', '阳朔县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('871', '临桂县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('872', '灵川县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('873', '全州县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('874', '平乐县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('875', '兴安县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('876', '灌阳县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('877', '荔浦县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('878', '资源县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('879', '永福县', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('880', '龙胜', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('881', '恭城', '3', '98', '0', '1');
INSERT INTO `toocms_region` VALUES ('882', '右江区', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('883', '凌云县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('884', '平果县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('885', '西林县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('886', '乐业县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('887', '德保县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('888', '田林县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('889', '田阳县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('890', '靖西县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('891', '田东县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('892', '那坡县', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('893', '隆林', '3', '99', '0', '1');
INSERT INTO `toocms_region` VALUES ('894', '海城区', '3', '100', '0', '1');
INSERT INTO `toocms_region` VALUES ('895', '银海区', '3', '100', '0', '1');
INSERT INTO `toocms_region` VALUES ('896', '铁山港区', '3', '100', '0', '1');
INSERT INTO `toocms_region` VALUES ('897', '合浦县', '3', '100', '0', '1');
INSERT INTO `toocms_region` VALUES ('898', '江州区', '3', '101', '0', '1');
INSERT INTO `toocms_region` VALUES ('899', '凭祥市', '3', '101', '0', '1');
INSERT INTO `toocms_region` VALUES ('900', '宁明县', '3', '101', '0', '1');
INSERT INTO `toocms_region` VALUES ('901', '扶绥县', '3', '101', '0', '1');
INSERT INTO `toocms_region` VALUES ('902', '龙州县', '3', '101', '0', '1');
INSERT INTO `toocms_region` VALUES ('903', '大新县', '3', '101', '0', '1');
INSERT INTO `toocms_region` VALUES ('904', '天等县', '3', '101', '0', '1');
INSERT INTO `toocms_region` VALUES ('905', '港口区', '3', '102', '0', '1');
INSERT INTO `toocms_region` VALUES ('906', '防城区', '3', '102', '0', '1');
INSERT INTO `toocms_region` VALUES ('907', '东兴市', '3', '102', '0', '1');
INSERT INTO `toocms_region` VALUES ('908', '上思县', '3', '102', '0', '1');
INSERT INTO `toocms_region` VALUES ('909', '港北区', '3', '103', '0', '1');
INSERT INTO `toocms_region` VALUES ('910', '港南区', '3', '103', '0', '1');
INSERT INTO `toocms_region` VALUES ('911', '覃塘区', '3', '103', '0', '1');
INSERT INTO `toocms_region` VALUES ('912', '桂平市', '3', '103', '0', '1');
INSERT INTO `toocms_region` VALUES ('913', '平南县', '3', '103', '0', '1');
INSERT INTO `toocms_region` VALUES ('914', '金城江区', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('915', '宜州市', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('916', '天峨县', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('917', '凤山县', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('918', '南丹县', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('919', '东兰县', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('920', '都安', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('921', '罗城', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('922', '巴马', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('923', '环江', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('924', '大化', '3', '104', '0', '1');
INSERT INTO `toocms_region` VALUES ('925', '八步区', '3', '105', '0', '1');
INSERT INTO `toocms_region` VALUES ('926', '钟山县', '3', '105', '0', '1');
INSERT INTO `toocms_region` VALUES ('927', '昭平县', '3', '105', '0', '1');
INSERT INTO `toocms_region` VALUES ('928', '富川', '3', '105', '0', '1');
INSERT INTO `toocms_region` VALUES ('929', '兴宾区', '3', '106', '0', '1');
INSERT INTO `toocms_region` VALUES ('930', '合山市', '3', '106', '0', '1');
INSERT INTO `toocms_region` VALUES ('931', '象州县', '3', '106', '0', '1');
INSERT INTO `toocms_region` VALUES ('932', '武宣县', '3', '106', '0', '1');
INSERT INTO `toocms_region` VALUES ('933', '忻城县', '3', '106', '0', '1');
INSERT INTO `toocms_region` VALUES ('934', '金秀', '3', '106', '0', '1');
INSERT INTO `toocms_region` VALUES ('935', '城中区', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('936', '鱼峰区', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('937', '柳北区', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('938', '柳南区', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('939', '柳江县', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('940', '柳城县', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('941', '鹿寨县', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('942', '融安县', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('943', '融水', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('944', '三江', '3', '107', '0', '1');
INSERT INTO `toocms_region` VALUES ('945', '钦南区', '3', '108', '0', '1');
INSERT INTO `toocms_region` VALUES ('946', '钦北区', '3', '108', '0', '1');
INSERT INTO `toocms_region` VALUES ('947', '灵山县', '3', '108', '0', '1');
INSERT INTO `toocms_region` VALUES ('948', '浦北县', '3', '108', '0', '1');
INSERT INTO `toocms_region` VALUES ('949', '万秀区', '3', '109', '0', '1');
INSERT INTO `toocms_region` VALUES ('950', '蝶山区', '3', '109', '0', '1');
INSERT INTO `toocms_region` VALUES ('951', '长洲区', '3', '109', '0', '1');
INSERT INTO `toocms_region` VALUES ('952', '岑溪市', '3', '109', '0', '1');
INSERT INTO `toocms_region` VALUES ('953', '苍梧县', '3', '109', '0', '1');
INSERT INTO `toocms_region` VALUES ('954', '藤县', '3', '109', '0', '1');
INSERT INTO `toocms_region` VALUES ('955', '蒙山县', '3', '109', '0', '1');
INSERT INTO `toocms_region` VALUES ('956', '玉州区', '3', '110', '0', '1');
INSERT INTO `toocms_region` VALUES ('957', '北流市', '3', '110', '0', '1');
INSERT INTO `toocms_region` VALUES ('958', '容县', '3', '110', '0', '1');
INSERT INTO `toocms_region` VALUES ('959', '陆川县', '3', '110', '0', '1');
INSERT INTO `toocms_region` VALUES ('960', '博白县', '3', '110', '0', '1');
INSERT INTO `toocms_region` VALUES ('961', '兴业县', '3', '110', '0', '1');
INSERT INTO `toocms_region` VALUES ('962', '南明区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('963', '云岩区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('964', '花溪区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('965', '乌当区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('966', '白云区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('967', '小河区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('968', '金阳新区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('969', '新天园区', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('970', '清镇市', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('971', '开阳县', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('972', '修文县', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('973', '息烽县', '3', '111', '0', '1');
INSERT INTO `toocms_region` VALUES ('974', '西秀区', '3', '112', '0', '1');
INSERT INTO `toocms_region` VALUES ('975', '关岭', '3', '112', '0', '1');
INSERT INTO `toocms_region` VALUES ('976', '镇宁', '3', '112', '0', '1');
INSERT INTO `toocms_region` VALUES ('977', '紫云', '3', '112', '0', '1');
INSERT INTO `toocms_region` VALUES ('978', '平坝县', '3', '112', '0', '1');
INSERT INTO `toocms_region` VALUES ('979', '普定县', '3', '112', '0', '1');
INSERT INTO `toocms_region` VALUES ('980', '毕节市', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('981', '大方县', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('982', '黔西县', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('983', '金沙县', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('984', '织金县', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('985', '纳雍县', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('986', '赫章县', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('987', '威宁', '3', '113', '0', '1');
INSERT INTO `toocms_region` VALUES ('988', '钟山区', '3', '114', '0', '1');
INSERT INTO `toocms_region` VALUES ('989', '六枝特区', '3', '114', '0', '1');
INSERT INTO `toocms_region` VALUES ('990', '水城县', '3', '114', '0', '1');
INSERT INTO `toocms_region` VALUES ('991', '盘县', '3', '114', '0', '1');
INSERT INTO `toocms_region` VALUES ('992', '凯里市', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('993', '黄平县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('994', '施秉县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('995', '三穗县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('996', '镇远县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('997', '岑巩县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('998', '天柱县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('999', '锦屏县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1000', '剑河县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1001', '台江县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1002', '黎平县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1003', '榕江县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1004', '从江县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1005', '雷山县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1006', '麻江县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1007', '丹寨县', '3', '115', '0', '1');
INSERT INTO `toocms_region` VALUES ('1008', '都匀市', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1009', '福泉市', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1010', '荔波县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1011', '贵定县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1012', '瓮安县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1013', '独山县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1014', '平塘县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1015', '罗甸县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1016', '长顺县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1017', '龙里县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1018', '惠水县', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1019', '三都', '3', '116', '0', '1');
INSERT INTO `toocms_region` VALUES ('1020', '兴义市', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1021', '兴仁县', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1022', '普安县', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1023', '晴隆县', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1024', '贞丰县', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1025', '望谟县', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1026', '册亨县', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1027', '安龙县', '3', '117', '0', '1');
INSERT INTO `toocms_region` VALUES ('1028', '铜仁市', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1029', '江口县', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1030', '石阡县', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1031', '思南县', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1032', '德江县', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1033', '玉屏', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1034', '印江', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1035', '沿河', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1036', '松桃', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1037', '万山特区', '3', '118', '0', '1');
INSERT INTO `toocms_region` VALUES ('1038', '红花岗区', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1039', '务川县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1040', '道真县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1041', '汇川区', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1042', '赤水市', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1043', '仁怀市', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1044', '遵义县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1045', '桐梓县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1046', '绥阳县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1047', '正安县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1048', '凤冈县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1049', '湄潭县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1050', '余庆县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1051', '习水县', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1052', '道真', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1053', '务川', '3', '119', '0', '1');
INSERT INTO `toocms_region` VALUES ('1054', '秀英区', '3', '120', '0', '1');
INSERT INTO `toocms_region` VALUES ('1055', '龙华区', '3', '120', '0', '1');
INSERT INTO `toocms_region` VALUES ('1056', '琼山区', '3', '120', '0', '1');
INSERT INTO `toocms_region` VALUES ('1057', '美兰区', '3', '120', '0', '1');
INSERT INTO `toocms_region` VALUES ('1058', '市区', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1059', '洋浦开发区', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1060', '那大镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1061', '王五镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1062', '雅星镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1063', '大成镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1064', '中和镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1065', '峨蔓镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1066', '南丰镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1067', '白马井镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1068', '兰洋镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1069', '和庆镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1070', '海头镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1071', '排浦镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1072', '东成镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1073', '光村镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1074', '木棠镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1075', '新州镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1076', '三都镇', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1077', '其他', '3', '137', '0', '1');
INSERT INTO `toocms_region` VALUES ('1078', '长安区', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1079', '桥东区', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1080', '桥西区', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1081', '新华区', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1082', '裕华区', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1083', '井陉矿区', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1084', '高新区', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1085', '辛集市', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1086', '藁城市', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1087', '晋州市', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1088', '新乐市', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1089', '鹿泉市', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1090', '井陉县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1091', '正定县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1092', '栾城县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1093', '行唐县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1094', '灵寿县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1095', '高邑县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1096', '深泽县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1097', '赞皇县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1098', '无极县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1099', '平山县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1100', '元氏县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1101', '赵县', '3', '138', '0', '1');
INSERT INTO `toocms_region` VALUES ('1102', '新市区', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1103', '南市区', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1104', '北市区', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1105', '涿州市', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1106', '定州市', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1107', '安国市', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1108', '高碑店市', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1109', '满城县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1110', '清苑县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1111', '涞水县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1112', '阜平县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1113', '徐水县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1114', '定兴县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1115', '唐县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1116', '高阳县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1117', '容城县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1118', '涞源县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1119', '望都县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1120', '安新县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1121', '易县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1122', '曲阳县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1123', '蠡县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1124', '顺平县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1125', '博野县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1126', '雄县', '3', '139', '0', '1');
INSERT INTO `toocms_region` VALUES ('1127', '运河区', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1128', '新华区', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1129', '泊头市', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1130', '任丘市', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1131', '黄骅市', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1132', '河间市', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1133', '沧县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1134', '青县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1135', '东光县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1136', '海兴县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1137', '盐山县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1138', '肃宁县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1139', '南皮县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1140', '吴桥县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1141', '献县', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1142', '孟村', '3', '140', '0', '1');
INSERT INTO `toocms_region` VALUES ('1143', '双桥区', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1144', '双滦区', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1145', '鹰手营子矿区', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1146', '承德县', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1147', '兴隆县', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1148', '平泉县', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1149', '滦平县', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1150', '隆化县', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1151', '丰宁', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1152', '宽城', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1153', '围场', '3', '141', '0', '1');
INSERT INTO `toocms_region` VALUES ('1154', '从台区', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1155', '复兴区', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1156', '邯山区', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1157', '峰峰矿区', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1158', '武安市', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1159', '邯郸县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1160', '临漳县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1161', '成安县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1162', '大名县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1163', '涉县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1164', '磁县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1165', '肥乡县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1166', '永年县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1167', '邱县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1168', '鸡泽县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1169', '广平县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1170', '馆陶县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1171', '魏县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1172', '曲周县', '3', '142', '0', '1');
INSERT INTO `toocms_region` VALUES ('1173', '桃城区', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1174', '冀州市', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1175', '深州市', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1176', '枣强县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1177', '武邑县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1178', '武强县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1179', '饶阳县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1180', '安平县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1181', '故城县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1182', '景县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1183', '阜城县', '3', '143', '0', '1');
INSERT INTO `toocms_region` VALUES ('1184', '安次区', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1185', '广阳区', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1186', '霸州市', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1187', '三河市', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1188', '固安县', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1189', '永清县', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1190', '香河县', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1191', '大城县', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1192', '文安县', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1193', '大厂', '3', '144', '0', '1');
INSERT INTO `toocms_region` VALUES ('1194', '海港区', '3', '145', '0', '1');
INSERT INTO `toocms_region` VALUES ('1195', '山海关区', '3', '145', '0', '1');
INSERT INTO `toocms_region` VALUES ('1196', '北戴河区', '3', '145', '0', '1');
INSERT INTO `toocms_region` VALUES ('1197', '昌黎县', '3', '145', '0', '1');
INSERT INTO `toocms_region` VALUES ('1198', '抚宁县', '3', '145', '0', '1');
INSERT INTO `toocms_region` VALUES ('1199', '卢龙县', '3', '145', '0', '1');
INSERT INTO `toocms_region` VALUES ('1200', '青龙', '3', '145', '0', '1');
INSERT INTO `toocms_region` VALUES ('1201', '路北区', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1202', '路南区', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1203', '古冶区', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1204', '开平区', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1205', '丰南区', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1206', '丰润区', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1207', '遵化市', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1208', '迁安市', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1209', '滦县', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1210', '滦南县', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1211', '乐亭县', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1212', '迁西县', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1213', '玉田县', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1214', '唐海县', '3', '146', '0', '1');
INSERT INTO `toocms_region` VALUES ('1215', '桥东区', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1216', '桥西区', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1217', '南宫市', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1218', '沙河市', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1219', '邢台县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1220', '临城县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1221', '内丘县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1222', '柏乡县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1223', '隆尧县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1224', '任县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1225', '南和县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1226', '宁晋县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1227', '巨鹿县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1228', '新河县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1229', '广宗县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1230', '平乡县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1231', '威县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1232', '清河县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1233', '临西县', '3', '147', '0', '1');
INSERT INTO `toocms_region` VALUES ('1234', '桥西区', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1235', '桥东区', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1236', '宣化区', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1237', '下花园区', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1238', '宣化县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1239', '张北县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1240', '康保县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1241', '沽源县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1242', '尚义县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1243', '蔚县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1244', '阳原县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1245', '怀安县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1246', '万全县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1247', '怀来县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1248', '涿鹿县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1249', '赤城县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1250', '崇礼县', '3', '148', '0', '1');
INSERT INTO `toocms_region` VALUES ('1251', '金水区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1252', '邙山区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1253', '二七区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1254', '管城区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1255', '中原区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1256', '上街区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1257', '惠济区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1258', '郑东新区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1259', '经济技术开发区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1260', '高新开发区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1261', '出口加工区', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1262', '巩义市', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1263', '荥阳市', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1264', '新密市', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1265', '新郑市', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1266', '登封市', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1267', '中牟县', '3', '149', '0', '1');
INSERT INTO `toocms_region` VALUES ('1268', '西工区', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1269', '老城区', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1270', '涧西区', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1271', '瀍河回族区', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1272', '洛龙区', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1273', '吉利区', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1274', '偃师市', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1275', '孟津县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1276', '新安县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1277', '栾川县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1278', '嵩县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1279', '汝阳县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1280', '宜阳县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1281', '洛宁县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1282', '伊川县', '3', '150', '0', '1');
INSERT INTO `toocms_region` VALUES ('1283', '鼓楼区', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1284', '龙亭区', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1285', '顺河回族区', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1286', '金明区', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1287', '禹王台区', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1288', '杞县', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1289', '通许县', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1290', '尉氏县', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1291', '开封县', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1292', '兰考县', '3', '151', '0', '1');
INSERT INTO `toocms_region` VALUES ('1293', '北关区', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1294', '文峰区', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1295', '殷都区', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1296', '龙安区', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1297', '林州市', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1298', '安阳县', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1299', '汤阴县', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1300', '滑县', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1301', '内黄县', '3', '152', '0', '1');
INSERT INTO `toocms_region` VALUES ('1302', '淇滨区', '3', '153', '0', '1');
INSERT INTO `toocms_region` VALUES ('1303', '山城区', '3', '153', '0', '1');
INSERT INTO `toocms_region` VALUES ('1304', '鹤山区', '3', '153', '0', '1');
INSERT INTO `toocms_region` VALUES ('1305', '浚县', '3', '153', '0', '1');
INSERT INTO `toocms_region` VALUES ('1306', '淇县', '3', '153', '0', '1');
INSERT INTO `toocms_region` VALUES ('1307', '济源市', '3', '154', '0', '1');
INSERT INTO `toocms_region` VALUES ('1308', '解放区', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1309', '中站区', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1310', '马村区', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1311', '山阳区', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1312', '沁阳市', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1313', '孟州市', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1314', '修武县', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1315', '博爱县', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1316', '武陟县', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1317', '温县', '3', '155', '0', '1');
INSERT INTO `toocms_region` VALUES ('1318', '卧龙区', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1319', '宛城区', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1320', '邓州市', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1321', '南召县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1322', '方城县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1323', '西峡县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1324', '镇平县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1325', '内乡县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1326', '淅川县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1327', '社旗县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1328', '唐河县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1329', '新野县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1330', '桐柏县', '3', '156', '0', '1');
INSERT INTO `toocms_region` VALUES ('1331', '新华区', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1332', '卫东区', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1333', '湛河区', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1334', '石龙区', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1335', '舞钢市', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1336', '汝州市', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1337', '宝丰县', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1338', '叶县', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1339', '鲁山县', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1340', '郏县', '3', '157', '0', '1');
INSERT INTO `toocms_region` VALUES ('1341', '湖滨区', '3', '158', '0', '1');
INSERT INTO `toocms_region` VALUES ('1342', '义马市', '3', '158', '0', '1');
INSERT INTO `toocms_region` VALUES ('1343', '灵宝市', '3', '158', '0', '1');
INSERT INTO `toocms_region` VALUES ('1344', '渑池县', '3', '158', '0', '1');
INSERT INTO `toocms_region` VALUES ('1345', '陕县', '3', '158', '0', '1');
INSERT INTO `toocms_region` VALUES ('1346', '卢氏县', '3', '158', '0', '1');
INSERT INTO `toocms_region` VALUES ('1347', '梁园区', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1348', '睢阳区', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1349', '永城市', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1350', '民权县', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1351', '睢县', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1352', '宁陵县', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1353', '虞城县', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1354', '柘城县', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1355', '夏邑县', '3', '159', '0', '1');
INSERT INTO `toocms_region` VALUES ('1356', '卫滨区', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1357', '红旗区', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1358', '凤泉区', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1359', '牧野区', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1360', '卫辉市', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1361', '辉县市', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1362', '新乡县', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1363', '获嘉县', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1364', '原阳县', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1365', '延津县', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1366', '封丘县', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1367', '长垣县', '3', '160', '0', '1');
INSERT INTO `toocms_region` VALUES ('1368', '浉河区', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1369', '平桥区', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1370', '罗山县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1371', '光山县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1372', '新县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1373', '商城县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1374', '固始县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1375', '潢川县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1376', '淮滨县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1377', '息县', '3', '161', '0', '1');
INSERT INTO `toocms_region` VALUES ('1378', '魏都区', '3', '162', '0', '1');
INSERT INTO `toocms_region` VALUES ('1379', '禹州市', '3', '162', '0', '1');
INSERT INTO `toocms_region` VALUES ('1380', '长葛市', '3', '162', '0', '1');
INSERT INTO `toocms_region` VALUES ('1381', '许昌县', '3', '162', '0', '1');
INSERT INTO `toocms_region` VALUES ('1382', '鄢陵县', '3', '162', '0', '1');
INSERT INTO `toocms_region` VALUES ('1383', '襄城县', '3', '162', '0', '1');
INSERT INTO `toocms_region` VALUES ('1384', '川汇区', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1385', '项城市', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1386', '扶沟县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1387', '西华县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1388', '商水县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1389', '沈丘县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1390', '郸城县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1391', '淮阳县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1392', '太康县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1393', '鹿邑县', '3', '163', '0', '1');
INSERT INTO `toocms_region` VALUES ('1394', '驿城区', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1395', '西平县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1396', '上蔡县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1397', '平舆县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1398', '正阳县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1399', '确山县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1400', '泌阳县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1401', '汝南县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1402', '遂平县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1403', '新蔡县', '3', '164', '0', '1');
INSERT INTO `toocms_region` VALUES ('1404', '郾城区', '3', '165', '0', '1');
INSERT INTO `toocms_region` VALUES ('1405', '源汇区', '3', '165', '0', '1');
INSERT INTO `toocms_region` VALUES ('1406', '召陵区', '3', '165', '0', '1');
INSERT INTO `toocms_region` VALUES ('1407', '舞阳县', '3', '165', '0', '1');
INSERT INTO `toocms_region` VALUES ('1408', '临颍县', '3', '165', '0', '1');
INSERT INTO `toocms_region` VALUES ('1409', '华龙区', '3', '166', '0', '1');
INSERT INTO `toocms_region` VALUES ('1410', '清丰县', '3', '166', '0', '1');
INSERT INTO `toocms_region` VALUES ('1411', '南乐县', '3', '166', '0', '1');
INSERT INTO `toocms_region` VALUES ('1412', '范县', '3', '166', '0', '1');
INSERT INTO `toocms_region` VALUES ('1413', '台前县', '3', '166', '0', '1');
INSERT INTO `toocms_region` VALUES ('1414', '濮阳县', '3', '166', '0', '1');
INSERT INTO `toocms_region` VALUES ('1415', '道里区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1416', '南岗区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1417', '动力区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1418', '平房区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1419', '香坊区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1420', '太平区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1421', '道外区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1422', '阿城区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1423', '呼兰区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1424', '松北区', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1425', '尚志市', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1426', '双城市', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1427', '五常市', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1428', '方正县', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1429', '宾县', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1430', '依兰县', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1431', '巴彦县', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1432', '通河县', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1433', '木兰县', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1434', '延寿县', '3', '167', '0', '1');
INSERT INTO `toocms_region` VALUES ('1435', '萨尔图区', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1436', '红岗区', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1437', '龙凤区', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1438', '让胡路区', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1439', '大同区', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1440', '肇州县', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1441', '肇源县', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1442', '林甸县', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1443', '杜尔伯特', '3', '168', '0', '1');
INSERT INTO `toocms_region` VALUES ('1444', '呼玛县', '3', '169', '0', '1');
INSERT INTO `toocms_region` VALUES ('1445', '漠河县', '3', '169', '0', '1');
INSERT INTO `toocms_region` VALUES ('1446', '塔河县', '3', '169', '0', '1');
INSERT INTO `toocms_region` VALUES ('1447', '兴山区', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1448', '工农区', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1449', '南山区', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1450', '兴安区', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1451', '向阳区', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1452', '东山区', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1453', '萝北县', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1454', '绥滨县', '3', '170', '0', '1');
INSERT INTO `toocms_region` VALUES ('1455', '爱辉区', '3', '171', '0', '1');
INSERT INTO `toocms_region` VALUES ('1456', '五大连池市', '3', '171', '0', '1');
INSERT INTO `toocms_region` VALUES ('1457', '北安市', '3', '171', '0', '1');
INSERT INTO `toocms_region` VALUES ('1458', '嫩江县', '3', '171', '0', '1');
INSERT INTO `toocms_region` VALUES ('1459', '逊克县', '3', '171', '0', '1');
INSERT INTO `toocms_region` VALUES ('1460', '孙吴县', '3', '171', '0', '1');
INSERT INTO `toocms_region` VALUES ('1461', '鸡冠区', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1462', '恒山区', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1463', '城子河区', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1464', '滴道区', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1465', '梨树区', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1466', '虎林市', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1467', '密山市', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1468', '鸡东县', '3', '172', '0', '1');
INSERT INTO `toocms_region` VALUES ('1469', '前进区', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1470', '郊区', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1471', '向阳区', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1472', '东风区', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1473', '同江市', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1474', '富锦市', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1475', '桦南县', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1476', '桦川县', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1477', '汤原县', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1478', '抚远县', '3', '173', '0', '1');
INSERT INTO `toocms_region` VALUES ('1479', '爱民区', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1480', '东安区', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1481', '阳明区', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1482', '西安区', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1483', '绥芬河市', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1484', '海林市', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1485', '宁安市', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1486', '穆棱市', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1487', '东宁县', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1488', '林口县', '3', '174', '0', '1');
INSERT INTO `toocms_region` VALUES ('1489', '桃山区', '3', '175', '0', '1');
INSERT INTO `toocms_region` VALUES ('1490', '新兴区', '3', '175', '0', '1');
INSERT INTO `toocms_region` VALUES ('1491', '茄子河区', '3', '175', '0', '1');
INSERT INTO `toocms_region` VALUES ('1492', '勃利县', '3', '175', '0', '1');
INSERT INTO `toocms_region` VALUES ('1493', '龙沙区', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1494', '昂昂溪区', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1495', '铁峰区', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1496', '建华区', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1497', '富拉尔基区', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1498', '碾子山区', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1499', '梅里斯达斡尔区', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1500', '讷河市', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1501', '龙江县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1502', '依安县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1503', '泰来县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1504', '甘南县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1505', '富裕县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1506', '克山县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1507', '克东县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1508', '拜泉县', '3', '176', '0', '1');
INSERT INTO `toocms_region` VALUES ('1509', '尖山区', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1510', '岭东区', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1511', '四方台区', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1512', '宝山区', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1513', '集贤县', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1514', '友谊县', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1515', '宝清县', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1516', '饶河县', '3', '177', '0', '1');
INSERT INTO `toocms_region` VALUES ('1517', '北林区', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1518', '安达市', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1519', '肇东市', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1520', '海伦市', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1521', '望奎县', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1522', '兰西县', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1523', '青冈县', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1524', '庆安县', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1525', '明水县', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1526', '绥棱县', '3', '178', '0', '1');
INSERT INTO `toocms_region` VALUES ('1527', '伊春区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1528', '带岭区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1529', '南岔区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1530', '金山屯区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1531', '西林区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1532', '美溪区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1533', '乌马河区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1534', '翠峦区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1535', '友好区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1536', '上甘岭区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1537', '五营区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1538', '红星区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1539', '新青区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1540', '汤旺河区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1541', '乌伊岭区', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1542', '铁力市', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1543', '嘉荫县', '3', '179', '0', '1');
INSERT INTO `toocms_region` VALUES ('1544', '江岸区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1545', '武昌区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1546', '江汉区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1547', '硚口区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1548', '汉阳区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1549', '青山区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1550', '洪山区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1551', '东西湖区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1552', '汉南区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1553', '蔡甸区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1554', '江夏区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1555', '黄陂区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1556', '新洲区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1557', '经济开发区', '3', '180', '0', '1');
INSERT INTO `toocms_region` VALUES ('1558', '仙桃市', '3', '181', '0', '1');
INSERT INTO `toocms_region` VALUES ('1559', '鄂城区', '3', '182', '0', '1');
INSERT INTO `toocms_region` VALUES ('1560', '华容区', '3', '182', '0', '1');
INSERT INTO `toocms_region` VALUES ('1561', '梁子湖区', '3', '182', '0', '1');
INSERT INTO `toocms_region` VALUES ('1562', '黄州区', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1563', '麻城市', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1564', '武穴市', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1565', '团风县', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1566', '红安县', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1567', '罗田县', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1568', '英山县', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1569', '浠水县', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1570', '蕲春县', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1571', '黄梅县', '3', '183', '0', '1');
INSERT INTO `toocms_region` VALUES ('1572', '黄石港区', '3', '184', '0', '1');
INSERT INTO `toocms_region` VALUES ('1573', '西塞山区', '3', '184', '0', '1');
INSERT INTO `toocms_region` VALUES ('1574', '下陆区', '3', '184', '0', '1');
INSERT INTO `toocms_region` VALUES ('1575', '铁山区', '3', '184', '0', '1');
INSERT INTO `toocms_region` VALUES ('1576', '大冶市', '3', '184', '0', '1');
INSERT INTO `toocms_region` VALUES ('1577', '阳新县', '3', '184', '0', '1');
INSERT INTO `toocms_region` VALUES ('1578', '东宝区', '3', '185', '0', '1');
INSERT INTO `toocms_region` VALUES ('1579', '掇刀区', '3', '185', '0', '1');
INSERT INTO `toocms_region` VALUES ('1580', '钟祥市', '3', '185', '0', '1');
INSERT INTO `toocms_region` VALUES ('1581', '京山县', '3', '185', '0', '1');
INSERT INTO `toocms_region` VALUES ('1582', '沙洋县', '3', '185', '0', '1');
INSERT INTO `toocms_region` VALUES ('1583', '沙市区', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1584', '荆州区', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1585', '石首市', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1586', '洪湖市', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1587', '松滋市', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1588', '公安县', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1589', '监利县', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1590', '江陵县', '3', '186', '0', '1');
INSERT INTO `toocms_region` VALUES ('1591', '潜江市', '3', '187', '0', '1');
INSERT INTO `toocms_region` VALUES ('1592', '神农架林区', '3', '188', '0', '1');
INSERT INTO `toocms_region` VALUES ('1593', '张湾区', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1594', '茅箭区', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1595', '丹江口市', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1596', '郧县', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1597', '郧西县', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1598', '竹山县', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1599', '竹溪县', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1600', '房县', '3', '189', '0', '1');
INSERT INTO `toocms_region` VALUES ('1601', '曾都区', '3', '190', '0', '1');
INSERT INTO `toocms_region` VALUES ('1602', '广水市', '3', '190', '0', '1');
INSERT INTO `toocms_region` VALUES ('1603', '天门市', '3', '191', '0', '1');
INSERT INTO `toocms_region` VALUES ('1604', '咸安区', '3', '192', '0', '1');
INSERT INTO `toocms_region` VALUES ('1605', '赤壁市', '3', '192', '0', '1');
INSERT INTO `toocms_region` VALUES ('1606', '嘉鱼县', '3', '192', '0', '1');
INSERT INTO `toocms_region` VALUES ('1607', '通城县', '3', '192', '0', '1');
INSERT INTO `toocms_region` VALUES ('1608', '崇阳县', '3', '192', '0', '1');
INSERT INTO `toocms_region` VALUES ('1609', '通山县', '3', '192', '0', '1');
INSERT INTO `toocms_region` VALUES ('1610', '襄城区', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1611', '樊城区', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1612', '襄阳区', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1613', '老河口市', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1614', '枣阳市', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1615', '宜城市', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1616', '南漳县', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1617', '谷城县', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1618', '保康县', '3', '193', '0', '1');
INSERT INTO `toocms_region` VALUES ('1619', '孝南区', '3', '194', '0', '1');
INSERT INTO `toocms_region` VALUES ('1620', '应城市', '3', '194', '0', '1');
INSERT INTO `toocms_region` VALUES ('1621', '安陆市', '3', '194', '0', '1');
INSERT INTO `toocms_region` VALUES ('1622', '汉川市', '3', '194', '0', '1');
INSERT INTO `toocms_region` VALUES ('1623', '孝昌县', '3', '194', '0', '1');
INSERT INTO `toocms_region` VALUES ('1624', '大悟县', '3', '194', '0', '1');
INSERT INTO `toocms_region` VALUES ('1625', '云梦县', '3', '194', '0', '1');
INSERT INTO `toocms_region` VALUES ('1626', '长阳', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1627', '五峰', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1628', '西陵区', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1629', '伍家岗区', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1630', '点军区', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1631', '猇亭区', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1632', '夷陵区', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1633', '宜都市', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1634', '当阳市', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1635', '枝江市', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1636', '远安县', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1637', '兴山县', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1638', '秭归县', '3', '195', '0', '1');
INSERT INTO `toocms_region` VALUES ('1639', '恩施市', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1640', '利川市', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1641', '建始县', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1642', '巴东县', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1643', '宣恩县', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1644', '咸丰县', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1645', '来凤县', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1646', '鹤峰县', '3', '196', '0', '1');
INSERT INTO `toocms_region` VALUES ('1647', '岳麓区', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1648', '芙蓉区', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1649', '天心区', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1650', '开福区', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1651', '雨花区', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1652', '开发区', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1653', '浏阳市', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1654', '长沙县', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1655', '望城县', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1656', '宁乡县', '3', '197', '0', '1');
INSERT INTO `toocms_region` VALUES ('1657', '永定区', '3', '198', '0', '1');
INSERT INTO `toocms_region` VALUES ('1658', '武陵源区', '3', '198', '0', '1');
INSERT INTO `toocms_region` VALUES ('1659', '慈利县', '3', '198', '0', '1');
INSERT INTO `toocms_region` VALUES ('1660', '桑植县', '3', '198', '0', '1');
INSERT INTO `toocms_region` VALUES ('1661', '武陵区', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1662', '鼎城区', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1663', '津市市', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1664', '安乡县', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1665', '汉寿县', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1666', '澧县', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1667', '临澧县', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1668', '桃源县', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1669', '石门县', '3', '199', '0', '1');
INSERT INTO `toocms_region` VALUES ('1670', '北湖区', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1671', '苏仙区', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1672', '资兴市', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1673', '桂阳县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1674', '宜章县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1675', '永兴县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1676', '嘉禾县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1677', '临武县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1678', '汝城县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1679', '桂东县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1680', '安仁县', '3', '200', '0', '1');
INSERT INTO `toocms_region` VALUES ('1681', '雁峰区', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1682', '珠晖区', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1683', '石鼓区', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1684', '蒸湘区', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1685', '南岳区', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1686', '耒阳市', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1687', '常宁市', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1688', '衡阳县', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1689', '衡南县', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1690', '衡山县', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1691', '衡东县', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1692', '祁东县', '3', '201', '0', '1');
INSERT INTO `toocms_region` VALUES ('1693', '鹤城区', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1694', '靖州', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1695', '麻阳', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1696', '通道', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1697', '新晃', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1698', '芷江', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1699', '沅陵县', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1700', '辰溪县', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1701', '溆浦县', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1702', '中方县', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1703', '会同县', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1704', '洪江市', '3', '202', '0', '1');
INSERT INTO `toocms_region` VALUES ('1705', '娄星区', '3', '203', '0', '1');
INSERT INTO `toocms_region` VALUES ('1706', '冷水江市', '3', '203', '0', '1');
INSERT INTO `toocms_region` VALUES ('1707', '涟源市', '3', '203', '0', '1');
INSERT INTO `toocms_region` VALUES ('1708', '双峰县', '3', '203', '0', '1');
INSERT INTO `toocms_region` VALUES ('1709', '新化县', '3', '203', '0', '1');
INSERT INTO `toocms_region` VALUES ('1710', '城步', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1711', '双清区', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1712', '大祥区', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1713', '北塔区', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1714', '武冈市', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1715', '邵东县', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1716', '新邵县', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1717', '邵阳县', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1718', '隆回县', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1719', '洞口县', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1720', '绥宁县', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1721', '新宁县', '3', '204', '0', '1');
INSERT INTO `toocms_region` VALUES ('1722', '岳塘区', '3', '205', '0', '1');
INSERT INTO `toocms_region` VALUES ('1723', '雨湖区', '3', '205', '0', '1');
INSERT INTO `toocms_region` VALUES ('1724', '湘乡市', '3', '205', '0', '1');
INSERT INTO `toocms_region` VALUES ('1725', '韶山市', '3', '205', '0', '1');
INSERT INTO `toocms_region` VALUES ('1726', '湘潭县', '3', '205', '0', '1');
INSERT INTO `toocms_region` VALUES ('1727', '吉首市', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1728', '泸溪县', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1729', '凤凰县', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1730', '花垣县', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1731', '保靖县', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1732', '古丈县', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1733', '永顺县', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1734', '龙山县', '3', '206', '0', '1');
INSERT INTO `toocms_region` VALUES ('1735', '赫山区', '3', '207', '0', '1');
INSERT INTO `toocms_region` VALUES ('1736', '资阳区', '3', '207', '0', '1');
INSERT INTO `toocms_region` VALUES ('1737', '沅江市', '3', '207', '0', '1');
INSERT INTO `toocms_region` VALUES ('1738', '南县', '3', '207', '0', '1');
INSERT INTO `toocms_region` VALUES ('1739', '桃江县', '3', '207', '0', '1');
INSERT INTO `toocms_region` VALUES ('1740', '安化县', '3', '207', '0', '1');
INSERT INTO `toocms_region` VALUES ('1741', '江华', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1742', '冷水滩区', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1743', '零陵区', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1744', '祁阳县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1745', '东安县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1746', '双牌县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1747', '道县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1748', '江永县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1749', '宁远县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1750', '蓝山县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1751', '新田县', '3', '208', '0', '1');
INSERT INTO `toocms_region` VALUES ('1752', '岳阳楼区', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1753', '君山区', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1754', '云溪区', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1755', '汨罗市', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1756', '临湘市', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1757', '岳阳县', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1758', '华容县', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1759', '湘阴县', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1760', '平江县', '3', '209', '0', '1');
INSERT INTO `toocms_region` VALUES ('1761', '天元区', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1762', '荷塘区', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1763', '芦淞区', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1764', '石峰区', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1765', '醴陵市', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1766', '株洲县', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1767', '攸县', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1768', '茶陵县', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1769', '炎陵县', '3', '210', '0', '1');
INSERT INTO `toocms_region` VALUES ('1770', '朝阳区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1771', '宽城区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1772', '二道区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1773', '南关区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1774', '绿园区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1775', '双阳区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1776', '净月潭开发区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1777', '高新技术开发区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1778', '经济技术开发区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1779', '汽车产业开发区', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1780', '德惠市', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1781', '九台市', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1782', '榆树市', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1783', '农安县', '3', '211', '0', '1');
INSERT INTO `toocms_region` VALUES ('1784', '船营区', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1785', '昌邑区', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1786', '龙潭区', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1787', '丰满区', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1788', '蛟河市', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1789', '桦甸市', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1790', '舒兰市', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1791', '磐石市', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1792', '永吉县', '3', '212', '0', '1');
INSERT INTO `toocms_region` VALUES ('1793', '洮北区', '3', '213', '0', '1');
INSERT INTO `toocms_region` VALUES ('1794', '洮南市', '3', '213', '0', '1');
INSERT INTO `toocms_region` VALUES ('1795', '大安市', '3', '213', '0', '1');
INSERT INTO `toocms_region` VALUES ('1796', '镇赉县', '3', '213', '0', '1');
INSERT INTO `toocms_region` VALUES ('1797', '通榆县', '3', '213', '0', '1');
INSERT INTO `toocms_region` VALUES ('1798', '江源区', '3', '214', '0', '1');
INSERT INTO `toocms_region` VALUES ('1799', '八道江区', '3', '214', '0', '1');
INSERT INTO `toocms_region` VALUES ('1800', '长白', '3', '214', '0', '1');
INSERT INTO `toocms_region` VALUES ('1801', '临江市', '3', '214', '0', '1');
INSERT INTO `toocms_region` VALUES ('1802', '抚松县', '3', '214', '0', '1');
INSERT INTO `toocms_region` VALUES ('1803', '靖宇县', '3', '214', '0', '1');
INSERT INTO `toocms_region` VALUES ('1804', '龙山区', '3', '215', '0', '1');
INSERT INTO `toocms_region` VALUES ('1805', '西安区', '3', '215', '0', '1');
INSERT INTO `toocms_region` VALUES ('1806', '东丰县', '3', '215', '0', '1');
INSERT INTO `toocms_region` VALUES ('1807', '东辽县', '3', '215', '0', '1');
INSERT INTO `toocms_region` VALUES ('1808', '铁西区', '3', '216', '0', '1');
INSERT INTO `toocms_region` VALUES ('1809', '铁东区', '3', '216', '0', '1');
INSERT INTO `toocms_region` VALUES ('1810', '伊通', '3', '216', '0', '1');
INSERT INTO `toocms_region` VALUES ('1811', '公主岭市', '3', '216', '0', '1');
INSERT INTO `toocms_region` VALUES ('1812', '双辽市', '3', '216', '0', '1');
INSERT INTO `toocms_region` VALUES ('1813', '梨树县', '3', '216', '0', '1');
INSERT INTO `toocms_region` VALUES ('1814', '前郭尔罗斯', '3', '217', '0', '1');
INSERT INTO `toocms_region` VALUES ('1815', '宁江区', '3', '217', '0', '1');
INSERT INTO `toocms_region` VALUES ('1816', '长岭县', '3', '217', '0', '1');
INSERT INTO `toocms_region` VALUES ('1817', '乾安县', '3', '217', '0', '1');
INSERT INTO `toocms_region` VALUES ('1818', '扶余县', '3', '217', '0', '1');
INSERT INTO `toocms_region` VALUES ('1819', '东昌区', '3', '218', '0', '1');
INSERT INTO `toocms_region` VALUES ('1820', '二道江区', '3', '218', '0', '1');
INSERT INTO `toocms_region` VALUES ('1821', '梅河口市', '3', '218', '0', '1');
INSERT INTO `toocms_region` VALUES ('1822', '集安市', '3', '218', '0', '1');
INSERT INTO `toocms_region` VALUES ('1823', '通化县', '3', '218', '0', '1');
INSERT INTO `toocms_region` VALUES ('1824', '辉南县', '3', '218', '0', '1');
INSERT INTO `toocms_region` VALUES ('1825', '柳河县', '3', '218', '0', '1');
INSERT INTO `toocms_region` VALUES ('1826', '延吉市', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1827', '图们市', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1828', '敦化市', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1829', '珲春市', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1830', '龙井市', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1831', '和龙市', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1832', '安图县', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1833', '汪清县', '3', '219', '0', '1');
INSERT INTO `toocms_region` VALUES ('1834', '玄武区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1835', '鼓楼区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1836', '白下区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1837', '建邺区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1838', '秦淮区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1839', '雨花台区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1840', '下关区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1841', '栖霞区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1842', '浦口区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1843', '江宁区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1844', '六合区', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1845', '溧水县', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1846', '高淳县', '3', '220', '0', '1');
INSERT INTO `toocms_region` VALUES ('1847', '沧浪区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1848', '金阊区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1849', '平江区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1850', '虎丘区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1851', '吴中区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1852', '相城区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1853', '园区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1854', '新区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1855', '常熟市', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1856', '张家港市', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1857', '玉山镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1858', '巴城镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1859', '周市镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1860', '陆家镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1861', '花桥镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1862', '淀山湖镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1863', '张浦镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1864', '周庄镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1865', '千灯镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1866', '锦溪镇', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1867', '开发区', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1868', '吴江市', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1869', '太仓市', '3', '221', '0', '1');
INSERT INTO `toocms_region` VALUES ('1870', '崇安区', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1871', '北塘区', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1872', '南长区', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1873', '锡山区', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1874', '惠山区', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1875', '滨湖区', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1876', '新区', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1877', '江阴市', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1878', '宜兴市', '3', '222', '0', '1');
INSERT INTO `toocms_region` VALUES ('1879', '天宁区', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1880', '钟楼区', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1881', '戚墅堰区', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1882', '郊区', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1883', '新北区', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1884', '武进区', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1885', '溧阳市', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1886', '金坛市', '3', '223', '0', '1');
INSERT INTO `toocms_region` VALUES ('1887', '清河区', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1888', '清浦区', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1889', '楚州区', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1890', '淮阴区', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1891', '涟水县', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1892', '洪泽县', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1893', '盱眙县', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1894', '金湖县', '3', '224', '0', '1');
INSERT INTO `toocms_region` VALUES ('1895', '新浦区', '3', '225', '0', '1');
INSERT INTO `toocms_region` VALUES ('1896', '连云区', '3', '225', '0', '1');
INSERT INTO `toocms_region` VALUES ('1897', '海州区', '3', '225', '0', '1');
INSERT INTO `toocms_region` VALUES ('1898', '赣榆县', '3', '225', '0', '1');
INSERT INTO `toocms_region` VALUES ('1899', '东海县', '3', '225', '0', '1');
INSERT INTO `toocms_region` VALUES ('1900', '灌云县', '3', '225', '0', '1');
INSERT INTO `toocms_region` VALUES ('1901', '灌南县', '3', '225', '0', '1');
INSERT INTO `toocms_region` VALUES ('1902', '崇川区', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1903', '港闸区', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1904', '经济开发区', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1905', '启东市', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1906', '如皋市', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1907', '通州市', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1908', '海门市', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1909', '海安县', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1910', '如东县', '3', '226', '0', '1');
INSERT INTO `toocms_region` VALUES ('1911', '宿城区', '3', '227', '0', '1');
INSERT INTO `toocms_region` VALUES ('1912', '宿豫区', '3', '227', '0', '1');
INSERT INTO `toocms_region` VALUES ('1913', '宿豫县', '3', '227', '0', '1');
INSERT INTO `toocms_region` VALUES ('1914', '沭阳县', '3', '227', '0', '1');
INSERT INTO `toocms_region` VALUES ('1915', '泗阳县', '3', '227', '0', '1');
INSERT INTO `toocms_region` VALUES ('1916', '泗洪县', '3', '227', '0', '1');
INSERT INTO `toocms_region` VALUES ('1917', '海陵区', '3', '228', '0', '1');
INSERT INTO `toocms_region` VALUES ('1918', '高港区', '3', '228', '0', '1');
INSERT INTO `toocms_region` VALUES ('1919', '兴化市', '3', '228', '0', '1');
INSERT INTO `toocms_region` VALUES ('1920', '靖江市', '3', '228', '0', '1');
INSERT INTO `toocms_region` VALUES ('1921', '泰兴市', '3', '228', '0', '1');
INSERT INTO `toocms_region` VALUES ('1922', '姜堰市', '3', '228', '0', '1');
INSERT INTO `toocms_region` VALUES ('1923', '云龙区', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1924', '鼓楼区', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1925', '九里区', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1926', '贾汪区', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1927', '泉山区', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1928', '新沂市', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1929', '邳州市', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1930', '丰县', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1931', '沛县', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1932', '铜山县', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1933', '睢宁县', '3', '229', '0', '1');
INSERT INTO `toocms_region` VALUES ('1934', '城区', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1935', '亭湖区', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1936', '盐都区', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1937', '盐都县', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1938', '东台市', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1939', '大丰市', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1940', '响水县', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1941', '滨海县', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1942', '阜宁县', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1943', '射阳县', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1944', '建湖县', '3', '230', '0', '1');
INSERT INTO `toocms_region` VALUES ('1945', '广陵区', '3', '231', '0', '1');
INSERT INTO `toocms_region` VALUES ('1946', '维扬区', '3', '231', '0', '1');
INSERT INTO `toocms_region` VALUES ('1947', '邗江区', '3', '231', '0', '1');
INSERT INTO `toocms_region` VALUES ('1948', '仪征市', '3', '231', '0', '1');
INSERT INTO `toocms_region` VALUES ('1949', '高邮市', '3', '231', '0', '1');
INSERT INTO `toocms_region` VALUES ('1950', '江都市', '3', '231', '0', '1');
INSERT INTO `toocms_region` VALUES ('1951', '宝应县', '3', '231', '0', '1');
INSERT INTO `toocms_region` VALUES ('1952', '京口区', '3', '232', '0', '1');
INSERT INTO `toocms_region` VALUES ('1953', '润州区', '3', '232', '0', '1');
INSERT INTO `toocms_region` VALUES ('1954', '丹徒区', '3', '232', '0', '1');
INSERT INTO `toocms_region` VALUES ('1955', '丹阳市', '3', '232', '0', '1');
INSERT INTO `toocms_region` VALUES ('1956', '扬中市', '3', '232', '0', '1');
INSERT INTO `toocms_region` VALUES ('1957', '句容市', '3', '232', '0', '1');
INSERT INTO `toocms_region` VALUES ('1958', '东湖区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1959', '西湖区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1960', '青云谱区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1961', '湾里区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1962', '青山湖区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1963', '红谷滩新区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1964', '昌北区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1965', '高新区', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1966', '南昌县', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1967', '新建县', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1968', '安义县', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1969', '进贤县', '3', '233', '0', '1');
INSERT INTO `toocms_region` VALUES ('1970', '临川区', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1971', '南城县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1972', '黎川县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1973', '南丰县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1974', '崇仁县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1975', '乐安县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1976', '宜黄县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1977', '金溪县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1978', '资溪县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1979', '东乡县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1980', '广昌县', '3', '234', '0', '1');
INSERT INTO `toocms_region` VALUES ('1981', '章贡区', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1982', '于都县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1983', '瑞金市', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1984', '南康市', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1985', '赣县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1986', '信丰县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1987', '大余县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1988', '上犹县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1989', '崇义县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1990', '安远县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1991', '龙南县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1992', '定南县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1993', '全南县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1994', '宁都县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1995', '兴国县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1996', '会昌县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1997', '寻乌县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1998', '石城县', '3', '235', '0', '1');
INSERT INTO `toocms_region` VALUES ('1999', '安福县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2000', '吉州区', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2001', '青原区', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2002', '井冈山市', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2003', '吉安县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2004', '吉水县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2005', '峡江县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2006', '新干县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2007', '永丰县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2008', '泰和县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2009', '遂川县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2010', '万安县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2011', '永新县', '3', '236', '0', '1');
INSERT INTO `toocms_region` VALUES ('2012', '珠山区', '3', '237', '0', '1');
INSERT INTO `toocms_region` VALUES ('2013', '昌江区', '3', '237', '0', '1');
INSERT INTO `toocms_region` VALUES ('2014', '乐平市', '3', '237', '0', '1');
INSERT INTO `toocms_region` VALUES ('2015', '浮梁县', '3', '237', '0', '1');
INSERT INTO `toocms_region` VALUES ('2016', '浔阳区', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2017', '庐山区', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2018', '瑞昌市', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2019', '九江县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2020', '武宁县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2021', '修水县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2022', '永修县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2023', '德安县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2024', '星子县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2025', '都昌县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2026', '湖口县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2027', '彭泽县', '3', '238', '0', '1');
INSERT INTO `toocms_region` VALUES ('2028', '安源区', '3', '239', '0', '1');
INSERT INTO `toocms_region` VALUES ('2029', '湘东区', '3', '239', '0', '1');
INSERT INTO `toocms_region` VALUES ('2030', '莲花县', '3', '239', '0', '1');
INSERT INTO `toocms_region` VALUES ('2031', '芦溪县', '3', '239', '0', '1');
INSERT INTO `toocms_region` VALUES ('2032', '上栗县', '3', '239', '0', '1');
INSERT INTO `toocms_region` VALUES ('2033', '信州区', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2034', '德兴市', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2035', '上饶县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2036', '广丰县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2037', '玉山县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2038', '铅山县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2039', '横峰县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2040', '弋阳县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2041', '余干县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2042', '波阳县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2043', '万年县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2044', '婺源县', '3', '240', '0', '1');
INSERT INTO `toocms_region` VALUES ('2045', '渝水区', '3', '241', '0', '1');
INSERT INTO `toocms_region` VALUES ('2046', '分宜县', '3', '241', '0', '1');
INSERT INTO `toocms_region` VALUES ('2047', '袁州区', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2048', '丰城市', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2049', '樟树市', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2050', '高安市', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2051', '奉新县', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2052', '万载县', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2053', '上高县', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2054', '宜丰县', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2055', '靖安县', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2056', '铜鼓县', '3', '242', '0', '1');
INSERT INTO `toocms_region` VALUES ('2057', '月湖区', '3', '243', '0', '1');
INSERT INTO `toocms_region` VALUES ('2058', '贵溪市', '3', '243', '0', '1');
INSERT INTO `toocms_region` VALUES ('2059', '余江县', '3', '243', '0', '1');
INSERT INTO `toocms_region` VALUES ('2060', '沈河区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2061', '皇姑区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2062', '和平区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2063', '大东区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2064', '铁西区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2065', '苏家屯区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2066', '东陵区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2067', '沈北新区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2068', '于洪区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2069', '浑南新区', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2070', '新民市', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2071', '辽中县', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2072', '康平县', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2073', '法库县', '3', '244', '0', '1');
INSERT INTO `toocms_region` VALUES ('2074', '西岗区', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2075', '中山区', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2076', '沙河口区', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2077', '甘井子区', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2078', '旅顺口区', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2079', '金州区', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2080', '开发区', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2081', '瓦房店市', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2082', '普兰店市', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2083', '庄河市', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2084', '长海县', '3', '245', '0', '1');
INSERT INTO `toocms_region` VALUES ('2085', '铁东区', '3', '246', '0', '1');
INSERT INTO `toocms_region` VALUES ('2086', '铁西区', '3', '246', '0', '1');
INSERT INTO `toocms_region` VALUES ('2087', '立山区', '3', '246', '0', '1');
INSERT INTO `toocms_region` VALUES ('2088', '千山区', '3', '246', '0', '1');
INSERT INTO `toocms_region` VALUES ('2089', '岫岩', '3', '246', '0', '1');
INSERT INTO `toocms_region` VALUES ('2090', '海城市', '3', '246', '0', '1');
INSERT INTO `toocms_region` VALUES ('2091', '台安县', '3', '246', '0', '1');
INSERT INTO `toocms_region` VALUES ('2092', '本溪', '3', '247', '0', '1');
INSERT INTO `toocms_region` VALUES ('2093', '平山区', '3', '247', '0', '1');
INSERT INTO `toocms_region` VALUES ('2094', '明山区', '3', '247', '0', '1');
INSERT INTO `toocms_region` VALUES ('2095', '溪湖区', '3', '247', '0', '1');
INSERT INTO `toocms_region` VALUES ('2096', '南芬区', '3', '247', '0', '1');
INSERT INTO `toocms_region` VALUES ('2097', '桓仁', '3', '247', '0', '1');
INSERT INTO `toocms_region` VALUES ('2098', '双塔区', '3', '248', '0', '1');
INSERT INTO `toocms_region` VALUES ('2099', '龙城区', '3', '248', '0', '1');
INSERT INTO `toocms_region` VALUES ('2100', '喀喇沁左翼蒙古族自治', '3', '248', '0', '1');
INSERT INTO `toocms_region` VALUES ('2101', '北票市', '3', '248', '0', '1');
INSERT INTO `toocms_region` VALUES ('2102', '凌源市', '3', '248', '0', '1');
INSERT INTO `toocms_region` VALUES ('2103', '朝阳县', '3', '248', '0', '1');
INSERT INTO `toocms_region` VALUES ('2104', '建平县', '3', '248', '0', '1');
INSERT INTO `toocms_region` VALUES ('2105', '振兴区', '3', '249', '0', '1');
INSERT INTO `toocms_region` VALUES ('2106', '元宝区', '3', '249', '0', '1');
INSERT INTO `toocms_region` VALUES ('2107', '振安区', '3', '249', '0', '1');
INSERT INTO `toocms_region` VALUES ('2108', '宽甸', '3', '249', '0', '1');
INSERT INTO `toocms_region` VALUES ('2109', '东港市', '3', '249', '0', '1');
INSERT INTO `toocms_region` VALUES ('2110', '凤城市', '3', '249', '0', '1');
INSERT INTO `toocms_region` VALUES ('2111', '顺城区', '3', '250', '0', '1');
INSERT INTO `toocms_region` VALUES ('2112', '新抚区', '3', '250', '0', '1');
INSERT INTO `toocms_region` VALUES ('2113', '东洲区', '3', '250', '0', '1');
INSERT INTO `toocms_region` VALUES ('2114', '望花区', '3', '250', '0', '1');
INSERT INTO `toocms_region` VALUES ('2115', '清原', '3', '250', '0', '1');
INSERT INTO `toocms_region` VALUES ('2116', '新宾', '3', '250', '0', '1');
INSERT INTO `toocms_region` VALUES ('2117', '抚顺县', '3', '250', '0', '1');
INSERT INTO `toocms_region` VALUES ('2118', '阜新', '3', '251', '0', '1');
INSERT INTO `toocms_region` VALUES ('2119', '海州区', '3', '251', '0', '1');
INSERT INTO `toocms_region` VALUES ('2120', '新邱区', '3', '251', '0', '1');
INSERT INTO `toocms_region` VALUES ('2121', '太平区', '3', '251', '0', '1');
INSERT INTO `toocms_region` VALUES ('2122', '清河门区', '3', '251', '0', '1');
INSERT INTO `toocms_region` VALUES ('2123', '细河区', '3', '251', '0', '1');
INSERT INTO `toocms_region` VALUES ('2124', '彰武县', '3', '251', '0', '1');
INSERT INTO `toocms_region` VALUES ('2125', '龙港区', '3', '252', '0', '1');
INSERT INTO `toocms_region` VALUES ('2126', '南票区', '3', '252', '0', '1');
INSERT INTO `toocms_region` VALUES ('2127', '连山区', '3', '252', '0', '1');
INSERT INTO `toocms_region` VALUES ('2128', '兴城市', '3', '252', '0', '1');
INSERT INTO `toocms_region` VALUES ('2129', '绥中县', '3', '252', '0', '1');
INSERT INTO `toocms_region` VALUES ('2130', '建昌县', '3', '252', '0', '1');
INSERT INTO `toocms_region` VALUES ('2131', '太和区', '3', '253', '0', '1');
INSERT INTO `toocms_region` VALUES ('2132', '古塔区', '3', '253', '0', '1');
INSERT INTO `toocms_region` VALUES ('2133', '凌河区', '3', '253', '0', '1');
INSERT INTO `toocms_region` VALUES ('2134', '凌海市', '3', '253', '0', '1');
INSERT INTO `toocms_region` VALUES ('2135', '北镇市', '3', '253', '0', '1');
INSERT INTO `toocms_region` VALUES ('2136', '黑山县', '3', '253', '0', '1');
INSERT INTO `toocms_region` VALUES ('2137', '义县', '3', '253', '0', '1');
INSERT INTO `toocms_region` VALUES ('2138', '白塔区', '3', '254', '0', '1');
INSERT INTO `toocms_region` VALUES ('2139', '文圣区', '3', '254', '0', '1');
INSERT INTO `toocms_region` VALUES ('2140', '宏伟区', '3', '254', '0', '1');
INSERT INTO `toocms_region` VALUES ('2141', '太子河区', '3', '254', '0', '1');
INSERT INTO `toocms_region` VALUES ('2142', '弓长岭区', '3', '254', '0', '1');
INSERT INTO `toocms_region` VALUES ('2143', '灯塔市', '3', '254', '0', '1');
INSERT INTO `toocms_region` VALUES ('2144', '辽阳县', '3', '254', '0', '1');
INSERT INTO `toocms_region` VALUES ('2145', '双台子区', '3', '255', '0', '1');
INSERT INTO `toocms_region` VALUES ('2146', '兴隆台区', '3', '255', '0', '1');
INSERT INTO `toocms_region` VALUES ('2147', '大洼县', '3', '255', '0', '1');
INSERT INTO `toocms_region` VALUES ('2148', '盘山县', '3', '255', '0', '1');
INSERT INTO `toocms_region` VALUES ('2149', '银州区', '3', '256', '0', '1');
INSERT INTO `toocms_region` VALUES ('2150', '清河区', '3', '256', '0', '1');
INSERT INTO `toocms_region` VALUES ('2151', '调兵山市', '3', '256', '0', '1');
INSERT INTO `toocms_region` VALUES ('2152', '开原市', '3', '256', '0', '1');
INSERT INTO `toocms_region` VALUES ('2153', '铁岭县', '3', '256', '0', '1');
INSERT INTO `toocms_region` VALUES ('2154', '西丰县', '3', '256', '0', '1');
INSERT INTO `toocms_region` VALUES ('2155', '昌图县', '3', '256', '0', '1');
INSERT INTO `toocms_region` VALUES ('2156', '站前区', '3', '257', '0', '1');
INSERT INTO `toocms_region` VALUES ('2157', '西市区', '3', '257', '0', '1');
INSERT INTO `toocms_region` VALUES ('2158', '鲅鱼圈区', '3', '257', '0', '1');
INSERT INTO `toocms_region` VALUES ('2159', '老边区', '3', '257', '0', '1');
INSERT INTO `toocms_region` VALUES ('2160', '盖州市', '3', '257', '0', '1');
INSERT INTO `toocms_region` VALUES ('2161', '大石桥市', '3', '257', '0', '1');
INSERT INTO `toocms_region` VALUES ('2162', '回民区', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2163', '玉泉区', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2164', '新城区', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2165', '赛罕区', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2166', '清水河县', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2167', '土默特左旗', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2168', '托克托县', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2169', '和林格尔县', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2170', '武川县', '3', '258', '0', '1');
INSERT INTO `toocms_region` VALUES ('2171', '阿拉善左旗', '3', '259', '0', '1');
INSERT INTO `toocms_region` VALUES ('2172', '阿拉善右旗', '3', '259', '0', '1');
INSERT INTO `toocms_region` VALUES ('2173', '额济纳旗', '3', '259', '0', '1');
INSERT INTO `toocms_region` VALUES ('2174', '临河区', '3', '260', '0', '1');
INSERT INTO `toocms_region` VALUES ('2175', '五原县', '3', '260', '0', '1');
INSERT INTO `toocms_region` VALUES ('2176', '磴口县', '3', '260', '0', '1');
INSERT INTO `toocms_region` VALUES ('2177', '乌拉特前旗', '3', '260', '0', '1');
INSERT INTO `toocms_region` VALUES ('2178', '乌拉特中旗', '3', '260', '0', '1');
INSERT INTO `toocms_region` VALUES ('2179', '乌拉特后旗', '3', '260', '0', '1');
INSERT INTO `toocms_region` VALUES ('2180', '杭锦后旗', '3', '260', '0', '1');
INSERT INTO `toocms_region` VALUES ('2181', '昆都仑区', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2182', '青山区', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2183', '东河区', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2184', '九原区', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2185', '石拐区', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2186', '白云矿区', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2187', '土默特右旗', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2188', '固阳县', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2189', '达尔罕茂明安联合旗', '3', '261', '0', '1');
INSERT INTO `toocms_region` VALUES ('2190', '红山区', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2191', '元宝山区', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2192', '松山区', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2193', '阿鲁科尔沁旗', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2194', '巴林左旗', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2195', '巴林右旗', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2196', '林西县', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2197', '克什克腾旗', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2198', '翁牛特旗', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2199', '喀喇沁旗', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2200', '宁城县', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2201', '敖汉旗', '3', '262', '0', '1');
INSERT INTO `toocms_region` VALUES ('2202', '东胜区', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2203', '达拉特旗', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2204', '准格尔旗', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2205', '鄂托克前旗', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2206', '鄂托克旗', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2207', '杭锦旗', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2208', '乌审旗', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2209', '伊金霍洛旗', '3', '263', '0', '1');
INSERT INTO `toocms_region` VALUES ('2210', '海拉尔区', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2211', '莫力达瓦', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2212', '满洲里市', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2213', '牙克石市', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2214', '扎兰屯市', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2215', '额尔古纳市', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2216', '根河市', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2217', '阿荣旗', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2218', '鄂伦春自治旗', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2219', '鄂温克族自治旗', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2220', '陈巴尔虎旗', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2221', '新巴尔虎左旗', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2222', '新巴尔虎右旗', '3', '264', '0', '1');
INSERT INTO `toocms_region` VALUES ('2223', '科尔沁区', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2224', '霍林郭勒市', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2225', '科尔沁左翼中旗', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2226', '科尔沁左翼后旗', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2227', '开鲁县', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2228', '库伦旗', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2229', '奈曼旗', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2230', '扎鲁特旗', '3', '265', '0', '1');
INSERT INTO `toocms_region` VALUES ('2231', '海勃湾区', '3', '266', '0', '1');
INSERT INTO `toocms_region` VALUES ('2232', '乌达区', '3', '266', '0', '1');
INSERT INTO `toocms_region` VALUES ('2233', '海南区', '3', '266', '0', '1');
INSERT INTO `toocms_region` VALUES ('2234', '化德县', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2235', '集宁区', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2236', '丰镇市', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2237', '卓资县', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2238', '商都县', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2239', '兴和县', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2240', '凉城县', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2241', '察哈尔右翼前旗', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2242', '察哈尔右翼中旗', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2243', '察哈尔右翼后旗', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2244', '四子王旗', '3', '267', '0', '1');
INSERT INTO `toocms_region` VALUES ('2245', '二连浩特市', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2246', '锡林浩特市', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2247', '阿巴嘎旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2248', '苏尼特左旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2249', '苏尼特右旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2250', '东乌珠穆沁旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2251', '西乌珠穆沁旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2252', '太仆寺旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2253', '镶黄旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2254', '正镶白旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2255', '正蓝旗', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2256', '多伦县', '3', '268', '0', '1');
INSERT INTO `toocms_region` VALUES ('2257', '乌兰浩特市', '3', '269', '0', '1');
INSERT INTO `toocms_region` VALUES ('2258', '阿尔山市', '3', '269', '0', '1');
INSERT INTO `toocms_region` VALUES ('2259', '科尔沁右翼前旗', '3', '269', '0', '1');
INSERT INTO `toocms_region` VALUES ('2260', '科尔沁右翼中旗', '3', '269', '0', '1');
INSERT INTO `toocms_region` VALUES ('2261', '扎赉特旗', '3', '269', '0', '1');
INSERT INTO `toocms_region` VALUES ('2262', '突泉县', '3', '269', '0', '1');
INSERT INTO `toocms_region` VALUES ('2263', '西夏区', '3', '270', '0', '1');
INSERT INTO `toocms_region` VALUES ('2264', '金凤区', '3', '270', '0', '1');
INSERT INTO `toocms_region` VALUES ('2265', '兴庆区', '3', '270', '0', '1');
INSERT INTO `toocms_region` VALUES ('2266', '灵武市', '3', '270', '0', '1');
INSERT INTO `toocms_region` VALUES ('2267', '永宁县', '3', '270', '0', '1');
INSERT INTO `toocms_region` VALUES ('2268', '贺兰县', '3', '270', '0', '1');
INSERT INTO `toocms_region` VALUES ('2269', '原州区', '3', '271', '0', '1');
INSERT INTO `toocms_region` VALUES ('2270', '海原县', '3', '271', '0', '1');
INSERT INTO `toocms_region` VALUES ('2271', '西吉县', '3', '271', '0', '1');
INSERT INTO `toocms_region` VALUES ('2272', '隆德县', '3', '271', '0', '1');
INSERT INTO `toocms_region` VALUES ('2273', '泾源县', '3', '271', '0', '1');
INSERT INTO `toocms_region` VALUES ('2274', '彭阳县', '3', '271', '0', '1');
INSERT INTO `toocms_region` VALUES ('2275', '惠农县', '3', '272', '0', '1');
INSERT INTO `toocms_region` VALUES ('2276', '大武口区', '3', '272', '0', '1');
INSERT INTO `toocms_region` VALUES ('2277', '惠农区', '3', '272', '0', '1');
INSERT INTO `toocms_region` VALUES ('2278', '陶乐县', '3', '272', '0', '1');
INSERT INTO `toocms_region` VALUES ('2279', '平罗县', '3', '272', '0', '1');
INSERT INTO `toocms_region` VALUES ('2280', '利通区', '3', '273', '0', '1');
INSERT INTO `toocms_region` VALUES ('2281', '中卫县', '3', '273', '0', '1');
INSERT INTO `toocms_region` VALUES ('2282', '青铜峡市', '3', '273', '0', '1');
INSERT INTO `toocms_region` VALUES ('2283', '中宁县', '3', '273', '0', '1');
INSERT INTO `toocms_region` VALUES ('2284', '盐池县', '3', '273', '0', '1');
INSERT INTO `toocms_region` VALUES ('2285', '同心县', '3', '273', '0', '1');
INSERT INTO `toocms_region` VALUES ('2286', '沙坡头区', '3', '274', '0', '1');
INSERT INTO `toocms_region` VALUES ('2287', '海原县', '3', '274', '0', '1');
INSERT INTO `toocms_region` VALUES ('2288', '中宁县', '3', '274', '0', '1');
INSERT INTO `toocms_region` VALUES ('2289', '城中区', '3', '275', '0', '1');
INSERT INTO `toocms_region` VALUES ('2290', '城东区', '3', '275', '0', '1');
INSERT INTO `toocms_region` VALUES ('2291', '城西区', '3', '275', '0', '1');
INSERT INTO `toocms_region` VALUES ('2292', '城北区', '3', '275', '0', '1');
INSERT INTO `toocms_region` VALUES ('2293', '湟中县', '3', '275', '0', '1');
INSERT INTO `toocms_region` VALUES ('2294', '湟源县', '3', '275', '0', '1');
INSERT INTO `toocms_region` VALUES ('2295', '大通', '3', '275', '0', '1');
INSERT INTO `toocms_region` VALUES ('2296', '玛沁县', '3', '276', '0', '1');
INSERT INTO `toocms_region` VALUES ('2297', '班玛县', '3', '276', '0', '1');
INSERT INTO `toocms_region` VALUES ('2298', '甘德县', '3', '276', '0', '1');
INSERT INTO `toocms_region` VALUES ('2299', '达日县', '3', '276', '0', '1');
INSERT INTO `toocms_region` VALUES ('2300', '久治县', '3', '276', '0', '1');
INSERT INTO `toocms_region` VALUES ('2301', '玛多县', '3', '276', '0', '1');
INSERT INTO `toocms_region` VALUES ('2302', '海晏县', '3', '277', '0', '1');
INSERT INTO `toocms_region` VALUES ('2303', '祁连县', '3', '277', '0', '1');
INSERT INTO `toocms_region` VALUES ('2304', '刚察县', '3', '277', '0', '1');
INSERT INTO `toocms_region` VALUES ('2305', '门源', '3', '277', '0', '1');
INSERT INTO `toocms_region` VALUES ('2306', '平安县', '3', '278', '0', '1');
INSERT INTO `toocms_region` VALUES ('2307', '乐都县', '3', '278', '0', '1');
INSERT INTO `toocms_region` VALUES ('2308', '民和', '3', '278', '0', '1');
INSERT INTO `toocms_region` VALUES ('2309', '互助', '3', '278', '0', '1');
INSERT INTO `toocms_region` VALUES ('2310', '化隆', '3', '278', '0', '1');
INSERT INTO `toocms_region` VALUES ('2311', '循化', '3', '278', '0', '1');
INSERT INTO `toocms_region` VALUES ('2312', '共和县', '3', '279', '0', '1');
INSERT INTO `toocms_region` VALUES ('2313', '同德县', '3', '279', '0', '1');
INSERT INTO `toocms_region` VALUES ('2314', '贵德县', '3', '279', '0', '1');
INSERT INTO `toocms_region` VALUES ('2315', '兴海县', '3', '279', '0', '1');
INSERT INTO `toocms_region` VALUES ('2316', '贵南县', '3', '279', '0', '1');
INSERT INTO `toocms_region` VALUES ('2317', '德令哈市', '3', '280', '0', '1');
INSERT INTO `toocms_region` VALUES ('2318', '格尔木市', '3', '280', '0', '1');
INSERT INTO `toocms_region` VALUES ('2319', '乌兰县', '3', '280', '0', '1');
INSERT INTO `toocms_region` VALUES ('2320', '都兰县', '3', '280', '0', '1');
INSERT INTO `toocms_region` VALUES ('2321', '天峻县', '3', '280', '0', '1');
INSERT INTO `toocms_region` VALUES ('2322', '同仁县', '3', '281', '0', '1');
INSERT INTO `toocms_region` VALUES ('2323', '尖扎县', '3', '281', '0', '1');
INSERT INTO `toocms_region` VALUES ('2324', '泽库县', '3', '281', '0', '1');
INSERT INTO `toocms_region` VALUES ('2325', '河南蒙古族自治县', '3', '281', '0', '1');
INSERT INTO `toocms_region` VALUES ('2326', '玉树县', '3', '282', '0', '1');
INSERT INTO `toocms_region` VALUES ('2327', '杂多县', '3', '282', '0', '1');
INSERT INTO `toocms_region` VALUES ('2328', '称多县', '3', '282', '0', '1');
INSERT INTO `toocms_region` VALUES ('2329', '治多县', '3', '282', '0', '1');
INSERT INTO `toocms_region` VALUES ('2330', '囊谦县', '3', '282', '0', '1');
INSERT INTO `toocms_region` VALUES ('2331', '曲麻莱县', '3', '282', '0', '1');
INSERT INTO `toocms_region` VALUES ('2332', '市中区', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2333', '历下区', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2334', '天桥区', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2335', '槐荫区', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2336', '历城区', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2337', '长清区', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2338', '章丘市', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2339', '平阴县', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2340', '济阳县', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2341', '商河县', '3', '283', '0', '1');
INSERT INTO `toocms_region` VALUES ('2342', '市南区', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2343', '市北区', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2344', '城阳区', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2345', '四方区', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2346', '李沧区', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2347', '黄岛区', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2348', '崂山区', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2349', '胶州市', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2350', '即墨市', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2351', '平度市', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2352', '胶南市', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2353', '莱西市', '3', '284', '0', '1');
INSERT INTO `toocms_region` VALUES ('2354', '滨城区', '3', '285', '0', '1');
INSERT INTO `toocms_region` VALUES ('2355', '惠民县', '3', '285', '0', '1');
INSERT INTO `toocms_region` VALUES ('2356', '阳信县', '3', '285', '0', '1');
INSERT INTO `toocms_region` VALUES ('2357', '无棣县', '3', '285', '0', '1');
INSERT INTO `toocms_region` VALUES ('2358', '沾化县', '3', '285', '0', '1');
INSERT INTO `toocms_region` VALUES ('2359', '博兴县', '3', '285', '0', '1');
INSERT INTO `toocms_region` VALUES ('2360', '邹平县', '3', '285', '0', '1');
INSERT INTO `toocms_region` VALUES ('2361', '德城区', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2362', '陵县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2363', '乐陵市', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2364', '禹城市', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2365', '宁津县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2366', '庆云县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2367', '临邑县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2368', '齐河县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2369', '平原县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2370', '夏津县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2371', '武城县', '3', '286', '0', '1');
INSERT INTO `toocms_region` VALUES ('2372', '东营区', '3', '287', '0', '1');
INSERT INTO `toocms_region` VALUES ('2373', '河口区', '3', '287', '0', '1');
INSERT INTO `toocms_region` VALUES ('2374', '垦利县', '3', '287', '0', '1');
INSERT INTO `toocms_region` VALUES ('2375', '利津县', '3', '287', '0', '1');
INSERT INTO `toocms_region` VALUES ('2376', '广饶县', '3', '287', '0', '1');
INSERT INTO `toocms_region` VALUES ('2377', '牡丹区', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2378', '曹县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2379', '单县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2380', '成武县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2381', '巨野县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2382', '郓城县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2383', '鄄城县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2384', '定陶县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2385', '东明县', '3', '288', '0', '1');
INSERT INTO `toocms_region` VALUES ('2386', '市中区', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2387', '任城区', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2388', '曲阜市', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2389', '兖州市', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2390', '邹城市', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2391', '微山县', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2392', '鱼台县', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2393', '金乡县', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2394', '嘉祥县', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2395', '汶上县', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2396', '泗水县', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2397', '梁山县', '3', '289', '0', '1');
INSERT INTO `toocms_region` VALUES ('2398', '莱城区', '3', '290', '0', '1');
INSERT INTO `toocms_region` VALUES ('2399', '钢城区', '3', '290', '0', '1');
INSERT INTO `toocms_region` VALUES ('2400', '东昌府区', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2401', '临清市', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2402', '阳谷县', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2403', '莘县', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2404', '茌平县', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2405', '东阿县', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2406', '冠县', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2407', '高唐县', '3', '291', '0', '1');
INSERT INTO `toocms_region` VALUES ('2408', '兰山区', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2409', '罗庄区', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2410', '河东区', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2411', '沂南县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2412', '郯城县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2413', '沂水县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2414', '苍山县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2415', '费县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2416', '平邑县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2417', '莒南县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2418', '蒙阴县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2419', '临沭县', '3', '292', '0', '1');
INSERT INTO `toocms_region` VALUES ('2420', '东港区', '3', '293', '0', '1');
INSERT INTO `toocms_region` VALUES ('2421', '岚山区', '3', '293', '0', '1');
INSERT INTO `toocms_region` VALUES ('2422', '五莲县', '3', '293', '0', '1');
INSERT INTO `toocms_region` VALUES ('2423', '莒县', '3', '293', '0', '1');
INSERT INTO `toocms_region` VALUES ('2424', '泰山区', '3', '294', '0', '1');
INSERT INTO `toocms_region` VALUES ('2425', '岱岳区', '3', '294', '0', '1');
INSERT INTO `toocms_region` VALUES ('2426', '新泰市', '3', '294', '0', '1');
INSERT INTO `toocms_region` VALUES ('2427', '肥城市', '3', '294', '0', '1');
INSERT INTO `toocms_region` VALUES ('2428', '宁阳县', '3', '294', '0', '1');
INSERT INTO `toocms_region` VALUES ('2429', '东平县', '3', '294', '0', '1');
INSERT INTO `toocms_region` VALUES ('2430', '荣成市', '3', '295', '0', '1');
INSERT INTO `toocms_region` VALUES ('2431', '乳山市', '3', '295', '0', '1');
INSERT INTO `toocms_region` VALUES ('2432', '环翠区', '3', '295', '0', '1');
INSERT INTO `toocms_region` VALUES ('2433', '文登市', '3', '295', '0', '1');
INSERT INTO `toocms_region` VALUES ('2434', '潍城区', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2435', '寒亭区', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2436', '坊子区', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2437', '奎文区', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2438', '青州市', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2439', '诸城市', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2440', '寿光市', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2441', '安丘市', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2442', '高密市', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2443', '昌邑市', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2444', '临朐县', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2445', '昌乐县', '3', '296', '0', '1');
INSERT INTO `toocms_region` VALUES ('2446', '芝罘区', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2447', '福山区', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2448', '牟平区', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2449', '莱山区', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2450', '开发区', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2451', '龙口市', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2452', '莱阳市', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2453', '莱州市', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2454', '蓬莱市', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2455', '招远市', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2456', '栖霞市', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2457', '海阳市', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2458', '长岛县', '3', '297', '0', '1');
INSERT INTO `toocms_region` VALUES ('2459', '市中区', '3', '298', '0', '1');
INSERT INTO `toocms_region` VALUES ('2460', '山亭区', '3', '298', '0', '1');
INSERT INTO `toocms_region` VALUES ('2461', '峄城区', '3', '298', '0', '1');
INSERT INTO `toocms_region` VALUES ('2462', '台儿庄区', '3', '298', '0', '1');
INSERT INTO `toocms_region` VALUES ('2463', '薛城区', '3', '298', '0', '1');
INSERT INTO `toocms_region` VALUES ('2464', '滕州市', '3', '298', '0', '1');
INSERT INTO `toocms_region` VALUES ('2465', '张店区', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2466', '临淄区', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2467', '淄川区', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2468', '博山区', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2469', '周村区', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2470', '桓台县', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2471', '高青县', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2472', '沂源县', '3', '299', '0', '1');
INSERT INTO `toocms_region` VALUES ('2473', '杏花岭区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2474', '小店区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2475', '迎泽区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2476', '尖草坪区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2477', '万柏林区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2478', '晋源区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2479', '高新开发区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2480', '民营经济开发区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2481', '经济技术开发区', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2482', '清徐县', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2483', '阳曲县', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2484', '娄烦县', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2485', '古交市', '3', '300', '0', '1');
INSERT INTO `toocms_region` VALUES ('2486', '城区', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2487', '郊区', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2488', '沁县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2489', '潞城市', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2490', '长治县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2491', '襄垣县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2492', '屯留县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2493', '平顺县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2494', '黎城县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2495', '壶关县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2496', '长子县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2497', '武乡县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2498', '沁源县', '3', '301', '0', '1');
INSERT INTO `toocms_region` VALUES ('2499', '城区', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2500', '矿区', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2501', '南郊区', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2502', '新荣区', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2503', '阳高县', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2504', '天镇县', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2505', '广灵县', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2506', '灵丘县', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2507', '浑源县', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2508', '左云县', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2509', '大同县', '3', '302', '0', '1');
INSERT INTO `toocms_region` VALUES ('2510', '城区', '3', '303', '0', '1');
INSERT INTO `toocms_region` VALUES ('2511', '高平市', '3', '303', '0', '1');
INSERT INTO `toocms_region` VALUES ('2512', '沁水县', '3', '303', '0', '1');
INSERT INTO `toocms_region` VALUES ('2513', '阳城县', '3', '303', '0', '1');
INSERT INTO `toocms_region` VALUES ('2514', '陵川县', '3', '303', '0', '1');
INSERT INTO `toocms_region` VALUES ('2515', '泽州县', '3', '303', '0', '1');
INSERT INTO `toocms_region` VALUES ('2516', '榆次区', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2517', '介休市', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2518', '榆社县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2519', '左权县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2520', '和顺县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2521', '昔阳县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2522', '寿阳县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2523', '太谷县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2524', '祁县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2525', '平遥县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2526', '灵石县', '3', '304', '0', '1');
INSERT INTO `toocms_region` VALUES ('2527', '尧都区', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2528', '侯马市', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2529', '霍州市', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2530', '曲沃县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2531', '翼城县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2532', '襄汾县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2533', '洪洞县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2534', '吉县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2535', '安泽县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2536', '浮山县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2537', '古县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2538', '乡宁县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2539', '大宁县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2540', '隰县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2541', '永和县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2542', '蒲县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2543', '汾西县', '3', '305', '0', '1');
INSERT INTO `toocms_region` VALUES ('2544', '离石市', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2545', '离石区', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2546', '孝义市', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2547', '汾阳市', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2548', '文水县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2549', '交城县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2550', '兴县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2551', '临县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2552', '柳林县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2553', '石楼县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2554', '岚县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2555', '方山县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2556', '中阳县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2557', '交口县', '3', '306', '0', '1');
INSERT INTO `toocms_region` VALUES ('2558', '朔城区', '3', '307', '0', '1');
INSERT INTO `toocms_region` VALUES ('2559', '平鲁区', '3', '307', '0', '1');
INSERT INTO `toocms_region` VALUES ('2560', '山阴县', '3', '307', '0', '1');
INSERT INTO `toocms_region` VALUES ('2561', '应县', '3', '307', '0', '1');
INSERT INTO `toocms_region` VALUES ('2562', '右玉县', '3', '307', '0', '1');
INSERT INTO `toocms_region` VALUES ('2563', '怀仁县', '3', '307', '0', '1');
INSERT INTO `toocms_region` VALUES ('2564', '忻府区', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2565', '原平市', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2566', '定襄县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2567', '五台县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2568', '代县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2569', '繁峙县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2570', '宁武县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2571', '静乐县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2572', '神池县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2573', '五寨县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2574', '岢岚县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2575', '河曲县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2576', '保德县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2577', '偏关县', '3', '308', '0', '1');
INSERT INTO `toocms_region` VALUES ('2578', '城区', '3', '309', '0', '1');
INSERT INTO `toocms_region` VALUES ('2579', '矿区', '3', '309', '0', '1');
INSERT INTO `toocms_region` VALUES ('2580', '郊区', '3', '309', '0', '1');
INSERT INTO `toocms_region` VALUES ('2581', '平定县', '3', '309', '0', '1');
INSERT INTO `toocms_region` VALUES ('2582', '盂县', '3', '309', '0', '1');
INSERT INTO `toocms_region` VALUES ('2583', '盐湖区', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2584', '永济市', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2585', '河津市', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2586', '临猗县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2587', '万荣县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2588', '闻喜县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2589', '稷山县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2590', '新绛县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2591', '绛县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2592', '垣曲县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2593', '夏县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2594', '平陆县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2595', '芮城县', '3', '310', '0', '1');
INSERT INTO `toocms_region` VALUES ('2596', '莲湖区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2597', '新城区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2598', '碑林区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2599', '雁塔区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2600', '灞桥区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2601', '未央区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2602', '阎良区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2603', '临潼区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2604', '长安区', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2605', '蓝田县', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2606', '周至县', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2607', '户县', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2608', '高陵县', '3', '311', '0', '1');
INSERT INTO `toocms_region` VALUES ('2609', '汉滨区', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2610', '汉阴县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2611', '石泉县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2612', '宁陕县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2613', '紫阳县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2614', '岚皋县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2615', '平利县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2616', '镇坪县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2617', '旬阳县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2618', '白河县', '3', '312', '0', '1');
INSERT INTO `toocms_region` VALUES ('2619', '陈仓区', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2620', '渭滨区', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2621', '金台区', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2622', '凤翔县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2623', '岐山县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2624', '扶风县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2625', '眉县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2626', '陇县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2627', '千阳县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2628', '麟游县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2629', '凤县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2630', '太白县', '3', '313', '0', '1');
INSERT INTO `toocms_region` VALUES ('2631', '汉台区', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2632', '南郑县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2633', '城固县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2634', '洋县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2635', '西乡县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2636', '勉县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2637', '宁强县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2638', '略阳县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2639', '镇巴县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2640', '留坝县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2641', '佛坪县', '3', '314', '0', '1');
INSERT INTO `toocms_region` VALUES ('2642', '商州区', '3', '315', '0', '1');
INSERT INTO `toocms_region` VALUES ('2643', '洛南县', '3', '315', '0', '1');
INSERT INTO `toocms_region` VALUES ('2644', '丹凤县', '3', '315', '0', '1');
INSERT INTO `toocms_region` VALUES ('2645', '商南县', '3', '315', '0', '1');
INSERT INTO `toocms_region` VALUES ('2646', '山阳县', '3', '315', '0', '1');
INSERT INTO `toocms_region` VALUES ('2647', '镇安县', '3', '315', '0', '1');
INSERT INTO `toocms_region` VALUES ('2648', '柞水县', '3', '315', '0', '1');
INSERT INTO `toocms_region` VALUES ('2649', '耀州区', '3', '316', '0', '1');
INSERT INTO `toocms_region` VALUES ('2650', '王益区', '3', '316', '0', '1');
INSERT INTO `toocms_region` VALUES ('2651', '印台区', '3', '316', '0', '1');
INSERT INTO `toocms_region` VALUES ('2652', '宜君县', '3', '316', '0', '1');
INSERT INTO `toocms_region` VALUES ('2653', '临渭区', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2654', '韩城市', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2655', '华阴市', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2656', '华县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2657', '潼关县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2658', '大荔县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2659', '合阳县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2660', '澄城县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2661', '蒲城县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2662', '白水县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2663', '富平县', '3', '317', '0', '1');
INSERT INTO `toocms_region` VALUES ('2664', '秦都区', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2665', '渭城区', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2666', '杨陵区', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2667', '兴平市', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2668', '三原县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2669', '泾阳县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2670', '乾县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2671', '礼泉县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2672', '永寿县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2673', '彬县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2674', '长武县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2675', '旬邑县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2676', '淳化县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2677', '武功县', '3', '318', '0', '1');
INSERT INTO `toocms_region` VALUES ('2678', '吴起县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2679', '宝塔区', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2680', '延长县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2681', '延川县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2682', '子长县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2683', '安塞县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2684', '志丹县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2685', '甘泉县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2686', '富县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2687', '洛川县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2688', '宜川县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2689', '黄龙县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2690', '黄陵县', '3', '319', '0', '1');
INSERT INTO `toocms_region` VALUES ('2691', '榆阳区', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2692', '神木县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2693', '府谷县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2694', '横山县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2695', '靖边县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2696', '定边县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2697', '绥德县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2698', '米脂县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2699', '佳县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2700', '吴堡县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2701', '清涧县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2702', '子洲县', '3', '320', '0', '1');
INSERT INTO `toocms_region` VALUES ('2703', '长宁区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2704', '闸北区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2705', '闵行区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2706', '徐汇区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2707', '浦东新区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2708', '杨浦区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2709', '普陀区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2710', '静安区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2711', '卢湾区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2712', '虹口区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2713', '黄浦区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2714', '南汇区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2715', '松江区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2716', '嘉定区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2717', '宝山区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2718', '青浦区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2719', '金山区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2720', '奉贤区', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2721', '崇明县', '3', '321', '0', '1');
INSERT INTO `toocms_region` VALUES ('2722', '青羊区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2723', '锦江区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2724', '金牛区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2725', '武侯区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2726', '成华区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2727', '龙泉驿区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2728', '青白江区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2729', '新都区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2730', '温江区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2731', '高新区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2732', '高新西区', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2733', '都江堰市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2734', '彭州市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2735', '邛崃市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2736', '崇州市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2737', '金堂县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2738', '双流县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2739', '郫县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2740', '大邑县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2741', '蒲江县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2742', '新津县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2743', '都江堰市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2744', '彭州市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2745', '邛崃市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2746', '崇州市', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2747', '金堂县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2748', '双流县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2749', '郫县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2750', '大邑县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2751', '蒲江县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2752', '新津县', '3', '322', '0', '1');
INSERT INTO `toocms_region` VALUES ('2753', '涪城区', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2754', '游仙区', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2755', '江油市', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2756', '盐亭县', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2757', '三台县', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2758', '平武县', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2759', '安县', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2760', '梓潼县', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2761', '北川县', '3', '323', '0', '1');
INSERT INTO `toocms_region` VALUES ('2762', '马尔康县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2763', '汶川县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2764', '理县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2765', '茂县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2766', '松潘县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2767', '九寨沟县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2768', '金川县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2769', '小金县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2770', '黑水县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2771', '壤塘县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2772', '阿坝县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2773', '若尔盖县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2774', '红原县', '3', '324', '0', '1');
INSERT INTO `toocms_region` VALUES ('2775', '巴州区', '3', '325', '0', '1');
INSERT INTO `toocms_region` VALUES ('2776', '通江县', '3', '325', '0', '1');
INSERT INTO `toocms_region` VALUES ('2777', '南江县', '3', '325', '0', '1');
INSERT INTO `toocms_region` VALUES ('2778', '平昌县', '3', '325', '0', '1');
INSERT INTO `toocms_region` VALUES ('2779', '通川区', '3', '326', '0', '1');
INSERT INTO `toocms_region` VALUES ('2780', '万源市', '3', '326', '0', '1');
INSERT INTO `toocms_region` VALUES ('2781', '达县', '3', '326', '0', '1');
INSERT INTO `toocms_region` VALUES ('2782', '宣汉县', '3', '326', '0', '1');
INSERT INTO `toocms_region` VALUES ('2783', '开江县', '3', '326', '0', '1');
INSERT INTO `toocms_region` VALUES ('2784', '大竹县', '3', '326', '0', '1');
INSERT INTO `toocms_region` VALUES ('2785', '渠县', '3', '326', '0', '1');
INSERT INTO `toocms_region` VALUES ('2786', '旌阳区', '3', '327', '0', '1');
INSERT INTO `toocms_region` VALUES ('2787', '广汉市', '3', '327', '0', '1');
INSERT INTO `toocms_region` VALUES ('2788', '什邡市', '3', '327', '0', '1');
INSERT INTO `toocms_region` VALUES ('2789', '绵竹市', '3', '327', '0', '1');
INSERT INTO `toocms_region` VALUES ('2790', '罗江县', '3', '327', '0', '1');
INSERT INTO `toocms_region` VALUES ('2791', '中江县', '3', '327', '0', '1');
INSERT INTO `toocms_region` VALUES ('2792', '康定县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2793', '丹巴县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2794', '泸定县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2795', '炉霍县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2796', '九龙县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2797', '甘孜县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2798', '雅江县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2799', '新龙县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2800', '道孚县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2801', '白玉县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2802', '理塘县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2803', '德格县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2804', '乡城县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2805', '石渠县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2806', '稻城县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2807', '色达县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2808', '巴塘县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2809', '得荣县', '3', '328', '0', '1');
INSERT INTO `toocms_region` VALUES ('2810', '广安区', '3', '329', '0', '1');
INSERT INTO `toocms_region` VALUES ('2811', '华蓥市', '3', '329', '0', '1');
INSERT INTO `toocms_region` VALUES ('2812', '岳池县', '3', '329', '0', '1');
INSERT INTO `toocms_region` VALUES ('2813', '武胜县', '3', '329', '0', '1');
INSERT INTO `toocms_region` VALUES ('2814', '邻水县', '3', '329', '0', '1');
INSERT INTO `toocms_region` VALUES ('2815', '利州区', '3', '330', '0', '1');
INSERT INTO `toocms_region` VALUES ('2816', '元坝区', '3', '330', '0', '1');
INSERT INTO `toocms_region` VALUES ('2817', '朝天区', '3', '330', '0', '1');
INSERT INTO `toocms_region` VALUES ('2818', '旺苍县', '3', '330', '0', '1');
INSERT INTO `toocms_region` VALUES ('2819', '青川县', '3', '330', '0', '1');
INSERT INTO `toocms_region` VALUES ('2820', '剑阁县', '3', '330', '0', '1');
INSERT INTO `toocms_region` VALUES ('2821', '苍溪县', '3', '330', '0', '1');
INSERT INTO `toocms_region` VALUES ('2822', '峨眉山市', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2823', '乐山市', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2824', '犍为县', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2825', '井研县', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2826', '夹江县', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2827', '沐川县', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2828', '峨边', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2829', '马边', '3', '331', '0', '1');
INSERT INTO `toocms_region` VALUES ('2830', '西昌市', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2831', '盐源县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2832', '德昌县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2833', '会理县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2834', '会东县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2835', '宁南县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2836', '普格县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2837', '布拖县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2838', '金阳县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2839', '昭觉县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2840', '喜德县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2841', '冕宁县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2842', '越西县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2843', '甘洛县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2844', '美姑县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2845', '雷波县', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2846', '木里', '3', '332', '0', '1');
INSERT INTO `toocms_region` VALUES ('2847', '东坡区', '3', '333', '0', '1');
INSERT INTO `toocms_region` VALUES ('2848', '仁寿县', '3', '333', '0', '1');
INSERT INTO `toocms_region` VALUES ('2849', '彭山县', '3', '333', '0', '1');
INSERT INTO `toocms_region` VALUES ('2850', '洪雅县', '3', '333', '0', '1');
INSERT INTO `toocms_region` VALUES ('2851', '丹棱县', '3', '333', '0', '1');
INSERT INTO `toocms_region` VALUES ('2852', '青神县', '3', '333', '0', '1');
INSERT INTO `toocms_region` VALUES ('2853', '阆中市', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2854', '南部县', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2855', '营山县', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2856', '蓬安县', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2857', '仪陇县', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2858', '顺庆区', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2859', '高坪区', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2860', '嘉陵区', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2861', '西充县', '3', '334', '0', '1');
INSERT INTO `toocms_region` VALUES ('2862', '市中区', '3', '335', '0', '1');
INSERT INTO `toocms_region` VALUES ('2863', '东兴区', '3', '335', '0', '1');
INSERT INTO `toocms_region` VALUES ('2864', '威远县', '3', '335', '0', '1');
INSERT INTO `toocms_region` VALUES ('2865', '资中县', '3', '335', '0', '1');
INSERT INTO `toocms_region` VALUES ('2866', '隆昌县', '3', '335', '0', '1');
INSERT INTO `toocms_region` VALUES ('2867', '东  区', '3', '336', '0', '1');
INSERT INTO `toocms_region` VALUES ('2868', '西  区', '3', '336', '0', '1');
INSERT INTO `toocms_region` VALUES ('2869', '仁和区', '3', '336', '0', '1');
INSERT INTO `toocms_region` VALUES ('2870', '米易县', '3', '336', '0', '1');
INSERT INTO `toocms_region` VALUES ('2871', '盐边县', '3', '336', '0', '1');
INSERT INTO `toocms_region` VALUES ('2872', '船山区', '3', '337', '0', '1');
INSERT INTO `toocms_region` VALUES ('2873', '安居区', '3', '337', '0', '1');
INSERT INTO `toocms_region` VALUES ('2874', '蓬溪县', '3', '337', '0', '1');
INSERT INTO `toocms_region` VALUES ('2875', '射洪县', '3', '337', '0', '1');
INSERT INTO `toocms_region` VALUES ('2876', '大英县', '3', '337', '0', '1');
INSERT INTO `toocms_region` VALUES ('2877', '雨城区', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2878', '名山县', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2879', '荥经县', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2880', '汉源县', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2881', '石棉县', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2882', '天全县', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2883', '芦山县', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2884', '宝兴县', '3', '338', '0', '1');
INSERT INTO `toocms_region` VALUES ('2885', '翠屏区', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2886', '宜宾县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2887', '南溪县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2888', '江安县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2889', '长宁县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2890', '高县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2891', '珙县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2892', '筠连县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2893', '兴文县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2894', '屏山县', '3', '339', '0', '1');
INSERT INTO `toocms_region` VALUES ('2895', '雁江区', '3', '340', '0', '1');
INSERT INTO `toocms_region` VALUES ('2896', '简阳市', '3', '340', '0', '1');
INSERT INTO `toocms_region` VALUES ('2897', '安岳县', '3', '340', '0', '1');
INSERT INTO `toocms_region` VALUES ('2898', '乐至县', '3', '340', '0', '1');
INSERT INTO `toocms_region` VALUES ('2899', '大安区', '3', '341', '0', '1');
INSERT INTO `toocms_region` VALUES ('2900', '自流井区', '3', '341', '0', '1');
INSERT INTO `toocms_region` VALUES ('2901', '贡井区', '3', '341', '0', '1');
INSERT INTO `toocms_region` VALUES ('2902', '沿滩区', '3', '341', '0', '1');
INSERT INTO `toocms_region` VALUES ('2903', '荣县', '3', '341', '0', '1');
INSERT INTO `toocms_region` VALUES ('2904', '富顺县', '3', '341', '0', '1');
INSERT INTO `toocms_region` VALUES ('2905', '江阳区', '3', '342', '0', '1');
INSERT INTO `toocms_region` VALUES ('2906', '纳溪区', '3', '342', '0', '1');
INSERT INTO `toocms_region` VALUES ('2907', '龙马潭区', '3', '342', '0', '1');
INSERT INTO `toocms_region` VALUES ('2908', '泸县', '3', '342', '0', '1');
INSERT INTO `toocms_region` VALUES ('2909', '合江县', '3', '342', '0', '1');
INSERT INTO `toocms_region` VALUES ('2910', '叙永县', '3', '342', '0', '1');
INSERT INTO `toocms_region` VALUES ('2911', '古蔺县', '3', '342', '0', '1');
INSERT INTO `toocms_region` VALUES ('2912', '和平区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2913', '河西区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2914', '南开区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2915', '河北区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2916', '河东区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2917', '红桥区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2918', '东丽区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2919', '津南区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2920', '西青区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2921', '北辰区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2922', '塘沽区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2923', '汉沽区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2924', '大港区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2925', '武清区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2926', '宝坻区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2927', '经济开发区', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2928', '宁河县', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2929', '静海县', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2930', '蓟县', '3', '343', '0', '1');
INSERT INTO `toocms_region` VALUES ('2931', '城关区', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2932', '林周县', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2933', '当雄县', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2934', '尼木县', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2935', '曲水县', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2936', '堆龙德庆县', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2937', '达孜县', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2938', '墨竹工卡县', '3', '344', '0', '1');
INSERT INTO `toocms_region` VALUES ('2939', '噶尔县', '3', '345', '0', '1');
INSERT INTO `toocms_region` VALUES ('2940', '普兰县', '3', '345', '0', '1');
INSERT INTO `toocms_region` VALUES ('2941', '札达县', '3', '345', '0', '1');
INSERT INTO `toocms_region` VALUES ('2942', '日土县', '3', '345', '0', '1');
INSERT INTO `toocms_region` VALUES ('2943', '革吉县', '3', '345', '0', '1');
INSERT INTO `toocms_region` VALUES ('2944', '改则县', '3', '345', '0', '1');
INSERT INTO `toocms_region` VALUES ('2945', '措勤县', '3', '345', '0', '1');
INSERT INTO `toocms_region` VALUES ('2946', '昌都县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2947', '江达县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2948', '贡觉县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2949', '类乌齐县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2950', '丁青县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2951', '察雅县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2952', '八宿县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2953', '左贡县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2954', '芒康县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2955', '洛隆县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2956', '边坝县', '3', '346', '0', '1');
INSERT INTO `toocms_region` VALUES ('2957', '林芝县', '3', '347', '0', '1');
INSERT INTO `toocms_region` VALUES ('2958', '工布江达县', '3', '347', '0', '1');
INSERT INTO `toocms_region` VALUES ('2959', '米林县', '3', '347', '0', '1');
INSERT INTO `toocms_region` VALUES ('2960', '墨脱县', '3', '347', '0', '1');
INSERT INTO `toocms_region` VALUES ('2961', '波密县', '3', '347', '0', '1');
INSERT INTO `toocms_region` VALUES ('2962', '察隅县', '3', '347', '0', '1');
INSERT INTO `toocms_region` VALUES ('2963', '朗县', '3', '347', '0', '1');
INSERT INTO `toocms_region` VALUES ('2964', '那曲县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2965', '嘉黎县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2966', '比如县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2967', '聂荣县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2968', '安多县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2969', '申扎县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2970', '索县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2971', '班戈县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2972', '巴青县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2973', '尼玛县', '3', '348', '0', '1');
INSERT INTO `toocms_region` VALUES ('2974', '日喀则市', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2975', '南木林县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2976', '江孜县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2977', '定日县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2978', '萨迦县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2979', '拉孜县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2980', '昂仁县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2981', '谢通门县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2982', '白朗县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2983', '仁布县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2984', '康马县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2985', '定结县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2986', '仲巴县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2987', '亚东县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2988', '吉隆县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2989', '聂拉木县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2990', '萨嘎县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2991', '岗巴县', '3', '349', '0', '1');
INSERT INTO `toocms_region` VALUES ('2992', '乃东县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('2993', '扎囊县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('2994', '贡嘎县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('2995', '桑日县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('2996', '琼结县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('2997', '曲松县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('2998', '措美县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('2999', '洛扎县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('3000', '加查县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('3001', '隆子县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('3002', '错那县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('3003', '浪卡子县', '3', '350', '0', '1');
INSERT INTO `toocms_region` VALUES ('3004', '天山区', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3005', '沙依巴克区', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3006', '新市区', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3007', '水磨沟区', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3008', '头屯河区', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3009', '达坂城区', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3010', '米东区', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3011', '乌鲁木齐县', '3', '351', '0', '1');
INSERT INTO `toocms_region` VALUES ('3012', '阿克苏市', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3013', '温宿县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3014', '库车县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3015', '沙雅县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3016', '新和县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3017', '拜城县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3018', '乌什县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3019', '阿瓦提县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3020', '柯坪县', '3', '352', '0', '1');
INSERT INTO `toocms_region` VALUES ('3021', '阿拉尔市', '3', '353', '0', '1');
INSERT INTO `toocms_region` VALUES ('3022', '库尔勒市', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3023', '轮台县', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3024', '尉犁县', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3025', '若羌县', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3026', '且末县', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3027', '焉耆', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3028', '和静县', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3029', '和硕县', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3030', '博湖县', '3', '354', '0', '1');
INSERT INTO `toocms_region` VALUES ('3031', '博乐市', '3', '355', '0', '1');
INSERT INTO `toocms_region` VALUES ('3032', '精河县', '3', '355', '0', '1');
INSERT INTO `toocms_region` VALUES ('3033', '温泉县', '3', '355', '0', '1');
INSERT INTO `toocms_region` VALUES ('3034', '呼图壁县', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3035', '米泉市', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3036', '昌吉市', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3037', '阜康市', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3038', '玛纳斯县', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3039', '奇台县', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3040', '吉木萨尔县', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3041', '木垒', '3', '356', '0', '1');
INSERT INTO `toocms_region` VALUES ('3042', '哈密市', '3', '357', '0', '1');
INSERT INTO `toocms_region` VALUES ('3043', '伊吾县', '3', '357', '0', '1');
INSERT INTO `toocms_region` VALUES ('3044', '巴里坤', '3', '357', '0', '1');
INSERT INTO `toocms_region` VALUES ('3045', '和田市', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3046', '和田县', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3047', '墨玉县', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3048', '皮山县', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3049', '洛浦县', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3050', '策勒县', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3051', '于田县', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3052', '民丰县', '3', '358', '0', '1');
INSERT INTO `toocms_region` VALUES ('3053', '喀什市', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3054', '疏附县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3055', '疏勒县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3056', '英吉沙县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3057', '泽普县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3058', '莎车县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3059', '叶城县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3060', '麦盖提县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3061', '岳普湖县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3062', '伽师县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3063', '巴楚县', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3064', '塔什库尔干', '3', '359', '0', '1');
INSERT INTO `toocms_region` VALUES ('3065', '克拉玛依市', '3', '360', '0', '1');
INSERT INTO `toocms_region` VALUES ('3066', '阿图什市', '3', '361', '0', '1');
INSERT INTO `toocms_region` VALUES ('3067', '阿克陶县', '3', '361', '0', '1');
INSERT INTO `toocms_region` VALUES ('3068', '阿合奇县', '3', '361', '0', '1');
INSERT INTO `toocms_region` VALUES ('3069', '乌恰县', '3', '361', '0', '1');
INSERT INTO `toocms_region` VALUES ('3070', '石河子市', '3', '362', '0', '1');
INSERT INTO `toocms_region` VALUES ('3071', '图木舒克市', '3', '363', '0', '1');
INSERT INTO `toocms_region` VALUES ('3072', '吐鲁番市', '3', '364', '0', '1');
INSERT INTO `toocms_region` VALUES ('3073', '鄯善县', '3', '364', '0', '1');
INSERT INTO `toocms_region` VALUES ('3074', '托克逊县', '3', '364', '0', '1');
INSERT INTO `toocms_region` VALUES ('3075', '五家渠市', '3', '365', '0', '1');
INSERT INTO `toocms_region` VALUES ('3076', '阿勒泰市', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3077', '布克赛尔', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3078', '伊宁市', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3079', '布尔津县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3080', '奎屯市', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3081', '乌苏市', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3082', '额敏县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3083', '富蕴县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3084', '伊宁县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3085', '福海县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3086', '霍城县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3087', '沙湾县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3088', '巩留县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3089', '哈巴河县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3090', '托里县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3091', '青河县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3092', '新源县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3093', '裕民县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3094', '和布克赛尔', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3095', '吉木乃县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3096', '昭苏县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3097', '特克斯县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3098', '尼勒克县', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3099', '察布查尔', '3', '366', '0', '1');
INSERT INTO `toocms_region` VALUES ('3100', '盘龙区', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3101', '五华区', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3102', '官渡区', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3103', '西山区', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3104', '东川区', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3105', '安宁市', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3106', '呈贡县', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3107', '晋宁县', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3108', '富民县', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3109', '宜良县', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3110', '嵩明县', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3111', '石林县', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3112', '禄劝', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3113', '寻甸', '3', '367', '0', '1');
INSERT INTO `toocms_region` VALUES ('3114', '兰坪', '3', '368', '0', '1');
INSERT INTO `toocms_region` VALUES ('3115', '泸水县', '3', '368', '0', '1');
INSERT INTO `toocms_region` VALUES ('3116', '福贡县', '3', '368', '0', '1');
INSERT INTO `toocms_region` VALUES ('3117', '贡山', '3', '368', '0', '1');
INSERT INTO `toocms_region` VALUES ('3118', '宁洱', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3119', '思茅区', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3120', '墨江', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3121', '景东', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3122', '景谷', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3123', '镇沅', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3124', '江城', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3125', '孟连', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3126', '澜沧', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3127', '西盟', '3', '369', '0', '1');
INSERT INTO `toocms_region` VALUES ('3128', '古城区', '3', '370', '0', '1');
INSERT INTO `toocms_region` VALUES ('3129', '宁蒗', '3', '370', '0', '1');
INSERT INTO `toocms_region` VALUES ('3130', '玉龙', '3', '370', '0', '1');
INSERT INTO `toocms_region` VALUES ('3131', '永胜县', '3', '370', '0', '1');
INSERT INTO `toocms_region` VALUES ('3132', '华坪县', '3', '370', '0', '1');
INSERT INTO `toocms_region` VALUES ('3133', '隆阳区', '3', '371', '0', '1');
INSERT INTO `toocms_region` VALUES ('3134', '施甸县', '3', '371', '0', '1');
INSERT INTO `toocms_region` VALUES ('3135', '腾冲县', '3', '371', '0', '1');
INSERT INTO `toocms_region` VALUES ('3136', '龙陵县', '3', '371', '0', '1');
INSERT INTO `toocms_region` VALUES ('3137', '昌宁县', '3', '371', '0', '1');
INSERT INTO `toocms_region` VALUES ('3138', '楚雄市', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3139', '双柏县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3140', '牟定县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3141', '南华县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3142', '姚安县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3143', '大姚县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3144', '永仁县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3145', '元谋县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3146', '武定县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3147', '禄丰县', '3', '372', '0', '1');
INSERT INTO `toocms_region` VALUES ('3148', '大理市', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3149', '祥云县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3150', '宾川县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3151', '弥渡县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3152', '永平县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3153', '云龙县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3154', '洱源县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3155', '剑川县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3156', '鹤庆县', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3157', '漾濞', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3158', '南涧', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3159', '巍山', '3', '373', '0', '1');
INSERT INTO `toocms_region` VALUES ('3160', '潞西市', '3', '374', '0', '1');
INSERT INTO `toocms_region` VALUES ('3161', '瑞丽市', '3', '374', '0', '1');
INSERT INTO `toocms_region` VALUES ('3162', '梁河县', '3', '374', '0', '1');
INSERT INTO `toocms_region` VALUES ('3163', '盈江县', '3', '374', '0', '1');
INSERT INTO `toocms_region` VALUES ('3164', '陇川县', '3', '374', '0', '1');
INSERT INTO `toocms_region` VALUES ('3165', '香格里拉县', '3', '375', '0', '1');
INSERT INTO `toocms_region` VALUES ('3166', '德钦县', '3', '375', '0', '1');
INSERT INTO `toocms_region` VALUES ('3167', '维西', '3', '375', '0', '1');
INSERT INTO `toocms_region` VALUES ('3168', '泸西县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3169', '蒙自县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3170', '个旧市', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3171', '开远市', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3172', '绿春县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3173', '建水县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3174', '石屏县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3175', '弥勒县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3176', '元阳县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3177', '红河县', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3178', '金平', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3179', '河口', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3180', '屏边', '3', '376', '0', '1');
INSERT INTO `toocms_region` VALUES ('3181', '临翔区', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3182', '凤庆县', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3183', '云县', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3184', '永德县', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3185', '镇康县', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3186', '双江', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3187', '耿马', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3188', '沧源', '3', '377', '0', '1');
INSERT INTO `toocms_region` VALUES ('3189', '麒麟区', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3190', '宣威市', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3191', '马龙县', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3192', '陆良县', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3193', '师宗县', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3194', '罗平县', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3195', '富源县', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3196', '会泽县', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3197', '沾益县', '3', '378', '0', '1');
INSERT INTO `toocms_region` VALUES ('3198', '文山县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3199', '砚山县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3200', '西畴县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3201', '麻栗坡县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3202', '马关县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3203', '丘北县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3204', '广南县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3205', '富宁县', '3', '379', '0', '1');
INSERT INTO `toocms_region` VALUES ('3206', '景洪市', '3', '380', '0', '1');
INSERT INTO `toocms_region` VALUES ('3207', '勐海县', '3', '380', '0', '1');
INSERT INTO `toocms_region` VALUES ('3208', '勐腊县', '3', '380', '0', '1');
INSERT INTO `toocms_region` VALUES ('3209', '红塔区', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3210', '江川县', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3211', '澄江县', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3212', '通海县', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3213', '华宁县', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3214', '易门县', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3215', '峨山', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3216', '新平', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3217', '元江', '3', '381', '0', '1');
INSERT INTO `toocms_region` VALUES ('3218', '昭阳区', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3219', '鲁甸县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3220', '巧家县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3221', '盐津县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3222', '大关县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3223', '永善县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3224', '绥江县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3225', '镇雄县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3226', '彝良县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3227', '威信县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3228', '水富县', '3', '382', '0', '1');
INSERT INTO `toocms_region` VALUES ('3229', '西湖区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3230', '上城区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3231', '下城区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3232', '拱墅区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3233', '滨江区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3234', '江干区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3235', '萧山区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3236', '余杭区', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3237', '市郊', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3238', '建德市', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3239', '富阳市', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3240', '临安市', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3241', '桐庐县', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3242', '淳安县', '3', '383', '0', '1');
INSERT INTO `toocms_region` VALUES ('3243', '吴兴区', '3', '384', '0', '1');
INSERT INTO `toocms_region` VALUES ('3244', '南浔区', '3', '384', '0', '1');
INSERT INTO `toocms_region` VALUES ('3245', '德清县', '3', '384', '0', '1');
INSERT INTO `toocms_region` VALUES ('3246', '长兴县', '3', '384', '0', '1');
INSERT INTO `toocms_region` VALUES ('3247', '安吉县', '3', '384', '0', '1');
INSERT INTO `toocms_region` VALUES ('3248', '南湖区', '3', '385', '0', '1');
INSERT INTO `toocms_region` VALUES ('3249', '秀洲区', '3', '385', '0', '1');
INSERT INTO `toocms_region` VALUES ('3250', '海宁市', '3', '385', '0', '1');
INSERT INTO `toocms_region` VALUES ('3251', '嘉善县', '3', '385', '0', '1');
INSERT INTO `toocms_region` VALUES ('3252', '平湖市', '3', '385', '0', '1');
INSERT INTO `toocms_region` VALUES ('3253', '桐乡市', '3', '385', '0', '1');
INSERT INTO `toocms_region` VALUES ('3254', '海盐县', '3', '385', '0', '1');
INSERT INTO `toocms_region` VALUES ('3255', '婺城区', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3256', '金东区', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3257', '兰溪市', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3258', '市区', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3259', '佛堂镇', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3260', '上溪镇', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3261', '义亭镇', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3262', '大陈镇', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3263', '苏溪镇', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3264', '赤岸镇', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3265', '东阳市', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3266', '永康市', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3267', '武义县', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3268', '浦江县', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3269', '磐安县', '3', '386', '0', '1');
INSERT INTO `toocms_region` VALUES ('3270', '莲都区', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3271', '龙泉市', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3272', '青田县', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3273', '缙云县', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3274', '遂昌县', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3275', '松阳县', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3276', '云和县', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3277', '庆元县', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3278', '景宁', '3', '387', '0', '1');
INSERT INTO `toocms_region` VALUES ('3279', '海曙区', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3280', '江东区', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3281', '江北区', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3282', '镇海区', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3283', '北仑区', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3284', '鄞州区', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3285', '余姚市', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3286', '慈溪市', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3287', '奉化市', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3288', '象山县', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3289', '宁海县', '3', '388', '0', '1');
INSERT INTO `toocms_region` VALUES ('3290', '越城区', '3', '389', '0', '1');
INSERT INTO `toocms_region` VALUES ('3291', '上虞市', '3', '389', '0', '1');
INSERT INTO `toocms_region` VALUES ('3292', '嵊州市', '3', '389', '0', '1');
INSERT INTO `toocms_region` VALUES ('3293', '绍兴县', '3', '389', '0', '1');
INSERT INTO `toocms_region` VALUES ('3294', '新昌县', '3', '389', '0', '1');
INSERT INTO `toocms_region` VALUES ('3295', '诸暨市', '3', '389', '0', '1');
INSERT INTO `toocms_region` VALUES ('3296', '椒江区', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3297', '黄岩区', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3298', '路桥区', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3299', '温岭市', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3300', '临海市', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3301', '玉环县', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3302', '三门县', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3303', '天台县', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3304', '仙居县', '3', '390', '0', '1');
INSERT INTO `toocms_region` VALUES ('3305', '鹿城区', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3306', '龙湾区', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3307', '瓯海区', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3308', '瑞安市', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3309', '乐清市', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3310', '洞头县', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3311', '永嘉县', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3312', '平阳县', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3313', '苍南县', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3314', '文成县', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3315', '泰顺县', '3', '391', '0', '1');
INSERT INTO `toocms_region` VALUES ('3316', '定海区', '3', '392', '0', '1');
INSERT INTO `toocms_region` VALUES ('3317', '普陀区', '3', '392', '0', '1');
INSERT INTO `toocms_region` VALUES ('3318', '岱山县', '3', '392', '0', '1');
INSERT INTO `toocms_region` VALUES ('3319', '嵊泗县', '3', '392', '0', '1');
INSERT INTO `toocms_region` VALUES ('3320', '衢州市', '3', '393', '0', '1');
INSERT INTO `toocms_region` VALUES ('3321', '江山市', '3', '393', '0', '1');
INSERT INTO `toocms_region` VALUES ('3322', '常山县', '3', '393', '0', '1');
INSERT INTO `toocms_region` VALUES ('3323', '开化县', '3', '393', '0', '1');
INSERT INTO `toocms_region` VALUES ('3324', '龙游县', '3', '393', '0', '1');
INSERT INTO `toocms_region` VALUES ('3325', '合川区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3326', '江津区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3327', '南川区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3328', '永川区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3329', '南岸区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3330', '渝北区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3331', '万盛区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3332', '大渡口区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3333', '万州区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3334', '北碚区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3335', '沙坪坝区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3336', '巴南区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3337', '涪陵区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3338', '江北区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3339', '九龙坡区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3340', '渝中区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3341', '黔江开发区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3342', '长寿区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3343', '双桥区', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3344', '綦江县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3345', '潼南县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3346', '铜梁县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3347', '大足县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3348', '荣昌县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3349', '璧山县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3350', '垫江县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3351', '武隆县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3352', '丰都县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3353', '城口县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3354', '梁平县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3355', '开县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3356', '巫溪县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3357', '巫山县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3358', '奉节县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3359', '云阳县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3360', '忠县', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3361', '石柱', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3362', '彭水', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3363', '酉阳', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3364', '秀山', '3', '394', '0', '1');
INSERT INTO `toocms_region` VALUES ('3365', '沙田区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3366', '东区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3367', '观塘区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3368', '黄大仙区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3369', '九龙城区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3370', '屯门区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3371', '葵青区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3372', '元朗区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3373', '深水埗区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3374', '西贡区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3375', '大埔区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3376', '湾仔区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3377', '油尖旺区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3378', '北区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3379', '南区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3380', '荃湾区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3381', '中西区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3382', '离岛区', '3', '395', '0', '1');
INSERT INTO `toocms_region` VALUES ('3383', '澳门', '3', '396', '0', '1');
INSERT INTO `toocms_region` VALUES ('3384', '台北', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3385', '高雄', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3386', '基隆', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3387', '台中', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3388', '台南', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3389', '新竹', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3390', '嘉义', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3391', '宜兰县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3392', '桃园县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3393', '苗栗县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3394', '彰化县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3395', '南投县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3396', '云林县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3397', '屏东县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3398', '台东县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3399', '花莲县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3400', '澎湖县', '3', '397', '0', '1');
INSERT INTO `toocms_region` VALUES ('3401', '合肥', '2', '3', '0', '1');
INSERT INTO `toocms_region` VALUES ('3402', '庐阳区', '3', '3401', '0', '1');
INSERT INTO `toocms_region` VALUES ('3403', '瑶海区', '3', '3401', '0', '1');
INSERT INTO `toocms_region` VALUES ('3404', '蜀山区', '3', '3401', '0', '1');
INSERT INTO `toocms_region` VALUES ('3405', '包河区', '3', '3401', '0', '1');
INSERT INTO `toocms_region` VALUES ('3406', '长丰县', '3', '3401', '0', '1');
INSERT INTO `toocms_region` VALUES ('3407', '肥东县', '3', '3401', '0', '1');
INSERT INTO `toocms_region` VALUES ('3408', '肥西县', '3', '3401', '0', '1');

-- ----------------------------
-- View structure for toocms_administrator_view
-- ----------------------------
DROP VIEW IF EXISTS `toocms_administrator_view`;
CREATE ALGORITHM=MERGE DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `toocms_administrator_view` AS select `admin`.`id` AS `id`,`admin`.`account` AS `account`,`admin`.`unique_code` AS `unique_code`,`admin`.`password` AS `password`,`admin`.`group_id` AS `group_id`,`admin`.`login` AS `login`,`admin`.`last_login_time` AS `last_login_time`,`admin`.`last_login_ip` AS `last_login_ip`,`admin`.`create_time` AS `create_time`,`admin`.`update_time` AS `update_time`,`admin`.`status` AS `status`,`auth_group`.`title` AS `group_name`,`auth_group`.`status` AS `group_status` from (`toocms_administrator` `admin` left join `toocms_auth_group` `auth_group` on((`auth_group`.`id` = `admin`.`group_id`)));

-- ----------------------------
-- Procedure structure for _administrator_login_
-- ----------------------------
DROP PROCEDURE IF EXISTS `_administrator_login_`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `_administrator_login_`(IN `act` VARCHAR(15), IN `pass` CHAR(32))
    COMMENT '后台管理员登陆'
begin

select admin.id,admin.account,admin.last_login_time,admin.status,auth_group.status group_status from toocms_administrator admin left join toocms_auth_group auth_group on auth_group.id=admin.group_id where ((admin.account=act) and (admin.password=pass)) limit 1;

end;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for _change_level_
-- ----------------------------
DROP PROCEDURE IF EXISTS `_change_level_`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `_change_level_`(IN `in_cis_id` MEDIUMINT(8) UNSIGNED, IN `in_bis_id` MEDIUMINT(8) UNSIGNED)
    COMMENT '修改 取送员和商家的星级'
begin
	declare upd_res tinyint(1) default 0;
	declare lc mediumint(8) default 0;
	declare cn mediumint(8) default 0;
	
	declare cis_comm_data cursor for select SUM(level_1) AS level_count,COUNT(*) AS comm_number from `toocms_comment` where (cis_id=in_cis_id) limit 1;
	declare bis_comm_data cursor for select SUM(level_2) AS level_count,COUNT(*) AS comm_number from `toocms_comment` where (bis_id=in_bis_id) limit 1;

	if in_cis_id != 0 then

		open cis_comm_data;

			fetch cis_comm_data into lc,cn;

			update `toocms_commissioner` set `level`=(lc/cn) where (`id`=in_cis_id);

			set upd_res = row_count();

		close cis_comm_data;
	end if;

	if in_bis_id != 0 then

		open bis_comm_data;

			fetch bis_comm_data into lc,cn;

			update `toocms_business` set `level`= (lc/cn) where (`id`=in_bis_id);

			set upd_res = row_count();

		close bis_comm_data;

	end if;

	select upd_res;

end;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for _generate_code_
-- ----------------------------
DROP PROCEDURE IF EXISTS `_generate_code_`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `_generate_code_`(IN `new_id` MEDIUMINT(8) UNSIGNED, IN `table_name` VARCHAR(30))
    COMMENT '生成唯一标识'
begin

	declare upd_res tinyint(1) default 0;

	if table_name = 'administrator' then

		update toocms_administrator set unique_code=concat(floor(100+(rand()*899)),new_id) where (id=new_id);

	elseif table_name = 'kp' then

		update toocms_keeper set kp_sn=concat(floor(100+(rand()*899)),new_id) where (id=new_id);

	elseif table_name = 'bis' then

		update toocms_business set identifier=concat('B',floor(100+(rand()*899)),new_id) where (id=new_id);

	elseif table_name = 'reg_admin' then

		update toocms_region_administrator set identifier=concat('RA',floor(100+(rand()*899)),new_id) where (id=new_id);

	end if;

	set upd_res = row_count();

	select upd_res;

end;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for _member_login_
-- ----------------------------
DROP PROCEDURE IF EXISTS `_member_login_`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `_member_login_`(IN `in_account` BIGINT(11) UNSIGNED, IN `in_password` CHAR(32), IN `in_openid` CHAR(105))
    COMMENT '普通用户登录'
begin



if in_openid != '' then

select m.id m_id,m.account,m.nickname,m.balance,m.park_currency,m.search_range,conn.platform_nickname,conn.platform_gender,conn.platform_head,file.abs_url head 

from toocms_interconnect conn 

left join toocms_member m on m.id=conn.m_id 

left join toocms_file file on file.id=m.head 

where (conn.openid=in_openid);

else



select m.id m_id,m.account,m.nickname,m.balance,m.park_currency,m.search_range,file.abs_url head from toocms_member m left join toocms_file file on file.id=m.head where ((m.account=in_account) and (m.password=in_password));

end if;

end;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for _pay_callback_
-- ----------------------------
DROP PROCEDURE IF EXISTS `_pay_callback_`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `_pay_callback_`(IN `in_order_id` MEDIUMINT(8) UNSIGNED)
    COMMENT '支付成功后回调执行'
begin

declare order_upd_res tinyint(1) default 0;

declare pay_log_payment tinyint(1);

declare pay_log_amounts decimal(10,1);

declare pay_log_m_id mediumint(8);



declare cash_log_m_id mediumint(8);

declare cash_log_prop_id mediumint(8);

declare cash_log_amounts decimal(10,1);



declare done tinyint(1) default 0;



declare pay_log_cur cursor for select payment,amounts,m_id from `toocms_pay_log` where (`order_id`=in_order_id) limit 1;

declare cash_log_cur cursor for select m_id,prop_id,amounts from `toocms_cash_log` where (`order_id`=in_order_id);





declare continue handler for not found set done = 1;



update `toocms_orders` set `order_status`=1,`pay_time`=unix_timestamp(now()) where (`id`=in_order_id);

set order_upd_res = row_count();



update `toocms_pay_log` set `status`=1,`update_time`=unix_timestamp(now()) where (`order_id`=in_order_id);

update `toocms_currency_log` set `status`=1,`update_time`=unix_timestamp(now()) where (`order_id`=in_order_id);

open pay_log_cur;

	fetch pay_log_cur into pay_log_payment,pay_log_amounts,pay_log_m_id;

	if pay_log_payment = 5 then

		update `toocms_member` set `park_currency`=`park_currency`-ceil(pay_log_amounts) where (`id`=pay_log_m_id);

	end if;

close pay_log_cur;





update `toocms_cash_log` set `status`=1,`update_time`=unix_timestamp(now()) where (`order_id`=in_order_id);



open cash_log_cur;

read_loop:loop

	fetch cash_log_cur into cash_log_m_id,cash_log_prop_id,cash_log_amounts;

	if done then

    	leave read_loop;

	end if;

	if cash_log_m_id != 0 then

		update `toocms_member` set `balance`=`balance`+cash_log_amounts where (`id`=cash_log_m_id);

	elseif cash_log_prop_id !=0 then

		update `toocms_property` set `balance`=`balance`+cash_log_amounts where (`id`=cash_log_prop_id);

	end if;

end loop;

close cash_log_cur;





select order_upd_res;

end;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for _total_stat_
-- ----------------------------
DROP PROCEDURE IF EXISTS `_total_stat_`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `_total_stat_`()
    COMMENT '总后台 主页数量统计'
BEGIN



DECLARE members INT(8) DEFAULT 0; 



SELECT COUNT(*) FROM toocms_member into members; 



SELECT members;



END;;
DELIMITER ;

-- ----------------------------
-- Trigger structure for _after_insert_file_
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `_after_insert_file_` AFTER INSERT ON `toocms_file` FOR EACH ROW insert into toocms_file_extend (file_id,description) values (new.id,'');;
DELIMITER ;

-- ----------------------------
-- Trigger structure for _after_delete_file_
-- ----------------------------
DELIMITER ;;
CREATE TRIGGER `_after_delete_file_` AFTER DELETE ON `toocms_file` FOR EACH ROW begin
delete from toocms_file_extend where file_id=old.id;
end;;
DELIMITER ;
