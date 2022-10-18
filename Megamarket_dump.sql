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
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL COMMENT 'Название разделов',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Категории';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'Овощи','2022-07-30 12:28:08'),(2,'Cыр','2022-07-30 12:28:08'),(3,'Мясо','2022-07-30 12:28:08'),(4,'Колбасы','2022-07-30 12:28:08'),(5,'Алкоголь 18+','2022-07-30 12:28:08');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_order`
--

DROP TABLE IF EXISTS `delivery_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_order` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `adress` text NOT NULL,
  `time_order` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `fk_delivery_user_id` (`user_id`),
  KEY `fk_delivery_products` (`product_id`),
  CONSTRAINT `fk_delivery_products` FOREIGN KEY (`product_id`) REFERENCES `products_store` (`id`),
  CONSTRAINT `fk_delivery_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Доставка';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_order`
--

LOCK TABLES `delivery_order` WRITE;
/*!40000 ALTER TABLE `delivery_order` DISABLE KEYS */;
INSERT INTO `delivery_order` VALUES (1,1,7,'г.Москва, ул.Ахтубина, д.1','2022-07-31 00:21:11'),(2,1,5,'г.Москва, ул.Ахтубина, д.1','2022-07-31 00:21:11'),(3,1,10,'г.Москва, ул.Ахтубина, д.1','2022-07-31 00:21:11'),(4,2,5,'г.Москва, ул.Щербакова, д.10','2022-07-31 00:21:11'),(5,2,8,'г.Москва, ул.Щербакова, д.10','2022-07-31 00:21:11'),(6,2,6,'г.Москва, ул.Щербакова, д.10','2022-07-31 00:21:11');
/*!40000 ALTER TABLE `delivery_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `delivery_order_view`
--

DROP TABLE IF EXISTS `delivery_order_view`;
/*!50001 DROP VIEW IF EXISTS `delivery_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `delivery_order_view` AS SELECT 
 1 AS `order_id`,
 1 AS `username`,
 1 AS `products`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `products` bigint unsigned NOT NULL,
  `pluses` varchar(255) DEFAULT NULL COMMENT 'Плюсы',
  `minuses` varchar(255) DEFAULT NULL COMMENT 'Минусы',
  `comment` text NOT NULL COMMENT 'Комментарий',
  `raiting` enum('*','**','***','****','*****') DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_feedback_user_id` (`user_id`),
  KEY `fk_feedback_products` (`products`),
  CONSTRAINT `fk_feedback_products` FOREIGN KEY (`products`) REFERENCES `products_store` (`id`),
  CONSTRAINT `fk_feedback_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Отзыв на товар';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,1,7,NULL,NULL,'Хороший виски!',NULL,'2022-07-30 13:49:04'),(2,2,5,NULL,NULL,'Очень вкусный сыр!',NULL,'2022-07-30 13:49:04'),(3,3,10,'Свежий фарш',NULL,'Буду брать еще!','*****','2022-07-30 13:49:05'),(4,7,6,'Очень вкусная колбаса',NULL,'Попробуйте сами!','*****','2022-07-30 13:49:05'),(5,10,11,NULL,NULL,'Класс!',NULL,'2022-07-30 14:53:17');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `time_order` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `cs_order_user` (`user_id`),
  KEY `cs_order_` (`product_id`),
  CONSTRAINT `cs_order_` FOREIGN KEY (`product_id`) REFERENCES `products_store` (`id`),
  CONSTRAINT `cs_order_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Самовывоз';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,5,1,'2022-07-31 00:33:31'),(2,6,2,'2022-07-31 00:33:31'),(3,8,3,'2022-07-31 00:33:31'),(4,5,4,'2022-07-31 00:33:31'),(5,6,8,'2022-07-31 00:33:31');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_user`
--

DROP TABLE IF EXISTS `password_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_pass` varchar(40) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  CONSTRAINT `fk_password_user` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `check_password_user` CHECK (regexp_like(`user_pass`,_utf8mb4'(?=.*[0-9])(?=.*[!@#$%^&*])(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*]{6,}'))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Пароли пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_user`
--

LOCK TABLES `password_user` WRITE;
/*!40000 ALTER TABLE `password_user` DISABLE KEYS */;
INSERT INTO `password_user` VALUES (1,'qwertY9!','2022-07-31 15:36:11','2022-07-31 15:36:39'),(2,'QwerTY1!','2022-07-31 15:36:11','2022-07-31 15:36:39'),(3,'PAssword10!','2022-07-31 15:36:11','2022-07-31 15:36:39'),(4,'VOLume01!','2022-07-31 15:36:11','2022-07-31 15:36:39'),(5,'Example10!','2022-07-31 15:44:11','2022-07-31 15:44:11'),(6,'gOOOO99!','2022-07-31 15:44:11','2022-07-31 15:44:11'),(8,'Example_password1!','2022-07-31 15:45:13','2022-07-31 15:45:13'),(9,'Password_user10!','2022-07-31 15:45:13','2022-07-31 15:45:13'),(10,'Year2022!','2022-07-31 15:45:13','2022-07-31 15:45:13');
/*!40000 ALTER TABLE `password_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_like_user`
--

DROP TABLE IF EXISTS `product_like_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_like_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `products` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_product_like_user_id` (`user_id`),
  KEY `fk_product_like_user` (`products`),
  CONSTRAINT `fk_product_like_user` FOREIGN KEY (`products`) REFERENCES `products_store` (`id`),
  CONSTRAINT `fk_product_like_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Избранные';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_like_user`
--

LOCK TABLES `product_like_user` WRITE;
/*!40000 ALTER TABLE `product_like_user` DISABLE KEYS */;
INSERT INTO `product_like_user` VALUES (1,1,7),(2,2,5),(3,3,10),(4,5,7),(5,8,12),(6,7,6);
/*!40000 ALTER TABLE `product_like_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_store`
--

DROP TABLE IF EXISTS `products_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_store` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `store_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `product_name` varchar(200) NOT NULL COMMENT 'Продукты',
  `description` text COMMENT 'Описание',
  `price` decimal(11,2) NOT NULL COMMENT 'Цена руб.',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_category_id` (`category_id`),
  KEY `fk_store_id` (`store_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `catalog` (`id`),
  CONSTRAINT `fk_store_id` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Продукты';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_store`
--

LOCK TABLES `products_store` WRITE;
/*!40000 ALTER TABLE `products_store` DISABLE KEYS */;
INSERT INTO `products_store` VALUES (1,1,1,'Кабачки грунтовые',NULL,75.89,'2022-07-30 12:29:08','2022-07-30 12:29:08'),(2,1,1,'Перец красный сладкий',NULL,80.70,'2022-07-30 12:29:08','2022-07-30 12:29:08'),(3,1,2,'Сыр полутвердый Ламбер 50%',NULL,878.90,'2022-07-30 12:29:08','2022-07-30 12:29:08'),(4,1,2,'Сыр полутвердый Arta Natura',NULL,409.00,'2022-07-30 12:29:08','2022-07-30 12:29:08'),(5,1,3,'Фарш говяжий','Тип продукта: Полуфабрикат из мяса',219.00,'2022-07-30 12:30:07','2022-07-30 12:30:07'),(6,1,4,'Колбаса вареная Родные места Доктораская','400г.',229.00,'2022-07-30 12:30:07','2022-07-30 12:30:07'),(7,1,5,'Виски Jameson 40% 0.7 л','Регион Дублин',2129.00,'2022-07-30 12:30:07','2022-07-30 12:30:07'),(8,2,1,'Огурцы короткоплодные',NULL,52.60,'2022-07-30 12:34:29','2022-07-30 12:34:29'),(9,2,2,'Сыр полутвердый Ламбер 50%',NULL,1239.03,'2022-07-30 12:34:29','2022-07-30 12:34:29'),(10,2,3,'Фарш говяжий',NULL,286.40,'2022-07-30 12:34:29','2022-07-30 12:34:29'),(11,2,4,'Колбаса Вязанка',NULL,273.90,'2022-07-30 12:34:29','2022-07-30 12:34:29'),(12,2,5,'Виски Dewards',NULL,2429.00,'2022-07-30 12:34:29','2022-07-30 12:34:29');
/*!40000 ALTER TABLE `products_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gender` enum('male','female') NOT NULL COMMENT 'Пол пользователя',
  `birthday` date NOT NULL COMMENT 'Дата рождения',
  `city` varchar(150) NOT NULL COMMENT 'Город',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_cs_profiles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профиль пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'male','1992-09-15','Chelny','2022-07-30 10:45:01','2022-07-30 10:45:01'),(2,'female','1970-01-01','Kazan','2022-07-30 10:45:01','2022-07-30 10:45:01'),(3,'female','1992-06-01','Chelny','2022-07-30 10:45:01','2022-07-30 10:45:01'),(4,'male','1992-10-10','Moscow','2022-07-30 10:45:01','2022-07-30 10:45:01'),(5,'male','1992-05-01','Saratov','2022-07-30 10:45:01','2022-07-30 10:45:01'),(6,'male','1991-05-01','Moscow','2022-07-30 10:45:01','2022-07-30 10:45:01'),(7,'male','1990-05-15','Kazan','2022-07-30 10:45:01','2022-07-30 10:45:01'),(8,'female','1980-09-09','Nizhnekamsk','2022-07-30 10:45:01','2022-07-30 10:45:01'),(9,'female','1985-06-01','Nizhniy Novgorod','2022-07-30 10:45:01','2022-07-30 10:45:01'),(10,'female','1987-07-10','Moscow','2022-07-30 10:45:01','2022-07-30 10:45:01');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `store_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL COMMENT 'Название магазина',
  `description` text COMMENT 'Описание магазина',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Магазины';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Metro','В России история METRO началась в 2000 году. Уже год спустя, в ноябре 2001 года, в Москве были открыты два торговых центра компании.','2022-07-30 11:51:31'),(2,'Perekrestok','\"Перекресток\" - одна из первых сетей городских супермаркетов в России номер 1','2022-07-30 12:34:14');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Temporary view structure for view `users_info`
--

DROP TABLE IF EXISTS `users_info`;
/*!50001 DROP VIEW IF EXISTS `users_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_info` AS SELECT 
 1 AS `username`,
 1 AS `user_pass`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `delivery_order_view`
--

/*!50001 DROP VIEW IF EXISTS `delivery_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `delivery_order_view` AS select `o`.`order_id` AS `order_id`,concat(`u`.`firstname`,' ',substr(`u`.`secondname`,1,1),'.') AS `username`,`ps`.`product_name` AS `products` from ((`orders` `o` join `users` `u` on((`u`.`id` = `o`.`user_id`))) join `products_store` `ps` on((`ps`.`id` = `o`.`product_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_info`
--

/*!50001 DROP VIEW IF EXISTS `users_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_info` AS select concat(`u`.`firstname`,' ',`u`.`secondname`) AS `username`,`pu`.`user_pass` AS `user_pass` from (`users` `u` join `password_user` `pu` on((`pu`.`id` = `u`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-31 15:52:49
