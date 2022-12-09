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
-- Table structure for table `diet_plans`
--

DROP TABLE IF EXISTS `diet_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diet_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `breakfast` varchar(100) DEFAULT NULL,
  `lunch` varchar(100) DEFAULT NULL,
  `dinner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `name` (`name`),
  KEY `breakfast` (`breakfast`),
  KEY `lunch` (`lunch`),
  KEY `dinner` (`dinner`),
  CONSTRAINT `diet_plans_ibfk_1` FOREIGN KEY (`breakfast`) REFERENCES `meal_choices` (`meal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `diet_plans_ibfk_2` FOREIGN KEY (`lunch`) REFERENCES `meal_choices` (`meal`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `diet_plans_ibfk_3` FOREIGN KEY (`dinner`) REFERENCES `meal_choices` (`meal`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plans`
--

LOCK TABLES `diet_plans` WRITE;
/*!40000 ALTER TABLE `diet_plans` DISABLE KEYS */;
INSERT INTO `diet_plans` VALUES (1,'Weight loss','Have smoothie and healthy foods to cleanse your body of the toxins and help boost weight reduction at the same time.','Vegetable Smoothie','Chicken','Oats'),(2,'All purpose diet','Plan that is designed to help in every aspect of the body\'s healing process','Porridge','Boiled Kidney Beans','Chicken'),(5,'Carnivore diet','Eat more of non vegetarian food to cure gut problems and increase protein intake','Boiled eggs','Red meat steak','Chicken'),(6,'Protein increase','Have food throghout the day that are rich in protein','Vegetable smoothie','Boiled eggs','Chicken');
/*!40000 ALTER TABLE `diet_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipments`
--

DROP TABLE IF EXISTS `equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipments` (
  `equipment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `image_url` varchar(512) NOT NULL,
  PRIMARY KEY (`equipment_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES (1,'Chest Press Machine','https://www.technogym.com/media/catalog/product/cache/1/image/040ec09b1e35df139433887a97daa66f/M/G/MG1500_purestrength_inclinechestpress_hero_01_22.jpg'),(2,'Seated Dip Machine','https://www.precor.com/sites/default/files/styles/product_image/public/ds_seateddip.png?itok=2ZLBsUsN'),(3,'Treadmill','https://cdn.shopify.com/s/files/1/2422/9487/products/1Stride_iPadFullproduct_600x.png?v=1657895735'),(4,'Excercise Bike','https://res.cloudinary.com/iconfitness/image/upload/dpr_3.0,f_auto,q_auto,w_500/v1/site--6/PFEX16718_1-01068.jpg'),(5,'Dumbbells','https://cdn.shopify.com/s/files/1/0471/3879/9774/products/210310_Dumbbells_2270x1500_d524e6c4-85b9-4244-abad-2e3e876e4a84_600x.jpg?v=1645084642'),(6,'Barbell','https://www.mensjournal.com/wp-content/uploads/mf/barbell_abs_main.jpg?w=1188&h=630&crop=1&quality=86&strip=all'),(7,'Leg press machine','https://truefitness.com/wp-content/uploads/2019/11/SPL0300-Acrylic-Alabaster_960-1.png'),(8,'Pullup bar','https://cdn.shopify.com/s/files/1/0471/3879/9774/products/XGYM-LSR-3.0-01-F07_main_1035x@2x.jpg?v=1669753609%202x'),(9,'Kettle bells','https://m.media-amazon.com/images/I/41luBUoSyFL._AC_SY1000_.jpg'),(10,'Pec fly machine','https://www.titan.fitness/dw/image/v2/BDBZ_PRD/on/demandware.static/-/Sites-masterCatalog_Titan/default/dw5058b97d/images/hi-res/Fitness/401494_01.jpg?sw=1001&sh=1000');
/*!40000 ALTER TABLE `equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `excercises`
--

DROP TABLE IF EXISTS `excercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `excercises` (
  `name` varchar(32) NOT NULL,
  `reps` int NOT NULL,
  `sets` int NOT NULL,
  `image_url` varchar(200) NOT NULL,
  PRIMARY KEY (`name`),
  CONSTRAINT `excercises_chk_1` CHECK ((`reps` > 0)),
  CONSTRAINT `excercises_chk_2` CHECK ((`sets` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `excercises`
--

LOCK TABLES `excercises` WRITE;
/*!40000 ALTER TABLE `excercises` DISABLE KEYS */;
INSERT INTO `excercises` VALUES ('Bench Press',5,40,'https://cdn.mos.cms.futurecdn.net/pLaRi5jXSHDKu6WRydetBo-1200-80.jpg'),('Burpees',10,25,'https://www.muscleandfitness.com/wp-content/uploads/2017/04/burpee-1109.jpg?w=1200&h=630&crop=1&quality=86&strip=all'),('Cable Fly',5,20,'https://s3.amazonaws.com/prod.skimble/assets/1531497/image_iphone.jpg'),('Deadlift',2,30,'https://cdn.muscleandstrength.com/sites/default/files/deadlift_0.jpg'),('Leg Press',3,20,'https://fitnessvolt.com/wp-content/uploads/2022/05/Leg-Press-Foot-Placements.jpg'),('Squats',3,15,'https://images.healthshots.com/healthshots/en/uploads/2021/09/06145503/shutterstock_1563301450.jpg');
/*!40000 ALTER TABLE `excercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `facility_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `opening_time` varchar(20) NOT NULL,
  `closing_time` varchar(20) NOT NULL,
  PRIMARY KEY (`facility_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'Sauna','https://media.istockphoto.com/id/517419408/photo/sauna.jpg?s=612x612&w=0&k=20&c=KR_zH8fEEVVJxHnwWpNFWffhXCITy3QEB1wSdJEtoqE=','9 am','8 pm'),(2,'Cryotherapy','https://performanceoptimalhealth.com/wp-content/uploads/cryotherapy-header.jpg','9 am','8 pm'),(3,'Massage','https://img.freepik.com/free-photo/attractive-african-woman-enjoying-face-massage-spa-salon_176420-13953.jpg?w=2000','11 am','7 pm'),(4,'Badminton Court','https://content.jdmagicbox.com/comp/chennai/p7/044pxx44.xx44.200929032721.f1p7/catalogue/kubera-sports-academy-indoor-badminton-court-ayyavoo-colony-chennai-badminton-courts-kt5g0ut01r.jpg?clr=204646','6 am','11 pm'),(5,'Swimming Pool','https://media.timeout.com/images/105489210/750/562/image.jpg','5 am','9 pm'),(6,'Tennis Court','https://mastersystemscourts.com/img/master-systems-courts-tennis-court-1-991x605l.jpg','6 am','11 pm'),(7,'Basketball Court','https://assets2.cbsnewsstatic.com/hub/i/r/2016/02/04/2e52ba67-a327-4291-b826-11a97f9a9ca7/thumbnail/640x360/76e04e5a75dfa57abd7dd7a5b900560f/hoopcambridgeathleticclub.jpg','6 am','10 pm'),(8,'Squash','https://asbsquash.com/modules/aktuality/galleries/14/125.jpg','6 am','11 pm'),(9,'Yoga','https://images.healthshots.com/healthshots/en/uploads/2021/12/18081913/bhujangasana.jpg','5 am','9 pm'),(10,'Shower','https://cimg0.ibsrv.net/cimg/www.fitday.com/693x350_85-1/400/showergym-207400.jpg','5 am','11 pm');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
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
INSERT INTO `gym_admins` VALUES (11111,1),(22222,2),(33333,3),(44444,4),(55555,5),(66666,6);
/*!40000 ALTER TABLE `gym_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_equipments`
--

DROP TABLE IF EXISTS `gym_equipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_equipments` (
  `gym_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  `quantity` int NOT NULL,
  `last_serviced` date DEFAULT NULL,
  PRIMARY KEY (`gym_id`,`equipment_id`),
  KEY `equipment_id` (`equipment_id`),
  CONSTRAINT `gym_equipments_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_equipments_ibfk_2` FOREIGN KEY (`equipment_id`) REFERENCES `equipments` (`equipment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_equipments_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_equipments`
--

LOCK TABLES `gym_equipments` WRITE;
/*!40000 ALTER TABLE `gym_equipments` DISABLE KEYS */;
INSERT INTO `gym_equipments` VALUES (1,1,20,'2020-10-10'),(1,3,15,NULL),(1,5,20,'2019-09-15'),(1,7,20,'2021-11-11'),(1,9,20,NULL),(2,1,10,NULL),(2,2,15,'2019-10-10'),(2,3,18,'2015-01-01'),(2,4,12,'2022-08-08'),(2,5,38,NULL),(2,6,27,'2021-12-12'),(2,7,14,NULL),(2,8,7,NULL),(2,9,29,'2010-01-01'),(2,10,22,'2009-01-01'),(3,1,10,'2022-10-10'),(3,2,22,'2022-10-10'),(3,4,4,'2010-10-10'),(3,8,14,'2021-10-10'),(3,9,2,NULL),(4,3,10,NULL),(4,7,12,'2022-01-01'),(5,2,11,'2022-09-09'),(5,4,10,'2022-11-11'),(5,5,22,'2022-11-11'),(6,2,34,'2022-09-09'),(6,7,38,'2021-09-08'),(6,8,8,'2020-10-10'),(6,9,7,'2016-12-15');
/*!40000 ALTER TABLE `gym_equipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_facilities`
--

DROP TABLE IF EXISTS `gym_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_facilities` (
  `gym_id` int NOT NULL,
  `facility_id` int NOT NULL,
  PRIMARY KEY (`gym_id`,`facility_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `gym_facilities_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_facilities_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`facility_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_facilities`
--

LOCK TABLES `gym_facilities` WRITE;
/*!40000 ALTER TABLE `gym_facilities` DISABLE KEYS */;
INSERT INTO `gym_facilities` VALUES (1,1),(2,1),(4,1),(5,1),(6,1),(2,2),(3,2),(5,2),(6,2),(1,3),(2,3),(4,3),(5,3),(1,4),(3,4),(4,4),(5,4),(2,5),(3,5),(5,5),(6,5),(2,6),(4,6),(5,6),(1,7),(3,7),(5,7),(5,8),(6,8),(1,9),(5,9),(2,10),(3,10),(5,10);
/*!40000 ALTER TABLE `gym_facilities` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyms`
--

LOCK TABLES `gyms` WRITE;
/*!40000 ALTER TABLE `gyms` DISABLE KEYS */;
INSERT INTO `gyms` VALUES (1,'https://bodyandstrength.com/Upload/site/wJSUa_cover.jpg','2025550118','55 Centre Avenue, #30, Austin, TX, 5634',156.33),(2,'https://www.encorefitness.ru/upload/resize/a8/a8709705bb195a5d68f8c72b2b76537f_1024x2000.jpg','2025550308','65-45 Otto Rd, Queens, NY 11385',253.99),(3,'https://cdn.abcotvs.com/dip/images/6193988_051820-wpvi-annie-nj-gyms-video-vid.jpg','7097534584','350 Tenth Ave, San Diego, CA 9210',75.00),(4,'https://images.squarespace-cdn.com/content/v1/56e487181d07c0743d227289/1557248970918-530M1TO27B7Q41OEE985/fitness-4-1500x77.jpg?format=1500w','8057779321','2565 Washington St Suite B, Boston, MA 0211',59.37),(5,'https://gymmboxx.com/wp-content/uploads/2020/02/WhatsApp-Image-2020-02-09-at-6.32.11-PM.jpeg','6011185333','515 S Figueroa St #102, Los Angeles, CA 90071',195.46),(6,'https://cdn.vox-cdn.com/thumbor/2Bcpu3cwfzZJ2gUnhWaiyWFS0Mw=/0x0:8238x5492/1200x800/filters:focal(3460x2087:4778x3405)/cdn.vox-cdn.com/uploads/chorus_image/image/67606043/GettyImages_1132006407.0.jpg','2025550250','1146 Harrison St, Seattle WA 98109',86.98);
/*!40000 ALTER TABLE `gyms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_plans`
--

DROP TABLE IF EXISTS `health_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `trainer_id` int DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `workout_plan` int DEFAULT NULL,
  `diet_plan` int DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `email` (`email`),
  KEY `trainer_id` (`trainer_id`),
  KEY `workout_plan` (`workout_plan`),
  KEY `diet_plan` (`diet_plan`),
  CONSTRAINT `health_plans_ibfk_1` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`staff_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `health_plans_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `health_plans_ibfk_3` FOREIGN KEY (`workout_plan`) REFERENCES `workout_plans` (`plan_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `health_plans_ibfk_4` FOREIGN KEY (`diet_plan`) REFERENCES `diet_plans` (`plan_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_plans`
--

LOCK TABLES `health_plans` WRITE;
/*!40000 ALTER TABLE `health_plans` DISABLE KEYS */;
INSERT INTO `health_plans` VALUES (6,69999,'tanmay.skater@gmail.com',3,2,'Randomly assigned plan');
/*!40000 ALTER TABLE `health_plans` ENABLE KEYS */;
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
  `bmi` decimal(65,2) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`record_id`),
  KEY `email` (`email`),
  CONSTRAINT `health_records_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_records`
