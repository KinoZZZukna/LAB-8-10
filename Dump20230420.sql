-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: family_food
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diet`
--

DROP TABLE IF EXISTS `diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diet` (
  `diet_id` int(11) NOT NULL,
  `Diet_name` varchar(30) DEFAULT NULL,
  `Number_of_meals` int(11) DEFAULT NULL,
  PRIMARY KEY (`diet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet`
--

LOCK TABLES `diet` WRITE;
/*!40000 ALTER TABLE `diet` DISABLE KEYS */;
INSERT INTO `diet` VALUES (1,'Low Carb',3),(2,'Vegetarian',3),(3,'Ketogenic',3),(4,'Paleo',3),(5,'Intermittent Fasting',2),(6,'Mediterranean',3);
/*!40000 ALTER TABLE `diet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diet_menu`
--

DROP TABLE IF EXISTS `diet_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diet_menu` (
  `diet_menu_id` int(11) NOT NULL,
  `diet_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`diet_menu_id`),
  KEY `diet_id` (`diet_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `diet_menu_ibfk_1` FOREIGN KEY (`diet_id`) REFERENCES `diet` (`diet_id`),
  CONSTRAINT `diet_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_menu`
--

LOCK TABLES `diet_menu` WRITE;
/*!40000 ALTER TABLE `diet_menu` DISABLE KEYS */;
INSERT INTO `diet_menu` VALUES (1,1,1,1),(2,2,2,2),(3,3,3,1),(4,4,4,1),(5,5,5,2),(6,6,6,3);
/*!40000 ALTER TABLE `diet_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `Menu_name` varchar(30) DEFAULT NULL,
  `Menu_type` varchar(30) DEFAULT NULL,
  `Variety` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Omelette','Breakfast','Standart'),(2,'Salmon Bowl','Lunch','Standart'),(3,'Grilled Chicken Salad','Lunch','Standart'),(4,'Vegetable Stir-fry','Dinner','Vegan'),(5,'Mediterranean Wrap','Lunch','Vegetarian'),(6,'Greek Yogurt and Fruit','Breakfast','Vegetarian');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_menu`
--

DROP TABLE IF EXISTS `product_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_menu` (
  `product_menu_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `quantity` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`product_menu_id`),
  KEY `product_id` (`product_id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `product_menu_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `product_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_menu`
--

LOCK TABLES `product_menu` WRITE;
/*!40000 ALTER TABLE `product_menu` DISABLE KEYS */;
INSERT INTO `product_menu` VALUES (1,1,1,'2'),(2,4,3,'1'),(3,2,2,'1'),(4,3,3,'1'),(5,6,4,'1'),(6,7,5,'2'),(7,5,5,'1');
/*!40000 ALTER TABLE `product_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `Product_name` varchar(30) DEFAULT NULL,
  `Calories` int(11) DEFAULT NULL,
  `Proteins` int(11) DEFAULT NULL,
  `Fats` int(11) DEFAULT NULL,
  `Carbohydrates` int(11) DEFAULT NULL,
  `Category` varchar(30) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Egg',155,13,11,1,'Dairy and Eggs',50),(2,'Salmon',206,22,13,0,'Seafood',100),(3,'Chicken Breast',165,31,4,0,'Poultry',100),(4,'Broccoli',55,4,1,10,'Vegetables',100),(5,'Brown Rice',111,3,1,23,'Grains',100),(6,'Spinach',23,3,0,4,'Vegetables',100),(7,'Greek Yogurt',133,23,0,9,'Dairy and Eggs',100),(8,'Almonds',575,21,49,22,'Nuts and Seeds',100),(9,'Avocado',160,2,15,9,'Fruits',100),(10,'Quinoa',120,4,2,21,'Grains',100);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `User_name` varchar(30) DEFAULT NULL,
  `Gender` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Date_of_birth` date DEFAULT NULL,
  `Height` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Activity_level` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John Smith','Male',30,'1992-01-01',180,80,'Moderately Active'),(2,'Jane Doe','Female',25,'1997-05-15',165,60,'Sedentary'),(3,'Bob Johnson','Male',40,'1982-09-30',175,90,'Active');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_diet`
--

DROP TABLE IF EXISTS `user_diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_diet` (
  `user_diet_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `diet_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_diet_id`),
  KEY `user_id` (`user_id`),
  KEY `diet_id` (`diet_id`),
  CONSTRAINT `user_diet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_diet_ibfk_2` FOREIGN KEY (`diet_id`) REFERENCES `diet` (`diet_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_diet`
--

LOCK TABLES `user_diet` WRITE;
/*!40000 ALTER TABLE `user_diet` DISABLE KEYS */;
INSERT INTO `user_diet` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `user_diet` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-20 12:09:00
