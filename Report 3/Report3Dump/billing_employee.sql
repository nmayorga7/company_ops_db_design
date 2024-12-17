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
INSERT INTO `employee` VALUES (1,'Maria Hernandez','Digital','Senior Developer','52 Broadway','New York','NY','USA','10004','2125553829','80','9382746102938476'),(2,'David Leary','Marketing','Marketing Director','75 Mission St','San Francisco','CA','USA','94105','4155556753','120','7645123489237584'),(3,'Aditi Kapoor','Risk','Financial Analyst','135 South LaSalle St','Chicago','IL','USA','60603','3125552398','70','1827364590283746'),(4,'Jake Thompson','Operations','Systems Engineer','6100 Center Dr','Los Angeles','CA','USA','90045','2135557829','82.5','3482913748273648'),(5,'Emily Patel','Strategy','HR Specialist','123 Elm St','Dallas','TX','USA','75201','2145558392','60','5872610938475123'),(6,'Liam Davis','Operations','Operations Manager','600 East Las Colinas Blvd','Irving','TX','USA','75039','9725552839','100','7281938476283746'),(7,'Sophia Chavis','Risk','Finance Director','333 South Hope St','Los Angeles','CA','USA','90071','2135552938','130','9283747561938476'),(8,'Hannah Li','Digital','Lead Designer','125 King St','Seattle','WA','USA','98104','2065558732','110','9834729102837645'),(9,'Ethan Garcia','Sustainability','Data Scientist','950 Boylston St','Boston','MA','USA','02115','6175559247','90','8473629183475102'),(10,'Chloe Johnson','Marketing','SEO Specialist','456 Main St','Phoenix','AZ','USA','85004','6025553948','65','3847261938472561'),(11,'Liam Brown','Strategy','Sales Manager','567 First Ave','Miami','FL','USA','33101','3055553849','75','3748291048572635'),(12,'Emma Lopez','Operations','Network Engineer','135 Park Ave','Newark','NJ','USA','07102','9735552849','78','9483720192837465'),(13,'Olivia Nguyen','Operations','Logistics Coordinator','478 Maple St','Denver','CO','USA','80202','3035553847','60','1273482974738192'),(14,'Mason Martinez','Risk','Junior Accountant','155 Main St','Orlando','FL','USA','32801','4075559382','55','8237482619345764'),(15,'Zoe Turner','Marketing','Content Manager','322 North Ave','Chicago','IL','USA','60601','3125558392','68','7483925618372914'),(16,'Lucas Rivera','Strategy','Talent Acquisition Specialist','221 South St','Los Angeles','CA','USA','90012','2135556729','60','2837465928371463'),(17,'Ava Thompson','Risk','Investment Analyst','998 Park Ave','New York','NY','USA','10010','2125552937','82','0928473610283947');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
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
