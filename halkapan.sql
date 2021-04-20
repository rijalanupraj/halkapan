-- MySQL dump 10.13  Distrib 8.0.23, for osx10.16 (x86_64)
--
-- Host: localhost    Database: halkapan
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `date_joined` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (2,'pbkdf2_sha256$216000$g9qQDFJqM0m7$irkyErI/HZtg16kdMfK2oczHjUdp+GM7LJeKws0C9qY=','2021-04-20 09:52:56.701292','lacotiw169@zevars.com','ranjit',1,0,0,0,'2021-04-19 17:01:15.926665'),(3,'pbkdf2_sha256$216000$jC4wmhnzdMmQ$5RgVxxAvM9tOOgBQM05Ne0Ny6BfhwxWWyQOYMiSw/cM=','2021-04-20 14:52:10.047878','taram18004@zcai66.com','rijalanupraj',1,0,0,0,'2021-04-19 19:08:38.726627'),(4,'pbkdf2_sha256$216000$PGU9VTXfpETC$JpxKjxm5b1e7kDCIU+bTaGxO4Hro7VMg6GwcAFP6zT4=',NULL,'samir@gmail.com','samir',1,0,0,0,'2021-04-19 19:22:27.139919'),(5,'pbkdf2_sha256$216000$uYW9Xqk4atNT$RtXB0+EBJbnKy7W5AcEhrDm8UPMoxuY7nKDjo35+Ux8=',NULL,'gaurav@gmail.com','gaurav',1,0,0,0,'2021-04-19 19:24:00.414636'),(6,'pbkdf2_sha256$216000$bKIyOtRWm4hW$cG8wjF5YSHadtULQew9klhk4qbcbWZtYu272e3kJrcE=',NULL,'shikhar@gmail.com','shikhar',1,0,0,0,'2021-04-19 19:24:21.438042'),(7,'pbkdf2_sha256$216000$YJSXYw7PSn6d$o/uYUApUNnlz3rRHaBP7beHLzCbdlmDEQ8Pxwo2aM0Q=',NULL,'pradip@gmail.com','pradip',1,0,0,0,'2021-04-19 19:24:46.466842'),(8,'pbkdf2_sha256$216000$MPD4vuPjyJCI$W2SbU/DHZws9EGmCXsTCEOQ8TaOiy+1/2/+iWXxkGOs=',NULL,'nishan@gmail.com','nishan',1,0,0,0,'2021-04-19 19:25:06.996694'),(9,'pbkdf2_sha256$216000$rZ6SHxDeoMqc$7QPv61Z/545ZwnV5TIMmWb23wlooQOw3mE1OD4jY1yQ=',NULL,'prabesh@gmail.com','prabesh',1,0,0,0,'2021-04-19 19:25:30.603606'),(10,'pbkdf2_sha256$216000$wDKZQwzDUa9b$gu9vQABNJveXktQd0ZoSKaiXubDypyKIAzxJ4W6k9XU=','2021-04-20 05:39:28.522873','suresha@gmail.com','suresha',1,0,0,0,'2021-04-19 19:26:00.962268'),(11,'pbkdf2_sha256$216000$VpDfXRyh8ZxE$q3l6SVD/qk4OMTmMHVLLXvNYWh+MMCfs8bRWvPXaBFo=',NULL,'aakash@gmail.ccom','aakash',1,0,0,0,'2021-04-19 19:26:15.523589'),(12,'pbkdf2_sha256$216000$Rz1wcNODztEg$sGQZOf435r2Q9Yz6gZf34/ATO28ubacXeWIVsXU4hPQ=',NULL,'anuragh@gmail.com','anuragh',1,0,0,0,'2021-04-19 19:26:47.905245'),(13,'pbkdf2_sha256$216000$hdn3dVVyxsdB$iaH+wEsvrcjqmHwN/KhNYxa3QnD4VT1Tl5CxSPJP8Iw=',NULL,'shrishak@gmail.com','shrishak',1,0,0,0,'2021-04-19 19:27:12.910634'),(14,'pbkdf2_sha256$216000$qfjgWXs1798l$Z88jAhrkEXvnUFCFZrCCGyiFUfO7wZWF1xb30HrZfyU=',NULL,'anuj@gmail.com','anuj',1,0,0,0,'2021-04-19 19:27:41.022110'),(15,'pbkdf2_sha256$216000$5mEeJcqu3Tgw$+e1QVTCYnUDd902uK10G0BMLT7qRKZULbuFRT6WKDzE=',NULL,'anil@gmail.com','anil',1,0,0,0,'2021-04-19 19:27:57.936300'),(16,'pbkdf2_sha256$216000$Sb3likM5Oc0o$p01qmxIr4T9P5+Bjrx5r3M4DvLypvkHk5DEHOStoCr0=','2021-04-20 05:36:58.156118','chameli@gmail.com','chameli',1,0,0,0,'2021-04-19 19:28:16.138339'),(17,'pbkdf2_sha256$216000$DcscqfZvANU2$CBMwO6JzN+io8P6bI3QUbGsl66TsSqwUW19ghPXmrcg=',NULL,'bhawana@gmail.com','bhawana',1,0,0,0,'2021-04-19 19:28:38.810144'),(19,'pbkdf2_sha256$216000$WtP2bBmozvnV$SzPG4IMYkDBWKiw5160uwJO17BaLj3XnKhtOEjQPUIk=',NULL,'preeti@gmail.com','preeti',1,0,0,0,'2021-04-19 19:29:55.089972'),(20,'pbkdf2_sha256$216000$E7emMbdq39xp$/CnsW0YD8Kx6UBsaWfSMdCG7sUsUsyqPfeADHE5t3Og=',NULL,'radha@yahoo.com','radha',1,0,0,0,'2021-04-19 19:30:17.628905'),(25,'pbkdf2_sha256$216000$kRL6Wpk9GPml$B6nF/N//Y8eL7bSgAqkx+dEZAaX1BFvuaqQjr782Qmw=','2021-04-20 04:52:50.046070','jadotoh507@zcai66.com','jadotoh507',1,0,0,0,'2021-04-20 04:52:13.067823'),(26,'pbkdf2_sha256$216000$lWFXEkEJTEGs$4bPWSZ5XrT1hE9rpHhAKEW0CzUPrJ3vb/cQOmR51b1g=','2021-04-20 14:54:00.604224','admin@admin.com','admin',1,1,1,1,'2021-04-20 05:00:06.242328'),(31,'pbkdf2_sha256$216000$WIHoLmcUu1BG$jfARmNSlZlDcK69nvIyZaEmg5SZW5f+XKyHAgpkY2qw=','2021-04-20 14:30:20.348736','bamate4302@zcai66.com','haribahadur',1,1,0,0,'2021-04-20 14:29:37.755703'),(32,'pbkdf2_sha256$216000$joMAkghKCtVW$NzetjChMrl39bABpaR19dcwEeN3tVybZ6WWQ1Tw6GhM=',NULL,'yesonik844@zcai66.com','hari',0,0,0,0,'2021-04-20 14:35:47.048363'),(33,'pbkdf2_sha256$216000$ecPfoqNLQhPO$Ak6fFtW38LvSSE39Bd81D6i/RPd7XRy7XdXmEbB5pF8=','2021-04-20 14:42:11.817113','xoxodas658@zcai77.com','sam',1,0,0,0,'2021-04-20 14:38:42.690333');
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_groups`
--

DROP TABLE IF EXISTS `accounts_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`),
  CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_groups`
