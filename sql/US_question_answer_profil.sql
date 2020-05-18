-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: setMind
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
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`id`, `contenu`) VALUES (1,'Choose the most attractive movie that embodies a robotic character'),(2,'What ability attract-you ?'),(3,'Which destination attract you ?'),(4,'Your way of thinking is'),(5,'What is the essential quality to become a robot ?'),(6,'What is the best way to win in a fight ?'),(7,'What kind of video games do you like ?'),(8,'What is your favourite weapon to defeat your opponent ?'),(9,'What would you save into your intern memory about humankind ?'),(10,'your greatest asset in a fight'),(11,'how do you react to an unknown situation ?'),(12,'what is your favourite way to relax yourself ?'),(13,' which planet do you prefer ?');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

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
  `user_id` int(11) DEFAULT NULL,
  `profil_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `next_question_id` (`next_question_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`next_question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` (`id`, `contenu`, `question_id`, `next_question_id`, `user_id`, `profil_id`) VALUES (1,'Wall-e',1,2,NULL,2),(5,'martial arts',2,8,NULL,1),(6,'time travel',2,4,NULL,2),(7,'metamorphosis',2,4,NULL,2),(8,'invisibility',2,5,NULL,3),(9,'desert island',3,NULL,NULL,2),(10,'space travel',3,NULL,NULL,2),(11,'battlefield',3,NULL,NULL,1),(12,'buddhist temple',3,NULL,NULL,4),(13,'pratical mind',4,6,NULL,3),(14,'creative',4,3,NULL,2),(15,'intuitive',4,3,NULL,2),(16,'crazy',4,6,NULL,1),(17,'analysis',5,6,NULL,3),(18,'knowledge',5,6,NULL,3),(19,'curiosity',5,4,NULL,2),(20,'wisdom',5,9,NULL,4),(21,'Ex machina',1,5,NULL,3),(22,'Johnny five',1,9,NULL,4),(23,'Ultron',1,8,NULL,1),(24,'strategic approach',6,7,NULL,3),(25,'powerful weapons',6,7,NULL,1),(26,'enemy manipulation',6,7,NULL,3),(27,'escape',6,3,NULL,2),(28,'simulation games',7,NULL,NULL,2),(29,'puzzle games',7,NULL,NULL,3),(30,'shooting games',7,NULL,NULL,1),(31,'strategy games',7,NULL,NULL,3),(32,'light saber',8,10,NULL,1),(33,'machine gun',8,10,NULL,1),(34,'arrow',8,4,NULL,2),(35,'persuasion',8,5,NULL,3),(36,'funny moment',9,12,NULL,4),(37,'love',9,12,NULL,4),(38,'knowledge',9,6,NULL,3),(39,'taste of the unknown',9,4,NULL,2),(40,'I am not afraid of anything',10,11,NULL,1),(41,'I am unstoppable',10,11,NULL,1),(44,'I can communicate with my enemies',10,9,NULL,4),(45,'I am always one step ahead',10,5,NULL,3),(46,'adaptation',11,NULL,NULL,3),(47,'improvisation',11,NULL,NULL,1),(48,'analyzing',11,NULL,NULL,1),(49,'discovery',11,NULL,NULL,2),(50,'meditation',12,13,NULL,4),(51,'music',12,13,NULL,4),(52,'read book',12,7,NULL,3),(53,'trek',12,3,NULL,2),(54,'earth',13,NULL,NULL,4),(55,'mars',13,NULL,NULL,1),(56,'jupiter',13,NULL,NULL,2),(57,'venus',13,NULL,NULL,4);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
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
  `contenu` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
INSERT INTO `profil` (`id`, `name`, `image`, `contenu`) VALUES (1,'Warrior','https://i.pinimg.com/originals/d5/bb/35/d5bb35dd0834fd8ec958ebd9e100b73d.png',' You are a man/woman of action. You don t take no for an answer and never hesitate to join a fight to defend your own views. Your ennemies fear your strenght and respect your bravery. Don t forget that not everybody is your ennemy thought …'),(2,'Explorer','https://avatarfiles.alphacoders.com/999/99923.jpg','You devote time to introspection, and you need to evolve, renew your ideas, your environment to feel alive.\nYou are a passionate being you like to take risks and meet new people with you can share your adventures.\n As a robot you will be constantly on the travel, always looking for new tools and new places.\n'),(3,'Analyst','https://rationalfaiths.com/wp-content/uploads/2016/01/1428618408.jpg','You like to share your ideas and expose your values to others, you need to feel that you have an impact on the world and on others. You like to repair and challenge yourself to develop your intellectual potential. Lost in your thoughts, you are often alone and you live it well. as a robot you will spend your time building and discovering every nook and cranny of your environment. Becoming a robot is a way for you to grow and learn more, you are not going to be bored.'),(4,'Wise man','https://i.pinimg.com/originals/17/c0/26/17c02687562ba7a92f22555124533de8.jpg','You are a gentle soul and feel attracted towards peaceful places. You are a great listener and your friends love to come to you for wise advices. You often find yourself to be the mediator in an argument between your friends. Don t forget to make your voice heard too...');
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-11 19:01:03
