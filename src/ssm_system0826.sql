/*
Navicat MySQL Data Transfer

Source Server         : web_graduation_project
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : ssm_system

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-08-26 09:06:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', 'addUser', '添加用户', '/addUser');
INSERT INTO `t_permission` VALUES ('2', 'editUser', '编辑用户', '/editUser');
INSERT INTO `t_permission` VALUES ('3', 'deleteUser', '删除用户', '/deleteUser');
INSERT INTO `t_permission` VALUES ('4', 'listUser', '查看用户列表', '/listUser');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '拥有全部权限');
INSERT INTO `t_role` VALUES ('2', '文档管理员', '拥有全部操作文档（增删改查）权限');
INSERT INTO `t_role` VALUES ('3', '相册管理员', '拥有全部操作相册（增删改查）权限');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('1', '1', '4');
INSERT INTO `t_role_permission` VALUES ('2', '1', '3');
INSERT INTO `t_role_permission` VALUES ('3', '1', '2');
INSERT INTO `t_role_permission` VALUES ('4', '1', '1');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `sex` int(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `entrytime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6', 'admin', 'ecfcc72c6ebc9189959aff0b65727baa', 'TZilXiPOpyly6KetAPZVkQ==', '超级管理员', '1', '18100001234', 'hovinghuang@qq.com', '成都市武侯区', '2018-08-25');
INSERT INTO `t_user` VALUES ('8', '11', '', 'REfiHxYIFP6D/32qVynKuw==', '11', '0', '11', 'editor@qq.com', '11', '2018-08-26');
INSERT INTO `t_user` VALUES ('9', '22', 'c8a894583986d2e6a0d2899875e23251', 'YLIPyjqNBUSNUTV6QnLcBw==', '22', '0', '22', 'editor@qq.com', '22', '2018-08-26');
INSERT INTO `t_user` VALUES ('10', '33', 'f87a5ab9d65a48319829efb60e6c838c', 'CKyEoN2gxK7PijLTpXSJkQ==', '33', '1', '33', 'editor@qq.com', '33', '2018-08-26');
INSERT INTO `t_user` VALUES ('11', '44', '039476558a7dc210deec148680192ff6', '9MlwzYV4MKnhNWqRjY3rBw==', '44', '1', '44', 'editor@qq.com', '44', '2018-08-26');
INSERT INTO `t_user` VALUES ('12', '55', '5cc1383a772a6c442e750b08af17e7a7', 'ZLMguhPk5HVal4uqVLlnnQ==', '55', '1', '55', 'editor@qq.com', '55', '2018-08-26');
INSERT INTO `t_user` VALUES ('13', '66', '663d9ae70ef7dd7aac80be16448f42dd', 'zCA2dfK6eO6QlvRJLuJ89w==', '66', '1', '66', 'editor@qq.com', '66', '2018-08-26');
INSERT INTO `t_user` VALUES ('14', '77', '3bb45584bc149e50283c4cf63da2586d', 'gXD78WSBcSB5ARKbUwOOHg==', '77', '1', '77', 'editor@qq.com', '77', '2018-08-26');
INSERT INTO `t_user` VALUES ('15', '88', 'b8af02c457f0f70618bde7d181f657e2', 'MKld18iI1NouvnwsBUecOQ==', '88', '1', '88', 'editor@qq.com', '88', '2018-08-26');
INSERT INTO `t_user` VALUES ('16', '99', 'd52e756ffb365f434e4574e8e057263d', 'cIMShkien1Rauz0gG4Vduw==', '99', '1', '99', 'editor@qq.com', '99', '2018-08-26');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `rid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('3', '6', '1');
