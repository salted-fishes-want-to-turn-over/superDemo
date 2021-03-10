/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : clouddb01

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 11/03/2021 00:29:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


DROP DATABASE IF EXISTS `clouddb01`;
CREATE DATABASE IF NOT EXISTS `clouddb01`;
USE `clouddb01`;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `dept_no` int(0) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dept_dbsource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '研发部1', 'yanfa_db');
INSERT INTO `dept` VALUES (2, '测试部', 'ceshi_db');
INSERT INTO `dept` VALUES (3, '产品部', 'product_db');
INSERT INTO `dept` VALUES (5, 'demoData', 'demoData');
INSERT INTO `dept` VALUES (6, 'testName', 'testDbsource');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` int(0) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `employee_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `employee_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dept_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, '小明', '137xxxxxxxx', '福建福州', 2);
INSERT INTO `employee` VALUES (2, 'taotao', '1860591xxxx', '福州长乐', 1);
INSERT INTO `employee` VALUES (3, '张三', '1234xxxxxxx', '广州', 1);
INSERT INTO `employee` VALUES (4, '李思', '1677676765', '深圳', 2);
INSERT INTO `employee` VALUES (5, '小红', '15898544189', '福建福州', 5);
INSERT INTO `employee` VALUES (6, '小青', '12345678987', '福建福州', 5);
INSERT INTO `employee` VALUES (7, '小兰', '214xxxxxxxxx', '福建福州', 3);
INSERT INTO `employee` VALUES (8, '小兰2', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (9, '小兰3', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (10, '小兰4', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (11, '小兰4', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (12, '小兰6', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (13, '小兰7', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (14, '小兰8', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (15, '小兰9', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (16, '小兰10', NULL, '福建福州', 1);
INSERT INTO `employee` VALUES (17, '张三', '189xxxxxxxx', '江西南昌', 2);
INSERT INTO `employee` VALUES (18, '里斯', '16786545565', '江西赣州', 2);
INSERT INTO `employee` VALUES (19, '王武', '18999999999', '福建莆田', 4);
INSERT INTO `employee` VALUES (20, '张三', '189xxxxxxxx', '江西南昌', 2);
INSERT INTO `employee` VALUES (21, '里斯', '16786545565', '江西赣州', 2);
INSERT INTO `employee` VALUES (22, '王武', '18999999999', '福建莆田', 4);
INSERT INTO `employee` VALUES (23, '张xx', '189xxxxxxxx', '江西南昌', 2);
INSERT INTO `employee` VALUES (24, '李xx', '16786545565', '江西赣州', 2);
INSERT INTO `employee` VALUES (25, '王xxxz', '18999999999', '福建莆田', 4);
INSERT INTO `employee` VALUES (26, '张xx', '189xxxxxxxx', '江西南昌', 2);
INSERT INTO `employee` VALUES (27, '李xx', '16786545565', '江西赣州', 2);
INSERT INTO `employee` VALUES (28, '王xxxz', '18999999999', '福建莆田', 4);

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '部门主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门简称',
  `manager_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '部门负责人id',
  `parent_id` int(0) UNSIGNED NULL DEFAULT NULL COMMENT '部门的父级id',
  `sort` int(0) NOT NULL COMMENT '部门排序',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES (1, '1024创新实验室', 'ZWGWL', 16, 0, 1, '2019-04-03 10:41:25', '2019-04-03 10:41:25');
INSERT INTO `t_department` VALUES (2, '二级部门-2', NULL, 15, 1, 17, '2019-04-15 16:45:10', '2019-04-15 16:45:10');
INSERT INTO `t_department` VALUES (4, '二级部门-1', '管理', 14, 1, 20, '2019-04-17 16:14:55', '2019-04-17 16:14:55');
INSERT INTO `t_department` VALUES (8, '三级部门-1', NULL, NULL, 4, 8, '2019-04-25 12:25:52', '2019-04-25 12:25:52');
INSERT INTO `t_department` VALUES (9, '四级部门-1', NULL, NULL, 8, 9, '2019-04-25 12:26:36', '2019-04-25 12:26:36');
INSERT INTO `t_department` VALUES (10, '五级部门-1', NULL, NULL, 9, 10, '2019-04-25 12:26:49', '2019-04-25 12:26:49');
INSERT INTO `t_department` VALUES (11, '六级部门-1', NULL, NULL, 10, 11, '2019-04-25 12:26:59', '2019-04-25 12:26:59');
INSERT INTO `t_department` VALUES (12, '七级部门-1', NULL, NULL, 11, 12, '2019-04-25 12:27:18', '2019-04-25 12:27:18');
INSERT INTO `t_department` VALUES (13, '八级部门-1', NULL, NULL, 12, 13, '2019-04-25 12:27:34', '2019-04-25 12:27:34');
INSERT INTO `t_department` VALUES (14, '九级部门-1', NULL, NULL, 13, 14, '2019-04-25 12:27:47', '2019-04-25 12:27:47');
INSERT INTO `t_department` VALUES (15, '十级部门-1', NULL, NULL, 14, 15, '2019-04-25 12:28:16', '2019-04-25 12:28:16');
INSERT INTO `t_department` VALUES (16, '十一级部门部门部部门门嘻嘻哈哈-1', NULL, 13, 15, 16, '2019-04-25 14:56:40', '2019-04-25 14:56:40');
INSERT INTO `t_department` VALUES (17, '信息中心', NULL, 16, 1, 4, '2019-04-26 11:53:50', '2019-04-26 11:53:50');
INSERT INTO `t_department` VALUES (18, '测试部门', NULL, 16, 17, 18, '2019-04-26 11:54:06', '2019-04-26 11:54:06');
INSERT INTO `t_department` VALUES (19, '张娇测试部-9', NULL, NULL, 2, 22, '2019-04-26 14:36:18', '2019-04-26 14:36:18');
INSERT INTO `t_department` VALUES (20, '子部门', NULL, NULL, 2, 23, '2019-04-26 14:36:28', '2019-04-26 14:36:28');
INSERT INTO `t_department` VALUES (22, '张静如部门', NULL, 16, 1, 2, '2019-04-28 14:21:44', '2019-04-28 14:21:44');
INSERT INTO `t_department` VALUES (23, '张静如部门2', NULL, 22, 4, 19, '2019-04-28 14:22:48', '2019-04-28 14:22:48');
INSERT INTO `t_department` VALUES (24, '测试部门-011', NULL, 18, 23, 24, '2019-04-29 10:12:42', '2019-04-29 10:12:42');
INSERT INTO `t_department` VALUES (25, '测试部-09', NULL, 18, 23, 25, '2019-04-29 10:12:42', '2019-04-29 10:12:42');
INSERT INTO `t_department` VALUES (26, '研究院', NULL, NULL, 1, 26, '2021-03-03 09:11:42', '2021-03-03 09:11:42');
INSERT INTO `t_department` VALUES (27, '5G事业部(改)', '5G部门', 0, 1, 27, '2021-03-03 10:59:26', '2021-03-03 10:59:26');
INSERT INTO `t_department` VALUES (28, '5G云网实验室', '5G云网', 0, 1, 28, '2021-03-03 14:42:42', '2021-03-03 14:42:42');
INSERT INTO `t_department` VALUES (29, '大数据实验室', '大数据', 0, 1, 29, '2021-03-03 14:54:35', '2021-03-03 14:54:35');
INSERT INTO `t_department` VALUES (31, '物联网实验室', '物联网', 0, 1, 31, '2021-03-03 15:04:41', '2021-03-03 15:04:41');
INSERT INTO `t_department` VALUES (32, '创新设计室(改)', '设计室', 0, 1, 32, '2021-03-03 15:57:54', '2021-03-03 15:57:54');

