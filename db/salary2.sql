/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 127.0.0.1:3306
 Source Schema         : salary

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 19/05/2024 09:46:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for holiday_config
-- ----------------------------
DROP TABLE IF EXISTS `holiday_config`;
CREATE TABLE `holiday_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `configTime` datetime DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of holiday_config
-- ----------------------------
BEGIN;
INSERT INTO `holiday_config` VALUES (1, '2024-01-01 00:00:00', '1', '2024-05-13 11:45:53', '2024-05-13 11:45:56');
INSERT INTO `holiday_config` VALUES (2, '2024-02-04 00:00:00', '-1', '2024-05-13 11:46:08', '2024-05-13 11:46:16');
INSERT INTO `holiday_config` VALUES (3, '2024-02-12 00:00:00', '1', '2024-05-13 11:46:28', '2024-05-13 11:46:32');
INSERT INTO `holiday_config` VALUES (4, '2024-02-13 00:00:00', '1', '2024-05-13 11:46:38', '2024-05-13 11:46:38');
INSERT INTO `holiday_config` VALUES (5, '2024-02-14 00:00:00', '1', '2024-05-13 11:46:43', '2024-05-13 11:46:43');
INSERT INTO `holiday_config` VALUES (6, '2024-02-15 00:00:00', '1', '2024-05-13 11:46:45', '2024-05-13 11:46:49');
INSERT INTO `holiday_config` VALUES (7, '2024-02-16 00:00:00', '1', '2024-05-13 11:46:54', '2024-05-13 11:46:54');
INSERT INTO `holiday_config` VALUES (8, '2024-02-18 00:00:00', '-1', '2024-05-13 11:47:03', '2024-05-13 11:47:03');
INSERT INTO `holiday_config` VALUES (9, '2024-04-04 00:00:00', '1', '2024-05-13 11:47:22', '2024-05-13 11:47:22');
INSERT INTO `holiday_config` VALUES (10, '2024-04-05 00:00:00', '1', '2024-05-13 11:47:29', '2024-05-13 11:47:29');
INSERT INTO `holiday_config` VALUES (11, '2024-04-07 00:00:00', '-1', '2024-05-13 11:47:37', '2024-05-13 11:47:42');
INSERT INTO `holiday_config` VALUES (12, '2024-04-28 00:00:00', '-1', '2024-05-13 11:47:52', '2024-05-13 11:47:52');
INSERT INTO `holiday_config` VALUES (13, '2024-05-01 00:00:00', '1', '2024-05-13 11:48:04', '2024-05-13 11:48:04');
INSERT INTO `holiday_config` VALUES (14, '2024-05-02 00:00:00', '1', '2024-05-13 11:48:11', '2024-05-13 11:48:11');
INSERT INTO `holiday_config` VALUES (15, '2024-05-03 00:00:00', '1', '2024-05-13 11:48:17', '2024-05-13 11:48:17');
INSERT INTO `holiday_config` VALUES (16, '2024-05-11 00:00:00', '-1', '2024-05-13 11:48:35', '2024-05-13 11:48:35');
INSERT INTO `holiday_config` VALUES (17, '2024-06-10 00:00:00', '1', '2024-05-13 11:48:47', '2024-05-13 11:48:47');
INSERT INTO `holiday_config` VALUES (18, '2024-09-14 00:00:00', '-1', '2024-05-13 11:49:03', '2024-05-13 11:49:03');
INSERT INTO `holiday_config` VALUES (19, '2024-09-16 00:00:00', '1', '2024-05-13 11:49:07', '2024-05-13 11:49:12');
INSERT INTO `holiday_config` VALUES (20, '2024-09-17 00:00:00', '1', '2024-05-13 11:49:16', '2024-05-13 11:49:16');
INSERT INTO `holiday_config` VALUES (21, '2024-09-29 00:00:00', '-1', '2024-05-13 11:49:26', '2024-05-13 11:49:26');
INSERT INTO `holiday_config` VALUES (22, '2024-10-01 00:00:00', '1', '2024-05-13 11:49:38', '2024-05-13 11:49:38');
INSERT INTO `holiday_config` VALUES (23, '2024-10-02 00:00:00', '1', '2024-05-13 11:49:45', '2024-05-13 11:49:45');
INSERT INTO `holiday_config` VALUES (24, '2024-10-03 00:00:00', '1', '2024-05-13 11:49:50', '2024-05-13 11:49:50');
INSERT INTO `holiday_config` VALUES (25, '2024-10-04 00:00:00', '1', '2024-05-13 11:49:56', '2024-05-13 11:49:56');
INSERT INTO `holiday_config` VALUES (26, '2024-10-12 00:00:00', '-1', '2024-05-13 11:50:08', '2024-05-13 11:50:08');
COMMIT;

-- ----------------------------
-- Table structure for holiday_manage
-- ----------------------------
DROP TABLE IF EXISTS `holiday_manage`;
CREATE TABLE `holiday_manage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `holidayStartTime` datetime DEFAULT NULL,
  `holidayEndTime` datetime DEFAULT NULL,
  `approval` int(11) DEFAULT '0',
  `holidayDurationMinutes` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of holiday_manage
-- ----------------------------
BEGIN;
INSERT INTO `holiday_manage` VALUES (17, 50, '2024-05-17 09:00:00', '2024-05-21 17:00:00', 0, 24, '2024-05-13 14:06:34', '2024-05-13 14:06:34');
INSERT INTO `holiday_manage` VALUES (18, 50, '2024-06-05 15:00:00', '2024-06-12 16:00:00', 0, 41, '2024-05-13 14:07:11', '2024-05-13 14:07:11');
INSERT INTO `holiday_manage` VALUES (19, 50, '2024-05-17 09:00:00', '2024-05-20 17:00:00', 0, 960, '2024-05-16 19:45:20', '2024-05-16 19:45:20');
INSERT INTO `holiday_manage` VALUES (20, 50, '2024-05-24 16:00:00', '2024-05-27 11:00:00', 0, 180, '2024-05-16 19:45:40', '2024-05-16 19:45:40');
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `icon` varchar(64) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (2, '/', '/home', 0, '用户管理', 'el-icon-user-solid', 1, 1);
INSERT INTO `menu` VALUES (3, '/', '/home', 0, '权限管理', 'el-icon-s-platform', 1, 1);
INSERT INTO `menu` VALUES (6, '/employee/userList/**', '/userList', 1, '用户列表', 'el-icon-menu', 2, 1);
INSERT INTO `menu` VALUES (7, '/staff/roleList/**', '/roleList', 1, '角色列表', 'el-icon-menu', 3, 1);
INSERT INTO `menu` VALUES (11, '/employee/updateEnabled/**', '/userList', 2, '更改用户状态', NULL, 6, 1);
INSERT INTO `menu` VALUES (12, '/employee/addUser/**', '/userList', 2, '添加用户', NULL, 6, 0);
INSERT INTO `menu` VALUES (13, '/employee/updateUser/**', '/userList', 2, '更改用户', NULL, 6, 0);
INSERT INTO `menu` VALUES (15, '/staff/addRole/**', '/roleList', 2, '添加角色', NULL, 7, 1);
INSERT INTO `menu` VALUES (17, '/staff/deleteRole/**', '/roleList', 2, '删除角色', NULL, 7, 0);
INSERT INTO `menu` VALUES (18, '/employee/allRole/**', '/userList', 2, '分配角色', NULL, 6, 0);
INSERT INTO `menu` VALUES (19, '/staff/deletePow/**', '/roleList', 2, '删除角色权限', NULL, 7, 0);
INSERT INTO `menu` VALUES (20, '/staff/assPow/**', '/roleList', 2, '分配权限', NULL, 7, 0);
INSERT INTO `menu` VALUES (21, '/staff/changeMenuEnable/**', '/powList', 2, '菜单状态', NULL, 8, 1);
INSERT INTO `menu` VALUES (22, '/staff/addPow/**', '/powList', 2, '添加权限（菜单）', NULL, 8, 0);
INSERT INTO `menu` VALUES (25, '/staff/editPow/**', '/powList', 2, '修改权限', NULL, 8, 0);
INSERT INTO `menu` VALUES (27, '/staff/deletePow/**', '/powList', 2, '删除权限', NULL, 8, 0);
INSERT INTO `menu` VALUES (30, '/system/druidSql/**', '/systemSql', 2, '日志记录', NULL, 29, 1);
INSERT INTO `menu` VALUES (98, '/salary/list/**', '/salaryList', 0, '薪资管理', 'el-icon-s-platform', 1, 1);
INSERT INTO `menu` VALUES (99, '/salary/detail', '/salaryDetail', 1, '薪资详情', NULL, 98, 1);
INSERT INTO `menu` VALUES (100, '/salary/list', '/salaryList', 1, '薪资列表', NULL, 98, 1);
INSERT INTO `menu` VALUES (101, '/salary/mySalary', '/mySalary', 1, '我的薪资', NULL, 98, 1);
INSERT INTO `menu` VALUES (102, '/holiday/list/**', '/holiday', 0, '假期管理', 'el-icon-s-platform', 1, 1);
INSERT INTO `menu` VALUES (103, '/holiday/list', '/holidayList', 1, '我的假期', NULL, 102, 1);
INSERT INTO `menu` VALUES (104, '/holiday/manage', '/manageHoliday', 1, '假期管理', NULL, 102, 1);
COMMIT;

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `dm` (`mid`) USING BTREE,
  KEY `dr` (`rid`) USING BTREE,
  CONSTRAINT `dm` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dr` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=829 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
BEGIN;
INSERT INTO `menu_role` VALUES (803, 98, 1);
INSERT INTO `menu_role` VALUES (804, 99, 1);
INSERT INTO `menu_role` VALUES (805, 100, 1);
INSERT INTO `menu_role` VALUES (806, 2, 1);
INSERT INTO `menu_role` VALUES (807, 6, 1);
INSERT INTO `menu_role` VALUES (808, 3, 1);
INSERT INTO `menu_role` VALUES (809, 7, 1);
INSERT INTO `menu_role` VALUES (810, 99, 2);
INSERT INTO `menu_role` VALUES (811, 98, 2);
INSERT INTO `menu_role` VALUES (812, 98, 15);
INSERT INTO `menu_role` VALUES (813, 99, 15);
INSERT INTO `menu_role` VALUES (814, 100, 15);
INSERT INTO `menu_role` VALUES (815, 2, 15);
INSERT INTO `menu_role` VALUES (816, 6, 15);
INSERT INTO `menu_role` VALUES (817, 101, 1);
INSERT INTO `menu_role` VALUES (818, 101, 2);
INSERT INTO `menu_role` VALUES (819, 101, 15);
INSERT INTO `menu_role` VALUES (820, 102, 1);
INSERT INTO `menu_role` VALUES (821, 102, 2);
INSERT INTO `menu_role` VALUES (822, 102, 15);
INSERT INTO `menu_role` VALUES (823, 103, 15);
INSERT INTO `menu_role` VALUES (824, 104, 1);
INSERT INTO `menu_role` VALUES (825, 104, 1);
INSERT INTO `menu_role` VALUES (826, 102, 2);
INSERT INTO `menu_role` VALUES (827, 103, 2);
INSERT INTO `menu_role` VALUES (828, 102, 1);
COMMIT;

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `nameZh` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `nameZh` (`nameZh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'ROLE_admin', '系统管理员', '拥有管理系统的权力');
INSERT INTO `role` VALUES (2, 'ROLE_manager', '员工', '员工拥有的查看权限');
INSERT INTO `role` VALUES (15, 'ROLE_HRS', '人力资源', '人力资源的一般权限，管理用户数据');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `roleName` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `payDuration` bigint(20) DEFAULT NULL,
  `payUnit` varchar(255) DEFAULT NULL,
  `lastPayTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `nextPayTime` datetime DEFAULT NULL,
  `salaryEnabled` tinyint(1) DEFAULT '0',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '管理员', '18211111111', 'pqz@163.com', '超级管理员', 1, 'admin', '$2a$10$o2NUWiYOX3Iiz/Cgj9nhweSm20ubCtVet9YIKa3teE.RFso5.PwsS', '786f3bf3-bb0a-453e-9973-d6e19e031bc7', NULL, 99999.00, 99999, 'DAYS', '2024-05-17 10:41:00', '2407-09-06 10:41:00', 1, '2020-04-29 14:54:24', '2024-05-16 19:49:48');
INSERT INTO `user` VALUES (50, '小张同学', '18211111117', '123@123.com', '员工', 1, 'test2', '$2a$10$o2NUWiYOX3Iiz/Cgj9nhweSm20ubCtVet9YIKa3teE.RFso5.PwsS', NULL, '', 5000.00, 470, 'MINUTES', '2024-05-17 10:41:00', '2024-05-20 10:31:00', 1, '2024-04-29 17:23:27', '2024-05-17 10:35:02');
INSERT INTO `user` VALUES (52, '胡歌', '18211111112', '123@123.com', '人力资源', 1, 'huge', '$2a$10$vI4jUKas1KPHnaYmwcwI.ebKqKN56E5HL5Osj/ekDgiZG733rS3p6', NULL, '', 3000.00, 1, 'MINUTES', '2024-05-17 17:00:00', '2024-05-20 09:01:00', 1, '2024-05-08 14:33:48', '2024-05-17 10:38:01');
INSERT INTO `user` VALUES (53, '小茗同学', '18211111113', '1234@123.com', '员工', 1, 'luko', '$2a$10$llzlwvX18FJUDdqnh5I.N.oNoguZq/m7INShVbLuVVIk6nOyUQ0O6', NULL, '', 5000.00, 120, 'MINUTES', '2024-05-17 15:24:00', '2024-05-20 09:24:00', 1, '2024-05-08 17:44:21', '2024-05-17 13:24:13');
INSERT INTO `user` VALUES (55, '小王同学', '18211111118', '1234@qq.com', '员工', 1, 'xiaowang', '$2a$10$PkCwY637nB09F1QRGNbxJuEQFwzMPW/i2Twppy0j8.Rxk5gmpb9V.', NULL, '', 10000.00, 7, 'DAYS', '2024-05-17 10:38:00', '2024-05-28 10:38:00', 0, '2024-05-11 13:51:19', '2024-05-17 10:37:53');
INSERT INTO `user` VALUES (56, 'xiaohei', '18211111119', '12345@qq.com', '员工', 1, '小黑同学', '$2a$10$d0qQQLmqrR9c1HWpg.khv.8/gKFczeSahvTmFJ8GO/L4BghTBDsAe', NULL, '', 3000.00, 3, 'MINUTES', '2024-05-17 16:59:00', '2024-05-20 09:02:00', 1, '2024-05-11 15:59:48', '2024-05-17 10:37:47');
INSERT INTO `user` VALUES (57, '小亮同学', '18211111120', '123@sda.com', '员工', 1, 'xiaoliang', '$2a$10$GbID8FfGPnwZKb4wcNjGD.DlG5jpCg1fxUH11F3jzmms.rFtGHTX.', NULL, '', 6000.00, 5, 'MINUTES', '2024-05-17 16:59:00', '2024-05-20 09:04:00', 1, '2024-05-11 16:01:37', '2024-05-17 10:37:58');
COMMIT;

-- ----------------------------
-- Table structure for user_contract
-- ----------------------------
DROP TABLE IF EXISTS `user_contract`;
CREATE TABLE `user_contract` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint(20) NOT NULL,
  `mnemonic` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contractName` varchar(255) DEFAULT NULL,
  `contractAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_contract
-- ----------------------------
BEGIN;
INSERT INTO `user_contract` VALUES (1, 50, 'disease zebra poet chimney wedding employ electric attack food drive clown cannon', 'XVmqoSCjC9h9jAzmyVAwkDwP7KrYQt6Pg', '6585493221995906', '4E84DA26873F72A8CD15099018541E47588375FB');
INSERT INTO `user_contract` VALUES (3, 52, 'trim where harsh bar orphan during above pull ring oblige march canoe', 'irpYS3y5zgNjxSp9M1KudHz1Hy7kDqdHW', '0405722112908817', 'CB2939AB15E8644F4CFE6B74CB50CD9F4C499A49');
INSERT INTO `user_contract` VALUES (4, 1, 'doctor cereal grab guitar fruit test insane safe reason junk secret cancel', 'YGnjcuqAws6Graz2cDXcPrLrftiFGJt9s', '2459569381950088', '570850F40138317C8F184BC8D8D99B199817A1AD');
INSERT INTO `user_contract` VALUES (5, 53, 'maximum surge width stem luggage valve man onion egg hidden inject canyon', 'YE9XnatjVxidDFoZXWSFub9Th1U7m3SKL', '0170567871371705', '56886D8DEDF9D2F065CDEB5AC42AE582A86F9B91');
INSERT INTO `user_contract` VALUES (6, 55, 'knee tool quick melt maple above behind siren grape law other cannon', 'T14QbuzMDnsPQ4iJvpLVysLhuX3QDP3pn', '9006576309751043', '1D361D456A13556C2194745F2FD38BC8D87A99D6');
INSERT INTO `user_contract` VALUES (7, 56, 'exhibit topic lizard proud flee they govern input blossom armed inform calm', 'Xx8PRfvVgeAWKS3UA71fomdwGSQXkamEW', '8152296056398931', '5380D145D4D5ABB3594072B76387E8901856B28A');
INSERT INTO `user_contract` VALUES (8, 57, 'outdoor legend add blouse canoe word artwork fire mango much wish canal', 'Wimz7Uiv3wPKqWX73ckju9SqssJd1cT1p', '8869558301910376', '460240E47A42C56EF17E5FC9C10046042C9CA79C');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `deu` (`uid`) USING BTREE,
  KEY `der` (`rid`) USING BTREE,
  CONSTRAINT `der` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deu` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (47, 50, 2);
