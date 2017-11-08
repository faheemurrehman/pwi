-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: pwi
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

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
-- Table structure for table `Brands`
--

DROP TABLE IF EXISTS `Brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brands` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Desc` varchar(45) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Brands_1_idx` (`Company_ID`),
  CONSTRAINT `fk_Brands_1` FOREIGN KEY (`Company_ID`) REFERENCES `Company` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brands`
--

LOCK TABLES `Brands` WRITE;
/*!40000 ALTER TABLE `Brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `Brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyLocations`
--

DROP TABLE IF EXISTS `CompanyLocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyLocations` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) DEFAULT NULL,
  `Zip` varchar(45) DEFAULT NULL,
  `Company_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_CompanyLocation_1_idx` (`Company_ID`),
  CONSTRAINT `fk_CompanyLocation_1` FOREIGN KEY (`Company_ID`) REFERENCES `Company` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyLocations`
--

LOCK TABLES `CompanyLocations` WRITE;
/*!40000 ALTER TABLE `CompanyLocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `CompanyLocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductSizes`
--

DROP TABLE IF EXISTS `ProductSizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductSizes` (
  `ID` int(11) NOT NULL,
  `Size` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductSizes`
--

LOCK TABLES `ProductSizes` WRITE;
/*!40000 ALTER TABLE `ProductSizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductSizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductTypes`
--

DROP TABLE IF EXISTS `ProductTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductTypes` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `ProductTypecol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductTypes`
--

LOCK TABLES `ProductTypes` WRITE;
/*!40000 ALTER TABLE `ProductTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProductTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Products` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Desc` varchar(45) DEFAULT NULL,
  `InStock` int(11) DEFAULT NULL,
  `AvailableQty` int(11) DEFAULT NULL,
  `InTransit` int(11) DEFAULT NULL,
  `Moq` int(11) DEFAULT NULL,
  `Qpb` int(11) DEFAULT NULL,
  `ReorderPoint` int(11) DEFAULT NULL,
  `Warehouse_ID` int(11) DEFAULT NULL,
  `ProductType_ID` int(11) DEFAULT NULL,
  `ProductSize_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Products_1_idx` (`Warehouse_ID`),
  KEY `fk_Products_2_idx` (`ProductType_ID`),
  KEY `fk_Products_3_idx` (`ProductSize_ID`),
  CONSTRAINT `fk_Products_1` FOREIGN KEY (`Warehouse_ID`) REFERENCES `Warehouses` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_2` FOREIGN KEY (`ProductType_ID`) REFERENCES `ProductTypes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_3` FOREIGN KEY (`ProductSize_ID`) REFERENCES `ProductSizes` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Warehouses`
--

DROP TABLE IF EXISTS `Warehouses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Warehouses` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Desc` varchar(45) DEFAULT NULL,
  `CompanyLocation_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_Warehouses_1_idx` (`CompanyLocation_ID`),
  CONSTRAINT `fk_Warehouses_1` FOREIGN KEY (`CompanyLocation_ID`) REFERENCES `CompanyLocations` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Warehouses`
--

LOCK TABLES `Warehouses` WRITE;
/*!40000 ALTER TABLE `Warehouses` DISABLE KEYS */;
/*!40000 ALTER TABLE `Warehouses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-08  3:07:52