--

LOCK TABLES `health_records` WRITE;
/*!40000 ALTER TABLE `health_records` DISABLE KEYS */;
INSERT INTO `health_records` VALUES (1,185.00,89.00,'2022-12-08',26.00,'tanmay.skater@gmail.com'),(2,185.00,97.00,'2022-08-26',28.34,'tanmay.skater@gmail.com'),(3,185.00,95.15,'2022-09-11',27.80,'tanmay.skater@gmail.com'),(4,185.00,95.80,'2022-09-18',27.99,'tanmay.skater@gmail.com'),(5,185.00,95.35,'2022-09-23',27.86,'tanmay.skater@gmail.com'),(6,185.00,93.10,'2022-11-01',27.20,'tanmay.skater@gmail.com'),(7,185.00,91.15,'2022-11-23',26.63,'tanmay.skater@gmail.com'),(8,185.00,90.65,'2022-12-04',26.49,'tanmay.skater@gmail.com');
/*!40000 ALTER TABLE `health_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meal_choices`
--

DROP TABLE IF EXISTS `meal_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meal_choices` (
  `meal` varchar(100) NOT NULL,
  `calories` int NOT NULL,
  `image_url` varchar(200) NOT NULL,
  PRIMARY KEY (`meal`),
  CONSTRAINT `meal_choices_chk_1` CHECK ((`calories` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meal_choices`
--

LOCK TABLES `meal_choices` WRITE;
/*!40000 ALTER TABLE `meal_choices` DISABLE KEYS */;
INSERT INTO `meal_choices` VALUES ('Boiled eggs',98,'https://www.onceuponachef.com/images/2017/10/How-To-Make-Hard-Boiled-Eggs.jpg'),('Boiled Kidney Beans',120,'https://myfavouritepastime.files.wordpress.com/2019/01/img_3330.jpg'),('Chicken',250,'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/healthy-chicken-recipes-1641586837.jpeg?crop=1.00xw:0.498xh;0,0.285xh&resize=1200:*'),('Oats',150,'https://post.healthline.com/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg'),('Porridge',95,'https://insanelygoodrecipes.com/wp-content/uploads/2022/04/Oatmeal-Porridge-with-Nuts-and-Blueberries-in-a-Blue-Bowl.jpg'),('Red meat steak',120,'https://i.insider.com/60ff1914f350d50019590549?width=1136&format=jpeg'),('Vegetable smoothie',37,'https://thekitchencommunity.org/wp-content/uploads/2022/01/vegetable-smoothie.jpg');
/*!40000 ALTER TABLE `meal_choices` ENABLE KEYS */;
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
  `description` varchar(512) NOT NULL,
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
INSERT INTO `staff` VALUES (11111,'Harvey Specter','1122112211',0,45000.00,'Manages all staff of his gym. Responsible for ensuring all facilities of gym are working and in good condition. Can analyze trainer performance.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu',1),(19994,'Harsh Mahajan','5499449945',0,11243.30,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtu./7zSTgfo4xBa19KvIkcI7v/jjOOUx.',1),(19995,'Anjaneya Gurjar','4499449944',0,23322.99,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtuCwxVal6AYHpCT0KEatAJ9KCcjp4a2Vy',1),(19996,'Ajit Singh Gujral','1100110011',0,34342.29,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtuDwWRh4kbXXv0SEELVjQo10Mag02pzg6',1),(19997,'Matt LeBlanc','1001100110',0,34342.22,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtu2OyHVGaJSjs5t1Vrj.7yLzC04ZDCPh6',1),(19998,'David Walliams','8787878787',0,11004.33,'Helps in building complex workout routines for members.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuG/4SvUoYETqMt8p620orGST6XiuJ8Fm',1),(19999,'Thomas Cook','7878787878',0,12000.00,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtuQZCA3alY1UH60TXmoVY.oqXjUl.sKgG',1),(22222,'Mike Ross','1234554321',0,52000.00,'Supervises over the entire gym staff. Ensure trainer performance, how happy the customers are as well as regularly updates gym facilities and equipment.s.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu',2),(29996,'Jose Anunziato','1155228890',0,25640.70,'Conducts yoga classes for the interested members as well personal training sessions.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuwUfQgbEVAJXol0aJID6RMgS0zOjheJO',2),(29997,'Amit Shesh','5499449940',0,19000.00,'Helps memebrs improve their posture in the gym.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuJnAiIf/o/iy/XMcUp4d1YCQHNup9p.a',2),(29998,'Harry Styles','5499449941',0,11243.30,'Helps memebrs improve their posture in the gym.','$2a$10$1CK4fQdkK7WlpHZeRAVgtutyXEG.ckpq8m5BCJraIVas/bUBZkkWe',2),(29999,'Liam Payne','5499449942',0,11243.30,'Helps all the members at the gym in figuring out the best workout plan for them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtubCOsAKwc.p.84.VEfEC7tiCOx1WPASq',2),(33333,'Rachel Zane','2323232323',0,37346.44,'Manages other employees of the gym. Responsible for regularly adding newly hired staff to the gym\'s database.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu',3),(39994,'Cristiana Perez','1155228891',0,25640.70,'Helps members workout out properly.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu9qbzxHdHVCr/QVR5NpYUal3r0Voe5fy',3),(39995,'Sergio Messi','1155228895',0,25640.70,'Helps members workout out properly.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu9mrn.PIauuba0Yn34PgPFRxJkQ5mXn.',3),(39996,'Max Ricciardo','1155228894',0,35640.70,'Helps members workout out properly.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuFhzgbsmIY8VrIzj7WW2219JsRW8vJ2e',3),(39997,'Lewis Hamilton','1152522889',0,18454.00,'Helps members workout out properly.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuW6Vwg3RkS5LOgrjZX707yHLh84JlvZS',3),(39998,'Sebastian Kapoor','1152522888',0,18454.00,'Deisgns custom workout plans for all members of the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtuQxFFEJwyIjpczeB2yVkVVi6epZneKi.',3),(39999,'Suraj Mishra','1152522887',0,18454.00,'Helps in muscle gain and flexibility.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu23.4fsUK/jdT/C9QsfMqKCtsYjbe4ia',3),(44444,'Donna Paulsen','9889988998',0,27465.88,'First one from the gym staff to be contacted whenever the higher authorities decide to incorporate any changes. Is responsible fo conveying all info to other subordinates and managing them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu',4),(49997,'Charlie Puth','1152522886',0,21000.00,'Helps in building the correct posture for workouts.','$2a$10$1CK4fQdkK7WlpHZeRAVgtubj3ntkYz9bFdKid4OEiykkPjAl/Aoni',4),(49998,'Daniel hardman','1152522885',0,21000.00,'Helps in understanding gym equipment and using them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuEtZwHkBVmhF9zGgbgZofns5ccysMI0u',4),(49999,'Jessica Pearson','1152522884',0,2437.99,'Helps in understanding gym equipment and using them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuTVxS/1TZB/Qsv0UHrRDSb0kOku6klji',4),(55555,'Alex Williams','9869833298',0,46847.14,'Responsible for managing staff, getting the equipment serviced regularly as well adding new equipments to the website whenever needed. Can fire staff if performance is not up to the mark.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu',5),(59999,'Paula Agard','1152522881',0,2437.99,'Helps in understanding gym equipment and using them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu19a3IoEPpyCM1KesBc4z8sAkyw8.BvW',5),(61111,'Dua Lipa','3548764890',1,9054.33,'Assists the trainer during yoga class.','$2a$10$0TuGb94iZDd85WkG07QdLeUxJJt8DBTR2Itn1byg3B12hQvuxeGom',6),(66666,'Samantha Wheeler','3885379522',0,75953.20,'Delegates tasks to lower level staff. Makes sure all facilities are open by the required time and also closed for servicing whenever needed. Can hire/fire staff.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu',6),(69999,'Anita Gibbs','1152522844',0,2437.99,'Trains how to do complex workouts for experienced members.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuncBGVGYXRx4csp8b.k5uPEs/FHqMPjy',6);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `admin_delete_check` BEFORE DELETE ON `staff` FOR EACH ROW BEGIN
	IF OLD.staff_id IN (SELECT staff_id FROM gym_admins) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Cannot delete an admin" ;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
