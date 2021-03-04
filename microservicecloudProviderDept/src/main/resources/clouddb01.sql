/*
 Navicat Premium Data Transfer

 Source Server         : cloudDB01
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : clouddb01

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 25/02/2021 02:18:25
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_employee
-- ----------------------------
INSERT INTO `t_employee` VALUES (1, 'sa', 'c655798e4648c540812a1b8f48759af7', '管理员', '15515515515', '13112312131', '410306199202020020', '1992-02-02', NULL, 1, 0, 0, NULL, 0, '2019-04-27 09:56:17', '2018-05-11 09:38:54', 0);
INSERT INTO `t_employee` VALUES (14, 'lipeng', 'c655798e4648c540812a1b8f48759af7', '李鹏1', '', '13937988294', '', NULL, '', 2, 0, 0, NULL, 1, '2019-04-27 09:56:17', '2019-04-25 14:34:47', 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位关联表' ROW_FORMAT = Dynamic;

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

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
                         `id` int(0) NOT NULL AUTO_INCREMENT,
                         `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                         PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'xiaoyu', '123456');

SET FOREIGN_KEY_CHECKS = 1;
