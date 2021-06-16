-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: localhost    Database: academics
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Current Database: `academics`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `academics` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `academics`;

--
-- Table structure for table `assignments`
--

DROP TABLE IF EXISTS `assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignments` (
  `assignment_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `due` date DEFAULT NULL,
  `CAgrade` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`assignment_name`),
  KEY `fkmod_id_idx` (`module_id`),
  KEY `fkmodule_id_idx` (`module_id`),
  CONSTRAINT `fkmodule_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignments`
--

LOCK TABLES `assignments` WRITE;
/*!40000 ALTER TABLE `assignments` DISABLE KEYS */;
INSERT INTO `assignments` VALUES ('C cycle essay','MI203','2020-10-07',62.00),('Essay','ZO209','2020-10-04',72.00),('Homework 3','CT201','2020-11-22',68.00),('Lab 3','CS211','2020-11-12',71.00),('Lab Report','MI204','2020-09-22',68.00),('Practical 1','ZO208','2020-09-08',85.00);
/*!40000 ALTER TABLE `assignments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `currentyear`
--

DROP TABLE IF EXISTS `currentyear`;
/*!50001 DROP VIEW IF EXISTS `currentyear`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `currentyear` AS SELECT 
 1 AS `Module Name`,
 1 AS `Module id`,
 1 AS `Lecturer id`,
 1 AS `Lecturer name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grades`
--

DROP TABLE IF EXISTS `grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `examgrade` decimal(4,2) NOT NULL,
  `mod_id` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passed` tinyint DEFAULT NULL,
  PRIMARY KEY (`examgrade`),
  KEY `FKmod_id_idx` (`mod_id`),
  CONSTRAINT `FKmod_id` FOREIGN KEY (`mod_id`) REFERENCES `modules` (`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grades`
--

LOCK TABLES `grades` WRITE;
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
INSERT INTO `grades` VALUES (54.00,'MI203',NULL),(66.00,'ZO209',NULL),(69.00,'CT201',NULL),(71.00,'CS211',NULL),(72.00,'ZO208',NULL),(81.00,'MI204',NULL),(83.00,'CT101',NULL);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `lecturer_id` int NOT NULL,
  `lecturer_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `office_num` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lecturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (128955,'Dr Vincent Flaherty','vflaherty@nuig.ie','115MI'),(225698,'Dr Kevin Healy','khealey@nuig.ie','202ZO'),(300254,'Dr Katrina Lacey ','klacey@nuig.ie','365MI'),(322065,'Dr Niall Madden','nmadden@nuig.ie','522IT'),(987452,'Dr Seamus Hill','shill@nuig.ie','621IT');
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `mod_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `module_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `credits` int DEFAULT NULL,
  `lecturer_id` int DEFAULT NULL,
  `grade` decimal(4,2) DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`mod_id`),
  KEY `fklect_id_idx` (`lecturer_id`),
  CONSTRAINT `fklect_id` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`lecturer_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES ('CS211','\"Programming & Operating Systems\"',5,322065,62.00,2),('CT101','\"Intro to Java\"',5,987452,72.66,1),('CT201','\"Object Oriented Programming\"',5,987452,83.20,2),('MI102','Intro to Microbiology',5,300254,64.00,1),('MI203','\"Microbes & the Environment\"',5,128955,74.33,2),('MI204','\"Lab Skills\"',5,300254,82.25,2),('ZO208','\"Invertebrate Zoology\"',5,225698,67.50,2),('ZO209','\"Vertebrate Zoology\"',5,225698,75.00,2);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `practicals`
--

DROP TABLE IF EXISTS `practicals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `practicals` (
  `practical_id` int NOT NULL,
  `mod_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `practical_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lab` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`practical_id`),
  KEY `mod_id_idx` (`mod_id`),
  CONSTRAINT `mod_id` FOREIGN KEY (`mod_id`) REFERENCES `modules` (`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `practicals`
--

LOCK TABLES `practicals` WRITE;
/*!40000 ALTER TABLE `practicals` DISABLE KEYS */;
INSERT INTO `practicals` VALUES (1,'ZO208','Annelids','230A'),(2,'ZO208','Nematodes','231B'),(3,'ZO208','Molluscs','230A'),(4,'ZO208','Echinodermata','230A'),(5,'ZO209','Fish','231B'),(6,'ZO209','Reptiles','230A'),(7,'ZO209','Mammals','230A'),(8,'MI204','E.coli','140S'),(9,'MI204','Water testing','140S'),(10,'MI204','Disease','140S');
/*!40000 ALTER TABLE `practicals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `showgrades`
--

DROP TABLE IF EXISTS `showgrades`;
/*!50001 DROP VIEW IF EXISTS `showgrades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `showgrades` AS SELECT 
 1 AS `Module id`,
 1 AS `Module name`,
 1 AS `Exam Grade`,
 1 AS `CA grade`*/;
SET character_set_client = @saved_cs_client;

--
-- Current Database: `academics`
--

USE `academics`;

--
-- Final view structure for view `currentyear`
--

/*!50001 DROP VIEW IF EXISTS `currentyear`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `currentyear` AS select `m`.`module_name` AS `Module Name`,`m`.`mod_id` AS `Module id`,`m`.`lecturer_id` AS `Lecturer id`,`l`.`lecturer_name` AS `Lecturer name` from (`lecturers` `l` left join `modules` `m` on((`m`.`lecturer_id` = `l`.`lecturer_id`))) where (`m`.`year` = 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `showgrades`
--

/*!50001 DROP VIEW IF EXISTS `showgrades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `showgrades` AS select `g`.`mod_id` AS `Module id`,`m`.`module_name` AS `Module name`,`g`.`examgrade` AS `Exam Grade`,`a`.`CAgrade` AS `CA grade` from ((`grades` `g` left join `modules` `m` on((`m`.`mod_id` = `g`.`mod_id`))) join `assignments` `a` on((`m`.`mod_id` = `a`.`module_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-09 16:36:42
