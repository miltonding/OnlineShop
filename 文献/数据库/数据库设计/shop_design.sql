-- Total 18 tables
--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
`userid` int NOT NULL AUTO_INCREMENT,
`uuid` varchar(80) NULL,
`username` varchar(80) NOT NULL,
`password` varchar(80) NOT NULL,
`phone_number` varchar(80) NOT NULL,
`email` varchar(80) NULL,
`sex` varchar(10) NULL,
`screen_name` varchar(80) NULL,
`real_name` varchar(80) NULL,
`hobby` varchar(80) NULL,
`birthday` date NULL,
`header_entryid` int(11) DEFAULT NULL,
`secret_question` varchar(80) NULL,
`secret_answer` varchar(80) NULL,
`create_time` datetime NOT NULL,
`update_time` datetime NULL,
`last_login_time` datetime NULL,
`is_encypted` int(1) NULL,
`is_delete` int(1) NULL,
PRIMARY KEY (`userid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;




--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
`roleid` int NOT NULL AUTO_INCREMENT,
`role_name` varchar(80) NULL,
PRIMARY KEY (`roleid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
`userid` int NULL,
`roleid` int NULL,
PRIMARY KEY (`userid`, `roleid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `address`
--

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
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;


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
) 
ENGINE=InnoDB 
DEFAULT CHARACTER SET=utf8;




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
) 
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;




--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
`provinceid` int NOT NULL AUTO_INCREMENT,
`province_name` varchar(80) NULL,
PRIMARY KEY (`provinceid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
`cityid` int NOT NULL AUTO_INCREMENT,
`provinceid` int NULL,
`city_name` varchar(80) NULL,
PRIMARY KEY (`cityid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
`districtid` int NOT NULL AUTO_INCREMENT,
`cityid` int NULL,
`district_name` varchar(80) NULL,
PRIMARY KEY (`districtid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;

--
-- Table structure for table `kind`
--

DROP TABLE IF EXISTS `kind`;
CREATE TABLE `kind` (
`kindid` int NOT NULL AUTO_INCREMENT,
`kind_name` varchar(80) NULL,
`icon` varchar(80) NULL,
`weight` int NULL,
PRIMARY KEY (`kindid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
`categoryid` int NOT NULL AUTO_INCREMENT,
`kindid` int NULL,
`category_name` varchar(80) NULL,
`icon` varchar(80) NULL,
`weight` int NULL,
PRIMARY KEY (`categoryid`, `kindid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
`productid` int NOT NULL AUTO_INCREMENT,
`categoryid` int NULL,
`product_name` varchar(80) NULL,
`icon` varchar(80) NULL,
`weight` int NULL,
PRIMARY KEY (`productid`, `categoryid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;




--
-- Table structure for table `goods`
--

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
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
`goodsid` int  NULL,
`quantity` int NULL,
PRIMARY KEY (`goodsid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
`cartid` int NOT NULL AUTO_INCREMENT,
`userid` int NULL,
`goodsid` int NULL,
`quantity` int NULL,
`is_pay` int(1) NULL,
`is_delete` int(1) NULL,
`weight` int NULL,
PRIMARY KEY (`cartid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
`orderid` int NOT NULL,
`displayid` varchar(100) NOT NULL,
`paymentid` int NULL,
`card_type_id` int NULL,
`creditcard` int NULL,
`userid` int NULL,
`receive_addrid` int NULL,
`bill_addrid` int NULL,
`transport_price` int NULL,
`total_price` int NULL,
`transportid` int NULL,
`is_pay` int(1) NULL,
`is_cancel` int(1) NULL,
`is_delete` int(1) NULL,
`create_time` datetime NULL,
`pay_time` datetime NULL,
`update_time` datetime NULL,
`cancel_time` datetime NULL,
`delete_time` datetime NULL,
PRIMARY KEY (`orderid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
`paymentid` int NOT NULL AUTO_INCREMENT,
`payment_name` varchar(80) NULL,
PRIMARY KEY (`paymentid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;



--
-- Table structure for table `line_goods`
--

DROP TABLE IF EXISTS `line_goods`;
CREATE TABLE `line_goods` (
`orderid` int NULL,
`goodsid` int NULL,
`quantity` int NULL,
`total_cost` int NULL,
`total_price` int NULL,
PRIMARY KEY (`orderid`, `goodsid`) 
)
ENGINE=InnoDB
DEFAULT CHARACTER SET=utf8;

























