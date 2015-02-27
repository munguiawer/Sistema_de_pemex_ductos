CREATE DATABASE  IF NOT EXISTS `cotrol_visitas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cotrol_visitas`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: cotrol_visitas
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
-- Table structure for table `telefonos`
--

DROP TABLE IF EXISTS `telefonos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefonos` (
  `id_tel` int(11) NOT NULL AUTO_INCREMENT,
  `datos_personales_to_id_dp` int(11) NOT NULL,
  `telefonos` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tel`),
  KEY `fk_telefonos_datos_personales_idx` (`datos_personales_to_id_dp`),
  CONSTRAINT `fk_telefonos_datos_personales` FOREIGN KEY (`datos_personales_to_id_dp`) REFERENCES `datos_personales` (`id_dp`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefonos`
--

LOCK TABLES `telefonos` WRITE;
/*!40000 ALTER TABLE `telefonos` DISABLE KEYS */;
INSERT INTO `telefonos` VALUES (15,23,'(+00)(000) 000-0000'),(16,25,'(+00)(000) 000-0000'),(17,26,'(+00)(000) 000-0000'),(18,27,'(+00)(000) 000-0000'),(19,28,'(+52)(921) 200-0090'),(20,29,'(+33)(333) 333-3333'),(21,30,'(+33)(333) 333-3333'),(22,31,'(+44)(444) 444-4444'),(23,32,'(+00)(000) 000-0000'),(24,33,'(+00)(000) 000-0000'),(25,34,'(+00)(000) 000-0000'),(26,35,'(+55)(555) 555-5555'),(27,36,'(+55)(555) 555-5555'),(28,37,'(+44)(444) 444-4444'),(29,38,'(+44)(444) 444-4444'),(30,39,'(+55)(555) 555-5555'),(31,40,'(+44)(444) 444-4444'),(32,41,'(+52)(921) 200-0090'),(33,42,'(+52)(921) 200-0900'),(34,43,'(+25)(255) 555-5555'),(35,44,'(+52)(921) 200-0000'),(36,45,'(+00)(000) 000-0000'),(37,46,'(+00)(000) 000-0000'),(38,47,'(+00)(000) 000-0000'),(39,48,'(+00)(000) 000-0000'),(40,49,'(+33)(333) 333-3333'),(41,50,'(+33)(333) 333-3333'),(42,51,'(+52)(921) 200-0090'),(43,52,'(+52)(922) 120-1201'),(44,53,'(+00)(000) 000-0000'),(45,54,'(+00)(000) 000-0000');
/*!40000 ALTER TABLE `telefonos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-27 13:40:05
