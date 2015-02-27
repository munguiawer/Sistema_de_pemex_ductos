CREATE DATABASE  IF NOT EXISTS `valvulas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `valvulas`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: valvulas
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `valvserm`
--

DROP TABLE IF EXISTS `valvserm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valvserm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mes` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `enero` int(11) DEFAULT NULL,
  `febrero` int(11) DEFAULT NULL,
  `marzo` int(11) DEFAULT NULL,
  `abril` int(11) DEFAULT NULL,
  `mayo` int(11) DEFAULT NULL,
  `junio` int(11) DEFAULT NULL,
  `julio` int(11) DEFAULT NULL,
  `agosto` int(11) DEFAULT NULL,
  `septiembre` int(11) DEFAULT NULL,
  `octubre` int(11) DEFAULT NULL,
  `noviembre` int(11) DEFAULT NULL,
  `diciembre` int(11) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valvserm`
--

LOCK TABLES `valvserm` WRITE;
/*!40000 ALTER TABLE `valvserm` DISABLE KEYS */;
INSERT INTO `valvserm` VALUES (1,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1990),(2,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1991),(3,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1992),(4,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1993),(5,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1994),(6,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1995),(7,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1996),(8,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1997),(9,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1998),(10,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,1999),(11,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2000),(12,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2001),(13,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2002),(14,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2003),(15,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2004),(16,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2005),(17,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2006),(18,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2007),(19,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2008),(20,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2009),(21,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2010),(22,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2011),(23,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2012),(24,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2013),(25,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2014),(26,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2015),(27,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2016),(28,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2017),(29,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2018),(30,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2019),(31,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2020),(32,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2021),(33,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2022),(34,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2023),(35,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2024),(36,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2025),(37,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2026),(38,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2027),(39,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2028),(40,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2029),(41,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2030),(42,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2031),(43,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2032),(44,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2033),(45,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2034),(46,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2035),(47,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2036),(48,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2037),(49,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2038),(50,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2039),(51,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2040),(52,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2041),(53,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2042),(54,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2043),(55,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2044),(56,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2045),(57,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2046),(58,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2047),(59,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2048),(60,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2049),(61,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2050),(62,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2051),(63,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2052),(64,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2053),(65,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2054),(66,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2055),(67,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2056),(68,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2057),(69,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2058),(70,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2059),(71,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2060),(72,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2061),(73,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2062),(74,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2063),(75,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2064),(76,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2065),(77,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2066),(78,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2067),(79,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2068),(80,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2069),(81,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2070),(82,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2071),(83,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2072),(84,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2073),(85,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2074),(86,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2075),(87,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2076),(88,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2077),(89,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2078),(90,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2079),(91,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2080),(92,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2081),(93,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2082),(94,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2083),(95,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2084),(96,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2085),(97,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2086),(98,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2087),(99,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2088),(100,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2089),(101,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2090),(102,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2091),(103,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2092),(104,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2093),(105,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2094),(106,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2095),(107,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2096),(108,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2097),(109,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2098),(110,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2099),(111,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2100),(112,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2101),(113,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2102),(114,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2103),(115,'Programado',0,0,0,0,0,0,0,0,0,0,0,0,2104);
/*!40000 ALTER TABLE `valvserm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-27 13:40:06