--

LOCK TABLES `accounts_user_groups` WRITE;
/*!40000 ALTER TABLE `accounts_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_user_permissions`
--

DROP TABLE IF EXISTS `accounts_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`),
  CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_user_permissions`
--

LOCK TABLES `accounts_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `accounts_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add post',7,'add_post'),(26,'Can change post',7,'change_post'),(27,'Can delete post',7,'delete_post'),(28,'Can view post',7,'view_post'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add tag',9,'add_tag'),(34,'Can change tag',9,'change_tag'),(35,'Can delete tag',9,'delete_tag'),(36,'Can view tag',9,'view_tag'),(37,'Can add comment',10,'add_comment'),(38,'Can change comment',10,'change_comment'),(39,'Can delete comment',10,'delete_comment'),(40,'Can view comment',10,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_comment`
--

DROP TABLE IF EXISTS `comments_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `content_type_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_comment_content_type_id_72fd5dbe_fk_django_co` (`content_type_id`),
  KEY `comments_comment_parent_id_3e0802fb_fk_comments_comment_id` (`parent_id`),
  KEY `comments_comment_user_id_a1db4881_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `comments_comment_content_type_id_72fd5dbe_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comments_comment_parent_id_3e0802fb_fk_comments_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comments_comment` (`id`),
  CONSTRAINT `comments_comment_user_id_a1db4881_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `comments_comment_chk_1` CHECK ((`object_id` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_comment`
--

LOCK TABLES `comments_comment` WRITE;
/*!40000 ALTER TABLE `comments_comment` DISABLE KEYS */;
INSERT INTO `comments_comment` VALUES (1,16,'That was great. Keep Moving','2021-04-20 05:18:57.603352',7,NULL,2);
/*!40000 ALTER TABLE `comments_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(10,'comments','comment'),(4,'contenttypes','contenttype'),(7,'posts','post'),(5,'sessions','session'),(9,'tags','tag'),(8,'userprofile','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-04-19 16:29:13.228233'),(2,'contenttypes','0002_remove_content_type_name','2021-04-19 16:29:13.238678'),(3,'auth','0001_initial','2021-04-19 16:29:13.252914'),(4,'auth','0002_alter_permission_name_max_length','2021-04-19 16:29:13.284134'),(5,'auth','0003_alter_user_email_max_length','2021-04-19 16:29:13.286567'),(6,'auth','0004_alter_user_username_opts','2021-04-19 16:29:13.288802'),(7,'auth','0005_alter_user_last_login_null','2021-04-19 16:29:13.290903'),(8,'auth','0006_require_contenttypes_0002','2021-04-19 16:29:13.291604'),(9,'auth','0007_alter_validators_add_error_messages','2021-04-19 16:29:13.294568'),(10,'auth','0008_alter_user_username_max_length','2021-04-19 16:29:13.297542'),(11,'auth','0009_alter_user_last_name_max_length','2021-04-19 16:29:13.299668'),(12,'auth','0010_alter_group_name_max_length','2021-04-19 16:29:13.303652'),(13,'auth','0011_update_proxy_permissions','2021-04-19 16:29:13.305958'),(14,'auth','0012_alter_user_first_name_max_length','2021-04-19 16:29:13.308153'),(15,'accounts','0001_initial','2021-04-19 16:29:13.322738'),(16,'admin','0001_initial','2021-04-19 16:29:13.358893'),(17,'admin','0002_logentry_remove_auto_add','2021-04-19 16:29:13.376813'),(18,'admin','0003_logentry_add_action_flag_choices','2021-04-19 16:29:13.379980'),(19,'comments','0001_initial','2021-04-19 16:29:13.387141'),(20,'userprofile','0001_initial','2021-04-19 16:29:13.421822'),(21,'tags','0001_initial','2021-04-19 16:29:13.448922'),(22,'posts','0001_initial','2021-04-19 16:29:13.469119'),(23,'sessions','0001_initial','2021-04-19 16:29:13.505084'),(24,'posts','0002_auto_20210420_1031','2021-04-20 04:46:28.348173');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1lu5wsb9xox10ptuu3zaeysfnnirzcd2','.eJxVTbsOwiAU_RdmQyhwgbrp7uhMLg-l2kBS2jgY_11IOmhOcobzfBOL25rsVuNip0COhCty-BUd-mfM3QkPzPdCfcnrMjnaI3R3Kz3Nc3k1urZOvZQQ5_Ne_FtLWFM_EYozNoyA3AijpOQKhRCIMmoTHGe3BvQO2MAURKOBq1GCQwRpQAvy-QI9UDuc:1lYjec:CW7ZceL30_n47btaAvi84dF9PceSYu5N-lr-1bIqhI8','2021-05-04 06:14:34.863294'),('5kqalypth6obn8tkdz5knvj8mfzekjhl','.eJxVjLEOwiAURf-F2RDoAwQ33R2dyaMPbLWBpLRxMP67Jemgyx3uuee-mcd1Gfxa4-xHYicG7PDbBeyfMTdAD8z3wvuSl3kMvE34Tis_T1N5bXHbnHotFKfLLv69DViHdhUwqi5I7cCaY0fGOhUQQISIgqiXDaFNJAw6REqQJFkNpDVIFRP7fAFriT2x:1lYpGk:njXyKFO5afmWrNyP9GmOiqkNq_T8omyh4YdGvKnyLNw','2021-05-04 12:14:18.600820'),('7deodp5v506oaygf4y40ltto9ba1gmor','.eJxVTbsOwiAU_RdmQyhwgbrp7uhMLg-l2kBS2jgY_11IOmhOcobzfBOL25rsVuNip0COhCty-BUd-mfM3QkPzPdCfcnrMjnaI3R3Kz3Nc3k1urZOvZQQ5_Ne_FtLWFM_EYozNoyA3AijpOQKhRCIMmoTHGe3BvQO2MAURKOBq1GCQwRpQAvy-QI9UDuc:1lYir6:Ui1usKLyS5aqxpJJjQ0LPXe2JvNUYaEyr7XD4l95fIE','2021-05-04 05:23:24.358487'),('gyk3ol46x32tlpvje9iznkza5xwgs6bf','.eJxVTbsOwiAU_RdmQyhwgbrp7uhMLg-l2kBS2jgY_11IOmhOcobzfBOL25rsVuNip0COhCty-BUd-mfM3QkPzPdCfcnrMjnaI3R3Kz3Nc3k1urZOvZQQ5_Ne_FtLWFM_EYozNoyA3AijpOQKhRCIMmoTHGe3BvQO2MAURKOBq1GCQwRpQAvy-QI9UDuc:1lYmzT:CsSfambDMwkHl38lRtPzRxF2gpP11WyTkUHD0yKLVTA','2021-05-04 09:48:19.189150'),('ind1iew1d58rvqqledf8jj1e8ul4qvpq','.eJxVTbsOwiAU_RdmQyhwgbrp7uhMLg-l2kBS2jgY_11IOmhOcobzfBOL25rsVuNip0COhCty-BUd-mfM3QkPzPdCfcnrMjnaI3R3Kz3Nc3k1urZOvZQQ5_Ne_FtLWFM_EYozNoyA3AijpOQKhRCIMmoTHGe3BvQO2MAURKOBq1GCQwRpQAvy-QI9UDuc:1lYriH:CBfIDA4La-GOZyNtj62mh2j1zsPKVYOg6rrx4QO_vuY','2021-05-04 14:50:53.986845'),('jnb77x7wb3yv9dyso98vny282ksfsswe','.eJxVjDEPgjAQhf9LZ9NgywF1093RubnrXQUlNKEQB-N_tyQMurzhvfd9b-VxXXq_Zpn9wOqkjDr8doThKdM28AOne9IhTcs8kN4uel-zPo9jepW4FSZfE8t42cE_W4-5LyqRlgGbYzQdGqFoLVTRdZ0wAZtAUoGt2wakthEpgCPXOjBcNVALWFKfL3U3PWw:1lYn3w:CYib9yw8LLL-RwyltstQ2VMeTidQcRdOUXhXhZ6C26Q','2021-05-04 09:52:56.707095'),('lxg27u3jh5v09jgzeo6p7q6t9fzn6zi7','.eJxVjD0PwiAURf8LsyF8tVA3uzs6E3gPpEpKUto4GP-7NOmgyx3uvee8iXXbmuxWw2InJGciyem38w6eYd4HfLj5XiiUeV0mT_cLPdZKLzmXV4tbY-q1YMjjAf7ZkqupqTTDAX0HoMFxiL2IGIBLh0KzHpQxkUWphI4KQ68V8wjYCaOMCH7g6MnnC4DvPe0:1lYaBb:g5eKgnOYa7PU09QNJJRXbIiFyE0jodvYA3OcNTpszTo','2021-05-03 20:07:59.507323'),('mzd7jkcih81iaoammpaj8on95xquftzp','.eJxVTbsOwiAU_RdmQyhwgbrp7uhMLg-l2kBS2jgY_11IOmhOcobzfBOL25rsVuNip0COhCty-BUd-mfM3QkPzPdCfcnrMjnaI3R3Kz3Nc3k1urZOvZQQ5_Ne_FtLWFM_EYozNoyA3AijpOQKhRCIMmoTHGe3BvQO2MAURKOBq1GCQwRpQAvy-QI9UDuc:1lYlYH:6AMEIHHxaq2IW17Zq68miTuzmVU8TFLbvs42lwJ8yMA','2021-05-04 08:16:09.507066'),('p5ao2iistsiifbz2u9cometdicyl71ph','.eJxVTbsOwiAU_RdmQyhwgbrp7uhMLg-l2kBS2jgY_11IOmhOcobzfBOL25rsVuNip0COhCty-BUd-mfM3QkPzPdCfcnrMjnaI3R3Kz3Nc3k1urZOvZQQ5_Ne_FtLWFM_EYozNoyA3AijpOQKhRCIMmoTHGe3BvQO2MAURKOBq1GCQwRpQAvy-QI9UDuc:1lYrlI:MTPIJgY5-Pxehucz1s256yQ9nELooSI3h38LDMPiSRo','2021-05-04 14:54:00.616710');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_post`
--

DROP TABLE IF EXISTS `posts_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated` datetime(6) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `draft` tinyint(1) NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `anonymous` tinyint(1) NOT NULL,
  `read_time` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `posts_post_author_id_fe5487bf_fk_userprofile_profile_id` (`author_id`),
  CONSTRAINT `posts_post_author_id_fe5487bf_fk_userprofile_profile_id` FOREIGN KEY (`author_id`) REFERENCES `userprofile_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_post`
--

LOCK TABLES `posts_post` WRITE;
/*!40000 ALTER TABLE `posts_post` DISABLE KEYS */;
INSERT INTO `posts_post` VALUES (1,'I Barely Ever Buy Books','i-barely-ever-buy-books','<p>If you&rsquo;ve seen a picture of my bookshelf&nbsp;(stretch your eyes to the title&nbsp;photo of&nbsp;this post, you mulberry)&nbsp;you&rsquo;re probably thinking, &ldquo;<span style=\"color:#f39c12\">BUT CAIT YOU HAVE SO MANY BOOKS????</span>&rdquo;</p>\r\n\r\n<hr />\r\n<p>It&rsquo;s true.&nbsp;<strong>I have been ridiculously and enormously and incomprehensibly blessed as a book blogger</strong>.</p>\r\n\r\n<p>I&rsquo;d estimate about&nbsp;<strong>60%</strong>&nbsp;of my books were sent from publishers. Perhaps&nbsp;<strong>10%</strong>&nbsp;are gifts from friends or giveaways I&rsquo;ve won. And&nbsp;<strong>10%</strong>&nbsp;are from library sales which means we&rsquo;re talking 50 cents to $1 per book. And&nbsp;<strong>20%</strong>&nbsp;I bought full price from the bookstore I freelance blog for in exchange for book vouchers.</p>\r\n\r\n<hr />\r\n<p>Except for those library sales, I barely&nbsp;<em>ever</em>&nbsp;spend money on books. *&nbsp;<u>Thrifty bookworm</u> winning here. Which is good because I am the&nbsp;poor.</p>','2021-04-20 08:13:44.311520','2021-04-19 17:16:02.930647',1,1,0,0,1,'posts/3706761460/1103332350.jpeg',2),(3,'I Plagiarise Myself Constantly','i-plagiarise-myself-constantly','<p>When you&rsquo;ve been blogging for 5 years&hellip;<del>YOU GO A LITTLE INSANE</del>&nbsp;you start to realise you&rsquo;ve talked about just about every aspect of a book. * And sometimes you sit down to type up a post and you blink and say, &ldquo;Well, I got nothing.&rdquo;</p>\r\n\r\n<p>Or, if you are me ** you end up writing a BRILLIANT and INSPIRED post and then randomly search your own blog because&nbsp;<em>something about it felt familiar</em>&hellip;<strong>only to realise&nbsp;you&rsquo;d already written about this.</strong>&nbsp;THEN YOU CRY TO CHOCOLATE, BECAUSE CHOCOLATE UNDERSTANDS.&nbsp;And then you post it anyway. And see if anyone notices mwahahaha.</p>\r\n\r\n<p>But seriously, I should take legal action against myself. I&rsquo;m terrible.</p>\r\n\r\n<hr />\r\n<p>* NOT STRICTLY TRUE. I HAVE YET TO DISCUSS DECKLED EDGES ON PAGES! WHICH IS OBVIOUSLY A CRUCIAL TOPIC AND I&rsquo;M NEGLECTING THE DECKLED EDGES FANDOM BY NOT SPEAKING ON IT. SORRY.<br />\r\n** UGH.&nbsp;I HOPE NOT. ONE OF ME IS QUITE ENOUGH IRRITATION FOR THIS GALAXY</p>\r\n\r\n<hr />\r\n<p>Last year I was crying over troll comments on Goodreads.&nbsp;<strong>This year I just revert to 19th century speak because&nbsp;it&rsquo;s very satisfying when you&rsquo;re mad.</strong>&nbsp;Life&nbsp;is too short to cry over what nameless internet turnip-heads think. Life is too short for turnips in general. Like seriously WHAT IS THE POINT OF A TURNIP??&nbsp;(I digress, I&rsquo;m sorry.)</p>','2021-04-20 05:20:37.762943','2021-04-19 17:37:31.762270',1,0,1,0,2,'posts/640023920/2325442746.jpg',3),(6,'I Don\'t Force Myself To Achieve 100%','i-dont-force-myself-to-achieve-100','<p>Again, last year I WAS ON FIRE! And this year&hellip;I am on&nbsp;LESS FIRE? Which is okay.&nbsp;<strong>My blog is still growing,</strong>&nbsp;my stats are pleasant, you commenters&nbsp;<em>make my day freakishly better every. single. time</em>, and I love looking at my blog design. * Who refreshes Paper Fury to watch the arrow shoot across the screen still?!!! OH OH JUST ME? Oh. Okay then.</p>\r\n\r\n<p><strong>But this year I reminded&nbsp;myself</strong>&nbsp;that&nbsp;<strong>(A)</strong>&nbsp;writing needs to be a priority over blogging because HOPEFUL CAREER THERE; and&nbsp;<strong>(B)</strong>&nbsp;my blog will not perish&nbsp;if I don&rsquo;t post everyday;&nbsp;and&nbsp;<strong>(C)</strong>&nbsp;keep it FUN around here, Cait! That&rsquo;s the key to sticking to blogging for years and years and years. **</p>\r\n\r\n<p><strong>After trying to do EVERYTHING last year, I&rsquo;m not a recovering overachiever.</strong>&nbsp;But&nbsp;I&rsquo;m going to be the BEST and FASTEST and most SUCCESSFUL recovering overachiever ever. ***</p>\r\n\r\n<p><strong>Well this obviously needs to be said and I don&rsquo;t think it&rsquo;s a secret.</strong>&nbsp;Look how long my posts are these days. They are mammoth beasts of footnotes, random word trails that lead to cake, and completely IRRELEVANT discussions on turnips or how shiny my crown should be. * I just CAN&rsquo;T STOP. And I feel mildly guilty for how long my posts are, but pfft.&nbsp;<strong>Life is too short not to blog happily and that is my goal here</strong>.</p>\r\n\r\n<p>And also I JUST HAVE&nbsp;SO MUCH TO SAY!!! It&rsquo;s not my fault!!! My brain is so interesting!!!! **</p>','2021-04-20 06:32:40.159696','2021-04-19 17:54:48.386238',1,0,1,0,2,'posts/1512107045/764742973.jpg',2),(7,'Blogging Isn’t for Everyone','blogging-isnt-for-everyone','<p>Blogging may seem like a dream job, and I have to admit that I&rsquo;ve enjoyed my work a lot during the past 10 years, but it&rsquo;s not a good fit for everybody. It&rsquo;s not so much the work itself, but the challenges that come with the lifestyle. Here are just a few things that can present problems:</p>\r\n\r\n<ul>\r\n	<li>You need to have&nbsp;<strong>patience</strong>&nbsp;and put in a lot of work before you see results.</li>\r\n	<li>Your&nbsp;<strong>income will fluctuate</strong>&nbsp;every month, which means you need financial discipline (and even if you&rsquo;re disciplined it can still be stressful).</li>\r\n	<li>If you work from home you&rsquo;ll have<strong>&nbsp;very little human interaction</strong>&nbsp;in your work.</li>\r\n	<li>You&rsquo;ll need to be&nbsp;<strong>self-motivated</strong>&nbsp;because there&rsquo;s no boss to hold you accountable.</li>\r\n</ul>\r\n\r\n<p>Working from home comes with plenty of challenges. The first 4 or 5 years I worked from home there were no kids in the house. The last 5+ years have been a lot more challenging, and now with two kids I&rsquo;ve had to learn to work with more noise and distractions around me.</p>\r\n\r\n<p>I&rsquo;m not complaining though. I love working from home and I hope to be able to do it for a long time, even if it does come with some challenges.</p>','2021-04-20 06:16:47.775347','2021-04-19 17:58:42.806458',1,0,0,0,2,'posts/920680820/972765381.jpg',4),(9,'My Friends and Family Have No Clue What I Do','my-friends-and-family-have-no-clue-what-i-do','<p>I hate talking to friends and family about what I do for a living, so I avoid the subject as much as possible.</p>\r\n\r\n<p>Aside from my wife, no one really understands what I do.</p>\r\n\r\n<hr />\r\n<p>My first blog was a web/graphic design blog and I did some web design work for clients, so if someone asked what I did for a living I would simply say &ldquo;web design&rdquo;. It was an easy answer because everyone understands it and there are very few follow up questions.</p>\r\n\r\n<p>After I sold my design blog I wasn&rsquo;t involved in web design anymore, so for the past 5 years I&rsquo;ve referred to my job as &ldquo;internet marketing&rdquo;. I do get some questions about what I do, but I can usually just say that I manage my own websites, and then try to change the subject quickly.</p>\r\n\r\n<hr />\r\n<p><strong>I&rsquo;ve never referred to myself as a blogger</strong>&nbsp;when someone asks me what I do for a living, and I probably never will (I only describe myself as a blogger within the blogging community, where people actually understand it). I&rsquo;ve never shared my websites or blogs with any friends or family other than my wife, and with very few exceptions my sites haven&rsquo;t been seen by people that I know personally.</p>\r\n\r\n<p>I know many blogging experts tell you to get started by sharing your blog with friends and family. I&rsquo;m not saying it&rsquo;s bad advice &ndash; I&rsquo;m sure it can be helpful &ndash; I just don&rsquo;t want to do it.</p>','2021-04-19 19:31:21.982146','2021-04-19 18:08:24.683051',1,0,0,0,2,'posts/3194961231/1675221192.jpg',8),(10,'Time Management and Focus Are Major Challenges','time-management-and-focus-are-major-challenges','<p>My single biggest challenge as a full-time blogger is managing my time. There are so many different things to do, and there is no way I&rsquo;ll ever be able to get to everything that I want to do.</p>\r\n\r\n<p>When I first started, blogging was basically a&nbsp;<a href=\"https://vitaldollar.com/best-weekend-jobs/\">weekend job</a>. I thought that when I went full-time that time management would get easier, but it&rsquo;s amazing how fast your schedule fills up with work that needs to be done.</p>\r\n\r\n<p>Each day I have to try and decide what is most&nbsp;<strong>important</strong>&nbsp;and&nbsp;<strong>urgent</strong>. I have to do my best to stay focused on the projects I&rsquo;m working on and not chase after shiny objects and every new trend that I read about.</p>\r\n\r\n<p>If you&rsquo;re not careful it&rsquo;s very easy to spend your time doing things that&nbsp;<strong>really don&rsquo;t matter</strong>.</p>\r\n\r\n<p>As a blogger you are responsible for your own success and you need to evaluate how you use your most valuable asset, your time. You need to have a plan and stick to it.</p>\r\n\r\n<hr />\r\n<p>You might think that a blogger spends the majority of their time writing. If you&rsquo;re a&nbsp;<a href=\"https://vitaldollar.com/get-started-freelance-writing/\">freelance writer</a>&nbsp;this is probably the case. But if you&rsquo;re managing your own blogs, writing is just one of the tasks that you&rsquo;ll need to do. You&rsquo;ll also probably spend time on social media, promoting your content, responding to emails and comments, researching and staying up-to-date in your niche, managing finances, and everything else related to running the business.</p>\r\n\r\n<p>Writing is actually one of the easiest things to outsource, so it&rsquo;s very possible that you could run a successful blog and not do any of the writing yourself.</p>\r\n\r\n<p>For me this is a good thing. I enjoy writing, but<strong>&nbsp;it can be draining</strong>&nbsp;if I do too much of it. Right now I&rsquo;m managing a few different blogs, and most weeks I only write 1 or 2 new blog posts. I hope to increase that, especially here at Vital Dollar, but for now, writing takes up much less than half of my time.</p>','2021-04-20 06:17:34.038521','2021-04-19 18:12:01.835364',0,0,1,0,3,'posts/3757735706/1347035868.jpg',12),(12,'The day that changed my life forever...','the-day-that-changed-my-life-forever','<p>It was the day that I decided I wanted to have a serious career in film, it was the day I fully comitted to wanting to learn everything I could about screenwriting... It was the day I started my first script age 19 determined to start something, anything before my 20th birthday which was only a few days away. I couldn&#39;t tell you exactly what I was doing or how I was feeling when I got the idea of &quot;Hi again&quot; but it most likely due to one of my many daydreams that sparked the idea. I researched articles on how to start sceenwrtitng and the basics. Most told me that the best way to learn, was to just start writing. So I did just that, I downloaded a screenwriting software that seemed easy enough to begin with and was FREE. Which is a word me and many students alike, love to hear. And I began to write...</p>\r\n\r\n<hr />\r\n<p>And as I began to write I started to feel a strange feeling, it was as if I had butterflies in my stomach but I wasn&#39;t nervous... I was excited, It was as if nothing else matterd in that moment. Looking back on that memory I remember a quote from a artist who recently retired. He said when he began his career everyday going out on that stage he would feel excited not nervous. And would get he would get that feeling and he knew that that is what he should be doing it just felt right. And so when this artist lost that feeling, when he would go out on that stage he would&#39;nt feel anything anymore, That is when he knew that his career was no more, he had lost the feeling of beloging or anticipation. In comparisent that evening when I decided to open up my laptop and my mind that&#39;s when I knew that screenwriting was what I was supposed to be doing. It just felt right.</p>\r\n\r\n<hr />\r\n<p>Now before this I used to for many years from the age of 15, 16 now and again write full length dialouge sceenplays based on books. That didn&#39;t just include dialouge it included EVERYTHING and when I say &quot;everything&quot;I mean marketing ideas, productions ideas, camera postions, lighting, locations, you name it. This would go into my notes app on my phone.</p>\r\n\r\n<p>I hope my blog helps to encourage young filmakers/creatives to finding resourcers to achieve their dreams. This blog will be a documentation of my journey as a up and coming filmaker/screenwriter.</p>\r\n\r\n<hr />\r\n<p>This blog is for everyone and anyone who loves films and all things creative. I will be posting daily posts on my favourite tv shows/films to watch, my favourite books, best screenwriting software to use as a begginer, the future of film. And lots more! I will also be asking people to email in any ideas for future posts. Lets have a healthy discussion, I hope to develop a safe space for fellow cinephiles and movie lovers from all walks of life to feel free to share their ideas and opinions on key topics.&nbsp;</p>','2021-04-19 19:38:34.520003','2021-04-19 18:46:57.425535',1,0,0,0,3,'posts/1325111200/1074443302.jpg',17),(13,'Here are the 15 books that changed my life forever','here-are-the-15-books-that-changed-my-life-forever','<p>To create and manage your own content, open the <strong>Blog Manager</strong> by hovering over your blog feed and clicking <strong>Manage</strong>. Here you can create, edit and delete posts and manage categories. You can also update your post settings and SEO, duplicate or draft posts, turn off commenting, or delete a post altogether by clicking <strong>Edit</strong> on each blog post.</p>\r\n\r\n<p>To delete or edit an existing image or video in each post, click on the media to reveal a toolbar, which also allows you to customize the size and layout of your visuals.</p>\r\n\r\n<p>Add more elements to your post by clicking on each of the symbols at the bottom of your post. Insert an image or gallery, embed HTML, or add a GIF to spice up your content.</p>\r\n\r\n<p>Add a cover photo to your post before publishing by clicking <strong>Settings</strong> on the left sidebar. Your cover photo is visible to all users who browse the blog on your site. Edit how your posts show up on search results and make them more discoverable by editing the SEO for each post.</p>\r\n\r\n<hr />\r\n<p>Add categories to your posts so users can navigate your blog pages by topic. Once you&rsquo;re satisfied with your post, go live by clicking <strong>Publish</strong>.</p>','2021-04-20 08:17:40.503477','2021-04-19 18:48:23.921099',0,0,1,0,2,'posts/2022857902/3498259251.jpg',2),(14,'Getting things done','getting-things-done','<p>Edit exactly how your blog looks on your website from the <strong>Settings</strong> panel. Wix Blogs lets you hide or display the author name and picture, date and reading time, views, comments and likes counter. Toggle between the options and view your changes in real time.</p>\r\n\r\n<p>If your blog is connected to a <strong>Members Area</strong>, you&rsquo;ll want to make sure the Login button is visible to users. To send automatic email notifications to subscribers every time there&rsquo;s a post, turn on the email notification option on your Settings panel. Start managing your blog posts from your dashboard by clicking on <strong>Manage Posts</strong>.</p>\r\n\r\n<p>From the Dashboard, you can create, edit and delete posts and update your SEO settings. You can also duplicate or draft posts, turn off commenting, or delete a post altogether by clicking (...) on each blog post.</p>\r\n\r\n<hr />\r\n<p>Once you&rsquo;re happy with your blog, make sure to publish your posts from the Dashboard and go live with your site by clicking <strong>Publish</strong>.</p>','2021-04-20 14:55:09.314996','2021-04-19 18:55:39.022740',0,0,0,0,1,'posts/3073728104/2005320060.jpg',2),(15,'Out with the old, in with the new','out-with-the-old-in-with-the-new','<p>To edit the way your blog feed looks on your site, hover over your blog feed and click on <strong>Design</strong>. Here, you can pick from different layouts. If you add a blog feed section to a different page on your website, you can pick a design that&rsquo;s different from your main blog page.</p>\r\n\r\n<p>Edit what info and details your blog feed displays by clicking on <strong>Settings</strong> (look for the 3 dot icon).</p>\r\n\r\n<p>From the Settings panel, Wix Blog lets you hide or display the author name and picture, date and reading time, views, comments and likes counter. Toggle between the options and view your changes in real time.</p>\r\n\r\n<p>If your blog is connected to a <strong>Members Area</strong>, you&rsquo;ll want to make sure the Login button is visible to users. To send automatic email notifications to blog subscribers every time there&rsquo;s a new post, turn on the email notification option on your Settings panel. Start managing your blog posts by clicking on <strong>Manage Posts</strong> once you&rsquo;re happy with your blog settings.</p>\r\n\r\n<p>&nbsp;</p>','2021-04-20 09:50:55.671004','2021-04-19 19:03:19.944042',0,0,0,0,1,'posts/588270739/3605558739.jpg',14),(16,'The Good Girl Confessional','the-good-girl-confessional','<p>In her forties, this anonymous woman found her life was gradually disintegrating &ndash; she lost a home and her business, and instead found herself a never-there ex-husband a whole lot of debt.</p>\r\n\r\n<p>Now she&rsquo;s piecing her life together, one blog post a time, moving on with a new love she calls &lsquo;The Producer&rsquo;, and letting the world in on embarrassing dilemmas (am I alone in not having sex on my period?)&nbsp; and helpfully candid anecdotes (how to cope with when the reaction to your Christmas gift is visible disappointment). &nbsp;</p>\r\n\r\n<hr />\r\n<p><em>Do read</em>: The Good Girl&rsquo;s&nbsp;<a href=\"http://thegoodgirlconfessional.com/youth-is-wasted-on-the-young/\">letter</a>&nbsp;to a &ldquo;young gorgeous chick on the train&rdquo;.</p>','2021-04-20 14:55:05.587732','2021-04-19 19:16:31.761980',1,0,0,0,1,'posts/559671333/2888511795.jpg',16);
/*!40000 ALTER TABLE `posts_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_post_likes`
--

DROP TABLE IF EXISTS `posts_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_post_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `profile_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_post_likes_post_id_profile_id_caca79e0_uniq` (`post_id`,`profile_id`),
  KEY `posts_post_likes_profile_id_b697d840_fk_userprofile_profile_id` (`profile_id`),
  CONSTRAINT `posts_post_likes_post_id_7f646a71_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`),
  CONSTRAINT `posts_post_likes_profile_id_b697d840_fk_userprofile_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `userprofile_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_post_likes`
--

LOCK TABLES `posts_post_likes` WRITE;
/*!40000 ALTER TABLE `posts_post_likes` DISABLE KEYS */;
INSERT INTO `posts_post_likes` VALUES (87,3,2),(111,3,3),(89,3,4),(93,3,25),(113,6,3),(85,7,2),(76,7,12),(77,7,13),(78,7,14),(79,7,15),(80,7,16),(81,7,17),(56,10,7),(55,10,8),(110,12,3),(51,12,10),(52,12,14),(54,12,20),(112,14,3),(49,15,15),(47,15,16),(48,15,17),(84,16,2),(58,16,3),(59,16,4),(60,16,5),(61,16,6),(62,16,7),(63,16,8),(64,16,9),(65,16,10),(66,16,11),(67,16,12),(68,16,13),(69,16,14),(70,16,15),(71,16,16),(72,16,17),(74,16,19),(75,16,20);
/*!40000 ALTER TABLE `posts_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_post_tags`
--

DROP TABLE IF EXISTS `posts_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_post_tags` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_post_tags_post_id_tag_id_9b9d69ec_uniq` (`post_id`,`tag_id`),
  KEY `posts_post_tags_tag_id_0743d52e_fk_tags_tag_id` (`tag_id`),
  CONSTRAINT `posts_post_tags_post_id_1f164920_fk_posts_post_id` FOREIGN KEY (`post_id`) REFERENCES `posts_post` (`id`),
  CONSTRAINT `posts_post_tags_tag_id_0743d52e_fk_tags_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tags_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_post_tags`
--

LOCK TABLES `posts_post_tags` WRITE;
/*!40000 ALTER TABLE `posts_post_tags` DISABLE KEYS */;
INSERT INTO `posts_post_tags` VALUES (31,1,5),(32,1,6),(33,1,7),(30,1,8),(14,12,4),(15,12,7),(16,12,15),(17,12,23),(18,12,24),(9,14,3),(10,14,6),(11,14,9),(12,14,11),(3,15,3),(4,15,6),(5,15,9),(6,15,13),(7,15,23),(2,16,18),(1,16,24);
/*!40000 ALTER TABLE `posts_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_tag`
--

DROP TABLE IF EXISTS `tags_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_tag_slug_78c2b8d8` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_tag`
--

LOCK TABLES `tags_tag` WRITE;
/*!40000 ALTER TABLE `tags_tag` DISABLE KEYS */;
INSERT INTO `tags_tag` VALUES (2,'life','life','2021-04-19 19:33:29.940140',1),(3,'suicide','suicide','2021-04-19 19:33:46.432323',1),(4,'sad','sad','2021-04-19 19:34:14.386645',1),(5,'thoughts','thoughts','2021-04-19 19:34:18.323246',1),(6,'loveyourself','loveyourself','2021-04-19 19:34:23.452522',1),(7,'writer','writer','2021-04-19 19:34:38.242846',1),(8,'happy','happy','2021-04-19 19:34:41.617795',1),(9,'music','music','2021-04-19 19:34:46.764952',1),(10,'viral','viral','2021-04-19 19:34:50.319195',1),(11,'memes','memes','2021-04-19 19:34:54.879332',1),(12,'nature','nature','2021-04-19 19:35:02.577151',1),(13,'shayari','shayari','2021-04-19 19:35:08.291075',1),(14,'poetry','poetry','2021-04-19 19:35:16.012094',1),(15,'lifestyle','lifestyle','2021-04-19 19:35:21.915582',1),(16,'girl','girl','2021-04-19 19:35:37.122343',1),(17,'gf','gf','2021-04-19 19:35:40.759167',1),(18,'bf','bf','2021-04-19 19:35:46.488601',1),(19,'bff','bff','2021-04-19 19:35:53.759979',1),(20,'smile','smile','2021-04-19 19:36:06.606327',1),(21,'broken','broken','2021-04-19 19:36:11.167360',1),(22,'sadness','sadness','2021-04-19 19:36:16.265321',1),(23,'goals','goals','2021-04-19 19:36:19.448287',1),(24,'me','me','2021-04-19 19:36:21.588695',1),(25,'alone','alone','2021-04-19 19:36:24.466249',1),(26,'pain','pain','2021-04-20 04:00:25.620253',1);
/*!40000 ALTER TABLE `tags_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile_profile`
--

DROP TABLE IF EXISTS `userprofile_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofile_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `userprofile_profile_user_id_f37c6bb1_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile_profile`
--

LOCK TABLES `userprofile_profile` WRITE;
/*!40000 ALTER TABLE `userprofile_profile` DISABLE KEYS */;
INSERT INTO `userprofile_profile` VALUES (2,'user/profile_pics/ranjit/profile-picture.jpg','I am Ranjit Handsome','2021-04-19 17:01:15.929111','2021-04-20 09:52:56.702865',2),(3,'user/profile_pics/rijalanupraj/profile-picture_teH1M45.jpeg','Hi','2021-04-19 19:08:38.727886','2021-04-20 14:52:10.050078',3),(4,'user/profile_pics/samir/profile-picture.jpg','Hello Guys','2021-04-19 19:22:27.141239','2021-04-20 05:23:37.998320',4),(5,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:24:00.416088','2021-04-19 19:24:00.419895',5),(6,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:24:21.439187','2021-04-19 19:24:21.442484',6),(7,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:24:46.468049','2021-04-19 19:24:46.472014',7),(8,'user/profile_pics/nishan/profile-picture.jpeg',NULL,'2021-04-19 19:25:06.998063','2021-04-20 05:26:37.092099',8),(9,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:25:30.605146','2021-04-19 20:05:59.549756',9),(10,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:26:00.963689','2021-04-20 05:39:28.524388',10),(11,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:26:15.524932','2021-04-19 19:26:15.528910',11),(12,'user/profile_pics/anuragh/profile-picture.jpeg',NULL,'2021-04-19 19:26:47.906567','2021-04-20 05:23:52.989220',12),(13,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:27:12.911874','2021-04-19 19:27:12.915211',13),(14,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:27:41.023590','2021-04-19 19:27:41.026804',14),(15,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:27:57.937496','2021-04-19 19:27:57.940748',15),(16,'user/profile_pics/chameli/profile-picture.jpg',NULL,'2021-04-19 19:28:16.139630','2021-04-20 05:36:58.157889',16),(17,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:28:38.811608','2021-04-19 20:05:47.879865',17),(19,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:29:55.091137','2021-04-20 14:54:49.670053',19),(20,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-19 19:30:17.630205','2021-04-19 20:05:15.055833',20),(25,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-20 04:52:13.069235','2021-04-20 04:52:50.048732',25),(26,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-20 05:00:06.244944','2021-04-20 14:54:00.606523',26),(31,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-20 14:29:37.757569','2021-04-20 14:54:44.270001',31),(32,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-20 14:35:47.051065','2021-04-20 14:35:47.055247',32),(33,'user/profile_pics/default-profile-picture.jpg',NULL,'2021-04-20 14:38:42.693508','2021-04-20 14:42:11.819365',33);
/*!40000 ALTER TABLE `userprofile_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofile_profile_following`
--

DROP TABLE IF EXISTS `userprofile_profile_following`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofile_profile_following` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userprofile_profile_following_profile_id_user_id_8fbfe6ad_uniq` (`profile_id`,`user_id`),
  KEY `userprofile_profile__user_id_6b123cd7_fk_accounts_` (`user_id`),
  CONSTRAINT `userprofile_profile__profile_id_f0ce2669_fk_userprofi` FOREIGN KEY (`profile_id`) REFERENCES `userprofile_profile` (`id`),
  CONSTRAINT `userprofile_profile__user_id_6b123cd7_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofile_profile_following`
--

LOCK TABLES `userprofile_profile_following` WRITE;
/*!40000 ALTER TABLE `userprofile_profile_following` DISABLE KEYS */;
INSERT INTO `userprofile_profile_following` VALUES (70,3,2),(38,3,4),(69,3,5),(68,3,6),(67,3,7),(39,3,8),(36,3,9),(40,3,10),(30,3,11),(31,3,12),(32,3,13),(33,3,15),(37,3,16),(35,3,19),(27,9,3),(28,9,6),(26,9,10),(17,17,9),(18,17,10),(19,17,14),(20,17,15),(21,17,16),(23,17,19),(24,17,20),(9,19,5),(10,19,6),(11,19,7),(12,19,9),(13,19,10),(14,19,14),(15,19,16),(1,20,2),(2,20,3),(3,20,4),(4,20,5),(5,20,6),(6,20,7),(7,20,8),(8,20,9);
/*!40000 ALTER TABLE `userprofile_profile_following` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 21:50:28
