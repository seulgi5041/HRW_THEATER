-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: moviepjt
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `foodtbl`
--

DROP TABLE IF EXISTS `foodtbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodtbl` (
  `food_name` varchar(255) NOT NULL,
  `food_description` varchar(255) DEFAULT NULL,
  `food_img_name` varchar(255) DEFAULT NULL,
  `food_price` bigint DEFAULT NULL,
  PRIMARY KEY (`food_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodtbl`
--

LOCK TABLES `foodtbl` WRITE;
/*!40000 ALTER TABLE `foodtbl` DISABLE KEYS */;
INSERT INTO `foodtbl` VALUES ('HRW콤보','팝콘(L)1 + 탄산(M)2','hrw_combo',10000),('더블콤보','팝콘(M)2 + 탄산(M)2','double_combo',13000),('땅콩버터오징어','땅콩버터오징어','squidwithbutter',3500),('라지콤보','팝콘(L)2 + 탄산(L)2','large_combo',15000),('맛밤','맛밤','chestnut',3500),('반반팝콘(오리지널/카라멜)L','반반팝콘(오리지널/카라멜)L','half_popcorn',6500),('사이다(L)','사이다(L)','cider_L',3000),('사이다(M)','사이다(M)','cider_M',2500),('스몰콤보','팝콘(M)1 + 탄산(M)1','small_combo',7000),('아메리카노(HOT)','아메리카노(HOT)','coffee_hot',3500),('아메리카노(ICE)','아메리카노(ICE)','coffee_ice',4000),('치즈핫도그','치즈핫도그','cheese_hotdog',5000),('칠리치즈나쵸','칠리치즈나쵸','nachos',4900),('콜라(L)','콜라(L)','coke_L',3000),('콜라(M)','콜라(M)','coke_M',2500),('팝콘(L) 오리지널','팝콘(L) 오리지널','double_popcorn',5500),('팝콘(L) 카라멜','팝콘(L) 카라멜','double_sweet_popcorn',6500),('팝콘(M) 오리지널','팝콘(M)오리지널','single_popcorn',5000),('팝콘(M) 카라멜','팝콘(M) 카라멜','single_sweet_popcorn',6000),('플레인핫도그','플레인핫도그','origin_hotdog',4500);
/*!40000 ALTER TABLE `foodtbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-06  0:15:31
