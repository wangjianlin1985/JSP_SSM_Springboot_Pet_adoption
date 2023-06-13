/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : pet_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-02-12 17:27:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL default '',
  `password` varchar(32) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `t_adopt`
-- ----------------------------
DROP TABLE IF EXISTS `t_adopt`;
CREATE TABLE `t_adopt` (
  `adoptId` int(11) NOT NULL auto_increment COMMENT '领养id',
  `petObj` int(11) NOT NULL COMMENT '被领养宠物',
  `userObj` varchar(20) NOT NULL COMMENT '领养人',
  `addTime` varchar(20) default NULL COMMENT '领养申请时间',
  `shenHe` varchar(20) NOT NULL COMMENT '审核状态',
  PRIMARY KEY  (`adoptId`),
  KEY `petObj` (`petObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_adopt_ibfk_1` FOREIGN KEY (`petObj`) REFERENCES `t_pet` (`petId`),
  CONSTRAINT `t_adopt_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_adopt
-- ----------------------------
INSERT INTO `t_adopt` VALUES ('1', '1', 'user1', '2017-12-19 14:52:42', '待审核');
INSERT INTO `t_adopt` VALUES ('2', '1', 'user2', '2017-12-20 20:34:56', '已审核');
INSERT INTO `t_adopt` VALUES ('3', '2', 'user1', '2018-02-12 15:24:35', '待审核');

-- ----------------------------
-- Table structure for `t_food`
-- ----------------------------
DROP TABLE IF EXISTS `t_food`;
CREATE TABLE `t_food` (
  `foodId` int(11) NOT NULL auto_increment COMMENT '宠粮id',
  `foodName` varchar(80) NOT NULL COMMENT '宠粮名称',
  `foodPhoto` varchar(60) NOT NULL COMMENT '宠粮照片',
  `foodDesc` varchar(5000) NOT NULL COMMENT '宠粮介绍',
  `foodNum` int(11) NOT NULL COMMENT '库存数量',
  `addDate` varchar(20) default NULL COMMENT '上架日期',
  PRIMARY KEY  (`foodId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_food
-- ----------------------------
INSERT INTO `t_food` VALUES ('1', '力狼蘑菇狗粮通用型成犬粮500g', 'upload/c700c384-4dcb-4f6d-80f1-2648dee5fa9b.jpg', '<p>原产地: 中国品牌: 力狼品名: 成犬成犬狗粮金针菇牛肉卷味犬粮犬粮生产厂家名称: 华兴生产厂家地址: 邢台适用犬种: 全犬种 拉布拉多重量(g): 500货号: 无狗狗品种: 通用型适用阶段: 离乳期食品口味: 其他剩余保质期: 6个月以上宠物体型: 小型犬分类: 犬粮</p>', '198', '2017-12-19');
INSERT INTO `t_food` VALUES ('2', '派得狗粮小型犬成犬粮3斤', 'upload/ea9feafd-4182-478d-90d8-8edf8754185f.jpg', '<p>品牌名称：prominent/派得</p><p>产品参数：</p><p>产品名称：Prminent/派得 添加益生菌...原产地: 中国品牌: prominent/派得品名: 添加益生菌配方犬粮毛重: 1.8kg生产厂家名称: 联合沃德有限公司生产厂家地址: 联合沃德有限公司重量(g): 1500货号: PDC-3602狗狗品种: 通用型适用阶段: 成犬食品口味: 牛肉味配方/口味/处方: 添加益生菌配方适用对象: 小型犬成犬宠物体型: 小型犬分类: 犬粮</p><p>&nbsp;</p>', '98', '2017-12-19');

-- ----------------------------
-- Table structure for `t_foodorder`
-- ----------------------------
DROP TABLE IF EXISTS `t_foodorder`;
CREATE TABLE `t_foodorder` (
  `orderId` int(11) NOT NULL auto_increment COMMENT '订单id',
  `foodObj` int(11) NOT NULL COMMENT '宠粮名称',
  `userObj` varchar(20) NOT NULL COMMENT '预订用户',
  `orderNumber` int(11) NOT NULL COMMENT '预订数量',
  `orderState` varchar(20) NOT NULL COMMENT '订单状态',
  `orderTime` varchar(20) default NULL COMMENT '预订时间',
  PRIMARY KEY  (`orderId`),
  KEY `foodObj` (`foodObj`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_foodorder_ibfk_1` FOREIGN KEY (`foodObj`) REFERENCES `t_food` (`foodId`),
  CONSTRAINT `t_foodorder_ibfk_2` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_foodorder
-- ----------------------------
INSERT INTO `t_foodorder` VALUES ('1', '1', 'user1', '2', '已发货', '2017-12-19 14:52:35');
INSERT INTO `t_foodorder` VALUES ('2', '1', 'user1', '2', '待发货', '2017-12-19 17:54:05');
INSERT INTO `t_foodorder` VALUES ('3', '2', 'user2', '2', '已发货', '2017-12-20 20:35:28');

-- ----------------------------
-- Table structure for `t_leaveword`
-- ----------------------------
DROP TABLE IF EXISTS `t_leaveword`;
CREATE TABLE `t_leaveword` (
  `leaveWordId` int(11) NOT NULL auto_increment COMMENT '留言id',
  `leaveTitle` varchar(80) NOT NULL COMMENT '留言标题',
  `leaveContent` varchar(2000) NOT NULL COMMENT '留言内容',
  `userObj` varchar(20) NOT NULL COMMENT '留言人',
  `leaveTime` varchar(20) default NULL COMMENT '留言时间',
  `replyContent` varchar(1000) default NULL COMMENT '管理回复',
  `replyTime` varchar(20) default NULL COMMENT '回复时间',
  PRIMARY KEY  (`leaveWordId`),
  KEY `userObj` (`userObj`),
  CONSTRAINT `t_leaveword_ibfk_1` FOREIGN KEY (`userObj`) REFERENCES `t_userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leaveword
-- ----------------------------
INSERT INTO `t_leaveword` VALUES ('1', '我想要田园犬', '希望搞几只田园犬来吧，我喜欢', 'user1', '2017-12-19 14:46:01', '好的', '2017-12-19 14:46:06');
INSERT INTO `t_leaveword` VALUES ('2', '大家好', '初来乍到', 'user1', '2017-12-19 17:55:28', '很好！', '2017-12-19 18:00:04');
INSERT INTO `t_leaveword` VALUES ('3', '我想买狗粮', '这个网站有狗粮吗？', 'user1', '2017-12-20 20:35:59', '--', '--');

-- ----------------------------
-- Table structure for `t_notice`
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `noticeId` int(11) NOT NULL auto_increment COMMENT '公告id',
  `noticeTitle` varchar(80) NOT NULL COMMENT '标题',
  `noticeClass` varchar(40) NOT NULL COMMENT '公告类别',
  `noticeContent` varchar(5000) NOT NULL COMMENT '公告内容',
  `addDate` varchar(20) default NULL COMMENT '发布日期',
  PRIMARY KEY  (`noticeId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES ('1', '宠物网站成立了', '网站新闻', '<p>以后大家可以来这里，挑选你们喜欢的宠物了哈！</p>', '2017-12-19');

-- ----------------------------
-- Table structure for `t_pet`
-- ----------------------------
DROP TABLE IF EXISTS `t_pet`;
CREATE TABLE `t_pet` (
  `petId` int(11) NOT NULL auto_increment COMMENT '宠物id',
  `petClassObj` int(11) NOT NULL COMMENT '宠物类别',
  `petName` varchar(80) NOT NULL COMMENT '宠物名称',
  `petPhoto` varchar(60) NOT NULL COMMENT '宠物照片',
  `petDesc` varchar(5000) NOT NULL COMMENT '宠物介绍',
  `petRequest` varchar(1000) NOT NULL COMMENT '领养要求',
  `petState` varchar(20) NOT NULL COMMENT '领养状态',
  `addTime` varchar(20) default NULL COMMENT '登记时间',
  PRIMARY KEY  (`petId`),
  KEY `petClassObj` (`petClassObj`),
  CONSTRAINT `t_pet_ibfk_1` FOREIGN KEY (`petClassObj`) REFERENCES `t_petclass` (`petClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pet
-- ----------------------------
INSERT INTO `t_pet` VALUES ('1', '1', '9个月的比熊弟弟希望好心人收养', 'upload/5491e50b-0271-4b57-b279-51d3ee33ab5c.jpg', '<p>比熊弟弟名叫嘟嘟，现在是9个月，除了没有做过绝育，其他的四联针加狂犬都打过了，性格温顺黏人，因为现在怀孕了家里人不允许再养了，所以希望找个好心人可以收养它，不离不弃</p>', '主人要有爱心', '已领养', '2017-12-19 14:49:41');
INSERT INTO `t_pet` VALUES ('2', '2', '2岁泰迪求收养', 'upload/e6555b43-201f-4b75-87c0-b25ab729ddda.jpg', '<p>&nbsp;从小养到2岁，非常聪明，灰色，因孩子读书忙不能再陪他玩了，爸爸妈妈实在太忙，觉得狗狗跟着我们就受委屈了。求喜欢的领去，唯一要求务必自己养，对他好一点，一年内能够偶尔给我看张照片，证明新主人没有把他抛弃。</p>', '偶尔发照片给主人', '待领养', '2017-12-19 18:11:18');

-- ----------------------------
-- Table structure for `t_petclass`
-- ----------------------------
DROP TABLE IF EXISTS `t_petclass`;
CREATE TABLE `t_petclass` (
  `petClassId` int(11) NOT NULL auto_increment COMMENT '宠物类别id',
  `petClassName` varchar(20) NOT NULL COMMENT '宠物类别名称',
  PRIMARY KEY  (`petClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_petclass
-- ----------------------------
INSERT INTO `t_petclass` VALUES ('1', '比熊');
INSERT INTO `t_petclass` VALUES ('2', '泰迪');

-- ----------------------------
-- Table structure for `t_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_userinfo`;
CREATE TABLE `t_userinfo` (
  `user_name` varchar(20) NOT NULL COMMENT 'user_name',
  `password` varchar(20) NOT NULL COMMENT '登录密码',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` varchar(4) NOT NULL COMMENT '性别',
  `birthDate` varchar(20) default NULL COMMENT '生日',
  `userImage` varchar(60) NOT NULL COMMENT '用户照片',
  `telephone` varchar(20) NOT NULL COMMENT '联系电话',
  `address` varchar(80) NOT NULL COMMENT '家庭地址',
  `createTime` varchar(20) default NULL COMMENT '注册时间',
  PRIMARY KEY  (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_userinfo
-- ----------------------------
INSERT INTO `t_userinfo` VALUES ('user1', '123', '双鱼林', '男', '2017-12-12', 'upload/7e77c889-ddaa-4eec-8631-65b64a051d75.jpg', '13539839834', '四川成都红星路', '2017-12-19 14:44:17');
INSERT INTO `t_userinfo` VALUES ('user2', '123', '李倩倩', '女', '2017-12-01', 'upload/aad9bca4-fcd9-4cfd-b388-1f9d31717cb8.jpg', '13589834234', '福建南平', '2017-12-20 20:34:28');
