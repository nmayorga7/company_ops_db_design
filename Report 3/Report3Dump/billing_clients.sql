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
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `location` varchar(80) NOT NULL,
  `department` varchar(80) DEFAULT NULL,
  `billing_contact` varchar(120) NOT NULL,
  `billing_info` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Bright Enterprises','New York','Operations','Charlotte Simmons','Net 60'),(2,'Tech Solutions','San Francisco','Product Development','Samuel Lee','Net 30'),(3,'Vision Capital','Chicago','Investment','Renee Jacobs','Net 45'),(4,'Ops Logistics','Los Angeles','Logistics','Oliver Price','Net 60'),(5,'Upward Innovations','New York','Design','Isabella Gonzalez','Net 30'),(6,'Twintech Systems','Dallas','IT','Noah Williams','Net 90'),(7,'Capital Ventures','Austin','Investment','James Anderson','Net 45'),(8,'Metro Innovations','Seattle','Tech Consulting','Megan Wells','Net 60'),(9,'Peak Ventures','Denver','Investment','Carlos Ruiz','Net 45'),(10,'Creative Minds','Boston','Marketing','Evelyn Brooks','Net 30'),(11,'Edge Analytics','Phoenix','Data Analytics','Victor Green','Net 90'),(12,'Prime Logistics','Miami','Supply Chain','Eliana Torres','Net 60'),(13,'FinServe Advisors','Newark','Financial Services','Grace Liu','Net 45'),(14,'Blue Skies Solutions','Orlando','Real Estate','Jack Harris','Net 30'),(15,'West Coast Media','San Diego','Advertising','Sarah King','Net 60'),(16,'GreenTech Labs','Austin','Renewable Energy','Owen Scott','Net 45'),(17,'North Star Ventures','Minneapolis','Venture Capital','Sophia Kim','Net 90');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
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
