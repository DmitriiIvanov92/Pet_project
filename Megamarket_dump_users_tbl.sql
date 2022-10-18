-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: Megamarket
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `secondname` varchar(255) NOT NULL,
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Отчество',
  `phone` bigint unsigned NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `check_email_check` CHECK (regexp_like(`email`,_utf8mb4'^.+@.+..+$')),
  CONSTRAINT `check_phone_check` CHECK (regexp_like(`phone`,_utf8mb4'^[0-9]{11}$'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dmitrii','Ivanov',NULL,89600636417,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01'),(2,'Olga','Abrazheeva',NULL,89600663641,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01'),(3,'Julia','Ivanova',NULL,89600636419,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01'),(4,'Oleg','Ivanov',NULL,89600636363,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01'),(5,'Daniil','Koltunov','Victorovich',89600636362,'koltunov@mail.ru','2022-07-30 10:45:01','2022-07-30 10:45:01'),(6,'Ivan','Fedorovich','Ivanov',89600636364,'ivan-92@ya.ru','2022-07-30 10:45:01','2022-07-30 10:45:01'),(7,'Dmitrii','Olegovich',NULL,89600636465,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01'),(8,'Elena','Vladimirovna',NULL,89600631010,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01'),(9,'Gyzel','Faritovna',NULL,89100101010,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01'),(10,'Yana','Ivanova',NULL,89800001010,NULL,'2022-07-30 10:45:01','2022-07-30 10:45:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-31 15:56:34
