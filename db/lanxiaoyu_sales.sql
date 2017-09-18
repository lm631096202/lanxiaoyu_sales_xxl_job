/*
Navicat MySQL Data Transfer

Source Server         : localhost2_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : lanxiaoyu_sales

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-06-11 22:22:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tp_admin_access`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_access`;
CREATE TABLE `tp_admin_access` (
  `role_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `node_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_access
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_group`;
CREATE TABLE `tp_admin_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'icon小图标',
  `sort` int(11) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_group
-- ----------------------------
INSERT INTO `tp_admin_group` VALUES ('1', '系统管理', '&#xe61d;', '100', '1', '', '0', '1450752856', '1495610562');
INSERT INTO `tp_admin_group` VALUES ('2', '工具', '&#xe616;', '101', '1', '', '0', '1476016712', '1495610556');
INSERT INTO `tp_admin_group` VALUES ('3', '学员管理', '&amp;#xe60d;', '50', '1', '学员管理模块', '0', '1495610374', '1497019703');
INSERT INTO `tp_admin_group` VALUES ('4', '学长管理', '', '50', '1', '学长管理', '0', '1495610491', '1495610491');
INSERT INTO `tp_admin_group` VALUES ('6', '通知管理', '', '50', '1', '通知管理', '0', '1495698723', '1495704713');
INSERT INTO `tp_admin_group` VALUES ('5', '课程管理', '&amp;#xe637;', '50', '1', '课程管理备注', '0', '1495620672', '1496930893');
INSERT INTO `tp_admin_group` VALUES ('7', '学期管理', '', '50', '1', '学期管理模块', '0', '1495702684', '1495704733');
INSERT INTO `tp_admin_group` VALUES ('8', '学长分团管理', '&amp;#xe62d;', '50', '1', '学长分团管理', '0', '1497019139', '1497019139');

-- ----------------------------
-- Table structure for `tp_admin_node`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node`;
CREATE TABLE `tp_admin_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `group_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '节点类型，1-控制器 | 0-方法',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '50',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `isdelete` (`isdelete`),
  KEY `sort` (`sort`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_node
-- ----------------------------
INSERT INTO `tp_admin_node` VALUES ('1', '0', '1', 'Admin', '后台管理', '后台管理，不可更改', '1', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('2', '1', '1', 'AdminGroup', '分组管理', ' ', '2', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('3', '1', '1', 'AdminNode', '节点管理', ' ', '2', '1', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('4', '1', '1', 'AdminRole', '角色管理', ' ', '2', '1', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('5', '1', '1', 'AdminUser', '用户管理', '', '2', '1', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('6', '1', '0', 'Index', '首页', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('7', '6', '0', 'welcome', '欢迎页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('8', '6', '0', 'index', '未定义', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('9', '1', '2', 'Generate', '代码自动生成', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('10', '1', '2', 'Demo/excel', 'Excel一键导出', '', '2', '0', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('11', '1', '2', 'Demo/download', '下载', '', '2', '0', '3', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('12', '1', '2', 'Demo/downloadImage', '远程图片下载', '', '2', '0', '4', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('13', '1', '2', 'Demo/mail', '邮件发送', '', '2', '0', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('14', '1', '2', 'Demo/qiniu', '七牛上传', '', '2', '0', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('15', '1', '2', 'Demo/hashids', 'ID加密', '', '2', '0', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('16', '1', '2', 'Demo/layer', '丰富弹层', '', '2', '0', '8', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('17', '1', '2', 'Demo/tableFixed', '表格溢出', '', '2', '0', '9', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('18', '1', '2', 'Demo/ueditor', '百度编辑器', '', '2', '0', '10', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('19', '1', '2', 'Demo/imageUpload', '图片上传', '', '2', '0', '11', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('20', '1', '2', 'Demo/qrcode', '二维码生成', '', '2', '0', '12', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('21', '1', '1', 'NodeMap', '节点图', '', '2', '1', '5', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('22', '1', '1', 'WebLog', '操作日志', '', '2', '1', '6', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('23', '1', '1', 'LoginLog', '登录日志', '', '2', '1', '7', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('59', '1', '2', 'one.two.three.Four/index', '多级节点', '', '2', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('24', '23', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('25', '22', '0', 'index', '列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('26', '22', '0', 'detail', '详情', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('27', '21', '0', 'load', '自动导入', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('28', '21', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('29', '5', '0', 'add', '添加', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('30', '21', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('31', '21', '0', 'deleteForever', '永久删除', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('32', '9', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('33', '9', '0', 'generate', '生成方法', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('34', '5', '0', 'password', '修改密码', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('35', '5', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('36', '5', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('37', '5', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('38', '4', '0', 'user', '用户列表', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('39', '4', '0', 'access', '授权', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('40', '4', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('41', '4', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('42', '4', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('43', '4', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('44', '4', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('45', '3', '0', 'load', '节点快速导入测试', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('46', '3', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('47', '3', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('48', '3', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('49', '3', '0', 'forbid', '默认禁用操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('50', '3', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('51', '2', '0', 'index', '首页', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('52', '2', '0', 'add', '添加', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('53', '2', '0', 'edit', '编辑', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('54', '2', '0', 'forbid', '默认禁用操作', '', '3', '0', '51', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('55', '2', '0', 'resume', '默认恢复操作', '', '3', '0', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('56', '1', '2', 'one', '一级菜单', '', '2', '1', '13', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('60', '56', '2', 'two', '二级', '', '3', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('61', '60', '2', 'three', '三级菜单', '', '4', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('62', '61', '2', 'Four', '四级菜单', '', '5', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('64', '23', '0', 'Communicate', '11', '', '3', '1', '50', '1', '1');
INSERT INTO `tp_admin_node` VALUES ('66', '1', '1', 'Test', '测试', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('67', '1', '3', 'Resume', '学员简历管理', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('68', '1', '5', 'Course', '课程管理', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('69', '1', '6', 'Notice', '通知管理', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('71', '1', '7', 'Term', '学期管理', '', '2', '1', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('92', '1', '8', 'SeniorAssignment', '学长分配', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('91', '1', '8', 'Senior', '学长申请', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('90', '1', '7', 'TeamManager', '团辅导员管理', '', '2', '1', '100', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('80', '1', '7', 'StudentNo', '学号管理', '', '2', '1', '50', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('88', '80', '0', 'add', '新增学号', '', '3', '0', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('87', '80', '0', 'index', '学号列表', '', '3', '0', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('86', '71', '0', 'add', '新增学期', '', '3', '0', '2', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('85', '71', '0', 'index', '学期列表查看', '', '3', '0', '1', '1', '0');
INSERT INTO `tp_admin_node` VALUES ('89', '80', '0', 'delete', '删除学号', '', '3', '0', '3', '1', '0');

-- ----------------------------
-- Table structure for `tp_admin_node_load`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_node_load`;
CREATE TABLE `tp_admin_node_load` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='节点快速导入';

-- ----------------------------
-- Records of tp_admin_node_load
-- ----------------------------
INSERT INTO `tp_admin_node_load` VALUES ('4', '编辑', 'edit', '1');
INSERT INTO `tp_admin_node_load` VALUES ('5', '添加', 'add', '1');
INSERT INTO `tp_admin_node_load` VALUES ('6', '首页', 'index', '1');
INSERT INTO `tp_admin_node_load` VALUES ('7', '删除', 'delete', '1');

-- ----------------------------
-- Table structure for `tp_admin_role`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role`;
CREATE TABLE `tp_admin_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`),
  KEY `isdelete` (`isdelete`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_admin_role
-- ----------------------------
INSERT INTO `tp_admin_role` VALUES ('1', '0', '超级用户', ' ', '1', '0', '1208784792', '1496972480');
INSERT INTO `tp_admin_role` VALUES ('2', '0', '辅导员', ' ', '1', '0', '1215496283', '1496972491');
INSERT INTO `tp_admin_role` VALUES ('3', '0', '点评学长', '', '1', '0', '1496973280', '1496973280');
INSERT INTO `tp_admin_role` VALUES ('4', '0', '督促学长', '', '1', '0', '1496973290', '1496973290');
INSERT INTO `tp_admin_role` VALUES ('5', '0', '团长', '', '1', '0', '1496973296', '1496973296');
INSERT INTO `tp_admin_role` VALUES ('6', '0', '学员', '', '1', '0', '1496973306', '1496973306');

-- ----------------------------
-- Table structure for `tp_admin_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_role_user`;
CREATE TABLE `tp_admin_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of tp_admin_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin_user`;
CREATE TABLE `tp_admin_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '帐号',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `reset_code` char(6) NOT NULL COMMENT '重置密码验证码',
  `expire_time` int(11) NOT NULL COMMENT '重置密码验证码过期时间',
  `type` tinyint(4) NOT NULL COMMENT '学员类型',
  `realname` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` tinyint(4) NOT NULL COMMENT '性别',
  `education` varchar(255) NOT NULL DEFAULT '' COMMENT '学历',
  `university` varchar(255) NOT NULL DEFAULT '' COMMENT '毕业学校',
  `major` varchar(255) NOT NULL DEFAULT '' COMMENT '专业',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后一次登录ip',
  `login_count` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` char(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `remark` text NOT NULL COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '50' COMMENT '状态',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否已删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `qq_number` varchar(50) NOT NULL DEFAULT '0' COMMENT 'QQ号码',
  `yy_number` varchar(50) NOT NULL DEFAULT '0' COMMENT 'YY号码',
  `whole_body_picture_id` int(11) NOT NULL DEFAULT '0' COMMENT '全身照id',
  `convenient_communication_time` varchar(50) NOT NULL DEFAULT '0' COMMENT '方便沟通时间',
  `native_address_id` int(11) NOT NULL DEFAULT '0' COMMENT '籍贯地址id',
  `resume_password` varchar(50) NOT NULL DEFAULT '0' COMMENT '简历密码',
  `gift_address_id` int(11) NOT NULL DEFAULT '0' COMMENT '礼物地址id',
  `birthday_year` int(11) NOT NULL DEFAULT '0' COMMENT '生日年份',
  `birthday_month` int(11) NOT NULL DEFAULT '0' COMMENT '生日月份',
  `birthday_date` int(11) NOT NULL DEFAULT '0' COMMENT '生日日期',
  `birthday_type` int(11) NOT NULL DEFAULT '0' COMMENT '生日类型',
  `is_married` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已婚',
  `own_computer` int(11) NOT NULL DEFAULT '0' COMMENT '是否有电脑',
  `wechat_number` varchar(255) NOT NULL DEFAULT '0' COMMENT '微信号码',
  `living_address_id` int(11) NOT NULL DEFAULT '0' COMMENT '居住地id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `accountpassword` (`account`,`password`),
  KEY `isdelete` (`isdelete`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员';

-- ----------------------------
-- Records of tp_admin_user
-- ----------------------------
INSERT INTO `tp_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '221673', '1495859451', '0', '超级管理员', '0', '', '', '', '1497080295', '127.0.0.1', '433', 'it@zanboon.com', '13590172844', '我是超级管理员', '1', '0', '1222907803', '1451033528', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `tp_admin_user` VALUES ('2', 'demo', 'e10adc3949ba59abbe56e057f20f883e', '', '0', '0', '测试', '0', '', '', '', '1481206367', '127.0.0.1', '5', '', '', '', '1', '0', '1476777133', '1477399793', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `tp_apply_senior`
-- ----------------------------
DROP TABLE IF EXISTS `tp_apply_senior`;
CREATE TABLE `tp_apply_senior` (
  `apply_senior_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '申请id',
  `user_id` int(11) DEFAULT NULL COMMENT '申请人用户id',
  `status` int(11) DEFAULT NULL COMMENT '申请状态',
  `type` enum('comment','guide') DEFAULT NULL COMMENT '申请类型:guide和comment',
  `num` int(11) DEFAULT NULL COMMENT '申请点评或指导人数',
  `agree_user_id` int(11) DEFAULT NULL COMMENT '审核者的会员id',
  PRIMARY KEY (`apply_senior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_apply_senior
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_commnet`
-- ----------------------------
DROP TABLE IF EXISTS `tp_commnet`;
CREATE TABLE `tp_commnet` (
  `comment_user_id` int(11) NOT NULL COMMENT '点评学长user_id',
  `summary_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` enum('normal','excellent','champion','top','abnormal') DEFAULT NULL COMMENT '点评等级：abnormal不正常，normal正常，excellent优秀，champion冠军,top顶级',
  `isapply` tinyint(4) DEFAULT NULL COMMENT '等级申请中',
  `apply_rank` enum('top','champion') DEFAULT 'champion' COMMENT 'champion冠军,top顶级',
  `status` enum('family_opposition','abnormal_work','bad_mood','normal','unstable_state') DEFAULT NULL COMMENT 'Unstable state:心态不稳，family_opposition 家人反对学习,Abnormal work 工作不顺畅,bad mood心情不好,Normal 学习正常',
  PRIMARY KEY (`comment_id`),
  KEY `comment_user_id` (`comment_user_id`,`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='点评';

-- ----------------------------
-- Records of tp_commnet
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_course`
-- ----------------------------
DROP TABLE IF EXISTS `tp_course`;
CREATE TABLE `tp_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(255) NOT NULL COMMENT '课程标题',
  `detail` text COMMENT '内容详情',
  `course_time` int(11) NOT NULL COMMENT '上课时间',
  `term_id` int(11) DEFAULT NULL COMMENT '期id',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Records of tp_course
-- ----------------------------
INSERT INTO `tp_course` VALUES ('2', '上课标题2', '内容描述2', '1495641600', null);
INSERT INTO `tp_course` VALUES ('3', '3333', '33333', '1495681846', null);

-- ----------------------------
-- Table structure for `tp_course_notice`
-- ----------------------------
DROP TABLE IF EXISTS `tp_course_notice`;
CREATE TABLE `tp_course_notice` (
  `course_id` int(11) NOT NULL COMMENT '课程id',
  `notice_id` int(11) NOT NULL COMMENT '通知id',
  PRIMARY KEY (`course_id`,`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上课通知';

-- ----------------------------
-- Records of tp_course_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_file`
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '文件类型，1-image | 2-file',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `original` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `domain` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `size` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_file
-- ----------------------------
INSERT INTO `tp_file` VALUES ('1', '1', 'image/j2k1v8ig_1d15k2d1d0hw591408972bc45.png', 'QQ图片20170503145151.png', '', 'image/png', '45720', '1494485143');
INSERT INTO `tp_file` VALUES ('2', '1', 'image/j2k1v9a8_1pctzslamz0k5914089836c49.png', 'QQ图片20170503145151.png', '', 'image/png', '45720', '1494485144');
INSERT INTO `tp_file` VALUES ('3', '3', 'video/j2k1w1u0_3i7p7jbhaig4591408bd70a92.wmv', 'Wildlife.wmv', '', 'video/x-ms-wmv', '26246026', '1494485228');
INSERT INTO `tp_file` VALUES ('4', '3', '/tmp/uploads/20170527\\3bec0ea65624a6e4ef74da92a3a50f9c.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1495876268');
INSERT INTO `tp_file` VALUES ('5', '3', '/tmp/uploads/20170527\\0d77c1cbabfaf50ee3f4d76aa32db5e0.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1495876626');
INSERT INTO `tp_file` VALUES ('6', '3', '/tmp/uploads/20170527\\10db37a6f5ec5bfbab312dba7baf64cd.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1495876842');
INSERT INTO `tp_file` VALUES ('7', '3', '/tmp/uploads/20170527\\4135a581cf30f08b9bae0927026dd82a.jpg', 'Jellyfish.jpg', '', 'image/jpeg', '135486', '1495876985');
INSERT INTO `tp_file` VALUES ('8', '3', '/tmp/uploads/20170527\\f29a501130eecb8445754029cbd401c9.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1495877098');
INSERT INTO `tp_file` VALUES ('9', '3', '/tmp/uploads/20170527\\60bd18f8c3917e7929fe3300b6a95474.jpg', 'Desert.jpg', '', 'image/jpeg', '232980', '1495877128');
INSERT INTO `tp_file` VALUES ('10', '3', '/tmp/uploads/20170527\\b83b28c3ac5d252d464e4fee4ed24e85.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1495877325');
INSERT INTO `tp_file` VALUES ('11', '3', '/tmp/uploads/20170527\\20763bc3792ae1b95f8f22659325981d.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1495877505');
INSERT INTO `tp_file` VALUES ('12', '3', '/tmp/uploads/20170527\\1f1863d4d502621dfeba565bb0f1342b.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1495877586');
INSERT INTO `tp_file` VALUES ('13', '3', '/tmp/uploads/20170527\\b3c99288c015b023af45af0077cd3584.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1495877653');
INSERT INTO `tp_file` VALUES ('14', '3', '/tmp/uploads/20170527\\0930cef5a140ea125ac33ca67a42c363.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1495877702');
INSERT INTO `tp_file` VALUES ('15', '3', '/tmp/uploads/20170527\\cd251970539be4b32ceb0b8393abe68b.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1495877769');
INSERT INTO `tp_file` VALUES ('16', '3', '/tmp/uploads/20170527\\d1b26c8073c0c169eb32f2e239328623.jpg', 'Hydrangeas.jpg', '', 'image/jpeg', '162991', '1495877849');
INSERT INTO `tp_file` VALUES ('17', '3', '/tmp/uploads/20170527\\210f3b60233cdba25817f1bcdb0f1b85.jpg', 'Lighthouse.jpg', '', 'image/jpeg', '169732', '1495877913');
INSERT INTO `tp_file` VALUES ('18', '3', '/tmp/uploads/20170527\\251df107935973bf499ef2b68e023e68.jpg', 'Penguins.jpg', '', 'image/jpeg', '202248', '1495877943');
INSERT INTO `tp_file` VALUES ('19', '3', '/tmp/uploads/20170527\\80c9a669f6686105bc94a6bbc5894ef9.jpg', 'Tulips.jpg', '', 'image/jpeg', '161728', '1495877960');
INSERT INTO `tp_file` VALUES ('20', '3', '/tmp/uploads/20170527\\4cae891748016d5b6e4ceed98a442953.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1495879409');
INSERT INTO `tp_file` VALUES ('21', '3', '/tmp/uploads/20170527\\4c355c55a8bd06f1f7d0f6a6c0071427.jpg', 'Desert.jpg', '', 'image/jpeg', '232980', '1495879541');
INSERT INTO `tp_file` VALUES ('22', '3', '/tmp/uploads/20170527\\ea53b6981297e8497d15d954b6c35cac.jpg', 'Jellyfish.jpg', '', 'image/jpeg', '135486', '1495879572');
INSERT INTO `tp_file` VALUES ('23', '3', '/tmp/uploads/20170527\\764e268661fd74dfce3ae3cb7ef552fb.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1495879633');
INSERT INTO `tp_file` VALUES ('24', '3', '/tmp/uploads/20170527\\073dc017a85c72cefd4f4d157e0d0340.jpg', 'Desert.jpg', '', 'image/jpeg', '232980', '1495880039');
INSERT INTO `tp_file` VALUES ('25', '3', '/tmp/uploads/20170527\\e3be5c183f144207fabb5de3abb94da1.jpg', 'Jellyfish.jpg', '', 'image/jpeg', '135486', '1495880932');
INSERT INTO `tp_file` VALUES ('26', '3', '/tmp/uploads/20170527\\20906aa94af71befa490495fe09b6bcf.jpg', 'Penguins.jpg', '', 'image/jpeg', '202248', '1495880945');
INSERT INTO `tp_file` VALUES ('27', '3', '/tmp/uploads/20170527\\61ceee5409ac0570e58607b43b3a0bf8.jpg', 'Desert.jpg', '', 'image/jpeg', '232980', '1495881062');
INSERT INTO `tp_file` VALUES ('28', '3', '/tmp/uploads/20170527\\eac80fcaae6e50f488bdca53896865cf.jpg', 'Jellyfish.jpg', '', 'image/jpeg', '135486', '1495881065');
INSERT INTO `tp_file` VALUES ('29', '3', '/tmp/uploads/20170527\\d93a8e1639d784823bcd1ff64e23e8f3.jpg', 'Tulips.jpg', '', 'image/jpeg', '161728', '1495881071');
INSERT INTO `tp_file` VALUES ('30', '3', '/tmp/uploads/20170531\\f69fe5c60cf320240181b4ec074b05b3.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1496210468');
INSERT INTO `tp_file` VALUES ('31', '3', '/tmp/uploads/20170531\\cf714e23275f2aff2636cf2718d1ee23.jpg', 'Desert.jpg', '', 'image/jpeg', '232980', '1496210475');
INSERT INTO `tp_file` VALUES ('32', '3', '/tmp/uploads/20170531\\8c666b2a02c7897f65c0d3c6a8523632.jpg', 'Jellyfish.jpg', '', 'image/jpeg', '135486', '1496210478');
INSERT INTO `tp_file` VALUES ('33', '3', '/tmp/uploads/20170531\\bbe361779d68eed510b8361e9fc3022a.jpg', 'Penguins.jpg', '', 'image/jpeg', '202248', '1496210489');
INSERT INTO `tp_file` VALUES ('34', '3', '/tmp/uploads/20170531\\a28e8e65ec0d9c8a48f5faf14272c570.jpg', 't01b6684fcd5fce99f6.jpg', '', 'image/jpeg', '219804', '1496210529');
INSERT INTO `tp_file` VALUES ('35', '3', '/tmp/uploads/20170531\\09797518829ccb4b29cdfc113c916a0a.jpg', 't01b6684fcd5fce99f6.jpg', '', 'image/jpeg', '219804', '1496210564');
INSERT INTO `tp_file` VALUES ('36', '3', '/tmp/uploads/20170531\\146cce351fc4693537593bcd52e1160d.jpg', 't01b6684fcd5fce99f6.jpg', '', 'image/jpeg', '219804', '1496214951');
INSERT INTO `tp_file` VALUES ('37', '3', '/tmp/uploads/20170531\\a1b2d4569d8ccfd26650f3f560083e5a.jpg', 't01b6684fcd5fce99f6.jpg', '', 'image/jpeg', '219804', '1496221886');
INSERT INTO `tp_file` VALUES ('38', '3', '/tmp/uploads/20170531\\fd4b01574d76c35bdaedae9d0320a6b0.jpg', 't01be714deb07da6d5b.jpg', '', 'image/jpeg', '107983', '1496223678');
INSERT INTO `tp_file` VALUES ('39', '3', '/tmp/uploads/20170531\\5daeebad9bacc8f8b5a2d31b897f1ce1.jpg', 't01be714deb07da6d5b.jpg', '', 'image/jpeg', '107983', '1496223695');
INSERT INTO `tp_file` VALUES ('40', '3', '/tmp/uploads/20170531\\cf606bff9c5da7c8639f6091e5ccdc7e.jpg', 't0130731798c9559831.jpg', '', 'image/jpeg', '376372', '1496229963');
INSERT INTO `tp_file` VALUES ('41', '3', '/tmp/uploads/20170531\\6429e31027cd2b0e95341df79b099053.jpg', 't0130731798c9559831.jpg', '', 'image/jpeg', '376372', '1496230219');
INSERT INTO `tp_file` VALUES ('42', '3', '/tmp/uploads/20170531\\0436bbcc28f382926eefd331a1002c48.jpg', 't01be714deb07da6d5b.jpg', '', 'image/jpeg', '107983', '1496230294');
INSERT INTO `tp_file` VALUES ('43', '3', '/tmp/uploads/20170531\\c3d0fd9722f02b4ebc59d36a6595241a.jpg', 't0130731798c9559831.jpg', '', 'image/jpeg', '376372', '1496230372');
INSERT INTO `tp_file` VALUES ('44', '3', '/tmp/uploads/20170531\\70af0933c86a251bb06d719557313cda.jpg', 't0130731798c9559831.jpg', '', 'image/jpeg', '376372', '1496230413');
INSERT INTO `tp_file` VALUES ('45', '3', '/tmp/uploads/20170531\\b2c233c65d88709d236bfab808c86173.jpg', 't01be714deb07da6d5b.jpg', '', 'image/jpeg', '107983', '1496230419');
INSERT INTO `tp_file` VALUES ('46', '3', '/tmp/uploads/20170531\\57c544b21508f91c9be70dbd46468e26.jpg', 't018bd1675c4a3370a2.jpg', '', 'image/jpeg', '864050', '1496230453');
INSERT INTO `tp_file` VALUES ('47', '3', '/tmp/uploads/20170531\\6529f445366c88ef6fb4294d3a696f3a.jpg', 't01de42c25989a4cf66.jpg', '', 'image/jpeg', '193500', '1496230466');
INSERT INTO `tp_file` VALUES ('48', '3', '/tmp/uploads/20170531\\be1e77d74086af41585c2ad71192580d.jpg', 't01404c758f30a21a82.jpg', '', 'image/jpeg', '265064', '1496230469');
INSERT INTO `tp_file` VALUES ('49', '3', '/tmp/uploads/20170531\\ccb38c4e6047b5953eb48649ef00b959.jpg', 't0117665c8b1de8efde.jpg', '', 'image/jpeg', '332340', '1496230472');
INSERT INTO `tp_file` VALUES ('50', '3', '/tmp/uploads/20170531\\e1f6c60432ce44b3f81d0ea815da8b8a.jpg', 't01b6684fcd5fce99f6.jpg', '', 'image/jpeg', '219804', '1496230534');
INSERT INTO `tp_file` VALUES ('51', '3', '/tmp/uploads/20170531\\febd856e7e4d542721c63d9b71b4d6cb.jpg', 't01b6684fcd5fce99f6.jpg', '', 'image/jpeg', '219804', '1496230853');
INSERT INTO `tp_file` VALUES ('52', '3', '/tmp/uploads/20170531\\483a2526002158e98ae39a2b7f1ffc94.jpg', 't01b6684fcd5fce99f6.jpg', '', 'image/jpeg', '219804', '1496231018');
INSERT INTO `tp_file` VALUES ('53', '3', '/tmp/uploads/20170531\\4b140fd08d860eeeecbc2aefb33ddca8.jpg', 't0130731798c9559831.jpg', '', 'image/jpeg', '376372', '1496231121');
INSERT INTO `tp_file` VALUES ('54', '3', '/tmp/uploads/20170531\\071bdf951e93488ab463a41cf1270f71.jpg', 't01be714deb07da6d5b.jpg', '', 'image/jpeg', '107983', '1496238925');
INSERT INTO `tp_file` VALUES ('55', '3', '/tmp/uploads/20170531\\71e67e4d6d206c984ee4c6657a9f839e.jpg', 't018bd1675c4a3370a2.jpg', '', 'image/jpeg', '864050', '1496238972');
INSERT INTO `tp_file` VALUES ('56', '3', '/tmp/uploads/20170531\\5d5b8b9af8461cbb70da2ba42a387bb7.jpg', 't018bd1675c4a3370a2.jpg', '', 'image/jpeg', '864050', '1496239221');
INSERT INTO `tp_file` VALUES ('57', '3', '/tmp/uploads/20170531\\78d58e30aaf83e68cfcfb250500922ab.jpg', 't018bd1675c4a3370a2.jpg', '', 'image/jpeg', '864050', '1496239735');
INSERT INTO `tp_file` VALUES ('58', '3', '/tmp/uploads/20170601\\3f61f279222100356982fbb603805901.jpg', 't018bd1675c4a3370a2.jpg', '', 'image/jpeg', '864050', '1496247635');
INSERT INTO `tp_file` VALUES ('59', '3', '/tmp/uploads/20170601\\97f87e0a532f8d530641a2dead66404b.jpg', 't018bd1675c4a3370a2.jpg', '', 'image/jpeg', '864050', '1496247846');
INSERT INTO `tp_file` VALUES ('60', '3', '/tmp/uploads/20170601\\6ca2105b493dff28cac2141fc4a2a1cc.jpg', 't018bd1675c4a3370a2.jpg', '', 'image/jpeg', '864050', '1496248099');
INSERT INTO `tp_file` VALUES ('61', '3', '/tmp/uploads/20170601\\2529e5020161b8d75a47f795657efb73.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496289946');
INSERT INTO `tp_file` VALUES ('62', '3', '/tmp/uploads/20170601\\6080adcb66c73df12947b1d73afc62e3.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496312002');
INSERT INTO `tp_file` VALUES ('63', '3', '/tmp/uploads/20170601\\4422b80b5f0a3dca34404900305d2973.jpg', '1496310994(1).jpg', '', 'image/jpeg', '3619', '1496312011');
INSERT INTO `tp_file` VALUES ('64', '3', '/tmp/uploads/20170601\\a22e2aa26d4f444d5b3b9d60b5a51944.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496312280');
INSERT INTO `tp_file` VALUES ('65', '3', '/tmp/uploads/20170608\\eb395209e04ff86af0d2a70bd14bd5b5.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496884954');
INSERT INTO `tp_file` VALUES ('66', '3', '/tmp/uploads/20170608\\b4d9b76234ec0c035f7a4bc74b64b3ed.jpg', '1496310994(1).jpg', '', 'image/jpeg', '3619', '1496884960');
INSERT INTO `tp_file` VALUES ('67', '3', '/tmp/uploads/20170608\\046e6c67128f3e2559f078e874bf7402.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496915777');
INSERT INTO `tp_file` VALUES ('68', '3', '/tmp/uploads/20170608\\98608df561ca1976e824d12b302272ba.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496924829');
INSERT INTO `tp_file` VALUES ('69', '3', '/tmp/uploads/20170608\\24c3cc15530513aa4c265ef39e7e207f.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496924926');
INSERT INTO `tp_file` VALUES ('70', '3', '/tmp/uploads/20170608\\68bd8e24ba1999db6f997b4bc50653e0.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496935660');
INSERT INTO `tp_file` VALUES ('71', '3', '/tmp/uploads/20170608\\0dcb5ea28a31f98a17cce0eae4f78808.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496935782');
INSERT INTO `tp_file` VALUES ('72', '3', '/tmp/uploads/20170608\\9fd70b66c7c2d650c6c6187d906f7317.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496936108');
INSERT INTO `tp_file` VALUES ('73', '3', '/tmp/uploads/20170608\\16c9bce65177e31e013caf7c6f152481.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496936817');
INSERT INTO `tp_file` VALUES ('74', '3', '/tmp/uploads/20170608\\831551e9807550bd4231e769b8ab15c2.jpg', '1496310994(1).jpg', '', 'image/jpeg', '3619', '1496936827');
INSERT INTO `tp_file` VALUES ('75', '3', '/tmp/uploads/20170608\\41d44aa5e523d03b7ca9bfecaa277553.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496937518');
INSERT INTO `tp_file` VALUES ('76', '3', '/tmp/uploads/20170608\\b2ee58b866dc0c03188435c0894357dc.jpg', '1496310994(1).jpg', '', 'image/jpeg', '3619', '1496937556');
INSERT INTO `tp_file` VALUES ('77', '3', '/tmp/uploads/20170609\\d3248704c8b3509dc5548f107456c58f.jpg', 'timg.jpg', '', 'image/jpeg', '21376', '1496937656');
INSERT INTO `tp_file` VALUES ('78', '3', '/tmp/uploads/20170609\\c399ce6ecf5f7476287ffb2bab2aa0d7.jpg', '1496310994(1).jpg', '', 'image/jpeg', '3619', '1496937696');
INSERT INTO `tp_file` VALUES ('79', '3', '/tmp/uploads/20170609\\5e941ac926c45b260bb1a877eaaedd54.jpg', 'Chrysanthemum.jpg', '', 'image/jpeg', '219990', '1496976359');

-- ----------------------------
-- Table structure for `tp_gift`
-- ----------------------------
DROP TABLE IF EXISTS `tp_gift`;
CREATE TABLE `tp_gift` (
  `gift_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '礼物id',
  `title` char(255) DEFAULT NULL COMMENT '标题',
  `type` enum('supply','normal') NOT NULL COMMENT 'supply:补发#normal:正常',
  `img_ids` char(255) DEFAULT NULL COMMENT '礼物图片id逗号隔开',
  `details` text COMMENT '描述',
  `term_id` int(11) DEFAULT NULL,
  `send_to` enum('other','student','guide_senior','instructor','comment_senior') DEFAULT NULL COMMENT 'student:学员#guide_senior:指导学长 ''other'','''','''',''instructor'',''comment_senior''',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_gift
-- ----------------------------
INSERT INTO `tp_gift` VALUES ('1', '标题', 'supply', null, '描述', '1', '');
INSERT INTO `tp_gift` VALUES ('2', '11', 'supply', null, '描述', '1', '');
INSERT INTO `tp_gift` VALUES ('3', '11', 'supply', null, '描述', '1', '');
INSERT INTO `tp_gift` VALUES ('4', '11', 'supply', '71', '描述', '1', '');
INSERT INTO `tp_gift` VALUES ('5', '11', 'supply', '72', '描述', '1', '');
INSERT INTO `tp_gift` VALUES ('6', '11', 'supply', '72', '描述', '1', '');
INSERT INTO `tp_gift` VALUES ('7', '11', 'supply', '73,74', '描述', '1', '');
INSERT INTO `tp_gift` VALUES ('8', '标题', 'normal', '77,79', '描述', '3', 'student');

-- ----------------------------
-- Table structure for `tp_job_children`
-- ----------------------------
DROP TABLE IF EXISTS `tp_job_children`;
CREATE TABLE `tp_job_children` (
  `job_children_id` int(11) NOT NULL,
  `job_id` int(11) DEFAULT NULL,
  `status` enum('running','notstart','finished') DEFAULT NULL,
  `args` text,
  PRIMARY KEY (`job_children_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_job_children
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `tp_login_log`;
CREATE TABLE `tp_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `login_ip` char(15) NOT NULL DEFAULT '',
  `login_location` varchar(255) NOT NULL DEFAULT '',
  `login_browser` varchar(255) NOT NULL DEFAULT '',
  `login_os` varchar(255) NOT NULL DEFAULT '',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_login_log
-- ----------------------------
INSERT INTO `tp_login_log` VALUES ('1', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(52.0.2743.116)', 'Windows 7', '2017-05-11 14:36:10');
INSERT INTO `tp_login_log` VALUES ('2', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(52.0.2743.116)', 'Windows 7', '2017-05-11 15:19:07');
INSERT INTO `tp_login_log` VALUES ('3', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-20 14:47:56');
INSERT INTO `tp_login_log` VALUES ('4', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-05-20 15:01:12');
INSERT INTO `tp_login_log` VALUES ('5', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-20 15:42:14');
INSERT INTO `tp_login_log` VALUES ('6', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-05-22 09:52:11');
INSERT INTO `tp_login_log` VALUES ('7', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-05-24 11:59:03');
INSERT INTO `tp_login_log` VALUES ('8', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-05-24 15:29:17');
INSERT INTO `tp_login_log` VALUES ('9', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-24 17:58:52');
INSERT INTO `tp_login_log` VALUES ('10', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-24 18:05:24');
INSERT INTO `tp_login_log` VALUES ('11', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-24 23:07:26');
INSERT INTO `tp_login_log` VALUES ('12', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-24 23:08:40');
INSERT INTO `tp_login_log` VALUES ('13', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-05-25 16:03:53');
INSERT INTO `tp_login_log` VALUES ('14', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-26 09:03:47');
INSERT INTO `tp_login_log` VALUES ('15', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-05-26 09:34:12');
INSERT INTO `tp_login_log` VALUES ('16', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-26 17:08:27');
INSERT INTO `tp_login_log` VALUES ('17', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(45.0.2454.101)', 'Windows 7', '2017-05-26 17:24:00');
INSERT INTO `tp_login_log` VALUES ('18', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-27 09:27:34');
INSERT INTO `tp_login_log` VALUES ('19', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-27 17:36:03');
INSERT INTO `tp_login_log` VALUES ('20', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(45.0.2454.101)', 'Windows 7', '2017-05-27 18:30:55');
INSERT INTO `tp_login_log` VALUES ('21', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-05-31 13:43:34');
INSERT INTO `tp_login_log` VALUES ('22', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-01 12:05:19');
INSERT INTO `tp_login_log` VALUES ('23', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-02 09:01:03');
INSERT INTO `tp_login_log` VALUES ('24', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-02 22:02:40');
INSERT INTO `tp_login_log` VALUES ('25', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-02 22:23:31');
INSERT INTO `tp_login_log` VALUES ('26', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-03 09:11:53');
INSERT INTO `tp_login_log` VALUES ('27', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(49.0.2623.221)', 'Windows 10', '2017-06-03 10:39:52');
INSERT INTO `tp_login_log` VALUES ('28', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(49.0.2623.221)', 'Windows 10', '2017-06-03 10:45:27');
INSERT INTO `tp_login_log` VALUES ('29', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-03 10:58:10');
INSERT INTO `tp_login_log` VALUES ('30', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(49.0.2623.221)', 'Windows 10', '2017-06-03 11:16:04');
INSERT INTO `tp_login_log` VALUES ('31', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-03 15:06:12');
INSERT INTO `tp_login_log` VALUES ('32', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-05 09:57:52');
INSERT INTO `tp_login_log` VALUES ('33', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-05 11:14:39');
INSERT INTO `tp_login_log` VALUES ('34', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-05 14:30:38');
INSERT INTO `tp_login_log` VALUES ('35', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-06 14:52:35');
INSERT INTO `tp_login_log` VALUES ('36', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-07 10:31:27');
INSERT INTO `tp_login_log` VALUES ('37', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-08 09:13:05');
INSERT INTO `tp_login_log` VALUES ('38', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-08 11:25:29');
INSERT INTO `tp_login_log` VALUES ('39', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-08 11:32:24');
INSERT INTO `tp_login_log` VALUES ('40', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-08 21:30:49');
INSERT INTO `tp_login_log` VALUES ('41', '1', '127.0.0.1', '本机地址 本机地址  ', 'Firefox(53.0)', 'Windows 7', '2017-06-08 21:42:02');
INSERT INTO `tp_login_log` VALUES ('42', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-08 21:43:10');
INSERT INTO `tp_login_log` VALUES ('43', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-08 21:44:51');
INSERT INTO `tp_login_log` VALUES ('44', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-09 09:35:55');
INSERT INTO `tp_login_log` VALUES ('45', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-09 09:37:46');
INSERT INTO `tp_login_log` VALUES ('46', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(57.0.2987.133)', 'Windows 98', '2017-06-10 11:39:14');
INSERT INTO `tp_login_log` VALUES ('47', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-10 15:04:17');
INSERT INTO `tp_login_log` VALUES ('48', '1', '127.0.0.1', '本机地址 本机地址  ', 'Chrome(58.0.3029.110)', 'Windows 7', '2017-06-10 15:39:07');

-- ----------------------------
-- Table structure for `tp_lunar_day`
-- ----------------------------
DROP TABLE IF EXISTS `tp_lunar_day`;
CREATE TABLE `tp_lunar_day` (
  `date` date DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `month` char(255) DEFAULT NULL,
  `day` char(255) DEFAULT NULL,
  `lunar` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_lunar_day
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_lunar_year`
-- ----------------------------
DROP TABLE IF EXISTS `tp_lunar_year`;
CREATE TABLE `tp_lunar_year` (
  `year` year(4) DEFAULT NULL,
  `year_zodiac` char(255) DEFAULT NULL COMMENT '生肖',
  `lunar_year_name` char(255) DEFAULT NULL COMMENT '干支纪年',
  `is_leap_year` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_lunar_year
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_node_map`
-- ----------------------------
DROP TABLE IF EXISTS `tp_node_map`;
CREATE TABLE `tp_node_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '节点图描述',
  PRIMARY KEY (`id`),
  KEY `map` (`method`,`module`,`controller`,`action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点图';

-- ----------------------------
-- Records of tp_node_map
-- ----------------------------
INSERT INTO `tp_node_map` VALUES ('1', 'admin', 'AdminGroup', 'index', 'ALL', 'AdminGroup 首页');
INSERT INTO `tp_node_map` VALUES ('2', 'admin', 'AdminGroup', 'recycleBin', 'ALL', 'AdminGroup 回收站');
INSERT INTO `tp_node_map` VALUES ('3', 'admin', 'AdminGroup', 'add', 'ALL', 'AdminGroup 添加');
INSERT INTO `tp_node_map` VALUES ('4', 'admin', 'AdminGroup', 'edit', 'ALL', 'AdminGroup 编辑');
INSERT INTO `tp_node_map` VALUES ('5', 'admin', 'AdminGroup', 'delete', 'ALL', 'AdminGroup 默认删除操作');
INSERT INTO `tp_node_map` VALUES ('6', 'admin', 'AdminGroup', 'recycle', 'ALL', 'AdminGroup 从回收站恢复');
INSERT INTO `tp_node_map` VALUES ('7', 'admin', 'AdminGroup', 'forbid', 'ALL', 'AdminGroup 默认禁用操作');
INSERT INTO `tp_node_map` VALUES ('8', 'admin', 'AdminGroup', 'resume', 'ALL', 'AdminGroup 默认恢复操作');
INSERT INTO `tp_node_map` VALUES ('9', 'admin', 'AdminGroup', 'deleteForever', 'ALL', 'AdminGroup 永久删除');
INSERT INTO `tp_node_map` VALUES ('10', 'admin', 'AdminGroup', 'clear', 'ALL', 'AdminGroup 清空回收站');
INSERT INTO `tp_node_map` VALUES ('11', 'admin', 'AdminGroup', 'saveOrder', 'ALL', 'AdminGroup 保存排序');
INSERT INTO `tp_node_map` VALUES ('16', 'admin', 'AdminNode', 'index', 'ALL', 'AdminNode 首页');
INSERT INTO `tp_node_map` VALUES ('17', 'admin', 'AdminNode', 'recycleBin', 'ALL', 'AdminNode 回收站');
INSERT INTO `tp_node_map` VALUES ('18', 'admin', 'AdminNode', 'sort', 'ALL', 'AdminNode 保存排序');
INSERT INTO `tp_node_map` VALUES ('19', 'admin', 'AdminNode', 'load', 'ALL', 'AdminNode 节点快速导入');
INSERT INTO `tp_node_map` VALUES ('20', 'admin', 'AdminNode', 'indexOld', 'ALL', 'AdminNode 首页');
INSERT INTO `tp_node_map` VALUES ('21', 'admin', 'AdminNode', 'add', 'ALL', 'AdminNode 添加');
INSERT INTO `tp_node_map` VALUES ('22', 'admin', 'AdminNode', 'edit', 'ALL', 'AdminNode 编辑');
INSERT INTO `tp_node_map` VALUES ('23', 'admin', 'AdminNode', 'delete', 'ALL', 'AdminNode 默认删除操作');
INSERT INTO `tp_node_map` VALUES ('24', 'admin', 'AdminNode', 'recycle', 'ALL', 'AdminNode 从回收站恢复');
INSERT INTO `tp_node_map` VALUES ('25', 'admin', 'AdminNode', 'forbid', 'ALL', 'AdminNode 默认禁用操作');
INSERT INTO `tp_node_map` VALUES ('26', 'admin', 'AdminNode', 'resume', 'ALL', 'AdminNode 默认恢复操作');
INSERT INTO `tp_node_map` VALUES ('27', 'admin', 'AdminNode', 'deleteForever', 'ALL', 'AdminNode 永久删除');
INSERT INTO `tp_node_map` VALUES ('28', 'admin', 'AdminNode', 'clear', 'ALL', 'AdminNode 清空回收站');
INSERT INTO `tp_node_map` VALUES ('29', 'admin', 'AdminNode', 'saveOrder', 'ALL', 'AdminNode 保存排序');
INSERT INTO `tp_node_map` VALUES ('31', 'admin', 'AdminNodeLoad', 'index', 'ALL', 'AdminNodeLoad 首页');
INSERT INTO `tp_node_map` VALUES ('32', 'admin', 'AdminNodeLoad', 'recycleBin', 'ALL', 'AdminNodeLoad 回收站');
INSERT INTO `tp_node_map` VALUES ('33', 'admin', 'AdminNodeLoad', 'add', 'ALL', 'AdminNodeLoad 添加');
INSERT INTO `tp_node_map` VALUES ('34', 'admin', 'AdminNodeLoad', 'edit', 'ALL', 'AdminNodeLoad 编辑');
INSERT INTO `tp_node_map` VALUES ('35', 'admin', 'AdminNodeLoad', 'forbid', 'ALL', 'AdminNodeLoad 默认禁用操作');
INSERT INTO `tp_node_map` VALUES ('36', 'admin', 'AdminNodeLoad', 'resume', 'ALL', 'AdminNodeLoad 默认恢复操作');
INSERT INTO `tp_node_map` VALUES ('37', 'admin', 'AdminNodeLoad', 'deleteForever', 'ALL', 'AdminNodeLoad 永久删除');
INSERT INTO `tp_node_map` VALUES ('38', 'admin', 'AdminNodeLoad', 'clear', 'ALL', 'AdminNodeLoad 清空回收站');
INSERT INTO `tp_node_map` VALUES ('39', 'admin', 'AdminNodeLoad', 'saveOrder', 'ALL', 'AdminNodeLoad 保存排序');
INSERT INTO `tp_node_map` VALUES ('46', 'admin', 'AdminRole', 'user', 'ALL', 'AdminRole 用户列表');
INSERT INTO `tp_node_map` VALUES ('47', 'admin', 'AdminRole', 'access', 'ALL', 'AdminRole 授权');
INSERT INTO `tp_node_map` VALUES ('48', 'admin', 'AdminRole', 'index', 'ALL', 'AdminRole 首页');
INSERT INTO `tp_node_map` VALUES ('49', 'admin', 'AdminRole', 'recycleBin', 'ALL', 'AdminRole 回收站');
INSERT INTO `tp_node_map` VALUES ('50', 'admin', 'AdminRole', 'add', 'ALL', 'AdminRole 添加');
INSERT INTO `tp_node_map` VALUES ('51', 'admin', 'AdminRole', 'edit', 'ALL', 'AdminRole 编辑');
INSERT INTO `tp_node_map` VALUES ('52', 'admin', 'AdminRole', 'delete', 'ALL', 'AdminRole 默认删除操作');
INSERT INTO `tp_node_map` VALUES ('53', 'admin', 'AdminRole', 'recycle', 'ALL', 'AdminRole 从回收站恢复');
INSERT INTO `tp_node_map` VALUES ('54', 'admin', 'AdminRole', 'forbid', 'ALL', 'AdminRole 默认禁用操作');
INSERT INTO `tp_node_map` VALUES ('55', 'admin', 'AdminRole', 'resume', 'ALL', 'AdminRole 默认恢复操作');
INSERT INTO `tp_node_map` VALUES ('56', 'admin', 'AdminRole', 'deleteForever', 'ALL', 'AdminRole 永久删除');
INSERT INTO `tp_node_map` VALUES ('57', 'admin', 'AdminRole', 'clear', 'ALL', 'AdminRole 清空回收站');
INSERT INTO `tp_node_map` VALUES ('58', 'admin', 'AdminRole', 'saveOrder', 'ALL', 'AdminRole 保存排序');
INSERT INTO `tp_node_map` VALUES ('61', 'admin', 'AdminUser', 'password', 'ALL', 'AdminUser 修改密码');
INSERT INTO `tp_node_map` VALUES ('62', 'admin', 'AdminUser', 'index', 'ALL', 'AdminUser 首页');
INSERT INTO `tp_node_map` VALUES ('63', 'admin', 'AdminUser', 'recycleBin', 'ALL', 'AdminUser 回收站');
INSERT INTO `tp_node_map` VALUES ('64', 'admin', 'AdminUser', 'add', 'ALL', 'AdminUser 添加');
INSERT INTO `tp_node_map` VALUES ('65', 'admin', 'AdminUser', 'edit', 'ALL', 'AdminUser 编辑');
INSERT INTO `tp_node_map` VALUES ('66', 'admin', 'AdminUser', 'delete', 'ALL', 'AdminUser 默认删除操作');
INSERT INTO `tp_node_map` VALUES ('67', 'admin', 'AdminUser', 'recycle', 'ALL', 'AdminUser 从回收站恢复');
INSERT INTO `tp_node_map` VALUES ('68', 'admin', 'AdminUser', 'forbid', 'ALL', 'AdminUser 默认禁用操作');
INSERT INTO `tp_node_map` VALUES ('69', 'admin', 'AdminUser', 'resume', 'ALL', 'AdminUser 默认恢复操作');
INSERT INTO `tp_node_map` VALUES ('70', 'admin', 'AdminUser', 'deleteForever', 'ALL', 'AdminUser 永久删除');
INSERT INTO `tp_node_map` VALUES ('71', 'admin', 'AdminUser', 'clear', 'ALL', 'AdminUser 清空回收站');
INSERT INTO `tp_node_map` VALUES ('72', 'admin', 'AdminUser', 'saveOrder', 'ALL', 'AdminUser 保存排序');
INSERT INTO `tp_node_map` VALUES ('76', 'admin', 'Demo', 'excel', 'ALL', 'Demo Excel一键导出');
INSERT INTO `tp_node_map` VALUES ('77', 'admin', 'Demo', 'download', 'ALL', 'Demo 下载文件');
INSERT INTO `tp_node_map` VALUES ('78', 'admin', 'Demo', 'downloadImage', 'ALL', 'Demo 下载远程图片');
INSERT INTO `tp_node_map` VALUES ('79', 'admin', 'Demo', 'mail', 'ALL', 'Demo 发送邮件');
INSERT INTO `tp_node_map` VALUES ('80', 'admin', 'Demo', 'ueditor', 'ALL', 'Demo 百度编辑器');
INSERT INTO `tp_node_map` VALUES ('81', 'admin', 'Demo', 'qiniu', 'ALL', 'Demo 七牛上传');
INSERT INTO `tp_node_map` VALUES ('82', 'admin', 'Demo', 'hashids', 'ALL', 'Demo ID加密');
INSERT INTO `tp_node_map` VALUES ('83', 'admin', 'Demo', 'layer', 'ALL', 'Demo 丰富弹层');
INSERT INTO `tp_node_map` VALUES ('84', 'admin', 'Demo', 'tableFixed', 'ALL', 'Demo 表格溢出');
INSERT INTO `tp_node_map` VALUES ('85', 'admin', 'Demo', 'imageUpload', 'ALL', 'Demo 图片上传回调');
INSERT INTO `tp_node_map` VALUES ('86', 'admin', 'Demo', 'qrcode', 'ALL', 'Demo 二维码生成');
INSERT INTO `tp_node_map` VALUES ('91', 'admin', 'Index', 'index', 'ALL', 'Index ');
INSERT INTO `tp_node_map` VALUES ('92', 'admin', 'Index', 'welcome', 'ALL', 'Index 欢迎页');
INSERT INTO `tp_node_map` VALUES ('94', 'admin', 'LoginLog', 'index', 'ALL', 'LoginLog 首页');
INSERT INTO `tp_node_map` VALUES ('95', 'admin', 'LoginLog', 'saveOrder', 'ALL', 'LoginLog 保存排序');
INSERT INTO `tp_node_map` VALUES ('97', 'admin', 'NodeMap', 'load', 'ALL', 'NodeMap 自动导入');
INSERT INTO `tp_node_map` VALUES ('98', 'admin', 'NodeMap', 'index', 'ALL', 'NodeMap 首页');
INSERT INTO `tp_node_map` VALUES ('99', 'admin', 'NodeMap', 'recycleBin', 'ALL', 'NodeMap 回收站');
INSERT INTO `tp_node_map` VALUES ('100', 'admin', 'NodeMap', 'add', 'ALL', 'NodeMap 添加');
INSERT INTO `tp_node_map` VALUES ('101', 'admin', 'NodeMap', 'edit', 'ALL', 'NodeMap 编辑');
INSERT INTO `tp_node_map` VALUES ('102', 'admin', 'NodeMap', 'deleteForever', 'ALL', 'NodeMap 永久删除');
INSERT INTO `tp_node_map` VALUES ('103', 'admin', 'NodeMap', 'saveOrder', 'ALL', 'NodeMap 保存排序');
INSERT INTO `tp_node_map` VALUES ('104', 'admin', 'Pub', 'login', 'ALL', 'Pub 用户登录页面');
INSERT INTO `tp_node_map` VALUES ('105', 'admin', 'Pub', 'loginFrame', 'ALL', 'Pub 小窗口登录页面');
INSERT INTO `tp_node_map` VALUES ('106', 'admin', 'Pub', 'index', 'ALL', 'Pub 首页');
INSERT INTO `tp_node_map` VALUES ('107', 'admin', 'Pub', 'logout', 'ALL', 'Pub 用户登出');
INSERT INTO `tp_node_map` VALUES ('108', 'admin', 'Pub', 'checkLogin', 'ALL', 'Pub 登录检测');
INSERT INTO `tp_node_map` VALUES ('109', 'admin', 'Pub', 'password', 'ALL', 'Pub 修改密码');
INSERT INTO `tp_node_map` VALUES ('110', 'admin', 'Pub', 'profile', 'ALL', 'Pub 查看用户信息|修改资料');
INSERT INTO `tp_node_map` VALUES ('111', 'admin', 'Upload', 'index', 'ALL', 'Upload 首页');
INSERT INTO `tp_node_map` VALUES ('112', 'admin', 'Upload', 'upload', 'ALL', 'Upload 文件上传');
INSERT INTO `tp_node_map` VALUES ('113', 'admin', 'Upload', 'remote', 'ALL', 'Upload 远程图片抓取');
INSERT INTO `tp_node_map` VALUES ('114', 'admin', 'Upload', 'listImage', 'ALL', 'Upload 图片列表');
INSERT INTO `tp_node_map` VALUES ('118', 'admin', 'WebLog', 'index', 'ALL', 'WebLog 列表');
INSERT INTO `tp_node_map` VALUES ('119', 'admin', 'WebLog', 'detail', 'ALL', 'WebLog 详情');
INSERT INTO `tp_node_map` VALUES ('121', 'admin', 'one.two.three.Four', 'index', 'ALL', 'Four 首页');
INSERT INTO `tp_node_map` VALUES ('122', 'admin', 'one.two.three.Four', 'recycleBin', 'ALL', 'Four 回收站');
INSERT INTO `tp_node_map` VALUES ('123', 'admin', 'one.two.three.Four', 'add', 'ALL', 'Four 添加');
INSERT INTO `tp_node_map` VALUES ('124', 'admin', 'one.two.three.Four', 'edit', 'ALL', 'Four 编辑');
INSERT INTO `tp_node_map` VALUES ('125', 'admin', 'one.two.three.Four', 'delete', 'ALL', 'Four 默认删除操作');
INSERT INTO `tp_node_map` VALUES ('126', 'admin', 'one.two.three.Four', 'recycle', 'ALL', 'Four 从回收站恢复');
INSERT INTO `tp_node_map` VALUES ('127', 'admin', 'one.two.three.Four', 'forbid', 'ALL', 'Four 默认禁用操作');
INSERT INTO `tp_node_map` VALUES ('128', 'admin', 'one.two.three.Four', 'resume', 'ALL', 'Four 默认恢复操作');
INSERT INTO `tp_node_map` VALUES ('129', 'admin', 'one.two.three.Four', 'deleteForever', 'ALL', 'Four 永久删除');
INSERT INTO `tp_node_map` VALUES ('130', 'admin', 'one.two.three.Four', 'clear', 'ALL', 'Four 清空回收站');
INSERT INTO `tp_node_map` VALUES ('131', 'admin', 'one.two.three.Four', 'saveOrder', 'ALL', 'Four 保存排序');

-- ----------------------------
-- Table structure for `tp_notice`
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice`;
CREATE TABLE `tp_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知',
  `title` char(255) DEFAULT NULL COMMENT '标题',
  `type` enum('gift','common','instructor','share','important','course') DEFAULT 'common' COMMENT 'common:普通  gift礼物 course上课 instructor教练私信 share资源分享 important重要',
  `popup_type` enum('address','gift','course','common','yesno','confirm','no') DEFAULT 'common' COMMENT '弹窗类型：no,confirm确认，yesno是否,common普通，course上课，gift礼物，address地址',
  `ispopup` tinyint(4) DEFAULT '0' COMMENT '是否弹窗 1弹窗 2不弹窗',
  `content` text COMMENT '内容',
  `send_status` tinyint(4) DEFAULT '0' COMMENT '通知状态     1，已通知，0未通知',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_notice
-- ----------------------------
INSERT INTO `tp_notice` VALUES ('7', '', 'common', 'common', '0', '', '0');
INSERT INTO `tp_notice` VALUES ('8', '', 'common', 'common', '0', '', '0');
INSERT INTO `tp_notice` VALUES ('9', '通知标题', 'gift', 'common', '1', '通知内容', '0');

-- ----------------------------
-- Table structure for `tp_notice_member`
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_member`;
CREATE TABLE `tp_notice_member` (
  `notice_id` int(11) NOT NULL,
  `member_type` enum('regimental','comment_senior','student','guide_senior','instructor','user') NOT NULL DEFAULT 'user' COMMENT 'regimental 团长 comment_senior 点评学长 student 学员 guide_senior 指导学长 instructor 辅导员 user用户',
  `user_id` int(11) NOT NULL COMMENT '通知成员id',
  `send_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1已发送，0未发送',
  PRIMARY KEY (`notice_id`,`member_type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知成员notice_member';

-- ----------------------------
-- Records of tp_notice_member
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_notice_senior`
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_senior`;
CREATE TABLE `tp_notice_senior` (
  `notice_id` int(11) NOT NULL DEFAULT '0',
  `senior_id` int(11) NOT NULL DEFAULT '0',
  `senior_type` enum('guit','comment') NOT NULL DEFAULT 'comment',
  `send_status` tinyint(4) DEFAULT '0' COMMENT '1已发送，0未发送',
  PRIMARY KEY (`notice_id`,`senior_id`,`senior_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='notice_senior 学长通知：需要通知的学长';

-- ----------------------------
-- Records of tp_notice_senior
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_notice_student`
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_student`;
CREATE TABLE `tp_notice_student` (
  `notice_id` int(11) NOT NULL DEFAULT '0' COMMENT '通知id',
  `student_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '学员的会员id',
  `send_status` tinyint(4) DEFAULT '0' COMMENT '1已发送，0未发送',
  PRIMARY KEY (`notice_id`,`student_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='notice_student 学员通知：记录需要通知的学员';

-- ----------------------------
-- Records of tp_notice_student
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_notice_team`
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_team`;
CREATE TABLE `tp_notice_team` (
  `notice_id` int(11) NOT NULL DEFAULT '0' COMMENT '通知id',
  `team_id` int(11) NOT NULL DEFAULT '0' COMMENT '团id',
  `send_status` tinyint(4) DEFAULT '0' COMMENT '1已发送，0未发送',
  PRIMARY KEY (`notice_id`,`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='notice_team 团通知：记录要通知到的团';

-- ----------------------------
-- Records of tp_notice_team
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_notice_term`
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_term`;
CREATE TABLE `tp_notice_term` (
  `notice_id` int(11) NOT NULL COMMENT '通知id',
  `term_id` int(11) NOT NULL COMMENT '期id',
  `send_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已发送 1已发送，0未发送',
  PRIMARY KEY (`notice_id`,`term_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='期通知：记录需要通知的期';

-- ----------------------------
-- Records of tp_notice_term
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_notice_user`
-- ----------------------------
DROP TABLE IF EXISTS `tp_notice_user`;
CREATE TABLE `tp_notice_user` (
  `notice_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `send_status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`notice_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='notice_user 会员的通知：记录需要通知的会员';

-- ----------------------------
-- Records of tp_notice_user
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_one_two_three_four`
-- ----------------------------
DROP TABLE IF EXISTS `tp_one_two_three_four`;
CREATE TABLE `tp_one_two_three_four` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '四级控制器主键',
  `field1` varchar(255) DEFAULT NULL COMMENT '字段一',
  `option` varchar(255) DEFAULT NULL COMMENT '选填',
  `select` varchar(255) DEFAULT NULL COMMENT '下拉框',
  `radio` varchar(255) DEFAULT NULL COMMENT '单选',
  `checkbox` varchar(255) DEFAULT NULL COMMENT '复选框',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `textarea` varchar(255) DEFAULT NULL COMMENT '文本域',
  `date` varchar(255) DEFAULT NULL COMMENT '日期',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `sort` smallint(5) DEFAULT '50' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常 | 0-禁用',
  `isdelete` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除状态，1-删除 | 0-正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='四级控制器';

-- ----------------------------
-- Records of tp_one_two_three_four
-- ----------------------------
INSERT INTO `tp_one_two_three_four` VALUES ('1', 'yuan1994', 'tpadmin', '2', '1', null, '2222', 'https://github.com/yuan1994/tpadmin', '2016-12-07', '13012345678', 'tianpian0805@gmail.com', '50', '1', '0', '1481947278', '1481947353');

-- ----------------------------
-- Table structure for `tp_senior`
-- ----------------------------
DROP TABLE IF EXISTS `tp_senior`;
CREATE TABLE `tp_senior` (
  `senior_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '状态:1启用，0禁用',
  `guide_num` int(11) DEFAULT '0' COMMENT '实质指导人数',
  `want_guide_num` int(11) DEFAULT '0' COMMENT '希望指导人数',
  `want_comment_num` int(11) DEFAULT '0' COMMENT '希望点评人数',
  `comment_num` int(11) DEFAULT '0' COMMENT '实质点评人数',
  `is_guide_senior` tinyint(4) DEFAULT NULL COMMENT '是否是指导学长,1是，0，不是',
  `is_comment_senior` tinyint(4) DEFAULT NULL COMMENT '是否是点评学长1是，0不是',
  PRIMARY KEY (`senior_id`),
  UNIQUE KEY `senior_id` (`senior_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_senior
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_statistics_job`
-- ----------------------------
DROP TABLE IF EXISTS `tp_statistics_job`;
CREATE TABLE `tp_statistics_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('student_statistics') NOT NULL,
  `status` enum('running','notstart','finished') DEFAULT NULL,
  `args` text,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_statistics_job
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_student`
-- ----------------------------
DROP TABLE IF EXISTS `tp_student`;
CREATE TABLE `tp_student` (
  `user_id` int(11) NOT NULL COMMENT '会员id',
  `student_no` char(255) DEFAULT NULL,
  `term_id` int(11) DEFAULT NULL COMMENT '学期id',
  `team_id` int(11) DEFAULT NULL COMMENT '团id',
  `status` tinyint(4) DEFAULT NULL COMMENT '启用1，禁用0',
  `isdelete` tinyint(4) DEFAULT NULL COMMENT '1:软删除',
  `summary_num` int(11) DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `student_no` (`student_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学员';

-- ----------------------------
-- Records of tp_student
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_student_no`
-- ----------------------------
DROP TABLE IF EXISTS `tp_student_no`;
CREATE TABLE `tp_student_no` (
  `student_no_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `term_id` int(11) NOT NULL COMMENT '所在学期',
  `team_id` int(11) NOT NULL COMMENT '所在团',
  `student_no` int(10) NOT NULL COMMENT '学号',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '绑定用户',
  PRIMARY KEY (`student_no_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学号';

-- ----------------------------
-- Records of tp_student_no
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_student_senior`
-- ----------------------------
DROP TABLE IF EXISTS `tp_student_senior`;
CREATE TABLE `tp_student_senior` (
  `student_user_id` int(11) NOT NULL,
  `senior_user_id` int(11) NOT NULL,
  `type` enum('comment','guide') NOT NULL DEFAULT 'guide' COMMENT '类型：guide和comment',
  PRIMARY KEY (`student_user_id`,`senior_user_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_student_senior
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_student_statistics`
-- ----------------------------
DROP TABLE IF EXISTS `tp_student_statistics`;
CREATE TABLE `tp_student_statistics` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '学员用户id',
  `date` int(11) NOT NULL DEFAULT '0' COMMENT '要统计的日期',
  `last_date` int(11) DEFAULT NULL COMMENT '最后总结日期',
  `join_days` int(11) DEFAULT '0' COMMENT '加入多少天',
  `summary_days` int(11) DEFAULT '0' COMMENT '累计总结天数',
  `not_summary_days` int(11) DEFAULT '0' COMMENT '累计断总结天数',
  `last_course_id` int(11) DEFAULT NULL COMMENT '最后一次课程',
  `today_issummary` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_student_statistics
-- ----------------------------
INSERT INTO `tp_student_statistics` VALUES ('1', '20170701', '20170603', '30', '0', '1', null, '0');
INSERT INTO `tp_student_statistics` VALUES ('1', '20170702', '20170603', '31', '0', '2', null, '0');

-- ----------------------------
-- Table structure for `tp_summary`
-- ----------------------------
DROP TABLE IF EXISTS `tp_summary`;
CREATE TABLE `tp_summary` (
  `user_id` int(11) NOT NULL,
  `date` int(11) NOT NULL COMMENT '日期如20170101',
  `learn_time` int(11) DEFAULT NULL COMMENT '学习时长',
  `keyword` enum('处理家人关心','升职加薪','麦凯','送礼','发短信') DEFAULT '发短信' COMMENT '关键词',
  `today_finish` text COMMENT '今日计划完成',
  `today_summary` text COMMENT '今日总结内容',
  `submit_time` int(11) DEFAULT NULL COMMENT '提交时间',
  `mood_type` enum('tangle','commonly','happy') DEFAULT 'commonly' COMMENT '心情 ：开心 一般 小纠结',
  `imgs_id` char(255) DEFAULT NULL COMMENT '图片：逗号隔开',
  `title` char(255) DEFAULT NULL COMMENT '标题',
  `type` enum('study','use') DEFAULT 'use' COMMENT '总结类型：''Study课程学习'',''use学以至用''',
  `duration` int(11) DEFAULT NULL COMMENT '时长',
  `summary_id` int(11) NOT NULL AUTO_INCREMENT,
  `iscommnet` tinyint(4) DEFAULT '0' COMMENT '是否已点评',
  `today_finish_num` int(11) DEFAULT NULL COMMENT '今日计划完成字数',
  `today_summary_num` int(11) DEFAULT NULL COMMENT '今日总结字数',
  `tomorrow_plan` text,
  `tomorrow_plan_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`summary_id`),
  UNIQUE KEY `user_id` (`user_id`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='总结';

-- ----------------------------
-- Records of tp_summary
-- ----------------------------
INSERT INTO `tp_summary` VALUES ('2', '20170604', '2', '升职加薪', '今日计划完成', '今日总结内容', '1496305351', 'commonly', '40', '标题', 'use', null, '1', '0', null, null, null, null);
INSERT INTO `tp_summary` VALUES ('1', '20170603', '1', '升职加薪', '1、不做\r\n2、要做什么', '1、不做\r\n2、要做什么', '174770', 'commonly', '42,43,61', '工作记录', 'study', null, '2', '0', null, null, null, null);
INSERT INTO `tp_summary` VALUES ('1', '20170601', '1', '处理家人关心', '今日计划完成', '今日总结内容', '1496312262', 'commonly', '64', '', 'use', null, '7', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `tp_team`
-- ----------------------------
DROP TABLE IF EXISTS `tp_team`;
CREATE TABLE `tp_team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `term_id` int(11) DEFAULT NULL COMMENT '期id',
  `team_no` int(11) NOT NULL COMMENT '团编号',
  `team_name` varchar(50) NOT NULL COMMENT '团名称',
  `create_admin_user_id` int(11) NOT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`team_id`),
  KEY `team_no` (`team_no`),
  KEY `term_id` (`term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='团信息表';

-- ----------------------------
-- Records of tp_team
-- ----------------------------
INSERT INTO `tp_team` VALUES ('1', '4', '1', '1', '1', '2017-06-02 18:15:21', '2017-06-02 18:15:24');
INSERT INTO `tp_team` VALUES ('2', '5', '1', '1', '1', '2017-06-07 23:18:05', '2017-06-07 23:18:05');
INSERT INTO `tp_team` VALUES ('3', '5', '2', '2', '1', '2017-06-07 23:18:05', '2017-06-07 23:18:05');
INSERT INTO `tp_team` VALUES ('7', '5', '3', '3', '1', '2017-06-08 12:07:06', '2017-06-08 12:07:06');
INSERT INTO `tp_team` VALUES ('8', '5', '4', '4', '1', '2017-06-08 12:07:06', '2017-06-08 12:07:06');
INSERT INTO `tp_team` VALUES ('9', '5', '5', '5', '1', '2017-06-08 12:07:06', '2017-06-08 12:07:06');

-- ----------------------------
-- Table structure for `tp_team_manager`
-- ----------------------------
DROP TABLE IF EXISTS `tp_team_manager`;
CREATE TABLE `tp_team_manager` (
  `manager_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `type` enum('regimental','instructor') NOT NULL DEFAULT 'instructor' COMMENT '管理类型：Instructor辅导员，regimental团长',
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团管理员';

-- ----------------------------
-- Records of tp_team_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_team_to_manager`
-- ----------------------------
DROP TABLE IF EXISTS `tp_team_to_manager`;
CREATE TABLE `tp_team_to_manager` (
  `team_to_manager_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `manager_id` int(11) NOT NULL COMMENT '管理员id',
  `team_id` int(11) NOT NULL COMMENT '团id',
  PRIMARY KEY (`team_to_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='团与管理员关联';

-- ----------------------------
-- Records of tp_team_to_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_term`
-- ----------------------------
DROP TABLE IF EXISTS `tp_term`;
CREATE TABLE `tp_term` (
  `term_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '期id',
  `term_no` int(11) NOT NULL COMMENT '期编号',
  `term_name` char(255) NOT NULL COMMENT '期名称',
  `open_date` date NOT NULL COMMENT '开课日期',
  `status` tinyint(4) NOT NULL,
  `isdelete` tinyint(4) NOT NULL,
  `update_time` datetime NOT NULL COMMENT '更新日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `term_no` (`term_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='学期';

-- ----------------------------
-- Records of tp_term
-- ----------------------------
INSERT INTO `tp_term` VALUES ('1', '1', '01期', '2017-06-18', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_term` VALUES ('3', '1001', '第1001期', '2017-06-08', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_term` VALUES ('4', '10089', '第10089期', '2017-06-05', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `tp_term` VALUES ('5', '10090', '第10090期', '2017-06-30', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `tp_thanks_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tp_thanks_comment`;
CREATE TABLE `tp_thanks_comment` (
  `comment_id` int(11) DEFAULT NULL COMMENT '点评id',
  `wish_id` int(11) DEFAULT NULL COMMENT '祝愿id',
  `comment_user_id` int(11) DEFAULT NULL COMMENT '点评学长会员id',
  `tc_user_id` int(11) DEFAULT NULL COMMENT '发起感谢的学员会员id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='感谢点评';

-- ----------------------------
-- Records of tp_thanks_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_user_course`
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_course`;
CREATE TABLE `tp_user_course` (
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL COMMENT '期',
  PRIMARY KEY (`course_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学员与课程关联';

-- ----------------------------
-- Records of tp_user_course
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_user_gift`
-- ----------------------------
DROP TABLE IF EXISTS `tp_user_gift`;
CREATE TABLE `tp_user_gift` (
  `user_id` int(11) NOT NULL,
  `gift_id` int(11) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `address_json` text,
  `user_gift_id` int(11) NOT NULL AUTO_INCREMENT,
  `express_id` int(11) DEFAULT NULL,
  `is_send` tinyint(4) DEFAULT '0' COMMENT '已发送',
  `is_send_msg` tinyint(4) DEFAULT NULL,
  `is_read` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_gift_id`),
  UNIQUE KEY `user_id` (`user_id`,`gift_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_user_gift
-- ----------------------------
INSERT INTO `tp_user_gift` VALUES ('0', '4', null, null, '1', null, '0', null, null);
INSERT INTO `tp_user_gift` VALUES ('0', '5', null, null, '2', null, '0', null, null);
INSERT INTO `tp_user_gift` VALUES ('2', '6', null, null, '3', null, '0', null, null);
INSERT INTO `tp_user_gift` VALUES ('2', '7', null, null, '4', null, '0', null, null);
INSERT INTO `tp_user_gift` VALUES ('1', '8', null, null, '19', null, '0', null, null);
INSERT INTO `tp_user_gift` VALUES ('2', '8', null, null, '20', null, '0', null, null);

-- ----------------------------
-- Table structure for `tp_web_log_001`
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_001`;
CREATE TABLE `tp_web_log_001` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ip` (`ip`),
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4027 DEFAULT CHARSET=utf8 COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_001
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_web_log_all`
-- ----------------------------
DROP TABLE IF EXISTS `tp_web_log_all`;
CREATE TABLE `tp_web_log_all` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `uid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '访客ip',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '访客地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL DEFAULT '' COMMENT '浏览器',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'url',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '模块',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '方法',
  `method` char(6) NOT NULL DEFAULT '' COMMENT '请求方式',
  `data` text COMMENT '请求的param数据，serialize后的',
  `create_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `create_at` (`create_at`) USING BTREE
) ENGINE=MRG_MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC INSERT_METHOD=LAST UNION=(`tp_web_log_001`) COMMENT='网站日志';

-- ----------------------------
-- Records of tp_web_log_all
-- ----------------------------
 
-- ----------------------------
-- Table structure for `tp_wish`
-- ----------------------------
DROP TABLE IF EXISTS `tp_wish`;
CREATE TABLE `tp_wish` (
  `wish_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('wish_admire','wish_reply','thanks_comment') DEFAULT 'thanks_comment' COMMENT '祝福类型：''赞赏wish_admire'',''回复学员 的感谢wish_reply'',''感谢点评thanks_comment''',
  `user_id` int(11) DEFAULT NULL COMMENT '祝福接受人',
  `wish_user_id` int(11) DEFAULT NULL COMMENT '祝愿人',
  `card_id` int(11) DEFAULT NULL COMMENT '祝愿卡id',
  `wish` text COMMENT '祝愿内容',
  PRIMARY KEY (`wish_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='祝愿汇总（感谢点评，回复学员感谢，辅导员赞赏）';

-- ----------------------------
-- Records of tp_wish
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_wish_admire`
-- ----------------------------
DROP TABLE IF EXISTS `tp_wish_admire`;
CREATE TABLE `tp_wish_admire` (
  `wish_id` int(11) DEFAULT NULL,
  `wa_user_id` int(11) DEFAULT NULL COMMENT '接受人',
  `admire_user_id` int(11) DEFAULT NULL COMMENT '赞赏人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赞赏';

-- ----------------------------
-- Records of tp_wish_admire
-- ----------------------------

-- ----------------------------
-- Table structure for `tp_wish_reply`
-- ----------------------------
DROP TABLE IF EXISTS `tp_wish_reply`;
CREATE TABLE `tp_wish_reply` (
  `wish_id` int(11) DEFAULT NULL,
  `reply_user_id` int(11) DEFAULT NULL COMMENT '学员user_id',
  `source_wish_id` int(11) DEFAULT NULL COMMENT '祝愿源id',
  `wr_user_id` int(11) DEFAULT NULL COMMENT '学长user_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_wish_reply
-- ----------------------------
