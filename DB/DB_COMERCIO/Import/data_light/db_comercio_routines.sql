-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_comercio
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Temporary view structure for view `vw_produto`
--

DROP TABLE IF EXISTS `vw_produto`;
/*!50001 DROP VIEW IF EXISTS `vw_produto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_produto` AS SELECT 
 1 AS `COD_PRODUTO`,
 1 AS `NME_PRODUTO`,
 1 AS `DSC_PRODUTO`,
 1 AS `COD_SUBCATEGORIA`,
 1 AS `NME_SUBCATEGORIA`,
 1 AS `COD_CATEGORIA`,
 1 AS `NME_CATEGORIA`,
 1 AS `COD_UNIDADE_MEDIDA`,
 1 AS `NME_UNIDADE_MEDIDA`,
 1 AS `SGL_UNIDADE_MEDIDA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_subcategoria`
--

DROP TABLE IF EXISTS `vw_subcategoria`;
/*!50001 DROP VIEW IF EXISTS `vw_subcategoria`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_subcategoria` AS SELECT 
 1 AS `COD_CATEGORIA`,
 1 AS `NME_CATEGORIA`,
 1 AS `COD_SUBCATEGORIA`,
 1 AS `NME_SUBCATEGORIA`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_produto`
--

/*!50001 DROP VIEW IF EXISTS `vw_produto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_produto` AS select `pr`.`COD_PRODUTO` AS `COD_PRODUTO`,`pr`.`NME_PRODUTO` AS `NME_PRODUTO`,`pr`.`DSC_PRODUTO` AS `DSC_PRODUTO`,`sc`.`COD_SUBCATEGORIA` AS `COD_SUBCATEGORIA`,`sc`.`NME_SUBCATEGORIA` AS `NME_SUBCATEGORIA`,`ct`.`COD_CATEGORIA` AS `COD_CATEGORIA`,`ct`.`NME_CATEGORIA` AS `NME_CATEGORIA`,`um`.`COD_UNIDADE_MEDIDA` AS `COD_UNIDADE_MEDIDA`,`um`.`NME_UNIDADE_MEDIDA` AS `NME_UNIDADE_MEDIDA`,`um`.`SGL_UNIDADE_MEDIDA` AS `SGL_UNIDADE_MEDIDA` from (((`produto` `pr` join `subcategoria` `sc` on((`pr`.`COD_SUBCATEGORIA` = `sc`.`COD_SUBCATEGORIA`))) join `categoria` `ct` on((`ct`.`COD_CATEGORIA` = `sc`.`COD_CATEGORIA`))) join `unidade_medida` `um` on((`um`.`COD_UNIDADE_MEDIDA` = `pr`.`COD_UNIDADE_MEDIDA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_subcategoria`
--

/*!50001 DROP VIEW IF EXISTS `vw_subcategoria`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_subcategoria` AS select `ct`.`COD_CATEGORIA` AS `COD_CATEGORIA`,`ct`.`NME_CATEGORIA` AS `NME_CATEGORIA`,`sc`.`COD_SUBCATEGORIA` AS `COD_SUBCATEGORIA`,`sc`.`NME_SUBCATEGORIA` AS `NME_SUBCATEGORIA` from (`categoria` `ct` join `subcategoria` `sc` on((`sc`.`COD_CATEGORIA` = `ct`.`COD_CATEGORIA`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-05  2:17:02
