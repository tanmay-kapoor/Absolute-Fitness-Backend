CREATE DATABASE  IF NOT EXISTS `af3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `af3`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: af3
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
-- Temporary view structure for view `diet_plan_details`
--

DROP TABLE IF EXISTS `diet_plan_details`;
/*!50001 DROP VIEW IF EXISTS `diet_plan_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `diet_plan_details` AS SELECT 
 1 AS `email`,
 1 AS `plan_id`,
 1 AS `name`,
 1 AS `description`,
 1 AS `breakfast`,
 1 AS `lunch`,
 1 AS `dinner`,
 1 AS `m1_calories`,
 1 AS `m1_url`,
 1 AS `m2_calories`,
 1 AS `m2_url`,
 1 AS `m3_calories`,
 1 AS `m3_url`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diet_plans`
--

LOCK TABLES `diet_plans` WRITE;
/*!40000 ALTER TABLE `diet_plans` DISABLE KEYS */;
INSERT INTO `diet_plans` VALUES (1,'Weight loss','Have smoothie and healthy foods to cleanse your body of the toxins and help boost weight reduction at the same time.','Vegetable Smoothie','Chicken','Oats'),(2,'All purpose diet','Plan that is designed to help in every aspect of the body\'s healing process','Porridge','Boiled Kidney Beans','Chicken'),(5,'Carnivore diet','Eat more of non vegetarian food to cure gut problems and increase protein intake','Boiled eggs','Red meat steak','Chicken'),(6,'Protein increase','Have food throghout the day that are rich in protein','Vegetable smoothie','Boiled eggs','Chicken'),(13,'Low Fat','Food that makes you full but doesnt have unhelathy fats.','Porridge','Fruits','Sweet potato'),(14,'High Carb','High carbs, must make you sleepy.','Quinoa','Oats','Boiled Kidney Beans'),(15,'Ketogenic diet','Helps in weight loss. Should not be a regular diet. Only for short intervals.','Boiled eggs','Feta Cheese Wrap','Sauted Vegetables'),(16,'Vegan','For vegan lovers','Fruits','Oats','Vegetable Smoothie'),(17,'Intermittent fasting','Eat less, lose more fat. But strategically!','Oats','Sweet potato','Fruits'),(18,'Low sodium diet','low sodium diet','Vegetable Smoothie','Fruits','Oats');
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipments`
--