-- ----------------------------
-- Table structure for t_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_employee`;
CREATE TABLE `t_employee`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录帐号',
  `login_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录密码',
  `actual_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工名称',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '别名',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `department_id` int(0) UNSIGNED NOT NULL COMMENT '部门id',
  `is_leave` int(0) NOT NULL DEFAULT 0 COMMENT '是否离职1是',
  `is_disabled` int(0) NOT NULL DEFAULT 0 COMMENT '是否被禁用 0否1是',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_user` int(0) UNSIGNED NOT NULL COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `is_delete` int(0) NOT NULL DEFAULT 0 COMMENT '是否删除0否 1是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (1, 'sa', 'c655798e4648c540812a1b8f48759af7', '管理员', '15515515515', '13112312131', '410306199202020020', '1992-02-02', NULL, 1, 0, 0, NULL, 0, '2019-04-27 09:56:17', '2018-05-11 09:38:54', 0);
INSERT INTO `t_employee` VALUES (14, 'yubajin', 'c655798e4648c540812a1b8f48759af7', '余拔金', '小鱼', '18605915327', '360732199904099999', '2009-09-09', '15770700260@163.com', 2, 0, 0, NULL, 1, '2021-03-09 15:14:13', '2019-04-25 14:34:47', 0);
INSERT INTO `t_employee` VALUES (15, 'huangwenli', 'c655798e4648c540812a1b8f48759af7', '黄文丽', '', '15515515515', '', NULL, '', 16, 0, 0, NULL, 1, '2019-04-27 09:56:17', '2019-04-26 10:05:05', 0);
INSERT INTO `t_employee` VALUES (16, 'huangwenli1', 'c655798e4648c540812a1b8f48759af7', '黄文丽', '', '15515515515', '', NULL, '', 15, 0, 0, NULL, 1, '2019-04-27 14:04:19', '2019-04-26 10:25:04', 0);
INSERT INTO `t_employee` VALUES (17, 'zhangjiao', 'c655798e4648c540812a1b8f48759af7', '张娇', '阿娇', '15670390391', '410305199102020020', '1991-02-02', '86484@qq.com', 19, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-04-26 14:37:23', 0);
INSERT INTO `t_employee` VALUES (18, 'zhangjiao1', 'c655798e4648c540812a1b8f48759af7', '张娇1', '', '15670390391', '', '2019-04-18', '6666@qq.com', 20, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-04-26 14:45:55', 0);
INSERT INTO `t_employee` VALUES (19, 'zhenxiaocang', 'c655798e4648c540812a1b8f48759af7', '珍小藏', '', '15670390391', '', NULL, '', 19, 0, 1, NULL, 1, '2019-09-09 08:34:35', '2019-04-26 14:46:57', 0);
INSERT INTO `t_employee` VALUES (20, 'matengfei', 'c655798e4648c540812a1b8f48759af7', '马腾飞', '', '15670390393', '', NULL, '', 19, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-04-26 14:47:24', 0);
INSERT INTO `t_employee` VALUES (22, 'zhangjingru', 'c655798e4648c540812a1b8f48759af7', '张静如', '', '15600000000', '', NULL, '', 1, 0, 0, NULL, 1, '2019-09-04 09:06:47', '2019-04-28 14:05:03', 0);
INSERT INTO `t_employee` VALUES (26, 'zhangjiao666', 'c655798e4648c540812a1b8f48759af7', 'Tom', '', '15612345678', '', NULL, '', 18, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-05-05 15:34:10', 0);
INSERT INTO `t_employee` VALUES (28, 'dfsfgds', 'c655798e4648c540812a1b8f48759af7', '小明', '', '15854127845', '', NULL, '', 22, 0, 1, NULL, 1, '2019-09-06 08:58:40', '2019-05-06 10:36:57', 0);
INSERT INTO `t_employee` VALUES (29, 'abcabc', 'c655798e4648c540812a1b8f48759af7', '小花', 'aaabac', '13311112222', '', NULL, '', 17, 0, 0, NULL, 1, '2019-08-05 16:33:57', '2019-07-10 17:00:58', 0);
INSERT INTO `t_employee` VALUES (30, 'gengweigang', 'c655798e4648c540812a1b8f48759af7', '耿为刚', 'geng', '15038588418', '', NULL, '', 17, 0, 0, NULL, 1, '2019-08-08 14:35:51', '2019-08-08 14:35:51', 0);
INSERT INTO `t_employee` VALUES (31, 'gengweigang1', 'c655798e4648c540812a1b8f48759af7', '耿为刚1', '这是别名', '15038588418', '410322193312123232', '1933-12-12', '32@qq.com', 18, 0, 0, NULL, 30, '2019-08-23 09:27:22', '2019-08-23 09:25:50', 0);
INSERT INTO `t_employee` VALUES (32, 'ceshi123', 'c655798e4648c540812a1b8f48759af7', '测试', '测试', '15670702651', '', NULL, '', 17, 0, 0, NULL, 1, '2019-09-04 09:05:48', '2019-09-03 11:48:04', 0);
INSERT INTO `t_employee` VALUES (33, 'ceshi321', 'c655798e4648c540812a1b8f48759af7', '测试', '测试', '15670702651', '', NULL, '', 17, 0, 1, NULL, 1, '2019-09-03 15:51:16', '2019-09-03 11:49:17', 0);
INSERT INTO `t_employee` VALUES (34, 'ceshi123321', 'c655798e4648c540812a1b8f48759af7', '123', '', '15600000000', '', NULL, '', 22, 0, 1, NULL, 1, '2019-09-06 08:58:37', '2019-09-04 09:13:54', 0);
INSERT INTO `t_employee` VALUES (35, 'guoqingfeng', 'c655798e4648c540812a1b8f48759af7', '郭青枫', '', '15670702651', '', NULL, '', 18, 0, 0, NULL, 1, '2019-09-04 15:09:00', '2019-09-04 15:09:00', 0);
INSERT INTO `t_employee` VALUES (36, 'li327263458', 'c655798e4648c540812a1b8f48759af7', 'yubajin', '', '13937988294', '', NULL, '', 17, 0, 0, NULL, 1, '2019-09-09 17:01:39', '2019-09-09 17:01:39', 0);
INSERT INTO `t_employee` VALUES (37, 'test123', 'c655798e4648c540812a1b8f48759af7', 'employeetest', '', '13211110201', '', NULL, '', 18, 0, 1, NULL, 1, '2019-11-14 16:08:08', '2019-11-08 09:32:39', 0);
INSERT INTO `t_employee` VALUES (38, 'tiantian', 'c655798e4648c540812a1b8f48759af7', '天天管理员', '', '13574502368', '', NULL, '', 17, 0, 0, NULL, 1, '2019-11-14 02:08:08', '2019-11-08 11:09:46', 0);
INSERT INTO `t_employee` VALUES (39, 'wang13211111', 'c655798e4648c540812a1b8f48759af7', 'employeeceshi', 'dddd', '13244553212', '', NULL, '', 25, 0, 0, NULL, 38, '2019-11-15 17:14:34', '2019-11-15 17:03:04', 0);
INSERT INTO `t_employee` VALUES (40, 'yuxiao', '8c3f143608bbac4ecfafb508690a2b33', '余小(改)', '小小🐟', '18605913455', '12222222222222222x', '1994-07-07', '243554445@qq.com', 1, 0, 0, NULL, 14, '2021-03-09 08:22:52', '2021-03-09 15:20:52', 0);

-- ----------------------------
-- Table structure for t_position
-- ----------------------------
DROP TABLE IF EXISTS `t_position`;
CREATE TABLE `t_position`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '岗位名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位描述',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_position
-- ----------------------------
INSERT INTO `t_position` VALUES (1, 'java develop', 'java develop is good job', '2019-07-03 15:18:45', '2019-07-03 15:18:45');
INSERT INTO `t_position` VALUES (2, 'android develop', 'android develop is good job', '2019-07-04 16:11:11', '2019-07-04 16:11:00');
INSERT INTO `t_position` VALUES (3, '测试岗位1', '这是内容11', '2019-09-02 16:39:33', '2019-07-10 14:03:50');
INSERT INTO `t_position` VALUES (8, '测试岗位2', '测试岗位2.。', '2019-09-04 10:19:40', '2019-09-04 10:19:32');
INSERT INTO `t_position` VALUES (9, '测试岗位3', '测试岗位3', '2019-09-05 14:39:43', '2019-09-05 14:39:43');
INSERT INTO `t_position` VALUES (10, '测试岗位4', '测试岗位4', '2019-09-05 14:39:48', '2019-09-05 14:39:48');
INSERT INTO `t_position` VALUES (11, '测试岗位5', '测试岗位5', '2019-09-05 14:39:53', '2019-09-05 14:39:53');
INSERT INTO `t_position` VALUES (12, '测试岗位6', '测试岗位6', '2019-09-05 14:39:58', '2019-09-05 14:39:58');
INSERT INTO `t_position` VALUES (13, '测试岗位7', '测试岗位7', '2019-09-05 14:40:03', '2019-09-05 14:40:03');
INSERT INTO `t_position` VALUES (14, '测试岗位8', '测试岗位8', '2019-09-05 14:40:09', '2019-09-05 14:40:09');
INSERT INTO `t_position` VALUES (15, '测试岗位9', '测试岗位9', '2019-09-05 14:40:19', '2019-09-05 14:40:19');
INSERT INTO `t_position` VALUES (16, 'aaa22222岗位', 'ddddddddddd', '2021-03-04 10:30:42', '2019-11-06 15:58:37');
INSERT INTO `t_position` VALUES (17, 'ddd岗位', 'fsdef', '2021-03-04 10:30:49', '2019-11-15 17:04:40');
INSERT INTO `t_position` VALUES (19, 'demo岗位(改1)', 'demo备注(改)', '2021-03-09 12:35:57', '2021-03-09 12:29:16');

-- ----------------------------
-- Table structure for t_position_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_position_relation`;
CREATE TABLE `t_position_relation`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `position_id` int(0) NULL DEFAULT NULL COMMENT '岗位ID',
  `employee_id` int(0) NULL DEFAULT NULL COMMENT '员工ID',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `job_id`(`position_id`) USING BTREE,
  INDEX `employee_id`(`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_position_relation
-- ----------------------------
INSERT INTO `t_position_relation` VALUES (14, 1, 28, '2019-07-10 16:40:14', '2019-07-10 16:40:14');
INSERT INTO `t_position_relation` VALUES (18, 1, 29, '2019-07-11 10:18:22', '2019-07-11 10:18:22');
INSERT INTO `t_position_relation` VALUES (19, 3, 29, '2019-07-11 10:18:22', '2019-07-11 10:18:22');
INSERT INTO `t_position_relation` VALUES (20, 2, 29, '2019-07-11 10:18:22', '2019-07-11 10:18:22');
INSERT INTO `t_position_relation` VALUES (21, 1, 30, '2019-08-08 14:35:51', '2019-08-08 14:35:51');
INSERT INTO `t_position_relation` VALUES (22, 2, 30, '2019-08-08 14:35:51', '2019-08-08 14:35:51');
INSERT INTO `t_position_relation` VALUES (23, 3, 30, '2019-08-08 14:35:51', '2019-08-08 14:35:51');
INSERT INTO `t_position_relation` VALUES (26, 2, 31, '2019-08-23 09:26:44', '2019-08-23 09:26:44');
INSERT INTO `t_position_relation` VALUES (27, 3, 31, '2019-08-23 09:26:44', '2019-08-23 09:26:44');
INSERT INTO `t_position_relation` VALUES (28, 3, 32, '2019-09-04 09:05:47', '2019-09-04 09:05:47');
INSERT INTO `t_position_relation` VALUES (29, 2, 32, '2019-09-04 09:05:47', '2019-09-04 09:05:47');
INSERT INTO `t_position_relation` VALUES (30, 3, 22, '2019-09-04 09:06:46', '2019-09-04 09:06:46');
INSERT INTO `t_position_relation` VALUES (31, 2, 22, '2019-09-04 09:06:46', '2019-09-04 09:06:46');
INSERT INTO `t_position_relation` VALUES (35, 8, 35, '2019-09-04 15:09:00', '2019-09-04 15:09:00');
INSERT INTO `t_position_relation` VALUES (36, 3, 35, '2019-09-04 15:09:00', '2019-09-04 15:09:00');
INSERT INTO `t_position_relation` VALUES (37, 15, 23, '2019-09-05 16:13:02', '2019-09-05 16:13:02');
INSERT INTO `t_position_relation` VALUES (38, 14, 23, '2019-09-05 16:13:02', '2019-09-05 16:13:02');
INSERT INTO `t_position_relation` VALUES (39, 13, 23, '2019-09-05 16:13:02', '2019-09-05 16:13:02');
INSERT INTO `t_position_relation` VALUES (40, 3, 34, '2019-09-06 08:55:18', '2019-09-06 08:55:18');
INSERT INTO `t_position_relation` VALUES (41, 2, 34, '2019-09-06 08:55:18', '2019-09-06 08:55:18');
INSERT INTO `t_position_relation` VALUES (42, 1, 34, '2019-09-06 08:55:18', '2019-09-06 08:55:18');
INSERT INTO `t_position_relation` VALUES (43, 14, 36, '2019-09-09 17:01:39', '2019-09-09 17:01:39');
INSERT INTO `t_position_relation` VALUES (44, 3, 37, '2019-11-08 09:32:39', '2019-11-08 09:32:39');
INSERT INTO `t_position_relation` VALUES (46, 8, 38, '2019-11-14 16:08:05', '2019-11-14 16:08:05');
INSERT INTO `t_position_relation` VALUES (50, 16, 39, '2019-11-15 17:07:04', '2019-11-15 17:07:04');
INSERT INTO `t_position_relation` VALUES (51, 13, 39, '2019-11-15 17:07:04', '2019-11-15 17:07:04');
INSERT INTO `t_position_relation` VALUES (52, 14, 39, '2019-11-15 17:07:04', '2019-11-15 17:07:04');
INSERT INTO `t_position_relation` VALUES (58, 1, 40, '2021-03-09 16:22:51', '2021-03-09 16:22:51');
INSERT INTO `t_position_relation` VALUES (59, 2, 40, '2021-03-09 16:22:51', '2021-03-09 16:22:51');

-- ----------------------------
-- Table structure for t_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_privilege`;
CREATE TABLE `t_privilege`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '功能权限表主键id',
  `type` tinyint(0) NOT NULL COMMENT '1.菜单 2.功能点',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路由name 英文关键字',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '路由path/type=3为API接口',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `parent_key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父级key',
  `update_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `parent_key`(`parent_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_privilege
-- ----------------------------
INSERT INTO `t_privilege` VALUES (1, 1, '人员管理', 'Employee', '/employee', 20, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (2, 1, '角色管理', 'RoleManage', '/employee/role', 21, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (3, 1, '岗位管理', 'PositionList', '/employee/position', 22, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (4, 1, '员工管理', 'RoleEmployeeManage', '/employee/role-employee-manage', 23, 'Employee', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (5, 1, '系统设置', 'SystemSetting', '/system-setting', 29, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (6, 1, '系统参数', 'SystemConfig', '/system-setting/system-config', 30, 'SystemSetting', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (8, 1, '菜单设置', 'SystemPrivilege', '/system-setting/system-privilege', 31, 'SystemSetting', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (9, 1, '消息管理', 'Notice', '/notice', 10, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (10, 1, '通知管理', 'NoticeList', '/notice/notice-list', 11, 'Notice', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (11, 1, '个人消息', 'PersonNotice', '/notice/person-notice', 12, 'Notice', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (12, 1, '邮件管理', 'Email', '/email', 4, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (13, 1, '邮件管理', 'EmailList', '/email/email-list', 5, 'Email', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (14, 1, '发送邮件', 'SendMail', '/email/send-mail', 6, 'Email', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (15, 1, '用户日志', 'UserLog', '/user-log', 26, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (16, 1, '用户操作日志', 'UserOperateLog', '/user-log/user-operate-log', 27, 'UserLog', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (17, 1, '用户登录日志', 'UserLoginLog', '/user-log/user-login-log', 28, 'UserLog', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (18, 1, '系统监控', 'Monitor', '/monitor', 37, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (19, 1, '在线人数', 'OnlineUser', '/monitor/online-user', 38, 'Monitor', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (20, 1, 'SQL监控', 'Sql', '/monitor/sql', 39, 'Monitor', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (21, 1, '定时任务', 'Task', '/task', 42, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (22, 1, '任务管理', 'TaskList', '/system-setting/task-list', 43, 'Task', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (23, 1, '动态加载', 'Reload', '/reload', 40, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (24, 1, 'SmartReload', 'SmartReloadList', '/reload/smart-reload-list', 41, 'Reload', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (25, 1, '接口文档', 'ApiDoc', '/api-doc', 33, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (26, 1, 'Swagger接口文档', 'Swagger', '/api-doc/swagger', 34, 'ApiDoc', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (27, 1, '三级路由', 'ThreeRouter', '/three-router', 14, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (28, 1, '三级菜单', 'LevelTwo', '/three-router/level-two', 15, 'ThreeRouter', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (30, 1, '三级菜单子哈', 'RoleTwoTwo', '/three-router/level-two/level-three2', 17, 'LevelTwo', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (31, 1, '二级菜单', 'RoleOneOne', '/three-router/level-two2', 18, 'ThreeRouter', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (32, 1, 'KeepAlive', 'KeepAlive', '/keep-alive', 7, 'Business', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (33, 1, 'KeepAlive列表', 'KeepAliveContentList', '/keep-alive/content-list', 8, 'KeepAlive', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (34, 1, 'KeepAlive表单', 'KeepAliveAddContent', '/keep-alive/add-content', 9, 'KeepAlive', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (35, 1, '心跳服务', 'HeartBeat', '/heart-beat', 35, 'Support', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (36, 1, '心跳服务', 'HeartBeatList', '/heart-beat/heart-beat-list', 36, 'HeartBeat', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (37, 1, '文件服务', 'File', '/file', 24, 'System', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (38, 1, '文件列表', 'FileList', '/file/file-list', 25, 'File', '2020-12-14 15:16:26', '2019-11-01 11:28:07');
INSERT INTO `t_privilege` VALUES (39, 2, '添加角色', 'add-role', 'roleController.addRole', 0, 'RoleManage', '2019-11-01 11:47:29', '2019-11-01 11:47:29');
INSERT INTO `t_privilege` VALUES (40, 2, '删除角色', 'delete-role', 'roleController.deleteRole', 1, 'RoleManage', '2019-11-01 11:47:43', '2019-11-01 11:47:43');
INSERT INTO `t_privilege` VALUES (41, 2, '编辑角色', 'update-role', 'roleController.updateRole', 2, 'RoleManage', '2019-11-01 11:47:55', '2019-11-01 11:47:55');
INSERT INTO `t_privilege` VALUES (42, 2, '修改角色权限', 'update-role-privilege', 'rolePrivilegeController.updateRolePrivilege', 3, 'RoleManage', '2019-11-01 11:48:09', '2019-11-01 11:48:09');
INSERT INTO `t_privilege` VALUES (43, 2, '添加成员', 'add-employee-role', 'roleEmployeeController.addEmployeeList', 4, 'RoleManage', '2019-11-05 10:38:11', '2019-11-05 10:38:11');
INSERT INTO `t_privilege` VALUES (44, 2, '查询成员', 'search-employee-list', 'roleEmployeeController.listAllEmployeeRoleId,roleEmployeeController.listEmployeeByName,roleController.getAllRole,rolePrivilegeController.listPrivilegeByRoleId', 7, 'RoleManage', '2019-11-05 10:39:04', '2019-11-05 10:39:04');
INSERT INTO `t_privilege` VALUES (45, 2, '移除成员', 'delete-employee-role', 'roleEmployeeController.removeEmployee', 5, 'RoleManage', '2019-11-05 10:40:09', '2019-11-05 10:40:09');
INSERT INTO `t_privilege` VALUES (46, 2, '批量移除', 'delete-employee-role-batch', 'roleEmployeeController.removeEmployeeList', 6, 'RoleManage', '2019-11-05 10:40:27', '2019-11-05 10:40:27');
INSERT INTO `t_privilege` VALUES (47, 2, '查询数据范围', 'query-data-scope', 'dataScopeController.dataScopeList,dataScopeController.dataScopeListByRole,rolePrivilegeController.listPrivilegeByRoleId,privilegeController.queryAll,privilegeController.getAllUrl', 8, 'RoleManage', '2019-11-05 10:40:57', '2019-11-05 10:40:57');
INSERT INTO `t_privilege` VALUES (48, 2, '更新数据范围', 'update-data-scope', 'dataScopeController.dataScopeBatchSet', 9, 'RoleManage', '2019-11-05 10:41:03', '2019-11-05 10:41:03');
INSERT INTO `t_privilege` VALUES (49, 2, '查询', 'search-position', 'positionController.queryJobById,positionController.getJobPage', 0, 'PositionList', '2019-11-05 10:41:30', '2019-11-05 10:41:30');
INSERT INTO `t_privilege` VALUES (50, 2, '添加', 'add-position', 'positionController.addJob', 1, 'PositionList', '2019-11-05 10:41:40', '2019-11-05 10:41:40');
INSERT INTO `t_privilege` VALUES (51, 2, '修改', 'update-position', 'positionController.updateJob', 2, 'PositionList', '2019-11-05 10:41:49', '2019-11-05 10:41:49');
INSERT INTO `t_privilege` VALUES (52, 2, '删除', 'delete-position', 'positionController.removeJob', 3, 'PositionList', '2019-11-05 10:41:57', '2019-11-05 10:41:57');
INSERT INTO `t_privilege` VALUES (53, 2, '添加部门', 'add-department', 'departmentController.addDepartment', 0, 'RoleEmployeeManage', '2019-11-05 11:11:18', '2019-11-05 11:11:18');
INSERT INTO `t_privilege` VALUES (54, 2, '编辑部门', 'update-department', 'departmentController.updateDepartment', 1, 'RoleEmployeeManage', '2019-11-05 11:11:29', '2019-11-05 11:11:29');
INSERT INTO `t_privilege` VALUES (55, 2, '删除部门', 'delete-department', 'departmentController.delDepartment', 2, 'RoleEmployeeManage', '2019-11-05 11:11:48', '2019-11-05 11:11:48');
INSERT INTO `t_privilege` VALUES (56, 2, '查询', 'search-department', 'departmentController.listAll,departmentController.getDepartment,departmentController.listDepartmentEmployee,departmentController.listDepartment,employeeController.query', 3, 'RoleEmployeeManage', '2019-11-05 11:12:09', '2019-11-05 11:12:09');
INSERT INTO `t_privilege` VALUES (57, 2, '添加成员', 'add-employee', 'employeeController.addEmployee', 4, 'RoleEmployeeManage', '2019-11-05 17:06:23', '2019-11-05 17:06:23');
INSERT INTO `t_privilege` VALUES (58, 2, '编辑成员', 'update-employee', 'employeeController.updateEmployee', 5, 'RoleEmployeeManage', '2019-11-05 17:06:57', '2019-11-05 17:06:57');
INSERT INTO `t_privilege` VALUES (59, 2, '禁用', 'disabled-employee', 'employeeController.updateStatus', 6, 'RoleEmployeeManage', '2019-11-05 17:14:35', '2019-11-05 17:14:35');
INSERT INTO `t_privilege` VALUES (60, 2, '批量操作', 'disabled-employee-batch', 'employeeController.batchUpdateStatus', 7, 'RoleEmployeeManage', '2019-11-05 17:19:23', '2019-11-05 17:19:23');
INSERT INTO `t_privilege` VALUES (61, 2, '员工角色编辑', 'update-employee-role', 'employeeController.updateRoles', 8, 'RoleEmployeeManage', '2019-11-05 17:21:15', '2019-11-05 17:21:15');
INSERT INTO `t_privilege` VALUES (62, 2, '重置密码', 'reset-employee-password', 'employeeController.resetPasswd', 10, 'RoleEmployeeManage', '2019-11-05 17:22:13', '2019-11-05 17:22:13');
INSERT INTO `t_privilege` VALUES (63, 2, '删除员工', 'delete-employee', 'employeeController.deleteEmployeeById', 9, 'RoleEmployeeManage', '2019-11-05 17:22:27', '2019-11-05 17:22:27');
INSERT INTO `t_privilege` VALUES (64, 2, '查询系统参数', 'system-params-search', 'systemConfigController.selectByKey,systemConfigController.getListByGroup,systemConfigController.getSystemConfigPage', 0, 'SystemConfig', '2019-11-05 17:23:41', '2019-11-05 17:23:41');
INSERT INTO `t_privilege` VALUES (65, 2, '添加系统参数', 'system-params-add', 'systemConfigController.addSystemConfig', 1, 'SystemConfig', '2019-11-05 17:26:00', '2019-11-05 17:26:00');
INSERT INTO `t_privilege` VALUES (66, 2, '修改系统参数', 'system-config-update', 'systemConfigController.updateSystemConfig', 2, 'SystemConfig', '2019-11-05 17:26:07', '2019-11-05 17:26:07');
INSERT INTO `t_privilege` VALUES (67, 2, '搜索系统参数', 'system-config-search', 'systemConfigController.selectByKey,systemConfigController.getListByGroup,systemConfigController.getSystemConfigPage', 3, 'SystemConfig', '2019-11-05 17:26:44', '2019-11-05 17:26:44');
INSERT INTO `t_privilege` VALUES (69, 2, '编辑', 'privilege-main-update', 'privilegeController.menuBatchSave,privilegeController.functionSaveOrUpdate', 1, 'SystemPrivilege', '2020-12-14 15:17:11', '2019-11-05 17:27:28');
INSERT INTO `t_privilege` VALUES (70, 2, '查询', 'privilege-main-search', 'privilegeController.queryAll,privilegeController.getAllUrl,privilegeController.functionQuery', 3, 'SystemPrivilege', '2020-12-14 15:17:11', '2019-11-05 17:28:45');
INSERT INTO `t_privilege` VALUES (71, 2, '查询', 'notice-query', 'noticeController.queryReceiveByPage,noticeController.queryUnreadByPage,noticeController.queryByPage,noticeController.detail', 0, 'NoticeList', '2019-11-05 17:30:16', '2019-11-05 17:30:16');
INSERT INTO `t_privilege` VALUES (72, 2, '添加', 'notice-add', 'noticeController.add', 1, 'NoticeList', '2019-11-05 17:30:28', '2019-11-05 17:30:28');
INSERT INTO `t_privilege` VALUES (73, 2, '修改', 'notice-edit', 'noticeController.update', 2, 'NoticeList', '2019-11-05 17:31:24', '2019-11-05 17:31:24');
INSERT INTO `t_privilege` VALUES (74, 2, '删除', 'notice-delete', 'noticeController.delete', 3, 'NoticeList', '2019-11-06 11:12:32', '2019-11-06 11:12:32');
INSERT INTO `t_privilege` VALUES (75, 2, '详情', 'notice-detail', 'noticeController.detail', 4, 'NoticeList', '2019-11-06 11:12:44', '2019-11-06 11:12:44');
INSERT INTO `t_privilege` VALUES (76, 2, '发送', 'notice-send', 'noticeController.send', 5, 'NoticeList', '2019-11-06 11:12:51', '2019-11-06 11:12:51');
INSERT INTO `t_privilege` VALUES (77, 2, '查询', 'person-notice-query', 'noticeController.queryReceiveByPage,noticeController.queryUnreadByPage,noticeController.queryByPage', 0, 'PersonNotice', '2019-11-06 11:13:27', '2019-11-06 11:13:27');
INSERT INTO `t_privilege` VALUES (78, 2, '详情', 'person-notice-detail', 'noticeController.detail', 1, 'PersonNotice', '2019-11-06 11:13:35', '2019-11-06 11:13:35');
INSERT INTO `t_privilege` VALUES (79, 2, '查询', 'email-query', 'emailController.queryByPage,emailController.detail', 0, 'EmailList', '2019-11-06 11:13:49', '2019-11-06 11:13:49');
INSERT INTO `t_privilege` VALUES (80, 2, '新增', 'email-add', 'emailController.add', 1, 'EmailList', '2019-11-06 11:14:02', '2019-11-06 11:14:02');
INSERT INTO `t_privilege` VALUES (81, 2, '编辑', 'email-update', 'emailController.update', 2, 'EmailList', '2019-11-06 11:14:08', '2019-11-06 11:14:08');
INSERT INTO `t_privilege` VALUES (82, 2, '删除', 'email-delete', 'emailController.delete', 3, 'EmailList', '2019-11-06 11:14:16', '2019-11-06 11:14:16');
INSERT INTO `t_privilege` VALUES (83, 2, '发送', 'email-send', 'emailController.send', 0, 'SendMail', '2019-11-06 11:14:40', '2019-11-06 11:14:40');
INSERT INTO `t_privilege` VALUES (84, 2, '查询', 'user-operate-log-search', 'userOperateLogController.queryByPage', 0, 'UserOperateLog', '2019-11-06 11:15:04', '2019-11-06 11:15:04');
INSERT INTO `t_privilege` VALUES (85, 2, '详情', 'user-operate-log-detail', 'userOperateLogController.detail', 1, 'UserOperateLog', '2019-11-06 11:15:16', '2019-11-06 11:15:16');
INSERT INTO `t_privilege` VALUES (86, 2, '删除', 'user-operate-log-delete', 'userOperateLogController.delete', 2, 'UserOperateLog', '2019-11-06 11:15:25', '2019-11-06 11:15:25');
INSERT INTO `t_privilege` VALUES (87, 2, '查询', 'user-login-log-search', 'userLoginLogController.queryByPage', 0, 'UserLoginLog', '2019-11-06 11:15:43', '2019-11-06 11:15:43');
INSERT INTO `t_privilege` VALUES (88, 2, '删除', 'user-login-log-delete', 'userLoginLogController.delete', 1, 'UserLoginLog', '2019-11-06 11:15:49', '2019-11-06 11:15:49');
INSERT INTO `t_privilege` VALUES (89, 2, '查询', 'online-user-search', 'userLoginLogController.queryUserOnLine', 0, 'OnlineUser', '2019-11-06 11:16:05', '2019-11-06 11:16:05');
INSERT INTO `t_privilege` VALUES (90, 2, '查询任务', 'task-search', 'quartzController.query', 0, 'TaskList', '2019-11-06 11:16:24', '2019-11-06 11:16:24');
INSERT INTO `t_privilege` VALUES (91, 2, '刷新任务', 'task-refresh', 'quartzController.query', 1, 'TaskList', '2019-11-06 11:16:50', '2019-11-06 11:16:50');
INSERT INTO `t_privilege` VALUES (92, 2, '添加任务', 'task-add', 'quartzController.saveOrUpdateTask', 2, 'TaskList', '2019-11-06 11:17:04', '2019-11-06 11:17:04');
INSERT INTO `t_privilege` VALUES (93, 2, '编辑任务', 'task-update', 'quartzController.saveOrUpdateTask', 3, 'TaskList', '2019-11-06 11:17:17', '2019-11-06 11:17:17');
INSERT INTO `t_privilege` VALUES (94, 2, '暂停任务', 'task-pause', 'quartzController.pauseTask', 4, 'TaskList', '2019-11-06 11:17:25', '2019-11-06 11:17:25');
INSERT INTO `t_privilege` VALUES (95, 2, '恢复任务', 'task-resume', 'quartzController.resumeTask', 5, 'TaskList', '2019-11-06 11:17:31', '2019-11-06 11:17:31');
INSERT INTO `t_privilege` VALUES (96, 2, '立即运行任务', 'task-run', 'quartzController.runTask', 6, 'TaskList', '2019-11-06 11:17:38', '2019-11-06 11:17:38');
INSERT INTO `t_privilege` VALUES (97, 2, '查看任务日志', 'task-query-log', 'quartzController.queryLog', 7, 'TaskList', '2019-11-06 11:17:47', '2019-11-06 11:17:47');
INSERT INTO `t_privilege` VALUES (98, 2, '删除任务', 'task-delete', 'quartzController.deleteTask', 8, 'TaskList', '2019-11-06 11:17:53', '2019-11-06 11:17:53');
INSERT INTO `t_privilege` VALUES (99, 2, '查询', 'smart-reload-search', 'smartReloadController.listAllReloadItem', 0, 'SmartReloadList', '2019-11-06 11:18:06', '2019-11-06 11:18:06');
INSERT INTO `t_privilege` VALUES (100, 2, '执行reload', 'smart-reload-update', 'smartReloadController.updateByTag', 1, 'SmartReloadList', '2019-11-06 11:18:14', '2019-11-06 11:18:14');
INSERT INTO `t_privilege` VALUES (101, 2, '查看执行结果', 'smart-reload-result', 'smartReloadController.queryReloadResult', 2, 'SmartReloadList', '2019-11-06 11:18:19', '2019-11-06 11:18:19');
INSERT INTO `t_privilege` VALUES (102, 2, '查询任务', 'heart-beat-query', 'heartBeatController.query', 0, 'HeartBeatList', '2019-11-06 11:18:38', '2019-11-06 11:18:38');
INSERT INTO `t_privilege` VALUES (103, 2, '查询', 'file-filePage-query', 'fileController.queryListByPage,fileController.localGetFile,fileController.downLoadById', 0, 'FileList', '2019-11-06 11:19:06', '2019-11-06 11:19:06');
INSERT INTO `t_privilege` VALUES (104, 2, '上传', 'file-filePage-upload', 'fileController.qiNiuUpload,fileController.localUpload,fileController.aliYunUpload,fileController.saveFile', 1, 'FileList', '2019-11-06 11:19:36', '2019-11-06 11:19:36');
INSERT INTO `t_privilege` VALUES (105, 2, '下载', 'file-filePage-download', 'fileController.downLoadById', 2, 'FileList', '2019-11-16 10:05:02', '2019-11-16 10:05:02');
INSERT INTO `t_privilege` VALUES (106, 1, '业务功能', 'Business', '/business', 0, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (107, 1, '牡丹管理', 'Peony', '/peony', 1, 'Business', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (108, 1, '牡丹花列表', 'PeonyList', '/peony/peony-list', 2, 'Peony', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (109, 1, '牡丹花列表1', 'PeonyList1', '/peony/peony-list1', 3, 'Peony', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (110, 1, '消息详情', 'NoticeDetail', '/notice/notice-detail', 13, 'Notice', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (111, 1, '三级菜单子颗粒', 'ThreeLevelRouterView', '/three-router/level-two/level-three1', 16, 'LevelTwo', '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (112, 1, '系统设置', 'System', '/system', 19, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (113, 1, '开发专用', 'Support', '/support', 32, NULL, '2020-12-14 15:16:26', '2020-12-14 15:16:26');
INSERT INTO `t_privilege` VALUES (114, 2, '查询', 'peony-list-query', '', 1, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (115, 2, '新增', 'peony-list-add', '', 2, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (116, 2, '编辑', 'peony-list-update', '', 3, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (117, 2, '批量删除', 'peony-list-batch-delete', '', 4, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (118, 2, '批量导出', 'peony-list-batch-export', '', 5, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (119, 2, '导出全部', 'peony-list-export-all', '', 6, 'PeonyList', '2020-12-14 15:16:30', '2020-12-14 15:16:30');
INSERT INTO `t_privilege` VALUES (120, 2, '查询', 'peony1-list-query', '', 1, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (121, 2, '新增', 'peony1-list-add', '', 2, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (122, 2, '编辑', 'peony1-list-update', '', 3, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (123, 2, '批量删除', 'peony1-list-batch-delete', '', 4, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (124, 2, '批量导出', 'peony1-list-batch-export', '', 5, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (125, 2, '导出全部', 'peony1-list-export-all', '', 6, 'PeonyList1', '2020-12-14 15:16:33', '2020-12-14 15:16:33');
INSERT INTO `t_privilege` VALUES (126, 2, '批量保存功能点', 'privilege-batch-save-points', 'privilegeController.functionSaveOrUpdate', 1, 'SystemPrivilege', '2020-12-14 15:17:11', '2020-12-14 15:17:11');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', '', '2019-06-21 12:09:34', '2019-06-21 12:09:34');
INSERT INTO `t_role` VALUES (34, '销售', '', '2019-08-30 09:30:50', '2019-08-30 09:30:50');
INSERT INTO `t_role` VALUES (35, '总经理', '', '2019-08-30 09:31:05', '2019-08-30 09:31:05');
INSERT INTO `t_role` VALUES (36, '董事长', '', '2019-08-30 09:31:11', '2019-08-30 09:31:11');
INSERT INTO `t_role` VALUES (37, '财务', '', '2019-08-30 09:31:16', '2019-08-30 09:31:16');
INSERT INTO `t_role` VALUES (38, '运营', '', '2019-08-30 09:31:22', '2019-08-30 09:31:22');
INSERT INTO `t_role` VALUES (40, '测试角色1', '测试角色1', '2019-09-05 15:05:38', '2019-09-05 15:05:38');
INSERT INTO `t_role` VALUES (50, '产品', '负责产品设计', '2021-03-09 22:34:06', '2021-03-09 22:34:06');
INSERT INTO `t_role` VALUES (51, '研发', '负责产品研发，部署上线等', '2021-03-09 22:50:54', '2021-03-09 22:34:39');

-- ----------------------------
-- Table structure for t_role_employee
-- ----------------------------
DROP TABLE IF EXISTS `t_role_employee`;
CREATE TABLE `t_role_employee`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `employee_id` int(0) NOT NULL COMMENT '员工id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色员工功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_employee
-- ----------------------------
INSERT INTO `t_role_employee` VALUES (121, 38, 22, '2019-09-04 09:23:09', '2019-09-04 09:23:09');
INSERT INTO `t_role_employee` VALUES (130, 1, 30, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (131, 1, 17, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (132, 1, 26, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (135, 1, 12, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (136, 1, 11, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (137, 1, 16, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (138, 1, 18, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (139, 1, 19, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (140, 1, 20, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (141, 1, 23, '2019-09-05 15:32:40', '2019-09-05 15:32:40');
INSERT INTO `t_role_employee` VALUES (147, 1, 35, '2019-09-06 09:00:27', '2019-09-06 09:00:27');
INSERT INTO `t_role_employee` VALUES (148, 40, 35, '2019-09-06 09:00:27', '2019-09-06 09:00:27');
INSERT INTO `t_role_employee` VALUES (165, 40, 32, '2019-11-08 10:39:35', '2019-11-08 10:39:35');
INSERT INTO `t_role_employee` VALUES (166, 34, 32, '2019-11-08 10:39:35', '2019-11-08 10:39:35');
INSERT INTO `t_role_employee` VALUES (167, 38, 32, '2019-11-08 10:39:35', '2019-11-08 10:39:35');
INSERT INTO `t_role_employee` VALUES (174, 38, 37, '2019-11-08 11:05:39', '2019-11-08 11:05:39');
INSERT INTO `t_role_employee` VALUES (175, 42, 37, '2019-11-08 11:05:39', '2019-11-08 11:05:39');
INSERT INTO `t_role_employee` VALUES (188, 1, 1, '2019-11-15 16:05:33', '2019-11-15 16:05:33');
INSERT INTO `t_role_employee` VALUES (211, 40, 38, '2019-11-15 16:54:54', '2019-11-15 16:54:54');
INSERT INTO `t_role_employee` VALUES (212, 34, 29, '2019-11-16 18:04:04', '2019-11-16 18:04:04');
INSERT INTO `t_role_employee` VALUES (213, 45, 29, '2019-11-16 18:04:04', '2019-11-16 18:04:04');
INSERT INTO `t_role_employee` VALUES (214, 37, 36, '2021-03-09 15:03:15', '2021-03-09 15:03:15');
INSERT INTO `t_role_employee` VALUES (215, 38, 36, '2021-03-09 15:03:15', '2021-03-09 15:03:15');
INSERT INTO `t_role_employee` VALUES (216, 40, 36, '2021-03-09 15:03:15', '2021-03-09 15:03:15');
INSERT INTO `t_role_employee` VALUES (217, 1, 36, '2021-03-09 15:03:15', '2021-03-09 15:03:15');

-- ----------------------------
-- Table structure for t_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `t_role_privilege`;
CREATE TABLE `t_role_privilege`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `privilege_key` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限key',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10952 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色权限功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_privilege
-- ----------------------------
INSERT INTO `t_role_privilege` VALUES (3506, 48, 'search-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3507, 48, 'add-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3508, 48, 'update-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3509, 48, 'delete-position', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3510, 48, 'add-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3511, 48, 'delete-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3512, 48, 'update-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3513, 48, 'update-role-privilege', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3514, 48, 'add-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3515, 48, 'delete-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3516, 48, 'delete-employee-role-batch', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3517, 48, 'search-employee-list', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3518, 48, 'query-data-scope', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3519, 48, 'update-data-scope', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3520, 48, 'add-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3521, 48, 'update-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3522, 48, 'delete-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3523, 48, 'search-department', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3524, 48, 'add-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3525, 48, 'update-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3526, 48, 'delete-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3527, 48, 'disabled-employee', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3528, 48, 'reset-employee-password', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3529, 48, 'set-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3530, 48, 'disabled-employee-batch', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3531, 48, 'update-employee-role', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3533, 48, 'system-params-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3534, 48, 'system-params-add', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3535, 48, 'system-config-update', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3536, 48, 'system-config-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3537, 48, 'privilegeMainSearch', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3538, 48, 'privilegeMainUpdate', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3539, 48, 'task-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3540, 48, 'task-refresh', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3541, 48, 'task-add', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3542, 48, 'task-update', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3543, 48, 'task-pause', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3544, 48, 'task-resume', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3545, 48, 'task-run', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3546, 48, 'task-query-log', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3547, 48, 'task-delete', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3548, 48, 'systemCodeVersionsQuery', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3552, 48, 'roleOneTwo-add', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3555, 48, 'apiDocument', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3557, 48, 'reload', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3559, 48, 'smart-reload-search', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3560, 48, 'smart-reload-update', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3561, 48, 'smart-reload-result', '2019-09-06 15:28:07', '2019-09-06 15:28:07');
INSERT INTO `t_role_privilege` VALUES (3575, 45, 'task-search', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3576, 45, 'task-refresh', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3577, 45, 'task-add', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3578, 45, 'task-update', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3579, 45, 'task-pause', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3580, 45, 'task-resume', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3581, 45, 'task-run', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3582, 45, 'task-query-log', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3583, 45, 'task-delete', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3586, 45, 'add-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3587, 45, 'delete-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3588, 45, 'update-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3589, 45, 'update-role-privilege', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3590, 45, 'add-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3591, 45, 'delete-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3592, 45, 'delete-employee-role-batch', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3593, 45, 'search-employee-list', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3594, 45, 'query-data-scope', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3595, 45, 'update-data-scope', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3597, 45, 'search-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3598, 45, 'add-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3599, 45, 'update-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3600, 45, 'delete-position', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3602, 45, 'add-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3603, 45, 'set-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3604, 45, 'update-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3605, 45, 'delete-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3606, 45, 'search-department', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3607, 45, 'add-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3608, 45, 'update-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3609, 45, 'disabled-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3610, 45, 'disabled-employee-batch', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3611, 45, 'update-employee-role', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3612, 45, 'delete-employee', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (3613, 45, 'reset-employee-password', '2019-09-06 15:28:17', '2019-09-06 15:28:17');
INSERT INTO `t_role_privilege` VALUES (8549, 35, 'SystemSetting', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8550, 35, 'SystemConfig', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8551, 35, 'SystemPrivilege', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8552, 35, 'Notice', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8553, 35, 'NoticeList', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8554, 35, 'PersonNotice', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8555, 35, 'Email', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8556, 35, 'EmailList', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8557, 35, 'UserLog', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8558, 35, 'UserOperateLog', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8559, 35, 'UserLoginLog', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8560, 35, 'system-config-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8561, 35, 'privilege-main-update', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8562, 35, 'privilege-main-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8563, 35, 'notice-query', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8564, 35, 'notice-add', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8565, 35, 'notice-edit', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8566, 35, 'notice-delete', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8567, 35, 'person-notice-query', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8568, 35, 'person-notice-detail', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8569, 35, 'email-query', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8570, 35, 'email-add', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8571, 35, 'email-update', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8572, 35, 'user-operate-log-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8573, 35, 'user-login-log-search', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (8574, 35, 'system-config-update', '2019-11-15 15:47:52', '2019-11-15 15:47:52');
INSERT INTO `t_role_privilege` VALUES (9005, 37, 'SystemSetting', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9006, 37, 'SystemConfig', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9007, 37, 'system-params-search', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9008, 37, 'system-params-add', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9009, 37, 'system-config-update', '2019-11-15 16:33:09', '2019-11-15 16:33:09');
INSERT INTO `t_role_privilege` VALUES (9368, 34, 'SystemSetting', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9369, 34, 'SystemConfig', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9370, 34, 'SystemPrivilege', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9371, 34, 'system-params-search', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9372, 34, 'system-params-add', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9373, 34, 'privilege-main-search', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9374, 34, 'Task', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9375, 34, 'TaskList', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9376, 34, 'task-search', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9377, 34, 'task-refresh', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9378, 34, 'task-add', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9379, 34, 'task-update', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9380, 34, 'task-pause', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9381, 34, 'task-resume', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9382, 34, 'task-run', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9383, 34, 'task-query-log', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9384, 34, 'task-delete', '2019-11-15 16:45:39', '2019-11-15 16:45:39');
INSERT INTO `t_role_privilege` VALUES (9536, 42, 'Task', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9537, 42, 'TaskList', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9538, 42, 'task-search', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9539, 42, 'task-add', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9540, 42, 'task-update', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9541, 42, 'task-query-log', '2019-11-15 16:50:40', '2019-11-15 16:50:40');
INSERT INTO `t_role_privilege` VALUES (9674, 38, 'Employee', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9675, 38, 'PositionList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9676, 38, 'SystemSetting', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9677, 38, 'SystemConfig', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9678, 38, 'Notice', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9679, 38, 'PersonNotice', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9680, 38, 'Email', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9681, 38, 'EmailList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9682, 38, 'SendMail', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9683, 38, 'Monitor', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9684, 38, 'OnlineUser', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9685, 38, 'Task', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9686, 38, 'TaskList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9687, 38, 'KeepAlive', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9688, 38, 'KeepAliveContentList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9689, 38, 'HeartBeat', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9690, 38, 'HeartBeatList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9691, 38, 'File', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9692, 38, 'FileList', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9693, 38, 'search-position', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9694, 38, 'system-params-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9695, 38, 'system-config-update', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9696, 38, 'system-config-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9697, 38, 'person-notice-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9698, 38, 'person-notice-detail', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9699, 38, 'email-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9700, 38, 'email-send', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9701, 38, 'online-user-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9702, 38, 'task-search', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9703, 38, 'heart-beat-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9704, 38, 'file-filePage-query', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9705, 38, 'file-filePage-upload', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (9706, 38, 'task-refresh', '2019-11-15 16:53:47', '2019-11-15 16:53:47');
INSERT INTO `t_role_privilege` VALUES (10585, 40, 'Employee', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10586, 40, 'RoleManage', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10587, 40, 'PositionList', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10588, 40, 'RoleEmployeeManage', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10589, 40, 'SystemSetting', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10590, 40, 'SystemConfig', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10591, 40, 'SystemPrivilege', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10592, 40, 'Notice', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10593, 40, 'NoticeList', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10594, 40, 'PersonNotice', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10595, 40, 'Email', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10596, 40, 'SendMail', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10597, 40, 'Task', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10598, 40, 'TaskList', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10599, 40, 'add-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10600, 40, 'delete-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10601, 40, 'update-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10602, 40, 'update-role-privilege', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10603, 40, 'add-employee-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10604, 40, 'search-employee-list', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10605, 40, 'delete-employee-role', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10606, 40, 'delete-employee-role-batch', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10607, 40, 'query-data-scope', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10608, 40, 'update-data-scope', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10609, 40, 'search-position', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10610, 40, 'add-position', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10611, 40, 'update-position', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10612, 40, 'search-department', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10613, 40, 'system-params-add', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10614, 40, 'system-config-search', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10615, 40, 'privilege-main-search', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10616, 40, 'notice-query', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10617, 40, 'notice-add', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10618, 40, 'notice-edit', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10619, 40, 'notice-delete', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10620, 40, 'notice-detail', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10621, 40, 'notice-send', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10622, 40, 'person-notice-query', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10623, 40, 'email-send', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10624, 40, 'task-search', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10625, 40, 'task-refresh', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10626, 40, 'task-add', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10627, 40, 'task-update', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10628, 40, 'task-query-log', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10629, 40, 'task-delete', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10630, 40, 'delete-department', '2019-11-15 17:19:42', '2019-11-15 17:19:42');
INSERT INTO `t_role_privilege` VALUES (10835, 1, 'Employee', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10836, 1, 'RoleManage', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10837, 1, 'PositionList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10838, 1, 'RoleEmployeeManage', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10839, 1, 'SystemSetting', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10840, 1, 'SystemConfig', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10841, 1, 'SystemPrivilege', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10842, 1, 'Notice', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10843, 1, 'NoticeList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10844, 1, 'PersonNotice', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10845, 1, 'Email', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10846, 1, 'EmailList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10847, 1, 'SendMail', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10848, 1, 'UserLog', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10849, 1, 'UserOperateLog', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10850, 1, 'UserLoginLog', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10851, 1, 'Monitor', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10852, 1, 'OnlineUser', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10853, 1, 'Sql', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10854, 1, 'Task', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10855, 1, 'TaskList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10856, 1, 'Reload', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10857, 1, 'SmartReloadList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10858, 1, 'ApiDoc', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10859, 1, 'Swagger', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10860, 1, 'ThreeRouter', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10861, 1, 'LevelTwo', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10862, 1, 'RoleTwoTwo', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10863, 1, 'RoleOneOne', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10864, 1, 'KeepAlive', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10865, 1, 'KeepAliveContentList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10866, 1, 'KeepAliveAddContent', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10867, 1, 'HeartBeat', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10868, 1, 'HeartBeatList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10869, 1, 'File', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10870, 1, 'FileList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10871, 1, 'add-role', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10872, 1, 'delete-role', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10873, 1, 'update-role', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10874, 1, 'update-role-privilege', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10875, 1, 'add-employee-role', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10876, 1, 'search-employee-list', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10877, 1, 'delete-employee-role', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10878, 1, 'delete-employee-role-batch', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10879, 1, 'query-data-scope', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10880, 1, 'update-data-scope', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10881, 1, 'search-position', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10882, 1, 'add-position', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10883, 1, 'update-position', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10884, 1, 'delete-position', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10885, 1, 'add-department', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10886, 1, 'update-department', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10887, 1, 'delete-department', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10888, 1, 'search-department', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10889, 1, 'add-employee', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10890, 1, 'update-employee', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10891, 1, 'disabled-employee', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10892, 1, 'disabled-employee-batch', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10893, 1, 'update-employee-role', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10894, 1, 'reset-employee-password', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10895, 1, 'delete-employee', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10896, 1, 'system-params-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10897, 1, 'system-params-add', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10898, 1, 'system-config-update', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10899, 1, 'system-config-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10900, 1, 'privilege-main-update', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10901, 1, 'privilege-main-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10902, 1, 'notice-query', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10903, 1, 'notice-add', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10904, 1, 'notice-edit', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10905, 1, 'notice-delete', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10906, 1, 'notice-detail', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10907, 1, 'notice-send', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10908, 1, 'person-notice-query', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10909, 1, 'person-notice-detail', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10910, 1, 'email-query', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10911, 1, 'email-add', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10912, 1, 'email-update', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10913, 1, 'email-delete', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10914, 1, 'email-send', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10915, 1, 'user-operate-log-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10916, 1, 'user-operate-log-detail', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10917, 1, 'user-operate-log-delete', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10918, 1, 'user-login-log-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10919, 1, 'user-login-log-delete', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10920, 1, 'online-user-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10921, 1, 'task-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10922, 1, 'task-refresh', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10923, 1, 'task-add', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10924, 1, 'task-update', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10925, 1, 'task-pause', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10926, 1, 'task-resume', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10927, 1, 'task-run', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10928, 1, 'task-query-log', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10929, 1, 'task-delete', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10930, 1, 'smart-reload-search', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10931, 1, 'smart-reload-update', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10932, 1, 'smart-reload-result', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10933, 1, 'heart-beat-query', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10934, 1, 'file-filePage-query', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10935, 1, 'file-filePage-upload', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10936, 1, 'Peony', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10937, 1, 'PeonyList', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10938, 1, 'peony-list-query', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10939, 1, 'peony-list-add', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10940, 1, 'peony-list-update', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10941, 1, 'peony-list-batch-delete', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10942, 1, 'peony-list-batch-export', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10943, 1, 'peony-list-export-all', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10944, 1, 'PeonyList1', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10945, 1, 'peony1-list-query', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10946, 1, 'peony1-list-add', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10947, 1, 'peony1-list-update', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10948, 1, 'peony1-list-batch-delete', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10949, 1, 'peony1-list-batch-export', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10950, 1, 'peony1-list-export-all', '2021-03-02 20:11:29', '2021-03-02 20:11:29');
INSERT INTO `t_role_privilege` VALUES (10951, 1, 'Business', '2021-03-02 20:11:29', '2021-03-02 20:11:29');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'xiaoyu', '123456');

SET FOREIGN_KEY_CHECKS = 1;
