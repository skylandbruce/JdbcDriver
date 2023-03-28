CREATE DATABASE  IF NOT EXISTS `test_query` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test_query`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: test_query
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `c_idx` int NOT NULL AUTO_INCREMENT,
  `c_id` varchar(45) DEFAULT NULL,
  `c_age` varchar(45) DEFAULT NULL,
  `c_name` varchar(45) DEFAULT NULL,
  `c_addr` varchar(45) DEFAULT NULL,
  `c_point` int DEFAULT NULL,
  `c_join_date` datetime DEFAULT NULL,
  `c_login_date` datetime DEFAULT NULL,
  `c_grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`c_idx`),
  UNIQUE KEY `c_idx_UNIQUE` (`c_idx`),
  UNIQUE KEY `c_id_UNIQUE` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'lion','28','사자','부산 해운대',0,'2022-11-13 00:00:00','2023-01-14 00:00:00',NULL),(2,'duck','18','오리','전남 거제',100,'2022-08-05 00:00:00','2023-01-13 00:00:00',NULL),(3,'cat','22','고양이','대구 동구',200,'2023-01-12 00:00:00','2023-01-12 00:00:00',NULL),(4,'turtle','52','거북','경기도 의왕',300,'2021-05-22 00:00:00','2023-01-11 00:00:00',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maker`
--

DROP TABLE IF EXISTS `maker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maker` (
  `m_code` varchar(45) NOT NULL,
  `m_name` varchar(45) DEFAULT NULL,
  `m_location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`m_code`),
  UNIQUE KEY `m_code_UNIQUE` (`m_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maker`
--

LOCK TABLES `maker` WRITE;
/*!40000 ALTER TABLE `maker` DISABLE KEYS */;
INSERT INTO `maker` VALUES ('m01','maker01','korea'),('m02','maker02','china'),('m03','maker03','japan');
/*!40000 ALTER TABLE `maker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `o_idx` int NOT NULL AUTO_INCREMENT,
  `c_id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `o_date` datetime DEFAULT NULL,
  `o_count` double DEFAULT NULL,
  `p_code` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`o_idx`),
  UNIQUE KEY `o_idx_UNIQUE` (`o_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'한글','2022-01-13 00:00:00',1,'p01'),(2,'duck','2022-01-14 00:00:00',2,'p02'),(3,'lion','2022-12-11 00:00:00',3,'p03'),(4,'duck','2022-01-13 00:00:00',4,'p04'),(5,'lion','2023-01-14 00:00:00',3,'p03'),(6,'duck','2023-01-15 00:00:00',2,'p02'),(7,'cat','2023-01-16 00:00:00',1,'p01'),(8,'turtle','2023-01-18 00:00:00',4,'p05'),(9,'db_test1','2023-02-11 00:00:00',2,'p1');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `p_idx` int NOT NULL AUTO_INCREMENT,
  `p_code` varchar(45) DEFAULT NULL,
  `p_name` varchar(45) DEFAULT NULL,
  `m_code` varchar(45) DEFAULT NULL,
  `s_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`p_idx`),
  UNIQUE KEY `idx_UNIQUE` (`p_idx`),
  UNIQUE KEY `p_code_UNIQUE` (`p_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'p01','product01','m01','s01'),(2,'p02','product02','m02','s02'),(3,'p03','product03','m03','s03'),(4,'p04','product04','m01','s01'),(5,'p05','product05','m02','s02'),(6,'p06','product06','m01','s04');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller` (
  `s_idx` int NOT NULL AUTO_INCREMENT,
  `s_code` varchar(45) DEFAULT NULL,
  `s_name` varchar(45) DEFAULT NULL,
  `s_grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`s_idx`),
  UNIQUE KEY `idx_UNIQUE` (`s_idx`),
  UNIQUE KEY `s_code_UNIQUE` (`s_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (1,'s01','seller01','gold'),(2,'s02','seller02','silver'),(3,'s03','seller03','silver'),(4,'s04','seller04','gray');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test_query'
--

--
-- Dumping routines for database 'test_query'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-28 14:58:57
