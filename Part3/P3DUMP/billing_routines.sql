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
-- Temporary view structure for view `client_project_view`
--

DROP TABLE IF EXISTS `client_project_view`;
/*!50001 DROP VIEW IF EXISTS `client_project_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `client_project_view` AS SELECT 
 1 AS `project_id`,
 1 AS `client_id`,
 1 AS `client_name`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `employee_names`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `client_invoice_view`
--

DROP TABLE IF EXISTS `client_invoice_view`;
/*!50001 DROP VIEW IF EXISTS `client_invoice_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `client_invoice_view` AS SELECT 
 1 AS `employee_name`,
 1 AS `employee_id`,
 1 AS `project_id`,
 1 AS `client_id`,
 1 AS `total_hours`,
 1 AS `hourly_rate`,
 1 AS `labor_cost`,
 1 AS `expense_amount`,
 1 AS `purchase_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `client_list`
--

DROP TABLE IF EXISTS `client_list`;
/*!50001 DROP VIEW IF EXISTS `client_list`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `client_list` AS SELECT 
 1 AS `client_id`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `employee_view`
--

DROP TABLE IF EXISTS `employee_view`;
/*!50001 DROP VIEW IF EXISTS `employee_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_view` AS SELECT 
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `department`,
 1 AS `title`,
 1 AS `address`,
 1 AS `phone_number`,
 1 AS `hourly_rate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `project_employee_info`
--

DROP TABLE IF EXISTS `project_employee_info`;
/*!50001 DROP VIEW IF EXISTS `project_employee_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `project_employee_info` AS SELECT 
 1 AS `project_id`,
 1 AS `client_id`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `employee_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `client_project_view`
--

/*!50001 DROP VIEW IF EXISTS `client_project_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `client_project_view` AS select `p`.`project_id` AS `project_id`,`p`.`client_id` AS `client_id`,`c`.`name` AS `client_name`,`p`.`start_date` AS `start_date`,`p`.`end_date` AS `end_date`,group_concat(`e`.`name` order by `e`.`name` ASC separator ', ') AS `employee_names` from (((`projects` `p` join `clients` `c` on((`p`.`client_id` = `c`.`client_id`))) join `hours_worked` `hw` on((`p`.`project_id` = `hw`.`project_id`))) join `employee` `e` on((`hw`.`employee_id` = `e`.`employee_id`))) group by `p`.`project_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `client_invoice_view`
--

/*!50001 DROP VIEW IF EXISTS `client_invoice_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `client_invoice_view` AS select `e`.`name` AS `employee_name`,`e`.`employee_id` AS `employee_id`,`p`.`project_id` AS `project_id`,`p`.`client_id` AS `client_id`,`hw`.`total_hours` AS `total_hours`,`e`.`hourly_rate` AS `hourly_rate`,(`hw`.`total_hours` * cast(`e`.`hourly_rate` as decimal(10,0))) AS `labor_cost`,`ex`.`expense_amount` AS `expense_amount`,`ex`.`purchase_date` AS `purchase_date` from ((((`clients` `c` join `projects` `p` on((`c`.`client_id` = `p`.`client_id`))) left join `hours_worked` `hw` on((`p`.`project_id` = `hw`.`project_id`))) left join `employee` `e` on((`hw`.`employee_id` = `e`.`employee_id`))) left join `expenses` `ex` on(((`p`.`project_id` = `ex`.`project_id`) and (`ex`.`employee_id` = `e`.`employee_id`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `client_list`
--

/*!50001 DROP VIEW IF EXISTS `client_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `client_list` AS select `clients`.`client_id` AS `client_id`,`clients`.`name` AS `name` from `clients` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_view`
--

/*!50001 DROP VIEW IF EXISTS `employee_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_view` AS select `employee`.`employee_id` AS `employee_id`,`employee`.`name` AS `name`,`employee`.`department` AS `department`,`employee`.`title` AS `title`,concat(`employee`.`street`,', ',`employee`.`city`,', ',`employee`.`state`,', ',`employee`.`country`,' ',`employee`.`zip_code`) AS `address`,`employee`.`phone_number` AS `phone_number`,`employee`.`hourly_rate` AS `hourly_rate` from `employee` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `project_employee_info`
--

/*!50001 DROP VIEW IF EXISTS `project_employee_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `project_employee_info` AS select `p`.`project_id` AS `project_id`,`p`.`client_id` AS `client_id`,`p`.`start_date` AS `start_date`,`p`.`end_date` AS `end_date`,`e`.`name` AS `employee_name` from ((`projects` `p` join `hours_worked` `hw` on((`p`.`project_id` = `hw`.`project_id`))) join `employee` `e` on((`hw`.`employee_id` = `e`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping routines for database 'billing'
--
/*!50003 DROP FUNCTION IF EXISTS `get_employee_project_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_employee_project_hours`(emp_id int, proj_id int) RETURNS int
    DETERMINISTIC
begin
    -- directly return the sum of total_hours, it will return NULL if no records are found
    return (select sum(total_hours)
            from hours_worked
            where employee_id = emp_id and project_id = proj_id);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `get_emp_proj_hours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_emp_proj_hours`(employee_id int, project_id int) RETURNS int
    DETERMINISTIC
begin
    return (
        select sum(total_hours)
        from hours_worked
        where employee_id = employee_id and project_id = project_id
    );
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CalculateTotalHours` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateTotalHours`(in project_id int)
begin
    select SUM(total_hours) as total_hours
    from hours_worked
    where project_id = project_id;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-07 15:45:54
