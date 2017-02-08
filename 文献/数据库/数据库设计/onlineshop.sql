/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : onlineshop

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-04 19:43:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addressid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `receiver_name` varchar(80) DEFAULT NULL,
  `phone_number` varchar(80) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `provinceid` int(11) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  `districtid` int(11) DEFAULT NULL,
  `detail_address` varchar(255) DEFAULT NULL,
  `is_default` int(1) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  PRIMARY KEY (`addressid`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', 'admin', '13666666888', '222222', '1', '3', '14', '张江镇郭守敬路498号17号楼', '0', '0');
INSERT INTO `address` VALUES ('2', '2', 'contentAdmin', '18888888888', '200000', '3', '11', '61', '张江镇郭守敬路498号17号楼', '1', '0');
INSERT INTO `address` VALUES ('3', '3', 'systemAdmin', '18888888888', '200000', '3', '11', '61', '张江镇郭守敬路498号17号楼', '1', '0');
INSERT INTO `address` VALUES ('4', '4', 'customer', '18888888888', '200000', '3', '11', '61', '张江镇郭守敬路498号17号楼', '1', '0');
INSERT INTO `address` VALUES ('15', '28', 'milton', '13862204725', '215600', '1', '1', '1', '放弃而后夫妻互', '0', '0');
INSERT INTO `address` VALUES ('21', '1', 'testTwo', '13666666666', '111111', '1', '1', '1', '111', '0', '0');
INSERT INTO `address` VALUES ('22', '1', 'main', '13666666666', '411414', '1', '3', '14', '1234rertqwt', '1', '0');
INSERT INTO `address` VALUES ('24', '28', 'fqe', '13862204725', '523555', '1', '3', '11', 'w46t4w', '1', '0');
INSERT INTO `address` VALUES ('25', '29', 'milton', '13862275915', '215415', '1', '3', '14', '提高也一样123', '1', '0');
INSERT INTO `address` VALUES ('26', '30', 'milton', '13862204725', '415415', '2', '6', '31', '667236723', '1', '0');
INSERT INTO `address` VALUES ('27', '31', '测试', '13862204725', '215600', '2', '6', '31', 'tu9qtyhu', '0', '1');
INSERT INTO `address` VALUES ('28', '31', '测试测试', '13862204725', '215600', '1', '1', '1', 'tque9thui', '1', '0');
INSERT INTO `address` VALUES ('29', '32', 'gadg', '13862204720', '215600', '1', '1', '1', '5235', '1', '0');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `is_pay` int(1) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`cartid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '29', '27', '1', '0', '0', null);
INSERT INTO `cart` VALUES ('2', '29', '24', '1', '0', '0', null);
INSERT INTO `cart` VALUES ('12', '3', '45', '1', '0', '0', null);

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `kindid` int(11) NOT NULL,
  `category_name` varchar(80) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryid`,`kindid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1', '电脑整机', null, null);
INSERT INTO `category` VALUES ('2', '1', '手机', null, null);
INSERT INTO `category` VALUES ('3', '1', '音频', null, null);
INSERT INTO `category` VALUES ('4', '1', '摄影', null, null);
INSERT INTO `category` VALUES ('5', '1', '电脑配件', null, null);
INSERT INTO `category` VALUES ('6', '1', '外设', null, null);
INSERT INTO `category` VALUES ('7', '1', '电脑饰品', null, null);
INSERT INTO `category` VALUES ('8', '1', '家电', null, null);

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `provinceid` int(11) NOT NULL,
  `city_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', '南京市');
INSERT INTO `city` VALUES ('2', '1', '无锡市');
INSERT INTO `city` VALUES ('3', '1', '苏州市');
INSERT INTO `city` VALUES ('4', '1', '常州市');
INSERT INTO `city` VALUES ('5', '1', '南通市');
INSERT INTO `city` VALUES ('6', '2', '杭州市');
INSERT INTO `city` VALUES ('7', '2', '宁波市');
INSERT INTO `city` VALUES ('8', '2', '温州市');
INSERT INTO `city` VALUES ('9', '2', '嘉兴市');
INSERT INTO `city` VALUES ('10', '2', '湖州市');
INSERT INTO `city` VALUES ('11', '3', '上海市');

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `districtid` int(11) NOT NULL AUTO_INCREMENT,
  `cityid` int(11) DEFAULT NULL,
  `district_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`districtid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '1', '玄武区');
INSERT INTO `district` VALUES ('2', '1', '秦淮区');
INSERT INTO `district` VALUES ('3', '1', '建邺区');
INSERT INTO `district` VALUES ('4', '1', '鼓楼区');
INSERT INTO `district` VALUES ('5', '1', '浦口区');
INSERT INTO `district` VALUES ('6', '2', '崇安区');
INSERT INTO `district` VALUES ('7', '2', '南长区');
INSERT INTO `district` VALUES ('8', '2', '北塘区');
INSERT INTO `district` VALUES ('9', '2', '锡山区');
INSERT INTO `district` VALUES ('10', '2', '惠山区');
INSERT INTO `district` VALUES ('11', '3', '平江区');
INSERT INTO `district` VALUES ('12', '3', '沧浪区');
INSERT INTO `district` VALUES ('13', '3', '吴中区');
INSERT INTO `district` VALUES ('14', '3', '张家港市');
INSERT INTO `district` VALUES ('15', '3', '昆山市');
INSERT INTO `district` VALUES ('16', '4', '天宁区');
INSERT INTO `district` VALUES ('17', '4', '钟楼区');
INSERT INTO `district` VALUES ('18', '4', '新北区');
INSERT INTO `district` VALUES ('19', '4', '武进区');
INSERT INTO `district` VALUES ('20', '4', '金坛市');
INSERT INTO `district` VALUES ('21', '5', '崇川区');
INSERT INTO `district` VALUES ('22', '5', '港闸区');
INSERT INTO `district` VALUES ('23', '5', '通州区');
INSERT INTO `district` VALUES ('24', '5', '海安县');
INSERT INTO `district` VALUES ('25', '5', '如东县');
INSERT INTO `district` VALUES ('26', '5', '启东市');
INSERT INTO `district` VALUES ('27', '6', '上城区');
INSERT INTO `district` VALUES ('28', '6', '下城区');
INSERT INTO `district` VALUES ('29', '6', '江干区');
INSERT INTO `district` VALUES ('30', '6', '拱墅区');
INSERT INTO `district` VALUES ('31', '6', '西湖区');
INSERT INTO `district` VALUES ('32', '7', '海曙区');
INSERT INTO `district` VALUES ('33', '7', '江东区');
INSERT INTO `district` VALUES ('34', '7', '江北区');
INSERT INTO `district` VALUES ('35', '7', '北仑区');
INSERT INTO `district` VALUES ('36', '7', '镇海区');
INSERT INTO `district` VALUES ('37', '8', '鹿城区');
INSERT INTO `district` VALUES ('38', '8', '龙湾区');
INSERT INTO `district` VALUES ('39', '8', '顾海区');
INSERT INTO `district` VALUES ('40', '8', '洞头县');
INSERT INTO `district` VALUES ('41', '8', '永嘉县');
INSERT INTO `district` VALUES ('42', '9', '南湖区');
INSERT INTO `district` VALUES ('43', '9', '秀洲区');
INSERT INTO `district` VALUES ('44', '9', '嘉善区');
INSERT INTO `district` VALUES ('45', '9', '海盐县');
INSERT INTO `district` VALUES ('46', '9', '海宁市');
INSERT INTO `district` VALUES ('47', '10', '吴兴区');
INSERT INTO `district` VALUES ('48', '10', '南浔区');
INSERT INTO `district` VALUES ('49', '10', '镇清县');
INSERT INTO `district` VALUES ('50', '10', '长兴县');
INSERT INTO `district` VALUES ('51', '10', '安吉县');
INSERT INTO `district` VALUES ('52', '11', '黄浦区');
INSERT INTO `district` VALUES ('53', '11', '卢湾区');
INSERT INTO `district` VALUES ('54', '11', '徐汇区');
INSERT INTO `district` VALUES ('55', '11', '长宁区');
INSERT INTO `district` VALUES ('56', '11', '静安区');
INSERT INTO `district` VALUES ('57', '11', '普陀区');
INSERT INTO `district` VALUES ('58', '11', '闸北区');
INSERT INTO `district` VALUES ('59', '11', '虹口区');
INSERT INTO `district` VALUES ('60', '11', '杨浦区');
INSERT INTO `district` VALUES ('61', '11', '浦东新区');

