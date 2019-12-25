/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50540
 Source Host           : localhost:3306
 Source Schema         : etms

 Target Server Type    : MySQL
 Target Server Version : 50540
 File Encoding         : 65001

 Date: 19/12/2019 18:22:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans`  (
  `pid` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '',
  `pname` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `ptxt` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL,
  `pstart` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `pend` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `pstate` int(11) NULL DEFAULT NULL,
  `rstate` int(11) NULL DEFAULT NULL,
  `rinfo` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL,
  `tid` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of plans
-- ----------------------------
INSERT INTO `plans` VALUES ('1F606CC206174D4889572BAAE4BBDED5', '测试', '4561561561', '2019-06-05', '2019-06-29', -1, 1, '152153123', '1F606CC206174D4889572BAAE4BBDED5');
INSERT INTO `plans` VALUES ('5050B775EA134AF2A38C4A50D2781A0B', '边码', '14561561', '2019-05-29', '2019-06-20', 1, 1, '13213212312', '1F606CC206174D4889572BAAE4BBDED5');
INSERT INTO `plans` VALUES ('6B3428BA2B114F2DB77772E92F0B756B', '测试', 'hihihkL', '2019-06-07', '2019-06-21', 0, 0, NULL, '1F606CC206174D4889572BAAE4BBDED5');
INSERT INTO `plans` VALUES ('A0595EE17ACF43679D954869767A5AF4', '开打', '1231651651', '2019-06-14', '2019-06-27', 0, 0, NULL, '1F606CC206174D4889572BAAE4BBDED5');
INSERT INTO `plans` VALUES ('B2B57C6C7D4F401D90D23EE0E3887C53', '232424', 'dfeeg', '2019-06-05', '2019-06-04', 0, 0, NULL, '');
INSERT INTO `plans` VALUES ('BAF1DEF606DA49ADBB28573473D73EB5', '232424', 'dfeeg', '2019-06-05', '2019-06-04', 0, 0, NULL, '');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `tid` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL DEFAULT '',
  `tname` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `tstart` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `tend` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `tuser` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `ttxt` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL,
  `tstate` int(11) NULL DEFAULT NULL,
  `mid` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES ('1F606CC206174D4889572BAAE4BBDED5', '超市管理系统', '2019-06-12', '2019-06-30', '洪七公', '万户侯hi哦', 1, '5A34C736CF8844649DCC60685AC31368');
INSERT INTO `tasks` VALUES ('804290D2032045A789E337F76FFC152C', '安保系统', '2019-06-13', '2019-06-29', '黄金金', '呼唤可怕可怕看', 1, '5A34C736CF8844649DCC60685AC31368');
INSERT INTO `tasks` VALUES ('B493E101A8104229BEF32B9DA402C0B1', '商城', '2019-06-06', '2019-06-28', '李死狗', '123456', 0, '5A34C736CF8844649DCC60685AC31368');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NOT NULL,
  `eid` int(11) NULL DEFAULT NULL,
  `username` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `password` varchar(25) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `identify` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `truename` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `bornDate` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `degree` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `position` varchar(20) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `swt` varchar(30) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `facelogin` int(11) NULL DEFAULT NULL,
  `works` text CHARACTER SET gbk COLLATE gbk_chinese_ci NULL,
  `bid` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  `bname` varchar(50) CHARACTER SET gbk COLLATE gbk_chinese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = gbk COLLATE = gbk_chinese_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('21222F9524DD41B2957BC9E4EC6EB9D0', 10008, 'wmz', '123456', '主管', '王麻子', '男', '2019-05-29', '本科', '看门的', '2019-06-30', 1, 1, '触发报警', '', '');
INSERT INTO `users` VALUES ('5A34C736CF8844649DCC60685AC31368', 10003, 'wxn', '123456', '主管', '王晓娜', '女', '2019-05-27', '本科', '看门', '2019-06-29', 1, 1, '安徽的分散剂看来你考虑', NULL, NULL);
INSERT INTO `users` VALUES ('94E63F0D665C403EA1E01A95E5885E28', 10001, 'gmd', '123456', '管理员', '郭梦迪', '男', '2019-06-01', '本科', '系统管理员', '2019-06-22', 1, 1, '我发给我个', NULL, NULL);
INSERT INTO `users` VALUES ('A86B01E205B644E4B1BD12C7C23D605C', 10007, 'hqg', '123456', '员工', '洪七公', '男', '2019-05-28', '本科', '看门的', '2019-06-30', 2, 1, '借款利率', '5A34C736CF8844649DCC60685AC31368', '王晓娜');
INSERT INTO `users` VALUES ('CB14022E89FA4357ADCC253974E6A1BD', 10004, 'hjj', '123456', '员工', '黄金金', '女', '2019-05-28', '本科', '做饭的', '2019-06-30', 2, 1, '后即可浏览', '5A34C736CF8844649DCC60685AC31368', '王晓娜');
INSERT INTO `users` VALUES ('D07ED53993884F7186E41E66B3712450', 10005, 'ghj', '123456', '员工', '李死狗', '男', '2019-06-05', '大专', '看门的', '2019-06-30', 2, 1, '经济比较', '5A34C736CF8844649DCC60685AC31368', '王晓娜');
INSERT INTO `users` VALUES ('D4B12DE4DFD448E189A7EDA5A85A1110', 10002, 'dxg', '123456', '管理员', '董晓格', '女', '2019-06-07', '本科', 'fasf', '2019-06-07', 1, 1, '发hi哦欸哦分hi哦', NULL, NULL);
INSERT INTO `users` VALUES ('D962E81CB2E74898981F0CC7538B962D', 10006, 'leg', '123456', '员工', '李二狗', '男', '2019-06-07', '大专', '看门', '2019-06-30', 1, 1, '阿法狗v', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
