/*
Navicat MySQL Data Transfer

Source Server         : fsys
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : education

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2018-10-17 15:06:43
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
-- Table structure for matchpool
-- ----------------------------
DROP TABLE IF EXISTS `matchpool`;
CREATE TABLE `matchpool` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ordercode` bigint(20) DEFAULT NULL,
  `trantype` int(11) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `matchtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `ordercode` bigint(20) NOT NULL AUTO_INCREMENT,
  `trantype` int(11) DEFAULT NULL,
  `subtrantype` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `userid_to` varchar(512) DEFAULT NULL,
  `username_to` varchar(512) DEFAULT NULL,
  `ordercode_to` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `statusname` int(11) DEFAULT '0',
  `confirm` int(11) DEFAULT '0',
  `createtime` bigint(20) DEFAULT NULL,
  `updtime` bigint(20) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ordercode`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for serveradminuser
-- ----------------------------
DROP TABLE IF EXISTS `serveradminuser`;
CREATE TABLE `serveradminuser` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `passwd` varchar(60) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
  `help_amount` varchar(100) DEFAULT NULL,
  `morning_amount` int(11) DEFAULT NULL,
  `after_amount` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `amount_term` int(11) DEFAULT NULL,
  `amount_term1` int(11) DEFAULT NULL,
  `morning` varchar(60) DEFAULT NULL,
  `after` varchar(60) DEFAULT NULL,
  `term` int(11) DEFAULT NULL,
  `term1` int(11) DEFAULT NULL,
  `interset` int(11) DEFAULT NULL,
  `interset1` int(11) DEFAULT NULL,
  `time1` int(11) DEFAULT NULL,
  `count1` int(11) DEFAULT NULL,
  `count2` int(11) DEFAULT NULL,
  `count3` int(11) DEFAULT NULL,
  `amount1` int(11) DEFAULT NULL,
  `amount2` int(11) DEFAULT NULL,
  `amount3` int(11) DEFAULT NULL,
  `amount4` int(11) DEFAULT NULL,
  `amount5` int(11) DEFAULT NULL,
  `amount6` int(11) DEFAULT NULL,
  `amount7` int(11) DEFAULT NULL,
  `amount8` int(11) DEFAULT NULL,
  `amount9` int(11) DEFAULT NULL,
  `amount10` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tranlist
-- ----------------------------
DROP TABLE IF EXISTS `tranlist`;
CREATE TABLE `tranlist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trantype` int(11) DEFAULT NULL,
  `tranname` varchar(100) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(60) DEFAULT NULL,
  `userid_to` bigint(20) DEFAULT NULL,
  `username_to` varchar(60) DEFAULT NULL,
  `bal` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `createtime` bigint(20) DEFAULT NULL,
  `ordercode` bigint(20) DEFAULT '0',
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
  `blockcount` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


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


INSERT INTO `sysparam` VALUES ('1', '0', '40', '40', '0', '20', '10000,15000,20000,30000', '2000000', '2000000', '24', '24', null, '09:30-10:00', '20:00-20:30', null, null, '13', '6', null, null, null, null, '500', '500', null, '500', '500', null, null, null, null, null);
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '202cb962ac59075b964b07152d234b70', '123456', 'admin', '1538477940', '17623069111', '0', '0', '0', '0', '0', '0', '0', '0', '', '', null, null, null, null);

INSERT INTO `notice` VALUES ('1', '通知！！！', '尊敬的各位会员:由于近两天某些不诚信会员恶意制造恐慌，导致出现部分会员不打款的现象。经公司紧急开会研究决定作以下调整:1:昨天凡匹配成功但未收到打款的会员，请第一时间把收款截图逐一上报给推荐人，由推荐人逐一向下打款。不诚信会员号作封号处理。2:为了保障所有会员的利益和公司长久发展，公司决定从即日起暂停匹配，暂停匹配时间请不要进行申请帮助，如有会员进行操作，后台直接删除订单，造成的损失各自承担。8月10号～18号正常认购（但不匹配打款收款）每个会员帐号必须认购满5单。19号方可正常匹配（回款紧接3号订单逐一释放）在此之前所有会员认购订单和VIP分全部清零。每个会员帐号公司补贴300认购权。3:截止8月18号24:00止，由公司统一排查会员订单帐号，未认购满5单的帐号，公司将不予匹配收款。4:随着公司发展。公司将必须排满5单的制度由5单逐一释放至4单3单等等。直至恢复到1单为止。最后恭喜没有封号的会员，你们的诚信公司有目共睹。平台需要大家共同去维护，也希望所有诚信会员理解和支持，希望所有诚信会员与公司携手共同维护好自己的利益。公司一定会让平台长长久久的走下去。谢谢大家！', '1538415000');

INSERT INTO `serveradminuser` VALUES ('1', 'admin', 'admin', '123456', null);