CREATE DATABASE  IF NOT EXISTS `pemexqbs` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `pemexqbs`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: pemexqbs
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
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitas` (
  `idvisitas` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ingreso` date NOT NULL,
  `tiempo` int(11) NOT NULL,
  PRIMARY KEY (`idvisitas`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` VALUES (1,'jose luis','2014-11-02',30),(2,'jose luis','2014-11-02',0),(3,'toÃ±o','2014-11-02',1),(4,'jose luis','2014-11-02',47),(5,'jose luis','2014-11-03',21),(6,'jose luis','2014-11-03',0),(7,'jose luis','2014-11-03',8),(8,'jose luis','2014-11-03',8),(9,'jose luis','2014-11-03',0),(10,'jose luis','2014-11-03',0),(11,'jose luis','2014-11-03',11),(12,'jose luis','2014-11-03',0),(13,'jose luis','2014-11-03',1),(14,'jose luis','2014-11-03',0),(15,'ana','2014-11-03',0),(16,'jose luis','2014-11-12',2),(17,'jose luis','2014-11-19',10),(18,'jose luis','2014-11-21',12),(19,'jose luis','2014-11-21',8),(20,'jose luis','2014-11-21',3),(21,'jose luis','2014-11-21',6),(22,'jose luis','2014-11-24',50),(23,'jose luis','2014-11-24',38),(24,'jose luis','2014-11-25',6),(25,'admin','2014-11-25',15),(26,'jose luis','2014-11-25',7),(27,'jose luis','2014-11-25',0),(28,'jose luis','2014-11-25',0),(29,'jose luis','2014-11-25',1),(30,'jose luis','2014-11-25',1),(31,'jose luis','2014-11-25',12),(32,'jose luis','2014-11-25',1),(33,'jose luis','2014-11-25',1),(34,'jose luis','2014-11-25',2),(35,'jose luis','2014-11-25',0),(36,'admin','2014-11-25',24),(37,'jose luis','2014-11-25',26),(38,'jose luis','2014-11-26',164),(39,'jose luis','2014-11-27',164),(40,'jose luis','2014-12-30',51),(41,'jose luis','2014-12-30',0),(42,'admin','2014-12-30',0),(43,'toÃ±o','2014-12-30',0),(44,'jose luis','2014-12-30',3),(45,'admin','2014-12-30',9),(46,'jose luis','2014-12-30',22),(47,'jose luis','2014-12-31',7),(48,'jose luis','2014-12-31',0),(49,'daniela','2014-12-31',1),(50,'munguia','2014-12-31',0),(51,'munguia','2014-12-31',0),(52,'munguia','2014-12-31',1),(53,'nuevo','2014-12-31',0),(54,'jose luis','2014-12-31',48),(55,'jose luis','2014-12-31',5),(56,'jose luis','2014-12-31',25),(57,'jose luis','2014-12-31',1),(58,'jose luis','2014-12-31',0),(59,'jose luis','2014-12-31',0),(60,'jose luis','2014-12-31',240),(61,'admin','2014-12-31',0),(62,'506343','2014-12-31',5),(63,'jose luis','2014-12-31',0),(64,'usuario','2014-12-31',3),(65,'usuario','2014-12-31',0),(66,'jose luis','2015-01-01',25),(67,'jose','2015-01-02',3),(68,'jose luis','2015-01-02',2),(69,'jose luis','2015-01-02',31),(70,'jose luis','2015-01-02',42),(71,'jose luis','2015-01-02',2),(72,'tania','2015-01-02',0),(73,'jose luis','2015-01-02',0),(74,'tania','2015-01-02',0),(75,'jose luis','2015-01-02',3),(76,'506343','2015-01-02',1),(77,'jose luis','2015-01-02',3),(78,'jose luis','2015-01-02',4),(79,'jose luis','2015-01-02',4),(80,'jose luis','2015-01-02',0),(81,'jose luis','2015-01-02',0),(82,'jose luis','2015-01-03',72),(83,'jose luis','2015-01-03',170),(84,'jose luis','2015-01-03',64),(85,'jose luis','2015-01-05',102),(86,'jose luis','2015-01-05',36),(87,'jose luis','2015-01-05',18),(88,'jose luis','2015-01-05',0),(89,'usuario','2015-01-05',0),(90,'usuario','2015-01-05',2),(91,'432887','2015-01-06',22),(92,'jose luis','2015-01-06',34),(93,'jose luis','2015-01-22',21),(94,'jose luis','2015-01-29',266),(95,'jose luis','2015-01-31',30),(96,'jose luis','2015-01-31',8),(97,'jose luis','2015-02-03',1),(98,'jose luis','2015-02-03',13),(99,'jose luis','2015-02-03',0),(100,'jose luis','2015-02-11',2),(101,'jose luis','2015-02-16',9),(102,'178330','2015-02-16',2),(103,'jose luis','2015-02-22',96),(104,'jose luis','2015-02-22',0),(105,'jose luis','2015-02-22',2),(106,'506343','2015-02-22',6),(107,'jose luis','2015-02-22',1),(108,'jose luis','2015-02-22',3),(109,'jose luis','2015-02-22',2),(110,'jose luis','2015-02-22',26),(111,'jose luis','2015-02-23',29);
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-25  1:33:49
