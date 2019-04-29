-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: com311
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



--
-- Table structure for table `addresses_address`
--

DROP TABLE IF EXISTS `addresses_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  `nickname` varchar(120) DEFAULT NULL,
  `address_type` varchar(120) NOT NULL,
  `residence` varchar(120) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `billing_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_address_billing_profile_id_115cdf27_fk_billing_b` (`billing_profile_id`),
  CONSTRAINT `addresses_address_billing_profile_id_115cdf27_fk_billing_b` FOREIGN KEY (`billing_profile_id`) REFERENCES `billing_billingprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses_address`
--

LOCK TABLES `addresses_address` WRITE;
/*!40000 ALTER TABLE `addresses_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_objectviewed`
--

DROP TABLE IF EXISTS `analytics_objectviewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_objectviewed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(220) DEFAULT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_objectview_content_type_id_35d996a4_fk_django_co` (`content_type_id`),
  KEY `analytics_objectviewed_user_id_b1e9cf2a_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `analytics_objectview_content_type_id_35d996a4_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `analytics_objectviewed_user_id_b1e9cf2a_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_objectviewed`
--

LOCK TABLES `analytics_objectviewed` WRITE;
/*!40000 ALTER TABLE `analytics_objectviewed` DISABLE KEYS */;
INSERT INTO `analytics_objectviewed` VALUES (1,'127.0.0.1',4,'2019-03-15 20:07:52.424523',27,1),(2,'127.0.0.1',1,'2019-03-15 20:11:58.346066',27,1),(3,'127.0.0.1',1,'2019-03-15 20:11:58.511429',27,1),(4,'127.0.0.1',1,'2019-03-15 20:12:59.940767',27,1),(5,'127.0.0.1',2,'2019-03-15 20:14:08.510402',27,1),(6,'127.0.0.1',6,'2019-03-15 20:16:29.062289',27,1),(7,'127.0.0.1',8,'2019-03-15 20:20:32.440461',27,1),(8,'127.0.0.1',11,'2019-03-15 20:22:52.391437',27,1),(9,'127.0.0.1',11,'2019-03-15 20:22:52.543381',27,1),(10,'127.0.0.1',11,'2019-03-15 20:27:59.035234',27,1),(11,'127.0.0.1',17,'2019-03-15 20:30:33.760546',27,1),(12,'127.0.0.1',34,'2019-03-15 20:50:13.922181',27,1),(13,'127.0.0.1',33,'2019-03-15 20:50:26.891811',27,1),(14,'127.0.0.1',19,'2019-03-15 21:03:15.828265',27,1),(15,'127.0.0.1',21,'2019-03-15 21:03:24.097185',27,1);
/*!40000 ALTER TABLE `analytics_objectviewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytics_usersession`
--

DROP TABLE IF EXISTS `analytics_usersession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `analytics_usersession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(220) DEFAULT NULL,
  `session_key` varchar(100) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `ended` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analytics_usersession_user_id_548abc25_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `analytics_usersession_user_id_548abc25_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_usersession`
--

LOCK TABLES `analytics_usersession` WRITE;
/*!40000 ALTER TABLE `analytics_usersession` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytics_usersession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--


--
-- Table structure for table `billing_billingprofile`
--

DROP TABLE IF EXISTS `billing_billingprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_billingprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `update` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `customer_id` varchar(120) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `billing_billingprofile_user_id_1a5112fa_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_billingprofile`
--

