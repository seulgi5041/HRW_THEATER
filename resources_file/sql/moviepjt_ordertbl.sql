-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: moviepjt
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `ordertbl`
--

DROP TABLE IF EXISTS `ordertbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordertbl` (
  `order_code` varchar(255) NOT NULL,
  `adult_count` int DEFAULT NULL,
  `disabled_count` int DEFAULT NULL,
  `installment` int DEFAULT NULL,
  `movie_order_condition` int DEFAULT NULL,
  `movie_price` bigint DEFAULT NULL,
  `num` int DEFAULT NULL,
  `order_date` varchar(255) DEFAULT NULL,
  `pay_company` varchar(255) DEFAULT NULL,
  `pay_method` varchar(255) DEFAULT NULL,
  `teenager_count` int DEFAULT NULL,
  `movie_code` varchar(255) DEFAULT NULL,
  `schedule_code` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_code`),
  KEY `FK25os3ujfqbcprdj99wtebly2m` (`schedule_code`),
  KEY `FKbf7qo29omhb2oaofrykytuydu` (`user_id`),
  CONSTRAINT `FK25os3ujfqbcprdj99wtebly2m` FOREIGN KEY (`schedule_code`) REFERENCES `scheduletbl` (`schedule_code`),
  CONSTRAINT `FKbf7qo29omhb2oaofrykytuydu` FOREIGN KEY (`user_id`) REFERENCES `member_table` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordertbl`
--

LOCK TABLES `ordertbl` WRITE;
/*!40000 ALTER TABLE `ordertbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordertbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `set_oderCode` BEFORE INSERT ON `ordertbl` FOR EACH ROW BEGIN
    DECLARE max_increment INT;
    DECLARE formatted_increment VARCHAR(3);
    
    -- 동일한 날짜(my_date)에 대한 최대 daily_increment를 찾습니다.
    SELECT MAX(num) INTO max_increment
    FROM orderTBL
    WHERE order_date = NEW.order_date;
    
    
    IF max_increment IS NULL THEN 
        SET NEW.num = 1;
        SET formatted_increment = LPAD(NEW.num, 3, '0');
    ELSE
        -- num 값을 증가시킵니다.
        SET NEW.num = max_increment + 1;
        SET formatted_increment = LPAD(NEW.num, 3, '0');
    END IF;

    -- my_date를 숫자로 포매팅하고 daily_increment와 결합하여 other_columns를 설정합니다.
    SET NEW.order_code = CONCAT(DATE_FORMAT(NEW.order_date, '%Y%m%d'), formatted_increment);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-30 17:39:32
