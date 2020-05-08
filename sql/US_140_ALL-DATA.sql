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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` varchar(200) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `next_question_id` int(11) DEFAULT NULL,
  `value_score` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `next_question_id` (`next_question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`next_question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` (`id`, `contenu`, `question_id`, `next_question_id`, `value_score`, `user_id`) VALUES (1,'Wall-e',1,2,25,NULL),(2,'C3-PO',1,3,50,NULL),(3,'R.Daneel Olivaw',1,4,0,NULL),(4,'T-800',1,5,75,NULL),(5,'Tout ranger , classer , trier !',2,NULL,50,NULL),(6,'Ecraser, concasser, empiler !',2,NULL,75,NULL),(7,'Receuillir , aider , cultiver !',2,NULL,25,NULL),(8,'REcherche un ou une amie fidele !',2,NULL,0,NULL),(9,'Soutenir la rsistance !',3,NULL,25,NULL),(10,'Me faire repararer par R2-D2 !',3,NULL,50,NULL),(11,'Parler plusieurs million de dialectes !',3,NULL,0,NULL),(12,'Avoir été construit par Dark Vador',3,NULL,75,NULL),(13,'Un robot ne peut porter atteinte à un être humain ni, restant passif, laisser cet être humain exposé au danger. ',4,NULL,25,NULL),(14,'Un robot doit obéir aux ordres donnés par les êtres humains, sauf si de tels ordres sont en contradiction avec la Première Loi. ',4,NULL,50,NULL),(15,'Un robot doit protéger son existence dans la mesure où cette protection n\'entre pas en contradiction avec la Première ou la Deuxième Loi.',4,NULL,75,NULL),(16,'Je choisie la loi 0.',4,NULL,0,NULL),(17,'Jhon connor is the best !',5,NULL,75,NULL),(18,'I love cyberdine !',5,NULL,75,NULL),(19,'Trop cool de hacker les distributeurs de monaie !',5,NULL,50,NULL),(20,'Repartir dans le passer pour tuer mes enemis !',5,NULL,75,NULL);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envelop`
--

LOCK TABLES `envelop` WRITE;
/*!40000 ALTER TABLE `envelop` DISABLE KEYS */;
INSERT INTO `envelop` (`id`, `name`, `date_creation`, `parts_id_body`, `parts_id_battery`, `parts_id_brain`, `parts_id_hemlet`, `parts_id_left_arm`, `parts_id_right_arm`, `parts_id_left_leg`, `parts_id_right_leg`) VALUES (1,'CarniLol_default','2020-04-16 09:57:11',1,2,4,3,6,5,8,7),(2,'CarniLol_Barbar','2020-04-16 09:57:11',1,2,4,3,6,5,8,7),(3,'CarniLol_Normal','2020-04-16 09:57:11',15,57,4,16,19,17,13,14),(4,'CarniLol_Speed','2020-04-16 09:57:11',1,2,4,3,9,5,8,7),(5,'CarniLol_Genius','2020-04-16 09:57:11',1,2,4,3,9,5,8,7),(6,'Bilbo','2020-05-01 15:11:41',15,57,NULL,NULL,NULL,NULL,NULL,NULL),(7,'CarniLol_Genius','2020-05-06 09:10:05',1,2,4,3,9,5,8,7),(8,'CarniLol_Genius','2020-05-06 09:10:38',1,2,4,3,9,5,8,7),(9,'CarniLol_Genius','2020-05-06 09:10:51',1,2,4,3,9,5,8,7);
/*!40000 ALTER TABLE `envelop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`, `title`) VALUES (1,'Stuff'),(2,'Doodads'),(3,'yup');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` (`id`, `name`, `type`, `visual`, `color`, `special_ability`, `strenght`, `speed`, `capacity`, `setmind`, `left`, `right`, `bottom`, `top`, `center`, `grade`, `date_creation`, `range_id`) VALUES (1,'2045-AA-body','Body','/assets/images/parts/2045-AA-body.png','black','cool',0,0,50,50,0,0,0,0,1,0,'2020-04-16 09:57:12',1),(2,'2045-AA-battery-A+','Battery','/assets/images/parts/2045-AA-battery-A+.png','black','cool',0,0,100,50,0,0,0,0,1,0,'2020-04-16 09:57:12',1),(3,'2045-AA-hemlet','hemlet','/assets/images/parts/2045-AA-hemlet.png','black','cool',0,0,50,50,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(4,'2045-AA-brain-A+','Brain','/assets/images/parts/2045-AA-brain-A+.png','black','cool',0,0,50,50,0,0,0,1,1,0,'2020-04-16 09:57:12',1),(5,'2045-AA-right_arm','Arm','/assets/images/parts/2045-AA-right_arm.png','black','cool',15,0,50,50,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(6,'2045-AA-left_arm','Arm','/assets/images/parts/2045-AA-left_arm.png','black','cool',15,0,50,50,1,0,0,0,0,0,'2020-04-16 09:57:12',1),(7,'2045-AA-right_leg','Leg','/assets/images/parts/2045-AA-right_leg.png','black','cool',0,15,50,50,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(8,'2045-AA-left_leg','Leg','/assets/images/parts/2045-AA-left_leg.png','black','cool',0,15,50,50,1,0,0,0,0,0,'2020-04-16 09:57:12',1),(9,'2045-AB-right_arm','Arm','/assets/images/parts/2045-AB-right_arm.png','red','cool',25,0,50,50,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(10,'2045-AB-left_arm','Arm','/assets/images/parts/2045-AB-left_arm.png','red','cool',25,0,50,50,1,0,0,0,0,0,'2020-04-16 09:57:12',1),(11,'2045-AB-right_leg','Leg','/assets/images/parts/2045-AB-right_leg.png','red','cool',0,0,50,50,0,1,0,0,0,0,'2020-04-16 09:57:12',1),(12,'2045-AB-left_leg','Leg','/assets/images/parts/2045-AB-left_leg.png','red','cool',0,0,50,50,1,0,0,0,0,0,'2020-04-16 09:57:12',1),(13,'2046-AA-left_leg','Leg','/assets/images/parts/2046-AA-left_leg.png','blue','cool',0,25,50,50,1,0,0,0,0,0,'2020-04-26 20:40:22',1),(14,'2046-AA-right_leg','Leg','/assets/images/parts/2046-AA-right_leg.png','blue','cool',0,25,50,50,1,0,0,0,0,0,'2020-04-26 20:41:11',1),(15,'2046-AA-body','Body','/assets/images/parts/2046-AA-body.png','blue','cool',0,0,50,50,0,0,0,0,1,0,'2020-04-26 20:45:06',1),(16,'2046-AA-hemlet','hemlet','/assets/images/parts/2046-AA-hemlet.png','blue','cool',0,0,50,50,0,0,0,1,1,0,'2020-04-26 20:45:06',1),(17,'2046-AA-right_arm','Arm','/assets/images/parts/2046-AA-right_arm.png','blue','cool',10,0,50,50,0,1,0,0,0,0,'2020-04-26 20:47:52',1),(19,'2046-AA-left_arm','Arm','/assets/images/parts/2046-AA-left_arm.png','blue','cool',10,0,50,50,1,0,0,0,0,0,'2020-04-26 20:48:16',1),(49,'2046-AA-left_arm','Arm','/assets/images/parts/2046-AA-left_arm5eb161fb725de.png','blue','cool',10,0,50,50,1,0,0,0,0,0,'2020-05-05 10:20:14',1),(56,'2046-AA-left_arm','Arm','/assets/images/parts/2046-AA-left_arm5eb161fb725de.png','blue','cool',10,0,50,50,1,0,0,0,0,0,'2020-05-05 21:28:18',1),(57,'2045-AA-battery-A','Battery','/assets/images/parts/2045-AA-battery-A+5eb1f195abff1.png','black','cool',0,0,100,50,0,0,0,0,1,0,'2020-05-05 23:04:35',1),(59,'2045-AA-battery-A+','Battery','/assets/images/parts/2045-AA-battery-A+.png','black','cool',0,0,100,50,0,0,0,0,1,0,'2020-05-06 06:44:17',1);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `score_max` int(11) DEFAULT NULL,
  `score_min` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
INSERT INTO `profil` (`id`, `name`, `image`, `score_max`, `score_min`) VALUES (1,'Warior','null',150,125),(2,'Genius','null',0,49),(3,'Normal','null',50,124);
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil_envelops`
--

DROP TABLE IF EXISTS `profil_envelops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil_envelops` (
  `profil_id` int(11) DEFAULT NULL,
  `envelop_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil_envelops`
--

LOCK TABLES `profil_envelops` WRITE;
/*!40000 ALTER TABLE `profil_envelops` DISABLE KEYS */;
INSERT INTO `profil_envelops` (`profil_id`, `envelop_id`) VALUES (1,2),(3,3),(3,4),(3,1),(2,2),(2,1);
/*!40000 ALTER TABLE `profil_envelops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` text,
  `numeros` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`id`, `contenu`, `numeros`) VALUES (1,'Choisi parmis ces robot celui  qui tu prefere ? ',1),(2,'Wall-e : De ces activitées quelle est ta préféré ? ',2),(3,'C3-PO : De ces activitées quelle est ta préféré ? ',3),(4,'R.Deneel : De ces activitées quelle est ta préféré ? ',4),(5,'T-800 : De ces activitées quelle est ta préféré ? ',5);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `range`
--

DROP TABLE IF EXISTS `range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `range` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `range`
--

LOCK TABLES `range` WRITE;
/*!40000 ALTER TABLE `range` DISABLE KEYS */;
INSERT INTO `range` (`id`, `name`) VALUES (1,'2095'),(2,'2096'),(3,'2097'),(4,'2098'),(5,'2099'),(6,'2100'),(7,'2101');
/*!40000 ALTER TABLE `range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `pseudo` varchar(20) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `final_score` int(11) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `profil_id` int(11) DEFAULT NULL,
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
  KEY `profil_id` (`profil_id`),
  KEY `parts_id_body` (`parts_id_body`),
  KEY `parts_id_battery` (`parts_id_battery`),
  KEY `parts_id_brain` (`parts_id_brain`),
  KEY `parts_id_hemlet` (`parts_id_hemlet`),
  KEY `parts_id_left_arm` (`parts_id_left_arm`),
  KEY `parts_id_right_arm` (`parts_id_right_arm`),
  KEY `parts_id_left_leg` (`parts_id_left_leg`),
  KEY `parts_id_right_leg` (`parts_id_right_leg`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`profil_id`) REFERENCES `profil` (`id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`parts_id_body`) REFERENCES `parts` (`id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`parts_id_battery`) REFERENCES `parts` (`id`),
  CONSTRAINT `user_ibfk_4` FOREIGN KEY (`parts_id_brain`) REFERENCES `parts` (`id`),
  CONSTRAINT `user_ibfk_5` FOREIGN KEY (`parts_id_hemlet`) REFERENCES `parts` (`id`),
  CONSTRAINT `user_ibfk_6` FOREIGN KEY (`parts_id_left_arm`) REFERENCES `parts` (`id`),
  CONSTRAINT `user_ibfk_7` FOREIGN KEY (`parts_id_right_arm`) REFERENCES `parts` (`id`),
  CONSTRAINT `user_ibfk_8` FOREIGN KEY (`parts_id_left_leg`) REFERENCES `parts` (`id`),
  CONSTRAINT `user_ibfk_9` FOREIGN KEY (`parts_id_right_leg`) REFERENCES `parts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `pseudo`, `password`, `final_score`, `answer_id`, `profil_id`, `date_creation`, `parts_id_body`, `parts_id_battery`, `parts_id_brain`, `parts_id_hemlet`, `parts_id_left_arm`, `parts_id_right_arm`, `parts_id_left_leg`, `parts_id_right_leg`) VALUES (1,'Guillaume','SetMindTeam','actix2013@gmail.com','R.Guille Olivaw',NULL,NULL,1,2,'2020-04-16 09:57:11',NULL,NULL,NULL,16,NULL,NULL,NULL,NULL),(2,'Lisa','SetMindTeam','lisa3@gmail.com','R.Lisa Olivaw',NULL,NULL,5,2,'2020-04-16 09:57:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Ben Kenobi','SetMindTeam','ben.kenobi@gmail.com','R.Ben Olivaw',NULL,10,NULL,2,'2020-04-16 09:57:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Ben Vador','SetMindTeam','ben.vador@gmail.com','R.Vador Olivaw',NULL,11,NULL,2,'2020-04-16 09:57:11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-06 14:46:24
