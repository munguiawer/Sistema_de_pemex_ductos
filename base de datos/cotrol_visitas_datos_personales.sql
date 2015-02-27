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
-- Table structure for table `datos_personales`
--

DROP TABLE IF EXISTS `datos_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_personales` (
  `id_dp` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(45) NOT NULL,
  `nombre_de_unidad` varchar(45) NOT NULL,
  `responsable_de_unidad` varchar(45) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `turnos_id_turn` int(11) NOT NULL,
  `tipo_de_hospital_id_th` int(11) NOT NULL,
  PRIMARY KEY (`id_dp`),
  KEY `fk_datos_personales_turnos1_idx` (`turnos_id_turn`),
  KEY `fk_datos_personales_tipo_de_hospital1_idx` (`tipo_de_hospital_id_th`),
  CONSTRAINT `fk_datos_personales_tipo_de_hospital1` FOREIGN KEY (`tipo_de_hospital_id_th`) REFERENCES `tipo_de_hospital` (`id_th`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_datos_personales_turnos1` FOREIGN KEY (`turnos_id_turn`) REFERENCES `turnos` (`id_turn`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_personales`
--

LOCK TABLES `datos_personales` WRITE;
/*!40000 ALTER TABLE `datos_personales` DISABLE KEYS */;
INSERT INTO `datos_personales` VALUES (23,'awdawd','awdaw','wd','awdaw',1,1),(25,'sad','sad','asd','sad',1,1),(26,'sad','asd','asd','asd',1,1),(27,'asddas','asdas','adas','sadasd',1,1),(28,'minatitlan','nose','doc','calle',4,9),(29,'mina','dw','wdw','dddddddddddd',2,1),(30,'jose','asd','asd','sdasdasd',2,3),(31,'mina','sd','sad','sssss',3,1),(32,'asda','asd','asd','asd',1,1),(33,'asdas','asd','asd','asdasd',1,1),(34,'sdf','sdf','sdf','dfsdf',1,1),(35,'awdaw','awdaw','awd','awdaw',2,1),(36,'wdawd','awdw','wadaw','awdawd',2,2),(37,'asd','asd','sad','asda',1,1),(38,'wad','awd','awd','wdwa',3,3),(39,'sdasda','asd','asd','sad',1,1),(40,'asdasd','ads','asd','asd',2,1),(41,'minatitlan','sacatenco','jose luis munfuia','calle #4',2,1),(42,'coatzacoalcos','nose','jose','num asasas',3,8),(43,'mina','asd','asd','asdasd',1,2),(44,'coatza','asdasd','asdas','adasdsd',2,3),(45,'as','asd','asd','asd',1,1),(46,'sfsdf','sdf','sdf','dsfsdf',2,2),(47,'awd','wd','awd','awdawd',1,1),(48,'adaaaaaaaaaaaaaaaaaa','ad','awd','awdad',1,1),(49,'ddzc','zsf','zsf','sf',2,4),(50,'zxsdf','zsf','szf','zsfszf',1,2),(51,'awd','awd','wadaw','awdawd',1,1),(52,'minatitlan','medica','asas','sadsdasd',1,2),(53,'minattlan','nose','sds','sds',2,4),(54,'asd','asd','asd','asd',2,1);
/*!40000 ALTER TABLE `datos_personales` ENABLE KEYS */;
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
