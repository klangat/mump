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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_emailactivation`
--

DROP TABLE IF EXISTS `accounts_emailactivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_emailactivation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `key` varchar(120) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL,
  `forced_expired` tinyint(1) NOT NULL,
  `expires` int(11) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `update` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_emailactivation_user_id_c8c6527b_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `accounts_emailactivation_user_id_c8c6527b_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_emailactivation`
--

LOCK TABLES `accounts_emailactivation` WRITE;
/*!40000 ALTER TABLE `accounts_emailactivation` DISABLE KEYS */;
INSERT INTO `accounts_emailactivation` VALUES (1,'jobmakori94@gmail.com','CiF7OgrZ14cKcoaRz8eJYaTbOW9q6EYdkxesg4aUv',1,0,7,'2019-03-30 07:20:54.223338','2019-03-30 08:45:12.767627',1),(2,'ame@gmail.com','A4gPuIB19A7Rc0Mrcekt358n4kkJekqV4j',1,0,7,'2019-03-30 07:25:37.402661','2019-03-30 07:26:14.985693',2),(3,'abc1234@gmail.com','OFneTNV3gqj97Htlrr0CdFr0lTOzMA6',0,0,7,'2019-04-01 15:25:48.661742','2019-04-01 15:25:48.661920',3),(4,'job@gmail.com','VhbPE7YPtVn9zwKpY4RDy3U7dvpsV37ohUG1kNN6KMNDd',0,0,7,'2019-04-01 15:28:48.779771','2019-04-01 15:28:48.779897',4),(5,'gf@gmai.com','SgT3PlusrtHk3KtH01UuU3ywt41cBDgmcDd0sN8',0,0,7,'2019-04-01 15:29:58.405397','2019-04-01 15:29:58.405518',5);
/*!40000 ALTER TABLE `accounts_emailactivation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_guestemail`
--

DROP TABLE IF EXISTS `accounts_guestemail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_guestemail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `update` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_guestemail`
--

LOCK TABLES `accounts_guestemail` WRITE;
/*!40000 ALTER TABLE `accounts_guestemail` DISABLE KEYS */;
INSERT INTO `accounts_guestemail` VALUES (1,'jobmakori94@gmail.com',1,'2019-03-23 14:06:57.196354','2019-03-23 14:06:57.196493'),(2,'zacharyonyamo96@gmail.com',1,'2019-03-27 17:57:49.788674','2019-03-27 17:57:49.788813'),(3,'jobmakori94@gmail.com',1,'2019-03-30 11:07:58.934760','2019-03-30 11:07:58.934883'),(4,'jobmakori94@gmail.com',1,'2019-03-31 09:43:28.499209','2019-03-31 09:43:28.499351'),(5,'jobmakori94@gmail.com',1,'2019-04-01 17:22:39.531656','2019-04-01 17:22:39.531789');
/*!40000 ALTER TABLE `accounts_guestemail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `staff` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'pbkdf2_sha256$120000$Piede3YKj13G$fAlMlh4Jd+OEFRhta3dZD7mYm/2q8Dfq5LSgKWhlwzk=','2019-04-02 00:25:09.418111','jobmakori94@gmail.com','',1,1,1,'2019-03-30 07:20:54.037130'),(2,'pbkdf2_sha256$120000$0it2kyk9ygXR$mtd+J18kj840Pf5CQWWwEg2VxswSf0ptJ5LpuVO/F8s=','2019-03-30 07:26:47.484753','ame@gmail.com','',1,1,1,'2019-03-30 07:25:37.014824'),(3,'pbkdf2_sha256$120000$CamzUlxDJiYj$PZ2gOqyI1xlVUuSZc7vPtW2t1ZPW/bjRd7DQilshZRg=',NULL,'abc1234@gmail.com','',1,1,1,'2019-04-01 15:25:48.536885'),(4,'pbkdf2_sha256$120000$li8GmXU2TnAY$xfbvLcffABppkPcvwfnNp/Rierui+s6eD1xpZCLJohM=',NULL,'job@gmail.com','',1,1,1,'2019-04-01 15:28:48.652088'),(5,'pbkdf2_sha256$120000$HDgOsqWIyjId$6HOKCJTRUPQv92lpXB/Y/grgEqwbptRUgTNAWmmvKo0=',NULL,'gf@gmai.com','',1,1,1,'2019-04-01 15:29:58.282874');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytics_objectviewed`
--

LOCK TABLES `analytics_objectviewed` WRITE;
/*!40000 ALTER TABLE `analytics_objectviewed` DISABLE KEYS */;
INSERT INTO `analytics_objectviewed` VALUES (1,'127.0.0.1',4,'2019-03-15 20:07:52.424523',27,1),(2,'127.0.0.1',1,'2019-03-15 20:11:58.346066',27,1),(3,'127.0.0.1',1,'2019-03-15 20:11:58.511429',27,1),(4,'127.0.0.1',1,'2019-03-15 20:12:59.940767',27,1),(5,'127.0.0.1',2,'2019-03-15 20:14:08.510402',27,1),(6,'127.0.0.1',6,'2019-03-15 20:16:29.062289',27,1),(7,'127.0.0.1',8,'2019-03-15 20:20:32.440461',27,1),(8,'127.0.0.1',11,'2019-03-15 20:22:52.391437',27,1),(9,'127.0.0.1',11,'2019-03-15 20:22:52.543381',27,1),(10,'127.0.0.1',11,'2019-03-15 20:27:59.035234',27,1),(11,'127.0.0.1',17,'2019-03-15 20:30:33.760546',27,1),(12,'127.0.0.1',34,'2019-03-15 20:50:13.922181',27,1),(13,'127.0.0.1',33,'2019-03-15 20:50:26.891811',27,1),(14,'127.0.0.1',19,'2019-03-15 21:03:15.828265',27,1),(15,'127.0.0.1',21,'2019-03-15 21:03:24.097185',27,1),(16,'127.0.0.1',34,'2019-03-23 14:06:38.339599',27,NULL),(17,'127.0.0.1',34,'2019-03-24 05:13:45.704847',27,NULL),(18,'127.0.0.1',34,'2019-03-24 05:29:32.516372',27,NULL),(19,'127.0.0.1',33,'2019-03-27 17:47:37.917226',27,NULL),(20,'127.0.0.1',33,'2019-03-27 17:55:55.140630',27,NULL),(21,'127.0.0.1',34,'2019-03-30 08:36:13.374400',27,2),(22,'127.0.0.1',33,'2019-03-30 08:43:32.712115',27,2),(23,'127.0.0.1',32,'2019-03-30 09:42:07.707258',27,1),(24,'127.0.0.1',32,'2019-03-30 10:07:39.242705',27,1),(25,'127.0.0.1',32,'2019-03-30 10:17:01.419732',27,1),(26,'127.0.0.1',34,'2019-03-30 10:17:13.791399',27,1),(27,'127.0.0.1',33,'2019-03-30 10:48:09.053152',27,NULL),(28,'127.0.0.1',33,'2019-03-30 10:48:52.219412',27,NULL),(29,'127.0.0.1',34,'2019-03-30 11:06:49.122587',27,NULL),(30,'127.0.0.1',34,'2019-03-30 11:09:39.732403',27,NULL),(31,'127.0.0.1',34,'2019-03-30 11:28:01.763925',27,NULL),(32,'127.0.0.1',34,'2019-03-30 11:49:27.375197',27,NULL),(33,'127.0.0.1',34,'2019-04-01 13:32:52.445396',27,NULL);
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

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add site',4,'add_site'),(14,'Can change site',4,'change_site'),(15,'Can delete site',4,'delete_site'),(16,'Can view site',4,'view_site'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add email address',7,'add_emailaddress'),(26,'Can change email address',7,'change_emailaddress'),(27,'Can delete email address',7,'delete_emailaddress'),(28,'Can view email address',7,'view_emailaddress'),(29,'Can add email confirmation',8,'add_emailconfirmation'),(30,'Can change email confirmation',8,'change_emailconfirmation'),(31,'Can delete email confirmation',8,'delete_emailconfirmation'),(32,'Can view email confirmation',8,'view_emailconfirmation'),(33,'Can add social account',9,'add_socialaccount'),(34,'Can change social account',9,'change_socialaccount'),(35,'Can delete social account',9,'delete_socialaccount'),(36,'Can view social account',9,'view_socialaccount'),(37,'Can add social application',10,'add_socialapp'),(38,'Can change social application',10,'change_socialapp'),(39,'Can delete social application',10,'delete_socialapp'),(40,'Can view social application',10,'view_socialapp'),(41,'Can add social application token',11,'add_socialtoken'),(42,'Can change social application token',11,'change_socialtoken'),(43,'Can delete social application token',11,'delete_socialtoken'),(44,'Can view social application token',11,'view_socialtoken'),(45,'Can add PayPal IPN',12,'add_paypalipn'),(46,'Can change PayPal IPN',12,'change_paypalipn'),(47,'Can delete PayPal IPN',12,'delete_paypalipn'),(48,'Can view PayPal IPN',12,'view_paypalipn'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add email activation',14,'add_emailactivation'),(54,'Can change email activation',14,'change_emailactivation'),(55,'Can delete email activation',14,'delete_emailactivation'),(56,'Can view email activation',14,'view_emailactivation'),(57,'Can add guest email',15,'add_guestemail'),(58,'Can change guest email',15,'change_guestemail'),(59,'Can delete guest email',15,'delete_guestemail'),(60,'Can view guest email',15,'view_guestemail'),(61,'Can add address',16,'add_address'),(62,'Can change address',16,'change_address'),(63,'Can delete address',16,'delete_address'),(64,'Can view address',16,'view_address'),(65,'Can add Object viewed',17,'add_objectviewed'),(66,'Can change Object viewed',17,'change_objectviewed'),(67,'Can delete Object viewed',17,'delete_objectviewed'),(68,'Can view Object viewed',17,'view_objectviewed'),(69,'Can add user session',18,'add_usersession'),(70,'Can change user session',18,'change_usersession'),(71,'Can delete user session',18,'delete_usersession'),(72,'Can view user session',18,'view_usersession'),(73,'Can add billing profile',19,'add_billingprofile'),(74,'Can change billing profile',19,'change_billingprofile'),(75,'Can delete billing profile',19,'delete_billingprofile'),(76,'Can view billing profile',19,'view_billingprofile'),(77,'Can add card',20,'add_card'),(78,'Can change card',20,'change_card'),(79,'Can delete card',20,'delete_card'),(80,'Can view card',20,'view_card'),(81,'Can add charge',21,'add_charge'),(82,'Can change charge',21,'change_charge'),(83,'Can delete charge',21,'delete_charge'),(84,'Can view charge',21,'view_charge'),(85,'Can add cart',22,'add_cart'),(86,'Can change cart',22,'change_cart'),(87,'Can delete cart',22,'delete_cart'),(88,'Can view cart',22,'view_cart'),(89,'Can add marketing preference',23,'add_marketingpreference'),(90,'Can change marketing preference',23,'change_marketingpreference'),(91,'Can delete marketing preference',23,'delete_marketingpreference'),(92,'Can view marketing preference',23,'view_marketingpreference'),(93,'Can add order',24,'add_order'),(94,'Can change order',24,'change_order'),(95,'Can delete order',24,'delete_order'),(96,'Can view order',24,'view_order'),(97,'Can add product purchase',25,'add_productpurchase'),(98,'Can change product purchase',25,'change_productpurchase'),(99,'Can delete product purchase',25,'delete_productpurchase'),(100,'Can view product purchase',25,'view_productpurchase'),(101,'Can add category',26,'add_category'),(102,'Can change category',26,'change_category'),(103,'Can delete category',26,'delete_category'),(104,'Can view category',26,'view_category'),(105,'Can add product',27,'add_product'),(106,'Can change product',27,'change_product'),(107,'Can delete product',27,'delete_product'),(108,'Can view product',27,'view_product'),(109,'Can add tag',28,'add_tag'),(110,'Can change tag',28,'change_tag'),(111,'Can delete tag',28,'delete_tag'),(112,'Can view tag',28,'view_tag');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_billingprofile`
--

LOCK TABLES `billing_billingprofile` WRITE;
/*!40000 ALTER TABLE `billing_billingprofile` DISABLE KEYS */;
INSERT INTO `billing_billingprofile` VALUES (1,'gf@gmai.com',1,'2019-04-01 15:30:00.206003','2019-04-01 15:30:00.206207','cus_Eo1JBXVZIeZbhN',5),(2,'jobmakori94@gmail.com',1,'2019-04-01 17:15:39.497229','2019-04-01 17:15:39.506944','cus_Eo31uNEa5sk5a0',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cart`
--

LOCK TABLES `carts_cart` WRITE;
/*!40000 ALTER TABLE `carts_cart` DISABLE KEYS */;
INSERT INTO `carts_cart` VALUES (1,0.00,0.00,'2019-03-15 19:46:10.332464','2019-03-15 19:46:10.332589',NULL),(2,0.00,0.00,'2019-03-15 20:03:18.753763','2019-03-15 20:03:18.753883',1),(3,2500.00,2700.00,'2019-03-15 20:50:23.716072','2019-03-15 20:06:23.080619',1),(4,0.00,0.00,'2019-03-23 09:28:13.617351','2019-03-23 09:28:13.617489',NULL),(5,50.00,54.00,'2019-03-23 14:06:41.985565','2019-03-23 14:06:38.462595',NULL),(6,0.00,0.00,'2019-03-23 14:41:49.633893','2019-03-23 14:41:49.634020',NULL),(7,0.00,0.00,'2019-03-24 05:08:24.900995','2019-03-24 05:08:24.901137',NULL),(8,0.00,0.00,'2019-03-24 05:13:45.719395','2019-03-24 05:13:45.719529',NULL),(9,0.00,0.00,'2019-03-24 05:21:51.230581','2019-03-24 05:21:51.230755',NULL),(10,230.00,248.40,'2019-03-27 17:57:30.192476','2019-03-27 17:46:40.907822',NULL),(11,280.00,302.40,'2019-03-30 08:43:30.118101','2019-03-30 07:28:56.601855',2),(12,0.00,0.00,'2019-03-30 09:32:11.380444','2019-03-30 09:32:11.380601',NULL),(13,0.00,0.00,'2019-03-30 09:34:02.209711','2019-03-30 09:34:02.209839',NULL),(14,280.00,302.40,'2019-03-30 10:32:36.094342','2019-03-30 09:36:36.258511',1),(16,50.00,54.00,'2019-03-30 11:08:23.273034','2019-03-30 10:43:34.628346',NULL),(17,12280.00,13262.40,'2019-03-30 12:06:07.943233','2019-03-30 11:28:01.780400',NULL),(18,230.00,248.40,'2019-03-31 09:41:42.062944','2019-03-31 09:41:37.146633',NULL),(19,0.00,0.00,'2019-04-01 11:30:18.464907','2019-04-01 10:11:55.924895',1),(20,230.00,248.40,'2019-04-01 13:33:10.749513','2019-04-01 13:06:27.364357',NULL),(21,280.00,302.40,'2019-04-01 13:06:56.225623','2019-04-01 13:06:46.004675',NULL),(22,0.00,0.00,'2019-04-01 13:41:24.691636','2019-04-01 13:41:24.691897',NULL),(23,50.00,54.00,'2019-04-01 17:15:35.951020','2019-04-01 17:07:22.141318',1),(24,230.00,248.40,'2019-04-01 17:22:16.601520','2019-04-01 17:22:06.349988',NULL),(25,0.00,0.00,'2019-04-02 00:25:25.946383','2019-04-02 00:19:42.739514',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts_cart_products`
--

LOCK TABLES `carts_cart_products` WRITE;
/*!40000 ALTER TABLE `carts_cart_products` DISABLE KEYS */;
INSERT INTO `carts_cart_products` VALUES (1,3,1),(2,5,34),(73,10,33),(75,11,33),(74,11,34),(79,14,33),(77,14,34),(89,16,34),(96,17,7),(98,17,33),(97,17,34),(99,18,33),(103,20,33),(102,21,33),(101,21,34),(104,23,34),(105,24,33);
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-03-30 08:45:12.771201','1','jobmakori94@gmail.com',2,'[{\"changed\": {\"fields\": [\"activated\"]}}]',14,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'account','emailaddress'),(8,'account','emailconfirmation'),(14,'accounts','emailactivation'),(15,'accounts','guestemail'),(13,'accounts','user'),(16,'addresses','address'),(1,'admin','logentry'),(17,'analytics','objectviewed'),(18,'analytics','usersession'),(3,'auth','group'),(2,'auth','permission'),(19,'billing','billingprofile'),(20,'billing','card'),(21,'billing','charge'),(22,'carts','cart'),(5,'contenttypes','contenttype'),(12,'ipn','paypalipn'),(23,'marketing','marketingpreference'),(24,'orders','order'),(25,'orders','productpurchase'),(26,'products','category'),(27,'products','product'),(6,'sessions','session'),(4,'sites','site'),(9,'socialaccount','socialaccount'),(10,'socialaccount','socialapp'),(11,'socialaccount','socialtoken'),(28,'tags','tag');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2019-03-23 08:02:55.960154'),(2,'account','0001_initial','2019-03-23 08:03:00.433660'),(3,'account','0002_email_max_length','2019-03-23 08:03:00.824914'),(4,'accounts','0002_auto_20190318_1836','2019-03-23 08:03:02.533328'),(5,'billing','0001_initial','2019-03-23 08:03:07.952658'),(6,'addresses','0001_initial','2019-03-23 08:03:09.881067'),(7,'addresses','0002_auto_20190320_1009','2019-03-23 08:03:17.154140'),(8,'contenttypes','0001_initial','2019-03-23 08:03:20.152505'),(9,'admin','0001_initial','2019-03-23 08:03:24.582424'),(10,'admin','0002_logentry_remove_auto_add','2019-03-23 08:03:24.751393'),(11,'admin','0003_logentry_add_action_flag_choices','2019-03-23 08:03:24.955982'),(12,'contenttypes','0002_remove_content_type_name','2019-03-23 08:03:47.453210'),(13,'analytics','0001_initial','2019-03-23 08:04:13.703236'),(14,'auth','0001_initial','2019-03-23 08:04:26.439407'),(15,'auth','0002_alter_permission_name_max_length','2019-03-23 08:04:26.979796'),(16,'auth','0003_alter_user_email_max_length','2019-03-23 08:04:27.092428'),(17,'auth','0004_alter_user_username_opts','2019-03-23 08:04:27.189969'),(18,'auth','0005_alter_user_last_login_null','2019-03-23 08:04:27.278722'),(19,'auth','0006_require_contenttypes_0002','2019-03-23 08:04:27.346820'),(20,'auth','0007_alter_validators_add_error_messages','2019-03-23 08:04:27.457375'),(21,'auth','0008_alter_user_username_max_length','2019-03-23 08:04:27.556679'),(22,'auth','0009_alter_user_last_name_max_length','2019-03-23 08:04:27.690838'),(23,'products','0001_initial','2019-03-23 08:04:31.633884'),(24,'carts','0001_initial','2019-03-23 08:04:40.895673'),(25,'ipn','0001_initial','2019-03-23 08:04:42.857676'),(26,'ipn','0002_paypalipn_mp_id','2019-03-23 08:04:44.329257'),(27,'ipn','0003_auto_20141117_1647','2019-03-23 08:04:50.682586'),(28,'ipn','0004_auto_20150612_1826','2019-03-23 08:04:56.019176'),(29,'ipn','0005_auto_20151217_0948','2019-03-23 08:04:58.551174'),(30,'ipn','0006_auto_20160108_1112','2019-03-23 08:05:02.800862'),(31,'ipn','0007_auto_20160219_1135','2019-03-23 08:05:03.264961'),(32,'ipn','0008_auto_20190227_1234','2019-03-23 08:05:03.615701'),(33,'marketing','0001_initial','2019-03-23 08:05:10.287833'),(34,'orders','0001_initial','2019-03-23 08:05:31.062514'),(35,'sessions','0001_initial','2019-03-23 08:05:32.077918'),(36,'sites','0001_initial','2019-03-23 08:05:33.100093'),(37,'sites','0002_alter_domain_unique','2019-03-23 08:05:33.984983'),(38,'socialaccount','0001_initial','2019-03-23 08:05:48.508537'),(39,'socialaccount','0002_token_max_lengths','2019-03-23 08:05:49.289610'),(40,'socialaccount','0003_extra_data_default_dict','2019-03-23 08:05:49.379149'),(41,'tags','0001_initial','2019-03-23 08:05:57.321977'),(42,'addresses','0003_remove_address_nickname','2019-04-02 00:34:56.182495');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1vnh17l9aqduxxrp613o0gm8x7fwa5q0','YWMzZmQwMjAzYTFiZmM0ZGUyZDM5ZTU2MjdmNzg2ZjY3YzlmNzlmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhMzkxNDdmN2Y4NGRjN2RmMGIxOTc1YTFlMzA5MzM5NmFhOWExZDgzIiwiY2FydF9pZCI6MTQsImNhcnRfaXRlbXMiOjJ9','2019-04-13 10:32:36.251143'),('3vl7kui9i10efkme1abt557kpofmr2n0','ZTJiOWRkYWUxNzBkMmQ3MzMwZjc1MDMzNmU4OWZmMjA4NWVjZjYxYjp7ImNhcnRfaWQiOjI1LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTM5MTQ3ZjdmODRkYzdkZjBiMTk3NWExZTMwOTMzOTZhYTlhMWQ4MyJ9','2019-04-16 00:25:09.613217'),('5vp5osmed2mopjtcunxhlwyqhu9ast4f','YzQ2MmM1OGQxYmI4MGFlZmNlZmZkZjI4NTM1ODMxMTE0OWNjOWYzNDp7ImNhcnRfaWQiOjIwLCJjYXJ0X2l0ZW1zIjoxLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTM5MTQ3ZjdmODRkYzdkZjBiMTk3NWExZTMwOTMzOTZhYTlhMWQ4MyJ9','2019-04-15 14:40:57.320680'),('8o4z5la5oelg6bvvdv1mq7ct2og0ugci','ZDc3ZTQ1YzRkNGNkMTQzNzA2NWNiMGQ3MGFhZDA2ZDU0YjBiYTRhODp7ImNhcnRfaWQiOjEyfQ==','2019-04-13 09:32:11.525853'),('8wxrxhpk6to8z9fdhho82nqyn9001z55','MDlkMDA5ZTNlYWU3ZDE0N2U0Y2VhZWYxNDFmZDFjNDdjMmE0Y2YzMDp7ImNhcnRfaWQiOjIxLCJjYXJ0X2l0ZW1zIjoyfQ==','2019-04-15 13:06:56.302731'),('9ekq96t883dc62a4jngvr8qftvmtmwmg','MTY3YzIyMTc1NTNmNzEyMTAzODBkMzhiYmUwOTVkM2M5OTE4ZjA5OTp7ImNhcnRfaWQiOjl9','2019-04-07 05:21:51.563273'),('azkrslv6fa9x3rtr1dme5oupd8xkjquf','ZTI4MzQ2OWI2YTNkZGYzNTdjNzA3NDM5NjkxNjgxYzUxYWJkMGYyZDp7ImNhcnRfaWQiOjE4LCJjYXJ0X2l0ZW1zIjoxLCJndWVzdF9lbWFpbF9pZCI6NH0=','2019-04-14 09:43:28.826599'),('b4oz9i4teit1eycrhfkttldy1es0qbip','ZjdhMTk3ZTE0OTg1NjVlOTFhZmUzZDYyNGU5MjcyMzU5MDYyNjFiMjp7ImNhcnRfaWQiOjEwLCJjYXJ0X2l0ZW1zIjoxLCJndWVzdF9lbWFpbF9pZCI6Mn0=','2019-04-10 17:57:50.188264'),('cl5rx68iteqkh5e4l268i026qml3os4z','OGQ2NjM5OTc1NTdjNjJlNDViMWE5MWRlODFkNjI3OWYxZjNkNjUyNzp7ImNhcnRfaWQiOjE3LCJjYXJ0X2l0ZW1zIjozfQ==','2019-04-13 12:06:08.103739'),('f00l3jwikb8i9uqfvlfn187bhvapmctj','ODViYmU4MzMzYWJiZTBkMWIxNDU1MmUxZGFmZjg0NzlmODBjMmE5ZDp7ImNhcnRfaWQiOjE2LCJjYXJ0X2l0ZW1zIjoxLCJndWVzdF9lbWFpbF9pZCI6M30=','2019-04-13 11:08:23.338688'),('hgwqqgymfysge9ay9bf8d0fcykdc31mb','MDc1NDVmYmFkOWIyYzA4NGQ3MjA1NDEwMTIyMmY2Y2ZjMDljZDRiYzp7ImNhcnRfaWQiOjE5LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYTM5MTQ3ZjdmODRkYzdkZjBiMTk3NWExZTMwOTMzOTZhYTlhMWQ4MyJ9','2019-04-15 10:45:14.707446'),('lp939qtz4vrnc3zqrcaizuwyjs93yjeh','YWVmNWUzYjg0YWVhMjAyMTFlOTIyZDZkM2ZkMjI0NzY3NDNmYWQ1Njp7ImNhcnRfaWQiOjEzfQ==','2019-04-13 09:34:02.505699'),('ok2qxg4i5764d0d88o63fqbz4j10gne4','MzIzMTMxMjdlOTA0MjhlYzg4OTYyOThiNjM2MzgzYjNjZmVmNmRiOTp7ImNhcnRfaWQiOjI0LCJjYXJ0X2l0ZW1zIjoxLCJndWVzdF9lbWFpbF9pZCI6NX0=','2019-04-15 17:22:39.670428'),('poz7f31gh4ir7hezhymx0j1s2awynw1n','OTIzM2MyYjM1MDZiOTg5ZmIwMjdiYjVhODE2MTUwMzJkOGFiODBlYzp7ImNhcnRfaWQiOjh9','2019-04-07 05:13:46.032996'),('sj6oov50i696h9ecr157gsj6nvo4wffm','ZjM4OTEyMTliNzVlYmJlZjFmNTYwZThjZGY3ZDNhMWQ0MTFmYzU0Mjp7ImNhcnRfaWQiOjZ9','2019-04-06 14:41:49.713202'),('tglt0tgsmkqttnnsfxf766ubqxf0qvzi','MjRhNDJmMTM0MDlkNzhlNWRkNzU3YmY2YTBiOGRjMDM4MWFkNjZjMjp7ImNhcnRfaWQiOjd9','2019-04-07 05:08:25.383302'),('u7k7gu7d5jk29jb06ne67kvcwnj84j92','Y2Y5YWMxNjY3NWJlMmRkY2M1Y2U2NDVlMTlmY2EwOTBlMWRkZWE1YTp7ImNhcnRfaWQiOjUsImNhcnRfaXRlbXMiOjEsImd1ZXN0X2VtYWlsX2lkIjoxfQ==','2019-04-06 14:06:57.622866'),('udilftvgvplpcnvwfole02jsw3mi381y','ZTBjNGI5MGE0ODk4NDdlYjU0NTg1YmRiMTAxN2MzODVmNGJlNDQ2MDp7ImNhcnRfaWQiOjR9','2019-04-06 09:28:13.854924'),('v1llulri10ecpjffg4b0ingk2lz45hak','ZTQ1YjYxOTcxNGFmODJlMzQzYzAxMmVlN2ViYjBiNzYwY2Q1ZDM1ZTp7ImNhcnRfaWQiOjIyfQ==','2019-04-15 13:41:24.921179'),('zc8sjqkqbcb6hppsnge6bvxic6j6sq8o','OGIzYTNiM2U5ODM2YjBjZDc3OGU2MDM5M2QzYjAxYTYyYWQ1MTE5Mjp7ImNhcnRfaWQiOjF9','2019-04-06 08:06:22.219354');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketing_marketingpreference`
--

DROP TABLE IF EXISTS `marketing_marketingpreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketing_marketingpreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscribed` tinyint(1) NOT NULL,
  `mailchimp_subscribed` tinyint(1) DEFAULT NULL,
  `mailchimp_msg` longtext,
  `timestamp` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `marketing_marketingp_user_id_b28021e1_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketing_marketingpreference`
--

LOCK TABLES `marketing_marketingpreference` WRITE;
/*!40000 ALTER TABLE `marketing_marketingpreference` DISABLE KEYS */;
INSERT INTO `marketing_marketingpreference` VALUES (1,0,0,'{\'type\': \'http://developer.mailchimp.com/documentation/mailchimp/guides/error-glossary/\', \'title\': \'API Key Invalid\', \'status\': 401, \'detail\': \'API key has been disabled\', \'instance\': \'89b9b0d0-1316-492e-9e01-84dca4d89f58\'}','2019-04-01 15:30:01.490402','2019-04-01 15:30:01.490555',5);
/*!40000 ALTER TABLE `marketing_marketingpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(120) NOT NULL,
  `shipping_address_final` longtext,
  `billing_address_final` longtext,
  `status` varchar(120) NOT NULL,
  `shipping_total` decimal(50,2) NOT NULL,
  `total` decimal(50,2) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `billing_address_id` int(11) DEFAULT NULL,
  `billing_profile_id` int(11) DEFAULT NULL,
  `cart_id` int(11) NOT NULL,
  `shipping_address_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_billing_address_id_deb02e83_fk_addresses_address_id` (`billing_address_id`),
  KEY `orders_order_billing_profile_id_0e11b610_fk_billing_b` (`billing_profile_id`),
  KEY `orders_order_cart_id_7e0252e3_fk_carts_cart_id` (`cart_id`),
  KEY `orders_order_shipping_address_id_c4f8227a_fk_addresses` (`shipping_address_id`),
  CONSTRAINT `orders_order_billing_address_id_deb02e83_fk_addresses_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses_address` (`id`),
  CONSTRAINT `orders_order_billing_profile_id_0e11b610_fk_billing_b` FOREIGN KEY (`billing_profile_id`) REFERENCES `billing_billingprofile` (`id`),
  CONSTRAINT `orders_order_cart_id_7e0252e3_fk_carts_cart_id` FOREIGN KEY (`cart_id`) REFERENCES `carts_cart` (`id`),
  CONSTRAINT `orders_order_shipping_address_id_c4f8227a_fk_addresses` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (1,'Y6A7glSoKgOtS6KCmO7WtdUWSDqO0vfDeDLwWFhIx9QKJMAzlU',NULL,NULL,'created',5.99,59.99,1,'2019-04-01 17:15:39.639616','2019-04-01 17:15:39.596584',NULL,2,23,NULL),(2,'rRHXwdrEWB5YoxYTsjCfJssfmGaxLrj3qd5ZFs16sNRfWBsm1y',NULL,NULL,'created',5.99,254.39,1,'2019-04-01 17:22:40.463503','2019-04-01 17:22:40.431542',NULL,2,24,NULL);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_productpurchase`
--

DROP TABLE IF EXISTS `orders_productpurchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_productpurchase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(120) NOT NULL,
  `refunded` tinyint(1) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `billing_profile_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_productpurcha_billing_profile_id_4c08eaae_fk_billing_b` (`billing_profile_id`),
  KEY `orders_productpurcha_product_id_d0f20172_fk_products_` (`product_id`),
  CONSTRAINT `orders_productpurcha_billing_profile_id_4c08eaae_fk_billing_b` FOREIGN KEY (`billing_profile_id`) REFERENCES `billing_billingprofile` (`id`),
  CONSTRAINT `orders_productpurcha_product_id_d0f20172_fk_products_` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_productpurchase`
--

LOCK TABLES `orders_productpurchase` WRITE;
/*!40000 ALTER TABLE `orders_productpurchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_productpurchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(255) NOT NULL,
  `custom` varchar(256) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(254) NOT NULL,
  `receiver_id` varchar(255) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txn_type` varchar(255) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(255) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(255) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `pending_reason` varchar(255) NOT NULL,
  `protection_eligibility` varchar(255) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(255) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(255) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime(6) DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime(6) DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(255) NOT NULL,
  `period_type` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(255) NOT NULL,
  `profile_status` varchar(255) NOT NULL,
  `recurring_payment_id` varchar(255) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime(6) DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(255) NOT NULL,
  `period2` varchar(255) NOT NULL,
  `period3` varchar(255) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime(6) DEFAULT NULL,
  `subscr_date` datetime(6) DEFAULT NULL,
  `subscr_effective` datetime(6) DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime(6) DEFAULT NULL,
  `case_id` varchar(255) NOT NULL,
  `case_type` varchar(255) NOT NULL,
  `receipt_id` varchar(255) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(256) NOT NULL,
  `ipaddress` char(39) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `mp_id` varchar(128) DEFAULT NULL,
  `option_selection1` varchar(200) NOT NULL,
  `option_selection2` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_txn_id_8fa22c44` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
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
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
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

-- Dump completed on 2019-04-02  0:47:28