INSERT INTO `trainers` VALUES (19994,'https://images.unsplash.com/photo-1639653818737-7e884dc84954?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTU5fHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',2,'Muscle building'),(19995,'https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',12,'Muscle building'),(19996,'https://images.unsplash.com/photo-1606889464198-fcb18894cf50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDZ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',22,'Weight loss'),(19997,'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',10,'Calisthenics'),(19998,'https://images.unsplash.com/photo-1546817372-628669db4655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA3fHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',1,'Flexibility'),(19999,'https://images.unsplash.com/photo-1597452485669-2c7bb5fef90d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAyfHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',3,'Calisthenics'),(29996,'https://images.unsplash.com/photo-1598575468023-85b93d887c3f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nzh8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',1,'Flexibility'),(29997,'https://images.unsplash.com/photo-1434596922112-19c563067271?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjB8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',11,'Calisthenics'),(29998,'https://images.unsplash.com/photo-1598267416824-5907946a3810?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',7,'Flexibility'),(29999,'https://images.unsplash.com/photo-1532384748853-8f54a8f476e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',4,'Weight loss'),(39994,'https://images.unsplash.com/photo-1571731956672-f2b94d7dd0cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',5,'Flexibility'),(39995,'https://images.unsplash.com/photo-1548690312-e3b507d8c110?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',2,'Calisthenics'),(39996,'https://images.unsplash.com/photo-1601422407692-ec4eeec1d9b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',9,'Weight loss'),(39997,'https://images.unsplash.com/photo-1611672585731-fa10603fb9e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',11,'Weight loss'),(39998,'https://images.unsplash.com/photo-1578971102567-916960872844?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',7,'Muscle building'),(39999,'https://images.unsplash.com/photo-1579758629938-03607ccdbaba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',8,'Muscle building'),(49997,'https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/03/How-Three-Personal-Trainers-Dress-for-the-Gym-Gear-Patrol-keith-v2.jpg?resize=480:*',8,'Calisthenics'),(49998,'https://media.istockphoto.com/id/675179390/photo/muscular-trainer-writing-on-clipboard.jpg?s=612x612&w=0&k=20&c=9NKx1AwVMpPY0YBlk5H-hxx2vJSCu1Wc78BKRM9wFq0=',9,'Weight loss'),(49999,'https://images.unsplash.com/photo-1597347324655-f99149f2e285?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',3,'Muscle building'),(59999,'https://media.istockphoto.com/id/1324042769/photo/confident-gym-owner.jpg?b=1&s=170667a&w=0&k=20&c=iuz1kcCB1w8CBf44nub1mYr-F--88dLRjJvM-5uPahY=',6,'Flexibility'),(69999,'https://images.unsplash.com/photo-1604480133080-602261a680df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3ltJTIwdHJhaW5lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',25,'Weight loss');
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
INSERT INTO `users` VALUES ('tanmay.skater@gmail.com','Tanmay Kapoor','6179358069','2000-12-11','Male','$2a$10$f0ZalG2kizpmsE0texFLxunSZSV9MH/cnD0shpQaV7M73ZU2JDx5S',6);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `randomly_assign_health_plan` AFTER INSERT ON `users` FOR EACH ROW BEGIN
	SELECT getRandomTrainer(NEW.gym_id) INTO @trainer;
    SELECT getRandomWorkoutPlan() INTO @workout_plan;
    SELECT getRandomDietPlan() INTO @diet_plan;
    
	INSERT INTO health_plans (trainer_id, email, workout_plan, diet_plan, description) 
    VALUES (@trainer, NEW.email, @workout_plan, @diet_plan, "Randomly assigned plan");
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `workout_plans`
--

