/*
 Navicat Premium Data Transfer

 Source Server         : practice


 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : book

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 25/11/2022 18:29:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(11, 2) NULL DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sales` int(0) NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT NULL,
  `img_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES (1, 'java从入门到放弃', 80.00, '国哥', 10002, 9998, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (2, '数据结构与算法', 78.50, '严敏君', 9, 5, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (3, '怎样拐跑别人的媳妇', 68.00, '龙伍', 100003, 100002, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (4, '木虚肉盖饭', 16.00, '小胖', 1001, 999, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (5, 'C++编程思想', 45.50, '刚哥', 14, 95, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (6, '蛋炒饭', 9.90, '周星星', 12, 53, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (7, '赌神', 66.50, '龙伍', 125, 535, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (8, 'Java编程思想', 99.50, '阳哥', 47, 36, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (9, 'JavaScript从入门到精通', 9.90, '婷姐', 85, 95, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (10, 'cocos2d-x游戏编程入门', 49.00, '国哥', 52, 62, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (11, 'C语言程序设计', 28.00, '谭浩强', 52, 74, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (12, 'Lua语言程序设计', 51.50, '雷丰阳', 48, 82, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (13, '西游记', 12.00, '罗贯中', 19, 9999, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (14, '水浒传', 33.05, '华仔', 22, 88, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (15, '操作系统原理', 133.05, '刘优', 122, 188, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (16, '数据结构 java版', 173.15, '封大神', 21, 81, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (17, 'UNIX高级环境编程', 99.15, '乐天', 210, 810, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (18, 'javaScript高级编程', 69.15, '国哥', 210, 810, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (19, '大话设计模式', 89.15, '国哥', 23, 21, 'static/img/default.jpg');
INSERT INTO `t_book` VALUES (78, 'python3', 123.00, 'zhazha', 130, 124, 'stactic/img/default.jpg');
INSERT INTO `t_book` VALUES (81, 'javaweb', 120.00, 'zzm', 110, 110, 'static/img/default.jpg');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES (1, 'zzz', 'zzz', 'zzz@qq.com');
INSERT INTO `t_manager` VALUES (2, 'zjm666', 'zjm666', 'zjm666@qq.com');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `orderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` date NOT NULL,
  `price` decimal(11, 2) NOT NULL,
  `status` int(0) NOT NULL DEFAULT 0,
  `userId` int(0) NOT NULL,
  PRIMARY KEY (`orderId`) USING BTREE,
  INDEX `userId`(`userId`) USING BTREE,
  CONSTRAINT `t_order_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('165647822677713', '2022-06-29', 1000.00, 0, 13);
INSERT INTO `t_order` VALUES ('165647849286713', '2022-06-29', 1000.00, 0, 13);
INSERT INTO `t_order` VALUES ('165648176191013', '2022-06-29', 78.50, 0, 13);
INSERT INTO `t_order` VALUES ('165744074042614', '2022-07-10', 16.00, 0, 14);
INSERT INTO `t_order` VALUES ('165744203304514', '2022-07-10', 16.00, 0, 14);
INSERT INTO `t_order` VALUES ('165744215786113', '2022-07-10', 68.00, 0, 13);
INSERT INTO `t_order` VALUES ('165744420937814', '2022-07-10', 80.00, 0, 14);
INSERT INTO `t_order` VALUES ('166365838494917', '2022-09-20', 158.50, 1, 17);
INSERT INTO `t_order` VALUES ('166372946697917', '2022-09-21', 123.00, 0, 17);
INSERT INTO `t_order` VALUES ('166372953185017', '2022-09-21', 335.15, 0, 17);
INSERT INTO `t_order` VALUES ('166372982145217', '2022-09-21', 123.00, 0, 17);
INSERT INTO `t_order` VALUES ('166373150607618', '2022-09-21', 89.15, 0, 18);
INSERT INTO `t_order` VALUES ('166373660050617', '2022-09-21', 89.15, 0, 17);
INSERT INTO `t_order` VALUES ('166373663378717', '2022-09-21', 123.00, 0, 17);
INSERT INTO `t_order` VALUES ('166373666598317', '2022-09-21', 123.00, 0, 17);
INSERT INTO `t_order` VALUES ('166373682495914', '2022-09-21', 123.00, 0, 14);
INSERT INTO `t_order` VALUES ('166375239914517', '2022-09-21', 158.50, 0, 17);
INSERT INTO `t_order` VALUES ('166375286314320', '2022-09-21', 123.00, 0, 20);

-- ----------------------------
-- Table structure for t_order_item
-- ----------------------------
DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(11, 2) NULL DEFAULT NULL,
  `total_price` decimal(11, 2) NULL DEFAULT NULL,
  `count` int(0) NOT NULL,
  `orderId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderId`(`orderId`) USING BTREE,
  CONSTRAINT `t_order_item_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `t_order` (`orderId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_order_item
-- ----------------------------
INSERT INTO `t_order_item` VALUES (1, 'zz', 199.00, 199.00, 1, '1234567891');
INSERT INTO `t_order_item` VALUES (2, 'zz', 199.00, 199.00, 1, '1234567891');
INSERT INTO `t_order_item` VALUES (6, 'java从入门到精通', 1000.00, 1000.00, 1, '165642474465112');
INSERT INTO `t_order_item` VALUES (7, 'java从入门到精通', 1000.00, 1000.00, 1, '165647822677713');
INSERT INTO `t_order_item` VALUES (8, 'java从入门到精通', 1000.00, 1000.00, 1, '165647849286713');
INSERT INTO `t_order_item` VALUES (9, 'java从入门到精通', 1000.00, 1000.00, 1, '165648043486912');
INSERT INTO `t_order_item` VALUES (10, 'java从入门到精通', 1000.00, 1000.00, 1, '165648100348212');
INSERT INTO `t_order_item` VALUES (11, '数据结构与算法', 78.50, 78.50, 1, '165648176191013');
INSERT INTO `t_order_item` VALUES (12, '木虚肉盖饭', 16.00, 16.00, 1, '165744074042614');
INSERT INTO `t_order_item` VALUES (13, 'java从入门到放弃', 80.00, 80.00, 1, '165744420937814');
INSERT INTO `t_order_item` VALUES (14, 'java从入门到放弃', 80.00, 80.00, 1, '166365838494917');
INSERT INTO `t_order_item` VALUES (15, '数据结构与算法', 78.50, 78.50, 1, '166365838494917');
INSERT INTO `t_order_item` VALUES (17, 'python3', 123.00, 123.00, 1, '166372946697917');
INSERT INTO `t_order_item` VALUES (18, 'python3', 123.00, 246.00, 2, '166372953185017');
INSERT INTO `t_order_item` VALUES (19, '大话设计模式', 89.15, 89.15, 1, '166372953185017');
INSERT INTO `t_order_item` VALUES (20, 'python3', 123.00, 123.00, 1, '166372982145217');
INSERT INTO `t_order_item` VALUES (21, '大话设计模式', 89.15, 89.15, 1, '166373150607618');
INSERT INTO `t_order_item` VALUES (22, '大话设计模式', 89.15, 89.15, 1, '166373660050617');
INSERT INTO `t_order_item` VALUES (23, 'python3', 123.00, 123.00, 1, '166373663378717');
INSERT INTO `t_order_item` VALUES (24, 'python3', 123.00, 123.00, 1, '166373666598317');
INSERT INTO `t_order_item` VALUES (25, 'python3', 123.00, 123.00, 1, '166373682495914');
INSERT INTO `t_order_item` VALUES (26, 'java从入门到放弃', 80.00, 80.00, 1, '166375239914517');
INSERT INTO `t_order_item` VALUES (27, '数据结构与算法', 78.50, 78.50, 1, '166375239914517');
INSERT INTO `t_order_item` VALUES (28, 'python3', 123.00, 123.00, 1, '166375286314320');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (12, 'username', 'password', 'email');
INSERT INTO `t_user` VALUES (13, 'zzm123', 'zzm123', 'zzm123@qq.com');
INSERT INTO `t_user` VALUES (14, 'admin', 'admin', 'admin@qq.com');
INSERT INTO `t_user` VALUES (15, 'admin1', 'admin1', 'admin1@qq.com');
INSERT INTO `t_user` VALUES (16, 'admin2', 'admin2', 'admin2@qq.com');
INSERT INTO `t_user` VALUES (17, 'zjm111', 'zjm111', 'zjm111@qq.com');
INSERT INTO `t_user` VALUES (18, 'zjm123', 'zjm123', 'zjm123@qq.com');
INSERT INTO `t_user` VALUES (19, 'zjm1234', 'zjm1234', 'zzm1234@qq.com');
INSERT INTO `t_user` VALUES (20, 'zyl666', 'zyl666', 'zyl666@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
