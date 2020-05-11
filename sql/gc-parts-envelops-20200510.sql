-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: set_mind
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `envelop`
--

DROP TABLE IF EXISTS `envelop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envelop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `parts_id_body` int(11) DEFAULT NULL,
  `parts_id_battery` int(11) DEFAULT NULL,
  `parts_id_brain` int(11) DEFAULT NULL,
  `parts_id_hemlet` int(11) DEFAULT NULL,
  `parts_id_left_arm` int(11) DEFAULT NULL,
  `parts_id_right_arm` int(11) DEFAULT NULL,
  `parts_id_left_leg` int(11) DEFAULT NULL,
  `parts_id_right_leg` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parts_id_left_arm` (`parts_id_left_arm`),
  KEY `parts_id_right_arm` (`parts_id_right_arm`),
  KEY `parts_id_left_leg` (`parts_id_left_leg`),
  KEY `envelop_ibfk_8` (`parts_id_right_leg`),
  KEY `envelop_ibfk_1` (`parts_id_body`),
  KEY `envelop_ibfk_2` (`parts_id_battery`),
  KEY `envelop_ibfk_3` (`parts_id_brain`),
  KEY `envelop_ibfk_4` (`parts_id_hemlet`),
  CONSTRAINT `envelop_ibfk_1` FOREIGN KEY (`parts_id_body`) REFERENCES `parts` (`id`),
  CONSTRAINT `envelop_ibfk_2` FOREIGN KEY (`parts_id_battery`) REFERENCES `parts` (`id`),
  CONSTRAINT `envelop_ibfk_3` FOREIGN KEY (`parts_id_brain`) REFERENCES `parts` (`id`),
  CONSTRAINT `envelop_ibfk_4` FOREIGN KEY (`parts_id_hemlet`) REFERENCES `parts` (`id`),
  CONSTRAINT `envelop_ibfk_5` FOREIGN KEY (`parts_id_left_arm`) REFERENCES `parts` (`id`),
  CONSTRAINT `envelop_ibfk_6` FOREIGN KEY (`parts_id_right_arm`) REFERENCES `parts` (`id`),
  CONSTRAINT `envelop_ibfk_7` FOREIGN KEY (`parts_id_left_leg`) REFERENCES `parts` (`id`),
  CONSTRAINT `envelop_ibfk_8` FOREIGN KEY (`parts_id_right_leg`) REFERENCES `parts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envelop`
--

