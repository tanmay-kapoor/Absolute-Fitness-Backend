CREATE DATABASE  IF NOT EXISTS `absolute_fitness` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `absolute_fitness`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: absolute_fitness
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `diet_plan`
--

DROP TABLE IF EXISTS `diet_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_plan` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `descrption` varchar(512) NOT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plan`
--

LOCK TABLES `diet_plan` WRITE;
/*!40000 ALTER TABLE `diet_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `diet_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipments` (
  `name` varchar(20) NOT NULL,
  `quantity` int NOT NULL,
  `last_serviced` date DEFAULT NULL,
  `location` int NOT NULL,
  PRIMARY KEY (`name`,`location`),
  KEY `location` (`location`),
  CONSTRAINT `equipments_ibfk_1` FOREIGN KEY (`location`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `name` varchar(20) NOT NULL,
  `location` int NOT NULL,
  `opening_time` varchar(20) NOT NULL,
  `closing_time` varchar(20) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `location` (`location`),
  CONSTRAINT `facilities_ibfk_1` FOREIGN KEY (`location`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_items` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `calories` int NOT NULL,
  `is_gluten_free` tinyint(1) NOT NULL,
  `is_vegan` tinyint(1) NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_items`
--

LOCK TABLES `food_items` WRITE;
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_admins`
--

DROP TABLE IF EXISTS `gym_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_admins` (
  `staff_id` int NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`staff_id`,`gym_id`),
  UNIQUE KEY `staff_id` (`staff_id`),
  UNIQUE KEY `gym_id` (`gym_id`),
  CONSTRAINT `gym_admins_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_admins_ibfk_2` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_admins`
--

LOCK TABLES `gym_admins` WRITE;
/*!40000 ALTER TABLE `gym_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `gym_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyms`
--

DROP TABLE IF EXISTS `gyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyms` (
  `gym_id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(200) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `location` varchar(50) NOT NULL,
  `membership_fee` decimal(65,2) NOT NULL,
  PRIMARY KEY (`gym_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyms`
--

LOCK TABLES `gyms` WRITE;
/*!40000 ALTER TABLE `gyms` DISABLE KEYS */;
INSERT INTO `gyms` VALUES (2,'https://bodyandstrength.com/Upload/site/wJSUa_cover.jpg','7977951506','366 Centre St',45.30);
/*!40000 ALTER TABLE `gyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_plan`
--

DROP TABLE IF EXISTS `health_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_plan` (
  `plan_id` int NOT NULL,
  `trainer_id` int DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `workout_plan` int NOT NULL,
  `diet_plan` int DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `trainer_id` (`trainer_id`),
  KEY `workout_plan` (`workout_plan`),
  KEY `diet_plan` (`diet_plan`),
  CONSTRAINT `health_plan_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `health_plan_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `health_plan_ibfk_3` FOREIGN KEY (`workout_plan`) REFERENCES `workout_plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `health_plan_ibfk_4` FOREIGN KEY (`diet_plan`) REFERENCES `diet_plan` (`plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_plan`
--

LOCK TABLES `health_plan` WRITE;
/*!40000 ALTER TABLE `health_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_records`
--

DROP TABLE IF EXISTS `health_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_records` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `height` decimal(65,2) NOT NULL,
  `weight` decimal(65,2) NOT NULL,
  `date_calculated` date NOT NULL,
  `BMI` decimal(65,2) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `email` (`email`),
  CONSTRAINT `health_records_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_records`
--

LOCK TABLES `health_records` WRITE;
/*!40000 ALTER TABLE `health_records` DISABLE KEYS */;
INSERT INTO `health_records` VALUES (3,184.00,84.00,'2022-11-11',24.81,'tanmay.skater@gmail.com');
/*!40000 ALTER TABLE `health_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_letters`
--

DROP TABLE IF EXISTS `news_letters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_letters` (
  `letter_id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`letter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_letters`
--

LOCK TABLES `news_letters` WRITE;
/*!40000 ALTER TABLE `news_letters` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_letters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `part_time` tinyint(1) DEFAULT '0',
  `salary` decimal(65,2) NOT NULL,
  `description` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `phone` (`phone`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_chk_1` CHECK ((`salary` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `staff_id` int NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `years_of_exp` int NOT NULL,
  `speciality` varchar(30) NOT NULL,
  PRIMARY KEY (`staff_id`),
  CONSTRAINT `trainers_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trainers_chk_1` CHECK ((`years_of_exp` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `sex` enum('Male','Female','Other') NOT NULL,
  `password` varchar(100) NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `users_chk_1` CHECK ((`dob` >= _utf8mb4'1900-01-01'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('tanmay.skater@gmail.com','Tanmay Kapoor','6179358069','2000-12-11','Male','$2a$10$MF3XthajXyIN2Oc8bNMXCOgAmC4p5SYFHtqY8re3yTWgfwpLEb.M6',2);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_plan`
--

DROP TABLE IF EXISTS `workout_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_plan` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(512) NOT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_plan`
--

LOCK TABLES `workout_plan` WRITE;
/*!40000 ALTER TABLE `workout_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `workout_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-03 11:19:52
