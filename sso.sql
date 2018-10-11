/*
Navicat MySQL Data Transfer

Source Server         : fsys
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : education

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-10-11 16:52:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(20) DEFAULT NULL,
  `mobile1` varchar(20) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_ptr_1` (`mobile1`,`level`) USING BTREE,
  KEY `agent_ptr_2` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lucky
-- ----------------------------
DROP TABLE IF EXISTS `lucky`;
CREATE TABLE `lucky` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lucky_prt_1` (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `ordercode` bigint(20) NOT NULL AUTO_INCREMENT,
  `trantype` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `userid_to` int(11) DEFAULT NULL,
  `username_to` varchar(60) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `updtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ordercode`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for picvercode
-- ----------------------------
DROP TABLE IF EXISTS `picvercode`;
CREATE TABLE `picvercode` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filename` varchar(60) NOT NULL,
  `vercode` varchar(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `picvercode_ptr1` (`filename`,`vercode`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysparam
-- ----------------------------
DROP TABLE IF EXISTS `sysparam`;
CREATE TABLE `sysparam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bfb1000` int(11) DEFAULT NULL,
  `bfb2000` int(11) DEFAULT NULL,
  `bfb5000` int(11) DEFAULT NULL,
  `bfb10000` int(11) DEFAULT NULL,
  `bfbwzj` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tranlist
-- ----------------------------
DROP TABLE IF EXISTS `tranlist`;
CREATE TABLE `tranlist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trantype` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `userid_to` bigint(20) DEFAULT NULL,
  `username_to` varchar(60) DEFAULT NULL,
  `bal` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `passwd` varchar(60) NOT NULL,
  `pay_passwd` varchar(60) NOT NULL,
  `referee_name` varchar(60) NOT NULL,
  `createtime` bigint(20) NOT NULL,
  `agent` longtext,
  `lastindex` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `activation` int(11) DEFAULT '0',
  `buypower` int(11) DEFAULT '0',
  `integral` int(11) DEFAULT '0',
  `bonus` int(11) DEFAULT '0',
  `spread` int(11) DEFAULT '0',
  `idcard` varchar(20) DEFAULT NULL,
  `name` varchar(60) DEFAULT NULL,
  `alipay` varchar(60) DEFAULT NULL,
  `wechat` varchar(60) DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `bank_account` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `user_ptr_1` (`mobile`) USING BTREE,
  UNIQUE KEY `user_ptr_2` (`username`) USING BTREE,
  KEY `user_ptr_3` (`referee_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_token
-- ----------------------------
DROP TABLE IF EXISTS `user_token`;
CREATE TABLE `user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(160) NOT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_token_ptr_1` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for verification
-- ----------------------------
DROP TABLE IF EXISTS `verification`;
CREATE TABLE `verification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `validtime` bigint(20) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `verification_ptr_1` (`mobile`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


INSERT INTO `sysparam` VALUES ('1', '0', '40', '40', '0', '20');
INSERT INTO `banner` VALUES ('1', '/images/banner/banner1.jpg');
INSERT INTO `banner` VALUES ('2', '/images/banner/banner2.jpg');