LOCK TABLES `billing_billingprofile` WRITE;
/*!40000 ALTER TABLE `billing_billingprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_billingprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_card`
--

DROP TABLE IF EXISTS `billing_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stripe_id` varchar(120) NOT NULL,
  `brand` varchar(120) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `exp_month` int(11) DEFAULT NULL,
  `exp_year` int(11) DEFAULT NULL,
  `last4` varchar(4) DEFAULT NULL,
  `default` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `billing_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_card_billing_profile_id_a1cc4bbe_fk_billing_b` (`billing_profile_id`),
  CONSTRAINT `billing_card_billing_profile_id_a1cc4bbe_fk_billing_b` FOREIGN KEY (`billing_profile_id`) REFERENCES `billing_billingprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_card`
--

LOCK TABLES `billing_card` WRITE;
/*!40000 ALTER TABLE `billing_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_charge`
--

DROP TABLE IF EXISTS `billing_charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stripe_id` varchar(120) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `refunded` tinyint(1) NOT NULL,
  `outcome` longtext,
  `outcome_type` varchar(120) DEFAULT NULL,
  `seller_message` varchar(120) DEFAULT NULL,
  `risk_level` varchar(120) DEFAULT NULL,
  `billing_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_charge_billing_profile_id_8bdb625d_fk_billing_b` (`billing_profile_id`),
  CONSTRAINT `billing_charge_billing_profile_id_8bdb625d_fk_billing_b` FOREIGN KEY (`billing_profile_id`) REFERENCES `billing_billingprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_charge`
--

LOCK TABLES `billing_charge` WRITE;
/*!40000 ALTER TABLE `billing_charge` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cart`
--

DROP TABLE IF EXISTS `carts_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subtotal` decimal(50,2) NOT NULL,
  `total` decimal(50,2) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_cart_user_id_bd0756c7_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `carts_cart_user_id_bd0756c7_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cart`
--

LOCK TABLES `carts_cart` WRITE;
/*!40000 ALTER TABLE `carts_cart` DISABLE KEYS */;
INSERT INTO `carts_cart` VALUES (1,0.00,0.00,'2019-03-15 19:46:10.332464','2019-03-15 19:46:10.332589',NULL),(2,0.00,0.00,'2019-03-15 20:03:18.753763','2019-03-15 20:03:18.753883',1),(3,2500.00,2700.00,'2019-03-15 20:50:23.716072','2019-03-15 20:06:23.080619',1);
/*!40000 ALTER TABLE `carts_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts_cart_products`
--

DROP TABLE IF EXISTS `carts_cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts_cart_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `carts_cart_products_cart_id_product_id_75f0c8ea_uniq` (`cart_id`,`product_id`),
  KEY `carts_cart_products_product_id_17f38e1e_fk_products_product_id` (`product_id`),
  CONSTRAINT `carts_cart_products_cart_id_3124fdb4_fk_carts_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts_cart` (`id`),
  CONSTRAINT `carts_cart_products_product_id_17f38e1e_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cart_products`
--

LOCK TABLES `carts_cart_products` WRITE;
/*!40000 ALTER TABLE `carts_cart_products` DISABLE KEYS */;
INSERT INTO `carts_cart_products` VALUES (1,3,1);
/*!40000 ALTER TABLE `carts_cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Shoes','shoes','Shoes Category',1,'2019-03-15 20:02:28.507648','2019-03-15 20:02:28.507774'),(2,'Phones','phones','Phones Category',1,'2019-03-15 20:10:01.896896','2019-03-15 20:10:01.897022'),(3,'Radios','radios','radios',1,'2019-03-15 20:22:28.551742','2019-03-15 20:22:28.551866'),(4,'Wowenware','wowenware','women ware',1,'2019-03-15 20:27:26.870935','2019-03-15 20:27:26.871075'),(5,'Menware','menware','Menware category',1,'2019-03-15 20:30:21.770859','2019-03-15 20:30:21.770985'),(6,'Foodstuff','foodstuff','food',1,'2019-03-15 20:34:08.212099','2019-03-15 20:34:08.212223'),(7,'Fruits','fruits','fruits',1,'2019-03-15 20:39:29.036335','2019-03-15 20:39:29.036459'),(8,'laptops','laptops','laptops',1,'2019-03-15 20:45:39.949302','2019-03-15 20:45:39.949427');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `is_digital` tinyint(1) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `products_product_category_id_9b594869_fk_categories_id` (`category_id`),
  CONSTRAINT `products_product_category_id_9b594869_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (1,'Trendy','trendy','trendy','trendy_fKeQ764.jpg',2500.00,1,1,'2019-03-15 20:02:33.488926',0,1),(2,'Timberland','timberland','Timberland shoes','timberland_WLyRvaU.jpg',1700.00,1,1,'2019-03-15 20:05:50.615851',0,1),(3,'Shopee','shopee','SHopee','shoppee_dHRGiQi.jpeg',1200.00,1,1,'2019-03-15 20:05:39.572435',0,1),(4,'Brown','brown','brown','brown.jpg',2500.00,1,1,'2019-03-15 20:05:24.304602',0,1),(5,'X-tigi','x-tigi','X-ti phone','x-tigi.jpg',2500.00,0,1,'2019-03-15 20:10:05.515522',0,2),(6,'Huawei','huawei','huawei','huawei.jpeg',13000.00,1,1,'2019-03-15 20:25:40.863979',0,2),(7,'Costoco','costoco','Costoco','costco.jpeg',12000.00,0,1,'2019-03-15 20:17:28.604251',0,2),(8,'I Phone','i-phone','I phone','i_phone.jpeg',25000.00,1,1,'2019-03-15 20:25:25.919380',0,3),(9,'Lg','lg','Lg Phone','lg.jpg',15000.00,1,1,'2019-03-15 20:20:20.769046',1,2),(10,'pp','pp','Po','w9_jK1oSAo.jpg',7500.00,0,1,'2019-03-15 20:26:00.743120',1,3),(11,'w9','w9','w9','w9.jpeg',8900.00,1,1,'2019-03-15 20:26:18.830085',1,3),(13,'wy yu','wy-yu','way','w6.jpeg',15000.00,1,1,'2019-03-15 20:23:34.173594',0,3),(14,'w7','w7','w7 radio','w7.jpg',7800.00,1,1,'2019-03-15 20:25:13.112116',0,3),(15,'dress','dress','dress','images.jpeg',800.00,1,1,'2019-03-15 20:27:30.308773',0,4),(16,'tubues','tubues','tubes','image2.jpeg',500.00,1,1,'2019-03-15 20:29:26.003431',0,4),(17,'shirts','shirts','shirts','image1_ktwX7B5.jpeg',450.00,1,1,'2019-03-15 20:30:25.138578',0,5),(18,'Rice','rice','Pishouri','rice.jpeg',100.00,1,1,'2019-03-15 20:34:09.956130',0,6),(19,'meat','meat','meat','meat.jpeg',450.00,1,1,'2019-03-15 20:34:43.121791',0,6),(20,'Fish','fish','fish','fish_uCp8w65.jpeg',150.00,1,1,'2019-03-15 20:35:33.531822',0,6),(21,'eggs','eggs','eggs','egg.jpeg',250.00,1,1,'2019-03-15 20:38:30.966847',0,NULL),(22,'Watermelon','watermelon','melon','watermelon_SaRq3Gt.jpeg',100.00,1,1,'2019-03-15 20:39:34.599280',0,7),(23,'Plums','plums','plums','plums_rU7p2YQ.jpg',150.00,0,1,'2019-03-15 20:40:08.507481',0,7),(24,'Exotic fruits','exotic-fruits','exotic','exotic_fruit_C9aesl5.jpeg',50.00,1,1,'2019-03-15 20:41:10.912583',0,7),(25,'Blueberry','blueberry','blueberry','blueberry_iSZeoql.jpeg',120.00,1,1,'2019-03-15 20:42:11.849153',0,7),(26,'Cherryfruit','cherryfruit','cherryfruit','cherryfruit_84sFSGl.jpeg',500.00,1,1,'2019-03-15 20:42:53.455456',0,7),(27,'Banana','banana','banana','banana_1A5HJtH.jpg',50.00,1,1,'2019-03-15 20:43:34.928099',0,7),(28,'Avacado','avacado','avacado','Avocado_A-Z_Fruit3_rDCZAoX.jpg',50.00,1,1,'2019-03-15 20:44:14.325100',0,7),(29,'sony','sony','sony','sony.jpeg',46000.00,1,1,'2019-03-15 20:44:53.264047',0,NULL),(30,'lenovo','lenovo','lenovo','lenovo.jpeg',25000.00,1,1,'2019-03-15 20:45:43.179693',0,8),(31,'top','top','top','tops.jpeg',250.00,1,1,'2019-03-15 20:46:17.767217',0,4),(32,'dress fashion','dress-fashion','fashion','d1.jpeg',2500.00,1,1,'2019-03-15 20:47:04.036704',0,4),(33,'bra','bra','bra','cgirls.jpeg',230.00,1,1,'2019-03-15 20:47:31.521680',0,NULL),(34,'oranges','oranges','oranges','chungwa.jpeg',50.00,1,1,'2019-03-15 20:48:20.874809',0,7);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_tag`
--

DROP TABLE IF EXISTS `tags_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_tag_slug_78c2b8d8` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_tag`
--

LOCK TABLES `tags_tag` WRITE;
/*!40000 ALTER TABLE `tags_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_tag_products`
--

DROP TABLE IF EXISTS `tags_tag_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_tag_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_tag_products_tag_id_product_id_ed6e4461_uniq` (`tag_id`,`product_id`),
  KEY `tags_tag_products_product_id_f64ffb65_fk_products_product_id` (`product_id`),
  CONSTRAINT `tags_tag_products_product_id_f64ffb65_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `tags_tag_products_tag_id_7ed0fcd2_fk_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_tag_products`
--

LOCK TABLES `tags_tag_products` WRITE;
/*!40000 ALTER TABLE `tags_tag_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_tag_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-15 21:16:46
