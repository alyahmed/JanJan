-- MySQL dump 10.13  Distrib 5.6.20, for osx10.7 (x86_64)
--
-- Host: localhost    Database: janjan
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `T_AUTHORITY`
--

DROP TABLE IF EXISTS `T_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_AUTHORITY` (
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_AUTHORITY`
--

LOCK TABLES `T_AUTHORITY` WRITE;
/*!40000 ALTER TABLE `T_AUTHORITY` DISABLE KEYS */;
INSERT INTO `T_AUTHORITY` VALUES ('ROLE_ADMIN'),('ROLE_ANONYMOUS'),('ROLE_USER');
/*!40000 ALTER TABLE `T_AUTHORITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_PERSISTENT_AUDIT_EVENT`
--

DROP TABLE IF EXISTS `T_PERSISTENT_AUDIT_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PERSISTENT_AUDIT_EVENT` (
  `event_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `principal` varchar(255) NOT NULL,
  `event_date` timestamp NULL DEFAULT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `idx_persistent_audit_event` (`principal`,`event_date`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_PERSISTENT_AUDIT_EVENT`
--

LOCK TABLES `T_PERSISTENT_AUDIT_EVENT` WRITE;
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVENT` DISABLE KEYS */;
INSERT INTO `T_PERSISTENT_AUDIT_EVENT` VALUES (1,'admin','2015-08-29 22:21:24','AUTHENTICATION_SUCCESS'),(2,'anonymousUser','2015-08-29 22:21:27','AUTHORIZATION_FAILURE'),(3,'anonymousUser','2015-08-29 22:21:27','AUTHORIZATION_FAILURE'),(4,'anonymousUser','2015-08-29 22:21:27','AUTHORIZATION_FAILURE'),(5,'anonymousUser','2015-08-29 22:21:51','AUTHORIZATION_FAILURE'),(6,'anonymousUser','2015-08-29 22:21:51','AUTHORIZATION_FAILURE'),(7,'anonymousUser','2015-08-29 22:21:51','AUTHORIZATION_FAILURE'),(8,'anonymousUser','2015-08-29 22:22:06','AUTHORIZATION_FAILURE'),(9,'anonymousUser','2015-08-29 22:22:06','AUTHORIZATION_FAILURE'),(10,'anonymousUser','2015-08-29 22:22:06','AUTHORIZATION_FAILURE');
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_PERSISTENT_AUDIT_EVT_DATA`
--

DROP TABLE IF EXISTS `T_PERSISTENT_AUDIT_EVT_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_PERSISTENT_AUDIT_EVT_DATA` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`event_id`,`name`),
  KEY `idx_persistent_audit_evt_data` (`event_id`),
  CONSTRAINT `fk_evt_pers_audit_evt_data` FOREIGN KEY (`event_id`) REFERENCES `T_PERSISTENT_AUDIT_EVENT` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_PERSISTENT_AUDIT_EVT_DATA`
--

LOCK TABLES `T_PERSISTENT_AUDIT_EVT_DATA` WRITE;
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVT_DATA` DISABLE KEYS */;
INSERT INTO `T_PERSISTENT_AUDIT_EVT_DATA` VALUES (2,'message','Access is denied'),(2,'type','org.springframework.security.access.AccessDeniedException'),(3,'message','Access is denied'),(3,'type','org.springframework.security.access.AccessDeniedException'),(4,'message','Access is denied'),(4,'type','org.springframework.security.access.AccessDeniedException'),(5,'message','Access is denied'),(5,'type','org.springframework.security.access.AccessDeniedException'),(6,'message','Access is denied'),(6,'type','org.springframework.security.access.AccessDeniedException'),(7,'message','Access is denied'),(7,'type','org.springframework.security.access.AccessDeniedException'),(8,'message','Access is denied'),(8,'type','org.springframework.security.access.AccessDeniedException'),(9,'message','Access is denied'),(9,'type','org.springframework.security.access.AccessDeniedException'),(10,'message','Access is denied'),(10,'type','org.springframework.security.access.AccessDeniedException');
/*!40000 ALTER TABLE `T_PERSISTENT_AUDIT_EVT_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_USER`
--

DROP TABLE IF EXISTS `T_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_USER` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `activated` bit(1) NOT NULL,
  `lang_key` varchar(5) DEFAULT NULL,
  `created_by` varchar(50) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_modified_by` varchar(50) DEFAULT NULL,
  `last_modified_date` timestamp NULL DEFAULT NULL,
  `activation_key` varchar(25) DEFAULT NULL,
  `reset_key` varchar(20) DEFAULT NULL,
  `reset_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  KEY `idx_user_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_USER`
--

LOCK TABLES `T_USER` WRITE;
/*!40000 ALTER TABLE `T_USER` DISABLE KEYS */;
INSERT INTO `T_USER` VALUES (1,'system','$2a$10$mE.qmcV0mFU5NcKh73TZx.z4ueI/.bDWbj0T1BYyqP481kGGarKLG','System','System','system@localhost','','en','system','2015-08-29 22:17:44','system','2015-08-29 22:11:45',NULL,NULL,NULL),(2,'anonymousUser','$2a$10$j8S5d7Sr7.8VTOYNviDPOeWX8KcYILUVJBsYV83Y5NtECayypx9lO','Anonymous','User','anonymous@localhost','','en','system','2015-08-29 22:17:44','system','2015-08-29 22:11:45',NULL,NULL,NULL),(3,'admin','$2a$10$gSAhZrxMllrbgj/kkK9UceBPpChGWJA7SYIb1Mqo.n5aNLq1/oRrC','Administrator','Administrator','admin@localhost','','en','system','2015-08-29 22:17:44','system','2015-08-29 22:11:45',NULL,NULL,NULL),(4,'user','$2a$10$VEjxo0jq2YG9Rbk2HmX9S.k1uZBGYUHdUcid3g/vfiEl7lwWgOH/K','User','User','user@localhost','','en','system','2015-08-29 22:17:44','system','2015-08-29 22:11:45',NULL,NULL,NULL);
/*!40000 ALTER TABLE `T_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `T_USER_AUTHORITY`
--

DROP TABLE IF EXISTS `T_USER_AUTHORITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `T_USER_AUTHORITY` (
  `user_id` bigint(20) NOT NULL,
  `authority_name` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`,`authority_name`),
  KEY `fk_authority_name` (`authority_name`),
  CONSTRAINT `fk_authority_name` FOREIGN KEY (`authority_name`) REFERENCES `T_AUTHORITY` (`name`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `T_USER` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `T_USER_AUTHORITY`
--

LOCK TABLES `T_USER_AUTHORITY` WRITE;
/*!40000 ALTER TABLE `T_USER_AUTHORITY` DISABLE KEYS */;
INSERT INTO `T_USER_AUTHORITY` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_ADMIN'),(1,'ROLE_USER'),(3,'ROLE_USER'),(4,'ROLE_USER');
/*!40000 ALTER TABLE `T_USER_AUTHORITY` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-29 22:54:06
