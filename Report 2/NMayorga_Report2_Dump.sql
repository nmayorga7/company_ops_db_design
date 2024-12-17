CREATE DATABASE  IF NOT EXISTS `billing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `billing`;
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
INSERT INTO `clients` VALUES (1,'Bright Enterprises','New York','Operations','Charlotte Simmons','Net 60'),(2,'Tech Solutions','San Francisco','Product Development','Samuel Lee','Net 30'),(3,'Vision Capital','Chicago','Investment','Renee Jacobs','Net 45'),(4,'Ops Logistics','Los Angeles','Logistics','Oliver Price','Net 60'),(5,'Upward Innovations','New York','Design','Isabella Gonzalez','Net 30'),(6,'Twintech Systems','Dallas','IT','Noah Williams','Net 90'),(7,'Capital Ventures','Austin','Investment','James Anderson','Net 45');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `department` varchar(80) NOT NULL,
  `title` varchar(80) NOT NULL,
  `street` varchar(80) NOT NULL,
  `city` varchar(120) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(90) NOT NULL,
  `zip_code` varchar(9) NOT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `hourly_rate` varchar(45) NOT NULL,
  `corporate_card_number` varchar(40) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Maria Hernandez','Software Engineering','Senior Developer','52 Broadway','New York','NY','USA','10004','2125553829','80','9382746102938476'),(2,'David Leary','Marketing','Marketing Director','75 Mission St','San Francisco','CA','USA','94105','4155556753','120','7645123489237584'),(3,'Aditi Kapoor','Finance','Financial Analyst','135 South LaSalle St','Chicago','IL','USA','60603','3125552398','70','1827364590283746'),(4,'Jake Thompson','IT','Systems Engineer','6100 Center Dr','Los Angeles','CA','USA','90045','2135557829','82.5','3482913748273648'),(5,'Emily Patel','HR','HR Specialist','123 Elm St','Dallas','TX','USA','75201','2145558392','60','5872610938475123'),(6,'Liam Davis','Operations','Operations Manager','600 East Las Colinas Blvd','Irving','TX','USA','75039','9725552839','100','7281938476283746'),(7,'Sophia Chavis','Finance','Finance Director','333 South Hope St','Los Angeles','CA','USA','90071','2135552938','130','9283747561938476');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `expense_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `project_id` int NOT NULL,
  `expense_amount` decimal(10,0) NOT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `employee_id` (`employee_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `expenses_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
INSERT INTO `expenses` VALUES (1,1,1,201,'2024-01-10'),(2,2,2,326,'2024-02-15'),(3,3,3,180,'2024-03-22'),(4,4,4,401,'2024-01-25'),(5,5,5,251,'2024-04-10'),(6,6,6,301,'2024-03-18'),(7,7,7,150,'2024-05-15');
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `hours_worked` VALUES (1,1,'2024-01-08',8),(2,2,'2024-02-12',8),(2,2,'2024-03-12',8),(3,3,'2024-03-20',7),(4,2,'2024-03-29',6),(4,3,'2024-06-20',9),(4,4,'2024-01-20',9),(5,2,'2024-01-08',8),(5,2,'2024-04-08',7),(5,5,'2024-04-05',5),(6,6,'2024-03-12',7),(6,6,'2024-03-15',7),(7,3,'2024-05-10',9),(7,7,'2024-05-10',9);
/*!40000 ALTER TABLE `hours_worked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `project_id` int NOT NULL,
  `client_id` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `labor_cost` decimal(10,0) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,1,'2010-05-15','2011-04-30',1009),(2,2,'2012-07-20','2013-06-15',4369),(3,3,'2015-03-10','2015-06-25',3099),(4,4,'2018-09-05','2019-03-10',1372),(5,5,'2020-11-12','2021-05-18',661),(6,6,'2022-06-25','2022-09-25',2041),(7,7,'2023-02-01','2023-12-01',1584);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-20 22:14:43
