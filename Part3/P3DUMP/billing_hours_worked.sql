-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: billing
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `hours_worked`
--

DROP TABLE IF EXISTS `hours_worked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hours_worked` (
  `employee_id` int NOT NULL,
  `project_id` int NOT NULL,
  `date` date NOT NULL,
  `total_hours` decimal(10,0) NOT NULL,
  PRIMARY KEY (`employee_id`,`project_id`,`date`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `hours_worked_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `hours_worked_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hours_worked`
--

LOCK TABLES `hours_worked` WRITE;
/*!40000 ALTER TABLE `hours_worked` DISABLE KEYS */;
INSERT INTO `hours_worked` VALUES (1,1,'2024-01-08',8),(1,2,'2024-06-07',8),(1,3,'2024-06-10',7),(1,5,'2024-09-05',7),(2,1,'2024-07-14',9),(2,2,'2024-02-12',8),(2,2,'2024-03-12',8),(2,6,'2024-04-08',8),(2,7,'2024-08-20',9),(3,2,'2024-05-12',8),(3,3,'2024-03-20',7),(3,4,'2024-06-25',7),(3,5,'2024-07-08',9),(4,2,'2024-03-29',6),(4,3,'2024-06-20',9),(4,4,'2024-01-20',9),(4,6,'2024-03-25',8),(4,7,'2024-01-15',8),(5,1,'2024-02-20',6),(5,2,'2024-01-08',8),(5,2,'2024-04-08',7),(5,2,'2024-05-22',8),(5,3,'2024-04-15',7),(5,5,'2024-04-05',5),(6,3,'2024-02-28',9),(6,4,'2024-08-12',9),(6,5,'2024-07-03',9),(6,6,'2024-03-12',7),(6,6,'2024-03-15',7),(7,1,'2024-09-18',6),(7,3,'2024-05-10',9),(7,4,'2024-03-18',9),(7,7,'2024-05-10',9),(7,7,'2024-08-10',8);
/*!40000 ALTER TABLE `hours_worked` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07 15:45:53
