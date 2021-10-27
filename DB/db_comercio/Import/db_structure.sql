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
-- Table structure for table `bairro`
--

DROP TABLE IF EXISTS `bairro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bairro` (
  `COD_BAIRRO` int NOT NULL AUTO_INCREMENT,
  `NME_BAIRRO` varchar(100) NOT NULL,
  `COD_MUNICIPIO` int DEFAULT NULL,
  PRIMARY KEY (`COD_BAIRRO`),
  KEY `FK_BAIRRO_MUNICIPIO_IDX` (`COD_MUNICIPIO`),
  KEY `IDX_BAIRRO` (`NME_BAIRRO`),
  CONSTRAINT `FK_BAIRRO_MUNICIPIO` FOREIGN KEY (`COD_MUNICIPIO`) REFERENCES `municipio` (`COD_MUNICIPIO`)
) ENGINE=InnoDB AUTO_INCREMENT=35193 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `COD_CATEGORIA` int NOT NULL AUTO_INCREMENT,
  `NME_CATEGORIA` varchar(100) NOT NULL,
  PRIMARY KEY (`COD_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `COD_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `COD_PESSOA` int NOT NULL,
  `TPO_SEXO` enum('M','F','N') DEFAULT NULL,
  PRIMARY KEY (`COD_CLIENTE`,`COD_PESSOA`),
  KEY `FK_CLIENTE_PESSOA_idx` (`COD_PESSOA`),
  CONSTRAINT `FK_CLIENTE_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `COD_ENDERECO` int NOT NULL,
  `DSC_COMPLEMENTO` varchar(255) DEFAULT NULL,
  `NRO_ENDERECO` int DEFAULT NULL,
  `DSC_PONTO_REFERENCIA` varchar(255) DEFAULT NULL,
  `COD_CEP` int DEFAULT NULL,
  `COD_PESSOA` int DEFAULT NULL,
  PRIMARY KEY (`COD_ENDERECO`),
  KEY `FK_ENDERECO_LOGRADOURO_idx` (`COD_CEP`),
  KEY `FK_ENDERECO_PESSOA_idx` (`COD_PESSOA`),
  CONSTRAINT `FK_ENDERECO_LOGRADOURO` FOREIGN KEY (`COD_CEP`) REFERENCES `logradouro` (`COD_CEP`),
  CONSTRAINT `FK_ENDERECO_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `COD_ESTADO` int NOT NULL AUTO_INCREMENT,
  `NME_ESTADO` varchar(100) NOT NULL,
  `SGL_UF` varchar(2) NOT NULL,
  PRIMARY KEY (`COD_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `COD_FORNECEDOR` int NOT NULL AUTO_INCREMENT,
  `COD_PESSOA` int NOT NULL,
  `NME_RAZAO_SOCIAL` varchar(95) DEFAULT NULL,
  PRIMARY KEY (`COD_FORNECEDOR`,`COD_PESSOA`),
  KEY `FK_FORNECEDOR_PESSOA_IDX` (`COD_PESSOA`),
  CONSTRAINT `FK_FORNECEDOR_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_operacao`
--

DROP TABLE IF EXISTS `item_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_operacao` (
  `COD_ITEM_OPERACAO` int NOT NULL AUTO_INCREMENT,
  `QTD_ITEM` float DEFAULT NULL,
  `VLR_ITEM` decimal(10,2) DEFAULT NULL,
  `COD_OPERACAO` int NOT NULL,
  `COD_PRODUTO` int NOT NULL,
  PRIMARY KEY (`COD_ITEM_OPERACAO`),
  KEY `FK_ITEM_COMPRA_IDX` (`COD_OPERACAO`),
  KEY `FK_ITEM_COMPRA_PRODUTO_IDX` (`COD_PRODUTO`),
  CONSTRAINT `FK_ITEM_COMPRA` FOREIGN KEY (`COD_OPERACAO`) REFERENCES `operacao` (`COD_OPERACAO`),
  CONSTRAINT `FK_ITEM_COMPRA_PRODUTO` FOREIGN KEY (`COD_PRODUTO`) REFERENCES `produto` (`COD_PRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `logradouro`
--

DROP TABLE IF EXISTS `logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logradouro` (
  `COD_CEP` int NOT NULL AUTO_INCREMENT,
  `COD_BAIRRO` int NOT NULL,
  `DSC_LOGRADOURO` varchar(255) DEFAULT NULL,
  `DSC_COMPLEMENTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COD_CEP`,`COD_BAIRRO`),
  KEY `FK_BAIRRO_ENDERECO_IDX` (`COD_BAIRRO`),
  CONSTRAINT `FK_BAIRRO_ENDERECO` FOREIGN KEY (`COD_BAIRRO`) REFERENCES `bairro` (`COD_BAIRRO`)
) ENGINE=InnoDB AUTO_INCREMENT=19990971 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `COD_MUNICIPIO` int NOT NULL AUTO_INCREMENT,
  `NME_MUNICIPIO` varchar(100) NOT NULL,
  `COD_ESTADO` int NOT NULL,
  PRIMARY KEY (`COD_MUNICIPIO`),
  KEY `FK_MUNICIPIO_ESTADO_IDX` (`COD_ESTADO`),
  CONSTRAINT `FK_MUNICIPIO_ESTADO` FOREIGN KEY (`COD_ESTADO`) REFERENCES `estado` (`COD_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=3557304 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operacao`
--

DROP TABLE IF EXISTS `operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacao` (
  `COD_OPERACAO` int NOT NULL AUTO_INCREMENT,
  `DTA_OPERACAO` datetime DEFAULT NULL,
  `COD_NOTA_FISCAL` int DEFAULT NULL,
  `VRL_TOTAL` decimal(10,2) DEFAULT NULL,
  `QTD_PARCELA` int DEFAULT NULL,
  `TPO_STATUS` enum('P','O') DEFAULT NULL COMMENT 'P - pedido (compra ou venda); O - orçamento\n',
  `COD_PESSOA` int DEFAULT NULL,
  `FLG_PAGO` tinyint DEFAULT NULL,
  `TPO_OPERACAO` enum('C','V') DEFAULT NULL COMMENT 'C - Compra; V - Venda',
  PRIMARY KEY (`COD_OPERACAO`),
  KEY `FK_OPERACAO_PESSOA_idx` (`COD_PESSOA`),
  CONSTRAINT `FK_OPERACAO_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagamento_operacao`
--

DROP TABLE IF EXISTS `pagamento_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento_operacao` (
  `COD_PAGAMENTO` int NOT NULL AUTO_INCREMENT,
  `VLR_PAGAMENTO` decimal(10,2) DEFAULT NULL,
  `DTA_PAGAMENTO` date DEFAULT NULL,
  `DTA_VENCIMENTO` date DEFAULT NULL,
  `COD_OPERACAO` int NOT NULL,
  `COD_TIPO_PAGAMENTO` int DEFAULT NULL,
  PRIMARY KEY (`COD_PAGAMENTO`),
  KEY `FK_PARCELA_COMPRA_IDX` (`COD_OPERACAO`),
  KEY `FK_TIPO_PAGAMENTO_OPERACAO__idx` (`COD_TIPO_PAGAMENTO`),
  CONSTRAINT `FK_PARCELA_COMPRA` FOREIGN KEY (`COD_OPERACAO`) REFERENCES `operacao` (`COD_OPERACAO`),
  CONSTRAINT `FK_TIPO_PAGAMENTO_OPERACAO_` FOREIGN KEY (`COD_TIPO_PAGAMENTO`) REFERENCES `tipo_pagamento` (`COD_TIPO_PAGAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `COD_PESSOA` int NOT NULL AUTO_INCREMENT,
  `NME_USUARIO` varchar(50) DEFAULT NULL,
  `DSC_LOGIN` varchar(20) DEFAULT NULL,
  `DSC_SENHA` varchar(128) DEFAULT NULL,
  `FLG_ATIVO` tinyint DEFAULT NULL,
  PRIMARY KEY (`COD_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_fisica` (
  `COD_PESSOA_FISICA` int NOT NULL AUTO_INCREMENT,
  `COD_PESSOA` int NOT NULL,
  `SGL_UF_NATURALIDADE` char(2) DEFAULT NULL,
  `NME_PESSOA_FISICA` varchar(100) NOT NULL,
  `DTA_NASCIMENTO` date NOT NULL,
  `TPO_SEXO` enum('M','F','N') DEFAULT NULL COMMENT 'M - MASCULINO; F - FEMININO; N - NEUTRO',
  PRIMARY KEY (`COD_PESSOA_FISICA`,`COD_PESSOA`),
  KEY `FK_PESSOA_FISICA_PESSOA_IDX` (`COD_PESSOA`),
  CONSTRAINT `FK_PESSOA_FISICA_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pessoa_juridica`
--

DROP TABLE IF EXISTS `pessoa_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_juridica` (
  `COD_PESSOA_JURIDICA` int NOT NULL AUTO_INCREMENT,
  `COD_PESSOA` int NOT NULL,
  `NME_RAZAO_SOCIAL` varchar(200) NOT NULL,
  `NME_FANTASIA` varchar(200) NOT NULL,
  PRIMARY KEY (`COD_PESSOA_JURIDICA`,`COD_PESSOA`),
  KEY `FK_PESSOA_JURIDICA_PESSOA_IDX` (`COD_PESSOA`),
  CONSTRAINT `FK_PESSOA_JURIDICA_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `COD_PRODUTO` int NOT NULL AUTO_INCREMENT,
  `NME_PRODUTO` varchar(95) DEFAULT NULL,
  `DSC_PRODUTO` varchar(255) DEFAULT NULL,
  `COD_SUBCATEGORIA` int DEFAULT NULL,
  `COD_UNIDADE_MEDIDA` int DEFAULT NULL,
  PRIMARY KEY (`COD_PRODUTO`),
  KEY `FK_PRODUTO_SUBCATEGORIA_IDX` (`COD_SUBCATEGORIA`),
  KEY `FK_PRODUTO_UNIDADE_MEDIDA_IDX` (`COD_UNIDADE_MEDIDA`),
  CONSTRAINT `FK_PRODUTO_SUBCATEGORIA` FOREIGN KEY (`COD_SUBCATEGORIA`) REFERENCES `subcategoria` (`COD_SUBCATEGORIA`),
  CONSTRAINT `FK_PRODUTO_UNIDADE_MEDIDA` FOREIGN KEY (`COD_UNIDADE_MEDIDA`) REFERENCES `unidade_medida` (`COD_UNIDADE_MEDIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=216546532 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategoria` (
  `COD_SUBCATEGORIA` int NOT NULL AUTO_INCREMENT,
  `NME_SUBCATEGORIA` varchar(95) DEFAULT NULL,
  `COD_CATEGORIA` int DEFAULT NULL,
  PRIMARY KEY (`COD_SUBCATEGORIA`),
  KEY `FK_SUBCATEGORIA_CATEGORA_IDX` (`COD_CATEGORIA`),
  CONSTRAINT `FK_SUBCATEGORIA_CATEGORA` FOREIGN KEY (`COD_CATEGORIA`) REFERENCES `categoria` (`COD_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tipo_pagamento`
--

DROP TABLE IF EXISTS `tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pagamento` (
  `COD_TIPO_PAGAMENTO` int NOT NULL AUTO_INCREMENT,
  `NME_TIPO_PAGAMENTO` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_PAGAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidade_medida`
--

DROP TABLE IF EXISTS `unidade_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_medida` (
  `COD_UNIDADE_MEDIDA` int NOT NULL AUTO_INCREMENT,
  `NME_UNIDADE_MEDIDA` varchar(100) DEFAULT NULL,
  `SGL_UNIDADE_MEDIDA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COD_UNIDADE_MEDIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
 1 AS `NME_CATEGORIA`*/;
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
/*!50001 VIEW `vw_produto` AS select `pr`.`COD_PRODUTO` AS `COD_PRODUTO`,`pr`.`NME_PRODUTO` AS `NME_PRODUTO`,`pr`.`DSC_PRODUTO` AS `DSC_PRODUTO`,`sc`.`COD_SUBCATEGORIA` AS `COD_SUBCATEGORIA`,`sc`.`NME_SUBCATEGORIA` AS `NME_SUBCATEGORIA`,`ct`.`COD_CATEGORIA` AS `COD_CATEGORIA`,`ct`.`NME_CATEGORIA` AS `NME_CATEGORIA` from ((`produto` `pr` join `subcategoria` `sc` on((`pr`.`COD_SUBCATEGORIA` = `sc`.`COD_SUBCATEGORIA`))) join `categoria` `ct` on((`ct`.`COD_CATEGORIA` = `sc`.`COD_CATEGORIA`))) */;
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

-- Dump completed on 2021-10-27  2:18:42