-- ----------------------------
-- Table structure for `dlfileentry`
-- ----------------------------
DROP TABLE IF EXISTS `dlfileentry`;
CREATE TABLE `dlfileentry` (
  `entryid` int(11) NOT NULL AUTO_INCREMENT,
  `folderid` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entryid`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dlfileentry
-- ----------------------------
INSERT INTO `dlfileentry` VALUES ('6', '2', '28', '9e2e2b9c-946b-4d3d-9c29-d2d11d0ec7bd', 'title_logo', 'png', 'title_logo.png', '/28', null);
INSERT INTO `dlfileentry` VALUES ('7', '2', '1', 'f3c571f0-3d16-4ce8-82b2-edb620e56fdc', '话费贵爱一天发给会员', 'png', '话费贵爱一天发给会员.png', '/1', null);
INSERT INTO `dlfileentry` VALUES ('10', '3', null, 'd8d95c84-5de7-42c1-9f14-e287d2133f41', 'goods-1', 'jpg', 'goods-1.jpg', '/1/1/3', 'ywey');
INSERT INTO `dlfileentry` VALUES ('11', '3', null, '21836f18-05f5-4e33-b9cb-0776f9c61cd6', 'goods-9', 'jpg', 'goods-9.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('12', '3', null, 'feb084d7-68a4-4de3-834f-bbe08a014be0', 'goods-13', 'jpg', 'goods-13.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('13', '3', null, 'cb7dd7e8-22a6-4e83-9b4d-70435b2c929f', 'goods-2', 'jpg', 'goods-2.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('14', '3', null, '77f819b3-c774-4209-bbfa-59b891a74b98', 'goods-3', 'jpg', 'goods-3.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('15', '3', null, 'c43f6b03-f073-48b9-a352-07066995e0c9', 'goods-4', 'jpg', 'goods-4.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('16', '3', null, '36ace5ed-8495-424f-8756-deebc0261cfc', 'goods-6', 'jpg', 'goods-6.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('17', '3', null, 'eed3ba35-caac-46f6-a243-1868aad7621f', 'goods-7', 'jpg', 'goods-7.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('18', '3', null, '01b10102-348f-43ce-9521-f7aa795f3c0b', 'goods-8', 'jpg', 'goods-8.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('19', '3', null, '6087b37b-8c33-4e40-88a8-2e8109da892c', 'goods-10', 'jpg', 'goods-10.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('20', '3', null, '588c70d5-09ec-4fe8-9d3c-c7abd92feccf', 'goods-12', 'jpg', 'goods-12.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('21', '3', null, 'eb7dae52-08a7-4f44-8037-87535e15ee9b', 'goods-14', 'jpg', 'goods-14.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('22', '3', null, '805a06a1-b0e1-4756-92b8-84d7adb4e1c7', 'goods-15', 'jpg', 'goods-15.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('23', '3', null, '97492404-ef10-4b6f-9cb5-de6ed2625f65', 'goods-16', 'jpg', 'goods-16.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('24', '3', null, '2f0e0344-e893-418a-9402-d396cfabcd0a', 'goods-17', 'jpg', 'goods-17.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('25', '3', null, '6fc522eb-9609-42bb-8eeb-663e6569030a', 'goods-19', 'jpg', 'goods-19.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('26', '3', null, '4c88275d-f127-4714-8001-2bcdd77e3a00', 'goods-21', 'jpg', 'goods-21.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('27', '3', null, '37252dde-5f2c-416f-a590-38775d3e16be', 'goods-23', 'jpg', 'goods-23.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('28', '3', null, '2c6fbe48-d6d0-4b33-a195-8e089f5d1398', 'goods-25', 'jpg', 'goods-25.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('29', '3', null, '1e12ec96-0f74-4107-b3bf-a124f7d6ffbc', 'goods-27', 'jpg', 'goods-27.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('30', '3', null, '55ed2114-b446-4e5a-be48-fe889b65a048', 'goods-29', 'jpg', 'goods-29.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('31', '3', null, '69473601-919e-4489-be82-35ba0932d51e', 'goods-30', 'jpg', 'goods-30.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('32', '2', '30', '68aa2540-f490-425f-ae2c-a7a2662a67e8', '话费贵爱一天发给会员', 'png', '话费贵爱一天发给会员.png', '/30', null);
INSERT INTO `dlfileentry` VALUES ('33', '2', '31', 'dfd8bb6c-e25d-4b53-b300-c3ddd484aa1e', 'goods-14', 'jpg', 'goods-14.jpg', '/31', null);
INSERT INTO `dlfileentry` VALUES ('34', '3', null, '74eb6b2b-4701-4ba5-9608-fcb58d609de6', 'goods-30', 'jpg', 'goods-30.jpg', '/1/1/3', '');
INSERT INTO `dlfileentry` VALUES ('35', '3', null, 'f7eef7d7-4420-42a1-9652-ffc1a279a2ec', '1', 'jpg', '1.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('36', '3', null, '84369ef0-11ef-4ec3-bcda-3cf2cdd8c2c1', '2', 'jpg', '2.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('37', '3', null, 'b28cfc78-a547-4306-90be-c20d05606136', '3', 'jpg', '3.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('38', '3', null, '0310bf63-365f-4645-8dc9-7aed5a110cf4', '4', 'jpg', '4.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('39', '3', null, '4d7fec0b-9432-448e-b110-3d9c680a1afd', '5', 'jpg', '5.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('40', '3', null, 'df73e898-1a7d-449a-b4ef-108984ef0e61', '6', 'jpg', '6.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('41', '3', null, '2dc0851a-730f-46cd-ae78-ff8bd333c0d0', '7', 'jpg', '7.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('42', '3', null, 'a8f24008-3c03-4339-8f82-52638658de87', '8', 'jpg', '8.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('43', '3', null, '603dbbbe-d1e6-4c85-b515-4da7b28b04c4', '9', 'jpg', '9.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('44', '3', null, '651005e9-3f83-4f46-bed8-92ee820ed198', '10', 'jpg', '10.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('45', '3', null, 'ad3dd9ff-e799-4b5d-9447-a736fd024637', '11', 'jpg', '11.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('46', '3', null, '2c629e05-a58b-47d6-91d1-e450d4e84504', '12', 'jpg', '12.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('47', '3', null, 'a9f36178-41da-42fe-b13c-cf0ea523043e', '13', 'jpg', '13.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('48', '3', null, '43a827e2-d17d-41c8-8706-614afa7f8e61', '14', 'jpg', '14.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('50', '3', null, 'c867f4ef-2257-4a3b-b432-1ac63860be46', '15', 'jpg', '15.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('51', '3', null, '1b116a80-4379-4110-9386-8c55a4fbfc24', '16', 'jpg', '16.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('52', '3', null, '4813dd6a-0fa7-4d80-ac70-59632e3920f1', '17', 'jpg', '17.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('53', '3', null, '454d29ec-ad28-4edd-9a13-eb88e1d3f208', '18', 'jpg', '18.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('54', '3', null, '2e98e753-8c1f-4560-b7de-dd9732f99ae6', '19', 'jpg', '19.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('55', '3', null, 'bfe1111a-374b-43b9-a790-7ac6b172bb5b', '20', 'jpg', '20.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('56', '3', null, '15cd263d-f93f-49e7-8209-ba2f5fb093f1', '21', 'jpg', '21.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('57', '3', null, '635dda1d-c915-4ac8-80ef-12d6b2e6dcb9', '22', 'jpg', '22.jpg', '/1/2/6', '');
INSERT INTO `dlfileentry` VALUES ('59', '3', null, '97c6345a-d0ea-4e4f-ae53-116601a854cf', '1', 'jpg', '1.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('60', '3', null, '6b6b5a7b-5a98-43d5-ac31-9d0d0975f062', '2', 'jpg', '2.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('61', '3', null, '446afcf6-3a55-4086-8cdc-dbfa01fb3f54', '3', 'jpg', '3.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('62', '3', null, '102fe3a1-a5d4-4a62-877b-5ad662bf3ec2', '4', 'jpg', '4.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('63', '3', null, 'af8e246b-1488-4f93-aa64-cf6e8fc9354a', '5', 'jpg', '5.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('64', '3', null, 'd892c0da-2f1d-4bca-b4ec-094ab9093d6b', '6', 'jpg', '6.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('65', '3', null, 'b8efbeec-0281-4594-8393-4cf340807294', '7', 'jpg', '7.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('66', '3', null, 'eae3e501-536f-4292-ae54-32685245524c', '8', 'jpg', '8.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('67', '3', null, '30a15a92-72ae-4e55-8aed-e13a707c88e0', '9', 'jpg', '9.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('68', '3', null, '4b9ba2db-0d19-41c1-8be4-9899ad2aa11e', '10', 'jpg', '10.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('69', '3', null, '98c7e2aa-5119-456b-a67b-b8c7ef5f1ab1', '11', 'jpg', '11.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('70', '3', null, '7abe1bcd-c8cb-4e28-b5f3-1d008e1bd0ac', '12', 'jpg', '12.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('71', '3', null, '10caabf0-f216-4510-9da5-8d23ddb7ab84', '13', 'jpg', '13.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('72', '3', null, '961e2e73-caff-4ba5-9b43-2cd9ef61bf7d', '14', 'jpg', '14.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('73', '3', null, '64207589-4703-427e-9b49-c9f81e58a7ea', '15', 'jpg', '15.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('74', '3', null, 'b075132e-7baa-45e3-a7ce-c02309be5583', '16', 'jpg', '16.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('75', '3', null, '3512a9f6-0b83-49bb-b3c5-ef2f69ad9dc3', '17', 'jpg', '17.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('76', '3', null, '4ca6b819-e573-4583-8aa3-62f8c6971b00', '18', 'jpg', '18.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('77', '3', null, '18cd12a7-89e7-4479-b8ae-b4adbe769bc3', '19', 'jpg', '19.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('78', '3', null, '859625a5-5f67-457e-a415-8ad007754e69', '20', 'jpg', '20.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('79', '3', null, 'c49fcaa9-f665-4809-8556-064cb774da9e', '21', 'jpg', '21.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('80', '3', null, 'df3dd69d-20f3-47c5-9f4b-325c1f8d575c', '22', 'jpg', '22.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('81', '3', null, '0b3271be-fccf-4c15-9dc2-fb3bd80661ab', '23', 'jpg', '23.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('82', '3', null, 'be4502af-69a4-465a-b992-d4083ce0d47b', '24', 'jpg', '24.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('83', '3', null, 'a8a24b6f-188b-4298-b2cf-5b8236a1faab', '26', 'jpg', '26.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('84', '3', null, '99ff1fe8-88b0-46c6-a82e-b1e032ebe6ba', '1', 'jpg', '1.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('85', '3', null, 'b943eb98-00f5-41db-9b31-1b45b807d819', '2', 'jpg', '2.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('86', '3', null, '477162ce-eced-4305-8133-41faca46fd78', '3', 'jpg', '3.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('87', '3', null, '09a22614-b817-4d32-9224-9db1a4289d5f', '4', 'jpg', '4.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('88', '3', null, '7b042e6a-2ab4-4bd7-93a6-b067ccbde02d', '5', 'jpg', '5.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('89', '3', null, 'd389f72a-c97d-49c8-9382-19a9c71b9aab', '6', 'jpg', '6.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('90', '3', null, '81989d83-aef4-4d03-9321-5b06bb68efe1', '7', 'jpg', '7.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('91', '3', null, 'f32d3721-9db6-46a4-9d5a-98d1911dab49', '8', 'jpg', '8.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('92', '3', null, '245d5390-cd17-465f-ab9f-f3c29e23f2e5', '9', 'jpg', '9.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('93', '3', null, '1248769a-448c-4ce2-84a6-e1fb59961589', '10', 'jpg', '10.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('94', '3', null, '26e65cd5-df1b-4ba6-8cab-4fdb30f37486', '11', 'jpg', '11.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('95', '3', null, '22b1a2cc-b6a7-4310-b783-49752cf30f82', '12', 'jpg', '12.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('96', '3', null, '75824e0b-023b-475e-b6cc-0cf859065311', '13', 'jpg', '13.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('97', '3', null, '8ac58c61-a6fa-4c6d-a482-b60e373a91e7', '14', 'jpg', '14.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('98', '3', null, '5e846fa9-ba23-4174-87b8-dcaf197c6c24', '15', 'jpg', '15.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('99', '3', null, 'd6bd5b8a-c685-4c29-a78a-b812f53b9cea', '16', 'jpg', '16.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('100', '3', null, '8239fe89-1df6-42e5-ae33-2b69923bdc4e', '17', 'jpg', '17.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('101', '3', null, '78361cd6-2a9b-4ebd-994f-3ee00319f985', '18', 'jpg', '18.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('102', '3', null, 'f1c0ca74-95d1-4e99-afd8-e8d15870df31', '19', 'jpg', '19.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('103', '3', null, 'e64a7357-1de2-47e9-86c1-c9f95c28cdc1', '20', 'jpg', '20.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('104', '3', null, 'a97772d0-1e57-404a-a35d-6dfd62195db1', '21', 'jpg', '21.jpg', '/1/1/1', '');
INSERT INTO `dlfileentry` VALUES ('105', '2', '32', '4873fc0b-5d0c-4774-9af5-6b9a29b4169f', 'test', 'jpg', 'test.jpg', '/32', null);

-- ----------------------------
-- Table structure for `dlfolder`
-- ----------------------------
DROP TABLE IF EXISTS `dlfolder`;
CREATE TABLE `dlfolder` (
  `folderid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `parentpath` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`folderid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dlfolder
-- ----------------------------
INSERT INTO `dlfolder` VALUES ('1', 'documents', null, null, '/documents', null, null);
INSERT INTO `dlfolder` VALUES ('2', 'header', '1', '/documents', '/header', null, null);
INSERT INTO `dlfolder` VALUES ('3', 'goods', '1', '/documents', '/goods', null, null);

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goodsid` int(11) NOT NULL AUTO_INCREMENT,
  `productid` int(11) NOT NULL,
  `brand` varchar(80) DEFAULT NULL,
  `entryid` int(11) DEFAULT NULL,
  `chinese_name` varchar(80) DEFAULT NULL,
  `english_name` varchar(80) DEFAULT NULL,
  `goods_describe` varchar(255) DEFAULT NULL,
  `goods_advantage` varchar(255) DEFAULT NULL,
  `unit_cost` double DEFAULT NULL,
  `list_price` double DEFAULT NULL,
  `in_sale` int(1) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL,
  `attr_one` varchar(255) DEFAULT NULL,
  `attr_two` varchar(255) DEFAULT NULL,
  `attr_three` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsid`,`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '3', 'apple', '10', '苹果笔记本电脑', 'AppleMacBook Air', 'Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i5 处理器/8GB内存/128GB SSD闪存 MMGF2CH/A)<script>alert(1);</script>', '【成交价6388元】开年盛宴！神券满6000减600元！超强的续航能力，纤薄、轻巧、耐用！', '6000', '6988', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('2', '3', 'apple', '11', '苹果笔记本电脑', 'AppleMacBook Air', '全球购 苹果 Apple 新款 MacBook Air 13.3英寸笔记本电脑 新款13英寸低配i5 8G内存128G闪存 GF2', '质保无忧：本店享受30天意外保，180天性能保，', '6000', '6988', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('3', '3', 'apple', '12', '苹果笔记本电脑', 'AppleMacBook Pro', 'Apple MacBook Pro 15.4英寸笔记本电脑 银色(Core i7 处理器/16GB内存/256GB ', '2月大促！高速闪存，持久的电池使用时间，配备绚丽夺目的Retina显示屏！', '12000', '13688', '1', '0', 'Core i7 处理器', '8GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('4', '3', 'apple', '13', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 2016 新款 Apple MacBook PRO 笔记本 OLED 触摸 银色UQ2 新13英寸 ', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '12000', '10499', '1', '0', 'Core i7 处理器', '8GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('5', '3', 'apple', '14', '苹果笔记本电脑', 'Apple MacBook', '全球购 苹果 Apple MacBook 12英寸笔记本电脑/新款MacBook12英寸 玫瑰金 低配 (M3 8G 256G闪存) GL2', '质保无忧：本店享受30天意外保，180天性能保，', '8000', '9388', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('6', '3', 'apple', '15', '苹果笔记本电脑', 'AppleMacbook Pro', '全球购 苹果 Apple MacBook Pro 苹果笔记本电脑 原装正品 宽屏笔记本 256G MJLQ2 15.4英寸', '质保无忧：本店享受30天意外保，180天性能保，', '12000', '13888', '1', '0', 'Core i7 处理器', '8GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('7', '3', 'apple', '16', '苹果笔记本电脑', 'AppleMacbook ', '全球购 Apple 苹果 MacBook 新款 12英寸超薄笔记本电脑 深空灰色 M5 8G 512闪存 高配', '质保无忧：本店享受30天意外保，180天性能保，', '12000', '12399', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('8', '3', 'apple', '17', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 2016 新款 Apple MacBook PRO 笔记本 OLED 触摸 灰色H32新15英寸Bar/i7/16G/256G', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '15000', '17688', '1', '0', 'Core i7 处理器', '16GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('9', '3', 'apple', '18', '苹果笔记本电脑', 'AppleMacbook Pro', '原装联保 2016款新apple macbook pro苹果笔记本 银色W8215英寸Bar i7/16G/512G', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '20000', '23888', '1', '0', 'Core i7 处理器', '16GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('10', '3', 'apple', '19', '苹果笔记本电脑', 'AppleMacbook Pro', 'Apple MacBook 12英寸笔记本电脑 玫瑰金色 512GB闪存 MMGM2CH/A', '2月大促！神券满8000减800元！高速闪存，绚丽的Retina显示屏，全尺寸键盘，更持久的续航。', '11000', '12288', '1', '0', 'Core i7 处理器', '8GB内存', '512GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('11', '3', 'apple', '20', '苹果笔记本电脑', 'AppleMacbook', '全球购 苹果 Apple MacBook 12英寸笔记本电脑/新款MacBook12英寸 银色 低配 (M3 8G 256G闪存) HA2', '质保无忧：本店享受30天意外保，180天性能保', '8000', '9388', '1', '0', 'Core i5 处理器', '8GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('12', '3', 'apple', '21', '苹果笔记本电脑', 'AppleMacbook Air', 'Apple 苹果 MacBook Air 13.3英寸笔记本电脑 MMGF2CH/A 双核i5/8GB内存/128GB闪存', '买即赠送1贴膜 顺丰包邮', '5500', '6288', '1', '0', 'Core i5 处理器', '5GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('13', '3', 'apple', '22', '苹果笔记本电脑', 'AppleMacbook Pro', 'Apple 苹果 MacBook Pro 笔记本电脑 16年新款 15英寸 Multi-Touch Bar 512G 银色', '质保无忧：本店享受30天意外保，180天性能保', '18000', '20599', '1', '0', 'Core i7 处理器', '16GB内存', '512GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('14', '3', 'apple', '23', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果（APPLE） 新款 Apple MacBook air 苹果笔记本电脑 新款13英寸高配i5 8G 256G闪存 GG2', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '7000', '7999', '1', '0', 'Core i5 处理器', '8GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('15', '3', 'apple', '24', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 Apple MacBook Pro 苹果笔记本电脑 原装正品 宽屏笔记本 512G MF841 13.3英寸', '全店质保无忧：30天意外保，180天性能保', '11000', '12788', '1', '0', 'Core i5 处理器', '8GB内存', '512GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('16', '3', 'apple', '25', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 Apple MacBook Pro 笔记本电脑 Retina显示屏 13英寸128G MF839ZP', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '7500', '8788', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('17', '3', 'apple', '26', '苹果笔记本电脑', 'AppleMacbook', '全球购 苹果 Apple MacBook 12英寸笔记本电脑/新款MacBook12英寸 深空灰 高配 (M5 8G 512G闪存) H82', '质保无忧：本店享受30天意外保，180天性能保，', '10000', '11288', '1', '0', 'Core i5 处理器', '8GB内存', '512GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('18', '3', 'apple', '27', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 Apple MacBook Pro 苹果笔记本电脑 原装正品 宽屏笔记本 256G MJLQ2 15.4英寸', '全店质保无忧：30天意外保，180天性能保', '12000', '13588', '1', '0', 'Core i5 处理器', '16GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('19', '3', 'apple', '28', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果（Apple）MacBook Pro 笔记本电脑 银色Core i7 处理器 13.3英寸 i5 8G 256Gssd/840', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '14000', '15588', '1', '0', 'Core i5 处理器', '8GB内存', '256Gssd/840', null);
INSERT INTO `goods` VALUES ('20', '3', 'apple', '29', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 Apple MacBook Pro 苹果笔记本电脑 原装正品 宽屏笔记本 256G MF840 13.3英寸', '全店质保无忧：30天意外保，180天性能保。', '9000', '10688', '1', '0', 'Core i5 处理器', '8GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('21', '3', 'apple', '30', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 Apple MacBook Pro 苹果笔记本电脑 原装正品 宽屏笔记本 256G MF840 13.3英寸', '全店质保无忧：30天意外保，180天性能保。', '9500', '10688', '1', '0', 'Core i5 处理器', '8GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('22', '3', 'apple', '31', '苹果笔记本电脑', 'AppleMacbook Pro', '苹果 Apple MacBook Pro 笔记本电脑 16年新款 15英寸 Multi-Touch Bar 256 深空灰色', '全店质保无忧：30天意外保，180天性能保。', '17000', '18999', '1', '0', 'Core i7 处理器', '16GB内存', '256GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('23', '3', 'apple', '11', '苹果笔记本电脑', 'AppleMacbook Pro', '全球购 苹果 Apple MacBook 12英寸 笔记本电脑 新款MacBook12英寸 玫瑰金 高配 (M5 8G 512G闪存) GM', '全店质保无忧：30天意外保，180天性能保。', '10500', '11488', '1', '0', 'Core i5 处理器', '8GB内存', '512GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('24', '3', 'apple', '12', '苹果笔记本电脑', 'AppleMacbook Air', 'Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i7 处理器/8GB内存/128GB SSD闪存 Z0TA0002L）', '定制款！升级Core i7处理器！纤薄轻巧，非常适合随身携带！', '6500', '7388', '1', '0', 'Core i7 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('25', '3', 'apple', '20', '苹果笔记本电脑', 'AppleMacbook Air', 'Apple air 12英寸 macbook air 美版 原装 原封 金色 Intel Core M3 8G+256G', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '7800', '8988', '1', '0', 'Core i5 处理器', '8GB内存', '256GB SSD闪存', null);
INSERT INTO `goods` VALUES ('26', '3', 'apple', '21', '苹果笔记本电脑', 'AppleMacbook Pro', '全球购 全新 原装 苹果Apple MacBook Pro 笔记本电脑 Retina显示屏 MF841 13.3英寸 512G', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '11000', '12099', '1', '0', 'Core i5 处理器', '8GB内存', '512GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('27', '3', 'apple', '22', '苹果笔记本电脑', 'AppleMacbook Pro', '全球购 全新 原装 苹果Apple MacBook Pro 笔记本电脑 Retina显示屏 MF841 13.3英寸 512G', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '11000', '12299', '1', '0', 'Core i5 处理器', '8GB内存', '512GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('28', '3', 'apple', '15', '苹果笔记本电脑', 'AppleMacbook', '全球购 全新 原装正品 Apple 苹果 MacBook 12英寸超薄笔记本电脑 玫瑰金(M3 8G 256G闪存) GL2', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '8500', '9379', '1', '0', 'Core i5 处理器', '8GB内存', '256GB SSD闪存', null);
INSERT INTO `goods` VALUES ('29', '3', 'apple', '13', '苹果笔记本电脑', 'AppleMacbook', 'Apple苹果 MacBook 12英寸笔记本电脑 深空灰 Core M5处理器/8G内存/512GB闪存', '2016款 原封未拆 全国联保', '10288', '11288', '1', '0', 'Core i5 处理器', '8GB内存', '512GB SSD闪存', null);
INSERT INTO `goods` VALUES ('30', '3', 'apple', '11', '苹果笔记本电脑', 'AppleMacbook Pro', 'Apple MacBook Pro 13.3英寸笔记本电脑 银色（Core i5处理器/8GB内存/256GB硬盘 MLUQ2CH/A）', '新款MacBook Pro！速度更快，性能更强，身形更纤薄！2月大促！', '10488', '11488', '1', '0', 'Core i5 处理器', '8GB内存', '256GB SSD闪存', null);
INSERT INTO `goods` VALUES ('42', '3', 'test', '21', '苹果笔记本电脑', 'AppleMacbook Pro', '41341', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '12', '11', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('43', '3', 'test..', '12', '苹果笔记本电脑', 'AppleMacbook Pro', '412341', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '12', '11', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('44', '3', '315', '17', '苹果笔记本电脑', 'AppleMacbook Pro', '513251235', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '15', '20.5', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('45', '3', '测试', '34', '苹果笔记本电脑', 'AppleMacbook Pro', '测试43', '数码开学季，精选大牌优惠折，全场低至99元，领券再减！', '100', '120.5', '1', '0', 'Core i5 处理器', '8GB内存', '128GB SSD闪存 MMGF2CH/A', null);
INSERT INTO `goods` VALUES ('46', '6', null, '35', '360N5', null, '360手机 N5 全网通 6GB+32GB 慕斯黑 移动联通电信4G手机 双卡双待', '360手机 N5 全网通 6GB+32GB 慕斯黑 移动联通电信4G手机 双卡双待', null, '1000', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('47', '6', null, '38', '诺基亚6', null, '诺基亚6 (Nokia6) 4GB+64GB 黑色 全网通 双卡双待 移动联通电信4G手机', '诺基亚6 (Nokia6) 4GB+64GB 黑色 全网通 双卡双待 移动联通电信4G手机', null, '8142', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('48', '6', null, '35', 'OPPOA57', null, 'OPPO A57 3GB+32GB内存版 玫瑰金色 全网通4G手机 双卡双待', 'OPPO A57 3GB+32GB内存版 玫瑰金色 全网通4G手机 双卡双待', null, '7325', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('49', '6', null, '36', '小米Note2', null, '小米Note2 全网通 标准版 4GB内存 64GB ROM 亮银黑 移动联通电信4G手机', '小米Note2 全网通 标准版 4GB内存 64GB ROM 亮银黑 移动联通电信4G手机', null, '2503', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('50', '6', null, '37', '魅族6', null, '魅族 MX6 3GB+32GB 全网通公开版 香槟金 移动联通电信4G手机 双卡双待', '魅族 MX6 3GB+32GB 全网通公开版 香槟金 移动联通电信4G手机 双卡双待', null, '3755', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('51', '6', null, '38', '华为荣耀note8', null, '荣耀 NOTE 8 4GB+64GB 全网通4G手机 铂光金', '荣耀 NOTE 8 4GB+64GB 全网通4G手机 铂光金', null, '5347', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('52', '6', null, '39', 'AppleiPhone7', null, 'Apple iPhone 7 Plus 128G 红色特别版 移动联通电信4G手机', 'Apple iPhone 7 Plus 128G 红色特别版 移动联通电信4G手机', null, '9990', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('53', '6', null, '40', '魅族note5-32', null, '魅族 魅蓝Note5 全网通公开版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '魅族 魅蓝Note5 全网通公开版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', null, '7448', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('54', '6', null, '41', '小米小米Note2', null, '小米Note2 全网通 标准版 4GB内存 64GB ROM 亮黑色 移动联通电信4G手机', '小米Note2 全网通 标准版 4GB内存 64GB ROM 亮黑色 移动联通电信4G手机', null, '8035', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('55', '6', null, '42', '360N5', null, '360手机 N5 全网通 6GB+32GB 慕斯黑 移动联通电信4G手机 双卡双待', '360手机 N5 全网通 6GB+32GB 慕斯黑 移动联通电信4G手机 双卡双待', null, '5605', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('56', '6', null, '43', 'AppleiPhone7 Plus', null, 'Apple iPhone 7 Plus 128G 红色特别版 移动联通电信4G手机', 'Apple iPhone 7 Plus 128G 红色特别版 移动联通电信4G手机', null, '5058', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('57', '6', null, '44', '小米小米MIX', null, '小米MIX 全网通 尊享版 6GB内存 256GB ROM 陶瓷黑 移动联通电信4G手机', '小米MIX 全网通 尊享版 6GB内存 256GB ROM 陶瓷黑 移动联通电信4G手机', null, '8514', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('58', '6', null, '45', 'OPPOR9s', null, 'OPPO R9s 全网通4G+64G 双卡双待手机 玫瑰金色', 'OPPO R9s 全网通4G+64G 双卡双待手机 玫瑰金色', null, '2814', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('59', '6', null, '46', '小米小米5', null, '小米5 全网通 高配版 3GB内存 64GB ROM 白色 移动联通电信4G手机', '小米5 全网通 高配版 3GB内存 64GB ROM 白色 移动联通电信4G手机', null, '7027', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('60', '6', null, '47', '华为荣耀8 青春版', null, '荣耀8青春版 全网通 标配版 3GB+32GB 流光金', '荣耀8青春版 全网通 标配版 3GB+32GB 流光金', null, '4300', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('61', '6', null, '48', '360N5', null, '360手机 N5 全网通 6GB+32GB 慕斯黑 移动联通电信4G手机 双卡双待', '360手机 N5 全网通 6GB+32GB 慕斯黑 移动联通电信4G手机 双卡双待', null, '2383', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('62', '6', null, '35', '小米红米Note4', null, '小米 红米Note4 全网通版 4GB+64GB 雅黑 移动联通电信4G手机 双卡双待', '小米 红米Note4 全网通版 4GB+64GB 雅黑 移动联通电信4G手机 双卡双待', null, '2405', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('63', '6', null, '50', '小米红米Note4', null, '小米 红米Note4 全网通版 4GB+64GB 雅黑 移动联通电信4G手机 双卡双待', '小米 红米Note4 全网通版 4GB+64GB 雅黑 移动联通电信4G手机 双卡双待', null, '4349', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('64', '6', null, '51', '华为荣耀note8', null, '荣耀 NOTE 8 4GB+64GB 全网通4G手机 铂光金', '荣耀 NOTE 8 4GB+64GB 全网通4G手机 铂光金', null, '1868', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('65', '6', null, '52', 'OPPOA57', null, 'OPPO A57 3GB+32GB内存版 玫瑰金色 全网通4G手机 双卡双待', 'OPPO A57 3GB+32GB内存版 玫瑰金色 全网通4G手机 双卡双待', null, '5721', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('66', '6', null, '53', 'APPLEiPhone6', null, 'Apple iPhone 6 (A1586) 16GB 深空灰色 移动联通电信4G手机', 'Apple iPhone 6 (A1586) 16GB 深空灰色 移动联通电信4G手机', null, '8530', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('67', '6', null, '54', 'AppleiPhone6s Plus', null, 'Apple iPhone 6s Plus (A1699) 32G 玫瑰金色 移动联通电信4G手机', 'Apple iPhone 6s Plus (A1699) 32G 玫瑰金色 移动联通电信4G手机', null, '4561', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('68', '6', null, '55', '华为荣耀8', null, '荣耀8 4GB+64GB 全网通4G手机 魅海蓝', '荣耀8 4GB+64GB 全网通4G手机 魅海蓝', null, '6858', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('69', '6', null, '56', '小米红米4A', null, '小米 红米 4A 全网通 2GB内存 16GB ROM 香槟金色 移动联通电信4G手机 双卡双待', '小米 红米 4A 全网通 2GB内存 16GB ROM 香槟金色 移动联通电信4G手机 双卡双待', null, '1917', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('70', '6', null, '57', 'AppleiPhone6s Plus', null, 'Apple iPhone 6s Plus (A1699) 32G 玫瑰金色 移动联通电信4G手机', 'Apple iPhone 6s Plus (A1699) 32G 玫瑰金色 移动联通电信4G手机', null, '4873', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('71', '1', null, '59', '华为荣耀平板2高配版', null, '荣耀平板2 高配版 8英寸 (八核 3G/32G 1920x1200 4800mAh WiFi) 香槟金', '荣耀平板2 高配版 8英寸 (八核 3G/32G 1920x1200 4800mAh WiFi) 香槟金', null, '7494', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('72', '1', null, '60', 'AppleiPad', null, 'Apple iPad 平板电脑 9.7英寸（32G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MP2F2CH/A）深空灰色', 'Apple iPad 平板电脑 9.7英寸（32G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MP2F2CH/A）深空灰色', null, '8914', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('73', '1', null, '61', '΢��Surface Pro 4', null, '【蓝色键盘套装】微软（Microsoft）Surface Pro 4 （Intel Core M3 4G内存 128G存储 预装Win10 Office）', '【蓝色键盘套装】微软（Microsoft）Surface Pro 4 （Intel Core M3 4G内存 128G存储 预装Win10 Office）', null, '3800', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('74', '1', null, '62', '联想Miix5', null, '联想 Miix5 尊享版二合一平板电脑12.2英寸（i5-6200U 8G内存/256G/Win10 内含键盘/触控笔/Office)闪电银', '联想 Miix5 尊享版二合一平板电脑12.2英寸（i5-6200U 8G内存/256G/Win10 内含键盘/触控笔/Office)闪电银', null, '5524', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('75', '1', null, '63', 'AppleiPad Pro 9.7英寸', null, 'Apple iPad Pro平板电脑 9.7 英寸（128G WLAN版/A9X芯片/Retina显示屏/Multi-Touch技术MLMV2CH）深空灰色', 'Apple iPad Pro平板电脑 9.7 英寸（128G WLAN版/A9X芯片/Retina显示屏/Multi-Touch技术MLMV2CH）深空灰色', null, '9108', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('76', '1', null, '64', '华为平板', null, '【壳膜套装版】华为荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', '【壳膜套装版】华为荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', null, '3043', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('77', '1', null, '65', 'AppleiPad Pro 9.7英寸', null, 'Apple iPad Pro 平板电脑 9.7 英寸（128G WLAN版/A9X芯片/Retina显示屏/Multi-Touch技术MLMX2CH）金色', 'Apple iPad Pro 平板电脑 9.7 英寸（128G WLAN版/A9X芯片/Retina显示屏/Multi-Touch技术MLMX2CH）金色', null, '8947', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('78', '1', null, '66', 'Surface Book', null, '微软（Microsoft）Surface Book 二合一平板笔记本 13.5英寸（Intel i5 8G内存 128G存储）银色', '微软（Microsoft）Surface Book 二合一平板笔记本 13.5英寸（Intel i5 8G内存 128G存储）银色', null, '6246', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('79', '1', null, '67', '微软电脑', null, '【蓝色键盘套装】微软（Microsoft）Surface Pro 4 （Intel Core M3 4G内存 128G存储 预装Win10 Office）', '【蓝色键盘套装】微软（Microsoft）Surface Pro 4 （Intel Core M3 4G内存 128G存储 预装Win10 Office）', null, '2830', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('80', '1', null, '68', '华为华为M3', null, '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/128G AKG耳机 WiFi)日晖金', '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/128G AKG耳机 WiFi)日晖金', null, '2892', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('81', '1', null, '69', '【京东多仓直发 六期免息】苹果Apple iPad平板电脑 Air2升级版 9.7英寸 金色 新款ipad 128G WLAN版', null, '【京东多仓直发 六期免息】苹果Apple iPad平板电脑 Air2升级版 9.7英寸 金色 新款ipad 128G WLAN版', '【京东多仓直发 六期免息】苹果Apple iPad平板电脑 Air2升级版 9.7英寸 金色 新款ipad 128G WLAN版', null, '9490', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('82', '1', null, '70', '华为荣耀平板2', null, '荣耀平板2 标准版 8英寸 (八核 3G/16G 1920x1200 4800mAh WiFi) 珍珠白', '荣耀平板2 标准版 8英寸 (八核 3G/16G 1920x1200 4800mAh WiFi) 珍珠白', null, '2316', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('83', '1', null, '71', '华为华为M3', null, '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/32G WiFi)日晖金', '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/32G WiFi)日晖金', null, '3310', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('84', '1', null, '72', '华为荣耀平板note(T1-A21W)', null, '华为（HUAWEI）荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', '华为（HUAWEI）荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', null, '5711', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('85', '1', null, '73', '华为平板', null, '【壳膜套装版】华为荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', '【壳膜套装版】华为荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', null, '8609', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('86', '1', null, '74', 'AppleiPad mini4', null, 'Apple iPad mini 4 平板电脑 7.9英寸（128G WLAN版/A8芯片/Retina显示屏/Touch ID技术 MK9P2CH）银色', 'Apple iPad mini 4 平板电脑 7.9英寸（128G WLAN版/A8芯片/Retina显示屏/Touch ID技术 MK9P2CH）银色', null, '5493', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('87', '1', null, '75', '华为荣耀平板2', null, '荣耀平板2 高配版 8英寸 (八核 3G/32G 1920x1200 4800mAh WiFi) 香槟金', '荣耀平板2 高配版 8英寸 (八核 3G/32G 1920x1200 4800mAh WiFi) 香槟金', null, '2087', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('88', '1', null, '76', '华为华为M3', null, '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/64G WiFi)日晖金', '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/64G WiFi)日晖金', null, '4796', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('89', '1', null, '77', 'AppleiPad mini4', null, 'Apple iPad mini 4 平板电脑 7.9英寸（128G WLAN版/A8芯片/Retina显示屏/Touch ID技术 MK9Q2CH）金色', 'Apple iPad mini 4 平板电脑 7.9英寸（128G WLAN版/A8芯片/Retina显示屏/Touch ID技术 MK9Q2CH）金色', null, '9047', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('90', '1', null, '78', '华为华为M3', null, '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/64G WiFi)日晖金', '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/64G WiFi)日晖金', null, '2551', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('91', '1', null, '79', '华为平板', null, '【配件套装】荣耀平板2 标准版 8英寸 珍珠白 （官方标配+平板保护壳+屏幕保护膜）', '【配件套装】荣耀平板2 标准版 8英寸 珍珠白 （官方标配+平板保护壳+屏幕保护膜）', null, '8397', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('92', '1', null, '80', '华为荣耀平板2', null, '荣耀平板2 高配版 8英寸 (八核 3G/32G 1920x1200 4800mAh WiFi) 香槟金', '荣耀平板2 高配版 8英寸 (八核 3G/32G 1920x1200 4800mAh WiFi) 香槟金', null, '7376', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('93', '1', null, '81', '华为荣耀平板note(T1-A21W)', null, '华为（HUAWEI）荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', '华为（HUAWEI）荣耀畅玩note高配版 平板电脑 9.6英寸（四核 2G/16G Wifi）银色', null, '5400', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('94', '1', null, '82', '华为华为M3', null, '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/32G WiFi)皓月银', '华为(HUAWEI)M3 8.4英寸 平板电脑(2560x1600 麒麟950 哈曼卡顿音效 4G/32G WiFi)皓月银', null, '1896', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('95', '1', null, '83', 'AppleiPad', null, 'Apple iPad 平板电脑 9.7英寸（128G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MPGW2CH/A）金色', 'Apple iPad 平板电脑 9.7英寸（128G WLAN版/A9 芯片/Retina显示屏/Touch ID技术 MPGW2CH/A）金色', null, '6480', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('96', '10', null, '84', 'AOCP2791VHE/BW', null, 'AOC 27英寸 焕新二代PLS屏 1.6mm窄边框P2791VHE/BW广视角 爱眼不闪屏显示器（HDMI版）', 'AOC 27英寸 焕新二代PLS屏 1.6mm窄边框P2791VHE/BW广视角 爱眼不闪屏显示器（HDMI版）', null, '7465', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('97', '10', null, '85', '戴尔SE2416H', null, '戴尔（DELL） SE2416H 23.8英寸窄边框带HDMI高清接口IPS屏显示器', '戴尔（DELL） SE2416H 23.8英寸窄边框带HDMI高清接口IPS屏显示器', null, '2826', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('98', '10', null, '86', 'AOCQ3279VWF8/WS', null, 'AOC Q3279VWF8/WS 31.5英寸 FreeSync ΔE<3 10.7亿色 VA屏 2K QHD高分显示器', 'AOC Q3279VWF8/WS 31.5英寸 FreeSync ΔE<3 10.7亿色 VA屏 2K QHD高分显示器', null, '4204', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('99', '10', null, '87', '飞利浦', null, '飞利浦（PHILIPS）23.6英寸 二代炫彩PLS屏 窄边框（HDMI版） 爱眼不闪 电脑液晶显示器247E7QHSWP', '飞利浦（PHILIPS）23.6英寸 二代炫彩PLS屏 窄边框（HDMI版） 爱眼不闪 电脑液晶显示器247E7QHSWP', null, '7322', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('100', '10', null, '88', 'AOCI2579VHE6', null, 'AOC I2579VHE6 25英寸AH-IPS广视角窄边框 爱眼净蓝光不闪屏显示器(HDMI)', 'AOC I2579VHE6 25英寸AH-IPS广视角窄边框 爱眼净蓝光不闪屏显示器(HDMI)', null, '6487', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('101', '10', null, '89', '三星', null, '\r\n飞利浦（PHILIPS）23.6英寸 二代炫彩PLS屏 窄边框（HDMI版） 爱眼不闪 电脑液晶显示器247E7QHSWP', '\r\n飞利浦（PHILIPS）23.6英寸 二代炫彩PLS屏 窄边框（HDMI版） 爱眼不闪 电脑液晶显示器247E7QHSWP', null, '6193', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('102', '10', null, '90', 'AOCI2579VHE6', null, 'AOC I2579VHE6 25英寸AH-IPS广视角窄边框 爱眼净蓝光不闪屏显示器(HDMI)', 'AOC I2579VHE6 25英寸AH-IPS广视角窄边框 爱眼净蓝光不闪屏显示器(HDMI)', null, '1715', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('103', '10', null, '91', 'AOCP2491VWHE/BW', null, 'AOC 23.6英寸 焕新二代PLS屏 1.6mm窄边框P2491VWHE/BW 广视角 爱眼不闪屏显示器（HDMI版）', 'AOC 23.6英寸 焕新二代PLS屏 1.6mm窄边框P2491VWHE/BW 广视角 爱眼不闪屏显示器（HDMI版）', null, '2402', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('104', '10', null, '92', '戴尔UltraSharp U2515H', null, '戴尔（DELL） U2515H 25英寸2K超高清旋转升降专业级IPS屏显示器', '戴尔（DELL） U2515H 25英寸2K超高清旋转升降专业级IPS屏显示器', null, '4828', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('105', '10', null, '93', '三星S27F359FHC', null, '三星（SAMSUNG）S27F359FHC 27英寸PLS广视角轻薄侧面电脑显示器', '三星（SAMSUNG）S27F359FHC 27英寸PLS广视角轻薄侧面电脑显示器', null, '7011', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('106', '10', null, '94', '三星C27F396FHC', null, '三星（SAMSUNG）C27F396FHC 27英寸1800R震撼曲率爱眼低蓝光曲面显示器', '三星（SAMSUNG）C27F396FHC 27英寸1800R震撼曲率爱眼低蓝光曲面显示器', null, '8556', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('107', '10', null, '95', '三星C27F396FHC', null, '飞利浦（PHILIPS）23.6英寸 二代炫彩PLS屏 窄边框（HDMI版） 爱眼不闪 电脑液晶显示器247E7QHSWP', '飞利浦（PHILIPS）23.6英寸 二代炫彩PLS屏 窄边框（HDMI版） 爱眼不闪 电脑液晶显示器247E7QHSWP', null, '1747', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('108', '10', null, '96', '戴尔专业级U2414H', null, '戴尔（DELL） U2414H 23.8英寸旋转升降超窄边IPS屏显示器', '戴尔（DELL） U2414H 23.8英寸旋转升降超窄边IPS屏显示器', null, '9899', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('109', '10', null, '97', '戴尔U2417H', null, '戴尔（DELL） U2417H 23.8英寸四面超窄边旋转升降IPS屏显示器', '戴尔（DELL） U2417H 23.8英寸四面超窄边旋转升降IPS屏显示器', null, '9790', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('110', '10', null, '98', '三星C27F591FDC', null, '三星（SAMSUNG）C27F591FDC 27英寸1800R震撼曲率微边框曲面显示器', '三星（SAMSUNG）C27F591FDC 27英寸1800R震撼曲率微边框曲面显示器', null, '2741', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('111', '10', null, '99', '飞利浦226V6QSB6', null, '飞利浦（PHILIPS）21.5英寸 AH-IPS 细窄边框 电脑液晶显示器226V6QSB6', '飞利浦（PHILIPS）21.5英寸 AH-IPS 细窄边框 电脑液晶显示器226V6QSB6', null, '1457', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('112', '10', null, '100', '戴尔U2417H', null, '戴尔（DELL） U2417H 23.8英寸四面超窄边旋转升降IPS屏显示器', '戴尔（DELL） U2417H 23.8英寸四面超窄边旋转升降IPS屏显示器', null, '5042', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('113', '10', null, '101', 'AOCP2791VHE/BW', null, 'AOC 27英寸 焕新二代PLS屏 1.6mm窄边框P2791VHE/BW广视角 爱眼不闪屏显示器（HDMI版）', 'AOC 27英寸 焕新二代PLS屏 1.6mm窄边框P2791VHE/BW广视角 爱眼不闪屏显示器（HDMI版）', null, '5123', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('114', '10', null, '102', 'AOCI2476VXM', null, 'AOC I2476VXM 23.8英寸IPS-ADS广视角炫彩硬屏爱眼不闪显示器(HDMI)', 'AOC I2476VXM 23.8英寸IPS-ADS广视角炫彩硬屏爱眼不闪显示器(HDMI)', null, '8924', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('115', '10', null, '103', 'AOCC2789FH8', null, 'AOC C2789FH8 27英寸 Adaptive-Sync同步技术 1800R曲率 90%NTSC广色域VA广视角低蓝光 曲面显示器', 'AOC C2789FH8 27英寸 Adaptive-Sync同步技术 1800R曲率 90%NTSC广色域VA广视角低蓝光 曲面显示器', null, '1876', '1', '0', null, null, null, null);
INSERT INTO `goods` VALUES ('116', '10', null, '104', '惠普24ES', null, '惠普（HP）24ES 23.8英寸窄边框6.3mm纤薄IPS屏广视角金属底座液晶显示器（银色）', '惠普（HP）24ES 23.8英寸窄边框6.3mm纤薄IPS屏广视角金属底座液晶显示器（银色）', null, '4728', '1', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `inventory`
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `goodsid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES ('1', '15');
INSERT INTO `inventory` VALUES ('2', '9994');
INSERT INTO `inventory` VALUES ('3', '0');
INSERT INTO `inventory` VALUES ('4', '9993');
INSERT INTO `inventory` VALUES ('5', '9997');
INSERT INTO `inventory` VALUES ('6', '0');
INSERT INTO `inventory` VALUES ('7', '9999');
INSERT INTO `inventory` VALUES ('8', '0');
INSERT INTO `inventory` VALUES ('9', '10000');
INSERT INTO `inventory` VALUES ('10', '9999');
INSERT INTO `inventory` VALUES ('11', '10000');
INSERT INTO `inventory` VALUES ('12', '0');
INSERT INTO `inventory` VALUES ('13', '10000');
INSERT INTO `inventory` VALUES ('14', '10000');
INSERT INTO `inventory` VALUES ('15', '10000');
INSERT INTO `inventory` VALUES ('16', '10000');
INSERT INTO `inventory` VALUES ('17', '10000');
INSERT INTO `inventory` VALUES ('18', '10000');
INSERT INTO `inventory` VALUES ('19', '10000');
INSERT INTO `inventory` VALUES ('20', '10000');
INSERT INTO `inventory` VALUES ('21', '10000');
INSERT INTO `inventory` VALUES ('22', '0');
INSERT INTO `inventory` VALUES ('23', '10000');
INSERT INTO `inventory` VALUES ('24', '10000');
INSERT INTO `inventory` VALUES ('25', '10000');
INSERT INTO `inventory` VALUES ('26', '10000');
INSERT INTO `inventory` VALUES ('27', '10000');
INSERT INTO `inventory` VALUES ('28', '0');
INSERT INTO `inventory` VALUES ('29', '10000');
INSERT INTO `inventory` VALUES ('30', '9999');
INSERT INTO `inventory` VALUES ('42', '10');
INSERT INTO `inventory` VALUES ('43', '1');
INSERT INTO `inventory` VALUES ('44', '0');
INSERT INTO `inventory` VALUES ('45', '0');
INSERT INTO `inventory` VALUES ('46', '100');
INSERT INTO `inventory` VALUES ('47', '100');
INSERT INTO `inventory` VALUES ('48', '100');
INSERT INTO `inventory` VALUES ('49', '100');
INSERT INTO `inventory` VALUES ('50', '100');
INSERT INTO `inventory` VALUES ('51', '100');
INSERT INTO `inventory` VALUES ('52', '100');
INSERT INTO `inventory` VALUES ('53', '100');
INSERT INTO `inventory` VALUES ('54', '100');
INSERT INTO `inventory` VALUES ('55', '100');
INSERT INTO `inventory` VALUES ('56', '100');
INSERT INTO `inventory` VALUES ('57', '100');
INSERT INTO `inventory` VALUES ('58', '100');
INSERT INTO `inventory` VALUES ('59', '100');
INSERT INTO `inventory` VALUES ('60', '100');
INSERT INTO `inventory` VALUES ('61', '100');
INSERT INTO `inventory` VALUES ('62', '100');
INSERT INTO `inventory` VALUES ('63', '100');
INSERT INTO `inventory` VALUES ('64', '100');
INSERT INTO `inventory` VALUES ('65', '100');
INSERT INTO `inventory` VALUES ('66', '100');
INSERT INTO `inventory` VALUES ('67', '100');
INSERT INTO `inventory` VALUES ('68', '100');
INSERT INTO `inventory` VALUES ('69', '100');
INSERT INTO `inventory` VALUES ('70', '100');
INSERT INTO `inventory` VALUES ('71', '100');
INSERT INTO `inventory` VALUES ('72', '100');
INSERT INTO `inventory` VALUES ('73', '100');
INSERT INTO `inventory` VALUES ('74', '100');
INSERT INTO `inventory` VALUES ('75', '100');
INSERT INTO `inventory` VALUES ('76', '100');
INSERT INTO `inventory` VALUES ('77', '100');
INSERT INTO `inventory` VALUES ('78', '99');
INSERT INTO `inventory` VALUES ('79', '100');
INSERT INTO `inventory` VALUES ('80', '100');
INSERT INTO `inventory` VALUES ('81', '100');
INSERT INTO `inventory` VALUES ('82', '100');
INSERT INTO `inventory` VALUES ('83', '100');
INSERT INTO `inventory` VALUES ('84', '100');
INSERT INTO `inventory` VALUES ('85', '100');
INSERT INTO `inventory` VALUES ('86', '100');
INSERT INTO `inventory` VALUES ('87', '100');
INSERT INTO `inventory` VALUES ('88', '100');
INSERT INTO `inventory` VALUES ('89', '100');
INSERT INTO `inventory` VALUES ('90', '100');
INSERT INTO `inventory` VALUES ('91', '100');
INSERT INTO `inventory` VALUES ('92', '100');
INSERT INTO `inventory` VALUES ('93', '100');
INSERT INTO `inventory` VALUES ('94', '100');
INSERT INTO `inventory` VALUES ('95', '100');
INSERT INTO `inventory` VALUES ('96', '100');
INSERT INTO `inventory` VALUES ('97', '100');
INSERT INTO `inventory` VALUES ('98', '100');
INSERT INTO `inventory` VALUES ('99', '100');
INSERT INTO `inventory` VALUES ('100', '100');
INSERT INTO `inventory` VALUES ('101', '100');
INSERT INTO `inventory` VALUES ('102', '100');
INSERT INTO `inventory` VALUES ('103', '100');
INSERT INTO `inventory` VALUES ('104', '100');
INSERT INTO `inventory` VALUES ('105', '100');
INSERT INTO `inventory` VALUES ('106', '100');
INSERT INTO `inventory` VALUES ('107', '100');
INSERT INTO `inventory` VALUES ('108', '100');
INSERT INTO `inventory` VALUES ('109', '100');
INSERT INTO `inventory` VALUES ('110', '100');
INSERT INTO `inventory` VALUES ('111', '100');
INSERT INTO `inventory` VALUES ('112', '100');
INSERT INTO `inventory` VALUES ('113', '100');
INSERT INTO `inventory` VALUES ('114', '100');
INSERT INTO `inventory` VALUES ('115', '100');
INSERT INTO `inventory` VALUES ('116', '100');

-- ----------------------------
-- Table structure for `kind`
-- ----------------------------
DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
  `kindid` int(11) NOT NULL AUTO_INCREMENT,
  `kind_name` varchar(80) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`kindid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kind
-- ----------------------------
INSERT INTO `kind` VALUES ('1', '数码', null, null);
INSERT INTO `kind` VALUES ('2', '服饰', null, null);
INSERT INTO `kind` VALUES ('3', '食品', null, null);

-- ----------------------------
-- Table structure for `line_goods`
-- ----------------------------
DROP TABLE IF EXISTS `line_goods`;
CREATE TABLE `line_goods` (
  `orderid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_cost` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`orderid`,`goodsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of line_goods
-- ----------------------------
INSERT INTO `line_goods` VALUES ('15663', '1', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15663', '5', '1', '8000', '9388');
INSERT INTO `line_goods` VALUES ('15663', '10', '1', '11000', '12288');
INSERT INTO `line_goods` VALUES ('15664', '2', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15664', '5', '1', '8000', '9388');
INSERT INTO `line_goods` VALUES ('15665', '1', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15665', '4', '1', '12000', '10499');
INSERT INTO `line_goods` VALUES ('15666', '7', '1', '12000', '12399');
INSERT INTO `line_goods` VALUES ('15666', '21', '1', '9500', '10688');
INSERT INTO `line_goods` VALUES ('15667', '1', '2', '12000', '13976');
INSERT INTO `line_goods` VALUES ('15667', '4', '1', '12000', '10499');
INSERT INTO `line_goods` VALUES ('15668', '1', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15669', '2', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15669', '4', '1', '12000', '10499');
INSERT INTO `line_goods` VALUES ('15670', '2', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15670', '7', '1', '12000', '12399');
INSERT INTO `line_goods` VALUES ('15671', '2', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15672', '45', '1', '100', '120.5');
INSERT INTO `line_goods` VALUES ('15673', '44', '1', '15', '20.5');
INSERT INTO `line_goods` VALUES ('15674', '44', '1', '15', '20.5');
INSERT INTO `line_goods` VALUES ('15675', '44', '1', '15', '20.5');
INSERT INTO `line_goods` VALUES ('15676', '1', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15676', '2', '2', '12000', '13976');
INSERT INTO `line_goods` VALUES ('15677', '2', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15678', '78', '1', null, '6246');
INSERT INTO `line_goods` VALUES ('15679', '1', '1', '6000', '6988');
INSERT INTO `line_goods` VALUES ('15679', '2', '1', '6000', '6988');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `displayid` varchar(100) NOT NULL,
  `paymentid` int(11) DEFAULT NULL,
  `card_type_id` int(11) DEFAULT NULL,
  `creditcard` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `receive_addrid` int(11) DEFAULT NULL,
  `bill_addrid` int(11) DEFAULT NULL,
  `transport_price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `transportid` int(11) DEFAULT NULL,
  `is_pay` int(1) DEFAULT NULL,
  `is_cancel` int(1) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `cancel_time` datetime DEFAULT NULL,
  `delete_time` datetime DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB AUTO_INCREMENT=15680 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('15663', '201704181812963254', '1', null, '6228480402564890018', '28', '15', '15', null, '28664', '414', '1', '0', '0', '2017-04-02 18:12:37', '2017-04-03 17:25:14', null, '2017-04-03 16:25:00', null);
INSERT INTO `order` VALUES ('15664', '201704181814529080', '1', null, '12354135', '28', '24', '24', null, '16376', '51351313', '1', '0', '0', '2017-04-02 18:14:37', '2017-04-02 18:14:41', null, null, null);
INSERT INTO `order` VALUES ('15665', '201704171747782304', '1', null, null, '28', '24', '24', null, '17487', null, '0', '1', '0', '2017-04-03 17:47:42', null, null, '2017-04-03 17:50:04', null);
INSERT INTO `order` VALUES ('15666', '201704171750521928', '1', null, null, '28', '24', '24', null, '23087', null, '0', '0', '0', '2017-04-03 17:50:31', null, null, null, null);
INSERT INTO `order` VALUES ('15667', '201704181841893332', '2', null, '6228480402564890018', '28', '24', '15', null, '24475', null, '1', '0', '0', '2017-04-08 18:41:03', '2017-04-08 18:41:28', null, null, null);
INSERT INTO `order` VALUES ('15668', '201704131321729851', '2', null, '6228480402564890018', '28', '15', '15', null, '6988', null, '1', '0', '0', '2017-04-11 13:21:03', '2017-04-11 13:21:15', null, null, null);
INSERT INTO `order` VALUES ('15669', '201704141445650684', '3', null, null, '31', '28', '28', null, '17487', null, '0', '1', '0', '2017-04-13 14:45:58', null, null, '2017-04-13 14:46:40', null);
INSERT INTO `order` VALUES ('15670', '201704141447719010', '1', null, '6228480402564890018', '31', '28', '28', null, '19387', null, '1', '0', '0', '2017-04-13 14:47:21', '2017-04-13 14:47:25', null, null, null);
INSERT INTO `order` VALUES ('15671', '201705151558508495', '1', null, '6228480402564890018', '28', '24', '24', null, '6988', null, '1', '0', '0', '2017-05-09 15:58:58', '2017-05-09 15:59:03', null, null, null);
INSERT INTO `order` VALUES ('15672', '201705161600974654', '1', null, '6228480402564890018', '28', '24', '24', null, '120', null, '1', '0', '0', '2017-05-09 16:00:36', '2017-05-09 16:00:38', null, null, null);
INSERT INTO `order` VALUES ('15673', '201705161609847786', '1', null, '6228480402564890018', '28', '24', '24', null, '20', null, '1', '0', '0', '2017-05-09 16:09:13', '2017-05-09 16:09:15', null, null, null);
INSERT INTO `order` VALUES ('15674', '201705161612618365', '1', null, null, '28', '24', '24', null, '20.5', null, '0', '0', '0', '2017-05-09 16:12:48', null, null, null, null);
INSERT INTO `order` VALUES ('15675', '201705161614832301', '1', null, '6228480402564890018', '28', '24', '24', null, '20.5', null, '1', '0', '0', '2017-05-09 16:14:31', '2017-05-09 16:14:36', null, null, null);
INSERT INTO `order` VALUES ('15676', '201705191939633265', '1', null, null, '28', '24', '24', null, '20964', null, '0', '0', '0', '2017-05-12 19:39:06', null, null, null, null);
INSERT INTO `order` VALUES ('15677', '201705181816900583', '1', null, null, '28', '24', '24', null, '6988', null, '0', '0', '0', '2017-05-14 18:16:54', null, null, null, null);
INSERT INTO `order` VALUES ('15678', '201705231801958018', '1', null, '4135135123652346246', '28', '24', '24', null, '6246', null, '1', '0', '0', '2017-05-23 18:01:24', '2017-05-23 18:01:30', null, null, null);
INSERT INTO `order` VALUES ('15679', '201705251449839783', '2', null, null, '32', '29', '29', null, '13976', null, '0', '1', '0', '2017-05-25 14:49:18', null, null, '2017-05-25 14:49:29', null);

-- ----------------------------
-- Table structure for `payment`
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `paymentid` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`paymentid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('1', '货到付款');
INSERT INTO `payment` VALUES ('2', '微信支付');
INSERT INTO `payment` VALUES ('3', '在线支付');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `productid` int(11) NOT NULL AUTO_INCREMENT,
  `categoryid` int(11) NOT NULL,
  `product_name` varchar(80) DEFAULT NULL,
  `icon` varchar(80) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', '平板', null, null);
INSERT INTO `product` VALUES ('3', '1', '商务笔记本', null, null);
INSERT INTO `product` VALUES ('6', '2', '手机', null, null);
INSERT INTO `product` VALUES ('10', '5', '显示屏', null, null);

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `provinceid` int(11) NOT NULL AUTO_INCREMENT,
  `province_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`provinceid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '江苏省');
INSERT INTO `province` VALUES ('2', '浙江省');
INSERT INTO `province` VALUES ('3', '上海');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin');
INSERT INTO `role` VALUES ('2', 'contentAdmin');
INSERT INTO `role` VALUES ('3', 'systemAdmin');
INSERT INTO `role` VALUES ('4', 'customer');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(80) DEFAULT NULL,
  `username` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  `phone_number` varchar(80) NOT NULL,
  `email` varchar(80) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `screen_name` varchar(80) DEFAULT NULL,
  `real_name` varchar(80) DEFAULT NULL,
  `hobby` varchar(80) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `header_entryid` int(11) DEFAULT NULL,
  `secret_question` varchar(80) DEFAULT NULL,
  `secret_answer` varchar(80) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `is_encypted` int(1) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, 'admin.milton@shop.com', 'abc123_', '13862204725', 'admin.milton@shop.com', 'male', 'admin', '丁威', 'running', '1995-08-24', '0', '你初中班主任叫什么', '郭澄东', '2017-02-07 10:15:05', '2017-02-24 22:03:29', '2017-04-06 14:17:07', '1', '0');
INSERT INTO `user` VALUES ('2', null, 'contentAdmin.milton@shop.com', 'WUHhKRGxVu', '13862204725', 'contentAdmin.milton@shop.com', 'male', 'milton', '丁威', 'running', '1995-08-24', null, '你初中班主任叫什么', '郭澄东', '2017-02-07 10:15:05', '2017-02-15 14:01:10', '2017-05-23 17:18:39', '1', '0');
INSERT INTO `user` VALUES ('3', null, 'SystemAdmin.milton@shop.com', 'WUHhKRGxVu', '13862204725', 'SystemAdmin.milton@shop.com', 'male', 'milton', '丁威', 'running', '1995-08-24', null, '你初中班主任叫什么', '郭澄东', '2017-02-07 10:15:05', '2017-04-09 14:56:49', '2017-04-13 14:48:27', '1', '0');
INSERT INTO `user` VALUES ('4', null, 'customer.milton@shop.com', 'abc123_', '13862204725', 'customer.milton@shop.com', 'male', 'milton', '丁威', 'running', '1995-08-24', null, '你初中班主任叫什么', '郭澄东', '2017-02-07 10:15:05', null, null, '0', '0');
INSERT INTO `user` VALUES ('28', null, 'admin.milton12@shop.com', 'WUHhKRGxVu', '13862204725', '871213611@qq.com', null, 'milton123', null, null, null, '6', null, null, '2017-02-14 13:55:14', '2017-04-12 17:35:54', '2017-05-23 18:01:06', '1', '0');
INSERT INTO `user` VALUES ('29', null, '871213611@qq.com', 'WUHhKRGxVu', '13862275915', null, null, '871213611@qq.com', null, null, null, null, null, null, '2017-04-09 13:33:43', null, '2017-05-09 16:20:32', '1', '0');
INSERT INTO `user` VALUES ('30', null, '13862204725', 'WUHhKRGxVu', '13862204725', null, null, '13862204725', null, null, null, '32', null, null, '2017-04-12 16:55:32', '2017-05-24 13:13:13', '2017-05-25 14:45:53', '1', '0');
INSERT INTO `user` VALUES ('31', null, '871213611@163.com', 'WUHhKRGxVu', '13862204725', '871213611@163.com', null, '871213611@163.com', null, null, null, '33', null, null, '2017-04-13 14:38:14', '2017-04-13 14:41:14', '2017-05-09 16:20:22', '1', '0');
INSERT INTO `user` VALUES ('32', null, '13862204720', 'WUHhKRGxVu', '13862204720', null, null, '13862204720', null, null, null, '105', null, null, '2017-05-25 14:46:53', null, '2017-05-25 14:48:59', '1', '0');

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`userid`,`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');
INSERT INTO `user_role` VALUES ('3', '3');
INSERT INTO `user_role` VALUES ('28', '4');
INSERT INTO `user_role` VALUES ('29', '4');
INSERT INTO `user_role` VALUES ('30', '4');
INSERT INTO `user_role` VALUES ('31', '4');
INSERT INTO `user_role` VALUES ('32', '4');
