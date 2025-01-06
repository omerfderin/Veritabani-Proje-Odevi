-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: vtys
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Current Database: `vtys`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vtys` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vtys`;

--
-- Table structure for table `calisanlar`
--

DROP TABLE IF EXISTS `calisanlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calisanlar` (
  `cID` int NOT NULL AUTO_INCREMENT,
  `cAdSoyad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calisanlar`
--

LOCK TABLES `calisanlar` WRITE;
/*!40000 ALTER TABLE `calisanlar` DISABLE KEYS */;
INSERT INTO `calisanlar` VALUES (1,'Batuhan Aydin'),(2,'Omer Faruk Derin'),(3,'Mahmut Ozturk');
/*!40000 ALTER TABLE `calisanlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gorev`
--

DROP TABLE IF EXISTS `gorev`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gorev` (
  `gID` int NOT NULL AUTO_INCREMENT,
  `gBaslaTarih` date NOT NULL,
  `gBitisTarih` date NOT NULL,
  `gAdamGun` smallint NOT NULL DEFAULT '1',
  `gDurum` enum('Tamamlanacak','Devam Ediyor','Tamamlandı') NOT NULL DEFAULT 'Tamamlanacak',
  `Calisanlar_cID` int NOT NULL,
  `Proje_pID` int NOT NULL,
  PRIMARY KEY (`gID`),
  UNIQUE KEY `gID_UNIQUE` (`gID`),
  KEY `fk_Gorev_Calisanlar1_idx` (`Calisanlar_cID`),
  KEY `fk_Gorev_Proje1_idx` (`Proje_pID`),
  CONSTRAINT `fk_Gorev_Calisanlar1` FOREIGN KEY (`Calisanlar_cID`) REFERENCES `calisanlar` (`cID`),
  CONSTRAINT `fk_Gorev_Proje1` FOREIGN KEY (`Proje_pID`) REFERENCES `proje` (`pID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gorev`
--

LOCK TABLES `gorev` WRITE;
/*!40000 ALTER TABLE `gorev` DISABLE KEYS */;
INSERT INTO `gorev` VALUES (18,'2025-02-15','2025-02-20',5,'Tamamlanacak',2,8),(19,'2024-12-20','2025-01-10',21,'Devam Ediyor',1,8),(20,'2024-12-10','2024-12-28',18,'Tamamlandı',3,8),(21,'2024-12-01','2024-12-11',10,'Tamamlandı',1,8),(22,'2024-12-22','2024-12-26',4,'Tamamlandı',3,9),(24,'2024-12-18','2024-12-26',8,'Tamamlandı',1,11);
/*!40000 ALTER TABLE `gorev` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanici` (
  `kID` int NOT NULL AUTO_INCREMENT,
  `kEmail` varchar(45) NOT NULL,
  `kSifre` varchar(45) NOT NULL,
  PRIMARY KEY (`kID`),
  UNIQUE KEY `kID_UNIQUE` (`kID`),
  UNIQUE KEY `kEmail_UNIQUE` (`kEmail`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES `kullanici` WRITE;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
INSERT INTO `kullanici` VALUES (1,'bados5561@gmail.com','ozzy5561!2');
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proje`
--

DROP TABLE IF EXISTS `proje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proje` (
  `pID` int NOT NULL AUTO_INCREMENT,
  `pAd` varchar(25) NOT NULL,
  `pBaslaTarih` date NOT NULL,
  `pBitisTarih` date NOT NULL,
  `pGecikmeSure` smallint DEFAULT '0',
  `Kullanici_kID` int NOT NULL,
  PRIMARY KEY (`pID`),
  UNIQUE KEY `pID_UNIQUE` (`pID`),
  KEY `fk_Proje_Kullanici1_idx` (`Kullanici_kID`),
  CONSTRAINT `fk_Proje_Kullanici1` FOREIGN KEY (`Kullanici_kID`) REFERENCES `kullanici` (`kID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proje`
--

LOCK TABLES `proje` WRITE;
/*!40000 ALTER TABLE `proje` DISABLE KEYS */;
INSERT INTO `proje` VALUES (8,'VTYS','2024-11-01','2025-06-30',0,1),(9,'MOBIL','2024-10-20','2024-12-25',0,1),(10,'ARAYÜZ','2025-01-02','2025-01-05',0,1),(11,'asd','2024-12-12','2024-12-26',0,1);
/*!40000 ALTER TABLE `proje` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-06 13:32:48
