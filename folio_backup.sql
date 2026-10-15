-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: folio_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add message',7,'add_message'),(26,'Can change message',7,'change_message'),(27,'Can delete message',7,'delete_message'),(28,'Can view message',7,'view_message'),(29,'Can add project',8,'add_project'),(30,'Can change project',8,'change_project'),(31,'Can delete project',8,'delete_project'),(32,'Can view project',8,'view_project'),(33,'Can add skill',9,'add_skill'),(34,'Can change skill',9,'change_skill'),(35,'Can delete skill',9,'delete_skill'),(36,'Can view skill',9,'view_skill'),(37,'Can add experience',10,'add_experience'),(38,'Can change experience',10,'change_experience'),(39,'Can delete experience',10,'delete_experience'),(40,'Can view experience',10,'view_experience'),(41,'Can add profile',11,'add_profile'),(42,'Can change profile',11,'change_profile'),(43,'Can delete profile',11,'delete_profile'),(44,'Can view profile',11,'view_profile');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$RT75rxODW9Ew0GwOFsus1q$BN2WGAzO9+FnK8kgx2WyKPsjIhKcpwova9L2jVHn63Y=','2026-10-14 17:16:39.860785',1,'Sibi','','','v.sibimanikandan@gmail.com',1,1,'2026-10-14 17:16:17.733912');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-10-14 17:28:11.054884','1','Sibi Manikandan V',2,'[{\"changed\": {\"fields\": [\"Tagline\", \"Intro\", \"About\", \"Email\", \"Phone\", \"Location\", \"Github\"]}}]',11,1),(2,'2026-10-14 17:30:10.197314','1','Sibi Manikandan V',2,'[{\"changed\": {\"fields\": [\"About\"]}}]',11,1),(3,'2026-10-14 17:30:49.317717','1','Sibi Manikandan V',2,'[]',11,1),(4,'2026-10-14 17:35:23.613269','1','Sibi Manikandan V',2,'[{\"changed\": {\"fields\": [\"Photo\", \"Cv\"]}}]',11,1),(5,'2026-10-14 17:42:37.154824','1','Python',1,'[{\"added\": {}}]',9,1),(6,'2026-10-14 17:43:12.445189','2','SQL',1,'[{\"added\": {}}]',9,1),(7,'2026-10-14 17:47:09.020864','3','Pandas',1,'[{\"added\": {}}]',9,1),(8,'2026-10-14 17:49:44.147029','4','Matplotlib',1,'[{\"added\": {}}]',9,1),(9,'2026-10-14 17:51:38.512974','3','Pandas',2,'[{\"changed\": {\"fields\": [\"Category\"]}}]',9,1),(10,'2026-10-14 17:52:24.525007','5','Power Bi',1,'[{\"added\": {}}]',9,1),(11,'2026-10-14 17:59:55.619706','6','Jupyter Notebook',1,'[{\"added\": {}}]',9,1),(12,'2026-10-14 18:01:03.146195','7','MySQL',1,'[{\"added\": {}}]',9,1),(13,'2026-10-14 18:07:44.579718','6','Jupyter Notebook',2,'[{\"changed\": {\"fields\": [\"Icon\"]}}]',9,1),(14,'2026-10-14 18:09:22.540839','7','MySQL',2,'[{\"changed\": {\"fields\": [\"Icon\"]}}]',9,1),(15,'2026-10-14 18:13:24.140450','3','Pandas',2,'[{\"changed\": {\"fields\": [\"Order\"]}}]',9,1),(16,'2026-10-14 18:14:07.736820','8','Scikit-learn',1,'[{\"added\": {}}]',9,1),(17,'2026-10-14 18:15:54.250321','9','Numpy',1,'[{\"added\": {}}]',9,1),(18,'2026-10-14 18:23:18.905984','1','BSc Computer Science - Madras University',1,'[{\"added\": {}}]',10,1),(19,'2026-10-14 18:35:41.389209','2','Python Programming Course - MYFSCS',1,'[{\"added\": {}}]',10,1),(20,'2026-10-14 18:39:55.735881','2','Python Programming Course - MYFSCS',2,'[{\"changed\": {\"fields\": [\"Logo\"]}}]',10,1),(21,'2026-10-14 19:06:59.912384','3','Data Analyst Trainee - Academic Learning / Self-Directed Projects',1,'[{\"added\": {}}]',10,1),(22,'2026-10-14 19:29:49.472282','1','The fraud detection & streaming Analytics',1,'[{\"added\": {}}]',8,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'portfolio','experience'),(7,'portfolio','message'),(11,'portfolio','profile'),(8,'portfolio','project'),(9,'portfolio','skill'),(6,'sessions','session');
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
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-10-14 07:49:08.331516'),(2,'auth','0001_initial','2026-10-14 07:49:10.354677'),(3,'admin','0001_initial','2026-10-14 07:49:10.803915'),(4,'admin','0002_logentry_remove_auto_add','2026-10-14 07:49:10.827268'),(5,'admin','0003_logentry_add_action_flag_choices','2026-10-14 07:49:10.844765'),(6,'contenttypes','0002_remove_content_type_name','2026-10-14 07:49:11.135845'),(7,'auth','0002_alter_permission_name_max_length','2026-10-14 07:49:11.299487'),(8,'auth','0003_alter_user_email_max_length','2026-10-14 07:49:11.368197'),(9,'auth','0004_alter_user_username_opts','2026-10-14 07:49:11.386699'),(10,'auth','0005_alter_user_last_login_null','2026-10-14 07:49:11.555498'),(11,'auth','0006_require_contenttypes_0002','2026-10-14 07:49:11.565695'),(12,'auth','0007_alter_validators_add_error_messages','2026-10-14 07:49:11.586413'),(13,'auth','0008_alter_user_username_max_length','2026-10-14 07:49:11.855429'),(14,'auth','0009_alter_user_last_name_max_length','2026-10-14 07:49:12.030619'),(15,'auth','0010_alter_group_name_max_length','2026-10-14 07:49:12.073856'),(16,'auth','0011_update_proxy_permissions','2026-10-14 07:49:12.090754'),(17,'auth','0012_alter_user_first_name_max_length','2026-10-14 07:49:12.306552'),(18,'portfolio','0001_initial','2026-10-14 07:49:12.487855'),(19,'sessions','0001_initial','2026-10-14 07:49:12.589009'),(20,'portfolio','0002_experience_profile_alter_message_options_and_more','2026-10-14 08:59:28.792071'),(21,'portfolio','0003_experience_logo_profile_nickname_project_banner_and_more','2026-10-14 09:15:12.904123');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('6ajui70si1leu28en9pv37olt9p1qhlm','.eJxVjMsKwjAQAP9lzxLy7qZH735D2E1SU5UUmvYk_rsUetDrzDBviLRvNe69rHHOMIKCyy9jSs_SDpEf1O6LSEvb1pnFkYjTdnFbcnldz_ZvUKlXGMFpzIFMsEoaZJ89DzKQZyw4aRvQWYlODiYhm4zSpKACsvOaWE0pSfh8AbaUNvE:1xH2al:pKUE7CEMifkqj1RbGkNv0whxFAtAJdz8XVRwDlmpSHY','2026-10-28 17:16:39.874889');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_experience`
--

DROP TABLE IF EXISTS `portfolio_experience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_experience` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kind` varchar(4) NOT NULL,
  `title` varchar(150) NOT NULL,
  `organisation` varchar(150) NOT NULL,
  `period` varchar(60) NOT NULL,
  `description` longtext NOT NULL,
  `order` int unsigned NOT NULL,
  `logo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_experience_chk_1` CHECK ((`order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_experience`
--

LOCK TABLES `portfolio_experience` WRITE;
/*!40000 ALTER TABLE `portfolio_experience` DISABLE KEYS */;
INSERT INTO `portfolio_experience` VALUES (1,'edu','BSc Computer Science','Madras University','2023-2026','Pursued a Bachelor of Science in Computer Science at KCS Kasi Nadar College, affiliated with the University of Madras.',1,'logos/kindpng_6091322.png'),(2,'cert','Python Programming Course','MYFSCS','Jan 2023 - Present','A Python Programming course focused on data analytics, covering programming fundamentals, data manipulation, and analysis techniques, along with Django framework basics for web application development.',1,'logos/MYFSCS.jpeg'),(3,'work','Data Analyst Trainee','Academic Learning / Self-Directed Projects','2026 - Present','Data Analyst Trainee focusing on real-world datasets. Cleaning and analyzing data using Pandas, writing SQL queries in MySQL, and creating visualizations with Matplotlib, Seaborn and Power Bi. Documenting all projects in Jupyter Notebook and VS Code on GitHub. Seeking entry-level opportunity to apply skills.',0,'logos/icons8-experience-64.png');
/*!40000 ALTER TABLE `portfolio_experience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_message`
--

DROP TABLE IF EXISTS `portfolio_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `body` longtext NOT NULL,
  `sent` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_message`
--

LOCK TABLES `portfolio_message` WRITE;
/*!40000 ALTER TABLE `portfolio_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `portfolio_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_profile`
--

DROP TABLE IF EXISTS `portfolio_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `headline` varchar(120) NOT NULL,
  `tagline` varchar(200) NOT NULL,
  `intro` longtext NOT NULL,
  `about` longtext NOT NULL,
  `photo` varchar(100) NOT NULL,
  `cv` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `location` varchar(100) NOT NULL,
  `linkedin` varchar(200) NOT NULL,
  `github` varchar(200) NOT NULL,
  `kaggle` varchar(200) NOT NULL,
  `tableau` varchar(200) NOT NULL,
  `nickname` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_profile`
--

LOCK TABLES `portfolio_profile` WRITE;
/*!40000 ALTER TABLE `portfolio_profile` DISABLE KEYS */;
INSERT INTO `portfolio_profile` VALUES (1,'Sibi Manikandan V','Data Analyst','Transform data into strategical insights','B.Sc. Computer Science graduate with hands-on experience in SQL, Python, MySQL, and Power BI through data analytics projects. Passionate about transforming data into meaningful insights and eager to grow in data analytics and data engineering.','B.Sc. Computer Science graduate with hands-on experience in SQL, Python, MySQL, and Power BI through data analytics projects. Passionate about transforming data into meaningful insights and eager to grow in data analytics and data engineering.','profile/Sibi_photo.png','cv/SIBI_MANIKANDAN_V_Resume.pdf','v.sibimanikandan@gmail.com','+91 944450 7715','Chennai','','https://github.com/Sibiart','','','Sibi');
/*!40000 ALTER TABLE `portfolio_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_project`
--

DROP TABLE IF EXISTS `portfolio_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(140) NOT NULL,
  `summary` varchar(240) NOT NULL,
  `description` longtext NOT NULL,
  `tech` varchar(200) NOT NULL,
  `image` varchar(100) NOT NULL,
  `live_url` varchar(200) NOT NULL,
  `repo_url` varchar(200) NOT NULL,
  `year` int unsigned NOT NULL,
  `order` int unsigned NOT NULL,
  `analysis` varchar(200) NOT NULL,
  `dashboard_url` varchar(200) NOT NULL,
  `deck_url` varchar(200) NOT NULL,
  `notebook_url` varchar(200) NOT NULL,
  `problem` longtext NOT NULL,
  `result` longtext NOT NULL,
  `banner` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_project_chk_1` CHECK ((`year` >= 0)),
  CONSTRAINT `portfolio_project_chk_2` CHECK ((`order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_project`
--

LOCK TABLES `portfolio_project` WRITE;
/*!40000 ALTER TABLE `portfolio_project` DISABLE KEYS */;
INSERT INTO `portfolio_project` VALUES (1,'The fraud detection & streaming Analytics','Analyzes credit card transactions to identify potentially fraudulent activities using Python, MySQL, and Power BI','1.Cleaned transaction data in Python.\r\n2.Removed exact duplicate rows from the working dataset.\r\n3.Applied two baseline rules: transaction amount greater than 100 and greater than 1,000.\r\n4.Evaluated each rule against the dataset\'s Class label using true positives, false positives, false negatives, true negatives, precision, and recall.\r\n5.Simulated batch-by-batch processing to demonstrate monitoring metrics.\r\n6.Processed results in MySQL for analysis in Power BI.\r\nValidate key counts across Python, MySQL, and Power BI.','SQL, Python, Jupyter-notebook, Pandas ,Scikit-learn, Power Bi, VS code, MYSQL','projects/Fraud_Detection_Overview.png','','https://github.com/Sibiart/Fraud-Detection-Streaming-Analytics',2026,0,'EDA, Data Cleaning, Rule-Based Fraud Detection, Threshold Analysis, Class Imbalance Analysis, Confusion Matrix Analysis, KPI, Precision and Recall Analysis, Batch based Analysis','','','','The project aimed to identify potentially fraudulent credit card transactions using transaction data and rule-based analysis, while reducing false positives and missed fraud cases.','Tested two simple amount rules on 473 real fraud cases. Amount > 100 caught 26.43% of fraud (125 cases) but wrongly flagged 56,274 normal transactions. Amount > 1,000 wrongly flagged only 2,926, but caught just 1.90% of fraud (9 cases). Precision was very low for both (0.22% and 0.31%), showing that simple amount rules cannot reliably detect fraud and that better methods are needed.','projects/Fraud_Detection_png.png');
/*!40000 ALTER TABLE `portfolio_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio_skill`
--

DROP TABLE IF EXISTS `portfolio_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portfolio_skill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `category` varchar(60) NOT NULL,
  `order` int unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `portfolio_skill_chk_1` CHECK ((`order` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio_skill`
--

LOCK TABLES `portfolio_skill` WRITE;
/*!40000 ALTER TABLE `portfolio_skill` DISABLE KEYS */;
INSERT INTO `portfolio_skill` VALUES (1,'Python','Programming Languages',0,'skills/python.png'),(2,'SQL','Programming Languages',1,'skills/sql-server.png'),(3,'Pandas','Analytics Tools',0,'skills/panda.png'),(4,'Matplotlib','Visualization Tools',3,'skills/chart.png'),(5,'Power Bi','Visualization Tools',4,'skills/Powerbi.png'),(6,'Jupyter Notebook','IDE / Notebook Environment',5,'skills/Jupyter.jpeg'),(7,'MySQL','Database',5,'skills/icons8-mysql-100.png'),(8,'Scikit-learn','Analytics Tools',3,'skills/scikit.webp'),(9,'Numpy','Analytics Tools',1,'skills/icons8-numpy-96.png');
/*!40000 ALTER TABLE `portfolio_skill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-16  0:23:43
