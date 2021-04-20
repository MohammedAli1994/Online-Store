  -- create database supermarket_db;
  -- use supermarket_db;
  
  
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
-- Table structure for table `cart_items`
--
/*
DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
/*
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id_fk_cart_items_idx` (`cart_id`),
  KEY `product_id_fk_cart_items_idx` (`product_id`),
  CONSTRAINT `cart_id_fk_cart_items` FOREIGN KEY (`cart_id`) REFERENCES `shopping_carts` (`cart_id`),
  CONSTRAINT `product_id_fk_cart_items` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `categories`
--
/*
DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
/*
CREATE TABLE `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name_UNIQUE` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--
/*
LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*
INSERT INTO `categories` VALUES (6,'Bread and buns'),(2,'Fish'),(3,'Fruits and vegetables'),(1,'Meat and chicken'),(4,'Milk and eggs'),(5,'Wine and drinks');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

UNLOCK TABLES;


--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL,
  PRIMARY KEY (`city_id`),
  UNIQUE KEY `new_tablecol_UNIQUE` (`city_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (5,'Ashdod'),(8,'Bat Yam'),(4,'Ber Sheva'),(10,'Givatayim'),(1,'Haifa'),(6,'Holon'),(2,'Jerusalem'),(9,'Or Yehuda'),(7,'Rishon Lezion'),(3,'Tel-Aviv');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `cart_id` bigint NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `ship_city` int NOT NULL,
  `ship_street` varchar(45) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ship_date` date NOT NULL,
  `final_digits` decimal(4,0) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `cart_id_UNIQUE` (`cart_id`),
  KEY `user_id_fk_idx` (`user_id`),
  CONSTRAINT `cart_id_fk` FOREIGN KEY (`cart_id`) REFERENCES `shopping_carts` (`cart_id`),
  CONSTRAINT `user_id_fk_order` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (8,312542354,1,238.90,3,'Herzliya 1','2020-08-19 13:06:10','2020-11-05',6789),(9,318439643,2,366.00,5,'Kishon Street','2020-08-19 13:10:00','2020-11-05',4688),(10,111111111,8,47.90,1,'as','2020-08-19 13:10:00','2020-11-05',4688);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `category_id` int NOT NULL,
  `picture` varchar(200) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `picture_UNIQUE` (`picture`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `category_id_fk_idx` (`category_id`),
  CONSTRAINT `category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'chicken thighs',21.20,1,'chickenThighs.jpg'),(2,'chicken legs',15.40,1,'chickenLegs.jpg'),(3,'lemon',6.50,3,'1fd07163-7009-4b57-9da0-3834c01b0a23.jpg'),(4,'plum',2.50,3,'plum.jpg'),(5,'coke',6.50,5,'coke.jpg'),(6,'water bottle',3.20,5,'water.jpg'),(7,'cucumber',2.30,3,'cucumber.jpg'),(8,'chicken eggs',23.50,4,'chickenEggs.jpg'),(9,'milk carton',5.50,4,'milkCarton.jpg'),(10,'salmon',26.25,2,'salmon.jpg'),(11,'tuna',33.75,2,'tuna.jpg'),(12,'bread',16.60,6,'bread.jpg'),(13,'five buns',10.20,6,'buns.jpg'),(14,'strawberry packet',10.80,3,'strawberryPacket.jpg'),(15,'pepper',3.90,3,'pepper.jpg'),(16,'meat ',31.90,1,'meat.jpg'),(17,'tomato',2.40,3,'tomato.jpg'),(18,'yogurt',4.80,4,'yogurt.jpg'),(19,'parmesan cheese',26.90,4,'parmesanCheese.jpg'),(20,'parsley',11.50,3,'parsley.jpg'),(21,'chicken wings',22.60,1,'chickenWings.jpg'),(22,'ricotta',15.70,4,'ricotta.jpg'),(23,'onion',4.20,3,'onion.jpg'),(24,'garlic',3.30,3,'garlic.jpg'),(25,'apple',4.50,3,'apple.jpg'),(26,'wine bottle',70.50,5,'wine.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_carts`
--

DROP TABLE IF EXISTS `shopping_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_carts` (
  `cart_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_price` decimal(6,2) NOT NULL DEFAULT '0.00',
  `is_checked_out` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cart_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_carts`
--

LOCK TABLES `shopping_carts` WRITE;
/*!40000 ALTER TABLE `shopping_carts` DISABLE KEYS */;
INSERT INTO `shopping_carts` VALUES (1,312542354,'2020-08-05 14:20:00',260.10,1),(2,318439643,'2020-08-05 00:00:01',366.00,1),(8,111111111,'2020-08-05 14:20:00',47.90,0),(12,315769676,'2020-08-05 22:19:03',0.00,0),(125,318449644,'2020-08-27 20:07:26',169.20,0),(143,318439643,'2020-08-31 17:19:23',206.60,0),(186,318694369,'2020-09-08 21:21:34',57.80,0),(187,312542354,'2020-10-04 19:02:34',15.40,0);
/*!40000 ALTER TABLE `shopping_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `city_id` int NOT NULL,
  `street` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL DEFAULT 'customer',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `city_id_fk_idx` (`city_id`),
  CONSTRAINT `city_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,205768153,1,'Kishon Street 12','ADMIN','Mohammad','Ali','ali@gmail.com','1234mM'),(2,318449644,1,'Yigal Alon 46','CUSTOMER','Karem','Ali','Kam123@gmail.com','1234rR');
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

-- Dump completed on 2020-10-26  1:33:45