INSERT INTO `user_role` VALUES (48, 52, 15);
INSERT INTO `user_role` VALUES (49, 53, 2);
INSERT INTO `user_role` VALUES (50, 55, 2);
INSERT INTO `user_role` VALUES (51, 56, 2);
INSERT INTO `user_role` VALUES (52, 57, 2);
COMMIT;

-- ----------------------------
-- Table structure for user_salary_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_salary_detail`;
CREATE TABLE `user_salary_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `shouldSalary` decimal(10,2) DEFAULT NULL,
  `actualSalary` decimal(10,2) DEFAULT NULL,
  `hashId` varchar(255) DEFAULT NULL,
  `shouldDuration` bigint(20) DEFAULT NULL,
  `actualDuration` bigint(20) DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=657 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_salary_detail
-- ----------------------------
BEGIN;
INSERT INTO `user_salary_detail` VALUES (200, 50, 1539.00, 1539.00, '1c85ddf5-0448-4aa2-93a6-1fce22b73e87', 3078, 3078, '2024-05-16 20:19:13', '2024-05-16 20:19:13');
INSERT INTO `user_salary_detail` VALUES (201, 50, 1439.39, 1439.39, '25cc6591-b392-4043-88ae-3dfd02f284ee', 2902, 2902, '2024-05-16 20:22:41', '2024-05-16 20:22:41');
INSERT INTO `user_salary_detail` VALUES (202, 50, 1428.48, 1428.48, 'ad0560cf-b758-41d7-a8e2-57d5e41b38a6', 2880, 2880, '2024-05-16 20:25:43', '2024-05-16 20:25:43');
INSERT INTO `user_salary_detail` VALUES (203, 1, 30872.60, 30872.60, '3ea1b618-568d-4d98-8de7-0387c78aa9a3', 3112, 3112, '2024-05-17 10:27:00', '2024-05-17 10:27:00');
INSERT INTO `user_salary_detail` VALUES (204, 52, 92.74, 92.74, '36514ee6-f158-4aed-a34e-2e2471744b20', 3112, 3112, '2024-05-17 10:27:01', '2024-05-17 10:27:01');
INSERT INTO `user_salary_detail` VALUES (205, 53, 144.93, 144.93, '369fd463-37f6-41d3-8125-83f861441ee7', 2922, 2922, '2024-05-17 10:27:01', '2024-05-17 10:27:01');
INSERT INTO `user_salary_detail` VALUES (206, 55, 19.35, 19.35, '4771dd34-2a69-4073-888c-afd88339ae6b', 1955, 1955, '2024-05-17 10:27:01', '2024-05-17 10:27:01');
INSERT INTO `user_salary_detail` VALUES (207, 56, 58.02, 58.02, '39fd5c78-1b20-46f6-919c-e9dd2227c252', 1947, 1947, '2024-05-17 10:27:01', '2024-05-17 10:27:01');
INSERT INTO `user_salary_detail` VALUES (208, 57, 59.75, 59.75, 'cfa7405b-c9e6-4aea-a0b9-42b53d32dae1', 2005, 2005, '2024-05-17 10:27:01', '2024-05-17 10:27:01');
INSERT INTO `user_salary_detail` VALUES (209, 50, 1531.15, 1531.15, 'e97750a2-3cd1-4457-b7ba-7877525c27cd', 3087, 3087, '2024-05-17 10:27:52', '2024-05-17 10:27:52');
INSERT INTO `user_salary_detail` VALUES (210, 1, 9.92, 9.92, 'cf5cb220-ec3a-4bc7-a335-347ab67e270b', 1, 1, '2024-05-17 10:28:00', '2024-05-17 10:28:00');
INSERT INTO `user_salary_detail` VALUES (211, 50, 0.50, 0.50, '6b1e99ac-88b0-49a8-a91d-98e246e24aa4', 1, 1, '2024-05-17 10:28:00', '2024-05-17 10:28:00');
INSERT INTO `user_salary_detail` VALUES (212, 52, 0.03, 0.03, '15f3048f-a045-4c99-96a9-cc93850864b0', 1, 1, '2024-05-17 10:28:00', '2024-05-17 10:28:00');
INSERT INTO `user_salary_detail` VALUES (213, 53, 0.05, 0.05, 'f017d2ae-a3c4-4fc5-9b9c-d6615ff99682', 1, 1, '2024-05-17 10:28:00', '2024-05-17 10:28:00');
INSERT INTO `user_salary_detail` VALUES (214, 55, 0.01, 0.01, '4283ed71-1135-458d-96f8-3314b205b7d0', 1, 1, '2024-05-17 10:28:00', '2024-05-17 10:28:00');
INSERT INTO `user_salary_detail` VALUES (215, 56, 0.03, 0.03, '3203dc0d-eb8c-4a81-ae5b-ed6998797aa8', 1, 1, '2024-05-17 10:28:00', '2024-05-17 10:28:00');
INSERT INTO `user_salary_detail` VALUES (216, 57, 0.03, 0.03, '7dc226b1-5bd8-4fbf-9c12-9b73a78f8fd0', 1, 1, '2024-05-17 10:28:00', '2024-05-17 10:28:00');
INSERT INTO `user_salary_detail` VALUES (217, 50, 1532.14, 1532.14, 'f16bf1fe-d479-4fdc-8845-8748240e0f03', 3089, 3089, '2024-05-17 10:29:33', '2024-05-17 10:29:33');
INSERT INTO `user_salary_detail` VALUES (218, 50, 1532.64, 1532.64, 'd9986d4e-491a-41f7-9bd1-fde13e7b6567', 3090, 3090, '2024-05-17 10:30:10', '2024-05-17 10:30:10');
INSERT INTO `user_salary_detail` VALUES (219, 50, 1533.63, 1533.63, 'c8282816-663a-4a4d-b0fe-bf6866086fd2', 3092, 3092, '2024-05-17 10:32:13', '2024-05-17 10:32:13');
INSERT INTO `user_salary_detail` VALUES (220, 50, 1518.26, 1518.26, '25e19329-3f4a-4def-b0fb-8855a19aae51', 3061, 3061, '2024-05-17 10:33:24', '2024-05-17 10:33:24');
INSERT INTO `user_salary_detail` VALUES (221, 50, 57.54, 57.54, '68e2ffe7-59ec-4e6a-9d11-a14abe6a78a1', 116, 116, '2024-05-17 10:34:08', '2024-05-17 10:34:08');
INSERT INTO `user_salary_detail` VALUES (222, 50, 0.50, 0.50, '631fce0c-8860-420d-b795-81de77e58cf6', 1, 1, '2024-05-17 10:35:08', '2024-05-17 10:35:08');
INSERT INTO `user_salary_detail` VALUES (223, 1, 99.21, 99.21, '678c6880-34c7-4ccc-a567-bcf06a1149e3', 10, 10, '2024-05-17 10:38:00', '2024-05-17 10:38:00');
INSERT INTO `user_salary_detail` VALUES (224, 50, 1.49, 1.49, 'b3a3a8cb-3512-46df-96da-4d832548021f', 3, 3, '2024-05-17 10:38:00', '2024-05-17 10:38:00');
INSERT INTO `user_salary_detail` VALUES (225, 52, 2.98, 2.98, 'e1c4b0a5-6ac7-4901-94d6-7ef5bdd9fb86', 10, 10, '2024-05-17 10:38:00', '2024-05-17 10:38:00');
INSERT INTO `user_salary_detail` VALUES (226, 53, 4.96, 4.96, '9a7d3206-69b2-4936-8bd1-b2aed3adda2d', 10, 10, '2024-05-17 10:38:01', '2024-05-17 10:38:01');
INSERT INTO `user_salary_detail` VALUES (227, 55, 9.92, 9.92, '29c3d9e7-9e95-4311-a735-7c7ee4cdc6b1', 10, 10, '2024-05-17 10:38:01', '2024-05-17 10:38:01');
INSERT INTO `user_salary_detail` VALUES (228, 56, 2.98, 2.98, '424b6d9a-4217-41a3-a9a5-0e0d9483b39e', 10, 10, '2024-05-17 10:38:01', '2024-05-17 10:38:01');
INSERT INTO `user_salary_detail` VALUES (229, 57, 5.95, 5.95, 'db2173bb-afd4-404e-b034-010d49f76177', 10, 10, '2024-05-17 10:38:01', '2024-05-17 10:38:01');
INSERT INTO `user_salary_detail` VALUES (230, 1, 9.92, 9.92, 'f1c5bd75-49b0-4560-a3b8-8ad61d311ebc', 1, 1, '2024-05-17 10:39:00', '2024-05-17 10:39:00');
INSERT INTO `user_salary_detail` VALUES (231, 50, 0.50, 0.50, 'c32f5a7f-3b62-41fd-acc2-36f37044c2d7', 1, 1, '2024-05-17 10:39:00', '2024-05-17 10:39:00');
INSERT INTO `user_salary_detail` VALUES (232, 52, 0.30, 0.30, 'ce539d5f-b5a6-4790-9877-f90c6de33f4c', 1, 1, '2024-05-17 10:39:00', '2024-05-17 10:39:00');
INSERT INTO `user_salary_detail` VALUES (233, 53, 0.50, 0.50, '225f981f-f6e5-4351-9db6-32010c42aab5', 1, 1, '2024-05-17 10:39:00', '2024-05-17 10:39:00');
INSERT INTO `user_salary_detail` VALUES (234, 56, 0.30, 0.30, '0b56e35b-a35e-4d10-9091-5c640a51eee4', 1, 1, '2024-05-17 10:39:00', '2024-05-17 10:39:00');
INSERT INTO `user_salary_detail` VALUES (235, 57, 0.60, 0.60, '74412a5a-d2b9-4cf8-9ede-48d50fd28d7e', 1, 1, '2024-05-17 10:39:00', '2024-05-17 10:39:00');
INSERT INTO `user_salary_detail` VALUES (236, 1, 9.92, 9.92, 'e8a2db52-6093-4601-b9b9-8d5b8107181a', 1, 1, '2024-05-17 10:40:00', '2024-05-17 10:40:00');
INSERT INTO `user_salary_detail` VALUES (237, 50, 0.50, 0.50, 'abdf7904-4c1a-4a3a-9baa-b678b6af1ab0', 1, 1, '2024-05-17 10:40:00', '2024-05-17 10:40:00');
INSERT INTO `user_salary_detail` VALUES (238, 52, 0.30, 0.30, '7fa76e6f-0b81-4d5a-a30a-41351d8123e8', 1, 1, '2024-05-17 10:40:00', '2024-05-17 10:40:00');
INSERT INTO `user_salary_detail` VALUES (239, 53, 0.50, 0.50, 'a59395ee-1b31-4b9a-a58d-a46e42351815', 1, 1, '2024-05-17 10:40:00', '2024-05-17 10:40:00');
INSERT INTO `user_salary_detail` VALUES (240, 56, 0.30, 0.30, '7ba90ad1-0838-4cdd-a106-18b8ef131012', 1, 1, '2024-05-17 10:40:00', '2024-05-17 10:40:00');
INSERT INTO `user_salary_detail` VALUES (241, 57, 0.60, 0.60, 'f0e66267-058f-42be-aa3a-427172d6c194', 1, 1, '2024-05-17 10:40:00', '2024-05-17 10:40:00');
INSERT INTO `user_salary_detail` VALUES (242, 1, 9.92, 9.92, '842eb508-2c13-45ac-b909-fe54ad5e473d', 1, 1, '2024-05-17 10:42:08', '2024-05-17 10:42:08');
INSERT INTO `user_salary_detail` VALUES (243, 50, 0.50, 0.50, '7dc0c208-9c8c-442e-951e-83577bb07c0b', 1, 1, '2024-05-17 10:42:11', '2024-05-17 10:42:11');
INSERT INTO `user_salary_detail` VALUES (244, 52, 0.30, 0.30, '44db5b77-ee42-434c-b802-54385d84912c', 1, 1, '2024-05-17 10:42:11', '2024-05-17 10:42:11');
INSERT INTO `user_salary_detail` VALUES (245, 53, 0.50, 0.50, 'cdf9a5ec-251d-4702-9941-e2af56019d5a', 1, 1, '2024-05-17 10:42:11', '2024-05-17 10:42:11');
INSERT INTO `user_salary_detail` VALUES (246, 56, 0.30, 0.30, 'a5d488cd-6d3d-4129-9a59-b751dc70e31c', 1, 1, '2024-05-17 10:42:11', '2024-05-17 10:42:11');
INSERT INTO `user_salary_detail` VALUES (247, 57, 0.60, 0.60, 'e9eaabf9-e8e2-48a0-b646-c3ebd230da9b', 1, 1, '2024-05-17 10:42:11', '2024-05-17 10:42:11');
INSERT INTO `user_salary_detail` VALUES (248, 52, 0.60, 0.60, '2c9ccbdc-254f-4a60-a26a-7fd2d810a27f', 2, 2, '2024-05-17 10:43:00', '2024-05-17 10:43:00');
INSERT INTO `user_salary_detail` VALUES (249, 52, 0.30, 0.30, '9b9c4ee2-b535-45fe-ac99-6c9408167b04', 1, 1, '2024-05-17 10:44:00', '2024-05-17 10:44:00');
INSERT INTO `user_salary_detail` VALUES (250, 56, 0.89, 0.89, '81b857e3-059d-47d3-9216-2c0840cc9e77', 3, 3, '2024-05-17 10:44:00', '2024-05-17 10:44:00');
INSERT INTO `user_salary_detail` VALUES (251, 52, 0.30, 0.30, 'a15b369f-7f5a-454b-bdcf-5521f4780119', 1, 1, '2024-05-17 10:45:00', '2024-05-17 10:45:00');
INSERT INTO `user_salary_detail` VALUES (252, 52, 0.30, 0.30, '2f587c4e-eaac-4c4a-b2ef-df1b818edd0c', 1, 1, '2024-05-17 10:46:00', '2024-05-17 10:46:00');
INSERT INTO `user_salary_detail` VALUES (253, 57, 2.98, 2.98, '6b9b07b2-8d26-4576-8bed-ecc85be639b3', 5, 5, '2024-05-17 10:46:00', '2024-05-17 10:46:00');
INSERT INTO `user_salary_detail` VALUES (254, 52, 0.30, 0.30, 'bbe6d5e1-575f-4c88-a2d7-c55edaabb29f', 1, 1, '2024-05-17 10:47:00', '2024-05-17 10:47:00');
INSERT INTO `user_salary_detail` VALUES (255, 56, 0.89, 0.89, '7a36c346-9a4d-4b32-bef9-1a2d479c21d9', 3, 3, '2024-05-17 10:47:00', '2024-05-17 10:47:00');
INSERT INTO `user_salary_detail` VALUES (256, 52, 0.30, 0.30, '8c0ad5c4-7433-4a03-847a-b93df7aa2887', 1, 1, '2024-05-17 10:48:00', '2024-05-17 10:48:00');
INSERT INTO `user_salary_detail` VALUES (257, 52, 0.30, 0.30, '5d4e599c-13f4-48fa-be18-10902390e12b', 1, 1, '2024-05-17 10:49:00', '2024-05-17 10:49:00');
INSERT INTO `user_salary_detail` VALUES (258, 52, 0.30, 0.30, '4ee583bc-1736-49f1-bb7d-0f99932481a9', 1, 1, '2024-05-17 10:50:00', '2024-05-17 10:50:00');
INSERT INTO `user_salary_detail` VALUES (259, 56, 0.89, 0.89, 'da95e6c8-86ac-4b5a-b926-2f2e55623c17', 3, 3, '2024-05-17 10:50:00', '2024-05-17 10:50:00');
INSERT INTO `user_salary_detail` VALUES (260, 52, 0.30, 0.30, 'cd4257a6-6679-45ca-8d9b-096a32b020fe', 1, 1, '2024-05-17 10:51:00', '2024-05-17 10:51:00');
INSERT INTO `user_salary_detail` VALUES (261, 57, 2.98, 2.98, '3208a786-345e-47ce-8383-3efe2ce4383c', 5, 5, '2024-05-17 10:51:00', '2024-05-17 10:51:00');
INSERT INTO `user_salary_detail` VALUES (262, 52, 0.30, 0.30, 'ad950742-5f75-4537-b403-c06d89e8fd22', 1, 1, '2024-05-17 10:52:00', '2024-05-17 10:52:00');
INSERT INTO `user_salary_detail` VALUES (263, 52, 0.30, 0.30, 'b426fae4-672f-4677-a84a-6dd6cea4d217', 1, 1, '2024-05-17 10:53:00', '2024-05-17 10:53:00');
INSERT INTO `user_salary_detail` VALUES (264, 56, 0.89, 0.89, '9ccbb4cc-446e-43ef-a8e7-53714461f6ab', 3, 3, '2024-05-17 10:53:00', '2024-05-17 10:53:00');
INSERT INTO `user_salary_detail` VALUES (265, 52, 0.30, 0.30, 'cfb9fae1-1c2b-4b28-b519-423e61e03413', 1, 1, '2024-05-17 10:54:00', '2024-05-17 10:54:00');
INSERT INTO `user_salary_detail` VALUES (266, 52, 0.30, 0.30, 'e9a4eb25-7af5-45b6-aa4c-2d47435bc295', 1, 1, '2024-05-17 10:55:00', '2024-05-17 10:55:00');
INSERT INTO `user_salary_detail` VALUES (267, 52, 0.30, 0.30, '52f18573-3de3-443d-8893-086588e5d18b', 1, 1, '2024-05-17 10:56:00', '2024-05-17 10:56:00');
INSERT INTO `user_salary_detail` VALUES (268, 56, 0.89, 0.89, '6b4d5e27-d919-45db-aa10-c5debe73dc1b', 3, 3, '2024-05-17 10:56:00', '2024-05-17 10:56:00');
INSERT INTO `user_salary_detail` VALUES (269, 57, 2.98, 2.98, '4b229355-1a2a-4595-8493-769a1c0bbb57', 5, 5, '2024-05-17 10:56:00', '2024-05-17 10:56:00');
INSERT INTO `user_salary_detail` VALUES (270, 52, 0.30, 0.30, 'a02888cb-a393-4c35-8232-ea670a2b48fe', 1, 1, '2024-05-17 10:57:00', '2024-05-17 10:57:00');
INSERT INTO `user_salary_detail` VALUES (271, 52, 0.30, 0.30, 'a88079ff-95c1-4cee-ada0-d29085b5da4d', 1, 1, '2024-05-17 10:58:00', '2024-05-17 10:58:00');
INSERT INTO `user_salary_detail` VALUES (272, 52, 0.30, 0.30, 'f4a3727a-87f0-4086-bd89-3996c6064121', 1, 1, '2024-05-17 10:59:00', '2024-05-17 10:59:00');
INSERT INTO `user_salary_detail` VALUES (273, 56, 0.89, 0.89, 'cc105b02-f7f8-4f70-8cf8-542d51569c42', 3, 3, '2024-05-17 10:59:00', '2024-05-17 10:59:00');
INSERT INTO `user_salary_detail` VALUES (274, 52, 0.30, 0.30, 'c070bebd-e480-4b8a-aa7b-8ec332a72ba0', 1, 1, '2024-05-17 11:00:00', '2024-05-17 11:00:00');
INSERT INTO `user_salary_detail` VALUES (275, 52, 0.30, 0.30, 'a4541da1-1537-4474-aad8-efbaba846ee7', 1, 1, '2024-05-17 11:01:00', '2024-05-17 11:01:00');
INSERT INTO `user_salary_detail` VALUES (276, 57, 2.98, 2.98, '2f7218b6-12be-44ec-ae6e-2096a8a253f1', 5, 5, '2024-05-17 11:01:00', '2024-05-17 11:01:00');
INSERT INTO `user_salary_detail` VALUES (277, 52, 0.30, 0.30, '6c702c19-a030-414f-9d1a-8f672241df23', 1, 1, '2024-05-17 11:02:00', '2024-05-17 11:02:00');
INSERT INTO `user_salary_detail` VALUES (278, 56, 0.89, 0.89, '2c5a118f-00a7-4bdb-9309-1d7249b9202a', 3, 3, '2024-05-17 11:02:00', '2024-05-17 11:02:00');
INSERT INTO `user_salary_detail` VALUES (279, 52, 0.30, 0.30, 'ea07f484-26bf-4fa8-b1d2-efc5ba8fd51b', 1, 1, '2024-05-17 11:03:00', '2024-05-17 11:03:00');
INSERT INTO `user_salary_detail` VALUES (280, 52, 0.30, 0.30, '4eca16b1-cd4b-454a-a547-82c43f064586', 1, 1, '2024-05-17 11:04:00', '2024-05-17 11:04:00');
INSERT INTO `user_salary_detail` VALUES (281, 52, 0.30, 0.30, '61744911-84cc-4b97-9e75-3412ad25b738', 1, 1, '2024-05-17 11:05:00', '2024-05-17 11:05:00');
INSERT INTO `user_salary_detail` VALUES (282, 56, 0.89, 0.89, '3e30605f-335d-42b7-8435-2d5ff6751946', 3, 3, '2024-05-17 11:05:00', '2024-05-17 11:05:00');
INSERT INTO `user_salary_detail` VALUES (283, 52, 0.30, 0.30, '8b32c28c-d820-4999-89b4-31e8d10a4e3b', 1, 1, '2024-05-17 11:06:00', '2024-05-17 11:06:00');
INSERT INTO `user_salary_detail` VALUES (284, 57, 2.98, 2.98, '8139b1e3-4abc-409e-b6d9-1c9cbab7451d', 5, 5, '2024-05-17 11:06:00', '2024-05-17 11:06:00');
INSERT INTO `user_salary_detail` VALUES (285, 52, 0.30, 0.30, 'efd5f6c8-daae-40ad-98d6-400864169110', 1, 1, '2024-05-17 11:07:00', '2024-05-17 11:07:00');
INSERT INTO `user_salary_detail` VALUES (286, 52, 0.30, 0.30, 'a393292d-6da9-428b-8cb7-ff86d7b6791e', 1, 1, '2024-05-17 11:08:00', '2024-05-17 11:08:00');
INSERT INTO `user_salary_detail` VALUES (287, 56, 0.89, 0.89, '176d7a1e-49fd-4a77-8a35-94a903524634', 3, 3, '2024-05-17 11:08:00', '2024-05-17 11:08:00');
INSERT INTO `user_salary_detail` VALUES (288, 52, 0.30, 0.30, 'dafc627e-a446-48a2-9baa-ebe905f26297', 1, 1, '2024-05-17 11:09:00', '2024-05-17 11:09:00');
INSERT INTO `user_salary_detail` VALUES (289, 52, 0.30, 0.30, '0c436cda-f865-4900-a73f-c822cc4347e6', 1, 1, '2024-05-17 11:10:00', '2024-05-17 11:10:00');
INSERT INTO `user_salary_detail` VALUES (290, 52, 0.30, 0.30, 'ca7ef847-0b00-4ec9-b7a0-91b2ca860f9d', 1, 1, '2024-05-17 11:11:00', '2024-05-17 11:11:00');
INSERT INTO `user_salary_detail` VALUES (291, 56, 0.89, 0.89, '515902d8-c3f4-4328-b20d-d3cf2246a044', 3, 3, '2024-05-17 11:11:00', '2024-05-17 11:11:00');
INSERT INTO `user_salary_detail` VALUES (292, 57, 2.98, 2.98, '6d1b8732-e215-45d7-8026-fcb86a4e2439', 5, 5, '2024-05-17 11:11:00', '2024-05-17 11:11:00');
INSERT INTO `user_salary_detail` VALUES (293, 52, 0.30, 0.30, '390998af-564d-47ae-93aa-346815355cb9', 1, 1, '2024-05-17 11:12:00', '2024-05-17 11:12:00');
INSERT INTO `user_salary_detail` VALUES (294, 52, 0.30, 0.30, 'edfd752e-6723-45e2-9e78-4cf1e3274e49', 1, 1, '2024-05-17 11:13:00', '2024-05-17 11:13:00');
INSERT INTO `user_salary_detail` VALUES (295, 52, 0.30, 0.30, 'bbb5fd81-84cf-4a53-8bc3-d1604457b47e', 1, 1, '2024-05-17 11:14:00', '2024-05-17 11:14:00');
INSERT INTO `user_salary_detail` VALUES (296, 56, 0.89, 0.89, 'fae10537-baa7-4f97-a1f6-ce56b8a76140', 3, 3, '2024-05-17 11:14:00', '2024-05-17 11:14:00');
INSERT INTO `user_salary_detail` VALUES (297, 52, 0.30, 0.30, 'c9173425-457c-45ee-aa1a-1226dfbb1e6f', 1, 1, '2024-05-17 11:15:00', '2024-05-17 11:15:00');
INSERT INTO `user_salary_detail` VALUES (298, 52, 0.30, 0.30, 'f1a9413c-d95f-4324-a4d5-b5111672b785', 1, 1, '2024-05-17 11:16:00', '2024-05-17 11:16:00');
INSERT INTO `user_salary_detail` VALUES (299, 57, 2.98, 2.98, '8094aa4c-892a-4a17-ba39-d564dafa7964', 5, 5, '2024-05-17 11:16:00', '2024-05-17 11:16:00');
INSERT INTO `user_salary_detail` VALUES (300, 52, 0.30, 0.30, '361a17f7-7083-4bea-ad9a-8c570462be90', 1, 1, '2024-05-17 11:17:00', '2024-05-17 11:17:00');
INSERT INTO `user_salary_detail` VALUES (301, 56, 0.89, 0.89, '772ce931-f301-4d77-9444-f674e492861e', 3, 3, '2024-05-17 11:17:00', '2024-05-17 11:17:00');
INSERT INTO `user_salary_detail` VALUES (302, 52, 0.30, 0.30, 'fa055a60-2a65-4442-8357-c584a75eb793', 1, 1, '2024-05-17 11:18:00', '2024-05-17 11:18:00');
INSERT INTO `user_salary_detail` VALUES (303, 52, 0.30, 0.30, '548ce83b-e1a6-4cbf-8d06-bc3e5a85b531', 1, 1, '2024-05-17 11:19:00', '2024-05-17 11:19:00');
INSERT INTO `user_salary_detail` VALUES (304, 52, 0.30, 0.30, '197c7d60-986e-4e53-96f8-6d768d0c700b', 1, 1, '2024-05-17 11:20:00', '2024-05-17 11:20:00');
INSERT INTO `user_salary_detail` VALUES (305, 56, 0.89, 0.89, '9da41aee-8ae4-4520-aa21-c20d67aa8bad', 3, 3, '2024-05-17 11:20:00', '2024-05-17 11:20:00');
INSERT INTO `user_salary_detail` VALUES (306, 52, 0.30, 0.30, 'ac95acaa-9a0c-4d88-a96a-77208387ee84', 1, 1, '2024-05-17 11:21:00', '2024-05-17 11:21:00');
INSERT INTO `user_salary_detail` VALUES (307, 57, 2.98, 2.98, '0d692efb-7479-4074-9be2-97daa264b120', 5, 5, '2024-05-17 11:21:00', '2024-05-17 11:21:00');
INSERT INTO `user_salary_detail` VALUES (308, 52, 0.30, 0.30, '28ce6f1f-d32f-4d63-a428-284f28543aa6', 1, 1, '2024-05-17 11:22:00', '2024-05-17 11:22:00');
INSERT INTO `user_salary_detail` VALUES (309, 52, 0.30, 0.30, 'cd5ea33d-f70d-4673-821b-0d9cc1b5d57b', 1, 1, '2024-05-17 11:23:00', '2024-05-17 11:23:00');
INSERT INTO `user_salary_detail` VALUES (310, 56, 0.89, 0.89, '64cd7a49-f873-4e6e-a725-765aa25bab92', 3, 3, '2024-05-17 11:23:00', '2024-05-17 11:23:00');
INSERT INTO `user_salary_detail` VALUES (311, 52, 0.30, 0.30, '866ebce2-4964-4458-9b9b-4c82ee13bea6', 1, 1, '2024-05-17 11:24:00', '2024-05-17 11:24:00');
INSERT INTO `user_salary_detail` VALUES (312, 52, 0.30, 0.30, '672c9b94-b047-46f0-ba94-a4c37338d79d', 1, 1, '2024-05-17 11:25:00', '2024-05-17 11:25:00');
INSERT INTO `user_salary_detail` VALUES (313, 52, 0.30, 0.30, '7e624e51-fbb7-4471-b829-adb57c9253f9', 1, 1, '2024-05-17 11:26:00', '2024-05-17 11:26:00');
INSERT INTO `user_salary_detail` VALUES (314, 56, 0.89, 0.89, '23cf566f-d636-4ff9-9901-e5d624bc64b3', 3, 3, '2024-05-17 11:26:00', '2024-05-17 11:26:00');
INSERT INTO `user_salary_detail` VALUES (315, 57, 2.98, 2.98, 'a934ce73-dc83-48e8-bc55-2506311e289c', 5, 5, '2024-05-17 11:26:00', '2024-05-17 11:26:00');
INSERT INTO `user_salary_detail` VALUES (316, 52, 0.30, 0.30, '0271d711-a744-454b-8b7b-172ea0403c39', 1, 1, '2024-05-17 11:27:00', '2024-05-17 11:27:00');
INSERT INTO `user_salary_detail` VALUES (317, 52, 0.30, 0.30, '754ae790-d46c-413b-b684-72699f4d326f', 1, 1, '2024-05-17 11:28:00', '2024-05-17 11:28:00');
INSERT INTO `user_salary_detail` VALUES (318, 52, 0.30, 0.30, 'a6df227f-3fba-414e-9ae5-14ee37e00747', 1, 1, '2024-05-17 11:29:00', '2024-05-17 11:29:00');
INSERT INTO `user_salary_detail` VALUES (319, 56, 0.89, 0.89, '1d968c7c-c9f2-4679-8c83-3e922bce6502', 3, 3, '2024-05-17 11:29:00', '2024-05-17 11:29:00');
INSERT INTO `user_salary_detail` VALUES (320, 52, 0.30, 0.30, '0542642d-738b-4ea5-a3f2-949883ad75e3', 1, 1, '2024-05-17 11:30:00', '2024-05-17 11:30:00');
INSERT INTO `user_salary_detail` VALUES (321, 52, 0.30, 0.30, '409a8b46-e8a2-41d8-816e-24656fc9a21b', 1, 1, '2024-05-17 11:31:00', '2024-05-17 11:31:00');
INSERT INTO `user_salary_detail` VALUES (322, 57, 2.98, 2.98, '0ea4e275-fe00-43d3-9d45-8a5cda3ebe75', 5, 5, '2024-05-17 11:31:00', '2024-05-17 11:31:00');
INSERT INTO `user_salary_detail` VALUES (323, 52, 0.30, 0.30, '8f8a17f2-ef62-4526-8cf9-81368baa80df', 1, 1, '2024-05-17 11:32:00', '2024-05-17 11:32:00');
INSERT INTO `user_salary_detail` VALUES (324, 56, 0.89, 0.89, 'b3691bd3-ef4e-441d-8bd7-ad6f9883cf51', 3, 3, '2024-05-17 11:32:00', '2024-05-17 11:32:00');
INSERT INTO `user_salary_detail` VALUES (325, 52, 0.30, 0.30, 'c236697c-d97c-4f83-939b-6c9eb556f7f1', 1, 1, '2024-05-17 11:33:00', '2024-05-17 11:33:00');
INSERT INTO `user_salary_detail` VALUES (326, 52, 0.30, 0.30, '11725f64-ba6e-4427-a153-53eabb7ae89a', 1, 1, '2024-05-17 11:34:00', '2024-05-17 11:34:00');
INSERT INTO `user_salary_detail` VALUES (327, 52, 0.30, 0.30, '3d05549d-af73-41cc-9a95-c95d2014c6f1', 1, 1, '2024-05-17 11:35:00', '2024-05-17 11:35:00');
INSERT INTO `user_salary_detail` VALUES (328, 56, 0.89, 0.89, 'cdfff8a3-b3bd-48db-a1e0-e10ee3c33ffa', 3, 3, '2024-05-17 11:35:00', '2024-05-17 11:35:00');
INSERT INTO `user_salary_detail` VALUES (329, 52, 0.30, 0.30, '7678a458-70aa-48d6-bbd0-416b0d43d990', 1, 1, '2024-05-17 11:36:00', '2024-05-17 11:36:00');
INSERT INTO `user_salary_detail` VALUES (330, 57, 2.98, 2.98, '66c3bb89-ff55-454d-8c64-8535a18fa6b2', 5, 5, '2024-05-17 11:36:00', '2024-05-17 11:36:00');
INSERT INTO `user_salary_detail` VALUES (331, 52, 0.30, 0.30, '5167f4a2-3a09-400f-9ca4-c141fef57c66', 1, 1, '2024-05-17 11:37:00', '2024-05-17 11:37:00');
INSERT INTO `user_salary_detail` VALUES (332, 52, 0.30, 0.30, '84f4584d-8688-42ad-b1de-228d15b9d3b7', 1, 1, '2024-05-17 11:38:00', '2024-05-17 11:38:00');
INSERT INTO `user_salary_detail` VALUES (333, 56, 0.89, 0.89, '81106a0e-93ad-462d-9bb2-eaa7a8ca228c', 3, 3, '2024-05-17 11:38:00', '2024-05-17 11:38:00');
INSERT INTO `user_salary_detail` VALUES (334, 52, 0.30, 0.30, '8c77bd9a-ed6f-462e-958e-3858feb1d498', 1, 1, '2024-05-17 11:39:00', '2024-05-17 11:39:00');
INSERT INTO `user_salary_detail` VALUES (335, 52, 0.30, 0.30, '427ed46e-031f-4838-9b85-966d84829844', 1, 1, '2024-05-17 11:40:00', '2024-05-17 11:40:00');
INSERT INTO `user_salary_detail` VALUES (336, 52, 0.30, 0.30, '01d92611-b958-4048-b734-81ed804d9b49', 1, 1, '2024-05-17 11:41:00', '2024-05-17 11:41:00');
INSERT INTO `user_salary_detail` VALUES (337, 56, 0.89, 0.89, '766fe3f5-44c6-4ab9-9fb2-24bdfdd0ad4e', 3, 3, '2024-05-17 11:41:00', '2024-05-17 11:41:00');
INSERT INTO `user_salary_detail` VALUES (338, 57, 2.98, 2.98, '409ce2b0-7a4a-417e-a54e-4e5fb2bc3a7f', 5, 5, '2024-05-17 11:41:00', '2024-05-17 11:41:00');
INSERT INTO `user_salary_detail` VALUES (339, 52, 0.30, 0.30, '45326c4b-f47e-49c9-a605-0c2e94b33edd', 1, 1, '2024-05-17 11:42:00', '2024-05-17 11:42:00');
INSERT INTO `user_salary_detail` VALUES (340, 52, 0.30, 0.30, 'be08e356-14b0-4c44-a954-7c449e895aa0', 1, 1, '2024-05-17 11:43:00', '2024-05-17 11:43:00');
INSERT INTO `user_salary_detail` VALUES (341, 52, 0.30, 0.30, 'c89a0d19-21bb-44e1-a1a7-5a36e57e1dc6', 1, 1, '2024-05-17 11:44:00', '2024-05-17 11:44:00');
INSERT INTO `user_salary_detail` VALUES (342, 56, 0.89, 0.89, '22b38a82-9a11-4782-943f-83022dec65e8', 3, 3, '2024-05-17 11:44:00', '2024-05-17 11:44:00');
INSERT INTO `user_salary_detail` VALUES (343, 52, 0.30, 0.30, 'd84fce30-91ab-4938-9446-c9bedade81dd', 1, 1, '2024-05-17 11:45:00', '2024-05-17 11:45:00');
INSERT INTO `user_salary_detail` VALUES (344, 52, 0.30, 0.30, 'ff1604c9-c0ab-4484-a27d-6c3be1af6bfe', 1, 1, '2024-05-17 11:46:00', '2024-05-17 11:46:00');
INSERT INTO `user_salary_detail` VALUES (345, 57, 2.98, 2.98, '59358df3-2f91-4a93-bdd3-9e6d0854cecb', 5, 5, '2024-05-17 11:46:00', '2024-05-17 11:46:00');
INSERT INTO `user_salary_detail` VALUES (346, 52, 0.30, 0.30, '577af4e8-1f39-4e37-8e45-ebf81cfd89c3', 1, 1, '2024-05-17 11:47:00', '2024-05-17 11:47:00');
INSERT INTO `user_salary_detail` VALUES (347, 56, 0.89, 0.89, '2a1a4450-5396-4475-8e34-d0066830652c', 3, 3, '2024-05-17 11:47:00', '2024-05-17 11:47:00');
INSERT INTO `user_salary_detail` VALUES (348, 52, 0.30, 0.30, '98fa26e4-0f46-4ac1-93e3-73662ed22807', 1, 1, '2024-05-17 11:48:00', '2024-05-17 11:48:00');
INSERT INTO `user_salary_detail` VALUES (349, 52, 4.76, 4.76, '37cacae6-94d6-4d82-a1f2-b9d9a6a4fa24', 16, 16, '2024-05-17 12:04:16', '2024-05-17 12:04:16');
INSERT INTO `user_salary_detail` VALUES (350, 56, 5.06, 5.06, 'c6e6fc34-27a7-4051-b940-f15f9f1064b1', 17, 17, '2024-05-17 12:04:16', '2024-05-17 12:04:16');
INSERT INTO `user_salary_detail` VALUES (351, 57, 10.71, 10.71, 'dd03e218-91c8-47e9-be9a-d79821697667', 18, 18, '2024-05-17 12:04:16', '2024-05-17 12:04:16');
INSERT INTO `user_salary_detail` VALUES (352, 52, 0.30, 0.30, 'f960376f-bb74-4cc4-92ab-2263144533da', 1, 1, '2024-05-17 12:05:00', '2024-05-17 12:05:00');
INSERT INTO `user_salary_detail` VALUES (353, 52, 0.30, 0.30, '70fd4ddc-e77e-4111-9344-32ee51bc3ffd', 1, 1, '2024-05-17 12:06:00', '2024-05-17 12:06:00');
INSERT INTO `user_salary_detail` VALUES (354, 52, 0.30, 0.30, '53064153-c89b-4538-aa55-f0ddd7104c70', 1, 1, '2024-05-17 12:07:00', '2024-05-17 12:07:00');
INSERT INTO `user_salary_detail` VALUES (355, 56, 0.89, 0.89, 'c609061d-4bc5-486c-99f7-98c1dd5bf5f0', 3, 3, '2024-05-17 12:07:00', '2024-05-17 12:07:00');
INSERT INTO `user_salary_detail` VALUES (356, 52, 4.76, 4.76, 'f45bafe3-e725-4eea-95cd-2872ef47ec6f', 16, 16, '2024-05-17 12:23:17', '2024-05-17 12:23:17');
INSERT INTO `user_salary_detail` VALUES (357, 56, 4.76, 4.76, '654f67da-3cf8-4c8f-83f2-ba64344b55ae', 16, 16, '2024-05-17 12:23:17', '2024-05-17 12:23:17');
INSERT INTO `user_salary_detail` VALUES (358, 57, 11.31, 11.31, '0b55a5cf-85af-4692-b549-408e0ecfbebb', 19, 19, '2024-05-17 12:23:17', '2024-05-17 12:23:17');
INSERT INTO `user_salary_detail` VALUES (359, 52, 0.30, 0.30, 'd87970ea-165f-4c2a-a535-f7d30141c1dd', 1, 1, '2024-05-17 12:24:00', '2024-05-17 12:24:00');
INSERT INTO `user_salary_detail` VALUES (360, 52, 0.30, 0.30, 'fae40931-0558-4024-bc02-b17f9e222638', 1, 1, '2024-05-17 12:25:00', '2024-05-17 12:25:00');
INSERT INTO `user_salary_detail` VALUES (361, 52, 0.30, 0.30, 'cf8a14c5-23bb-4b9e-bf46-fdf26852c255', 1, 1, '2024-05-17 12:26:00', '2024-05-17 12:26:00');
INSERT INTO `user_salary_detail` VALUES (362, 56, 0.89, 0.89, '98872b90-3119-45ff-a756-50b830b6413d', 3, 3, '2024-05-17 12:26:00', '2024-05-17 12:26:00');
INSERT INTO `user_salary_detail` VALUES (363, 52, 0.30, 0.30, '49812adf-0220-4f2e-a4c8-25c62b6027f0', 1, 1, '2024-05-17 12:27:00', '2024-05-17 12:27:00');
INSERT INTO `user_salary_detail` VALUES (364, 52, 0.30, 0.30, 'e61e5592-647b-4e93-9563-f0364d608e40', 1, 1, '2024-05-17 12:28:00', '2024-05-17 12:28:00');
INSERT INTO `user_salary_detail` VALUES (365, 57, 2.98, 2.98, 'dd2ba125-757b-42e5-bcad-987246c29ca6', 5, 5, '2024-05-17 12:28:00', '2024-05-17 12:28:00');
INSERT INTO `user_salary_detail` VALUES (366, 52, 0.30, 0.30, '2abcb795-c631-4ad5-89f1-4c9d1b4f0334', 1, 1, '2024-05-17 12:29:00', '2024-05-17 12:29:00');
INSERT INTO `user_salary_detail` VALUES (367, 56, 0.89, 0.89, 'e1cde67e-006b-49e0-9e73-a96ca7cbc08c', 3, 3, '2024-05-17 12:29:00', '2024-05-17 12:29:00');
INSERT INTO `user_salary_detail` VALUES (368, 52, 0.30, 0.30, '84cf99e0-7b02-47a8-ba05-e21bc3d912ed', 1, 1, '2024-05-17 12:30:00', '2024-05-17 12:30:00');
INSERT INTO `user_salary_detail` VALUES (369, 52, 0.30, 0.30, '5ed10c24-fcb8-4281-bea0-f8d7bd6afdf5', 1, 1, '2024-05-17 12:31:00', '2024-05-17 12:31:00');
INSERT INTO `user_salary_detail` VALUES (370, 52, 0.30, 0.30, '0da27f86-9f00-46d6-a39a-394116ace5ad', 1, 1, '2024-05-17 12:32:00', '2024-05-17 12:32:00');
INSERT INTO `user_salary_detail` VALUES (371, 56, 0.89, 0.89, '4d0fbcc7-12a4-4dd8-81de-2e96ca69b218', 3, 3, '2024-05-17 12:32:00', '2024-05-17 12:32:00');
INSERT INTO `user_salary_detail` VALUES (372, 52, 0.30, 0.30, '34b7c4f5-722e-4f0f-89b4-cc00147c2f3f', 1, 1, '2024-05-17 12:33:00', '2024-05-17 12:33:00');
INSERT INTO `user_salary_detail` VALUES (373, 57, 2.98, 2.98, 'd6a3259a-4e83-483a-a27f-e0ade75d53ff', 5, 5, '2024-05-17 12:33:00', '2024-05-17 12:33:00');
INSERT INTO `user_salary_detail` VALUES (374, 52, 0.30, 0.30, '1fa24369-0758-418b-b6ae-688182f36d91', 1, 1, '2024-05-17 12:34:00', '2024-05-17 12:34:00');
INSERT INTO `user_salary_detail` VALUES (375, 52, 0.30, 0.30, '7218523f-ae4d-457c-acd1-47dc812943f6', 1, 1, '2024-05-17 12:35:00', '2024-05-17 12:35:00');
INSERT INTO `user_salary_detail` VALUES (376, 56, 0.89, 0.89, '411d78e0-7000-40c3-bd6a-ebd165749690', 3, 3, '2024-05-17 12:35:00', '2024-05-17 12:35:00');
INSERT INTO `user_salary_detail` VALUES (377, 52, 0.30, 0.30, '13b0e6b8-f570-499f-a211-8ef9ec1c61c9', 1, 1, '2024-05-17 12:36:00', '2024-05-17 12:36:00');
INSERT INTO `user_salary_detail` VALUES (378, 52, 0.30, 0.30, 'ed978616-00f0-4e10-9825-d35c878de1a5', 1, 1, '2024-05-17 12:37:00', '2024-05-17 12:37:00');
INSERT INTO `user_salary_detail` VALUES (379, 52, 7.74, 7.74, '98721f11-184d-4806-b9c3-a0b10c584a87', 26, 26, '2024-05-17 13:03:44', '2024-05-17 13:03:44');
INSERT INTO `user_salary_detail` VALUES (380, 56, 8.33, 8.33, '008d07df-b14b-4384-836a-e564b21af010', 28, 28, '2024-05-17 13:03:44', '2024-05-17 13:03:44');
INSERT INTO `user_salary_detail` VALUES (381, 57, 17.86, 17.86, '98bfb8a0-23ea-4d6f-9aeb-0bd88427f433', 30, 30, '2024-05-17 13:03:44', '2024-05-17 13:03:44');
INSERT INTO `user_salary_detail` VALUES (382, 52, 0.30, 0.30, 'dcfc9be9-7986-4720-948a-da8658b590c3', 1, 1, '2024-05-17 13:04:00', '2024-05-17 13:04:00');
INSERT INTO `user_salary_detail` VALUES (383, 52, 0.30, 0.30, '4014f0fe-60ba-493f-a7a9-89b625922917', 1, 1, '2024-05-17 13:05:00', '2024-05-17 13:05:00');
INSERT INTO `user_salary_detail` VALUES (384, 52, 0.30, 0.30, 'ed1c37b9-c809-47d3-a431-5e4472055506', 1, 1, '2024-05-17 13:06:00', '2024-05-17 13:06:00');
INSERT INTO `user_salary_detail` VALUES (385, 56, 0.89, 0.89, '3b9de026-11c9-4922-b2d6-ec24d776cd9b', 3, 3, '2024-05-17 13:06:00', '2024-05-17 13:06:00');
INSERT INTO `user_salary_detail` VALUES (386, 52, 0.30, 0.30, '974479fb-94aa-41ee-8bad-da0629f678d0', 1, 1, '2024-05-17 13:07:00', '2024-05-17 13:07:00');
INSERT INTO `user_salary_detail` VALUES (387, 52, 0.30, 0.30, 'e230bd83-331f-4d2d-bd99-f7630426a61f', 1, 1, '2024-05-17 13:08:00', '2024-05-17 13:08:00');
INSERT INTO `user_salary_detail` VALUES (388, 57, 2.98, 2.98, '85cb8d65-f676-40cc-bc60-17e3925f954a', 5, 5, '2024-05-17 13:08:00', '2024-05-17 13:08:00');
INSERT INTO `user_salary_detail` VALUES (389, 52, 0.30, 0.30, '7894b700-bd96-407d-a12f-cb233500f4bb', 1, 1, '2024-05-17 13:09:00', '2024-05-17 13:09:00');
INSERT INTO `user_salary_detail` VALUES (390, 56, 0.89, 0.89, 'bc1f0a70-da01-4f67-96a9-21effc17064d', 3, 3, '2024-05-17 13:09:00', '2024-05-17 13:09:00');
INSERT INTO `user_salary_detail` VALUES (391, 52, 0.30, 0.30, '1baadca7-870a-4a44-acbc-1a1cffcd53cc', 1, 1, '2024-05-17 13:10:00', '2024-05-17 13:10:00');
INSERT INTO `user_salary_detail` VALUES (392, 52, 0.30, 0.30, 'ca75aa22-958f-4ed1-97f8-a6e12222d120', 1, 1, '2024-05-17 13:11:00', '2024-05-17 13:11:00');
INSERT INTO `user_salary_detail` VALUES (393, 52, 0.30, 0.30, 'f9498ef7-858f-4254-a3fd-41961faca345', 1, 1, '2024-05-17 13:12:00', '2024-05-17 13:12:00');
INSERT INTO `user_salary_detail` VALUES (394, 56, 0.89, 0.89, 'c416435e-71cd-4c8b-b52c-90e988c47e42', 3, 3, '2024-05-17 13:12:00', '2024-05-17 13:12:00');
INSERT INTO `user_salary_detail` VALUES (395, 52, 0.30, 0.30, 'c91f90b7-8782-4545-a1d0-d47a35d9243f', 1, 1, '2024-05-17 13:13:00', '2024-05-17 13:13:00');
INSERT INTO `user_salary_detail` VALUES (396, 57, 2.98, 2.98, '6d14a8b7-9889-43ac-baa5-2a986ef651b3', 5, 5, '2024-05-17 13:13:00', '2024-05-17 13:13:00');
INSERT INTO `user_salary_detail` VALUES (397, 52, 0.30, 0.30, '6540eab4-4099-472e-bf63-abb05cb43ead', 1, 1, '2024-05-17 13:14:00', '2024-05-17 13:14:00');
INSERT INTO `user_salary_detail` VALUES (398, 52, 0.30, 0.30, '5ab1ccd4-18cd-4433-aed9-b8f9090aa2b5', 1, 1, '2024-05-17 13:15:00', '2024-05-17 13:15:00');
INSERT INTO `user_salary_detail` VALUES (399, 56, 0.89, 0.89, '32ed4da7-ab80-4baf-a9c3-689361ff4e63', 3, 3, '2024-05-17 13:15:00', '2024-05-17 13:15:00');
INSERT INTO `user_salary_detail` VALUES (400, 52, 0.30, 0.30, '8ef54fcd-1dd6-46bf-b60c-e12c5c03e574', 1, 1, '2024-05-17 13:16:00', '2024-05-17 13:16:00');
INSERT INTO `user_salary_detail` VALUES (401, 52, 0.30, 0.30, 'cd0c6a64-0483-4b9f-9475-b1c59a392967', 1, 1, '2024-05-17 13:17:00', '2024-05-17 13:17:00');
INSERT INTO `user_salary_detail` VALUES (402, 52, 0.30, 0.30, '4799b3ea-fcca-4f07-bb1f-7c986a38378a', 1, 1, '2024-05-17 13:18:00', '2024-05-17 13:18:00');
INSERT INTO `user_salary_detail` VALUES (403, 56, 0.89, 0.89, 'f16ac42b-9217-4e6d-87e1-e3bbfa5663b7', 3, 3, '2024-05-17 13:18:00', '2024-05-17 13:18:00');
INSERT INTO `user_salary_detail` VALUES (404, 57, 2.98, 2.98, '0bdd0f19-4e07-4912-bdc7-29b8e0b3a46d', 5, 5, '2024-05-17 13:18:00', '2024-05-17 13:18:00');
INSERT INTO `user_salary_detail` VALUES (405, 52, 0.30, 0.30, '21ef78c8-9b4b-4e18-be81-92af3f045981', 1, 1, '2024-05-17 13:19:00', '2024-05-17 13:19:00');
INSERT INTO `user_salary_detail` VALUES (406, 52, 0.30, 0.30, 'b4e0ca8e-c082-4008-9809-3a9a1853ecf2', 1, 1, '2024-05-17 13:20:00', '2024-05-17 13:20:00');
INSERT INTO `user_salary_detail` VALUES (407, 52, 0.30, 0.30, '1e562331-1f84-4710-8b31-142dbdc02117', 1, 1, '2024-05-17 13:21:00', '2024-05-17 13:21:00');
INSERT INTO `user_salary_detail` VALUES (408, 56, 0.89, 0.89, '08f5e6e4-1607-45cb-a8b6-33cb1bd4cbed', 3, 3, '2024-05-17 13:21:00', '2024-05-17 13:21:00');
INSERT INTO `user_salary_detail` VALUES (409, 52, 0.30, 0.30, 'c20b3bc6-a433-4eca-ae11-240e6e67241a', 1, 1, '2024-05-17 13:22:00', '2024-05-17 13:22:00');
INSERT INTO `user_salary_detail` VALUES (410, 53, 79.86, 79.86, 'dfa93611-471d-440e-afba-3adb677051b2', 161, 161, '2024-05-17 13:22:48', '2024-05-17 13:22:48');
INSERT INTO `user_salary_detail` VALUES (411, 52, 0.30, 0.30, '7d0cd2f6-c6c0-438d-80db-edcad481b09f', 1, 1, '2024-05-17 13:23:00', '2024-05-17 13:23:00');
INSERT INTO `user_salary_detail` VALUES (412, 57, 2.98, 2.98, '14b3fa4d-ae41-471f-a0c0-f2f83764fc6e', 5, 5, '2024-05-17 13:23:00', '2024-05-17 13:23:00');
INSERT INTO `user_salary_detail` VALUES (413, 52, 0.30, 0.30, '1dad510d-0bc3-4965-b7bc-fe22e06e3cb1', 1, 1, '2024-05-17 13:24:00', '2024-05-17 13:24:00');
INSERT INTO `user_salary_detail` VALUES (414, 56, 0.89, 0.89, 'c14aef7a-b230-4b78-b34e-9ffb453b3df0', 3, 3, '2024-05-17 13:24:00', '2024-05-17 13:24:00');
INSERT INTO `user_salary_detail` VALUES (415, 53, 0.99, 0.99, 'a7a2d3f1-ae4d-4ce9-a3e6-405e8adcd696', 2, 2, '2024-05-17 13:24:13', '2024-05-17 13:24:13');
INSERT INTO `user_salary_detail` VALUES (416, 52, 0.30, 0.30, 'b83714bf-3f24-4191-8712-535a641a91b8', 1, 1, '2024-05-17 13:25:00', '2024-05-17 13:25:00');
INSERT INTO `user_salary_detail` VALUES (417, 52, 0.30, 0.30, '66947bbf-2133-465b-b2e4-86813e4dd048', 1, 1, '2024-05-17 13:26:00', '2024-05-17 13:26:00');
INSERT INTO `user_salary_detail` VALUES (418, 52, 0.30, 0.30, '362d7930-1304-4850-a741-01664b6a680a', 1, 1, '2024-05-17 13:27:00', '2024-05-17 13:27:00');
INSERT INTO `user_salary_detail` VALUES (419, 56, 0.89, 0.89, '05c57899-8ab9-4ead-84c8-11788be5fd7f', 3, 3, '2024-05-17 13:27:00', '2024-05-17 13:27:00');
INSERT INTO `user_salary_detail` VALUES (420, 52, 0.30, 0.30, '56e54ed7-958a-4a25-8908-26e6e73f78d1', 1, 1, '2024-05-17 13:28:00', '2024-05-17 13:28:00');
INSERT INTO `user_salary_detail` VALUES (421, 57, 2.98, 2.98, '4b52c358-7283-4c76-95dc-3649c777f089', 5, 5, '2024-05-17 13:28:00', '2024-05-17 13:28:00');
INSERT INTO `user_salary_detail` VALUES (422, 52, 0.30, 0.30, 'ec858c12-5303-4891-bd83-edefaf38446e', 1, 1, '2024-05-17 13:29:00', '2024-05-17 13:29:00');
INSERT INTO `user_salary_detail` VALUES (423, 52, 4.76, 4.76, '9930c480-6a30-4660-819d-27dc1cbdb5ec', 16, 16, '2024-05-17 13:45:56', '2024-05-17 13:45:56');
INSERT INTO `user_salary_detail` VALUES (424, 56, 5.36, 5.36, 'e0064844-bf5d-4cd5-81c2-0dce3f375630', 18, 18, '2024-05-17 13:45:56', '2024-05-17 13:45:56');
INSERT INTO `user_salary_detail` VALUES (425, 57, 10.12, 10.12, '07005e91-bf04-4917-9604-b0d241b8f5ec', 17, 17, '2024-05-17 13:45:57', '2024-05-17 13:45:57');
INSERT INTO `user_salary_detail` VALUES (426, 52, 0.30, 0.30, 'd8107888-3cdc-483c-917d-0d4eef89d1e9', 1, 1, '2024-05-17 13:46:00', '2024-05-17 13:46:00');
INSERT INTO `user_salary_detail` VALUES (427, 52, 0.30, 0.30, '2b769b38-f147-4e6c-a482-6a9b1c15f8e0', 1, 1, '2024-05-17 13:47:00', '2024-05-17 13:47:00');
INSERT INTO `user_salary_detail` VALUES (428, 52, 0.30, 0.30, '7dabc75c-30c7-4906-ba5c-547574ada25b', 1, 1, '2024-05-17 13:48:00', '2024-05-17 13:48:00');
INSERT INTO `user_salary_detail` VALUES (429, 56, 0.89, 0.89, 'ac59c295-7431-465a-bcfc-684b54e4b345', 3, 3, '2024-05-17 13:48:00', '2024-05-17 13:48:00');
INSERT INTO `user_salary_detail` VALUES (430, 52, 0.30, 0.30, 'ce3934c5-f222-496f-a78f-240f909d39d7', 1, 1, '2024-05-17 13:49:00', '2024-05-17 13:49:00');
INSERT INTO `user_salary_detail` VALUES (431, 52, 0.30, 0.30, '068c531c-eba0-466f-8276-fdec235004af', 1, 1, '2024-05-17 13:50:00', '2024-05-17 13:50:00');
INSERT INTO `user_salary_detail` VALUES (432, 57, 2.98, 2.98, '0db350cb-1410-4c44-9081-87554f05acd1', 5, 5, '2024-05-17 13:50:00', '2024-05-17 13:50:00');
INSERT INTO `user_salary_detail` VALUES (433, 52, 0.30, 0.30, '18a76a9f-562e-4373-98a4-783cf5aa48b3', 1, 1, '2024-05-17 13:51:00', '2024-05-17 13:51:00');
INSERT INTO `user_salary_detail` VALUES (434, 56, 0.89, 0.89, '85780fbc-d6a1-4d98-a4f7-f3895bbbd76b', 3, 3, '2024-05-17 13:51:00', '2024-05-17 13:51:00');
INSERT INTO `user_salary_detail` VALUES (435, 52, 0.30, 0.30, 'd43af0b5-7bd0-4c85-9556-1f9795a0f5cd', 1, 1, '2024-05-17 13:52:00', '2024-05-17 13:52:00');
INSERT INTO `user_salary_detail` VALUES (436, 52, 0.30, 0.30, 'b36f9736-f91a-453d-9f1b-04318d40d462', 1, 1, '2024-05-17 13:53:00', '2024-05-17 13:53:00');
INSERT INTO `user_salary_detail` VALUES (437, 52, 0.30, 0.30, '642321fc-4acc-4f51-acb0-33756b77e283', 1, 1, '2024-05-17 13:54:00', '2024-05-17 13:54:00');
INSERT INTO `user_salary_detail` VALUES (438, 56, 0.89, 0.89, 'cba67f7e-c239-4390-ad01-1b08eb0a4b8a', 3, 3, '2024-05-17 13:54:00', '2024-05-17 13:54:00');
INSERT INTO `user_salary_detail` VALUES (439, 52, 0.30, 0.30, 'b30f734e-1779-407c-bbb3-d32758d38b07', 1, 1, '2024-05-17 13:55:00', '2024-05-17 13:55:00');
INSERT INTO `user_salary_detail` VALUES (440, 57, 2.98, 2.98, '8c397429-2f31-4cf1-a6b2-d43dc95455db', 5, 5, '2024-05-17 13:55:00', '2024-05-17 13:55:00');
INSERT INTO `user_salary_detail` VALUES (441, 52, 0.30, 0.30, '50485e47-05d7-4428-8c82-a91dc41c1da8', 1, 1, '2024-05-17 13:56:00', '2024-05-17 13:56:00');
INSERT INTO `user_salary_detail` VALUES (442, 52, 0.30, 0.30, '0e37d5a9-6114-4453-b825-83b9b4d7891c', 1, 1, '2024-05-17 13:57:00', '2024-05-17 13:57:00');
INSERT INTO `user_salary_detail` VALUES (443, 56, 0.89, 0.89, 'c70a88d9-4b9f-4ee9-9b05-b0adca1de1d9', 3, 3, '2024-05-17 13:57:00', '2024-05-17 13:57:00');
INSERT INTO `user_salary_detail` VALUES (444, 52, 0.30, 0.30, '8809a315-90bd-4210-9d55-f94ef6c99ced', 1, 1, '2024-05-17 13:58:00', '2024-05-17 13:58:00');
INSERT INTO `user_salary_detail` VALUES (445, 52, 0.30, 0.30, 'cb6d2663-aec0-4765-840f-b6e8e56a6658', 1, 1, '2024-05-17 13:59:00', '2024-05-17 13:59:00');
INSERT INTO `user_salary_detail` VALUES (446, 52, 0.30, 0.30, '2edf6464-6791-4297-8706-edf0893a3b1c', 1, 1, '2024-05-17 14:00:00', '2024-05-17 14:00:00');
INSERT INTO `user_salary_detail` VALUES (447, 56, 0.89, 0.89, 'aaa74d32-22e5-427a-8853-0d99d4470f86', 3, 3, '2024-05-17 14:00:00', '2024-05-17 14:00:00');
INSERT INTO `user_salary_detail` VALUES (448, 57, 2.98, 2.98, '6b4bb958-9be4-404b-a742-b1272409ac0d', 5, 5, '2024-05-17 14:00:00', '2024-05-17 14:00:00');
INSERT INTO `user_salary_detail` VALUES (449, 52, 0.30, 0.30, 'e47a2b27-1aa0-4fda-90d6-4566c13d6044', 1, 1, '2024-05-17 14:01:00', '2024-05-17 14:01:00');
INSERT INTO `user_salary_detail` VALUES (450, 52, 0.30, 0.30, 'eefcfc18-f1c4-4837-a490-b009b28b1be5', 1, 1, '2024-05-17 14:02:00', '2024-05-17 14:02:00');
INSERT INTO `user_salary_detail` VALUES (451, 52, 0.30, 0.30, 'bf97d8df-3039-4c59-9a66-cc8654814190', 1, 1, '2024-05-17 14:03:00', '2024-05-17 14:03:00');
INSERT INTO `user_salary_detail` VALUES (452, 56, 0.89, 0.89, 'fab04970-33b3-41f9-9c6a-3653a75db069', 3, 3, '2024-05-17 14:03:00', '2024-05-17 14:03:00');
INSERT INTO `user_salary_detail` VALUES (453, 52, 0.30, 0.30, 'd76f3eb1-55da-44b1-a1c3-c2995020102b', 1, 1, '2024-05-17 14:04:00', '2024-05-17 14:04:00');
INSERT INTO `user_salary_detail` VALUES (454, 52, 0.30, 0.30, '0502cced-8758-450e-8f5e-d2af879cd470', 1, 1, '2024-05-17 14:05:00', '2024-05-17 14:05:00');
INSERT INTO `user_salary_detail` VALUES (455, 57, 2.98, 2.98, '3e89a46f-21fc-44b0-9307-13a82f0e80c4', 5, 5, '2024-05-17 14:05:00', '2024-05-17 14:05:00');
INSERT INTO `user_salary_detail` VALUES (456, 52, 0.30, 0.30, '61532516-13de-4d7b-b263-6f1a37a51634', 1, 1, '2024-05-17 14:06:00', '2024-05-17 14:06:00');
INSERT INTO `user_salary_detail` VALUES (457, 56, 0.89, 0.89, 'dcd57373-2ece-4e2d-846e-020dbad631aa', 3, 3, '2024-05-17 14:06:00', '2024-05-17 14:06:00');
INSERT INTO `user_salary_detail` VALUES (458, 52, 0.30, 0.30, 'f7087acf-25c9-4a92-b0c9-3a1628ec8585', 1, 1, '2024-05-17 14:07:00', '2024-05-17 14:07:00');
INSERT INTO `user_salary_detail` VALUES (459, 52, 0.30, 0.30, '98d34fd9-4855-483c-89e5-ffb118417dca', 1, 1, '2024-05-17 14:08:00', '2024-05-17 14:08:00');
INSERT INTO `user_salary_detail` VALUES (460, 52, 0.30, 0.30, '54a50bb4-feed-4c82-b414-008d53e32f00', 1, 1, '2024-05-17 14:09:00', '2024-05-17 14:09:00');
INSERT INTO `user_salary_detail` VALUES (461, 56, 0.89, 0.89, '91c33837-edb2-44c1-a54e-d23ed831cd76', 3, 3, '2024-05-17 14:09:00', '2024-05-17 14:09:00');
INSERT INTO `user_salary_detail` VALUES (462, 52, 0.30, 0.30, '70c9909c-9dd8-4018-bed0-52fe588335a1', 1, 1, '2024-05-17 14:10:00', '2024-05-17 14:10:00');
INSERT INTO `user_salary_detail` VALUES (463, 57, 2.98, 2.98, '7feec138-8d0d-45b0-92f7-cf0b67cbdf2e', 5, 5, '2024-05-17 14:10:00', '2024-05-17 14:10:00');
INSERT INTO `user_salary_detail` VALUES (464, 52, 0.30, 0.30, '07ba6870-4058-46ac-ac09-b221ebae3be7', 1, 1, '2024-05-17 14:11:00', '2024-05-17 14:11:00');
INSERT INTO `user_salary_detail` VALUES (465, 52, 0.30, 0.30, 'b4712e6f-bd89-4409-8cc6-237a5fd23adf', 1, 1, '2024-05-17 14:12:00', '2024-05-17 14:12:00');
INSERT INTO `user_salary_detail` VALUES (466, 56, 0.89, 0.89, 'b1d09467-3120-4e9b-99a4-d7278c86f426', 3, 3, '2024-05-17 14:12:00', '2024-05-17 14:12:00');
INSERT INTO `user_salary_detail` VALUES (467, 52, 0.30, 0.30, '480bdcc6-d492-4236-bfb6-5a5860c44701', 1, 1, '2024-05-17 14:13:00', '2024-05-17 14:13:00');
INSERT INTO `user_salary_detail` VALUES (468, 52, 0.30, 0.30, '063dffd4-909c-4339-8bcb-7a6a7386294a', 1, 1, '2024-05-17 14:14:00', '2024-05-17 14:14:00');
INSERT INTO `user_salary_detail` VALUES (469, 52, 0.30, 0.30, '8970160c-4770-42d6-9af2-b9c3d344998c', 1, 1, '2024-05-17 14:15:00', '2024-05-17 14:15:00');
INSERT INTO `user_salary_detail` VALUES (470, 56, 0.89, 0.89, 'ea997ba3-a897-4a3d-8614-619ab556c070', 3, 3, '2024-05-17 14:15:00', '2024-05-17 14:15:00');
INSERT INTO `user_salary_detail` VALUES (471, 57, 2.98, 2.98, '363c740e-e372-4223-bd09-65d2effddd17', 5, 5, '2024-05-17 14:15:00', '2024-05-17 14:15:00');
INSERT INTO `user_salary_detail` VALUES (472, 52, 0.30, 0.30, 'd4d583e6-4320-4f49-8276-e311bc4a0bae', 1, 1, '2024-05-17 14:16:00', '2024-05-17 14:16:00');
INSERT INTO `user_salary_detail` VALUES (473, 52, 0.30, 0.30, 'f5d6302c-8542-4a1c-bfd7-a62fad255e74', 1, 1, '2024-05-17 14:17:00', '2024-05-17 14:17:00');
INSERT INTO `user_salary_detail` VALUES (474, 52, 0.30, 0.30, '39dabb32-9957-42ea-8849-98202016c7ba', 1, 1, '2024-05-17 14:18:00', '2024-05-17 14:18:00');
INSERT INTO `user_salary_detail` VALUES (475, 56, 0.89, 0.89, 'e08485ba-f555-42ec-8c45-af8cd6e7959e', 3, 3, '2024-05-17 14:18:00', '2024-05-17 14:18:00');
INSERT INTO `user_salary_detail` VALUES (476, 52, 0.30, 0.30, 'e5118950-2c8b-4ad5-8022-d5ae5dbda793', 1, 1, '2024-05-17 14:19:00', '2024-05-17 14:19:00');
INSERT INTO `user_salary_detail` VALUES (477, 52, 0.30, 0.30, '8168576e-9c19-4620-a274-3df6364f62ea', 1, 1, '2024-05-17 14:20:00', '2024-05-17 14:20:00');
INSERT INTO `user_salary_detail` VALUES (478, 57, 2.98, 2.98, '2bc5f7d4-4ab0-422a-9450-bc7ccb2c7f1b', 5, 5, '2024-05-17 14:20:00', '2024-05-17 14:20:00');
INSERT INTO `user_salary_detail` VALUES (479, 52, 0.30, 0.30, '2429be22-3144-4219-bdb3-2cf9b430b49d', 1, 1, '2024-05-17 14:21:00', '2024-05-17 14:21:00');
INSERT INTO `user_salary_detail` VALUES (480, 56, 0.89, 0.89, 'c9ae0110-58d8-4a47-9665-12563e6cac16', 3, 3, '2024-05-17 14:21:00', '2024-05-17 14:21:00');
INSERT INTO `user_salary_detail` VALUES (481, 52, 0.30, 0.30, '9c020f8d-5120-440e-b716-28c4e42ef68d', 1, 1, '2024-05-17 14:22:00', '2024-05-17 14:22:00');
INSERT INTO `user_salary_detail` VALUES (482, 52, 0.30, 0.30, '807aadef-5b28-4e14-8de3-21961047faf0', 1, 1, '2024-05-17 14:23:00', '2024-05-17 14:23:00');
INSERT INTO `user_salary_detail` VALUES (483, 52, 0.30, 0.30, '29ad3886-3127-4b97-91f2-320bf4348599', 1, 1, '2024-05-17 14:24:00', '2024-05-17 14:24:00');
INSERT INTO `user_salary_detail` VALUES (484, 56, 0.89, 0.89, '7cb2ea5c-e3de-434c-abe8-9b1eb501005a', 3, 3, '2024-05-17 14:24:00', '2024-05-17 14:24:00');
INSERT INTO `user_salary_detail` VALUES (485, 52, 0.30, 0.30, 'b9e98200-4819-4e71-838c-e88724620793', 1, 1, '2024-05-17 14:25:00', '2024-05-17 14:25:00');
INSERT INTO `user_salary_detail` VALUES (486, 57, 2.98, 2.98, 'e66667ea-e839-4342-aa32-110ecd618403', 5, 5, '2024-05-17 14:25:00', '2024-05-17 14:25:00');
INSERT INTO `user_salary_detail` VALUES (487, 52, 0.30, 0.30, '2b68da95-4fff-4c8a-8f8a-82301987a828', 1, 1, '2024-05-17 14:26:00', '2024-05-17 14:26:00');
INSERT INTO `user_salary_detail` VALUES (488, 52, 4.76, 4.76, '2ba59504-65b5-442b-abd9-3995f593f3d3', 16, 16, '2024-05-17 14:42:40', '2024-05-17 14:42:40');
INSERT INTO `user_salary_detail` VALUES (489, 56, 5.36, 5.36, '91baa203-b8df-4953-8262-01b8637a4cf4', 18, 18, '2024-05-17 14:42:40', '2024-05-17 14:42:40');
INSERT INTO `user_salary_detail` VALUES (490, 57, 10.12, 10.12, '9448f59b-bc90-4168-b3eb-bc2e0350f378', 17, 17, '2024-05-17 14:42:40', '2024-05-17 14:42:40');
INSERT INTO `user_salary_detail` VALUES (491, 52, 0.30, 0.30, 'a930c6c6-65fb-440b-8e73-cbe9b0d40832', 1, 1, '2024-05-17 14:43:00', '2024-05-17 14:43:00');
INSERT INTO `user_salary_detail` VALUES (492, 52, 0.30, 0.30, 'ec81e3c5-81d6-4417-8df2-e48595adf550', 1, 1, '2024-05-17 14:44:00', '2024-05-17 14:44:00');
INSERT INTO `user_salary_detail` VALUES (493, 52, 0.30, 0.30, '1c43f080-58ed-4425-89dd-4b65eabc98dc', 1, 1, '2024-05-17 14:45:00', '2024-05-17 14:45:00');
INSERT INTO `user_salary_detail` VALUES (494, 56, 0.89, 0.89, '9b7a7259-d1b7-4b1d-99c8-a12c0adb764a', 3, 3, '2024-05-17 14:45:00', '2024-05-17 14:45:00');
INSERT INTO `user_salary_detail` VALUES (495, 52, 0.30, 0.30, '8431ebfd-4360-4004-8a79-cd0f05d0864f', 1, 1, '2024-05-17 14:46:00', '2024-05-17 14:46:00');
INSERT INTO `user_salary_detail` VALUES (496, 52, 0.30, 0.30, '2fb8cab9-b51b-403c-83e3-f9b0c9a14c76', 1, 1, '2024-05-17 14:47:00', '2024-05-17 14:47:00');
INSERT INTO `user_salary_detail` VALUES (497, 57, 2.98, 2.98, '1d61ae7a-f691-4dac-86a9-3f4d0e28c698', 5, 5, '2024-05-17 14:47:00', '2024-05-17 14:47:00');
INSERT INTO `user_salary_detail` VALUES (498, 52, 0.30, 0.30, '8757b5a5-4a2f-4440-a249-4f9b0865db8d', 1, 1, '2024-05-17 14:48:00', '2024-05-17 14:48:00');
INSERT INTO `user_salary_detail` VALUES (499, 56, 0.89, 0.89, '0c8400fb-1386-4fe3-b6ba-3de08b9bf1bc', 3, 3, '2024-05-17 14:48:00', '2024-05-17 14:48:00');
INSERT INTO `user_salary_detail` VALUES (500, 52, 0.30, 0.30, 'f3d27919-d2e9-43b3-bf81-c608f2fc51c8', 1, 1, '2024-05-17 14:49:00', '2024-05-17 14:49:00');
INSERT INTO `user_salary_detail` VALUES (501, 52, 0.30, 0.30, 'a3bfc2d6-4cc2-415d-a617-3cc0da5db8e6', 1, 1, '2024-05-17 14:50:00', '2024-05-17 14:50:00');
INSERT INTO `user_salary_detail` VALUES (502, 52, 0.30, 0.30, '606c1e20-6fae-4e41-b940-8151452ea176', 1, 1, '2024-05-17 14:51:00', '2024-05-17 14:51:00');
INSERT INTO `user_salary_detail` VALUES (503, 56, 0.89, 0.89, '5c94d9e1-5c04-441b-a76b-1151191cabea', 3, 3, '2024-05-17 14:51:00', '2024-05-17 14:51:00');
INSERT INTO `user_salary_detail` VALUES (504, 52, 0.30, 0.30, 'daa7fd71-c9c8-4f0f-8698-ba36537fa889', 1, 1, '2024-05-17 14:52:00', '2024-05-17 14:52:00');
INSERT INTO `user_salary_detail` VALUES (505, 57, 2.98, 2.98, 'cedb1a47-55c8-43c7-9868-4ff967326ea0', 5, 5, '2024-05-17 14:52:00', '2024-05-17 14:52:00');
INSERT INTO `user_salary_detail` VALUES (506, 52, 0.30, 0.30, 'a333506b-4f40-455f-a0aa-ef36487d60eb', 1, 1, '2024-05-17 14:53:00', '2024-05-17 14:53:00');
INSERT INTO `user_salary_detail` VALUES (507, 52, 0.30, 0.30, 'd6419d6b-2805-4e7a-835d-71c4be825f33', 1, 1, '2024-05-17 14:54:00', '2024-05-17 14:54:00');
INSERT INTO `user_salary_detail` VALUES (508, 56, 0.89, 0.89, 'd5279d9a-942c-4780-a850-410d50ec01b4', 3, 3, '2024-05-17 14:54:00', '2024-05-17 14:54:00');
INSERT INTO `user_salary_detail` VALUES (509, 52, 0.30, 0.30, '8369efa1-5969-4634-acb0-9cf498e47f19', 1, 1, '2024-05-17 14:55:00', '2024-05-17 14:55:00');
INSERT INTO `user_salary_detail` VALUES (510, 52, 0.30, 0.30, '67ec5c0f-1e3b-4ac2-bc2b-821dff6b28e1', 1, 1, '2024-05-17 14:56:00', '2024-05-17 14:56:00');
INSERT INTO `user_salary_detail` VALUES (511, 52, 0.30, 0.30, '171edecd-84c6-427b-8d97-109d1c2a7a9a', 1, 1, '2024-05-17 14:57:00', '2024-05-17 14:57:00');
INSERT INTO `user_salary_detail` VALUES (512, 56, 0.89, 0.89, '01b00913-d66a-40a9-ac71-37d037101c32', 3, 3, '2024-05-17 14:57:00', '2024-05-17 14:57:00');
INSERT INTO `user_salary_detail` VALUES (513, 57, 2.98, 2.98, '90b78006-acfe-4baa-aacb-31a05628bf4b', 5, 5, '2024-05-17 14:57:00', '2024-05-17 14:57:00');
INSERT INTO `user_salary_detail` VALUES (514, 52, 0.30, 0.30, '465cd8fa-6af5-4e5a-b125-4c3123542d51', 1, 1, '2024-05-17 14:58:00', '2024-05-17 14:58:00');
INSERT INTO `user_salary_detail` VALUES (515, 52, 0.30, 0.30, 'd67ad88d-db50-4aa3-a56e-ad4aad4fdf10', 1, 1, '2024-05-17 14:59:00', '2024-05-17 14:59:00');
INSERT INTO `user_salary_detail` VALUES (516, 52, 0.30, 0.30, '489f502a-58a2-4f2c-8a33-6d2b9e9e29db', 1, 1, '2024-05-17 15:00:00', '2024-05-17 15:00:00');
INSERT INTO `user_salary_detail` VALUES (517, 56, 0.89, 0.89, '7b866008-a350-4f4f-8b68-660414961dbc', 3, 3, '2024-05-17 15:00:00', '2024-05-17 15:00:00');
INSERT INTO `user_salary_detail` VALUES (518, 52, 0.30, 0.30, '51903292-bdaf-4072-adbc-936890f4c1fb', 1, 1, '2024-05-17 15:01:00', '2024-05-17 15:01:00');
INSERT INTO `user_salary_detail` VALUES (519, 52, 0.30, 0.30, '54eec79d-3d0a-4b7a-b4f4-7e82c90fe3c6', 1, 1, '2024-05-17 15:02:00', '2024-05-17 15:02:00');
INSERT INTO `user_salary_detail` VALUES (520, 57, 2.98, 2.98, 'af21ee68-a8de-4226-a58b-b4c06c74449a', 5, 5, '2024-05-17 15:02:00', '2024-05-17 15:02:00');
INSERT INTO `user_salary_detail` VALUES (521, 52, 0.30, 0.30, '034e7c27-4bbe-4ea5-aef4-0a8dc17ecd35', 1, 1, '2024-05-17 15:03:00', '2024-05-17 15:03:00');
INSERT INTO `user_salary_detail` VALUES (522, 56, 0.89, 0.89, '6a685fa7-42c9-4a84-ad4c-7b1f838afa46', 3, 3, '2024-05-17 15:03:00', '2024-05-17 15:03:00');
INSERT INTO `user_salary_detail` VALUES (523, 52, 0.30, 0.30, 'c3a15941-4f19-465e-9a11-ddd8b9c343c7', 1, 1, '2024-05-17 15:04:00', '2024-05-17 15:04:00');
INSERT INTO `user_salary_detail` VALUES (524, 52, 0.30, 0.30, '43c60098-fd5e-4ebb-841e-830d318f02c4', 1, 1, '2024-05-17 15:05:00', '2024-05-17 15:05:00');
INSERT INTO `user_salary_detail` VALUES (525, 52, 0.30, 0.30, 'a2ad6a7d-7205-4c30-8e78-baaba560e3f9', 1, 1, '2024-05-17 15:06:00', '2024-05-17 15:06:00');
INSERT INTO `user_salary_detail` VALUES (526, 56, 0.89, 0.89, '30773089-1b95-42e3-8b5f-86faf72f7b4f', 3, 3, '2024-05-17 15:06:00', '2024-05-17 15:06:00');
INSERT INTO `user_salary_detail` VALUES (527, 52, 0.30, 0.30, 'b442816d-aff5-44fe-89eb-eb5a0a48bd39', 1, 1, '2024-05-17 15:07:00', '2024-05-17 15:07:00');
INSERT INTO `user_salary_detail` VALUES (528, 57, 2.98, 2.98, 'd67ede2b-3ee6-4306-8bb1-2be1b9e8815e', 5, 5, '2024-05-17 15:07:00', '2024-05-17 15:07:00');
INSERT INTO `user_salary_detail` VALUES (529, 52, 0.30, 0.30, 'd2292df8-2669-457c-88a6-0823fcf13ae8', 1, 1, '2024-05-17 15:08:00', '2024-05-17 15:08:00');
INSERT INTO `user_salary_detail` VALUES (530, 52, 0.30, 0.30, 'c48cf31a-6fad-4783-8096-23bd824c1d8e', 1, 1, '2024-05-17 15:09:00', '2024-05-17 15:09:00');
INSERT INTO `user_salary_detail` VALUES (531, 56, 0.89, 0.89, 'c86e0073-368e-4e22-88bb-ad45c4e5c87e', 3, 3, '2024-05-17 15:09:00', '2024-05-17 15:09:00');
INSERT INTO `user_salary_detail` VALUES (532, 52, 0.30, 0.30, '2379913c-3e5e-4a9e-abb1-67ea8213c928', 1, 1, '2024-05-17 15:10:00', '2024-05-17 15:10:00');
INSERT INTO `user_salary_detail` VALUES (533, 52, 0.30, 0.30, '52c883a1-6af0-40c8-9caa-3da13d89a3b1', 1, 1, '2024-05-17 15:11:00', '2024-05-17 15:11:00');
INSERT INTO `user_salary_detail` VALUES (534, 52, 0.30, 0.30, 'ecd1e6a7-c444-40d4-bf71-3e3b5ddf8a85', 1, 1, '2024-05-17 15:12:00', '2024-05-17 15:12:00');
INSERT INTO `user_salary_detail` VALUES (535, 56, 0.89, 0.89, 'dc9363cb-7b9f-492a-ba4a-d65b4a355fd9', 3, 3, '2024-05-17 15:12:00', '2024-05-17 15:12:00');
INSERT INTO `user_salary_detail` VALUES (536, 57, 2.98, 2.98, '6b07fe4a-2a91-467a-b7f6-27b6bd98db19', 5, 5, '2024-05-17 15:12:00', '2024-05-17 15:12:00');
INSERT INTO `user_salary_detail` VALUES (537, 52, 0.30, 0.30, 'd0c36cbb-69de-44a8-b5ec-6b6de5a60859', 1, 1, '2024-05-17 15:13:00', '2024-05-17 15:13:00');
INSERT INTO `user_salary_detail` VALUES (538, 52, 0.30, 0.30, '1bd4af40-7f38-408c-a8d5-c6be2e7dd604', 1, 1, '2024-05-17 15:14:00', '2024-05-17 15:14:00');
INSERT INTO `user_salary_detail` VALUES (539, 52, 0.30, 0.30, '5a7bc84c-68c2-47ba-aead-e79bb3b08fee', 1, 1, '2024-05-17 15:15:00', '2024-05-17 15:15:00');
INSERT INTO `user_salary_detail` VALUES (540, 56, 0.89, 0.89, '552427d5-7760-4582-a9d1-81f1388e8a52', 3, 3, '2024-05-17 15:15:00', '2024-05-17 15:15:00');
INSERT INTO `user_salary_detail` VALUES (541, 52, 0.30, 0.30, 'c4597f51-207e-48c1-b6aa-8b051dbf99f1', 1, 1, '2024-05-17 15:16:00', '2024-05-17 15:16:00');
INSERT INTO `user_salary_detail` VALUES (542, 52, 0.30, 0.30, '7a1d4e04-3c05-4974-a0a3-81ce172790a9', 1, 1, '2024-05-17 15:17:00', '2024-05-17 15:17:00');
INSERT INTO `user_salary_detail` VALUES (543, 57, 2.98, 2.98, '31a1a8d4-c8cd-43f2-9cd7-b8c62464bb3c', 5, 5, '2024-05-17 15:17:00', '2024-05-17 15:17:00');
INSERT INTO `user_salary_detail` VALUES (544, 52, 0.30, 0.30, '8111f0fc-ab42-441f-8680-1f55a45be5c4', 1, 1, '2024-05-17 15:18:00', '2024-05-17 15:18:00');
INSERT INTO `user_salary_detail` VALUES (545, 56, 0.89, 0.89, 'c27f35f8-8b40-4bc4-9fb4-6bdfb85fa310', 3, 3, '2024-05-17 15:18:00', '2024-05-17 15:18:00');
INSERT INTO `user_salary_detail` VALUES (546, 52, 0.30, 0.30, 'f995f43a-a24a-4a23-9f86-ce0bc2dbcbb6', 1, 1, '2024-05-17 15:19:00', '2024-05-17 15:19:00');
INSERT INTO `user_salary_detail` VALUES (547, 52, 0.30, 0.30, '0ef868a9-99b4-431a-aaee-923f2127acd9', 1, 1, '2024-05-17 15:20:00', '2024-05-17 15:20:00');
INSERT INTO `user_salary_detail` VALUES (548, 52, 0.30, 0.30, '788e2dc3-fe9f-4744-a8c7-690d1ebd565e', 1, 1, '2024-05-17 15:21:00', '2024-05-17 15:21:00');
INSERT INTO `user_salary_detail` VALUES (549, 56, 0.89, 0.89, '0b7a90cb-cf4b-43d3-8cad-51ce5831b24e', 3, 3, '2024-05-17 15:21:00', '2024-05-17 15:21:00');
INSERT INTO `user_salary_detail` VALUES (550, 52, 0.30, 0.30, 'bc44f444-fb5c-4f0f-a491-ad34bd9e22fe', 1, 1, '2024-05-17 15:22:00', '2024-05-17 15:22:00');
INSERT INTO `user_salary_detail` VALUES (551, 57, 2.98, 2.98, 'f9486931-fa0d-4443-8e2c-1ad56a1c663e', 5, 5, '2024-05-17 15:22:00', '2024-05-17 15:22:00');
INSERT INTO `user_salary_detail` VALUES (552, 52, 0.30, 0.30, '447c34fd-ff47-4d5b-a3f3-4f56ad55f64b', 1, 1, '2024-05-17 15:23:00', '2024-05-17 15:23:00');
INSERT INTO `user_salary_detail` VALUES (553, 52, 0.30, 0.30, '805b9f1d-5350-4044-973a-82fc2c586209', 1, 1, '2024-05-17 15:24:00', '2024-05-17 15:24:00');
INSERT INTO `user_salary_detail` VALUES (554, 53, 59.52, 59.52, 'ed9ace09-f5fa-4031-89c4-206556100f5d', 120, 120, '2024-05-17 15:24:00', '2024-05-17 15:24:00');
INSERT INTO `user_salary_detail` VALUES (555, 56, 0.89, 0.89, '31ae8a24-8f16-458b-9e88-e5dc285f101f', 3, 3, '2024-05-17 15:24:00', '2024-05-17 15:24:00');
INSERT INTO `user_salary_detail` VALUES (556, 52, 0.30, 0.30, 'b5d755bf-dbcc-49bb-a2b6-9d480d293f97', 1, 1, '2024-05-17 15:25:00', '2024-05-17 15:25:00');
INSERT INTO `user_salary_detail` VALUES (557, 52, 0.30, 0.30, 'bc211c99-2bc6-4a2c-959b-4d26189ef0f9', 1, 1, '2024-05-17 15:26:00', '2024-05-17 15:26:00');
INSERT INTO `user_salary_detail` VALUES (558, 52, 0.30, 0.30, '7934807c-cd2e-4a3e-85fe-e3c570e1dd91', 1, 1, '2024-05-17 15:27:00', '2024-05-17 15:27:00');
INSERT INTO `user_salary_detail` VALUES (559, 56, 0.89, 0.89, '8e655112-1ed0-4b51-aced-62c1c9833359', 3, 3, '2024-05-17 15:27:00', '2024-05-17 15:27:00');
INSERT INTO `user_salary_detail` VALUES (560, 57, 2.98, 2.98, 'c8dcbe79-c593-470d-b7e3-27b13ff76154', 5, 5, '2024-05-17 15:27:00', '2024-05-17 15:27:00');
INSERT INTO `user_salary_detail` VALUES (561, 52, 0.30, 0.30, 'bdf545ca-c935-4a3f-a2fc-ea369773561b', 1, 1, '2024-05-17 15:28:00', '2024-05-17 15:28:00');
INSERT INTO `user_salary_detail` VALUES (562, 52, 0.30, 0.30, 'c9244615-7f40-4226-99f3-870cb7defe3f', 1, 1, '2024-05-17 15:29:00', '2024-05-17 15:29:00');
INSERT INTO `user_salary_detail` VALUES (563, 52, 0.30, 0.30, 'cb564466-e482-476f-9f10-ac88be5ebcd4', 1, 1, '2024-05-17 15:30:00', '2024-05-17 15:30:00');
INSERT INTO `user_salary_detail` VALUES (564, 56, 0.89, 0.89, '07a972d5-3b91-4c9c-bac9-ad625f2dee1a', 3, 3, '2024-05-17 15:30:00', '2024-05-17 15:30:00');
INSERT INTO `user_salary_detail` VALUES (565, 52, 0.30, 0.30, 'f4db966a-6de1-4bbe-8ebd-ecc8c067f7cf', 1, 1, '2024-05-17 15:31:00', '2024-05-17 15:31:00');
INSERT INTO `user_salary_detail` VALUES (566, 52, 0.30, 0.30, '46fb1dd3-ac29-482e-947f-85ea96caa0c0', 1, 1, '2024-05-17 15:32:00', '2024-05-17 15:32:00');
INSERT INTO `user_salary_detail` VALUES (567, 57, 2.98, 2.98, 'b576b604-64c0-40b8-a199-a4a60d074e63', 5, 5, '2024-05-17 15:32:00', '2024-05-17 15:32:00');
INSERT INTO `user_salary_detail` VALUES (568, 52, 0.30, 0.30, 'f2e9a0ea-a934-43fd-826b-d6d211a05805', 1, 1, '2024-05-17 15:33:00', '2024-05-17 15:33:00');
INSERT INTO `user_salary_detail` VALUES (569, 56, 0.89, 0.89, 'b1489fe0-190d-4770-892b-cba150bc5aae', 3, 3, '2024-05-17 15:33:00', '2024-05-17 15:33:00');
INSERT INTO `user_salary_detail` VALUES (570, 52, 0.30, 0.30, 'f5be6257-15af-4852-a717-329090463415', 1, 1, '2024-05-17 15:34:00', '2024-05-17 15:34:00');
INSERT INTO `user_salary_detail` VALUES (571, 52, 0.30, 0.30, '9acf209d-c082-43ac-be34-79554773a2a6', 1, 1, '2024-05-17 15:35:00', '2024-05-17 15:35:00');
INSERT INTO `user_salary_detail` VALUES (572, 52, 0.30, 0.30, '8498d0ad-6c38-4d83-9125-d93bd76e11ca', 1, 1, '2024-05-17 15:36:00', '2024-05-17 15:36:00');
INSERT INTO `user_salary_detail` VALUES (573, 56, 0.89, 0.89, 'cafc9bc3-91e8-4a54-b85e-917fa9f67711', 3, 3, '2024-05-17 15:36:00', '2024-05-17 15:36:00');
INSERT INTO `user_salary_detail` VALUES (574, 52, 0.30, 0.30, '19f849bd-be56-4808-9fc8-e32a632b385a', 1, 1, '2024-05-17 15:37:00', '2024-05-17 15:37:00');
INSERT INTO `user_salary_detail` VALUES (575, 57, 2.98, 2.98, '78a5141e-b38e-4a45-9e59-207754b5fd1c', 5, 5, '2024-05-17 15:37:00', '2024-05-17 15:37:00');
INSERT INTO `user_salary_detail` VALUES (576, 52, 0.30, 0.30, '961e0331-b1b2-4447-8531-8ddd98410952', 1, 1, '2024-05-17 15:38:00', '2024-05-17 15:38:00');
INSERT INTO `user_salary_detail` VALUES (577, 52, 0.30, 0.30, '64fc9de2-c9e9-4914-b794-af051b367b4d', 1, 1, '2024-05-17 15:39:00', '2024-05-17 15:39:00');
INSERT INTO `user_salary_detail` VALUES (578, 56, 0.89, 0.89, '2c4a1fb9-208d-4036-aac1-a8302d5be18a', 3, 3, '2024-05-17 15:39:00', '2024-05-17 15:39:00');
INSERT INTO `user_salary_detail` VALUES (579, 52, 0.30, 0.30, 'd3136991-fee3-4431-b43f-3d1eeeb001cf', 1, 1, '2024-05-17 15:40:00', '2024-05-17 15:40:00');
INSERT INTO `user_salary_detail` VALUES (580, 52, 0.30, 0.30, 'cf16549f-1e86-45c1-b611-8effbca21944', 1, 1, '2024-05-17 15:41:00', '2024-05-17 15:41:00');
INSERT INTO `user_salary_detail` VALUES (581, 52, 5.06, 5.06, 'b1defa19-2456-41c7-bbd8-6b650efbb71b', 17, 17, '2024-05-17 15:58:00', '2024-05-17 15:58:00');
INSERT INTO `user_salary_detail` VALUES (582, 56, 5.65, 5.65, '5efc590b-5419-4bea-8dd6-9589f2bc82bf', 19, 19, '2024-05-17 15:58:00', '2024-05-17 15:58:00');
INSERT INTO `user_salary_detail` VALUES (583, 57, 12.50, 12.50, '29d3bf14-ddad-4a5c-b111-7859b3662393', 21, 21, '2024-05-17 15:58:00', '2024-05-17 15:58:00');
INSERT INTO `user_salary_detail` VALUES (584, 52, 4.76, 4.76, '3a14e32c-9302-484f-9103-963125b1d439', 16, 16, '2024-05-17 16:14:29', '2024-05-17 16:14:29');
INSERT INTO `user_salary_detail` VALUES (585, 56, 4.76, 4.76, 'f3a53a80-6b4b-4284-87f9-43243ad9a3ec', 16, 16, '2024-05-17 16:14:29', '2024-05-17 16:14:29');
INSERT INTO `user_salary_detail` VALUES (586, 57, 9.52, 9.52, 'f34304aa-3831-4a25-9ab9-7e22968a143b', 16, 16, '2024-05-17 16:14:29', '2024-05-17 16:14:29');
INSERT INTO `user_salary_detail` VALUES (587, 52, 0.30, 0.30, '3f35b3c8-9596-47d8-8d62-8f5b619c06b3', 1, 1, '2024-05-17 16:15:00', '2024-05-17 16:15:00');
INSERT INTO `user_salary_detail` VALUES (588, 52, 0.30, 0.30, '86611395-cdb5-4459-bb4c-56171cf06def', 1, 1, '2024-05-17 16:16:00', '2024-05-17 16:16:00');
INSERT INTO `user_salary_detail` VALUES (589, 52, 0.30, 0.30, '2e418b3e-7548-4dec-954e-67321037ed39', 1, 1, '2024-05-17 16:17:00', '2024-05-17 16:17:00');
INSERT INTO `user_salary_detail` VALUES (590, 56, 0.89, 0.89, '7a571981-ef25-411e-bb26-7737ad886b42', 3, 3, '2024-05-17 16:17:00', '2024-05-17 16:17:00');
INSERT INTO `user_salary_detail` VALUES (591, 52, 0.30, 0.30, 'cbfdce6c-c180-4ca4-b2f8-9c1df87aa905', 1, 1, '2024-05-17 16:18:00', '2024-05-17 16:18:00');
INSERT INTO `user_salary_detail` VALUES (592, 52, 0.30, 0.30, '97a3b03c-ecc6-4e57-853c-83ecb4daf24b', 1, 1, '2024-05-17 16:19:00', '2024-05-17 16:19:00');
INSERT INTO `user_salary_detail` VALUES (593, 57, 2.98, 2.98, '0fdca008-8756-4458-9c53-a4bc81df824c', 5, 5, '2024-05-17 16:19:00', '2024-05-17 16:19:00');
INSERT INTO `user_salary_detail` VALUES (594, 52, 0.30, 0.30, '069078db-fd8a-4304-9216-9590aafc697b', 1, 1, '2024-05-17 16:20:00', '2024-05-17 16:20:00');
INSERT INTO `user_salary_detail` VALUES (595, 56, 0.89, 0.89, '3fe64c6f-4ddb-4bc5-823a-536fd639abea', 3, 3, '2024-05-17 16:20:00', '2024-05-17 16:20:00');
INSERT INTO `user_salary_detail` VALUES (596, 52, 0.30, 0.30, '6ac5f537-09c5-4827-bb3e-7f7efd1d4159', 1, 1, '2024-05-17 16:21:00', '2024-05-17 16:21:00');
INSERT INTO `user_salary_detail` VALUES (597, 52, 0.30, 0.30, '2a029ca4-71f2-4bc0-80e6-413978973606', 1, 1, '2024-05-17 16:22:00', '2024-05-17 16:22:00');
INSERT INTO `user_salary_detail` VALUES (598, 52, 0.30, 0.30, 'c9453689-136a-4d1c-851b-39bbaa33be49', 1, 1, '2024-05-17 16:23:00', '2024-05-17 16:23:00');
INSERT INTO `user_salary_detail` VALUES (599, 56, 0.89, 0.89, 'e7066cbb-12c1-4c31-a5c9-a596364c31a9', 3, 3, '2024-05-17 16:23:00', '2024-05-17 16:23:00');
INSERT INTO `user_salary_detail` VALUES (600, 52, 0.30, 0.30, '3ba212ff-963f-447c-a030-005b6c1dcf61', 1, 1, '2024-05-17 16:24:00', '2024-05-17 16:24:00');
INSERT INTO `user_salary_detail` VALUES (601, 57, 2.98, 2.98, '94d1a8f9-7c06-4ae1-8439-7b660933895f', 5, 5, '2024-05-17 16:24:00', '2024-05-17 16:24:00');
INSERT INTO `user_salary_detail` VALUES (602, 52, 0.30, 0.30, '111b753c-4bb8-4518-9d08-bb50f1b2fcdd', 1, 1, '2024-05-17 16:25:00', '2024-05-17 16:25:00');
INSERT INTO `user_salary_detail` VALUES (603, 52, 0.30, 0.30, 'b952dc34-6081-4f97-8833-6b6710a2a7f6', 1, 1, '2024-05-17 16:26:00', '2024-05-17 16:26:00');
INSERT INTO `user_salary_detail` VALUES (604, 56, 0.89, 0.89, 'e895c4a8-567b-40e0-b478-c33e3e262aa1', 3, 3, '2024-05-17 16:26:00', '2024-05-17 16:26:00');
INSERT INTO `user_salary_detail` VALUES (605, 52, 0.30, 0.30, 'f812946c-a016-4008-9740-9aba97e06f9f', 1, 1, '2024-05-17 16:27:00', '2024-05-17 16:27:00');
INSERT INTO `user_salary_detail` VALUES (606, 52, 0.30, 0.30, 'a9b12b17-92c5-4013-95a2-1b3d557cca52', 1, 1, '2024-05-17 16:28:00', '2024-05-17 16:28:00');
INSERT INTO `user_salary_detail` VALUES (607, 52, 0.30, 0.30, '6771738b-bc86-443b-94e0-879249d9526f', 1, 1, '2024-05-17 16:29:00', '2024-05-17 16:29:00');
INSERT INTO `user_salary_detail` VALUES (608, 56, 0.89, 0.89, 'e83b1244-163e-43b0-8faa-290fcf177824', 3, 3, '2024-05-17 16:29:00', '2024-05-17 16:29:00');
INSERT INTO `user_salary_detail` VALUES (609, 57, 2.98, 2.98, '20ef47a5-6eec-4658-99d6-ecc385a2b026', 5, 5, '2024-05-17 16:29:00', '2024-05-17 16:29:00');
INSERT INTO `user_salary_detail` VALUES (610, 52, 0.30, 0.30, '4fda0452-922a-4cf8-9fe6-41568def40fb', 1, 1, '2024-05-17 16:30:00', '2024-05-17 16:30:00');
INSERT INTO `user_salary_detail` VALUES (611, 52, 0.30, 0.30, 'cb6c7270-8e16-42ed-8df1-bcf14a5d9300', 1, 1, '2024-05-17 16:31:00', '2024-05-17 16:31:00');
INSERT INTO `user_salary_detail` VALUES (612, 52, 0.30, 0.30, 'c84d008c-ff77-4e11-a1c0-b091e1f98b2d', 1, 1, '2024-05-17 16:32:00', '2024-05-17 16:32:00');
INSERT INTO `user_salary_detail` VALUES (613, 56, 0.89, 0.89, '5b1aa640-39e9-4056-a71e-da77dfb861b0', 3, 3, '2024-05-17 16:32:00', '2024-05-17 16:32:00');
INSERT INTO `user_salary_detail` VALUES (614, 52, 0.30, 0.30, '7037b740-384b-46a2-a8ee-be64bfd14b91', 1, 1, '2024-05-17 16:33:00', '2024-05-17 16:33:00');
INSERT INTO `user_salary_detail` VALUES (615, 52, 0.30, 0.30, '0d512802-a5ce-4f95-8415-711d6485a2ca', 1, 1, '2024-05-17 16:34:00', '2024-05-17 16:34:00');
INSERT INTO `user_salary_detail` VALUES (616, 57, 2.98, 2.98, 'b80de992-f932-4cc5-adf9-afa645ed0731', 5, 5, '2024-05-17 16:34:00', '2024-05-17 16:34:00');
INSERT INTO `user_salary_detail` VALUES (617, 52, 0.30, 0.30, '5b6db582-7498-47ae-beb4-993c4c658ce6', 1, 1, '2024-05-17 16:35:00', '2024-05-17 16:35:00');
INSERT INTO `user_salary_detail` VALUES (618, 56, 0.89, 0.89, 'eab6487f-bbf7-47a2-a144-05e9c891d228', 3, 3, '2024-05-17 16:35:00', '2024-05-17 16:35:00');
INSERT INTO `user_salary_detail` VALUES (619, 52, 0.30, 0.30, '03103696-d20b-454d-9619-f6bb420caae5', 1, 1, '2024-05-17 16:36:00', '2024-05-17 16:36:00');
INSERT INTO `user_salary_detail` VALUES (620, 52, 0.30, 0.30, 'd4037fb5-5819-4660-98df-007d627b9b9d', 1, 1, '2024-05-17 16:37:00', '2024-05-17 16:37:00');
INSERT INTO `user_salary_detail` VALUES (621, 52, 0.30, 0.30, '5bcdac59-9a16-4f3b-8760-dbd6ae144511', 1, 1, '2024-05-17 16:38:00', '2024-05-17 16:38:00');
INSERT INTO `user_salary_detail` VALUES (622, 56, 0.89, 0.89, '395106db-f499-43cb-b4b8-ef4ff3ab2770', 3, 3, '2024-05-17 16:38:00', '2024-05-17 16:38:00');
INSERT INTO `user_salary_detail` VALUES (623, 52, 0.30, 0.30, '216d1f91-17fb-4c5f-bcdf-a682dae4dfe8', 1, 1, '2024-05-17 16:39:00', '2024-05-17 16:39:00');
INSERT INTO `user_salary_detail` VALUES (624, 57, 2.98, 2.98, 'c060939b-8352-44c7-8a5e-008d664fe228', 5, 5, '2024-05-17 16:39:00', '2024-05-17 16:39:00');
INSERT INTO `user_salary_detail` VALUES (625, 52, 0.30, 0.30, 'c33b64b3-bd97-412d-957b-dd8ec9cf48b0', 1, 1, '2024-05-17 16:40:00', '2024-05-17 16:40:00');
INSERT INTO `user_salary_detail` VALUES (626, 52, 0.30, 0.30, '221d512e-4fbb-48eb-bc5d-c11af0800804', 1, 1, '2024-05-17 16:41:00', '2024-05-17 16:41:00');
INSERT INTO `user_salary_detail` VALUES (627, 56, 0.89, 0.89, '1540b745-ec14-43e4-8285-055200466984', 3, 3, '2024-05-17 16:41:00', '2024-05-17 16:41:00');
INSERT INTO `user_salary_detail` VALUES (628, 52, 0.30, 0.30, '7cb82b41-d0ed-4676-9e57-0cca335ca75a', 1, 1, '2024-05-17 16:42:00', '2024-05-17 16:42:00');
INSERT INTO `user_salary_detail` VALUES (629, 52, 0.30, 0.30, '09d5324d-59c5-49d4-bc47-73eea3ba5116', 1, 1, '2024-05-17 16:43:00', '2024-05-17 16:43:00');
INSERT INTO `user_salary_detail` VALUES (630, 52, 0.30, 0.30, '4f5304b9-ae83-47fb-bfbd-077525816ada', 1, 1, '2024-05-17 16:44:00', '2024-05-17 16:44:00');
INSERT INTO `user_salary_detail` VALUES (631, 56, 0.89, 0.89, '37e3ddad-9d4f-4cdf-a849-7ca32fe7972d', 3, 3, '2024-05-17 16:44:00', '2024-05-17 16:44:00');
INSERT INTO `user_salary_detail` VALUES (632, 57, 2.98, 2.98, 'e2945e85-b1c0-46c2-b2ef-4c011089fc8e', 5, 5, '2024-05-17 16:44:00', '2024-05-17 16:44:00');
INSERT INTO `user_salary_detail` VALUES (633, 52, 0.30, 0.30, 'ed23fd93-8893-4e63-8703-c7cde7510660', 1, 1, '2024-05-17 16:45:00', '2024-05-17 16:45:00');
INSERT INTO `user_salary_detail` VALUES (634, 52, 0.30, 0.30, '4d552221-8463-49ed-b154-7eedc3d1eeff', 1, 1, '2024-05-17 16:46:00', '2024-05-17 16:46:00');
INSERT INTO `user_salary_detail` VALUES (635, 52, 0.30, 0.30, 'c6ed3bc4-bc8a-4412-b62a-73e4742e03e5', 1, 1, '2024-05-17 16:47:00', '2024-05-17 16:47:00');
INSERT INTO `user_salary_detail` VALUES (636, 56, 0.89, 0.89, 'b3bd1aa4-87dc-46a7-9695-e80888af5a56', 3, 3, '2024-05-17 16:47:00', '2024-05-17 16:47:00');
INSERT INTO `user_salary_detail` VALUES (637, 52, 0.30, 0.30, '2ee5c9be-c4fc-4c69-9856-745f70e0dbc3', 1, 1, '2024-05-17 16:48:00', '2024-05-17 16:48:00');
INSERT INTO `user_salary_detail` VALUES (638, 52, 0.30, 0.30, 'ee0f29cc-417a-4646-93e5-b022b6c82675', 1, 1, '2024-05-17 16:49:00', '2024-05-17 16:49:00');
INSERT INTO `user_salary_detail` VALUES (639, 57, 2.98, 2.98, 'b4d25a01-e689-41d2-b03d-c040a433e758', 5, 5, '2024-05-17 16:49:00', '2024-05-17 16:49:00');
INSERT INTO `user_salary_detail` VALUES (640, 52, 0.30, 0.30, '87928128-59b4-4f4d-8c45-2ab9cbeb6bfa', 1, 1, '2024-05-17 16:50:00', '2024-05-17 16:50:00');
INSERT INTO `user_salary_detail` VALUES (641, 56, 0.89, 0.89, '2c18c9b3-7ca1-4fcf-96d4-23d223b97dfb', 3, 3, '2024-05-17 16:50:00', '2024-05-17 16:50:00');
INSERT INTO `user_salary_detail` VALUES (642, 52, 0.30, 0.30, '10975a39-e2d2-425a-a966-54f84e0848c5', 1, 1, '2024-05-17 16:51:00', '2024-05-17 16:51:00');
INSERT INTO `user_salary_detail` VALUES (643, 52, 0.30, 0.30, 'ba7ec678-ad16-4f35-8921-dc61add0dc4a', 1, 1, '2024-05-17 16:52:00', '2024-05-17 16:52:00');
INSERT INTO `user_salary_detail` VALUES (644, 52, 0.30, 0.30, '70d8990a-2056-4a5e-9d81-9510fb0ea13e', 1, 1, '2024-05-17 16:53:00', '2024-05-17 16:53:00');
INSERT INTO `user_salary_detail` VALUES (645, 56, 0.89, 0.89, 'ce19bf67-ec62-4349-92e4-e3e979d6e79c', 3, 3, '2024-05-17 16:53:00', '2024-05-17 16:53:00');
INSERT INTO `user_salary_detail` VALUES (646, 52, 0.30, 0.30, '74f3d606-6715-4fb9-bd0e-19ec3ed52b4f', 1, 1, '2024-05-17 16:54:00', '2024-05-17 16:54:00');
INSERT INTO `user_salary_detail` VALUES (647, 57, 2.98, 2.98, '877d51b2-e6d1-49ab-b958-0c88fc8355f5', 5, 5, '2024-05-17 16:54:00', '2024-05-17 16:54:00');
INSERT INTO `user_salary_detail` VALUES (648, 52, 0.30, 0.30, '34e89eb1-cacf-47d5-8cab-732042685350', 1, 1, '2024-05-17 16:55:00', '2024-05-17 16:55:00');
INSERT INTO `user_salary_detail` VALUES (649, 52, 0.30, 0.30, '1fae4b91-122a-4481-afb2-5642f50ba57e', 1, 1, '2024-05-17 16:56:00', '2024-05-17 16:56:00');
INSERT INTO `user_salary_detail` VALUES (650, 56, 0.89, 0.89, '627efe33-f517-4858-890a-bc0a047cc062', 3, 3, '2024-05-17 16:56:00', '2024-05-17 16:56:00');
INSERT INTO `user_salary_detail` VALUES (651, 52, 0.30, 0.30, '5c0c590c-fdb8-42ee-9dc5-943e7d77ad7c', 1, 1, '2024-05-17 16:57:00', '2024-05-17 16:57:00');
INSERT INTO `user_salary_detail` VALUES (652, 52, 0.30, 0.30, '8ad6315d-b573-49bd-afd4-4e4c42eed52e', 1, 1, '2024-05-17 16:58:00', '2024-05-17 16:58:00');
INSERT INTO `user_salary_detail` VALUES (653, 52, 0.30, 0.30, '9b151a02-493a-479e-a0f2-37853b3f3334', 1, 1, '2024-05-17 16:59:00', '2024-05-17 16:59:00');
INSERT INTO `user_salary_detail` VALUES (654, 56, 0.89, 0.89, '1bf79f45-6ce5-4cdf-aa24-bea455b27dff', 3, 3, '2024-05-17 16:59:00', '2024-05-17 16:59:00');
INSERT INTO `user_salary_detail` VALUES (655, 57, 2.98, 2.98, '91eee761-eff6-4c27-a755-cd74bf52bc82', 5, 5, '2024-05-17 16:59:00', '2024-05-17 16:59:00');
INSERT INTO `user_salary_detail` VALUES (656, 52, 0.30, 0.30, 'd3a02c0a-07d0-48f6-8809-e8184e40e338', 1, 1, '2024-05-17 17:00:00', '2024-05-17 17:00:00');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