LOCK TABLES `equipments` WRITE;
/*!40000 ALTER TABLE `equipments` DISABLE KEYS */;
INSERT INTO `equipments` VALUES (1,'Chest Press Machine','https://www.technogym.com/media/catalog/product/cache/1/image/040ec09b1e35df139433887a97daa66f/M/G/MG1500_purestrength_inclinechestpress_hero_01_22.jpg'),(2,'Seated Dip Machine','https://static.strengthlevel.com/images/illustrations/seated-dip-machine-1000x1000.jpg'),(3,'Treadmill','https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6514/6514023_sd.jpg;maxHeight=640;maxWidth=550'),(4,'Excercise Bike','https://res.cloudinary.com/iconfitness/image/upload/dpr_3.0,f_auto,q_auto,w_500/v1/site--6/PFEX16718_1-01068.jpg'),(5,'Dumbbells','https://cdn.shopify.com/s/files/1/0471/3879/9774/products/210310_Dumbbells_2270x1500_d524e6c4-85b9-4244-abad-2e3e876e4a84_600x.jpg?v=1645084642'),(6,'Barbell','https://www.mensjournal.com/wp-content/uploads/mf/barbell_abs_main.jpg?w=1188&h=630&crop=1&quality=86&strip=all'),(7,'Leg press machine','https://truefitness.com/wp-content/uploads/2019/11/SPL0300-Acrylic-Alabaster_960-1.png'),(8,'Pullup bar','https://cdn.shopify.com/s/files/1/0471/3879/9774/products/XGYM-LSR-3.0-01-F07_main_1035x@2x.jpg?v=1669753609%202x'),(9,'Kettle bells','https://m.media-amazon.com/images/I/41luBUoSyFL._AC_SY1000_.jpg'),(10,'Pec fly machine','https://www.titan.fitness/dw/image/v2/BDBZ_PRD/on/demandware.static/-/Sites-masterCatalog_Titan/default/dw5058b97d/images/hi-res/Fitness/401494_01.jpg?sw=1001&sh=1000'),(28,'Rowing Machine','https://absolute-fitness-tk.s3.amazonaws.com/6bcaf682-2250-4fdb-869d-ef9cda6acf94'),(41,'Crosstrainer','https://absolute-fitness-tk.s3.amazonaws.com/82c4b5e3-496b-4ac6-9341-174226d093e3'),(42,'Stairmaster','https://images-na.ssl-images-amazon.com/images/I/71dkN94jjsL._AC_UL600_SR600,600_.jpg'),(43,'Resistance bands','https://i.ebayimg.com/images/g/7IYAAOSwjkFf5v2F/s-l400.jpg');
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
INSERT INTO `excercises` VALUES ('Bench Press',5,40,'https://cdn.mos.cms.futurecdn.net/pLaRi5jXSHDKu6WRydetBo-1200-80.jpg'),('Bicep curls',20,3,'https://cdn-0.weighttraining.guide/wp-content/uploads/2022/06/Two-arm-dumbbell-curl.png?ezimgfmt=ng%3Awebp%2Fngcb4'),('Burpees',10,25,'https://www.muscleandfitness.com/wp-content/uploads/2017/04/burpee-1109.jpg?w=1200&h=630&crop=1&quality=86&strip=all'),('Cable Fly',5,20,'https://s3.amazonaws.com/prod.skimble/assets/1531497/image_iphone.jpg'),('Deadlift',2,30,'https://cdn.muscleandstrength.com/sites/default/files/deadlift_0.jpg'),('Leg Press',3,20,'https://fitnessvolt.com/wp-content/uploads/2022/05/Leg-Press-Foot-Placements.jpg'),('Lunges',20,5,'https://weighttraining.guide/wp-content/uploads/2016/10/Dumbbell-Lunge-resized-fixed.png'),('Pull Ups',10,3,'https://cdn.shopify.com/s/files/1/0705/5432/1194/files/mikolo-pull-ups-blog-2.png?v=1693468017'),('Push Ups',15,3,'https://www.fitnesseducation.edu.au/wp-content/uploads/2017/03/Pushups.jpg'),('Squats',3,15,'https://images.healthshots.com/healthshots/en/uploads/2021/09/06145503/shutterstock_1563301450.jpg');
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
  `staff_id` varchar(30) NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`staff_id`,`gym_id`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `gym_admins_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gym_admins_ibfk_2` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_admins`
--

LOCK TABLES `gym_admins` WRITE;
/*!40000 ALTER TABLE `gym_admins` DISABLE KEYS */;
INSERT INTO `gym_admins` VALUES ('11111@gmail.com',1),('22222@gmail.com',2),('33333@gmail.com',3),('44444@gmail.com',4),('55555@gmail.com',5),('66666@gmail.com',6),('gg@wp.com',97),('new.admin45@gmail.com',105),('new1.admin@gmail.com',107),('qnew.admin@gmail.com',108),('new.admin4@gmail.com',109),('new.admin110@gmail.com',113),('new.ad11min@gmail.com',114),('new22.admin@gmail.com',115),('new.admhhin@gmail.com',116),('new.admin@gmail.com2',117),('new.admin@gmail.in',118),('new.admin@hmail.com',119);
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
INSERT INTO `gym_equipments` VALUES (1,1,16,'2023-12-07'),(1,3,17,'2022-12-09'),(1,5,21,'2019-09-15'),(1,7,20,'2021-11-11'),(1,9,20,NULL),(1,28,12,'2021-10-09'),(1,43,45,NULL),(2,1,10,NULL),(2,2,15,'2019-10-10'),(2,3,18,'2015-01-01'),(2,4,12,'2022-08-08'),(2,5,38,NULL),(2,6,27,'2021-12-12'),(2,7,14,NULL),(2,8,7,NULL),(2,9,29,'2010-01-01'),(2,10,22,'2009-01-01'),(3,1,10,'2022-10-10'),(3,2,22,'2022-10-10'),(3,4,4,'2010-10-10'),(3,8,14,'2021-10-10'),(3,9,2,NULL),(4,3,10,NULL),(4,7,12,'2022-01-01'),(5,2,11,'2022-09-15'),(5,4,10,'2022-11-11'),(5,5,22,'2022-11-11'),(6,2,34,'2022-09-09'),(6,7,38,'2021-09-08'),(6,8,8,'2020-10-10'),(6,9,7,'2016-12-15');
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
-- Table structure for table `gym_image_urls`
--

DROP TABLE IF EXISTS `gym_image_urls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_image_urls` (
  `image_url` varchar(200) NOT NULL,
  `gym_id` int NOT NULL,
  PRIMARY KEY (`image_url`,`gym_id`),
  KEY `gym_id` (`gym_id`),
  CONSTRAINT `gym_image_urls_ibfk_1` FOREIGN KEY (`gym_id`) REFERENCES `gyms` (`gym_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_image_urls`
--

LOCK TABLES `gym_image_urls` WRITE;
/*!40000 ALTER TABLE `gym_image_urls` DISABLE KEYS */;
INSERT INTO `gym_image_urls` VALUES ('https://bodyandstrength.com/Upload/site/wJSUa_cover.jpg',1),('https://cdn.abcotvs.com/dip/images/6193988_051820-wpvi-annie-nj-gyms-video-vid.jpg',1),('https://cdn.vox-cdn.com/thumbor/2Bcpu3cwfzZJ2gUnhWaiyWFS0Mw=/0x0:8238x5492/1200x800/filters:focal(3460x2087:4778x3405)/cdn.vox-cdn.com/uploads/chorus_image/image/67606043/GettyImages_1132006407.0.jpg',1),('https://cdn.abcotvs.com/dip/images/6193988_051820-wpvi-annie-nj-gyms-video-vid.jpg',2),('https://cdn.abcotvs.com/dip/images/6193988_051820-wpvi-annie-nj-gyms-video-vid.jpg',3),('https://images.squarespace-cdn.com/content/v1/56e487181d07c0743d227289/1557248970918-530M1TO27B7Q41OEE985/fitness-4-1500x77.jpg?format=1500w',3),('https://images.squarespace-cdn.com/content/v1/56e487181d07c0743d227289/1557248970918-530M1TO27B7Q41OEE985/fitness-4-1500x77.jpg?format=1500w',4),('https://gymmboxx.com/wp-content/uploads/2020/02/WhatsApp-Image-2020-02-09-at-6.32.11-PM.jpeg',5),('https://cdn.vox-cdn.com/thumbor/2Bcpu3cwfzZJ2gUnhWaiyWFS0Mw=/0x0:8238x5492/1200x800/filters:focal(3460x2087:4778x3405)/cdn.vox-cdn.com/uploads/chorus_image/image/67606043/GettyImages_1132006407.0.jpg',6),('https://thumbs.dreamstime.com/b/gym-24699087.jpg',97),('https://thumbs.dreamstime.com/b/gym-24699087.jpg',105),('https://www.lakeflato.com/sites/default/files/project-media/8_1.jpg',105),('https://www.lakeflato.com/sites/default/files/project-media/8_1.jpg',107),('https://www.lakeflato.com/sites/default/files/project-media/8_1.jpg',108),('https://www.lakeflato.com/sites/default/files/project-media/8_1.jpg',109),('https://www.lakeflato.com/sites/default/files/project-media/8_1.jpg',110);
/*!40000 ALTER TABLE `gym_image_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gyms`
--

DROP TABLE IF EXISTS `gyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyms` (
  `gym_id` int NOT NULL AUTO_INCREMENT,
  `branch` varchar(50) DEFAULT NULL,
  `pincode` varchar(5) NOT NULL DEFAULT '00000',
  `phone` varchar(10) NOT NULL,
  `location` varchar(512) NOT NULL,
  `membership_fee` decimal(65,2) NOT NULL,
  PRIMARY KEY (`gym_id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `location` (`location`),
  UNIQUE KEY `location_2` (`location`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gyms`
--

LOCK TABLES `gyms` WRITE;
/*!40000 ALTER TABLE `gyms` DISABLE KEYS */;
INSERT INTO `gyms` VALUES (0,NULL,'00000','1100221100','none',0.00),(1,'Austin','56340','2025550113','55 Centre Avenue, #30, Austin, TX, 56341',100.00),(2,'Queens','11385','2025550308','65-45 Otto Rd, Queens, NY 11385',253.99),(3,NULL,'92101','7097534584','350 Tenth Ave, San Diego, CA 92101',75.00),(4,'Boston','02130','8057779321','2565 Washington St Suite B, Boston, MA 02130',59.37),(5,'Los Angeles','90071','6011185333','515 S Figueroa St #102, Los Angeles, CA 90071',195.46),(6,'Seattle','98109','2025550250','1146 Harrison St, Seattle WA 98109',86.98),(97,NULL,'85303','1677975333','83rd Avenue and, Bethany Home Rd, Glendale, AZ 85303',1925.45),(105,'Bronx','69402','6969796969','18 Bronx',100.00),(107,'Brampton','69426','6969696969','17 Brampton, Indian Street',100.00),(108,'Steroid Fitness 22','69413','6969699969','18 Columbia22',100.00),(109,'Steroid Fitness 24','69444','6969696964','18 Columbia',100.00),(110,'Steroid Fitness 67','69402','6999696969','18 Columbia 348',100.00),(113,'Steroid Fitness99','65420','6979696969','18 Columbia110',100.00),(114,'Steroid Fitness22','19420','6829696969','18 Columbia111',100.00),(115,'Steroid Fitn22ess','69262','6699696969','18 Colum22bia',100.00),(116,'Steroid Fitnessgg','69487','6969966969','gg18 Columbia',100.00),(117,'32Steroid Fitness','64420','6269696969','18 Columbia2323',100.00),(118,'Steroid Fitness','69420','0009696969','18 Columbiartwetertwertwert',100.00),(119,'Steroid Fitness','69420','0000696969','18 Columbia23213',100.00);
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
  `trainer_id` varchar(30) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_plans`
--

LOCK TABLES `health_plans` WRITE;
/*!40000 ALTER TABLE `health_plans` DISABLE KEYS */;
INSERT INTO `health_plans` VALUES (6,NULL,'tanmay.skater@gmail.com',3,2,'Randomly assigned plan'),(8,NULL,'rand@rand.com',3,2,'Randomly assigned plan'),(10,'19995@gmail.com','david@gmail.com',2,5,'Randomly assigned plan'),(11,'19995@gmail.com','ariana@gmail.com',2,2,'Randomly assigned plan'),(12,'19995@gmail.com','selena@gmail.com',3,2,'Randomly assigned plan'),(13,NULL,'simon@gmail.com',2,2,'Randomly assigned plan'),(14,'29997@gmail.com','rikc.2000@gmail.com',3,6,'Randomly assigned plan'),(16,NULL,'shashwat@gmail.com',2,5,'Randomly assigned plan'),(17,'19998@gmail.com','michelle@gmail.com',2,2,'Randomly assigned plan'),(18,'19999@gmail.com','robert@gmail.com',2,2,'Randomly assigned plan'),(20,'19994@gmail.com','emma@gmail.com',3,2,'Randomly assigned plan'),(21,'19994@gmail.com','ross@gmail.com',2,2,'Randomly assigned plan'),(22,'19994@gmail.com','parth@gmail.com',3,2,'Randomly assigned plan'),(23,'19994@gmail.com','arpan@gmail.com',2,5,'Randomly assigned plan'),(27,'19996@gmail.com','girish@gmail.com',3,6,'Randomly assigned plan'),(28,'19996@gmail.com','cook@gmail.com',1,2,'Randomly assigned plan'),(29,'29996@gmail.com','alex@gmail.com',3,5,'Randomly assigned plan'),(30,'29996@gmail.com','louis@gmail.com',1,6,'Randomly assigned plan'),(31,'49999@gmail.com','kaldon@hotmail.com',1,5,'Randomly assigned plan'),(32,'49999@gmail.com','kelly@neu.com',1,6,'Randomly assigned plan'),(33,'59999@gmail.com','ziya@google.com',2,1,'Randomly assigned plan'),(34,'29997@gmail.com','mark@gmail.com',1,2,'Randomly assigned plan'),(35,'39996@gmail.com','iggy@gmail.com',3,6,'Randomly assigned plan'),(36,'39996@gmail.com','britney@gmail.com',3,5,'Randomly assigned plan'),(37,NULL,'katy@gmail.com',2,5,'Randomly assigned plan'),(38,'19999@gmail.com','john@gmail.com',2,1,'Randomly assigned plan'),(39,'19994@gmail.com','tom@gmail.com',1,2,'Randomly assigned plan'),(40,'19998@gmail.com','tim@gmail.com',2,2,'Randomly assigned plan'),(41,'39994@gmail.com','4@5.com',1,5,'Randomly assigned plan'),(42,NULL,'9@9.com',1,1,'Randomly assigned plan'),(43,'29996@gmail.com','test.yes@gmail.com',3,6,'Randomly assigned plan'),(44,'29998@gmail.com','random@u.com',1,14,'Randomly assigned plan'),(45,NULL,'albono@gmail.com',51,15,'Randomly assigned plan');
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
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_records`
--

LOCK TABLES `health_records` WRITE;
/*!40000 ALTER TABLE `health_records` DISABLE KEYS */;
INSERT INTO `health_records` VALUES (1,185.00,89.00,'2022-12-08',26.00,'tanmay.skater@gmail.com'),(2,185.00,97.00,'2022-08-26',28.34,'tanmay.skater@gmail.com'),(3,185.00,95.15,'2022-09-11',27.80,'tanmay.skater@gmail.com'),(4,185.00,95.80,'2022-09-18',27.99,'tanmay.skater@gmail.com'),(5,185.00,95.35,'2022-09-23',27.86,'tanmay.skater@gmail.com'),(6,185.00,93.10,'2022-11-01',27.20,'tanmay.skater@gmail.com'),(7,185.00,91.15,'2022-11-23',26.63,'tanmay.skater@gmail.com'),(8,185.00,90.65,'2022-12-04',26.49,'tanmay.skater@gmail.com'),(13,175.00,107.00,'2018-06-05',34.94,'david@gmail.com'),(14,175.00,117.00,'2019-03-28',38.20,'david@gmail.com'),(15,175.00,112.00,'2019-04-06',36.57,'david@gmail.com'),(16,175.00,92.00,'2020-01-15',30.04,'david@gmail.com'),(17,175.00,85.00,'2021-10-20',27.76,'david@gmail.com'),(18,175.00,90.00,'2022-12-09',29.39,'david@gmail.com'),(19,167.00,52.20,'2020-08-14',18.72,'ariana@gmail.com'),(20,167.00,49.90,'2021-01-14',17.89,'ariana@gmail.com'),(21,167.00,53.00,'2021-02-15',19.00,'ariana@gmail.com'),(22,167.00,54.00,'2021-03-15',19.36,'ariana@gmail.com'),(23,167.00,54.80,'2021-05-15',19.65,'ariana@gmail.com'),(24,167.00,60.00,'2021-09-22',21.51,'ariana@gmail.com'),(25,167.00,60.60,'2021-12-31',21.73,'ariana@gmail.com'),(26,167.00,60.40,'2022-02-28',21.66,'ariana@gmail.com'),(27,172.00,53.99,'2019-05-09',18.25,'selena@gmail.com'),(28,175.00,78.20,'2021-01-01',25.53,'selena@gmail.com'),(29,175.00,87.32,'2021-07-21',28.51,'selena@gmail.com'),(30,178.00,81.00,'2021-09-22',25.56,'selena@gmail.com'),(31,178.00,79.24,'2021-10-11',25.01,'selena@gmail.com'),(32,178.00,72.00,'2021-12-21',22.72,'selena@gmail.com'),(33,178.00,70.90,'2022-03-25',22.38,'selena@gmail.com'),(34,188.00,164.00,'2022-02-17',46.40,'simon@gmail.com'),(35,188.00,144.00,'2022-05-18',40.74,'simon@gmail.com'),(36,188.00,104.00,'2022-08-20',29.43,'simon@gmail.com'),(37,188.00,95.30,'2022-10-25',26.96,'simon@gmail.com'),(38,188.00,87.20,'2022-11-29',24.67,'simon@gmail.com'),(39,169.00,69.00,'2019-11-09',24.16,'rikc.2000@gmail.com'),(40,174.00,74.00,'2020-02-20',24.44,'rikc.2000@gmail.com'),(41,174.00,76.40,'2020-05-07',25.23,'rikc.2000@gmail.com'),(42,174.00,75.90,'2020-07-16',25.07,'rikc.2000@gmail.com'),(43,174.00,76.20,'2020-08-12',25.17,'rikc.2000@gmail.com'),(44,174.00,75.88,'2021-10-14',25.06,'rikc.2000@gmail.com'),(45,174.00,75.29,'2022-06-23',24.87,'rikc.2000@gmail.com'),(46,174.00,76.33,'2022-12-02',25.21,'rikc.2000@gmail.com'),(53,157.00,52.00,'2022-04-06',21.10,'shashwat@gmail.com'),(54,157.00,54.00,'2022-06-15',21.91,'shashwat@gmail.com'),(55,157.00,54.60,'2022-07-21',22.15,'shashwat@gmail.com'),(56,157.00,56.90,'2022-08-11',23.08,'shashwat@gmail.com'),(57,157.00,58.00,'2022-10-13',23.53,'shashwat@gmail.com'),(58,157.00,58.30,'2022-11-17',23.65,'shashwat@gmail.com'),(59,157.00,56.40,'2022-11-30',22.88,'shashwat@gmail.com'),(60,174.00,89.00,'2020-01-06',29.40,'robert@gmail.com'),(61,174.00,97.00,'2020-05-14',32.04,'robert@gmail.com'),(62,174.00,98.60,'2020-08-03',32.57,'robert@gmail.com'),(63,174.00,92.00,'2020-09-30',30.39,'robert@gmail.com'),(64,174.00,88.35,'2020-10-21',29.18,'robert@gmail.com'),(65,174.00,87.59,'2020-11-25',28.93,'robert@gmail.com'),(66,174.00,85.98,'2020-12-30',28.40,'robert@gmail.com'),(67,174.00,81.45,'2021-04-30',26.90,'robert@gmail.com'),(68,174.00,79.59,'2021-07-21',26.29,'robert@gmail.com'),(77,172.56,45.77,'2021-12-22',15.37,'emma@gmail.com'),(78,172.56,49.55,'2022-02-18',16.64,'emma@gmail.com'),(79,175.80,54.00,'2022-03-23',17.47,'emma@gmail.com'),(80,177.00,57.65,'2022-05-31',18.40,'emma@gmail.com'),(81,179.00,67.00,'2022-07-30',20.91,'emma@gmail.com'),(82,179.00,67.44,'2022-09-27',21.05,'emma@gmail.com'),(83,181.33,68.33,'2022-12-07',20.78,'emma@gmail.com'),(84,181.33,69.39,'2022-12-09',21.10,'emma@gmail.com'),(85,194.00,78.33,'2020-06-13',20.81,'ross@gmail.com'),(86,194.00,82.54,'2020-08-04',21.93,'ross@gmail.com'),(87,194.00,98.00,'2021-06-08',26.04,'ross@gmail.com'),(88,194.00,96.26,'2021-07-14',25.58,'ross@gmail.com'),(89,194.00,99.00,'2021-09-13',26.30,'ross@gmail.com'),(90,194.00,95.36,'2021-11-08',25.34,'ross@gmail.com'),(91,194.00,90.24,'2022-02-26',23.98,'ross@gmail.com'),(92,194.00,89.26,'2022-03-15',23.72,'ross@gmail.com'),(93,194.00,84.98,'2022-05-26',22.58,'ross@gmail.com'),(94,194.00,86.29,'2022-06-24',22.93,'ross@gmail.com'),(95,194.00,87.27,'2022-07-22',23.19,'ross@gmail.com'),(96,186.29,89.98,'2022-05-02',25.93,'parth@gmail.com'),(97,186.29,87.49,'2022-05-26',25.21,'parth@gmail.com'),(98,186.29,86.47,'2022-06-08',24.92,'parth@gmail.com'),(99,186.29,85.29,'2022-06-15',24.58,'parth@gmail.com'),(100,186.29,82.22,'2022-06-30',23.69,'parth@gmail.com'),(101,186.29,81.12,'2022-07-08',23.37,'parth@gmail.com'),(102,186.29,79.30,'2022-07-21',22.85,'parth@gmail.com'),(103,186.29,75.19,'2022-08-26',21.67,'parth@gmail.com'),(104,186.29,71.20,'2022-10-25',20.52,'parth@gmail.com'),(105,186.29,73.29,'2022-11-09',21.12,'parth@gmail.com'),(106,182.39,77.00,'2021-07-12',23.15,'arpan@gmail.com'),(107,182.39,78.29,'2021-07-31',23.53,'arpan@gmail.com'),(108,182.39,78.19,'2021-09-09',23.50,'arpan@gmail.com'),(109,182.39,78.27,'2021-09-24',23.53,'arpan@gmail.com'),(110,182.39,78.17,'2021-09-30',23.50,'arpan@gmail.com'),(111,182.39,78.87,'2021-10-28',23.71,'arpan@gmail.com'),(112,182.39,77.79,'2021-11-05',23.38,'arpan@gmail.com'),(113,182.39,78.21,'2021-11-19',23.51,'arpan@gmail.com'),(121,169.29,96.22,'2021-07-06',33.57,'girish@gmail.com'),(122,169.29,98.90,'2021-07-30',34.51,'girish@gmail.com'),(123,170.29,99.67,'2021-09-24',34.37,'girish@gmail.com'),(124,170.29,97.37,'2021-10-27',33.58,'girish@gmail.com'),(125,170.29,95.20,'2021-11-25',32.83,'girish@gmail.com'),(126,170.29,94.20,'2022-02-21',32.48,'girish@gmail.com'),(127,170.29,92.10,'2022-05-24',31.76,'girish@gmail.com'),(128,170.29,93.90,'2022-06-21',32.38,'girish@gmail.com'),(129,170.29,87.28,'2022-10-25',30.10,'girish@gmail.com'),(130,173.98,49.29,'2021-06-09',16.28,'cook@gmail.com'),(131,175.00,51.99,'2021-08-19',16.98,'cook@gmail.com'),(132,175.25,55.90,'2021-09-22',18.20,'cook@gmail.com'),(133,175.25,58.00,'2021-10-27',18.88,'cook@gmail.com'),(134,175.25,59.20,'2021-11-16',19.28,'cook@gmail.com'),(135,175.25,63.20,'2021-12-15',20.58,'cook@gmail.com'),(136,175.25,63.82,'2022-02-16',20.78,'cook@gmail.com'),(137,175.25,68.00,'2022-04-18',22.14,'cook@gmail.com'),(138,175.25,78.00,'2022-05-19',25.40,'cook@gmail.com'),(139,176.28,75.29,'2022-06-22',24.23,'cook@gmail.com'),(140,176.28,78.22,'2022-07-26',25.17,'cook@gmail.com'),(141,176.28,81.57,'2022-09-28',26.25,'cook@gmail.com'),(142,184.93,74.29,'2022-01-01',21.72,'alex@gmail.com'),(143,187.00,79.76,'2022-03-15',22.81,'alex@gmail.com'),(144,188.00,80.39,'2022-05-03',22.75,'alex@gmail.com'),(145,182.00,98.20,'2020-06-18',29.65,'alex@gmail.com'),(146,189.22,81.20,'2022-06-14',22.68,'alex@gmail.com'),(147,189.22,85.00,'2022-08-18',23.74,'alex@gmail.com'),(148,189.22,89.00,'2022-09-22',24.86,'alex@gmail.com'),(149,189.22,98.20,'2022-11-24',27.43,'alex@gmail.com'),(154,178.29,34.28,'2021-02-16',10.78,'louis@gmail.com'),(155,178.29,42.85,'2021-04-13',13.48,'louis@gmail.com'),(156,179.28,48.73,'2021-06-22',15.16,'louis@gmail.com'),(157,179.28,58.28,'2021-07-21',18.13,'louis@gmail.com'),(158,179.28,62.18,'2021-08-25',19.35,'louis@gmail.com'),(159,179.28,70.27,'2021-08-31',21.86,'louis@gmail.com'),(160,179.28,75.28,'2021-12-01',23.42,'louis@gmail.com'),(161,179.28,87.21,'2022-01-19',27.13,'louis@gmail.com'),(162,179.28,97.20,'2022-03-02',30.24,'louis@gmail.com'),(163,196.00,92.70,'2018-08-15',24.13,'mark@gmail.com'),(164,196.00,98.22,'2018-10-18',25.57,'mark@gmail.com'),(165,196.00,94.29,'2022-03-01',24.54,'mark@gmail.com'),(166,196.00,92.18,'2022-04-19',23.99,'mark@gmail.com'),(167,196.00,93.28,'2022-05-26',24.28,'mark@gmail.com'),(168,173.34,98.27,'2021-05-06',32.71,'iggy@gmail.com'),(169,173.34,104.28,'2021-07-22',34.71,'iggy@gmail.com'),(170,173.34,108.27,'2021-09-16',36.03,'iggy@gmail.com'),(171,173.34,106.37,'2021-10-20',35.40,'iggy@gmail.com'),(172,173.34,102.46,'2021-12-10',34.10,'iggy@gmail.com'),(173,173.34,96.39,'2022-03-16',32.08,'iggy@gmail.com'),(174,173.34,92.53,'2022-06-22',30.80,'iggy@gmail.com'),(175,168.71,53.92,'2022-09-13',18.94,'britney@gmail.com'),(176,168.71,54.82,'2022-10-12',19.26,'britney@gmail.com'),(177,168.71,60.38,'2022-11-16',21.21,'britney@gmail.com'),(178,168.71,60.38,'2022-12-09',21.21,'britney@gmail.com'),(179,182.88,74.29,'2022-12-06',22.21,'britney@gmail.com'),(180,162.29,56.29,'2021-07-01',21.37,'katy@gmail.com'),(181,162.29,58.97,'2021-07-29',22.39,'katy@gmail.com'),(182,162.29,61.28,'2021-08-18',23.27,'katy@gmail.com'),(183,162.29,57.19,'2021-09-09',21.71,'katy@gmail.com'),(184,162.29,58.26,'2021-10-19',22.12,'katy@gmail.com'),(185,170.00,70.00,'2022-12-05',24.22,'tom@gmail.com'),(186,175.00,75.00,'2022-12-07',24.49,'tom@gmail.com'),(187,175.00,68.00,'2022-12-09',22.20,'tom@gmail.com'),(188,170.00,70.00,'2022-12-04',24.22,'tim@gmail.com'),(189,175.00,75.00,'2022-12-07',24.49,'tim@gmail.com'),(190,175.00,85.00,'2022-12-10',27.76,'tim@gmail.com'),(191,187.00,85.00,'2023-11-16',24.31,'tanmay.skater@gmail.com'),(192,190.00,84.00,'2022-11-11',23.27,'tanmay.skater@gmail.com'),(193,185.00,77.00,'2021-10-28',22.50,'ross@gmail.com'),(194,188.00,104.00,'2022-08-22',29.43,'ross@gmail.com'),(195,188.00,74.00,'2023-12-07',20.94,'ross@gmail.com'),(196,186.00,89.00,'2023-12-04',25.73,'tanmay.skater@gmail.com'),(197,186.00,94.00,'2023-09-19',27.17,'tanmay.skater@gmail.com'),(198,185.00,84.00,'2023-11-26',24.54,'random@u.com'),(199,175.00,108.00,'2023-11-26',35.27,'random@u.com'),(200,186.00,102.00,'2022-01-07',29.48,'tanmay.skater@gmail.com');
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
INSERT INTO `meal_choices` VALUES ('Boiled eggs',98,'https://www.onceuponachef.com/images/2017/10/How-To-Make-Hard-Boiled-Eggs.jpg'),('Boiled Kidney Beans',120,'https://myfavouritepastime.files.wordpress.com/2019/01/img_3330.jpg'),('Chicken',250,'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/healthy-chicken-recipes-1641586837.jpeg?crop=1.00xw:0.498xh;0,0.285xh&resize=1200:*'),('Feta Cheese Wrap',129,'https://s35257.pcdn.co/wp-content/uploads/2020/10/Spinach-Feta-Wrap_1558x1177.jpg'),('Fruits',50,'https://www.diagnosisdiet.com/assets/images/7/fruit-og-0dd51728.jpg'),('Oats',150,'https://post.healthline.com/wp-content/uploads/2020/03/oats-oatmeal-732x549-thumbnail.jpg'),('Porridge',95,'https://insanelygoodrecipes.com/wp-content/uploads/2022/04/Oatmeal-Porridge-with-Nuts-and-Blueberries-in-a-Blue-Bowl.jpg'),('Quinoa',110,'https://images.immediate.co.uk/production/volatile/sites/30/2022/05/Quinoa-707f5e8.png?quality=90&resize=556,505'),('Red meat steak',120,'https://i.insider.com/60ff1914f350d50019590549?width=1136&format=jpeg'),('Sauted Vegetables',87,'https://www.budgetbytes.com/wp-content/uploads/2021/02/Simple-Saute%CC%81ed-Vegetables-side.jpg'),('Sweet potato',39,'https://www.budgetbytes.com/wp-content/uploads/2022/10/Baked-Sweet-Potatoes-close.jpg'),('Vegetable smoothie',37,'https://thekitchencommunity.org/wp-content/uploads/2022/01/vegetable-smoothie.jpg');
/*!40000 ALTER TABLE `meal_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `dob` date NOT NULL DEFAULT '1985-10-10',
  `sex` enum('Male','Female','Other') NOT NULL DEFAULT 'Male',
  `type` enum('staff','trainer','admin','root') DEFAULT NULL,
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
INSERT INTO `staff` VALUES ('11111@gmail.com','Harvey Smith','1122112277','1985-10-10','Male','admin',0,45000.00,'Manages all staff of his gym. Responsible for ensuring all facilities of gym are working and in good condition. Can analyze trainer performance.','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',1),('123@987.com','maria db','2332233287','1985-10-10','Other','staff',0,2131.00,'desc','$2a$10$bDQoHnyZMSGbCdWHice14ejPCkXIYvskaws8ADXz8/Pi48/q5bhwS',1),('19994@gmail.com','Max Verstappen','5050505051','1975-12-12','Male','trainer',0,45667.99,'Helps everybody and specializes in building the perfect diet for each individual.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',1),('19995@gmail.com','Anjaneya Gurjar','4499449944','1985-10-10','Male','trainer',0,23322.99,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtuCwxVal6AYHpCT0KEatAJ9KCcjp4a2Vy',1),('19996@gmail.com','Kylie Monnet','1100110011','1985-10-10','Male','trainer',0,34342.29,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtuDwWRh4kbXXv0SEELVjQo10Mag02pzg6',1),('19997@gmail.com','Janet Andrews','1001100110','1985-10-10','Male','trainer',0,34342.22,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtu2OyHVGaJSjs5t1Vrj.7yLzC04ZDCPh6',1),('19998@gmail.com','Sabrina Mason','8787878787','1985-10-10','Male','trainer',0,11004.33,'Helps in building complex workout routines for members.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuG/4SvUoYETqMt8p620orGST6XiuJ8Fm',1),('19999@gmail.com','Thomas Cook','7878787878','1985-10-10','Male','trainer',0,12000.00,'Trains all the members under him as well as other people working out at the gym','$2a$10$1CK4fQdkK7WlpHZeRAVgtuQZCA3alY1UH60TXmoVY.oqXjUl.sKgG',1),('22222@gmail.com','Mike Ross','1234554321','1985-10-10','Male','admin',0,52000.00,'Supervises over the entire gym staff. Ensure trainer performance, how happy the customers are as well as regularly updates gym facilities and equipment.s.','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',2),('29996@gmail.com','Georgie Bennet','1155228890','1985-10-10','Male','trainer',0,25640.70,'Conducts yoga classes for the interested members as well personal training sessions.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuwUfQgbEVAJXol0aJID6RMgS0zOjheJO',2),('29997@gmail.com','Misa Amane','5499449940','1985-10-10','Male','trainer',0,19000.00,'Helps memebrs improve their posture in the gym.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuJnAiIf/o/iy/XMcUp4d1YCQHNup9p.a',2),('29998@gmail.com','Susan Volkov','5499449941','1985-10-10','Male','trainer',1,11243.30,'Helps memebrs improve their posture in the gym.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',2),('33333@gmail.com','Rachel Zane','2323232323','1985-10-10','Male','admin',0,37346.44,'Manages other employees of the gym. Responsible for regularly adding newly hired staff to the gym\'s database.','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',3),('39994@gmail.com','Christina Perez','1155228891','1985-10-10','Male','trainer',0,25640.70,'Helps members workout out properly.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu9qbzxHdHVCr/QVR5NpYUal3r0Voe5fy',3),('39995@gmail.com','Sergio Messi','1155228895','1985-10-10','Male','trainer',0,25640.70,'Helps members workout out properly.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu9mrn.PIauuba0Yn34PgPFRxJkQ5mXn.',3),('39996@gmail.com','Max Ricciardo','1155228894','1985-10-10','Male','trainer',0,35640.70,'Helps members workout out properly.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuFhzgbsmIY8VrIzj7WW2219JsRW8vJ2e',3),('39999@gmail.com','Charles Leclerc','1152522887','1985-10-10','Male','trainer',0,18454.00,'Helps in muscle gain and flexibility.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu23.4fsUK/jdT/C9QsfMqKCtsYjbe4ia',3),('44444@gmail.com','Donna Paulsen','9889988998','1985-10-10','Male','admin',0,27465.88,'First one from the gym staff to be contacted whenever the higher authorities decide to incorporate any changes. Is responsible fo conveying all info to other subordinates and managing them.','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',4),('49997@gmail.com','Charlie Puth','1152522886','1985-10-10','Male','trainer',0,21000.00,'Helps in building the correct posture for workouts.','$2a$10$1CK4fQdkK7WlpHZeRAVgtubj3ntkYz9bFdKid4OEiykkPjAl/Aoni',4),('49998@gmail.com','Daniel Hardman','1152522885','1985-10-10','Male','trainer',0,21000.00,'Helps in understanding gym equipment and using them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuEtZwHkBVmhF9zGgbgZofns5ccysMI0u',4),('49999@gmail.com','Colson Baker','1152522884','1985-10-10','Male','trainer',0,2437.99,'Helps in understanding gym equipment and using them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtuTVxS/1TZB/Qsv0UHrRDSb0kOku6klji',4),('50@cent.com','50 Cent','5050505050','1985-10-10','Male','trainer',0,45667.99,'Helps everybody and specializes in building the perfect diet for each individual.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',4),('50@cent2.com','50 Cent2','5051505050','1985-10-10','Male','trainer',0,45667.99,'Helps everybody and specializes in building the perfect diet for each individual.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',4),('51@cent2.com','51 Cent2','5151505050','1985-10-10','Male','trainer',0,45667.99,'Helps everybody and specializes in building the perfect diet for each individual.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',4),('512@cent2.com','512 Cent2','5351505050','1985-10-10','Male','trainer',0,45667.99,'Helps everybody and specializes in building the perfect diet for each individual.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',4),('5123@cent2.com','5123 Cent2','5951505050','1985-10-10','Male','trainer',0,45667.99,'Helps everybody and specializes in building the perfect diet for each individual.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',4),('52@cent.com','52 Cent','6050505050','1985-10-10','Male','trainer',0,45667.99,'Helps everybody and specializes in building the perfect diet for each individual.','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',4),('55555@gmail.com','Alex Williams','9869833298','1985-10-10','Male','admin',0,46847.14,'Responsible for managing staff, getting the equipment serviced regularly as well adding new equipments to the website whenever needed. Can fire staff if performance is not up to the mark.','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',5),('59999@gmail.com','Chris Martin','1152522881','1985-10-10','Male','trainer',0,2437.99,'Helps in understanding gym equipment and using them.','$2a$10$1CK4fQdkK7WlpHZeRAVgtu19a3IoEPpyCM1KesBc4z8sAkyw8.BvW',5),('61111@gmail.com','Dua Lipa','3548764890','1985-10-10','Male','staff',1,9054.33,'Assists the trainer during yoga class.','$2a$10$0TuGb94iZDd85WkG07QdLeUxJJt8DBTR2Itn1byg3B12hQvuxeGom',6),('66666@gmail.com','Samantha Wheeler','3885379522','1985-10-10','Male','admin',0,75953.20,'Delegates tasks to lower level staff. Makes sure all facilities are open by the required time and also closed for servicing whenever needed. Can hire/fire staff.','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',6),('69999@mail.com','Anita Gibbs','1152522848','1985-10-10','Female','staff',0,2437.99,'Trains how to do complex workouts for experienced members.ss','$2a$10$CQTRGg1vWewqTNA9XIi1iermvHA6p8XW6ABILDK5K9NMpS4CU3FW6',6),('85638@gmail.com','Steve Tanaka','9563856375','1985-10-10','Male','staff',0,35000.99,'Manages all the facilitiy\'s billings and schedules appointments with walk in customers','$2a$10$XW0FEDooXV.bKyk9lau6Zu0QEEMo21DrMP6c1xy86zlooObUsJPz6',5),('gg@wp.com','GG WP','5994499449','1985-10-10','Female','admin',0,15599.56,'Helper in all aspects','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',97),('idk69@gmail.com','fname sname','987654321','1994-12-12','Male','staff',0,25000.46,'desc','$2a$10$1CK4fQdkK7WlpHZeRAVgtuXSGRJCSE4SkzCrKKz6DdMwdu0xXHVxu',1),('lean@beef.com','Lean Beef Patty','1243658760','1985-10-10','Female','trainer',0,1221.00,'description boi','not needed',1),('liam@af.com','Liam Smith','9999900000','1985-10-10','Male','trainer',1,10203.00,'afdf sfsfsd fsdf sd f sdf ds f sd f sdf ds f sd f sd fsd fsdf','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',1),('liam2@af.com','Liam Smith','9900990099','1985-10-10','Male','trainer',1,213123.00,'some description','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',1),('max@vers.com','Max Verstappend','100138836','1985-10-10','Male','trainer',0,1730.00,'body builder and helper','not needed',5),('new.ad11min@gmail.com','Proffesor X1','1122987786','1985-10-10','Female','admin',0,70001.00,'2qedqr','$2a$10$EHeGv0f6TxMPMuH1Ng/rze8q.a2ryYZKlI.paFc5o6kPL8NVvIM3O',114),('new.admhhin@gmail.com','Proffesor 7X','6688994356','1985-10-10','Male','admin',0,70007.00,'ggvgg','$2a$10$yPlmpub9Zw47bm6XaZuJ3OwDjfZAow8kdrek7e.F4I6h5JTyXosg6',116),('new.admin@gmail.com2','Proffesor X2','2344325671','1985-10-10','Male','admin',0,70000.00,'wfewf','$2a$10$6FfMUHc6R7ga8DGRaqui8e0UjlLdRiUbEgprjqKdIZLnY2sEUVfei',117),('new.admin@gmail.in','Proffesor X','2233443344','1985-10-10','Male','admin',0,70000.00,'fsdfdsgggsd','$2a$10$GZLlhb474QcMNp9JY6JYjODQM7sNJQ1StjgG.ptewnBfV0K17odiW',118),('new.admin@hmail.com','Proffesor X','1111222222','1985-10-10','Male','admin',0,70000.00,'fadsfsadf','$2a$10$o89qQindD/aa3bQ045cHvO1BRMav1IGFDDa0fQWl4UdZxdpPbELpi',119),('new.admin110@gmail.com','Proffesor ABCD','1899074567','1985-10-10','Other','admin',0,70001.00,'wqdqwdq','$2a$10$HVzcDO2sn8hGBB0CPuONQObHHb1fPsXdAg0EzfZXAvDStrOy5Gm52',113),('new.admin4@gmail.com','Proffesor D','8900988906','1985-10-10','Other','admin',0,70000.00,'admin','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',109),('new.admin45@gmail.com','Proffesor B','8766788765','1985-10-10','Male','admin',0,70000.00,'admin yes','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',105),('new1.admin@gmail.com','Proffesor F','1232343455','1985-10-10','Female','admin',0,70000.00,'admin','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',107),('new22.admin@gmail.com','Proffesor 22','2233879788','1985-10-10','Female','admin',0,70002.00,'222','$2a$10$da9DhnrgRGp1aZZidauB6uTrJ2tY6DdPhHgfxPGvwKYhPhlSNgdFu',115),('qnew.admin@gmail.com','Proffesor L','8907896786','1985-10-10','Female','admin',0,70000.00,'admin','$2a$10$saHN8688h8Z34u4NpffkwuIugzlX7BcjImHobmjKnuaKo5/DlSfV.',108),('r@t.com','random trainer','9803217683','1985-10-10','Female','trainer',0,2222.00,'trainer ig','not needed',5),('random@1.com','random','1122333322','1985-10-10','Female','trainer',0,4453.44,'does everything','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',1),('root@absolutefitness.com','Toto Wolff','6176732882','1972-01-12','Male','root',0,1500000.00,'Root user. Can add new gyms, staff and assign admins.','$2a$10$byfbF4pGshOS9Bit3x3pa.Se2mMVkE9i/cMMRiFqDrcX.sKr6bGAW',0),('some@name.com','Some Name','2344327468','1985-10-10','Female','trainer',0,123.43,'trainer helps with excercise','$2a$10$c8IaJCswkUcXNYNMvA.pB.hEbO2Ab/xBF.cUZDmSANqYgHitNdI06',3);
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
-- 	 IF OLD.staff_id IN (SELECT staff_id FROM gym_admins) THEN
--  		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Cannot delete an admin" ;
--      END IF;
    DECLARE gym_admins_count INT;
    
    IF OLD.staff_id IN (SELECT staff_id FROM staff WHERE type = "admin") THEN
		SELECT COUNT(*) INTO gym_admins_count FROM staff 
		WHERE type = "admin" AND gym_id = (OLD.gym_id);
		
		IF gym_admins_count <= 1 THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Assign another admin to delete the last admin for this gym." ;
		END IF;
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `token` varchar(512) NOT NULL,
  `username` varchar(30) NOT NULL,
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES ('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IjY2NjY3QGdtYWlsLmNvbSIsInR5cGUiOiJhZG1pbiIsImlhdCI6MTcwMTY0MjI5NywiZXhwIjoxNzAxNjQ0MDk3fQ.7nfEFobOuNbrH-XWo_WOAKspNFMQYurIlyXSGt-Gs2Q','66667@gmail.com');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `staff_id` varchar(30) NOT NULL,
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
INSERT INTO `trainers` VALUES ('19994@gmail.com','https://www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',2,'Muscle Building'),('19995@gmail.com','https://images.unsplash.com/photo-1483721310020-03333e577078?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDd8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',12,'Muscle building'),('19996@gmail.com','https://images.unsplash.com/photo-1518617840859-acd542e13a99?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1504&q=80',22,'Weight loss'),('19997@gmail.com','https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDV8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',10,'Calisthenics'),('19998@gmail.com','https://images.unsplash.com/photo-1546817372-628669db4655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTA3fHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',1,'Flexibility'),('19999@gmail.com','https://images.unsplash.com/photo-1597452485669-2c7bb5fef90d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAyfHxneW0lMjB0cmFpbmVyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',3,'Calisthenics'),('29996@gmail.com','https://media.istockphoto.com/id/1040495528/photo/portrait-of-a-female-personal-trainer-in-the-gym.jpg?s=170667a&w=0&k=20&c=i3MQQ76eZHGYd6_POIWVtprwOnGOommulDUl3f57sMc=',1,'Flexibility'),('29997@gmail.com','https://images.unsplash.com/photo-1532384748853-8f54a8f476e2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTB8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',11,'Calisthenics'),('29998@gmail.com','https://images.unsplash.com/photo-1546749876-2088f8b19e09?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',7,'Flexibility'),('39994@gmail.com','https://images.unsplash.com/photo-1571731956672-f2b94d7dd0cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',5,'Flexibility'),('39995@gmail.com','https://images.unsplash.com/photo-1581009146145-b5ef050c2e1e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80',2,'Calisthenics'),('39996@gmail.com','https://images.unsplash.com/photo-1601422407692-ec4eeec1d9b3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',9,'Weight loss'),('39999@gmail.com','https://images.unsplash.com/photo-1579758629938-03607ccdbaba?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',8,'Muscle building'),('49997@gmail.com','https://hips.hearstapps.com/amv-prod-gp.s3.amazonaws.com/gearpatrol/wp-content/uploads/2019/03/How-Three-Personal-Trainers-Dress-for-the-Gym-Gear-Patrol-mat.jpg?resize=480:*',8,'Calisthenics'),('49998@gmail.com','https://media.istockphoto.com/id/675179390/photo/muscular-trainer-writing-on-clipboard.jpg?s=612x612&w=0&k=20&c=9NKx1AwVMpPY0YBlk5H-hxx2vJSCu1Wc78BKRM9wFq0=',9,'Weight loss'),('49999@gmail.com','https://images.unsplash.com/photo-1597347324655-f99149f2e285?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDJ8fGd5bSUyMHRyYWluZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',3,'Muscle building'),('50@cent.com','https://www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',2,'Weight Loss + Nutrition'),('50@cent2.com','https://www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',2,'Weight Loss + Nutrition'),('51@cent2.com','https://www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',2,'Weight Loss + Nutrition'),('512@cent2.com','https://www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',2,'Weight Loss + Nutrition'),('5123@cent2.com','https://www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',2,'Weight Loss + Nutrition'),('52@cent.com','https://www.muscleandfitness.com/wp-content/uploads/2018/12/Personal-Trainer-Training-Partner-GettyImages-654427364.jpg?quality=86&strip=all',2,'Weight Loss + Nutrition'),('59999@gmail.com','https://media.istockphoto.com/id/1324042769/photo/confident-gym-owner.jpg?b=1&s=170667a&w=0&k=20&c=iuz1kcCB1w8CBf44nub1mYr-F--88dLRjJvM-5uPahY=',6,'Flexibility'),('lean@beef.com','https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',15,'Body Building champion'),('liam@af.com','https://i.pinimg.com/736x/05/90/73/059073c66b81a2bb93a3d576c3a10094.jpg',2,'Fat Loss'),('liam2@af.com','https://i.pinimg.com/736x/05/90/73/059073c66b81a2bb93a3d576c3a10094.jpg',1,'Fat Loss'),('max@vers.com','https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',12,'Body Building champion'),('r@t.com','https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',5,'cardio'),('random@1.com','https://hips.hearstapps.com/hmg-prod/images/mh-trainer-2-1533576998.png',13,'muscle gain'),('some@name.com','https://t4.ftcdn.net/jpg/04/70/29/97/360_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',5,'Cardio');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_health_plan_details`
--

DROP TABLE IF EXISTS `user_health_plan_details`;
/*!50001 DROP VIEW IF EXISTS `user_health_plan_details`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_health_plan_details` AS SELECT 
 1 AS `email`,
 1 AS `name`,
 1 AS `health_plan_description`,
 1 AS `trainer_id`,
 1 AS `trainer_url`,
 1 AS `trainer_name`,
 1 AS `trainer_phone`,
 1 AS `workout_plan_id`,
 1 AS `workout_plan_name`,
 1 AS `workout_description`,
 1 AS `excercise_1`,
 1 AS `excercise_2`,
 1 AS `excercise_3`,
 1 AS `diet_plan_id`,
 1 AS `diet_name`,
 1 AS `diet_description`,
 1 AS `breakfast`,
 1 AS `lunch`,
 1 AS `dinner`*/;
SET character_set_client = @saved_cs_client;

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
  `subscribed` tinyint(1) NOT NULL DEFAULT '0',
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
INSERT INTO `users` VALUES ('4@5.com','four five','0000000001','1950-02-06','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',3),('9@9.com','four five','0000000002','1950-02-06','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',3),('albono@gmail.com','Alex Albon','1233217774','2023-12-04','Male',1,'$2a$10$Poilylx52zBzcWPwSDfaA.SGyUzr7ztjiiQ3guEI7.1MQlxbB4tLW',6),('alex@gmail.com','Alex Williams','2244223322','1998-11-12','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',2),('ariana@gmail.com','Ariana Grande','4848484848','1996-10-15','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('arpan@gmail.com','Arpan Patel','2892407243','1994-05-14','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('britney@gmail.com','Britney Spears','2288882265','1979-07-23','Female',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',3),('cook@gmail.com','Samantha Cook','2288440099','1993-06-15','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('david@gmail.com','David Johnson','2344322344','1985-04-10','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('emma@gmail.com','Emma James','7744993322','2003-01-15','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('girish@gmail.com','Girish Mahajan','2288993300','1977-03-16','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('iggy@gmail.com','Iggy Azalea','5676389188','2001-05-24','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',3),('john@gmail.com','John Doe','7564856386','2007-01-10','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('kaldon@hotmail.com','Kaldon Disaint','7563777449','2005-03-31','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',4),('katy@gmail.com','Katy Perry','2288663300','1985-10-24','Female',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',6),('kelly@neu.com','Kelly Termont','5768679321','2007-01-31','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',4),('louis@gmail.com','Louis Litt','2288339900','1985-03-14','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',2),('mark@gmail.com','Mark Johnson','2288447722','1998-06-19','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',2),('michelle@gmail.com','Michelle Ross','7744668833','1993-05-31','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('parth@gmail.com','Parth Parikh','8833889944','2000-05-25','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('rand@rand.com','rand','5555566666','2022-12-09','Female',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',3),('random@u.com','Random User','1233216783','2007-06-14','Male',0,'$2a$10$djuMu2.5VZTCawbbhu1PTuBRzZ0CW1nSEfq457ayxGQmJXKQQe.6e',2),('rikc.2000@gmail.com','Supratik Chaudhuri','3883388338','2000-05-11','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',2),('robert@gmail.com','Robert Zane','3454234543','1967-07-09','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('ross@gmail.com','Ross Geller','3746383682','1969-06-09','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('selena@gmail.com','Selena Gomez','8778877833','1993-01-07','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('shashwat@gmail.com','Shashwat Kumar','3399220099','2000-08-05','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',2),('simon@gmail.com','Simon Cowell','2020202020','1968-06-03','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',2),('tanmay.skater@gmail.com','Tanmay Kapoor','6179358069','2000-12-11','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',6),('test.yes@gmail.com','Test User','0000000089','1980-06-13','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',2),('tim@gmail.com','Tim','8765783725','2007-02-14','Male',1,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('tom@gmail.com','Tom Doe','7564982645','2002-06-11','Male',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',1),('ziya@google.com','Ziya Quereshi','9580567387','2000-08-08','Female',0,'$2a$10$PxXE8O6K3l7l0LWvtMcLXeK.GoTrJxnp/Srf08bhcsNibP2ZzAHtu',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_plans`
--

LOCK TABLES `workout_plans` WRITE;
/*!40000 ALTER TABLE `workout_plans` DISABLE KEYS */;
INSERT INTO `workout_plans` VALUES (1,'Muscle gain','Excercises that focus on increasing muscle strength','Cable Fly','Squats','Deadlift'),(2,'Flexibility increase','Excercises that stretch muscle thereby increasing flexibility in the long run','Squats','Burpees','Leg Press'),(3,'Weight loss','Do difficult excercises to burn excess fat in the body','Bench Press','Leg Press','Burpees'),(46,'MMA','Mixed martial arts training','Leg Press','Squats','Pull Ups'),(47,'Kick Boxing','Boxing (Legs included lol)','Burpees','Deadlift','Lunges'),(48,'Boxing','No legs allowed','Bicep curls','Bench Press','Pull Ups'),(49,'Wrestling','Khabib Nurmagomedov lifestyle','Deadlift','Squats','Leg Press'),(50,'Jiu Jitsu','Charles Oliveira lifestyle','Cable Fly','Bicep curls','Squats'),(51,'Calisthenics','Jump around stuff that looks super cool','Burpees','Pull Ups','Push Ups'),(53,'Fat loss','More cardio for reducing visceral fat','Deadlift','Lunges','Burpees');
/*!40000 ALTER TABLE `workout_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'af3'
--

--
-- Dumping routines for database 'af3'
--
/*!50003 DROP FUNCTION IF EXISTS `addEquipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `addEquipment`(v_name VARCHAR(20), 
								 v_image_url VARCHAR(512)) RETURNS int
    READS SQL DATA
BEGIN
	INSERT INTO equipments (name, image_url) VALUES (v_name, v_image_url);
    RETURN LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `getRandomTrainer`(v_gym INT) RETURNS varchar(30) CHARSET utf8mb4
    READS SQL DATA
BEGIN
	DECLARE random_trainer VARCHAR(30);
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
/*!50003 DROP PROCEDURE IF EXISTS `addEquipmentForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addEquipmentForGym`(IN v_gym_id INT,
									INOUT v_equipment_id INT,
                                    IN v_name VARCHAR(20),
                                    IN v_image_url VARCHAR(512),
                                    IN v_quantity INT,
                                    IN v_last_serviced DATE)
BEGIN
	IF v_equipment_id IS NULL THEN 
		SELECT addEquipment(v_name, v_image_url) INTO v_equipment_id;
    END IF;
    
    INSERT INTO gym_equipments VALUES (v_gym_id, v_equipment_id, v_quantity, v_last_serviced);
    
	SELECT e.*, g.gym_id, g.quantity, g.last_serviced FROM 
    equipments e JOIN gym_equipments g
    ON e.equipment_id = g.equipment_id
    WHERE e.equipment_id = v_equipment_id;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGym`(in v_branch VARCHAR(50), 
						   in v_pincode VARCHAR(5),
                           in v_phone VARCHAR(10), 
                           in v_location VARCHAR(50), 
                           in v_membership_fee DECIMAL(65, 2),
                           
                           in v_staff_id VARCHAR(30),
                           in v_name VARCHAR(50), 
                           in v_admin_phone VARCHAR(10), 
                           in v_dob DATE,
                           in v_sex ENUM("Male", "Female", "Other"),
                           in v_type ENUM("staff", "trainer", "admin"),
                           in v_part_time BOOLEAN, 
                           in v_salary DECIMAL(65, 2), 
                           in v_description VARCHAR(512), 
                           in v_password VARCHAR(100))
BEGIN
	DECLARE error_code INT;
	DECLARE error_message VARCHAR(16383);
    declare tp varchar(200);
    declare new_gym_id int;
    
	DECLARE exit handler for sqlexception
    BEGIN
        -- If an error occurs, roll back the transaction
        GET DIAGNOSTICS CONDITION 1
			error_code = MYSQL_ERRNO, error_message = MESSAGE_TEXT;
		
        select substring(error_message, 1, 100) into tp;
        
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = tp;
    END;
    
    SET AUTOCOMMIT = 0;
    
    START TRANSACTION;
    
	INSERT INTO gyms (branch, pincode, phone, location, membership_fee) 
    VALUES (v_branch, v_pincode, v_phone, v_location, v_membership_fee);
    
    SELECT LAST_INSERT_ID() INTO new_gym_id;
    
    INSERT INTO staff (staff_id, name, phone, sex, type, part_time, salary, description, password, gym_id) 
    VALUES (v_staff_id, v_name, v_admin_phone, v_sex, v_type, v_part_time, v_salary, v_description, v_password, new_gym_id);
    
    INSERT INTO gym_admins VALUES (v_staff_id, new_gym_id);
    
    COMMIT;
    
    SELECT new_gym_id AS gym_id;
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
/*!50003 DROP PROCEDURE IF EXISTS `addImageUrlForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addImageUrlForGym`(IN v_image_url VARCHAR(200), 
								   IN v_gym_id INT)
BEGIN
	INSERT IGNORE INTO gym_image_urls VALUES (v_image_url, v_gym_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addResetToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addResetToken`(IN v_token VARCHAR(512), 
							   IN v_username VARCHAR(30))
BEGIN
	INSERT INTO tokens VALUES (v_token, v_username);
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStaff`(IN v_staff_id VARCHAR(30),
						  IN v_name VARCHAR(50), 
                          IN v_phone VARCHAR(10), 
                          IN v_dob DATE,
                          IN v_sex ENUM("Male", "Female", "Other"),
                          IN v_type ENUM("staff", "trainer", "admin"),
                          IN v_part_time BOOLEAN, 
                          IN v_salary DECIMAL(65, 2), 
                          IN v_description VARCHAR(512), 
                          IN v_password VARCHAR(100), 
                          IN v_gym_id INT)
BEGIN
	INSERT INTO staff (staff_id, name, phone, sex, type, part_time, salary, description, password, gym_id) 
    VALUES (v_staff_id, v_name, v_phone, v_sex, v_type, v_part_time, v_salary, v_description, v_password, v_gym_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addTrainer`(IN v_staff_id VARCHAR(30),
						  IN v_name VARCHAR(50), 
                          IN v_phone VARCHAR(10), 
                          IN v_dob DATE,
                          IN v_sex ENUM("Male", "Female", "Other"),
                          IN v_part_time BOOLEAN, 
                          IN v_salary DECIMAL(65, 2), 
                          IN v_description VARCHAR(512), 
                          IN v_password VARCHAR(100), 
                          IN v_gym_id INT, -- staff fields till here
                          IN v_image_url VARCHAR(200),
                          IN v_years_of_exp INT,
                          IN v_speciality VARCHAR(30))
BEGIN
	CALL addStaff(v_staff_id, v_name, v_phone, v_dob, v_sex, "trainer", v_part_time, v_salary, v_description, "not needed", v_gym_id);
    INSERT INTO trainers VALUES (v_staff_id, v_image_url, v_years_of_exp, v_speciality);
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
/*!50003 DROP PROCEDURE IF EXISTS `createNewAdminForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createNewAdminForGym`(IN v_staff_id VARCHAR(30),
								IN v_name VARCHAR(50), 
								IN v_phone VARCHAR(10), 
								IN v_dob DATE,
								IN v_sex ENUM("Male", "Female", "Other"),
								IN v_part_time BOOLEAN, 
								IN v_salary DECIMAL(65, 2), 
								IN v_description VARCHAR(512), 
								IN v_password VARCHAR(100), 
								IN v_gym_id INT)
BEGIN
	CALL addStaff(v_staff_id, v_name, v_phone, v_dob, v_sex, "admin", v_part_time, v_salary, v_description, v_password, v_gym_id);
	INSERT INTO gym_admins VALUES (v_staff_id, v_gym_id);
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
/*!50003 DROP PROCEDURE IF EXISTS `deleteEquipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEquipment`(IN v_equipment_id INT)
BEGIN
	DELETE FROM equipments WHERE equipment = v_equipment_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteEquipmentForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteEquipmentForGym`(IN v_gym_id INT,
									   IN v_equipment_id INT)
BEGIN
	DELETE FROM gym_equipments 
    WHERE gym_id = v_gym_id AND equipment_id = v_equipment_id;
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
/*!50003 DROP PROCEDURE IF EXISTS `deleteOldResetTokens` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldResetTokens`(IN v_username VARCHAR(30))
BEGIN
	DELETE FROM tokens WHERE username = v_username;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStaff`(IN v_staff_id VARCHAR(30))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAdmin`(IN v_staff_id VARCHAR(30))
BEGIN 
	SELECT * FROM staff 
    WHERE staff_id = v_staff_id and type = "admin";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllAdmins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAdmins`()
BEGIN
	SELECT * FROM staff WHERE type = "admin";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getAllAdminsForGym` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllAdminsForGym`(IN v_gym_id INT)
BEGIN 
	SELECT * FROM staff 
    WHERE type = "admin" AND gym_id = v_gym_id;
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
/*!50003 DROP PROCEDURE IF EXISTS `getAllEquipments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllEquipments`()
BEGIN
	SELECT * FROM equipments;
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
	SELECT g.*, u.image_url FROM 
    gyms g LEFT JOIN gym_image_urls u
    ON g.gym_id = u.gym_id
    WHERE g.gym_id != 0;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUserHealthRecordsForTrainer`(IN v_trainer_id VARCHAR(30))
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
	SELECT * FROM diet_plan_details
    WHERE email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEntryForLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEntryForLogin`(IN v_username VARCHAR(30))
BEGIN
	with entries as (
		select email as username, name, phone, dob, sex, "member" as type, subscribed, password, gym_id from users
		union
		select staff_id as username, name, phone, dob, sex, type, false as subscribed, password, gym_id from staff
	)
	select * from entries where username = v_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getEquipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getEquipment`(IN v_equipment_id INT)
BEGIN
	SELECT * FROM equipments WHERE equipment_id = v_equipment_id;
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
	SELECT g.*, u.image_url FROM 
    gyms g LEFT JOIN gym_image_urls u
    ON g.gym_id = u.gym_id
    WHERE g.gym_id = v_gym_id;
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
	SELECT * FROM user_health_plan_details
    WHERE email = v_email;
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
/*!50003 DROP PROCEDURE IF EXISTS `getResetToken` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getResetToken`(IN v_token VARCHAR(512))
BEGIN
	SELECT * FROM tokens WHERE token = v_token;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStaff`(IN v_staff_id VARCHAR(30))
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTrainer`(IN v_staff_id varchar(30))
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
	health_plans h LEFT JOIN workout_plans w ON 
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
/*!50003 DROP PROCEDURE IF EXISTS `promoteStaffToAdmin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `promoteStaffToAdmin`(IN v_staff_id VARCHAR(30))
BEGIN
	DECLARE v_gym_id INT;
    
	UPDATE staff SET type = "admin" WHERE staff_id = v_staff_id;
    
    SELECT gym_id INTO v_gym_id WHERE
    staff_id = v_staff_id;
    
	INSERT INTO gym_admins VALUES (v_staff_id, v_gym_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `promoteToPayingCustomer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `promoteToPayingCustomer`(v_email VARCHAR(30))
BEGIN
	UPDATE users SET subscribed = true WHERE email = v_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resetPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetPassword`(IN v_username VARCHAR(30), 
							   IN v_password VARCHAR(100), 
							   IN v_type ENUM("member", "staff", "trainer", "admin", "root"))
BEGIN
    IF v_type = "member" THEN
		UPDATE users SET password = v_password 
		WHERE email = v_username;
    ELSEIF v_type in ("admin", "root") THEN
		UPDATE staff SET password = v_password 
		WHERE staff_id = v_username;
    END IF;
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
/*!50003 DROP PROCEDURE IF EXISTS `updateEquipment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateEquipment`(IN v_equipment_id INT, 
								 IN v_name VARCHAR(20), 
                                 IN v_image_url VARCHAR(512))
BEGIN
	UPDATE equipments
    SET name = v_name, image_url = v_image_url
    WHERE equipment_id = v_equipment_id;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGym`(in v_branch VARCHAR(50), 
						   in v_pincode VARCHAR(5),
						IN v_phone VARCHAR(10), 
                        IN v_location VARCHAR(50), 
                        IN v_membership_fee DECIMAL(65, 2),
                        IN v_gym_id INT)
BEGIN
	UPDATE gyms SET 
    phone = v_phone, location = v_location, membership_fee = v_membership_fee, branch = v_branch
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
                             IN v_dob DATE,
                             IN v_sex ENUM("Male", "Female", "Other"),
                             IN v_type ENUM("staff", "trainer", "admin", "root"),
						     IN v_part_time BOOLEAN, 
						     IN v_salary DECIMAL(65, 2), 
						     IN v_description VARCHAR(512), 
						     IN v_password VARCHAR(100),
                             IN v_staff_id VARCHAR(30))
BEGIN
	UPDATE staff SET 
		name = v_name, phone = v_phone, 
        dob = v_dob, sex = v_sex, type = v_type,
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
/*!50003 DROP PROCEDURE IF EXISTS `updateTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updateTrainer`(IN v_staff_id VARCHAR(30),
							   IN v_name VARCHAR(50), 
                               IN v_phone VARCHAR(10), 
                               IN v_dob DATE,
                               IN v_sex ENUM("Male", "Female", "Other"),
                               IN v_part_time BOOLEAN, 
                               IN v_salary DECIMAL(65, 2), 
                               IN v_description VARCHAR(512), 
                               IN v_password VARCHAR(100),  -- staff fields till here
                               IN v_image_url VARCHAR(200),
                               IN v_years_of_exp INT,
                               IN v_speciality VARCHAR(30))
BEGIN
	CALL updateStaff(v_name, v_phone, v_dob, v_sex, "trainer", v_part_time, v_salary, v_description, "not needed", v_staff_id);
    
    UPDATE trainers
    SET image_url = v_image_url, years_of_exp = v_years_of_exp, speciality = v_speciality
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

--
-- Final view structure for view `diet_plan_details`
--

/*!50001 DROP VIEW IF EXISTS `diet_plan_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `diet_plan_details` AS select `h`.`email` AS `email`,`d`.`plan_id` AS `plan_id`,`d`.`name` AS `name`,`d`.`description` AS `description`,`d`.`breakfast` AS `breakfast`,`d`.`lunch` AS `lunch`,`d`.`dinner` AS `dinner`,`m1`.`calories` AS `m1_calories`,`m1`.`image_url` AS `m1_url`,`m2`.`calories` AS `m2_calories`,`m2`.`image_url` AS `m2_url`,`m3`.`calories` AS `m3_calories`,`m3`.`image_url` AS `m3_url` from ((((`health_plans` `h` left join `diet_plans` `d` on((`h`.`diet_plan` = `d`.`plan_id`))) left join `meal_choices` `m1` on((`d`.`breakfast` = `m1`.`meal`))) left join `meal_choices` `m2` on((`d`.`lunch` = `m2`.`meal`))) left join `meal_choices` `m3` on((`d`.`dinner` = `m3`.`meal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_health_plan_details`
--

/*!50001 DROP VIEW IF EXISTS `user_health_plan_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_health_plan_details` AS select `u`.`email` AS `email`,`u`.`name` AS `name`,`h`.`description` AS `health_plan_description`,`t`.`staff_id` AS `trainer_id`,`t`.`image_url` AS `trainer_url`,`s`.`name` AS `trainer_name`,`s`.`phone` AS `trainer_phone`,`w`.`plan_id` AS `workout_plan_id`,`w`.`name` AS `workout_plan_name`,`w`.`description` AS `workout_description`,`w`.`excercise_1` AS `excercise_1`,`w`.`excercise_2` AS `excercise_2`,`w`.`excercise_3` AS `excercise_3`,`d`.`plan_id` AS `diet_plan_id`,`d`.`name` AS `diet_name`,`d`.`description` AS `diet_description`,`d`.`breakfast` AS `breakfast`,`d`.`lunch` AS `lunch`,`d`.`dinner` AS `dinner` from (((((`users` `u` left join `health_plans` `h` on((`h`.`email` = `u`.`email`))) left join `trainers` `t` on((`h`.`trainer_id` = `t`.`staff_id`))) left join `staff` `s` on((`t`.`staff_id` = `s`.`staff_id`))) left join `workout_plans` `w` on((`h`.`workout_plan` = `w`.`plan_id`))) left join `diet_plans` `d` on((`h`.`diet_plan` = `d`.`plan_id`))) */;
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

-- Dump completed on 2023-12-10 14:20:39
