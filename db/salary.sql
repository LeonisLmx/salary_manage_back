/*
 Navicat Premium Data Transfer

 Source Server         : 华为云
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : 119.3.251.42:3306
 Source Schema         : salary

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 08/05/2024 19:18:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `level` int DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb3;

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
COMMIT;

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `dm` (`mid`) USING BTREE,
  KEY `dr` (`rid`) USING BTREE,
  CONSTRAINT `dm` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dr` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=820 DEFAULT CHARSET=gb2312;

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
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET gb2312 COLLATE gb2312_chinese_ci DEFAULT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `roleName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色名称',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `payDuration` bigint DEFAULT NULL,
  `lastPayTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '管理员', '18211111111', 'pqz@163.com', '超级管理员', 1, 'admin', '$2a$10$o2NUWiYOX3Iiz/Cgj9nhweSm20ubCtVet9YIKa3teE.RFso5.PwsS', 'http://localhost:8181/uploadFile/2020/04/29/22543b71-a7ff-4571-b0a5-65e630e14c1e.JPG', NULL, 99999.00, 99999, '2024-05-08 14:34:53', '2020-04-29 14:54:24', '2024-05-08 17:05:46');
INSERT INTO `user` VALUES (50, '234', '18211111117', '123@123.com', '员工', 1, 'test2', '$2a$10$o2NUWiYOX3Iiz/Cgj9nhweSm20ubCtVet9YIKa3teE.RFso5.PwsS', '', '', 5000.00, 1, '2024-05-08 14:34:53', '2024-04-29 17:23:27', '2024-05-08 17:06:10');
INSERT INTO `user` VALUES (52, '胡歌', '18211111112', '123@123.com', '人力资源', 1, 'huge', '$2a$10$vI4jUKas1KPHnaYmwcwI.ebKqKN56E5HL5Osj/ekDgiZG733rS3p6', NULL, '', 3000.00, 1, '2024-05-08 14:34:53', '2024-05-08 14:33:48', '2024-05-08 17:50:04');
INSERT INTO `user` VALUES (53, '小茗同学', '18211111113', '1234@123.com', '员工', 1, 'luko', '$2a$10$llzlwvX18FJUDdqnh5I.N.oNoguZq/m7INShVbLuVVIk6nOyUQ0O6', NULL, '', 50000.00, 1, '2024-05-08 17:44:21', '2024-05-08 17:44:21', '2024-05-08 17:44:21');
COMMIT;

-- ----------------------------
-- Table structure for user_contract
-- ----------------------------
DROP TABLE IF EXISTS `user_contract`;
CREATE TABLE `user_contract` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` bigint NOT NULL,
  `mnemonic` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contractName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `contractAddress` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_contract
-- ----------------------------
BEGIN;
INSERT INTO `user_contract` VALUES (1, 50, 'disease zebra poet chimney wedding employ electric attack food drive clown cannon', 'XVmqoSCjC9h9jAzmyVAwkDwP7KrYQt6Pg', '6585493221995906', '4E84DA26873F72A8CD15099018541E47588375FB');
INSERT INTO `user_contract` VALUES (3, 52, 'trim where harsh bar orphan during above pull ring oblige march canoe', 'irpYS3y5zgNjxSp9M1KudHz1Hy7kDqdHW', '0405722112908817', 'CB2939AB15E8644F4CFE6B74CB50CD9F4C499A49');
INSERT INTO `user_contract` VALUES (4, 1, 'doctor cereal grab guitar fruit test insane safe reason junk secret cancel', 'YGnjcuqAws6Graz2cDXcPrLrftiFGJt9s', '2459569381950088', '570850F40138317C8F184BC8D8D99B199817A1AD');
INSERT INTO `user_contract` VALUES (5, 53, 'maximum surge width stem luggage valve man onion egg hidden inject canyon', 'YE9XnatjVxidDFoZXWSFub9Th1U7m3SKL', '0170567871371705', '56886D8DEDF9D2F065CDEB5AC42AE582A86F9B91');
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `deu` (`uid`) USING BTREE,
  KEY `der` (`rid`) USING BTREE,
  CONSTRAINT `der` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `deu` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (47, 50, 2);
INSERT INTO `user_role` VALUES (48, 52, 15);
INSERT INTO `user_role` VALUES (49, 53, 2);
COMMIT;

-- ----------------------------
-- Table structure for user_salary_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_salary_detail`;
CREATE TABLE `user_salary_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userId` bigint DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `hashId` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `updateTime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user_salary_detail
-- ----------------------------
BEGIN;
INSERT INTO `user_salary_detail` VALUES (1, 50, 100000.00, 'd452bc3b2e2119df6e07135298f6f17c45c0fa3fc6571f70c906acea4d9f182a', '2024-05-08 17:37:56', '2024-05-08 17:37:56');
INSERT INTO `user_salary_detail` VALUES (2, 52, 3000.00, '5ca57a7be6c486face75d59851fcb066aeb4694a045e883a675c6e79d4a67ce0', '2024-05-08 17:37:56', '2024-05-08 17:37:56');
INSERT INTO `user_salary_detail` VALUES (3, 50, 100000.00, '765b9184f9fff5dbfe669520d91daab8f0063a28520c1c7d077d0c91996999f9', '2024-05-08 17:38:16', '2024-05-08 17:38:16');
INSERT INTO `user_salary_detail` VALUES (4, 50, 100000.00, '7a2b0cddf98a169850196981f842e2c6f48cd8918ba6ead94064dc987213fabf', '2024-05-08 17:42:56', '2024-05-08 17:42:56');
INSERT INTO `user_salary_detail` VALUES (5, 52, 3000.00, '3e5858771cb83173533f88255118827b67ce3f1c367d0223543dc9df332b1ea5', '2024-05-08 17:42:57', '2024-05-08 17:42:57');
INSERT INTO `user_salary_detail` VALUES (6, 50, 100000.00, '55051fdceed1b8db747b37ab548579fbf77e2b505ac73c321a0058c47fffda8d', '2024-05-08 17:47:57', '2024-05-08 17:47:57');
INSERT INTO `user_salary_detail` VALUES (7, 52, 3000.00, '27956eebc31a0b9a86c268ab4f215a7bbc876c2a6443301909d7e2b4f75909f5', '2024-05-08 17:47:58', '2024-05-08 17:47:58');
INSERT INTO `user_salary_detail` VALUES (8, 53, 50000.00, 'a1f7281828aeef0df30a2920c004e0f7ee5e42040a02d5dfe6c58e3d6a9622f7', '2024-05-08 17:47:58', '2024-05-08 17:47:58');
INSERT INTO `user_salary_detail` VALUES (9, 53, 50000.00, '48bdd6b956f5880e909ea0e361eb6d3950aaba261746f201ae24f5d17279adc9', '2024-05-08 17:48:00', '2024-05-08 17:48:00');
INSERT INTO `user_salary_detail` VALUES (10, 53, 50000.00, '02b76d0ab4adb4310d9d7139c6a44a1fee1a477ecc2bc92ced2e8e5f6df243c6', '2024-05-08 17:49:30', '2024-05-08 17:49:30');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
