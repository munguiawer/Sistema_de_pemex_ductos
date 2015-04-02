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
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proyectos` (
  `idProyectos` int(11) NOT NULL AUTO_INCREMENT,
  `PlMantPrv` int(11) NOT NULL,
  `PosPM` int(11) NOT NULL,
  `PtoTrbRes` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `PtoTbjoOp` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Orden` int(11) NOT NULL,
  `Cl` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Textobreve` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Textbreveoperacion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `UbicacionTecnica` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `Incextr` date NOT NULL,
  `Feinreal` date DEFAULT NULL,
  `fecFinReal` date DEFAULT NULL,
  `Feentrada` date NOT NULL,
  `Finextr` date NOT NULL,
  `Liber` date DEFAULT NULL,
  `Finreal` date DEFAULT NULL,
  `Finprogr` date NOT NULL,
  `Estado` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`idProyectos`,`PtoTrbRes`),
  KEY `fk_Proyectos_3_idx` (`PtoTrbRes`),
  CONSTRAINT `fk_Proyectos_1` FOREIGN KEY (`PtoTrbRes`) REFERENCES `areas` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-25  1:33:47