LOCK TABLES `envelop` WRITE;
/*!40000 ALTER TABLE `envelop` DISABLE KEYS */;
INSERT INTO `envelop` (`id`, `name`, `date_creation`, `parts_id_body`, `parts_id_battery`, `parts_id_brain`, `parts_id_hemlet`, `parts_id_left_arm`, `parts_id_right_arm`, `parts_id_left_leg`, `parts_id_right_leg`) VALUES (1,'CarniLol','2020-04-16 09:57:11',1,2,82,3,6,5,8,7),(3,'Encore','2020-04-16 09:57:11',15,57,80,16,19,17,13,14),(11,'Badonall','2020-05-06 09:10:51',66,57,83,67,69,68,71,70),(12,'R.Viteslow','2020-05-06 09:10:51',75,78,4,74,76,76,72,73),(13,'R.Cousin','2020-05-06 09:10:51',84,78,81,89,90,87,85,86),(14,'CasualA','2020-05-06 09:10:51',91,79,80,92,93,95,94,96),(15,'CasualB','2020-05-06 09:10:51',97,57,4,98,99,100,101,102),(16,'ArniloRed','2020-04-16 09:57:11',1,57,83,3,103,9,12,11),(18,'Beta-R2D2','2020-04-16 09:57:11',106,2,4,107,104,105,76,76);
/*!40000 ALTER TABLE `envelop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT 'default',
  `type` varchar(50) DEFAULT 'corps',
  `visual` varchar(300) DEFAULT '/img/default.png',
  `color` varchar(50) DEFAULT 'black',
  `special_ability` varchar(20) DEFAULT 'cool',
  `strenght` int(11) DEFAULT '0',
  `speed` int(11) DEFAULT '0',
  `capacity` int(11) DEFAULT '50',
  `setmind` int(11) DEFAULT '50',
  `left` tinyint(1) DEFAULT '0',
  `right` tinyint(1) DEFAULT '0',
  `bottom` tinyint(1) DEFAULT '0',
  `top` tinyint(1) DEFAULT '0',
  `center` tinyint(1) DEFAULT '0',
  `grade` int(11) DEFAULT '0',
  `date_creation` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `range_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` (`id`, `name`, `type`, `visual`, `color`, `special_ability`, `strenght`, `speed`, `capacity`, `setmind`, `left`, `right`, `bottom`, `top`, `center`, `grade`, `date_creation`, `range_id`) VALUES (1,'2045-AA-body','Body','/assets/images/parts/2045-AA-body.png','black','cool',0,0,50,0,0,0,0,0,1,0,'2020-04-16 09:57:12',1),(2,'2045-AA-battery-A+','Battery','/assets/images/parts/2045-AA-battery-A+.png','black','super charge',0,0,100,0,0,0,0,0,1,0,'2020-04-16 09:57:12',1),(3,'2045-AA-hemlet','hemlet','/assets/images/parts/2045-AA-hemlet.png','black','cool',0,0,0,0,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(4,'2045-AA-brain-A+','Brain','/assets/images/parts/2045-AA-brain-A+.png','black','5 abilities',0,0,0,100,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(5,'2045-AA-right_arm','Arm','/assets/images/parts/2045-AA-right_arm.png','black','cool',15,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(6,'2045-AA-left_arm','Arm','/assets/images/parts/2045-AA-left_arm.png','black','cool',15,0,0,0,1,0,0,0,0,0,'2020-04-16 09:57:12',1),(7,'2045-AA-right_leg','Leg','/assets/images/parts/2045-AA-right_leg.png','black','cool',0,15,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(8,'2045-AA-left_leg','Leg','/assets/images/parts/2045-AA-left_leg.png','black','cool',0,15,0,0,1,0,0,0,0,0,'2020-04-16 09:57:12',1),(9,'2045-AB-right_arm','Arm','/assets/images/parts/2045-AB-right_arm.png','red','berserk',45,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(11,'2045-AB-right_leg','Leg','/assets/images/parts/2045-AB-right_leg.png','red','berserk',0,45,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(12,'2045-AB-left_leg','Leg','/assets/images/parts/2045-AB-left_leg.png','red','berserk',0,45,0,0,1,0,0,0,0,0,'2020-04-16 09:57:12',1),(13,'2046-AA-left_leg','Leg','/assets/images/parts/2046-AA-left_leg.png','blue','cool',0,25,0,0,1,0,0,0,0,0,'2020-04-26 20:40:22',1),(14,'2046-AA-right_leg','Leg','/assets/images/parts/2046-AA-right_leg.png','blue','cool',0,25,0,0,1,0,0,0,0,0,'2020-04-26 20:41:11',1),(15,'2046-AA-body','Body','/assets/images/parts/2046-AA-body.png','blue','cool',0,0,0,0,0,0,0,0,1,0,'2020-04-26 20:45:06',1),(16,'2046-AA-hemlet','hemlet','/assets/images/parts/2046-AA-hemlet.png','blue','cool',0,0,0,0,0,0,0,1,1,0,'2020-04-26 20:45:06',1),(17,'2046-AA-right_arm','Arm','/assets/images/parts/2046-AA-right_arm.png','blue','cool',10,0,0,0,0,1,0,0,0,0,'2020-04-26 20:47:52',1),(19,'2046-AA-left_arm','Arm','/assets/images/parts/2046-AA-left_arm.png','blue','cool',10,0,0,0,1,0,0,0,0,0,'2020-04-26 20:48:16',1),(57,'2045-AA-battery-D','Battery','/assets/images/parts/2045-AA-battery-D.png','red','no',0,0,20,0,0,0,0,0,1,0,'2020-05-05 23:04:35',1),(66,'2147-AA-body','Body','/assets/images/parts/2147-AA-body.png','violet','bad',0,0,0,0,0,0,0,0,1,0,'2020-05-10 16:19:57',2),(67,'2147-AA-hemlet','hemlet','/assets/images/parts/2147-AA-hemlet.png','violet','bad',0,0,0,0,0,0,0,1,1,0,'2020-04-16 09:57:12',2),(68,'2147-AA-right_arm','Arm','/assets/images/parts/2147-AA-right_arm.png','violet','bad',5,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',2),(69,'2147-AA-left_arm','Arm','/assets/images/parts/2147-AA-left_arm.png','violet','bad',5,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',2),(70,'2147-AA-right_leg','Leg','/assets/images/parts/2147-AA-right_leg.png','violet','bad',0,5,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',2),(71,'2147-AA-left_leg','Leg','/assets/images/parts/2147-AA-left_leg.png','violet','bad',0,5,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',2),(72,'2148-AA-left_leg','Leg','/assets/images/parts/2148-AA-left_leg.png','blue','very bad',0,35,0,0,0,1,0,0,0,0,'2020-05-10 17:15:36',3),(73,'2148-AA-right_leg','Leg','/assets/images/parts/2148-AA-right_leg.png','blue','very bad',0,35,0,0,0,1,0,0,0,0,'2020-05-10 17:15:36',3),(74,'2148-AA-hemlet','hemlet','/assets/images/parts/2148-AA-hemlet.png','blue','very bad',0,0,0,0,0,0,0,1,1,0,'2020-05-10 17:17:28',2),(75,'2148-AA-body','Body','/assets/images/parts/2148-AA-body.png','blue','very bad',0,0,0,0,0,0,0,0,1,0,'2020-05-10 16:19:57',2),(76,'XXXX-XX-noarm','Arm','/assets/images/parts/xxxx-xx-noarm.png','white','no',0,0,0,0,1,1,0,0,0,0,'2020-05-10 16:19:57',99),(77,'2045-AA-battery-A','Battery','/assets/images/parts/2045-AA-battery-A.png','green','best charge',0,0,80,0,0,0,0,0,1,0,'2020-05-05 23:04:35',1),(78,'2045-AA-battery-B','Battery','/assets/images/parts/2045-AA-battery-B.png','orange','charge',0,0,60,0,0,0,0,0,1,0,'2020-05-05 23:04:35',1),(79,'2045-AA-battery-C','Battery','/assets/images/parts/2045-AA-battery-C.png','orange','no',0,0,40,0,0,0,0,0,1,0,'2020-05-05 23:04:35',1),(80,'2045-AA-brain-A','Brain','/assets/images/parts/2045-AA-brain-A.png','green','4 abilities',0,0,0,80,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(81,'2045-AA-brain-B','Brain','/assets/images/parts/2045-AA-brain-B.png','orange','3 abilities',0,0,0,60,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(82,'2045-AA-brain-C','Brain','/assets/images/parts/2045-AA-brain-C.png','orange','2 abilities',0,0,0,40,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(83,'2045-AA-brain-D','Brain','/assets/images/parts/2045-AA-brain-D.png','red','1 abilities',0,0,0,20,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(84,'2149-AA-body','Body','/assets/images/parts/2149-AA-body.png','black','good',0,0,0,0,0,0,0,0,1,0,'2020-05-10 16:19:57',4),(85,'2149-AA-left_leg','Leg','/assets/images/parts/2149-AA-left_leg.png','black','good',0,10,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',4),(86,'2149-AA-right_leg','Leg','/assets/images/parts/2149-AA-right_leg.png','black','good',0,10,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',4),(87,'2149-AA-right_arm','arm','/assets/images/parts/2149-AA-right_arm.png','black','good',20,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',4),(89,'2149-AA-hemlet','hemlet','/assets/images/parts/2149-AA-hemlet.png','black','good',0,0,0,0,0,0,0,1,1,0,'2020-05-10 17:17:28',4),(90,'2149-AA-left_arm','arm','/assets/images/parts/2149-AA-left_arm.png','black','good',20,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',4),(91,'2150-AA-body','Body','/assets/images/parts/2150-AA-body.png','White','E.T',0,0,0,0,0,0,0,0,1,0,'2020-05-10 16:19:57',5),(92,'2150-AA-hemlet','hemlet','/assets/images/parts/2150-AA-hemlet.png','White','E.T',0,0,0,0,0,0,0,1,1,0,'2020-05-10 17:17:28',5),(93,'2150-AA-left_arm','arm','/assets/images/parts/2150-AA-left_arm.png','White','E.T',5,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(94,'2150-AA-left_leg','Leg','/assets/images/parts/2150-AA-left_leg.png','White','E.T',0,45,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(95,'2150-AA-right_arm','arm','/assets/images/parts/2150-AA-right_arm.png','White','E.T',5,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(96,'2150-AA-right_leg','Leg','/assets/images/parts/2150-AA-right_leg.png','White','E.T',0,45,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(97,'2150-AB-body','Body','/assets/images/parts/2150-AB-body.png','White','E.T',0,0,0,0,0,0,0,0,1,0,'2020-05-10 16:19:57',5),(98,'2150-AB-hemlet','hemlet','/assets/images/parts/2150-AB-hemlet.png','White','E.T',0,0,0,0,0,0,0,1,1,0,'2020-05-10 17:17:28',5),(99,'2150-AB-left_arm','arm','/assets/images/parts/2150-AB-left_arm.png','White','E.T',5,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(100,'2150-AB-right_arm','arm','/assets/images/parts/2150-AB-right_arm.png','White','E.T',5,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(101,'2150-AB-left_leg','Leg','/assets/images/parts/2150-AB-left_leg.png','White','E.T',0,15,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(102,'2150-AB-right_leg','Leg','/assets/images/parts/2150-AB-right_leg.png','White','E.T',0,15,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',5),(103,'2045-AB-left_arm','Arm','/assets/images/parts/2045-AB-left_arm.png','red','berserk',45,0,0,0,0,1,0,0,0,0,'2020-05-10 20:49:07',1),(104,'2151-AA-left_arm','Arm','/assets/images/parts/2151-AA-left_arm.png','White','Killer',20,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',6),(105,'2151-AA-right_arm','Arm','/assets/images/parts/2151-AA-right_arm.png','White','Killer',20,0,0,0,0,1,0,0,0,0,'2020-04-16 09:57:12',6),(106,'2151-AA-body','Body','/assets/images/parts/2151-AA-body.png','White','Killer',0,0,0,0,0,0,0,0,1,0,'2020-05-10 16:19:57',6),(107,'2151-AA-hemlet','hemlet','/assets/images/parts/2151-AA-hemlet.png','White','Killer',0,0,0,0,0,0,0,1,1,0,'2020-05-10 17:17:28',6);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-10 23:39:47
