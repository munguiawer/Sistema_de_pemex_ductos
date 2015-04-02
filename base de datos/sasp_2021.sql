CREATE DATABASE  IF NOT EXISTS `sasp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `sasp`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: sasp
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
-- Table structure for table `2021`
--

DROP TABLE IF EXISTS `2021`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `2021` (
  `iddatos` int(11) NOT NULL AUTO_INCREMENT,
  `centro_de_trabajo` varchar(45) NOT NULL,
  `guia_Tecnica` varchar(45) NOT NULL,
  `indicador` varchar(45) NOT NULL,
  `descripsion` varchar(45) NOT NULL,
  `periodo` varchar(45) NOT NULL,
  `enero` float DEFAULT NULL,
  `febrero` float DEFAULT NULL,
  `marzo` float DEFAULT NULL,
  `abril` float DEFAULT NULL,
  `mayo` float DEFAULT NULL,
  `junio` float DEFAULT NULL,
  `julio` float DEFAULT NULL,
  `agosto` float DEFAULT NULL,
  `septiembre` float DEFAULT NULL,
  `octubre` float DEFAULT NULL,
  `noviembre` float DEFAULT NULL,
  `diciembre` float DEFAULT NULL,
  PRIMARY KEY (`iddatos`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `2021`
--

LOCK TABLES `2021` WRITE;
/*!40000 ALTER TABLE `2021` DISABLE KEYS */;
INSERT INTO `2021` VALUES (85,'PGPB SDUC. MINATITLAN','2.5.2','PESF','Porcentual de equipos de seguridad que no fun','Mensual',0,0,0,0,0,0,0,0,0,0,0,0),(86,'PGPB SDUC. MINATITLAN','2.7.1','CIPP','Cumplimiento inspección y pruebas','Mensual',0,0,0,0,0,0,0,0,0,0,0,0),(87,'PGPB SDUC. MINATITLAN','2.7.10','ICU','Cumplimiento de ciclos de trabajo','Semestral',0,0,0,0,0,0,0,0,0,0,0,0),(88,'PGPB SDUC. MINATITLAN','2.7.11','CAE','Cambios apropiadamente ejecutados','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(89,'PGPB SDUC. MINATITLAN','2.7.12','CSEG','Cambios seguros','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(90,'PGPB SDUC. MINATITLAN','2.7.13','IA','Indice de auditorias','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(91,'PGPB SDUC. MINATITLAN','2.7.14','RDA','Recomendaciones derivadas de auditorias','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(92,'PGPB SDUC. MINATITLAN','2.7.15','NCRC','No conformidades de auditorias clasificadas c','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(93,'PGPB SDUC. MINATITLAN','2.7.16','EAC','Efectividad de acciones correctivas','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(94,'PGPB SDUC. MINATITLAN','2.7.17','IARP','Indice de análisis de riesgos','Semestral',0,0,0,0,0,0,0,0,0,0,0,0),(95,'PGPB SDUC. MINATITLAN','2.7.18','DGC','Desempeño global de contratistas','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(96,'PGPB SDUC. MINATITLAN','2.7.18','IARA','Atención a recomendación de auditorias contra','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(97,'PGPB SDUC. MINATITLAN','2.7.19','IARI','Indice de Atención de Recomendaciones de Inci','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(98,'PGPB SDUC. MINATITLAN','2.7.2','RCIM','Atención a los riesgos críticos de integ. mec','Mensual',0,0,0,0,0,0,0,0,0,0,0,0),(99,'PGPB SDUC. MINATITLAN','2.7.20','CPC','Cambios de personal que cumplen con los proce','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(100,'PGPB SDUC. MINATITLAN','2.7.3','SREP','Simulacros de respuesta a emergencias','Mensual',0,0,0,0,0,0,0,0,0,0,0,0),(101,'PGPB SDUC. MINATITLAN','2.7.4','TCMC','Trabajadores que cumplen con la matriz de con','Semestral',0,0,0,0,0,0,0,0,0,0,0,0),(102,'PGPB SDUC. MINATITLAN','2.7.5','DGASP','Desempeño global de ASP','Trimestral',0,0,0,0,0,0,0,0,0,0,0,0),(103,'PGPB SDUC. MINATITLAN','2.7.6','IPTP','Paquete de tecnología actualizada y disponibl','Semestral',0,0,0,0,0,0,0,0,0,0,0,0),(104,'PGPB SDUC. MINATITLAN','2.7.7','IDI','Procedimientos de ASP disponibles','Semestral',0,0,0,0,0,0,0,0,0,0,0,0),(105,'PGPB SDUC. MINATITLAN','2.7.8','ICA','Procedimientos de ASP con calidad','Semestral',0,0,0,0,0,0,0,0,0,0,0,0),(106,'PGPB SDUC. MINATITLAN','2.7.9','ICO','Comunicación de los procesos de ASP','Semestral',0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `2021` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-25  1:33:38
