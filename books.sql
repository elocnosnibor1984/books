-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: books
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Game of Thrones','George RR Martin','2016-05-17 13:43:05','2016-05-17 13:43:05'),(2,'Cat in the Hat','Dr Seuss','2016-05-17 13:43:53','2016-05-17 13:43:53'),(3,'Tuesdays with Morrie','Mitch Album','2016-05-17 13:44:48','2016-05-17 13:44:48'),(8,'Jurassic Park','Michael Crighton','2016-05-17 14:00:09','2016-05-17 14:00:09'),(9,'Darkness','EF Codd','2016-05-17 14:10:07','2016-05-17 14:10:07'),(19,'The Jungle Book','Rudyard Kipling','2016-05-17 14:22:54','2016-05-17 14:22:54'),(21,'Waking Up','Stephen King','2016-05-17 14:24:45','2016-05-17 14:24:45'),(22,'IT','Stephen King','2016-05-17 14:26:51','2016-05-17 14:26:51'),(23,'Frankenstein','Mary Shelley','2016-05-17 14:27:39','2016-05-17 14:27:39'),(28,'Go Dog Go','Stephen King','2016-05-17 15:46:15','2016-05-17 15:46:15'),(29,'Dance with Dragons','George RR Martin','2016-05-17 20:24:36','2016-05-17 20:24:36');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `review` longtext,
  `rating` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_user_id` int(11) NOT NULL,
  `books_book_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_reviews_users_idx` (`users_user_id`),
  KEY `fk_reviews_books1_idx` (`books_book_id`),
  CONSTRAINT `fk_reviews_books1` FOREIGN KEY (`books_book_id`) REFERENCES `books` (`book_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reviews_users` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (2,'Guns don\'t kill people, killer clowns kill people',3,'2016-05-17 14:26:51','2016-05-17 14:26:51',1,22),(3,'Lightning gives an unhappy scientist a boost',2,'2016-05-17 14:27:39','2016-05-17 14:27:39',1,23),(4,'al;ksdjflasd',1,'2016-05-17 15:24:09','2016-05-17 15:24:09',1,22),(5,'Shouldn\'t have put in the brain of a criminal. Duh',4,'2016-05-17 15:26:13','2016-05-17 15:26:13',1,23),(10,'I hope the dog goes',1,'2016-05-17 15:46:15','2016-05-17 15:46:15',1,28),(11,'I like it when dogs drive cars',4,'2016-05-17 16:38:30','2016-05-17 16:38:30',1,28),(12,'Latest book in ASOIAF',4,'2016-05-17 20:24:36','2016-05-17 20:24:36',1,29);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Tyrannosaurus Rex','T-Bone','the_king@gmail.com','$2b$12$zLbcLUylr4PjV1V9mSxGc.DWe23vimIM/Npdnqwr2ZVFF2CCJoQRO','2016-05-17 12:38:41','2016-05-17 12:38:41'),(2,'Cole Robinson','C_Train','cole@gmail.com','$2b$12$2JYXMjDzUq.prhpw5/n.le4G4GotoqX5rpH4TJHMJFYlErxU6PLSe','2016-05-17 13:07:13','2016-05-17 13:07:13');
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

-- Dump completed on 2016-05-19 18:54:01
