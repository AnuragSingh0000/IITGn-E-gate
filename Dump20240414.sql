-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: iitgn
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `email`
--
USE iitgn;
DROP TABLE IF EXISTS `email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email` (
  `emailid` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `rollno` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email`
--

LOCK TABLES `email` WRITE;
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` VALUES ('23110035@iitgn.ac.in','John Doe',123456),('23110065@iitgn.ac.in','Jane Smith',654321),('23110045@iitgn.ac.in','Sam Johnson',987654),('23110055@iitgn.ac.in','Sara Brown',456789),('23110015@iitgn.ac.in','Mike Wilson',135792),('23110025@iitgn.ac.in','Emily Davis',246813),('23110005@iitgn.ac.in','Alex Martinez',369258),('23110075@iitgn.ac.in','Chris Taylor',147258),('23110085@iitgn.ac.in','Lisa Miller',258369),('23110095@iitgn.ac.in','Ryan Anderson',159357);
/*!40000 ALTER TABLE `email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guard`
--

DROP TABLE IF EXISTS `guard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guard` (
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guard`
--

LOCK TABLES `guard` WRITE;
/*!40000 ALTER TABLE `guard` DISABLE KEYS */;
INSERT INTO `guard` VALUES ('ram.singh@iitgn.ac.in','abc123'),('raju.verma@iitgn.ac.in','123abc');
/*!40000 ALTER TABLE `guard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `visitor_name` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `phone_Number` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date_Of_Visit` varchar(20) DEFAULT NULL,
  `date_Of_Leaving` varchar(20) DEFAULT NULL,
  `student_name` varchar(255) NOT NULL,
  `relationship` varchar(255) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_roll` varchar(20) NOT NULL,
  `student_Phone_number` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,'Anurag Singh','Orai',19,'8960881886','sengarc3@gmail.com','2024-04-17','2024-04-26','John Doe','Dad','23110035@iitgn.ac.in','123456','8960881886'),(2,'Some RAndom','Orai',19,'8960881886','sengarc3@gmail.com','2024-05-02','2024-05-12','John Doe','Dad','23110035@iitgn.ac.in','123456','8960881886'),(3,'Anurag Singh','Orai',19,'8960881886','sengarc3@gmail.com','2024-04-17','2024-04-28','John Doe','Dad','23110035@iitgn.ac.in','123456','8960881886'),(4,'Anurag Singh','Orai',19,'8960881886','23110035@iitgn.ac.in','2024-04-15','2024-04-18','John Doe','ad','23110035@iitgn.ac.in','123456','8960881886');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'iitgn'
--

--
-- Dumping routines for database 'iitgn'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-14 10:03:32
