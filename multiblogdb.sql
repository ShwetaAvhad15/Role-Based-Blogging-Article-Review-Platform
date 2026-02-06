CREATE DATABASE  IF NOT EXISTS `multiblogdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `multiblogdb`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: multiblogdb
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20260126123023_InitialCreate','9.0.0'),('20260126133828_AppDbContext1','9.0.0'),('20260126133954_AppDbContext2','9.0.0');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articleimages`
--

DROP TABLE IF EXISTS `articleimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articleimages` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ImageUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ArticleId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_ArticleImages_ArticleId` (`ArticleId`),
  CONSTRAINT `FK_ArticleImages_Articles_ArticleId` FOREIGN KEY (`ArticleId`) REFERENCES `articles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articleimages`
--

LOCK TABLES `articleimages` WRITE;
/*!40000 ALTER TABLE `articleimages` DISABLE KEYS */;
/*!40000 ALTER TABLE `articleimages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Status` int NOT NULL,
  `AuthorId` int NOT NULL,
  `CreatedAt` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `EditorId` int DEFAULT NULL,
  `FeatureImageUrl` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `AverageRating` double NOT NULL DEFAULT '0',
  `TotalReviews` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `IX_Articles_AuthorId` (`AuthorId`),
  KEY `IX_Articles_EditorId` (`EditorId`),
  CONSTRAINT `FK_Articles_Users_AuthorId` FOREIGN KEY (`AuthorId`) REFERENCES `users` (`Id`) ON DELETE RESTRICT,
  CONSTRAINT `FK_Articles_Users_EditorId` FOREIGN KEY (`EditorId`) REFERENCES `users` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (14,'Workaholics People','<p>Workaholism is a complex condition characterized by an excessive and compulsive desire to work. It can lead to reduced self-care, relationship issues, and health problems. While the term &quot;workaholic&quot; is not formally recognized as a disorder, it reflects a behavioral pattern that shares similarities with other addictive behaviors. Workaholism is not a formal disorder in the DSM-5-TR or the ICD-11, but it shares symptoms with other addictions. Personal and situational factors, such as personality traits and working environment, may contribute to the development of work addiction. Symptoms of workaholism include excessive work involvement, drivenness to work, and lack of work enjoyment. It is important to differentiate between high job involvement and workaholism, as high job involvement does not necessarily indicate workaholism. </p><p>Wikipedia</p><p><br/> </p>',1,2,'2026-01-30 05:22:51.049845',NULL,'System.Collections.Generic.List`1[System.String]',NULL,0,0),(15,'Workholic People Life test','<p>More than eight out of ten employees are at risk of burnout this year, according to the 2024 Global Talent Trends report published by Mercer, an HR consulting firm, and excessive workload is one of the top contributing factors. Malissa Clark is the author of Never Not Working: Why the Always-On Culture is Bad for Business—And How to Fix It and the Head of the Healthy Work Lab at the University of Georgia. As a research practitioner, Malissa joins me in the desire to see healthy workplaces where well-being thrives. I hope our conversation on workaholism will help you in your journey and workplace. </p>',3,2,'2026-01-30 05:39:25.124087',4,'https://localhost:44343/Uploads/50525bb0-87a9-4de6-99aa-4021c8928bc2.webp','2026-01-30 11:27:51.807842',6,1),(16,'Airforce Accidents','In February 2019, two Surya Kiran Hawk jets collided during a rehearsal for Aero India in Bengaluru. Two pilots ejected and survived, but Wing Command... Read more at: https://english.mathrubhumi.com/news/india/indian-military-air-accidents-analysis-major-m0ivpevs',1,2,'2026-01-30 12:41:38.669931',NULL,'Microsoft.AspNetCore.Http.FormFile,Microsoft.AspNetCore.Http.FormFile',NULL,0,0),(18,'Airoplane crash tragedy','According to the civil aviation ministry, the Baramati airport is categorised as \"uncontrolled\", also known as category A of the four buckets Indian airports fall into. Currently, the Air Traffic Control (ATC) in Baramati is run by pilot cadets from local flying schools - Redbird Aviation and Carver Aviation, who take turns to manage the facility on alternate days.  As the guardian minister of Pune district, Ajit Pawar was also seeking an upgrade to the Baramati airport and had ordered the implementation of some basic facilities.',3,2,'2026-01-30 13:12:52.259280',4,'https://localhost:44343/Uploads/7180fc38-fe32-4050-a7b8-3db968df7463.jfif',NULL,0,0),(21,'Is your breakfast cereal healthy?','<p>I have a confession: I like cereal. And not just a little.</p><p>When I was a kid, I’d have ready-to-eat breakfast cereal in the morning and again after dinner as dessert. Raisin Bran, Corn Flakes, and Rice Krispies were in regular rotation. And if there was milk left over after finishing the cereal, I’d do what so many other cereal lovers do: add more cereal until the milk and cereal disappear together. Cereal is still on my short list of favorite foods.</p><p>I’m not alone in this. In the US, more than a quarter of children and adolescents devour ready-to-eat cereal for breakfast most days of the week. Among adults, around half eat cereal at least once or twice a week. Beloved athletes often appear on cereal boxes and a number of celebrities have proclaimed their love for the stuff, including Jerry Seinfeld and Justin Timberlake.</p><p>Part of the appeal is advertising touting cereal as a healthy choice. A 2025 study of more than 600 breakfast cereals disputes this, particularly for many cereal all-stars.</p>',3,9,'2026-01-30 17:41:19.131299',4,'https://localhost:44343/Uploads/a4884885-1d27-497d-b5c3-9ea1748b82ab.jpg',NULL,6,1),(22,'How is PSA used to monitor prostate cancer?','<p>In the first part of our series, we described how PSA is used as a screening tool to help detect prostate cancer in men who don’t have symptoms. PSA screening can save lives, but it frequently finds slow-growing cancer that might not ever become deadly. Sometimes PSA rises for reasons unrelated to cancer, including inflammation in the prostate, or a benign enlargement of the gland that often occurs with age. There are longstanding concerns that PSA screening leads to unnecessary tests and overdiagnosis of prostate cancer.</p><p>Doctors also measure PSA to check for disease progression in men who have an established cancer diagnosis. But where PSA screening often yields ambiguous findings, using PSA to monitor cancer progression “is one of the most useful tools we have,” says Dr. Marc B. Garnick, the Gorman Brothers Professor of Medicine at Harvard Medical School and Beth Israel Deaconess Medical Center, and editor-in-chief of the <em>Harvard Medical School Guide to Prostate Diseases</em>.</p><p>Men on active surveillance for low-risk prostate cancer might need treatment if their PSA levels start to rise. Doctors also measure PSA to check for recurring cancer in men who were already treated with surgery or radiation. But use of the test in such </p>',3,9,'2026-01-30 17:45:03.370035',4,'https://localhost:44343/Uploads/3ab14517-5520-4c46-8689-9b452f466991.jpg','2026-01-30 17:53:06.768550',10,1),(25,'Is the Redmi 13C money well spent or a regretful purchase?','<p>Apparently, it&#x27;s also supposed to make it smooth and easy to slide through apps which it does effortlessly. Since I bought it, I&#x27;ve used it to play over half a hundred games and also downloaded a lot of apps. All of which it accepts seamlessly, so 8/10 on that.</p><p>I will remove two marks because of the lagging screen which occurs at times. Though it&#x27;s very rare, it makes working with the phone quite stressful.</p><p>I think one of the reasons I fell in love with the Redmi 13C was the light blue background design. It gave off this feeling of uniqueness and up till now, it still does.</p><figure></figure>',0,2,'2026-01-30 18:22:42.949071',NULL,'https://localhost:44343/Uploads/09b3c80e-b4ca-4053-a703-8ef9157fad26.webp',NULL,0,0),(28,'Leveraging the strength of State-level ERCs','<p>Powerful backend system with High-Availability • Intelligent emergency signal distribution system (Signal Gateways) • Central voice logging system (Digital,  Data, Radio) • Digital GIS Maps (Standard and State-owned) • Communication Modules (Voice, Data, SMS, eMail, Fax) • Location Identification, External System Integration</p>',0,2,'2026-01-31 03:38:49.553943',NULL,'https://localhost:44343/Uploads/4fcb7582-b57d-4cf7-b24c-13a06739ee7a.webp',NULL,0,0),(29,'pune metro','<p>Operational Metro Lines (Phase 1)</p><p>1. Purple Line (Line 1) – PCMC Bhavan to Swargate</p><p>Distance: 16.59 km, 12 stations (9 elevated, 5 underground)</p><p>Covers key areas from Pimpri-Chinchwad to Swargate</p><p>Operates mainly on elevated viaducts; underground section from Agriculture College to Swargate</p>',0,2,'2026-01-31 09:51:36.148519',NULL,'https://localhost:44343/Uploads/82451bf1-4c34-441f-8587-9a917fc54db6.webp',NULL,0,0);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `ArticleId` int NOT NULL,
  `ReviewerId` int NOT NULL,
  `Comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Rating` int NOT NULL,
  `ReviewedAt` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  PRIMARY KEY (`Id`),
  KEY `IX_Reviews_ArticleId` (`ArticleId`),
  KEY `IX_Reviews_ReviewerId` (`ReviewerId`),
  CONSTRAINT `FK_Reviews_Articles_ArticleId` FOREIGN KEY (`ArticleId`) REFERENCES `articles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_Reviews_Users_ReviewerId` FOREIGN KEY (`ReviewerId`) REFERENCES `users` (`Id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (6,15,3,'Its good article for reding',3,'2026-01-30 08:51:27.098204'),(7,22,3,'ihii',5,'2026-01-31 09:55:04.396478'),(8,21,3,'it good ',3,'2026-02-04 05:46:20.453690');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `FullName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Role` int NOT NULL,
  `Otp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `OtpExpiry` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Rushikesh','rkondke097@gmail.com','$2a$11$IhGAvjw.mo63dGECnpOUTeGs0YcM22osUaCCfo2tvNx.ihD7PGUQm',1,NULL,NULL),(2,'vidya','vthange99@gmail.com','$2a$11$EQctJ3v9JRSzkpj5EYZa6ODk52NTNlI0JlUHidZxaRqvyrqXb61LO',3,'239665','2026-01-27 16:12:33.100200'),(3,'Vidya','vidya@gmail.com','$2a$11$LNM2P..jLEDxrb/LNHfh3ujlkWZoabV02ZTiQkJqfiMCWgJ4e6xhS',4,NULL,NULL),(4,'rushikesh kondke','rushikondke@gmail.com','$2a$11$hHm7RGTofPCwYlSKJI//WOhPcmOrrDfC3wDYXXmBymqbDaP25r9g2',2,NULL,NULL),(6,'rushikesh kkkk','rushi@gmail.com','$2a$11$BwOzw/JmdUYB.sXZNjasPea9hW/gHOq7SFL2O7dnr7VD.WtL5DIPa',1,NULL,NULL),(7,'Shweta Avhad','Shwetavhad15@gmail.com','$2a$11$nv3suEzDjNbWCzE.gj86cOo4usgLlPOoSIdKwN7VCaV3ukKNxn1Wu',3,'363298','2026-01-30 10:30:58.611615'),(8,'Rakesh','rakesh@gmail.com','$2a$11$VBd37ip18q1Pl1c3ZHjCWuVexHOl2JqIqEDPafaF6PElswO1zRFMe',0,NULL,NULL),(9,'Rajesh','rajesh@gmail.com','$2a$11$HOm46bQvGeUpSPY6FC/5K.lzFSj171QLCgpLVpgM6Mk3Jd/bXXe4m',3,NULL,NULL),(10,'Riya','riya@gmail.com','$2a$11$2vVy5XQ0p/et2wRHXFkNQOO921gPE9jkPMPcgjmtqdZ0vQLfBQaBa',3,NULL,NULL),(11,'Riya Sharma','shwetaavhad15@gmail.com','$2a$11$BgnQgo6l/JMvjWfCBQPaXeHjJZI6r2zSEa/p/vIU7aRjkP0Fh4Faq',3,NULL,NULL),(12,'Riya','avhadshweta15@gmail.com','$2a$11$3GbWWY8JZGQmrz/ZYDk8eurhp2p7YkITo4s.DZsOKJfhjMJcijKW6',3,NULL,NULL),(13,'Ram','ram@gmail.com','$2a$11$AZMbhGy/FqCZTFKX0MWVhOo.vihCcE0w/afsu3VqPlEfAgH.zQPPq',3,NULL,NULL),(14,'Rahul','123@gmail.com','$2a$11$08GHmgqtCWeYit7YmrKpl.ziJ/H5i8t5RSxgOHHDkRvAb.oSznWle',3,NULL,NULL);
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

-- Dump completed on 2026-02-04 20:42:04
