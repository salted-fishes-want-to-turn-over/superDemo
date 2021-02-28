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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, '研发部1', 'yanfa_db');
INSERT INTO `dept` VALUES (2, '测试部', 'ceshi_db');
INSERT INTO `dept` VALUES (3, '产品部', 'product_db');
INSERT INTO `dept` VALUES (5, 'demoData', 'demoData');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
