/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost
 Source Database       : pigxx

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : utf-8

 Date: 03/30/2019 12:29:01 PM
*/
USE pigxx;

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) DEFAULT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
--  Records of `sys_dept`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('1', '山东农信', null, '2018-01-22 19:00:23', '2018-09-13 01:46:29', '0', '0', '1'), ('2', '沙县国际', null, '2018-01-22 19:00:38', '2018-09-13 01:46:30', '0', '0', '1'), ('3', '潍坊农信', null, '2018-01-22 19:00:44', '2018-09-13 01:46:31', '0', '1', '1'), ('4', '高新农信', null, '2018-01-22 19:00:52', '2018-10-06 10:41:52', '0', '3', '1'), ('5', '院校农信', null, '2018-01-22 19:00:57', '2018-10-06 10:42:51', '0', '4', '1'), ('6', '潍院农信', null, '2018-01-22 19:01:06', '2019-01-09 10:58:18', '1', '5', '1'), ('7', '山东沙县', null, '2018-01-22 19:01:57', '2018-09-13 01:46:42', '0', '2', '1'), ('8', '潍坊沙县', null, '2018-01-22 19:02:03', '2018-09-13 01:46:43', '0', '7', '1'), ('9', '高新沙县', null, '2018-01-22 19:02:14', '2018-09-13 01:46:44', '1', '8', '1'), ('10', '租户2', null, '2018-11-18 13:27:11', '2018-11-18 13:42:19', '0', '0', '2'), ('11', '院校沙县', null, '2018-12-10 21:19:26', null, '0', '8', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dept_relation`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`) USING BTREE,
  KEY `idx1` (`ancestor`) USING BTREE,
  KEY `idx2` (`descendant`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
--  Records of `sys_dept_relation`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_relation` VALUES ('1', '1'), ('1', '3'), ('1', '4'), ('1', '5'), ('2', '2'), ('2', '7'), ('2', '8'), ('2', '11'), ('3', '3'), ('3', '4'), ('3', '5'), ('4', '4'), ('4', '5'), ('5', '5'), ('7', '7'), ('7', '8'), ('7', '11'), ('8', '8'), ('8', '11'), ('10', '10'), ('11', '11');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

-- ----------------------------
--  Records of `sys_dict`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1', 'log_type', '日志类型', '2019-03-19 11:06:44', '2019-03-19 11:06:44', '异常、正常', '0', '1'), ('2', 'social_type', '社交登录', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '微信、QQ', '0', '1'), ('3', 'leave_status', '请假状态', '2019-03-19 11:09:44', '2019-03-19 11:09:44', '未提交、审批中、完成、驳回', '0', '1'), ('4', 'job_type', '定时任务类型', '2019-03-19 11:22:21', '2019-03-19 11:22:21', 'quartz', '0', '1'), ('5', 'job_status', '定时任务状态', '2019-03-19 11:24:57', '2019-03-19 11:24:57', '发布状态、运行状态', '0', '1'), ('6', 'job_execute_status', '定时任务执行状态', '2019-03-19 11:26:15', '2019-03-19 11:26:15', '正常、异常', '0', '1'), ('7', 'misfire_policy', '定时任务错失执行策略', '2019-03-19 11:27:19', '2019-03-19 11:27:19', '周期', '0', '1'), ('8', 'gender', '性别', '2019-03-27 13:44:06', '2019-03-27 13:44:06', '微信用户性别', '0', '1'), ('9', 'subscribe', '订阅状态', '2019-03-27 13:48:33', '2019-03-27 13:48:33', '公众号订阅状态', '0', '1'), ('10', 'response_type', '回复', '2019-03-28 21:29:21', '2019-03-28 21:29:21', '微信消息是否已回复', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_dict_item`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` int(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(11) NOT NULL,
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` int(10) NOT NULL COMMENT '排序（升序）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典项';

-- ----------------------------
--  Records of `sys_dict_item`
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_item` VALUES ('1', '1', '9', '异常', 'log_type', '日志异常', '1', '2019-03-19 11:08:59', '2019-03-25 12:49:13', '', '0', '1'), ('2', '1', '0', '正常', 'log_type', '日志正常', '0', '2019-03-19 11:09:17', '2019-03-25 12:49:18', '', '0', '1'), ('3', '2', 'WX', '微信', 'social_type', '微信登录', '0', '2019-03-19 11:10:02', '2019-03-25 12:49:36', '', '0', '1'), ('4', '2', 'QQ', 'QQ', 'social_type', 'QQ登录', '1', '2019-03-19 11:10:14', '2019-03-25 12:49:36', '', '0', '1'), ('5', '3', '0', '未提交', 'leave_status', '未提交', '0', '2019-03-19 11:18:34', '2019-03-25 12:49:36', '', '0', '1'), ('6', '3', '1', '审批中', 'leave_status', '审批中', '1', '2019-03-19 11:18:45', '2019-03-25 12:49:36', '', '0', '1'), ('7', '3', '2', '完成', 'leave_status', '完成', '2', '2019-03-19 11:19:02', '2019-03-25 12:49:36', '', '0', '1'), ('8', '3', '9', '驳回', 'leave_status', '驳回', '9', '2019-03-19 11:19:20', '2019-03-25 12:49:36', '', '0', '1'), ('9', '4', '1', 'java类', 'job_type', 'java类', '1', '2019-03-19 11:22:37', '2019-03-25 12:49:36', '', '0', '1'), ('10', '4', '2', 'spring bean', 'job_type', 'spring bean容器实例', '2', '2019-03-19 11:23:05', '2019-03-25 12:49:36', '', '0', '1'), ('11', '4', '9', '其他', 'job_type', '其他类型', '9', '2019-03-19 11:23:31', '2019-03-25 12:49:36', '', '0', '1'), ('12', '4', '3', 'Rest 调用', 'job_type', 'Rest 调用', '3', '2019-03-19 11:23:57', '2019-03-25 12:49:36', '', '0', '1'), ('13', '4', '4', 'jar', 'job_type', 'jar类型', '4', '2019-03-19 11:24:20', '2019-03-25 12:49:36', '', '0', '1'), ('14', '5', '1', '未发布', 'job_status', '未发布', '1', '2019-03-19 11:25:18', '2019-03-25 12:49:36', '', '0', '1'), ('15', '5', '2', '运行中', 'job_status', '运行中', '2', '2019-03-19 11:25:31', '2019-03-25 12:49:36', '', '0', '1'), ('16', '5', '3', '暂停', 'job_status', '暂停', '3', '2019-03-19 11:25:42', '2019-03-25 12:49:36', '', '0', '1'), ('17', '6', '0', '正常', 'job_execute_status', '正常', '0', '2019-03-19 11:26:27', '2019-03-25 12:49:36', '', '0', '1'), ('18', '6', '1', '异常', 'job_execute_status', '异常', '1', '2019-03-19 11:26:41', '2019-03-25 12:49:36', '', '0', '1'), ('19', '7', '1', '错失周期立即执行', 'misfire_policy', '错失周期立即执行', '1', '2019-03-19 11:27:45', '2019-03-25 12:49:36', '', '0', '1'), ('20', '7', '2', '错失周期执行一次', 'misfire_policy', '错失周期执行一次', '2', '2019-03-19 11:27:57', '2019-03-25 12:49:36', '', '0', '1'), ('21', '7', '3', '下周期执行', 'misfire_policy', '下周期执行', '3', '2019-03-19 11:28:08', '2019-03-25 12:49:36', '', '0', '1'), ('22', '8', '1', '男', 'gender', '微信-男', '0', '2019-03-27 13:45:13', '2019-03-27 13:45:13', '微信-男', '0', '1'), ('23', '8', '2', '女', 'gender', '女-微信', '1', '2019-03-27 13:45:34', '2019-03-27 13:45:34', '女-微信', '0', '1'), ('24', '8', '0', '未知', 'gender', 'x性别未知', '3', '2019-03-27 13:45:57', '2019-03-27 13:45:57', 'x性别未知', '0', '1'), ('25', '9', '0', '未关注', 'subscribe', '公众号-未关注', '0', '2019-03-27 13:49:07', '2019-03-27 13:49:07', '公众号-未关注', '0', '1'), ('26', '9', '1', '已关注', 'subscribe', '公众号-已关注', '1', '2019-03-27 13:49:26', '2019-03-27 13:49:26', '公众号-已关注', '0', '1'), ('27', '10', '0', '未回复', 'response_type', '微信消息-未回复', '0', '2019-03-28 21:29:47', '2019-03-28 21:29:47', '微信消息-未回复', '0', '1'), ('28', '10', '1', '已回复', 'response_type', '微信消息-已回复', '1', '2019-03-28 21:30:08', '2019-03-28 21:30:08', '微信消息-已回复', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  `tenant_id` int(11) DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_log_create_by` (`create_by`) USING BTREE,
  KEY `sys_log_request_uri` (`request_uri`) USING BTREE,
  KEY `sys_log_type` (`type`) USING BTREE,
  KEY `sys_log_create_date` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
--  Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
--  Records of `sys_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES ('1000', '权限管理', null, '/upms', '-1', 'icon-quanxianguanli', 'Layout', '0', '0', '0', '2018-09-28 08:29:53', '2018-09-28 08:53:01', '0'), ('1100', '用户管理', null, 'user', '1000', 'icon-yonghuguanli', 'views/admin/user/index', '1', '1', '0', '2017-11-02 22:24:37', '2018-09-28 09:00:41', '0'), ('1101', '用户新增', 'sys_user_add', null, '1100', null, null, null, '0', '1', '2017-11-08 09:52:09', '2018-09-28 09:06:34', '0'), ('1102', '用户修改', 'sys_user_edit', null, '1100', null, null, null, '0', '1', '2017-11-08 09:52:48', '2018-09-28 09:06:37', '0'), ('1103', '用户删除', 'sys_user_del', null, '1100', null, null, null, '0', '1', '2017-11-08 09:54:01', '2018-09-28 09:06:42', '0'), ('1200', '菜单管理', null, 'menu', '1000', 'icon-caidanguanli', 'views/admin/menu/index', '2', '0', '0', '2017-11-08 09:57:27', '2018-09-28 09:00:45', '0'), ('1201', '菜单新增', 'sys_menu_add', null, '1200', null, null, null, '0', '1', '2017-11-08 10:15:53', '2018-09-28 09:07:16', '0'), ('1202', '菜单修改', 'sys_menu_edit', null, '1200', null, null, null, '0', '1', '2017-11-08 10:16:23', '2018-09-28 09:07:18', '0'), ('1203', '菜单删除', 'sys_menu_del', null, '1200', null, null, null, '0', '1', '2017-11-08 10:16:43', '2018-09-28 09:07:22', '0'), ('1300', '角色管理', null, 'role', '1000', 'icon-jiaoseguanli', 'views/admin/role/index', '3', '0', '0', '2017-11-08 10:13:37', '2018-09-28 09:00:48', '0'), ('1301', '角色新增', 'sys_role_add', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:18', '2018-09-28 09:07:46', '0'), ('1302', '角色修改', 'sys_role_edit', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:41', '2018-09-28 09:07:49', '0'), ('1303', '角色删除', 'sys_role_del', null, '1300', null, null, null, '0', '1', '2017-11-08 10:14:59', '2018-09-28 09:07:53', '0'), ('1304', '分配权限', 'sys_role_perm', null, '1300', null, null, null, '0', '1', '2018-04-20 07:22:55', '2018-09-28 09:13:23', '0'), ('1400', '部门管理', null, 'dept', '1000', 'icon-web-icon-', 'views/admin/dept/index', '4', '0', '0', '2018-01-20 13:17:19', '2018-12-09 16:35:12', '0'), ('1401', '部门新增', 'sys_dept_add', null, '1400', null, null, null, '0', '1', '2018-01-20 14:56:16', '2018-09-28 09:08:13', '0'), ('1402', '部门修改', 'sys_dept_edit', null, '1400', null, null, null, '0', '1', '2018-01-20 14:56:59', '2018-09-28 09:08:16', '0'), ('1403', '部门删除', 'sys_dept_del', null, '1400', null, null, null, '0', '1', '2018-01-20 14:57:28', '2018-09-28 09:08:18', '0'), ('2000', '系统管理', null, '/admin', '-1', 'icon-xitongguanli', 'Layout', '1', '0', '0', '2017-11-07 20:56:00', '2018-09-28 08:53:18', '0'), ('2100', '日志管理', null, 'log', '2000', 'icon-rizhiguanli', 'views/admin/log/index', '5', '0', '0', '2017-11-20 14:06:22', '2018-09-28 09:01:52', '0'), ('2101', '日志删除', 'sys_log_del', null, '2100', null, null, null, '0', '1', '2017-11-20 20:37:37', '2018-09-28 09:08:44', '0'), ('2200', '字典管理', null, 'dict', '2000', 'icon-navicon-zdgl', 'views/admin/dict/index', '6', '0', '0', '2017-11-29 11:30:52', '2018-09-28 09:01:47', '0'), ('2201', '字典删除', 'sys_dict_del', null, '2200', null, null, null, '0', '1', '2017-11-29 11:30:11', '2018-09-28 09:09:10', '0'), ('2202', '字典新增', 'sys_dict_add', null, '2200', null, null, null, '0', '1', '2018-05-11 22:34:55', '2018-09-28 09:09:12', '0'), ('2203', '字典修改', 'sys_dict_edit', null, '2200', null, null, null, '0', '1', '2018-05-11 22:36:03', '2018-09-28 09:09:16', '0'), ('2300', '代码生成', '', 'gen', '2000', 'icon-weibiaoti46', 'views/gen/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 05:21:01', '0'), ('2400', '终端管理', '', 'client', '2000', 'icon-shouji', 'views/admin/client/index', '9', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:43', '0'), ('2401', '客户端新增', 'sys_client_add', null, '2400', '1', null, null, '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:10:25', '0'), ('2402', '客户端修改', 'sys_client_edit', null, '2400', null, null, null, '0', '1', '2018-05-15 21:37:06', '2018-09-28 09:10:27', '0'), ('2403', '客户端删除', 'sys_client_del', null, '2400', null, null, null, '0', '1', '2018-05-15 21:39:16', '2018-09-28 09:10:30', '0'), ('2500', '密钥管理', '', 'social', '2000', 'icon-miyue', 'views/admin/social/index', '10', '0', '0', '2018-01-20 13:17:19', '2018-09-28 09:01:41', '0'), ('2501', '密钥新增', 'sys_social_details_add', null, '2500', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:52:18', '0'), ('2502', '密钥修改', 'sys_social_details_edit', null, '2500', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:36', '0'), ('2503', '密钥删除', 'sys_social_details_del', null, '2500', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:51:30', '0'), ('2600', '令牌管理', null, 'token', '2000', 'icon-denglvlingpai', 'views/admin/token/index', '11', '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0'), ('2601', '令牌删除', 'sys_token_del', null, '2600', null, null, '1', '0', '1', '2018-09-04 05:59:50', '2018-09-28 09:11:24', '0'), ('2700', '动态路由', null, 'route', '2000', 'icon-luyou', 'views/admin/route/index', '12', '0', '0', '2018-09-04 05:58:41', '2018-09-28 09:01:38', '0'), ('2800', 'Quartz管理', '', 'job-manage', '2000', 'icon-guanwangfangwen', 'views/daemon/job-manage/index', '8', '0', '0', '2018-01-20 13:17:19', '2019-03-25 13:52:14', '0'), ('2810', '任务新增', 'job_sys_job_add', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:23', '0'), ('2820', '任务修改', 'job_sys_job_edit', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:26', '0'), ('2830', '任务删除', 'job_sys_job_del', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:30', '0'), ('2840', '任务暂停', 'job_sys_job_shutdown_job', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:18', '0'), ('2850', '任务开始', 'job_sys_job_start_job', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:35', '0'), ('2860', '任务刷新', 'job_sys_job_refresh_job', null, '2800', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2019-03-25 11:50:39', '0'), ('3000', '系统监控', null, '/daemon', '-1', 'icon-msnui-supervise', 'Layout', '2', '0', '0', '2018-07-27 01:13:21', '2018-09-28 08:53:24', '0'), ('3100', '服务监控', null, 'https://monitor.pig4cloud.com', '3000', 'icon-server', null, '0', '0', '0', '2018-06-26 10:50:32', '2018-12-11 17:17:07', '0'), ('3200', '接口文档', null, 'https://swagger.pig4cloud.com/swagger-ui.html', '3000', 'icon-wendang', null, '1', '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:05:16', '0'), ('3300', '事务监控', null, 'tx', '3000', 'icon-gtsquanjushiwufuwuGTS', 'views/tx/index', '5', '0', '0', '2018-08-19 11:02:39', '2018-11-23 14:25:08', '0'), ('3400', '在线事务', null, 'model', '3000', 'icon-online', 'views/tx/model', '6', '0', '0', '2018-08-19 11:32:04', '2018-11-23 14:25:14', '0'), ('3500', '任务监控', null, 'https://task.pig4cloud.com', '3000', 'icon-msnui-supervise', null, '7', '0', '0', '2018-06-26 10:50:32', '2018-09-28 09:03:33', '0'), ('3600', '任务轨迹', '', 'status-trace-log', '3000', 'icon-guiji', 'views/daemon/status-trace-log/index', '8', '0', '0', '2018-01-20 13:17:19', '2018-11-24 06:34:52', '0'), ('3601', '删除轨迹', 'daemon_status_trace_log_del', null, '3600', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:31:06', '0'), ('3620', 'Quartz日志', '', 'joblog', '3000', 'icon-gtsquanjushiwufuwuGTS', 'views/daemon/job-log/index', '8', '0', '0', '2018-01-20 13:17:19', '2019-03-25 11:49:36', '0'), ('3630', '任务日志', '', 'execution-log', '3000', 'icon-wendang', 'views/daemon/execution-log/index', '7', '0', '0', '2018-01-20 13:17:19', '2019-03-30 09:30:33', '0'), ('3631', '删除日志', 'daemon_execution_log_del', null, '3900', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2019-03-30 09:30:45', '0'), ('3700', '调用拓扑', null, 'https://zipkin.pig4cloud.com', '3000', 'icon-line', null, '10', '0', '0', '2018-01-25 11:08:52', '2018-09-28 09:04:29', '0'), ('3800', '缓存状态', null, 'https://cache.pig4cloud.com', '3000', 'icon-qingchuhuancun', null, '12', '0', '0', '2018-01-23 10:56:11', '2018-09-28 09:13:56', '0'), ('4000', '协同管理', null, '/activti', '-1', 'icon-kuaisugongzuoliu_o', 'Layout', '3', '0', '0', '2018-09-26 01:38:13', '2018-09-28 08:58:24', '0'), ('4100', '模型管理', null, 'activiti', '4000', 'icon-weibiaoti13', 'views/activiti/index', '1', '0', '0', '2018-09-26 01:39:07', '2018-12-09 16:35:16', '0'), ('4101', '模型管理', 'act_model_manage', null, '4100', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4200', '流程管理', null, 'process', '4000', 'icon-liucheng', 'views/activiti/process', '2', '0', '0', '2018-09-26 06:41:05', '2018-11-23 14:25:33', '0'), ('4201', '流程管理', 'act_process_manage', null, '4200', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4300', '请假管理', '', 'leave-bill', '4000', 'icon-qingjia', 'views/activiti/leave', '3', '0', '0', '2018-01-20 13:17:19', '2019-03-25 13:52:10', '0'), ('4301', '请假新增', 'act_leavebill_add', null, '4300', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('4302', '请假修改', 'act_leavebill_edit', null, '4300', '1', null, '1', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:09', '0'), ('4303', '请假删除', 'act_leavebill_del', null, '4300', '1', null, '2', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:14', '0'), ('4400', '待办任务', null, 'task', '4000', 'icon-renwu', 'views/activiti/task', '4', '0', '0', '2018-09-27 09:52:31', '2018-12-09 16:35:26', '0'), ('4401', '流程管理', 'act_task_manage', null, '4400', '1', null, '0', '0', '1', '2018-05-15 21:35:18', '2018-09-28 09:12:07', '0'), ('9999', '系统官网', null, 'https://pig4cloud.com/#', '-1', 'icon-guanwangfangwen', null, '9', '0', '0', '2019-01-17 17:05:19', '2019-01-17 17:29:06', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_oauth_client_details`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(32) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
--  Records of `sys_oauth_client_details`
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_details` VALUES ('app', null, 'app', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('daemon', null, 'daemon', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('gen', null, 'gen', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1'), ('pig', null, 'pig', 'server', 'password,refresh_token,authorization_code,client_credentials', 'http://localhost:4040/sso1/login,http://localhost:4041/sso1/login', null, null, null, null, 'true', '1'), ('test', null, 'test', 'server', 'password,refresh_token', null, null, null, null, null, 'true', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_code` varchar(64) COLLATE utf8mb4_bin NOT NULL,
  `role_desc` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ds_type` char(1) COLLATE utf8mb4_bin NOT NULL DEFAULT '2' COMMENT '数据权限类型',
  `ds_scope` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据权限范围',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `tenant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE KEY `role_idx1_role_code` (`role_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
--  Records of `sys_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('1', '管理员', 'ROLE_ADMIN', '管理员', '0', '2', '2017-10-29 15:45:51', '2018-12-26 14:09:11', '0', '1'), ('2', 'ROLE_CQQ', 'ROLE_CQQ', 'ROLE_CQQ', '2', null, '2018-11-11 19:42:26', '2018-12-26 14:09:07', '0', '2');
COMMIT;

-- ----------------------------
--  Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
--  Records of `sys_role_menu`
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES ('1', '1000'), ('1', '1100'), ('1', '1101'), ('1', '1102'), ('1', '1103'), ('1', '1200'), ('1', '1201'), ('1', '1202'), ('1', '1203'), ('1', '1300'), ('1', '1301'), ('1', '1302'), ('1', '1303'), ('1', '1304'), ('1', '1400'), ('1', '1401'), ('1', '1402'), ('1', '1403'), ('1', '2000'), ('1', '2100'), ('1', '2101'), ('1', '2200'), ('1', '2201'), ('1', '2202'), ('1', '2203'), ('1', '2300'), ('1', '2400'), ('1', '2401'), ('1', '2402'), ('1', '2403'), ('1', '2500'), ('1', '2501'), ('1', '2502'), ('1', '2503'), ('1', '2600'), ('1', '2601'), ('1', '2700'), ('1', '2800'), ('1', '2810'), ('1', '2820'), ('1', '2830'), ('1', '2840'), ('1', '2850'), ('1', '2860'), ('1', '3000'), ('1', '3100'), ('1', '3200'), ('1', '3300'), ('1', '3400'), ('1', '3500'), ('1', '3600'), ('1', '3601'), ('1', '3620'), ('1', '3630'), ('1', '3631'), ('1', '3700'), ('1', '3800'), ('1', '4000'), ('1', '4100'), ('1', '4101'), ('1', '4200'), ('1', '4201'), ('1', '4300'), ('1', '4301'), ('1', '4302'), ('1', '4303'), ('1', '4400'), ('1', '4401'), ('1', '9999'), ('2', '1000'), ('2', '1100'), ('2', '1101'), ('2', '1102'), ('2', '1103'), ('2', '1200'), ('2', '1201'), ('2', '1202'), ('2', '1203'), ('2', '1300'), ('2', '1301'), ('2', '1302'), ('2', '1303'), ('2', '1304'), ('2', '1400'), ('2', '1401'), ('2', '1402'), ('2', '1403');
COMMIT;

-- ----------------------------
--  Table structure for `sys_route_conf`
-- ----------------------------
DROP TABLE IF EXISTS `sys_route_conf`;
CREATE TABLE `sys_route_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `route_name` varchar(30) DEFAULT NULL COMMENT '路由名称',
  `route_id` varchar(30) NOT NULL DEFAULT '' COMMENT '路由ID',
  `predicates` json DEFAULT NULL COMMENT '断言',
  `filters` json DEFAULT NULL COMMENT '过滤器',
  `uri` varchar(50) DEFAULT NULL,
  `order` int(2) DEFAULT '0' COMMENT '排序',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='路由配置表';

-- ----------------------------
--  Records of `sys_route_conf`
-- ----------------------------
BEGIN;
INSERT INTO `sys_route_conf` VALUES ('1', '工作流管理模块', 'pigx-activiti', '[{\"args\": {\"_genkey_0\": \"/act/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-03-26 22:46:09', '2019-03-26 22:47:46', '0'), ('2', '认证中心', 'pigx-auth', '[{\"args\": {\"_genkey_0\": \"/auth/**\"}, \"name\": \"Path\"}]', '[{\"args\": {}, \"name\": \"ValidateCodeGatewayFilter\"}, {\"args\": {}, \"name\": \"PasswordDecoderFilter\"}]', 'lb://pigx-auth', '0', '2019-03-26 22:46:09', '2019-03-26 22:47:48', '0'), ('3', '代码生成模块', 'pigx-codegen', '[{\"args\": {\"_genkey_0\": \"/gen/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-codegen', '0', '2019-03-26 22:46:09', '2019-03-26 22:47:52', '0'), ('4', 'elastic-job定时任务模块', 'pigx-daemon-elastic-job', '[{\"args\": {\"_genkey_0\": \"/daemon/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-elastic-job', '0', '2019-03-26 22:46:09', '2019-03-26 22:47:59', '0'), ('5', 'quartz定时任务模块', 'pigx-daemon-quartz', '[{\"args\": {\"_genkey_0\": \"/job/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-daemon-quartz', '0', '2019-03-26 22:46:09', '2019-03-26 22:48:02', '0'), ('6', '分布式事务模块', 'pigx-tx-manager', '[{\"args\": {\"_genkey_0\": \"/tx/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-tx-manager', '0', '2019-03-26 22:46:09', '2019-03-26 22:48:04', '0'), ('7', '通用权限模块', 'pigx-upms-biz', '[{\"args\": {\"_genkey_0\": \"/admin/**\"}, \"name\": \"Path\"}]', '[{\"args\": {\"key-resolver\": \"#{@remoteAddrKeyResolver}\", \"redis-rate-limiter.burstCapacity\": \"20\", \"redis-rate-limiter.replenishRate\": \"10\"}, \"name\": \"RequestRateLimiter\"}, {\"args\": {\"name\": \"default\", \"fallbackUri\": \"forward:/fallback\"}, \"name\": \"Hystrix\"}]', 'lb://pigx-upms-biz', '0', '2019-03-26 22:46:09', '2019-03-26 22:48:07', '0'), ('8', '工作流长链接支持1', 'pigx-activiti-ws-1', '[{\"args\": {\"_genkey_0\": \"/act/ws/info/**\"}, \"name\": \"Path\"}]', '[]', 'lb://pigx-activiti', '0', '2019-03-26 22:46:09', '2019-03-26 22:48:10', '0'), ('9', '工作流长链接支持2', 'pigx-activiti-ws-2', '[{\"args\": {\"_genkey_0\": \"/act/ws/**\"}, \"name\": \"Path\"}]', '[]', 'lb:ws://pigx-activiti', '100', '2019-03-26 22:46:09', '2019-03-26 22:48:13', '0');
COMMIT;

-- ----------------------------
--  Table structure for `sys_social_details`
-- ----------------------------
DROP TABLE IF EXISTS `sys_social_details`;
CREATE TABLE `sys_social_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主鍵',
  `type` varchar(16) NOT NULL COMMENT '类型',
  `remark` varchar(64) DEFAULT NULL COMMENT '描述',
  `app_id` varchar(64) NOT NULL COMMENT 'appid',
  `app_secret` varchar(64) NOT NULL COMMENT 'app_secret',
  `redirect_url` varchar(128) DEFAULT NULL COMMENT '回调地址',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统社交登录账号表';

-- ----------------------------
--  Records of `sys_social_details`
-- ----------------------------
BEGIN;
INSERT INTO `sys_social_details` VALUES ('1', 'WX', '微信互联参数', 'wxd1678d3f83b1d83a', '6ddb043f94da5d2172926abe8533504f', 'daoweicloud.com', '2018-08-16 14:24:25', '2019-03-02 09:43:13', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `salt` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `lock_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，9-锁定',
  `del_flag` char(1) COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0-正常，1-删除',
  `wx_openid` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '微信openid',
  `qq_openid` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'QQ openid',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属租户',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `user_wx_openid` (`wx_openid`) USING BTREE,
  KEY `user_qq_openid` (`qq_openid`) USING BTREE,
  KEY `user_idx1_username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
--  Records of `sys_user`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1', 'admin', '$2a$10$QOfWxxFyAMmEEmnuw9UI/..1s4B4eF/u9PzE2ZaGO.ij9YfmcUy.u', '', '17034642889', 'lengleng-6f69b3917f1a47c58e805e3f0f33894c.jpeg', '1', '2018-04-20 07:15:18', '2019-03-30 08:23:55', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', null, '1'), ('2', 'admin', '$2a$10$RpFJjxYiXdEsAGnWp/8fsOetMuOON96Ntk/Ym2M/RKRyU0GZseaDC', null, '17034642887', 'lengleng-6f69b3917f1a47c58e805e3f0f33894c.jpeg', '10', '2018-04-20 07:15:18', '2019-01-09 11:06:24', '0', '0', 'o_0FT0uyg_H1vVy2H0JpSwlVGhWQ', null, '2');
COMMIT;

-- ----------------------------
--  Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
--  Records of `sys_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('1', '1'), ('2', '2');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