DROP TABLE IF EXISTS `workout_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_plans` (
  `plan_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `excercise_1` varchar(32) DEFAULT NULL,
  `excercise_2` varchar(32) DEFAULT NULL,
  `excercise_3` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  UNIQUE KEY `name` (`name`),
  KEY `excercise_1` (`excercise_1`),
  KEY `excercise_2` (`excercise_2`),
  KEY `excercise_3` (`excercise_3`),
  CONSTRAINT `workout_plans_ibfk_1` FOREIGN KEY (`excercise_1`) REFERENCES `excercises` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `workout_plans_ibfk_2` FOREIGN KEY (`excercise_2`) REFERENCES `excercises` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `workout_plans_ibfk_3` FOREIGN KEY (`excercise_3`) REFERENCES `excercises` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_plans`
--

LOCK TABLES `workout_plans` WRITE;
/*!40000 ALTER TABLE `workout_plans` DISABLE KEYS */;
INSERT INTO `workout_plans` VALUES (1,'Muscle gain','Excercises that focus on increasing muscle strength','Cable Fly','Squats','Deadlift'),(2,'Flexibility increase','Excercises that stretch muscle thereby increasing flexibility in the long run','Squats','Burpees','Leg Press'),(3,'Weight loss','Do difficult excercises to burn excess fat in the body','Bench Press','Leg Press','Burpees');
/*!40000 ALTER TABLE `workout_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'absolute_fitness'
--

--
-- Dumping routines for database 'absolute_fitness'
--
/*!50003 DROP FUNCTION IF EXISTS `getRandomDietPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getRandomDietPlan`() RETURNS int
    READS SQL DATA
BEGIN
	DECLARE random_diet INT;
    
	SELECT plan_id INTO random_diet FROM diet_plans
    ORDER BY RAND()
    LIMIT 1;
    
    RETURN random_diet;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getRandomTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getRandomTrainer`(v_gym INT) RETURNS int
    READS SQL DATA
BEGIN
	DECLARE random_trainer INT;
    DECLARE temp INT;
    
	SELECT s.gym_id, t.staff_id INTO temp, random_trainer FROM 
    trainers t JOIN staff s
    ON t.staff_id = s.staff_id
    HAVING s.gym_id = v_gym
    ORDER BY RAND()
    LIMIT 1;
    
    RETURN random_trainer;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getRandomWorkoutPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getRandomWorkoutPlan`() RETURNS int
    READS SQL DATA
BEGIN
	DECLARE random_workout INT;
    
	SELECT plan_id INTO random_workout FROM workout_plans
    ORDER BY RAND()
    LIMIT 1;
    
    RETURN random_workout;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addDietPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addDietPlan`(IN v_name VARCHAR(32), 
							 IN v_description VARCHAR(512), 
                             IN v_breakfast VARCHAR(100), 
                             IN v_lunch VARCHAR(100), 
                             IN v_dinner VARCHAR(100))
BEGIN 
	INSERT INTO diet_plans (name, description, breakfast, lunch, dinner) 
    VALUES (v_name, v_description, v_breakfast, v_lunch, v_dinner);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGym`(IN v_image_url VARCHAR(200), 
						IN v_phone VARCHAR(10), 
                        IN v_location VARCHAR(50), 
                        IN v_membership_fee DECIMAL(65, 2))
BEGIN
	INSERT INTO gyms (image_url, phone, location, membership_fee) 
    VALUES (v_image_url, v_phone, v_location, v_membership_fee);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addHealthRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addHealthRecord`(IN v_height DECIMAL(65, 2), 
								 IN v_weight DECIMAL(65,2), 
                                 IN v_date_calculated DATE, 
                                 IN v_bmi DECIMAL(65, 2), 
                                 IN v_email VARCHAR(30))
BEGIN
	INSERT INTO health_records (height, weight, date_calculated, bmi, email) 
    VALUES (v_height, v_weight, v_date_calculated, v_bmi, v_email);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStaff`(IN v_staff_id INT, 
						  IN v_name VARCHAR(50), 
                          IN v_phone VARCHAR(10), 
                          IN v_part_time BOOLEAN, 
                          IN v_salary DECIMAL(65, 2), 
                          IN v_description VARCHAR(512), 
                          IN v_password VARCHAR(100), 
                          IN v_gym_id INT)
BEGIN
	INSERT INTO staff (staff_id, name, phone, part_time, salary, description, password, gym_id) 
    VALUES (v_staff_id, v_name, v_phone, v_part_time, v_salary, v_description, v_password, v_gym_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addUser`(IN v_email VARCHAR(30), in v_name VARCHAR(50), 
							IN v_phone VARCHAR(10), IN v_dob DATE, 
                            IN v_sex ENUM("Male", "Female", "Other"), 
                            IN v_gym_id INT, IN v_password VARCHAR(100))
BEGIN
	INSERT INTO users (email, name, phone, dob, sex, gym_id, password) 
    VALUES (v_email, v_name, v_phone, v_dob, v_sex, v_gym_id, v_password);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addWorkoutPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addWorkoutPlan`(IN v_name VARCHAR(32), 
								IN v_description VARCHAR(512), 
                                IN v_excercise_1 VARCHAR(32), 
                                IN v_excercise_2 VARCHAR(32), 
                                IN v_excercise_3 VARCHAR(32))
BEGIN
	INSERT INTO workout_plans (name, description, excercise_1, excercise_2, excercise_3) 
    VALUES (v_name, v_description, v_excercise_1, v_excercise_2, v_excercise_2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteDietPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDietPlan`(IN v_plan_id INT)
BEGIN
	DELETE FROM diet_plans WHERE plan_id = v_plan_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteGym`(IN v_gym_id INT)
BEGIN 
	DELETE FROM gyms WHERE gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteHealthRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteHealthRecord`(IN v_record_id INT)
BEGIN 
	DELETE FROM health_records WHERE record_id = v_record_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStaff`(IN v_staff_id INT)
BEGIN
	DELETE FROM staff WHERE staff_id = v_staff_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser`(IN v_email VARCHAR(30))
BEGIN
	DELETE FROM users WHERE email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteWorkoutPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteWorkoutPlan`(IN v_plan_id INT)
BEGIN
	DELETE FROM workout_plans WHERE plan_id = v_plan_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAdmin`(IN v_staff_id INT)
BEGIN 
	SELECT * FROM 
    staff s JOIN gym_admins a
	ON s.staff_id = a.staff_id
    HAVING a.staff_id = v_staff_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllDietPlans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllDietPlans`()
BEGIN 
	SELECT d.*, m1.calories as breakfast_calories, m1.image_url as breakfast_url,
			m2.calories as lunch_calories, m2.image_url as lunch_url, 
			m3.calories as dinner_calories, m3.image_url as dinner_url FROM
	((diet_plans d LEFT JOIN meal_choices m1 
    on d.breakfast = m1.meal) 
	LEFT JOIN meal_choices m2 ON d.lunch = m2.meal) 
	LEFT JOIN meal_choices m3 ON d.dinner = m3.meal;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllEquipmentsForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllEquipmentsForGym`(IN v_gym_id INT)
BEGIN 
    SELECT e.*, g.gym_id, g.quantity, g.last_serviced FROM equipments e LEFT JOIN gym_equipments g
    ON e.equipment_id = g.equipment_id
    HAVING g.gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllFacilitiesForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllFacilitiesForGym`(IN v_gym_id INT)
BEGIN 
    SELECT f.*, g.gym_id FROM 
	facilities f LEFT JOIN gym_facilities g 
	ON f.facility_id = g.facility_id 
	HAVING g.gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllGyms` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllGyms`()
BEGIN
	SELECT * FROM gyms;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllHealthRecords` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllHealthRecords`()
BEGIN
	SELECT * FROM health_records;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllHealthRecordsWithName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllHealthRecordsWithName`()
BEGIN
	SELECT * FROM 
    health_records h LEFT JOIN users u 
    ON h.email = u.email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllStaff`()
BEGIN
	SELECT * FROM staff;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllStaffForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllStaffForGym`(IN v_gym_id INT)
BEGIN
	SELECT * FROM staff WHERE gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllTrainersForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllTrainersForGym`(IN v_gym_id INT)
BEGIN
	SELECT name, speciality, s.staff_id, years_of_exp, t.image_url, description, g.gym_id FROM
	(staff s JOIN trainers t 
	ON s.staff_id = t.staff_id) 
	JOIN gyms g 
	ON s.gym_id = g.gym_id 
	HAVING g.gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUserHealthRecordsForTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUserHealthRecordsForTrainer`(IN v_trainer_id INT)
BEGIN
	SELECT h.trainer_id, r.* FROM 
	health_plans h JOIN users u 
	ON h.email = u.email 
	JOIN health_records r 
	ON u.email = r.email 
	HAVING h.trainer_id = v_trainer_id 
	ORDER BY r.date_calculated ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUsers`()
BEGIN
	SELECT * FROM users;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllUsersForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUsersForGym`(IN v_gym_id INT)
BEGIN
	SELECT * FROM users WHERE gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllWorkoutPlans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllWorkoutPlans`()
BEGIN
	SELECT w.*, e1.image_url as e1_url, e1.sets as e1_sets, e1.reps as e1_reps, 
		   e2.image_url as e2_url, e2.sets as e2_sets, e2.reps as e2_reps, 
		   e3.image_url as e3_url, e3.sets as e3_sets, e3.reps as e3_reps FROM 
	((workout_plans w LEFT JOIN excercises e1 
	ON w.excercise_1 = e1.name) 
	LEFT JOIN excercises e2 
	ON w.excercise_2 = e2.name) 
	LEFT JOIN excercises e3 
	ON w.excercise_3 = e3.name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAlTrainersForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAlTrainersForGym`(IN v_gym_id INT)
BEGIN
	SELECT name, speciality, s.staff_id, years_of_exp, t.image_url, description, g.gym_id FROM 
	(staff s JOIN trainers t 
	ON s.staff_id = t.staff_id)
	JOIN gyms g 
	ON s.gym_id = g.gym_id 
	HAVING g.gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDietPlanForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDietPlanForUser`(IN v_email VARCHAR(30))
BEGIN 
	SELECT h.email, d.*, 
			m1.calories as m1_calories, m1.image_url as m1_url, 
			m2.calories as m2_calories, m2.image_url as m2_url, 
			m3.calories as m3_calories, m3.image_url as m3_url FROM 
	health_plans h LEFT JOIN diet_plans d 
	ON h.diet_plan = d.plan_id
	LEFT JOIN meal_choices m1 ON d.breakfast = m1.meal 
	LEFT JOIN meal_choices m2 ON d.lunch = m2.meal 
	LEFT JOIN meal_choices m3 ON d.dinner = m3.meal 
	HAVING h.email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getGym`(IN v_gym_id INT)
BEGIN
	SELECT * FROM gyms WHERE gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHealthPlanForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHealthPlanForUser`(IN v_email VARCHAR(30))
BEGIN 
	SELECT u.email, u.name, h.description as health_plan_description,
			t.staff_id as trainer_id, t.image_url as trainer_url,
			s.name as trainer_name, s.phone as trainer_phone, 
			w.plan_id as workout_plan_id, w.name as workout_plan_name, 
			w.description as workout_description, w.excercise_1, w.excercise_2, w.excercise_3, 
			d.plan_id as diet_plan_id, d.name as diet_name, d.description as diet_description, 
			d.breakfast, d.lunch, d.dinner FROM 
	((((users u JOIN health_plans h 
	ON h.email = u.email) 
	JOIN trainers t 
	ON h.trainer_id = t.staff_id) 
	JOIN staff s 
	ON t.staff_id = s.staff_id)
	JOIN workout_plans w  
	ON h.workout_plan = w.plan_id) 
	JOIN diet_plans d 
	ON h.diet_plan = d.plan_id 
	HAVING email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHealthRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHealthRecord`(IN v_record_id INT)
BEGIN
	SELECT * FROM health_records WHERE record_id = v_record_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getHealthRecordsForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getHealthRecordsForUser`(IN v_email VARCHAR(30))
BEGIN 
	SELECT * FROM health_records WHERE email = v_email ORDER BY date_calculated ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStaff`(IN v_staff_id INT)
BEGIN
	SELECT * FROM staff WHERE staff_id = v_staff_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTrainer`(IN v_staff_id INT)
BEGIN 
	SELECT * FROM trainers WHERE staff_id = v_staff_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getUser`(IN v_email VARCHAR(30))
BEGIN
	SELECT * FROM users WHERE email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWorkoutPlanForUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWorkoutPlanForUser`(IN v_email VARCHAR(30))
BEGIN 
	SELECT h.email, w.*,
		   e1.sets as e1_sets, e1.reps as e1_reps, e1.image_url as e1_url, 
		   e2.sets as e2_sets, e2.reps as e2_reps, e2.image_url as e2_url, 
		   e3.sets as e3_sets, e3.reps as e3_reps, e3.image_url as e3_url FROM 
	health_plans h JOIN workout_plans w ON 
	h.workout_plan = w.plan_id 
	LEFT JOIN excercises e1 ON w.excercise_1 = e1.name 
	LEFT JOIN excercises e2 ON w.excercise_2 = e2.name 
	LEFT JOIN excercises e3 ON w.excercise_3 = e3.name 
	HAVING h.email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateDietPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateDietPlan`(IN v_name VARCHAR(32), 
							 IN v_description VARCHAR(512), 
                             IN v_breakfast VARCHAR(100), 
                             IN v_lunch VARCHAR(100), 
                             IN v_dinner VARCHAR(100),
                             IN v_plan_id INT)
BEGIN 
	UPDATE diet_plans SET
	name = v_name, description = v_description, breakfast = v_breakfast, lunch = v_lunch, dinner = v_dinner
	WHERE plan_id = v_plan_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateEquipmentForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEquipmentForGym`(IN v_gym_id INT, 
									   IN v_equipment_id INT, 
                                       IN v_quantity INT, 
                                       IN v_last_serviced DATE)
BEGIN
	UPDATE gym_equipments SET
    quantity = v_quantity, last_serviced = v_last_serviced
    WHERE gym_id = v_gym_id AND equipment_id = v_equipment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGym`(IN v_image_url VARCHAR(200), 
						IN v_phone VARCHAR(10), 
                        IN v_location VARCHAR(50), 
                        IN v_membership_fee DECIMAL(65, 2),
                        IN v_gym_id INT)
BEGIN
	UPDATE gyms SET 
    image_url = v_image_url, phone = v_phone, location = v_location, membership_fee = v_membership_fee 
    WHERE gym_id = v_gym_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateHealthRecord` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateHealthRecord`(IN v_height DECIMAL(65, 2), 
								 IN v_weight DECIMAL(65,2), 
                                 IN v_date_calculated DATE, 
                                 IN v_bmi DECIMAL(65, 2), 
                                 IN v_email VARCHAR(30),
                                 IN v_record_id INT)
BEGIN 
	UPDATE health_records SET 
		height = v_height, weight = v_weight, 
		date_calculated = v_date_calculated, 
		bmi = v_bmi, email = v_email 
    WHERE record_id = v_record_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateStaff` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateStaff`(IN v_name VARCHAR(50), 
						     IN v_phone VARCHAR(10), 
						     IN v_part_time BOOLEAN, 
						     IN v_salary DECIMAL(65, 2), 
						     IN v_description VARCHAR(512), 
						     IN v_password VARCHAR(100),
                             IN v_staff_id INT)
BEGIN
	UPDATE staff SET 
		name = v_name, phone = v_phone, 
        part_time = v_part_time, 
        salary = v_salary, 
        description = v_description, 
        password = v_password 
	WHERE staff_id = v_staff_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser`(IN v_name VARCHAR(50), IN v_phone VARCHAR(10), 
							IN v_dob DATE, IN v_sex ENUM ("Male", "Female", "Other"), 
                            IN v_gym_id INT, IN v_password VARCHAR(100),
                            IN v_email VARCHAR(30))
BEGIN
	UPDATE users SET 
    name = v_name, phone = v_phone, dob = v_dob, sex = v_sex, gym_id = v_gym_id, password = v_password
    WHERE email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateWorkoutPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateWorkoutPlan`(IN v_name VARCHAR(32), 
									IN v_description VARCHAR(512), 
									IN v_excercise_1 VARCHAR(32),
                                    IN v_excercise_2 VARCHAR(32),
                                    IN v_excercise_3 VARCHAR(32))
BEGIN
	UPDATE workout_plans SET 
		name = v_name, description = v_description, 
        excercise_1 = v_excercise_1, excercise_2 = v_excercise_2, excercise_3 = v_excercise_3
	WHERE plan_id = v_plan_id;
END ;;
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

-- Dump completed on 2022-12-08 23:05:22
