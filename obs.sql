/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : obs

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-04-25 11:47:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES ('1', 'admin', 'Admin', '6a59320bd8f536adb1bcc2e3df20e147', '1259a7', '/assets/img/avatar.png', 'admin@admin.com', '0', '1619227405', '127.0.0.1', '1491635035', '1619227405', '19c3bc44-c93c-4be5-ac6d-ff53e162b282', 'normal');
INSERT INTO `fa_admin` VALUES ('2', 'root', 'root', '1f0328e5b680b456277f3172be2e03ce', 'yR7IHA', '/assets/img/avatar.png', 'root@qq.com', '0', null, null, '1619227557', '1619227557', '', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '日志标题',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES ('1', '1', 'admin', '/heLYxwirbn.php/index/login?url=%2FheLYxwirbn.php', '登录', '{\"url\":\"\\/heLYxwirbn.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"n5x4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618452438');
INSERT INTO `fa_admin_log` VALUES ('2', '1', 'admin', '/heLYxwirbn.php/addon/install', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"23825\",\"token\":\"***\",\"version\":\"1.0.6\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618452487');
INSERT INTO `fa_admin_log` VALUES ('3', '1', 'admin', '/heLYxwirbn.php/index/login?url=%2FheLYxwirbn.php', '登录', '{\"url\":\"\\/heLYxwirbn.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"vpng\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618474502');
INSERT INTO `fa_admin_log` VALUES ('4', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/1?dialog=1', '会员管理 / 会员管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"1\",\"avatar\":\"\",\"username\":\"admin\",\"nickname\":\"admin\",\"password\":\"***\",\"email\":\"admin@163.com\",\"mobile\":\"13888888888\",\"idcard\":\"35065544145565665565656\",\"birthday\":\"2017-04-08\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475436');
INSERT INTO `fa_admin_log` VALUES ('5', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475625');
INSERT INTO `fa_admin_log` VALUES ('6', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_area\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475627');
INSERT INTO `fa_admin_log` VALUES ('7', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_area\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475629');
INSERT INTO `fa_admin_log` VALUES ('8', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_area\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475630');
INSERT INTO `fa_admin_log` VALUES ('9', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475632');
INSERT INTO `fa_admin_log` VALUES ('10', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475634');
INSERT INTO `fa_admin_log` VALUES ('11', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Area.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475635');
INSERT INTO `fa_admin_log` VALUES ('12', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Area.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475636');
INSERT INTO `fa_admin_log` VALUES ('13', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', 'Area / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"哈密\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475649');
INSERT INTO `fa_admin_log` VALUES ('14', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', 'Area / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"哈密\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475660');
INSERT INTO `fa_admin_log` VALUES ('15', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', 'Area / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"鄯善\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475667');
INSERT INTO `fa_admin_log` VALUES ('16', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', 'Area / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"吐鲁番\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475673');
INSERT INTO `fa_admin_log` VALUES ('17', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', 'Area / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"乌鲁木齐\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475679');
INSERT INTO `fa_admin_log` VALUES ('18', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', 'Area / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"焉耆\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475684');
INSERT INTO `fa_admin_log` VALUES ('19', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', 'Area / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"库尔勒\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618475689');
INSERT INTO `fa_admin_log` VALUES ('20', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618476998');
INSERT INTO `fa_admin_log` VALUES ('21', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_area\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477000');
INSERT INTO `fa_admin_log` VALUES ('22', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_station\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477004');
INSERT INTO `fa_admin_log` VALUES ('23', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_station\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477005');
INSERT INTO `fa_admin_log` VALUES ('24', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_station\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477006');
INSERT INTO `fa_admin_log` VALUES ('25', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477008');
INSERT INTO `fa_admin_log` VALUES ('26', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477010');
INSERT INTO `fa_admin_log` VALUES ('27', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477012');
INSERT INTO `fa_admin_log` VALUES ('28', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Station.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477013');
INSERT INTO `fa_admin_log` VALUES ('29', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Station.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477015');
INSERT INTO `fa_admin_log` VALUES ('30', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477081');
INSERT INTO `fa_admin_log` VALUES ('31', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477544');
INSERT INTO `fa_admin_log` VALUES ('32', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_area\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477545');
INSERT INTO `fa_admin_log` VALUES ('33', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_area\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477548');
INSERT INTO `fa_admin_log` VALUES ('34', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_area\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477548');
INSERT INTO `fa_admin_log` VALUES ('35', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477551');
INSERT INTO `fa_admin_log` VALUES ('36', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477553');
INSERT INTO `fa_admin_log` VALUES ('37', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"Area.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477555');
INSERT INTO `fa_admin_log` VALUES ('38', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"Area.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618477556');
INSERT INTO `fa_admin_log` VALUES ('39', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478060');
INSERT INTO `fa_admin_log` VALUES ('40', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_area\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478062');
INSERT INTO `fa_admin_log` VALUES ('41', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_area\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478065');
INSERT INTO `fa_admin_log` VALUES ('42', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_area\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478066');
INSERT INTO `fa_admin_log` VALUES ('43', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478068');
INSERT INTO `fa_admin_log` VALUES ('44', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478070');
INSERT INTO `fa_admin_log` VALUES ('45', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"Area.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478072');
INSERT INTO `fa_admin_log` VALUES ('46', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"Area.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478073');
INSERT INTO `fa_admin_log` VALUES ('47', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_area_long\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478076');
INSERT INTO `fa_admin_log` VALUES ('48', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_area_long\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478077');
INSERT INTO `fa_admin_log` VALUES ('49', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"fa_area_long\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478077');
INSERT INTO `fa_admin_log` VALUES ('50', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478080');
INSERT INTO `fa_admin_log` VALUES ('51', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478082');
INSERT INTO `fa_admin_log` VALUES ('52', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"AreaLong.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478083');
INSERT INTO `fa_admin_log` VALUES ('53', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"controllerfile_text\":\"\",\"controllerfile\":\"AreaLong.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478084');
INSERT INTO `fa_admin_log` VALUES ('54', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/92?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"area\",\"title\":\"地名\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"92\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478135');
INSERT INTO `fa_admin_log` VALUES ('55', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/106?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"area_long\",\"title\":\"公里\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"106\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478145');
INSERT INTO `fa_admin_log` VALUES ('56', '1', 'admin', '/heLYxwirbn.php/auth/rule/add?dialog=1', '权限管理 / 菜单规则 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"station\",\"title\":\"车站管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478241');
INSERT INTO `fa_admin_log` VALUES ('57', '1', 'admin', '/heLYxwirbn.php/auth/rule/add?dialog=1', '权限管理 / 菜单规则 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"station2\",\"title\":\"车站管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478246');
INSERT INTO `fa_admin_log` VALUES ('58', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/92?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"area\",\"title\":\"地名\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"92\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478256');
INSERT INTO `fa_admin_log` VALUES ('59', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/106?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"area_long\",\"title\":\"公里\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"106\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478261');
INSERT INTO `fa_admin_log` VALUES ('60', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/99?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"station\",\"title\":\"车站管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"99\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478268');
INSERT INTO `fa_admin_log` VALUES ('61', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/99?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"station\",\"title\":\"车次管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"99\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618478287');
INSERT INTO `fa_admin_log` VALUES ('62', '1', 'admin', '/heLYxwirbn.php/index/login?url=%2FheLYxwirbn.php', '登录', '{\"url\":\"\\/heLYxwirbn.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"qxwb\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618557285');
INSERT INTO `fa_admin_log` VALUES ('63', '1', 'admin', '/heLYxwirbn.php/area_long/add?dialog=1', '公里 / 添加', '{\"dialog\":\"1\",\"row\":{\"form\":\"4\",\"to\":\"3\",\"area_long\":\"50\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618558134');
INSERT INTO `fa_admin_log` VALUES ('64', '1', 'admin', '/heLYxwirbn.php/station/add?dialog=1', '车次管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"sid\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 15:59\",\"time_end\":\"2021-04-24 15:59\",\"ying_number\":\"100\",\"ying_remain\":\"100\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\",\"sleepy_number\":\"100\",\"sleepy_remain\":\"100\",\"sleepr_number\":\"100\",\"sleepr_remain\":\"100\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618560181');
INSERT INTO `fa_admin_log` VALUES ('65', '1', 'admin', '/heLYxwirbn.php/station/add?dialog=1', '车次管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"sid\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 16:07\",\"time_end\":\"2021-04-24 16:07\",\"ying_number\":\"100\",\"ruan_number\":\"100\",\"sleepy_number\":\"100\",\"sleepr_number\":\"100\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618560467');
INSERT INTO `fa_admin_log` VALUES ('66', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561463');
INSERT INTO `fa_admin_log` VALUES ('67', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_station_relation\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561467');
INSERT INTO `fa_admin_log` VALUES ('68', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_station_relation\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561468');
INSERT INTO `fa_admin_log` VALUES ('69', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_station_relation\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561468');
INSERT INTO `fa_admin_log` VALUES ('70', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561470');
INSERT INTO `fa_admin_log` VALUES ('71', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561473');
INSERT INTO `fa_admin_log` VALUES ('72', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561475');
INSERT INTO `fa_admin_log` VALUES ('73', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"StationRelation.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561476');
INSERT INTO `fa_admin_log` VALUES ('74', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"StationRelation.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618561476');
INSERT INTO `fa_admin_log` VALUES ('75', '1', 'admin', '/heLYxwirbn.php/station_relation/add?dialog=1', 'StationRelation / 添加', '{\"dialog\":\"1\",\"row\":{\"station_id\":\"1\",\"start_time\":\"2021-04-17 16:46:21\",\"end_time\":\"2021-04-17 19:46:36\",\"start_station\":\"4\",\"end_station\":\"3\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618562806');
INSERT INTO `fa_admin_log` VALUES ('76', '1', 'admin', '/heLYxwirbn.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"114\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618563078');
INSERT INTO `fa_admin_log` VALUES ('77', '1', 'admin', '/heLYxwirbn.php/station/edit/ids/1?dialog=1', '车次管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 16:07:00\",\"time_end\":\"2021-04-20 16:07:00\",\"ying_number\":\"100\",\"ying_remain\":\"100\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\",\"sleepy_number\":\"100\",\"sleepy_remain\":\"100\",\"sleepr_number\":\"100\",\"sleepr_remain\":\"100\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618563234');
INSERT INTO `fa_admin_log` VALUES ('78', '1', 'admin', '/heLYxwirbn.php/station/edit/ids/1?dialog=1', '车次管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 16:07:00\",\"time_end\":\"2021-04-20 16:07:00\",\"ying_number\":\"100\",\"ying_remain\":\"100\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\",\"sleepy_number\":\"100\",\"sleepy_remain\":\"100\",\"sleepr_number\":\"100\",\"sleepr_remain\":\"100\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618563239');
INSERT INTO `fa_admin_log` VALUES ('79', '1', 'admin', '/heLYxwirbn.php/station/edit/ids/1?dialog=1', '车次管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 16:07:00\",\"time_end\":\"2021-04-27 16:07:00\",\"ying_number\":\"100\",\"ying_remain\":\"100\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\",\"sleepy_number\":\"100\",\"sleepy_remain\":\"100\",\"sleepr_number\":\"100\",\"sleepr_remain\":\"100\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618563265');
INSERT INTO `fa_admin_log` VALUES ('80', '1', 'admin', '/heLYxwirbn.php/station/edit/ids/1?dialog=1', '车次管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 16:07:00\",\"time_end\":\"2021-04-27 16:07:00\",\"ying_number\":\"100\",\"ying_remain\":\"100\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\",\"sleepy_number\":\"100\",\"sleepy_remain\":\"100\",\"sleepr_number\":\"100\",\"sleepr_remain\":\"100\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618563272');
INSERT INTO `fa_admin_log` VALUES ('81', '1', 'admin', '/heLYxwirbn.php/station/edit/ids/1?dialog=1', '车次管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 16:07:00\",\"time_end\":\"2021-04-27 16:07:00\",\"ying_number\":\"100\",\"ying_remain\":\"100\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\",\"sleepy_number\":\"100\",\"sleepy_remain\":\"100\",\"sleepr_number\":\"100\",\"sleepr_remain\":\"100\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618563303');
INSERT INTO `fa_admin_log` VALUES ('82', '1', 'admin', '/heLYxwirbn.php/station/edit/ids/1?dialog=1', '车次管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-17 16:07:00\",\"time_end\":\"2021-04-27 16:07:00\",\"ying_number\":\"100\",\"ying_remain\":\"100\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\",\"sleepy_number\":\"100\",\"sleepy_remain\":\"100\",\"sleepr_number\":\"100\",\"sleepr_remain\":\"100\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618563418');
INSERT INTO `fa_admin_log` VALUES ('83', '1', 'admin', '/heLYxwirbn.php/station_relation/add?dialog=1', 'StationRelation / 添加', '{\"dialog\":\"1\",\"row\":{\"station_id\":\"1\",\"start_time\":\"2021-04-22 09:35:27\",\"end_time\":\"2021-04-24 09:35:27\",\"start_station\":\"3\",\"end_station\":\"6\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618623391');
INSERT INTO `fa_admin_log` VALUES ('84', '1', 'admin', '/heLYxwirbn.php/index/login?url=%2FheLYxwirbn.php', '登录', '{\"url\":\"\\/heLYxwirbn.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"d8wv\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813755');
INSERT INTO `fa_admin_log` VALUES ('85', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813762');
INSERT INTO `fa_admin_log` VALUES ('86', '1', 'admin', '/heLYxwirbn.php/command/get_field_list', '在线命令管理', '{\"table\":\"fa_user_relation\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813772');
INSERT INTO `fa_admin_log` VALUES ('87', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_user_relation\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813774');
INSERT INTO `fa_admin_log` VALUES ('88', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"0\",\"force\":\"0\",\"table\":\"fa_user_relation\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813775');
INSERT INTO `fa_admin_log` VALUES ('89', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813777');
INSERT INTO `fa_admin_log` VALUES ('90', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813779');
INSERT INTO `fa_admin_log` VALUES ('91', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813785');
INSERT INTO `fa_admin_log` VALUES ('92', '1', 'admin', '/heLYxwirbn.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"3\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813787');
INSERT INTO `fa_admin_log` VALUES ('93', '1', 'admin', '/heLYxwirbn.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"UserRelation.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813787');
INSERT INTO `fa_admin_log` VALUES ('94', '1', 'admin', '/heLYxwirbn.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"UserRelation.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618813788');
INSERT INTO `fa_admin_log` VALUES ('95', '1', 'admin', '/heLYxwirbn.php/addon/install', '插件管理', '{\"name\":\"vote\",\"force\":\"0\",\"uid\":\"23825\",\"token\":\"***\",\"version\":\"1.1.0\",\"faversion\":\"1.2.0.20210401_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814572');
INSERT INTO `fa_admin_log` VALUES ('96', '1', 'admin', '/heLYxwirbn.php/vote/subject/check_element_available', '投票管理 / 投票项目管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"撒大声地\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814914');
INSERT INTO `fa_admin_log` VALUES ('97', '1', 'admin', '/heLYxwirbn.php/vote/subject/edit/ids/1?dialog=1', '投票管理 / 投票项目管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"title\":\"3123\",\"user_id\":\"2\",\"image\":\"\\/uploads\\/20210419\\/92f2cd7ad8ac296dfc513d9b2bf5bb13.png\",\"keywords\":\"\",\"description\":\"\",\"intro\":\"123\",\"content\":\"123\",\"banner\":\"\",\"maxvoteplayers\":\"0\",\"pervoteplayers\":\"0\",\"maxvotenums\":\"0\",\"pervotenums\":\"5\",\"maxvotelimit\":\"0\",\"pervotelimit\":\"1\",\"maxcatevotenums\":\"0\",\"percatevotenums\":\"0\",\"maxcatevoteplayers\":\"0\",\"pagesize\":\"0\",\"limitarea\":\"\",\"needlogin\":\"0\",\"onlywechat\":\"0\",\"diyname\":\"撒大声地\",\"playername\":\"选手\",\"subjecttpl\":\"\",\"playertpl\":\"\",\"ranktpl\":\"\",\"applytpl\":\"\",\"isapply\":\"0\",\"iscomment\":\"0\",\"begintime\":\"\",\"endtime\":\"\",\"memo\":\"\",\"status\":\"normal\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814915');
INSERT INTO `fa_admin_log` VALUES ('98', '1', 'admin', '/heLYxwirbn.php/vote/subject/check_element_available', '投票管理 / 投票项目管理', '{\"id\":\"1\",\"name\":\"row[diyname]\",\"value\":\"撒大声地\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814951');
INSERT INTO `fa_admin_log` VALUES ('99', '1', 'admin', '/heLYxwirbn.php/vote/subject/edit/ids/1?dialog=1', '投票管理 / 投票项目管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"title\":\"3123\",\"user_id\":\"2\",\"image\":\"\\/uploads\\/20210419\\/92f2cd7ad8ac296dfc513d9b2bf5bb13.png\",\"keywords\":\"\",\"description\":\"\",\"intro\":\"123\",\"content\":\"123\",\"banner\":\"\",\"maxvoteplayers\":\"0\",\"pervoteplayers\":\"0\",\"maxvotenums\":\"0\",\"pervotenums\":\"5\",\"maxvotelimit\":\"0\",\"pervotelimit\":\"1\",\"maxcatevotenums\":\"0\",\"percatevotenums\":\"0\",\"maxcatevoteplayers\":\"0\",\"pagesize\":\"0\",\"limitarea\":\"\",\"needlogin\":\"0\",\"onlywechat\":\"0\",\"diyname\":\"撒大声地\",\"playername\":\"选手\",\"subjecttpl\":\"\",\"playertpl\":\"\",\"ranktpl\":\"\",\"applytpl\":\"\",\"isapply\":\"0\",\"iscomment\":\"0\",\"begintime\":\"2021-04-19 14:49:02\",\"endtime\":\"2021-04-22 14:49:05\",\"memo\":\"\",\"status\":\"normal\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814951');
INSERT INTO `fa_admin_log` VALUES ('100', '1', 'admin', '/heLYxwirbn.php/ajax/upload', '', '[]', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814970');
INSERT INTO `fa_admin_log` VALUES ('101', '1', 'admin', '/heLYxwirbn.php/vote/player/add/subject_id/1?dialog=1', '投票管理 / 投票选手管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"category_id\":\"\",\"user_id\":\"1\",\"nickname\":\"123\",\"intro\":\"123\",\"content\":\"123\",\"image\":\"\\/uploads\\/20210419\\/92f2cd7ad8ac296dfc513d9b2bf5bb13.png\",\"bgcolor\":\"\",\"banner\":\"\",\"votes\":\"0\",\"views\":\"0\",\"comments\":\"0\",\"votetime\":\"2021-04-19 14:49:20\",\"status\":\"hidden\"},\"subject_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814974');
INSERT INTO `fa_admin_log` VALUES ('102', '1', 'admin', '/heLYxwirbn.php/vote/player/edit/subject_id/1/ids/1?dialog=1', '投票管理 / 投票选手管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"subject_id\":\"1\",\"category_id\":\"0\",\"user_id\":\"1\",\"number\":\"1\",\"nickname\":\"123\",\"intro\":\"123\",\"content\":\"123\",\"image\":\"\\/uploads\\/20210419\\/92f2cd7ad8ac296dfc513d9b2bf5bb13.png\",\"bgcolor\":\"\",\"banner\":\"\",\"votes\":\"0\",\"views\":\"0\",\"comments\":\"0\",\"votetime\":\"2021-04-19 14:49:20\",\"memo\":\"\",\"status\":\"normal\"},\"subject_id\":\"1\",\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618814980');
INSERT INTO `fa_admin_log` VALUES ('103', '1', 'admin', '/heLYxwirbn.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"vote\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618820739');
INSERT INTO `fa_admin_log` VALUES ('104', '1', 'admin', '/heLYxwirbn.php/addon/get_table_list', '插件管理', '{\"name\":\"vote\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618820741');
INSERT INTO `fa_admin_log` VALUES ('105', '1', 'admin', '/heLYxwirbn.php/addon/uninstall', '插件管理', '{\"name\":\"vote\",\"force\":\"0\",\"droptables\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618820747');
INSERT INTO `fa_admin_log` VALUES ('106', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/121?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"订单管理\",\"title\":\"UserRelation\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"121\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618821491');
INSERT INTO `fa_admin_log` VALUES ('107', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/121?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"user_relation\",\"title\":\"订单管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"121\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618821506');
INSERT INTO `fa_admin_log` VALUES ('108', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/67?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"user\\/user\",\"title\":\"用户管理\",\"url\":\"\",\"icon\":\"fa fa-user\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"67\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823780');
INSERT INTO `fa_admin_log` VALUES ('109', '1', 'admin', '/heLYxwirbn.php/auth/rule/del', '权限管理 / 菜单规则 / 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823828');
INSERT INTO `fa_admin_log` VALUES ('110', '1', 'admin', '/heLYxwirbn.php/auth/rule/del', '权限管理 / 菜单规则 / 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823831');
INSERT INTO `fa_admin_log` VALUES ('111', '1', 'admin', '/heLYxwirbn.php/auth/rule/del', '权限管理 / 菜单规则 / 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823838');
INSERT INTO `fa_admin_log` VALUES ('112', '1', 'admin', '/heLYxwirbn.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"command\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823852');
INSERT INTO `fa_admin_log` VALUES ('113', '1', 'admin', '/heLYxwirbn.php/addon/uninstall', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"droptables\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823855');
INSERT INTO `fa_admin_log` VALUES ('114', '1', 'admin', '/heLYxwirbn.php/auth/rule/del', '权限管理 / 菜单规则 / 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823874');
INSERT INTO `fa_admin_log` VALUES ('115', '1', 'admin', '/heLYxwirbn.php/auth/rule/del', '权限管理 / 菜单规则 / 删除', '{\"action\":\"del\",\"ids\":\"66\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823877');
INSERT INTO `fa_admin_log` VALUES ('116', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/113?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"station2\",\"title\":\"铁路购票管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"999\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"113\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823904');
INSERT INTO `fa_admin_log` VALUES ('117', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/92?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"area\",\"title\":\"地名管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"92\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823919');
INSERT INTO `fa_admin_log` VALUES ('118', '1', 'admin', '/heLYxwirbn.php/auth/rule/edit/ids/106?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"113\",\"name\":\"area_long\",\"title\":\"公里管理\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"106\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.114 Safari/537.36', '1618823925');
INSERT INTO `fa_admin_log` VALUES ('119', '1', 'admin', '/heLYxwirbn.php/index/login?url=%2FheLYxwirbn.php', '登录', '{\"url\":\"\\/heLYxwirbn.php\",\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"muky\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225311');
INSERT INTO `fa_admin_log` VALUES ('120', '1', 'admin', '/heLYxwirbn.php/station/edit/ids/1?dialog=1', '车次管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"X101\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-25 16:07:00\",\"time_end\":\"2021-04-30 16:07:00\",\"ying_number\":\"100\",\"ying_remain\":\"97\",\"ruan_number\":\"100\",\"ruan_remain\":\"100\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225631');
INSERT INTO `fa_admin_log` VALUES ('121', '1', 'admin', '/heLYxwirbn.php/station_relation/edit/ids/2?dialog=1', 'StationRelation / 编辑', '{\"dialog\":\"1\",\"row\":{\"station_id\":\"1\",\"start_time\":\"2021-04-26 09:35:27\",\"end_time\":\"2021-04-26 17:35:27\",\"start_station\":\"3\",\"end_station\":\"6\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225661');
INSERT INTO `fa_admin_log` VALUES ('122', '1', 'admin', '/heLYxwirbn.php/station_relation/edit/ids/1?dialog=1', 'StationRelation / 编辑', '{\"dialog\":\"1\",\"row\":{\"station_id\":\"1\",\"start_time\":\"2021-04-24 08:54:41\",\"end_time\":\"2021-04-25 19:46:36\",\"start_station\":\"4\",\"end_station\":\"3\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225689');
INSERT INTO `fa_admin_log` VALUES ('123', '1', 'admin', '/heLYxwirbn.php/station_relation/edit/ids/2?dialog=1', 'StationRelation / 编辑', '{\"dialog\":\"1\",\"row\":{\"station_id\":\"1\",\"start_time\":\"2021-04-25 09:35:27\",\"end_time\":\"2021-04-26 17:35:27\",\"start_station\":\"3\",\"end_station\":\"6\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225710');
INSERT INTO `fa_admin_log` VALUES ('124', '1', 'admin', '/heLYxwirbn.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"dldm\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225836');
INSERT INTO `fa_admin_log` VALUES ('125', '1', 'admin', '/heLYxwirbn.php/user/user/del', '用户管理 / 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225843');
INSERT INTO `fa_admin_log` VALUES ('126', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', '地名管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"11\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225864');
INSERT INTO `fa_admin_log` VALUES ('127', '1', 'admin', '/heLYxwirbn.php/area/del', '地名管理 / 删除', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225866');
INSERT INTO `fa_admin_log` VALUES ('128', '1', 'admin', '/heLYxwirbn.php/station/add?dialog=1', '车次管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"B11\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-25 08:57\",\"time_end\":\"2021-04-30 08:57\",\"ying_number\":\"100\",\"ruan_number\":\"100\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619225891');
INSERT INTO `fa_admin_log` VALUES ('129', '1', 'admin', '/heLYxwirbn.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"ubki\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619226076');
INSERT INTO `fa_admin_log` VALUES ('130', '1', 'admin', '/heLYxwirbn.php/user/user/del', '用户管理 / 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619226080');
INSERT INTO `fa_admin_log` VALUES ('131', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"email\":\"\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\",\"birthday\":\"\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619226085');
INSERT INTO `fa_admin_log` VALUES ('132', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619226211');
INSERT INTO `fa_admin_log` VALUES ('133', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619226446');
INSERT INTO `fa_admin_log` VALUES ('134', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619226465');
INSERT INTO `fa_admin_log` VALUES ('135', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227205');
INSERT INTO `fa_admin_log` VALUES ('136', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227211');
INSERT INTO `fa_admin_log` VALUES ('137', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227230');
INSERT INTO `fa_admin_log` VALUES ('138', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227254');
INSERT INTO `fa_admin_log` VALUES ('139', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp123367\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227356');
INSERT INTO `fa_admin_log` VALUES ('140', '0', 'Unknown', '/heLYxwirbn.php/index/login', '', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"fe87\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227400');
INSERT INTO `fa_admin_log` VALUES ('141', '1', 'admin', '/heLYxwirbn.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"w8nk\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227405');
INSERT INTO `fa_admin_log` VALUES ('142', '1', 'admin', '/heLYxwirbn.php/user/user/edit/ids/4?dialog=1', '用户管理 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"id\":\"4\",\"avatar\":\"\",\"username\":\"hhp1233678\",\"nickname\":\"hhp12336\",\"password\":\"***\",\"mobile\":\"15005090549\",\"idcard\":\"16565156654564215165\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227413');
INSERT INTO `fa_admin_log` VALUES ('143', '1', 'admin', '/heLYxwirbn.php/user/user/del', '用户管理 / 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227417');
INSERT INTO `fa_admin_log` VALUES ('144', '1', 'admin', '/heLYxwirbn.php/area/add?dialog=1', '地名管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"111\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227422');
INSERT INTO `fa_admin_log` VALUES ('145', '1', 'admin', '/heLYxwirbn.php/area/del', '地名管理 / 删除', '{\"action\":\"del\",\"ids\":\"8\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227424');
INSERT INTO `fa_admin_log` VALUES ('146', '1', 'admin', '/heLYxwirbn.php/station/add?dialog=1', '车次管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"XB5844\",\"station_start\":\"4\",\"station_end\":\"2\",\"time_start\":\"2021-04-25 09:23\",\"time_end\":\"2021-04-29 09:23\",\"ying_number\":\"100\",\"ruan_number\":\"100\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227453');
INSERT INTO `fa_admin_log` VALUES ('147', '1', 'admin', '/heLYxwirbn.php/station_relation/add?dialog=1', 'StationRelation / 添加', '{\"dialog\":\"1\",\"row\":{\"station_id\":\"2\",\"start_time\":\"2021-04-25 09:24:19\",\"end_time\":\"2021-04-26 09:24:19\",\"start_station\":\"4\",\"end_station\":\"3\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227480');
INSERT INTO `fa_admin_log` VALUES ('148', '1', 'admin', '/heLYxwirbn.php/station_relation/add?dialog=1', 'StationRelation / 添加', '{\"dialog\":\"1\",\"row\":{\"station_id\":\"3\",\"start_time\":\"2021-04-25 09:24:46\",\"end_time\":\"2021-04-26 09:24:46\",\"start_station\":\"4\",\"end_station\":\"3\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227496');
INSERT INTO `fa_admin_log` VALUES ('149', '1', 'admin', '/heLYxwirbn.php/area_long/add?dialog=1', '公里管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"form\":\"4\",\"to\":\"3\",\"area_long\":\"80\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227510');
INSERT INTO `fa_admin_log` VALUES ('150', '1', 'admin', '/heLYxwirbn.php/auth/admin/add?dialog=1', '权限管理 / 管理员管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"group\":[\"1\"],\"row\":{\"username\":\"root\",\"email\":\"root@qq.com\",\"nickname\":\"root\",\"password\":\"***\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227557');
INSERT INTO `fa_admin_log` VALUES ('151', '1', 'admin', '/heLYxwirbn.php/auth/group/roletree', '权限管理 / 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.72 Safari/537.36', '1619227563');

-- ----------------------------
-- Table structure for fa_area
-- ----------------------------
DROP TABLE IF EXISTS `fa_area`;
CREATE TABLE `fa_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '地名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of fa_area
-- ----------------------------
INSERT INTO `fa_area` VALUES ('1', '哈密');
INSERT INTO `fa_area` VALUES ('2', '鄯善');
INSERT INTO `fa_area` VALUES ('3', '吐鲁番');
INSERT INTO `fa_area` VALUES ('4', '乌鲁木齐');
INSERT INTO `fa_area` VALUES ('5', '焉耆');
INSERT INTO `fa_area` VALUES ('6', '库尔勒');

-- ----------------------------
-- Table structure for fa_area_long
-- ----------------------------
DROP TABLE IF EXISTS `fa_area_long`;
CREATE TABLE `fa_area_long` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '起点',
  `to` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '终点',
  `area_long` int(10) DEFAULT NULL COMMENT '公里数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of fa_area_long
-- ----------------------------
INSERT INTO `fa_area_long` VALUES ('1', '1', '2', '20');
INSERT INTO `fa_area_long` VALUES ('2', '1', '3', '40');
INSERT INTO `fa_area_long` VALUES ('3', '1', '4', '60');
INSERT INTO `fa_area_long` VALUES ('4', '1', '5', '80');
INSERT INTO `fa_area_long` VALUES ('5', '1', '6', '100');
INSERT INTO `fa_area_long` VALUES ('6', '2', '3', '30');
INSERT INTO `fa_area_long` VALUES ('7', '2', '4', '50');
INSERT INTO `fa_area_long` VALUES ('8', '2', '5', '70');
INSERT INTO `fa_area_long` VALUES ('9', '2', '6', '90');
INSERT INTO `fa_area_long` VALUES ('10', '3', '4', '40');
INSERT INTO `fa_area_long` VALUES ('11', '3', '5', '60');
INSERT INTO `fa_area_long` VALUES ('12', '3', '6', '80');
INSERT INTO `fa_area_long` VALUES ('17', '4', '3', '80');
INSERT INTO `fa_area_long` VALUES ('13', '4', '5', '30');
INSERT INTO `fa_area_long` VALUES ('14', '4', '6', '20');
INSERT INTO `fa_area_long` VALUES ('15', '5', '6', '10');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '组名',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES ('1', '0', 'Admin group', '*', '1491635035', '1491635035', 'normal');
INSERT INTO `fa_auth_group` VALUES ('2', '1', 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', '1491635035', '1491635035', 'normal');
INSERT INTO `fa_auth_group` VALUES ('3', '2', 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', '1491635035', '1491635035', 'normal');
INSERT INTO `fa_auth_group` VALUES ('4', '1', 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', '1491635035', '1491635035', 'normal');
INSERT INTO `fa_auth_group` VALUES ('5', '2', 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', '1491635035', '1491635035', 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES ('1', '1');
INSERT INTO `fa_auth_group_access` VALUES ('2', '1');

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '图标',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '条件',
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '扩展属性',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES ('5', 'file', '0', 'auth', 'Auth', 'fa fa-group', '', '', '', '1', null, '', '1491635035', '1491635035', '99', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', '1', null, '', '1491635035', '1491635035', '118', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', '1', null, '', '1491635035', '1491635035', '113', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', '1', null, '', '1491635035', '1491635035', '109', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', '1', null, '', '1491635035', '1491635035', '104', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', '0', null, '', '1491635035', '1491635035', '117', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '116', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '115', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '114', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', '0', null, '', '1491635035', '1491635035', '112', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '111', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '110', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', '0', null, '', '1491635035', '1491635035', '108', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '107', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '106', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '105', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', '0', null, '', '1491635035', '1491635035', '103', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '102', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '101', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '100', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('67', 'file', '113', 'user/user', '用户管理', 'fa fa-user', '', '', '', '1', 'addtabs', '', '1491635035', '1618823780', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('68', 'file', '67', 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('69', 'file', '67', 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('70', 'file', '67', 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('71', 'file', '67', 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('72', 'file', '67', 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', '0', null, '', '1491635035', '1491635035', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('92', 'file', '113', 'area', '地名管理', 'fa fa-circle-o', '', '', '', '1', 'addtabs', '', '1618475636', '1618823919', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('93', 'file', '92', 'area/import', 'Import', 'fa fa-circle-o', '', '', '', '0', null, '', '1618475636', '1618478072', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('94', 'file', '92', 'area/index', '查看', 'fa fa-circle-o', '', '', '', '0', null, '', '1618475636', '1618478072', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('95', 'file', '92', 'area/add', '添加', 'fa fa-circle-o', '', '', '', '0', null, '', '1618475636', '1618478072', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('96', 'file', '92', 'area/edit', '编辑', 'fa fa-circle-o', '', '', '', '0', null, '', '1618475636', '1618478072', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('97', 'file', '92', 'area/del', '删除', 'fa fa-circle-o', '', '', '', '0', null, '', '1618475636', '1618478072', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('98', 'file', '92', 'area/multi', '批量更新', 'fa fa-circle-o', '', '', '', '0', null, '', '1618475636', '1618478072', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('99', 'file', '113', 'station', '车次管理', 'fa fa-circle-o', '', '', '', '1', 'addtabs', '', '1618477014', '1618478287', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('100', 'file', '99', 'station/import', 'Import', 'fa fa-circle-o', '', '', '', '0', null, '', '1618477014', '1618477014', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('101', 'file', '99', 'station/index', '查看', 'fa fa-circle-o', '', '', '', '0', null, '', '1618477014', '1618477014', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('102', 'file', '99', 'station/add', '添加', 'fa fa-circle-o', '', '', '', '0', null, '', '1618477014', '1618477014', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('103', 'file', '99', 'station/edit', '编辑', 'fa fa-circle-o', '', '', '', '0', null, '', '1618477014', '1618477014', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('104', 'file', '99', 'station/del', '删除', 'fa fa-circle-o', '', '', '', '0', null, '', '1618477014', '1618477014', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('105', 'file', '99', 'station/multi', '批量更新', 'fa fa-circle-o', '', '', '', '0', null, '', '1618477014', '1618477014', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('106', 'file', '113', 'area_long', '公里管理', 'fa fa-circle-o', '', '', '', '1', 'addtabs', '', '1618478083', '1618823925', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('107', 'file', '106', 'area_long/import', 'Import', 'fa fa-circle-o', '', '', '', '0', null, '', '1618478083', '1618478083', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('108', 'file', '106', 'area_long/index', '查看', 'fa fa-circle-o', '', '', '', '0', null, '', '1618478083', '1618478083', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('109', 'file', '106', 'area_long/add', '添加', 'fa fa-circle-o', '', '', '', '0', null, '', '1618478083', '1618478083', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('110', 'file', '106', 'area_long/edit', '编辑', 'fa fa-circle-o', '', '', '', '0', null, '', '1618478083', '1618478083', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('111', 'file', '106', 'area_long/del', '删除', 'fa fa-circle-o', '', '', '', '0', null, '', '1618478083', '1618478083', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('112', 'file', '106', 'area_long/multi', '批量更新', 'fa fa-circle-o', '', '', '', '0', null, '', '1618478083', '1618478083', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('113', 'file', '0', 'station2', '铁路购票管理', 'fa fa-circle-o', '', '', '', '1', 'addtabs', '', '1618478246', '1618823904', '999', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('114', 'file', '0', 'station_relation', 'StationRelation', 'fa fa-circle-o', '', '', '', '0', null, '', '1618561476', '1618563078', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('115', 'file', '114', 'station_relation/import', 'Import', 'fa fa-circle-o', '', '', '', '0', null, '', '1618561476', '1618561476', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('116', 'file', '114', 'station_relation/index', '查看', 'fa fa-circle-o', '', '', '', '0', null, '', '1618561476', '1618561476', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('117', 'file', '114', 'station_relation/add', '添加', 'fa fa-circle-o', '', '', '', '0', null, '', '1618561476', '1618561476', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('118', 'file', '114', 'station_relation/edit', '编辑', 'fa fa-circle-o', '', '', '', '0', null, '', '1618561476', '1618561476', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('119', 'file', '114', 'station_relation/del', '删除', 'fa fa-circle-o', '', '', '', '0', null, '', '1618561476', '1618561476', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('120', 'file', '114', 'station_relation/multi', '批量更新', 'fa fa-circle-o', '', '', '', '0', null, '', '1618561476', '1618561476', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('121', 'file', '113', 'user_relation', '订单管理', 'fa fa-circle-o', '', '', '', '1', 'addtabs', '', '1618813788', '1618821506', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('122', 'file', '121', 'user_relation/import', 'Import', 'fa fa-circle-o', '', '', '', '0', null, '', '1618813788', '1618813788', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('123', 'file', '121', 'user_relation/index', '查看', 'fa fa-circle-o', '', '', '', '0', null, '', '1618813788', '1618813788', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('124', 'file', '121', 'user_relation/add', '添加', 'fa fa-circle-o', '', '', '', '0', null, '', '1618813788', '1618813788', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('125', 'file', '121', 'user_relation/edit', '编辑', 'fa fa-circle-o', '', '', '', '0', null, '', '1618813788', '1618813788', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('126', 'file', '121', 'user_relation/del', '删除', 'fa fa-circle-o', '', '', '', '0', null, '', '1618813788', '1618813788', '0', 'normal');
INSERT INTO `fa_auth_rule` VALUES ('127', 'file', '121', 'user_relation/multi', '批量更新', 'fa fa-circle-o', '', '', '', '0', null, '', '1618813788', '1618813788', '0', 'normal');

-- ----------------------------
-- Table structure for fa_station
-- ----------------------------
DROP TABLE IF EXISTS `fa_station`;
CREATE TABLE `fa_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '车次号',
  `station_start` int(10) NOT NULL DEFAULT '0' COMMENT '起点站',
  `station_end` int(10) NOT NULL DEFAULT '0' COMMENT '终点站',
  `time_start` int(10) NOT NULL DEFAULT '0' COMMENT '发车时间',
  `time_end` int(10) NOT NULL DEFAULT '0' COMMENT '到站时间',
  `ying_number` int(10) DEFAULT '0' COMMENT '硬座数',
  `ying_remain` int(10) DEFAULT '0' COMMENT '硬座剩余数',
  `ruan_number` int(10) NOT NULL DEFAULT '0' COMMENT '软座数',
  `ruan_remain` int(10) DEFAULT '0' COMMENT '软座剩余数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='车站表';

-- ----------------------------
-- Records of fa_station
-- ----------------------------
INSERT INTO `fa_station` VALUES ('1', 'X101', '4', '2', '1619338020', '1619770020', '100', '97', '100', '100');
INSERT INTO `fa_station` VALUES ('2', 'B11', '4', '2', '1619312220', '1619744220', '100', '99', '100', '98');
INSERT INTO `fa_station` VALUES ('3', 'XB5844', '4', '2', '1619313780', '1619659380', '100', '100', '100', '100');

-- ----------------------------
-- Table structure for fa_station_relation
-- ----------------------------
DROP TABLE IF EXISTS `fa_station_relation`;
CREATE TABLE `fa_station_relation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `station_id` int(10) DEFAULT NULL,
  `day` int(10) DEFAULT NULL COMMENT '日期',
  `start_time` int(10) DEFAULT NULL,
  `end_time` int(10) DEFAULT NULL,
  `start_station` int(10) DEFAULT NULL,
  `end_station` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of fa_station_relation
-- ----------------------------
INSERT INTO `fa_station_relation` VALUES ('1', '1', null, '1619225681', '1619351196', '4', '3');
INSERT INTO `fa_station_relation` VALUES ('2', '1', '1619020800', '1619314527', '1619429727', '3', '6');
INSERT INTO `fa_station_relation` VALUES ('3', '2', '1619280000', '1619313859', '1619400259', '4', '3');
INSERT INTO `fa_station_relation` VALUES ('4', '3', '1619280000', '1619313886', '1619400286', '4', '3');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '昵称',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码',
  `salt` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Token',
  `status` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '状态',
  `verification` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证',
  `idcard` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '身份证',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES ('1', '1', 'admin', 'admin', '9af346cf10cb95b6530b753a2e59b186', '523d7d', 'admin@163.com', '13888888888', '', '0', '0', '2017-04-08', '', '0.00', '0', '1', '1', '1491635035', '1491635035', '127.0.0.1', '0', '127.0.0.1', '1491635035', '0', '1618475436', '', 'normal', '', '35065544145565665565656');
INSERT INTO `fa_user` VALUES ('2', '0', 'hhp', 'hhp', '91869f62c3cf4183694d43e6315b5a0f', 'LB0JQt', '', '15005090546', '', '1', '0', null, '', '0.00', '0', '1', '1', '1619261380', '1619261439', '127.0.0.1', '0', '127.0.0.1', '1618556292', '1618556292', '1619261439', '', 'normal', '', '16565156654564215165');
INSERT INTO `fa_user` VALUES ('3', '0', 'hhp123', 'hhp123', '2bbb30d8a272224dcad4ec3b8013a50e', 'RHM6NG', '', '15005090548', '', '1', '0', null, '', '0.00', '0', '1', '1', '1618556404', '1618556404', '127.0.0.1', '0', '127.0.0.1', '1618556404', '1618556404', '1618556404', '', 'normal', '', '16565156654564215165');
INSERT INTO `fa_user` VALUES ('7', '0', '2snqdylj', '2snqdylj', '02e97a31cbf3fc8e4dd505ec48ea48bc', 'YP4vNr', '', '15005090547', '', '1', '0', null, '', '0.00', '0', '1', '1', '1619227648', '1619227675', '127.0.0.1', '0', '127.0.0.1', '1619227648', '1619227648', '1619227675', '', 'normal', '', '16565156654564215165');

-- ----------------------------
-- Table structure for fa_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_relation`;
CREATE TABLE `fa_user_relation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `relation_id` int(10) DEFAULT NULL COMMENT '间隔ID',
  `station_id` int(10) DEFAULT NULL COMMENT '车次ID',
  `settype` int(10) DEFAULT '1' COMMENT '座位类型',
  `setnumber` int(10) DEFAULT '0' COMMENT '座位号',
  `money` int(10) DEFAULT '0' COMMENT '金额',
  `user_id` int(10) DEFAULT '0' COMMENT '用户ID',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of fa_user_relation
-- ----------------------------
INSERT INTO `fa_user_relation` VALUES ('8', '2', '1', '2', '3', '560', '2', '1619225600', '0');
INSERT INTO `fa_user_relation` VALUES ('6', '2', '1', '2', '1', '560', '2', '1618821040', '0');
INSERT INTO `fa_user_relation` VALUES ('10', '3', '2', '1', '1', '1120', '2', '1619260280', '2');
INSERT INTO `fa_user_relation` VALUES ('11', '3', '2', '1', '2', '1120', '2', '1619261456', '2');

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '标题',
  `remark` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员规则表';

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES ('1', '0', 'index', 'Frontend', '', '1', '1491635035', '1491635035', '1', 'normal');
INSERT INTO `fa_user_rule` VALUES ('2', '0', 'api', 'API Interface', '', '1', '1491635035', '1491635035', '2', 'normal');
INSERT INTO `fa_user_rule` VALUES ('3', '1', 'user', 'User Module', '', '1', '1491635035', '1491635035', '12', 'normal');
INSERT INTO `fa_user_rule` VALUES ('4', '2', 'user', 'User Module', '', '1', '1491635035', '1491635035', '11', 'normal');
INSERT INTO `fa_user_rule` VALUES ('5', '3', 'index/user/login', 'Login', '', '0', '1491635035', '1491635035', '5', 'normal');
INSERT INTO `fa_user_rule` VALUES ('6', '3', 'index/user/register', 'Register', '', '0', '1491635035', '1491635035', '7', 'normal');
INSERT INTO `fa_user_rule` VALUES ('7', '3', 'index/user/index', 'User Center', '', '0', '1491635035', '1491635035', '9', 'normal');
INSERT INTO `fa_user_rule` VALUES ('8', '3', 'index/user/profile', 'Profile', '', '0', '1491635035', '1491635035', '4', 'normal');
INSERT INTO `fa_user_rule` VALUES ('9', '4', 'api/user/login', 'Login', '', '0', '1491635035', '1491635035', '6', 'normal');
INSERT INTO `fa_user_rule` VALUES ('10', '4', 'api/user/register', 'Register', '', '0', '1491635035', '1491635035', '8', 'normal');
INSERT INTO `fa_user_rule` VALUES ('11', '4', 'api/user/index', 'User Center', '', '0', '1491635035', '1491635035', '10', 'normal');
INSERT INTO `fa_user_rule` VALUES ('12', '4', 'api/user/profile', 'Profile', '', '0', '1491635035', '1491635035', '3', 'normal');

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
INSERT INTO `fa_user_token` VALUES ('730b83826bcdfa513062918727ba07cffe466271', '2', '1619261439', '1621853439');

-- ----------------------------
-- View structure for ob_sys_view
-- ----------------------------
DROP VIEW IF EXISTS `ob_sys_view`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ob_sys_view` AS select `ob_station`.`id` AS `id`,`ob_station`.`sid` AS `sid`,`ob_station`.`station_name` AS `station_name`,`ob_station`.`city_start` AS `city_start`,`ob_station`.`city_end` AS `city_end`,`ob_station`.`price` AS `price`,`ob_station`.`ticket_type` AS `ticket_type`,`ob_station`.`time_start` AS `time_start`,`ob_ticket`.`tid` AS `tid`,`ob_ticket`.`ticket_no` AS `ticket_no`,`ob_ticket`.`station_start` AS `station_start`,`ob_ticket`.`station_end` AS `station_end`,`ob_ticket`.`idcard` AS `idcard`,`ob_ticket`.`time_date` AS `time_date`,`ob_ticket`.`sit_type` AS `sit_type`,`ob_ticket`.`total_price` AS `total_price`,`ob_user`.`uid` AS `uid`,`ob_user`.`username` AS `username`,`ob_user`.`password` AS `password` from ((`ob_station` join `ob_ticket`) join `ob_user`) ;
