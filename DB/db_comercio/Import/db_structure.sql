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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
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
  `TPO_SEXO` enum('M','F','N') DEFAULT NULL COMMENT 'M - Masculino; F - Feminino; N - Neutro',
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
  `NME_PESSOA` varchar(100) DEFAULT NULL,
  `COD_CPF_CNPJ` varchar(20) DEFAULT NULL,
  `NUM_TELEFONE` varchar(45) DEFAULT NULL,
  `DSC_EMAIL` varchar(100) DEFAULT NULL,
  `TPO_PESSOA` enum('F','J') DEFAULT NULL COMMENT 'F - Física; J - Jurídica',
  PRIMARY KEY (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
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
  `DSC_TIPO_PAGAMENTO` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_PAGAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `COD_USUARIO` int NOT NULL AUTO_INCREMENT,
  `DSC_LOGIN` varchar(30) NOT NULL,
  `DSC_SENHA` varchar(255) DEFAULT NULL,
  `TPO_USUARIO` enum('A','F') DEFAULT NULL COMMENT 'A - Admin; F - funcionário',
  `FLG_ATIVO` tinyint(1) DEFAULT NULL,
  `COD_PESSOA` int DEFAULT NULL,
  PRIMARY KEY (`COD_USUARIO`),
  KEY `FK_USUARIO_PESSOA_idx` (`COD_PESSOA`),
  CONSTRAINT `FK_USUARIO_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `vw_cliente`
--

DROP TABLE IF EXISTS `vw_cliente`;
/*!50001 DROP VIEW IF EXISTS `vw_cliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cliente` AS SELECT 
 1 AS `COD_PESSOA`,
 1 AS `NME_PESSOA`,
 1 AS `COD_CPF_CNPJ`,
 1 AS `NUM_TELEFONE`,
 1 AS `DSC_EMAIL`,
 1 AS `COD_CLIENTE`,
 1 AS `TPO_SEXO`*/;
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
-- Dumping routines for database 'db_comercio'
--
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_BAIRRO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_BAIRRO`(COD_BAIRRO INT, NME_BAIRRO VARCHAR(100), NME_MUNICIPIO VARCHAR(100))
BEGIN
	DECLARE ID_MUNICIPIO INT;
	SELECT MIN(COD_MUNICIPIO) INTO ID_MUNICIPIO 
		FROM MUNICIPIO MP
        WHERE MP.NME_MUNICIPIO = NME_MUNICIPIO;
	 IF ISNULL(ID_MUNICIPIO) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='BAIRRO ASSOCIADO A UM MUNICÍPIO NÃO CADASTRADO NA BASE';
	END IF; 
	UPDATE BAIRRO BR
		SET BR.NME_BAIRRO   	= NME_BAIRRO,
			BR.COD_MUNICIPIO 	= ID_MUNICIPIO
		WHERE BR.COD_BAIRRO = COD_BAIRRO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_CATEGORIA`(COD_CATEGORIA INT , NME_CATEGORIA VARCHAR(100))
BEGIN
	UPDATE CATEGORIA CT SET CT.NME_CATEGORIA   = 	NME_CATEGORIA
		WHERE CT.COD_CATEGORIA = COD_CATEGORIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_CLIENTE`(COD_PESSOA INT, NME_PESSOA VARCHAR(100), TPO_PESSOA CHAR(1) , COD_CPF_CNPJ VARCHAR(20),
			NUM_TELEFONE VARCHAR(20), DSC_EMAIL VARCHAR(100), TPO_SEXO CHAR(1))
BEGIN
	DECLARE ID_PESSOA INT;
    SELECT MIN(COD_PESSOA) INTO ID_PESSOA
		FROM PESSOA PS 
        WHERE PS.NME_PESSOA = NME_PESSOA AND PS.num_telefone = num_telefone;
    IF ISNULL(ID_PESSOA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='PESSOA NÃO CADASTRADA';
	END IF;		
    UPDATE PESSOA PS 
		SET PS.nme_pessoa 		= NME_PESSOA, 
			PS.COD_CPF_CNPJ 	= COD_CPF_CNPJ, 
            PS.NUM_TELEFONE 	= NUM_TELEFONE, 
            PS.DSC_EMAIL		= DSC_EMAIL,
            PS.TPO_PESSOA 		= TPO_PESSOA
	WHERE PS.COD_PESSOA 		= ID_PESSOA;
	UPDATE CLIENTE CL
		SET CL.TPO_SEXO 		=	TPO_SEXO
	WHERE CL.COD_PESSOA 		= ID_PESSOA;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_ESTADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_ESTADO`(COD_ESTADO INT, NME_MUNICIPIO VARCHAR(100), SGL_UF VARCHAR(2))
BEGIN
	UPDATE ESTADO ES
		SET ES.NME_ESTADO   	= NME_ESTADO,
			ES.SGL_UF			= SGL_UF
		WHERE ES.COD_ESTADO 	= COD_ESTADO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_MUNICIPIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_MUNICIPIO`(COD_MUNICIPIO INT, NME_MUNICIPIO VARCHAR(100), SGL_UF VARCHAR(2))
BEGIN
	DECLARE ID_ESTADO INT DEFAULT  NULL;
	SELECT COD_ESTADO INTO ID_ESTADO 
		FROM ESTADO ES
        WHERE ES.SGL_UF = SGL_UF LIMIT 1;
	UPDATE MUNICIPIO MN
		SET MN.NME_MUNICIPIO   	= NME_MUNICIPIO,
			MN.COD_ESTADO 		= ID_ESTADO
		WHERE MN.COD_MUNICIPIO 	= COD_MUNICIPIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_PRODUTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_PRODUTO`(COD_PRODUTO INT , NME_PRODUTO VARCHAR(95), DSC_PRODUTO VARCHAR(100), NME_SUBCATEGORIA VARCHAR(95), NME_UNIDADE_MEDIDA VARCHAR(95))
BEGIN
	DECLARE ID_SUBCATEGORIA SMALLINT;
    DECLARE ID_UNIDADE_MEDIDA SMALLINT;
    SELECT  COD_SUBCATEGORIA INTO ID_SUBCATEGORIA 
		FROM SUBCATEGORIA SCT
        WHERE SCT.NME_SUBCATEGORIA = NME_SUBCATEGORIA LIMIT 1;
	IF ISNULL(ID_SUBCATEGORIA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='PRODUTO ASSOCIADO A UMA SUBCATEGORIA NÃO CADASTRADA NA BASE';
	END IF;  
	SELECT COD_UNIDADE_MEDIDA INTO ID_UNIDADE_MEDIDA
		FROM UNIDADE_MEDIDA UMD
        WHERE UMD.NME_UNIDADE_MEDIDA = NME_UNIDADE_MEDIDA LIMIT 1;
	IF ISNULL(ID_UNIDADE_MEDIDA) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='UNIDADE DE MEDIDA NÃO CADASTRADA NA BASE';
	END IF;
	UPDATE PRODUTO PR SET PR.NME_PRODUTO = 	NME_PRODUTO, PR.DSC_PRODUTO = DSC_PRODUTO, 
			PR.COD_SUBCATEGORIA = ID_SUBCATEGORIA, PR.COD_UNIDADE_MEDIDA = ID_UNIDADE_MEDIDA
		WHERE PR.COD_PRODUTO= COD_PRODUTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_SUBCATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_SUBCATEGORIA`(COD_SUBCATEGORIA INT, NME_SUBCATEGORIA VARCHAR(100), NME_CATEGORIA VARCHAR(100))
BEGIN
	DECLARE ID_CATEGORIA INT;
    SELECT COD_CATEGORIA INTO ID_CATEGORIA 
		FROM CATEGORIA CT 
        WHERE CT.NME_CATEGORIA = NME_CATEGORIA;
	UPDATE SUBCATEGORIA ST 
		SET ST.NME_SUBCATEGORIA   = NME_SUBCATEGORIA,
			ST.COD_CATEGORIA 	  = ID_CATEGORIA
		WHERE ST.COD_SUBCATEGORIA = COD_SUBCATEGORIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_TIPO_PAGAMENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_TIPO_PAGAMENTO`(COD_TIPO_PAGAMENTO INT , DSC_TIPO_PAGAMENTO VARCHAR(90))
BEGIN
	UPDATE TIPO_PAGAMENTO TP SET TP.DSC_TIPO_PAGAMENTO   = DSC_TIPO_PAGAMENTO
		WHERE TP.COD_TIPO_PAGAMENTO = COD_TIPO_PAGAMENTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_UNIDADE_MEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_UNIDADE_MEDIDA`(COD_UNIDADE_MEDIDA INT , NME_UNIDADE_MEDIDA VARCHAR(100), SGL_UNIDADE_MEDIDA VARCHAR(50))
BEGIN
	UPDATE UNIDADE_MEDIDA UM SET UM.NME_UNIDADE_MEDIDA   = 	NME_UNIDADE_MEDIDA, UM.SGL_UNIDADE_MEDIDA = SGL_UNIDADE_MEDIDA
		WHERE UM.COD_UNIDADE_MEDIDA = COD_UNIDADE_MEDIDA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ALTERAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ALTERAR_USUARIO`(COD_USUARIO INT, DSC_LOGIN VARCHAR(30), DSC_SENHA VARCHAR(255), TPO_USUARIO enum('A','F'), FLG_ATIVO TINYINT, COD_PESSOA INT)
BEGIN
	DECLARE ID_PESSOA INT;
	SELECT MIN(COD_PESSOA) INTO ID_PESSOA
		FROM PESSOA PS 
        WHERE PS.COD_PESSOA = COD_PESSOA;
    IF ISNULL(ID_PESSOA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='USUÁRIO ASSOCIADO A UMA PESSOA NÃO CADASTRADA';
	END IF;	
	UPDATE  USUARIO US
		SET US.DSC_LOGIN		   	= DSC_LOGIN,
			US.DSC_SENHA			= DSC_SENHA,
            US.TPO_USUARIO			= TPO_USUARIO,
			US.FLG_ATIVO			= FLG_ATIVO,
            US.COD_PESSOA			= COD_PESSOA
	WHERE 	US.COD_USUARIO			= COD_USUARIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_BAIRRO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_BAIRRO`(NME_BAIRRO VARCHAR(100), NME_MUNICIPIO VARCHAR(100))
BEGIN
	DECLARE ID_MUNICIPIO INT;
	SELECT MIN(COD_MUNICIPIO) INTO ID_MUNICIPIO 
		FROM MUNICIPIO MP
        WHERE MP.NME_MUNICIPIO = NME_MUNICIPIO;
        
     IF EXISTS (SELECT NME_BAIRRO FROM BAIRRO BR WHERE BR.NME_BAIRRO = NME_BAIRRO AND BR.COD_MUNICIPIO = ID_MUNICIPIO) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='BAIRRO JÁ CADASTRADO';
	END IF;        
    IF ISNULL(ID_MUNICIPIO) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='BAIRRO ASSOCIADO A UM MUNICÍPIO NÃO CADASTRADO NA BASE';
	END IF;        
	INSERT INTO BAIRRO(NME_BAIRRO, COD_MUNICIPIO) VALUES (NME_BAIRRO, ID_MUNICIPIO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_CATEGORIA`(NME_CATEGORIA VARCHAR(100))
BEGIN
	IF EXISTS (SELECT NME_CATEGORIA FROM CATEGORIA TP WHERE TP.NME_CATEGORIA = NME_CATEGORIA) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='TIPO DE PAGAMENTO JÁ CADASTRADO';
	END IF;
	INSERT INTO CATEGORIA (NME_CATEGORIA) VALUES (NME_CATEGORIA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_CLIENTE`(NME_PESSOA VARCHAR(100), TPO_PESSOA CHAR(1) , COD_CPF_CNPJ VARCHAR(20),
			NUM_TELEFONE VARCHAR(20), DSC_EMAIL VARCHAR(100), TPO_SEXO CHAR(1))
BEGIN
	DECLARE ID_PESSOA INT;
      
    IF EXISTS (SELECT NME_PESSOA FROM PESSOA PS WHERE PS.NME_PESSOA = NME_PESSOA AND PS.DSC_EMAIL = DSC_EMAIL) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='USUÁRIO JÁ CADASTRADO';
	END IF;
    INSERT INTO PESSOA (NME_PESSOA, COD_CPF_CNPJ, NUM_TELEFONE, DSC_EMAIL, TPO_PESSOA)
			VALUES (NME_PESSOA, COD_CPF_CNPJ, NUM_TELEFONE, DSC_EMAIL, TPO_PESSOA);
	SELECT LAST_INSERT_ID() INTO ID_PESSOA;
    INSERT INTO CLIENTE (COD_PESSOA, TPO_SEXO)
			VALUES (ID_PESSOA, TPO_SEXO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_ESTADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_ESTADO`(NME_ESTADO VARCHAR(100), SGL_UF VARCHAR(2))
BEGIN
   IF EXISTS (SELECT NME_ESTADO FROM ESTADO ES WHERE ES.NME_ESTADO = NME_ESTADO) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='ESTADO JÁ CADASTRADO NA BASE';
	END IF;
	INSERT INTO ESTADO(NME_ESTADO, SGL_UF ) VALUES (NME_ESTADO, SGL_UF );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_MUNICIPIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_MUNICIPIO`(NME_MUNICIPIO VARCHAR(100), SGL_UF VARCHAR(2))
BEGIN
	DECLARE ID_ESTADO INT;
    IF EXISTS (SELECT NME_MUNICIPIO FROM MUNICIPIO MN WHERE MN.NME_MUNICIPIO = NME_MUNICIPIO) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='MUNICIPIO JÁ CADASTRADO NA BASE';
	END IF;
	SELECT MIN(COD_ESTADO) INTO ID_ESTADO 
		FROM ESTADO ES
        WHERE ES.SGL_UF = SGL_UF;
	IF ISNULL(ID_ESTADO) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='MUNICÍPIO ASSOCIADO A UM ESTADO NÃO CADASTRADO';
	END IF;
	INSERT INTO MUNICIPIO(NME_MUNICIPIO, COD_ESTADO) VALUES (NME_MUNICIPIO, ID_ESTADO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_PRODUTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_PRODUTO`(NME_PRODUTO VARCHAR(95), DSC_PRODUTO VARCHAR(100),NME_SUBCATEGORIA VARCHAR(95), NME_UNIDADE_MEDIDA VARCHAR(100))
BEGIN
	DECLARE ID_SUBCATEGORIA SMALLINT;
    DECLARE ID_UNIDADE_MEDIDA SMALLINT;
    IF EXISTS (SELECT NME_PRODUTO FROM PRODUTO PR WHERE PR.NME_PRODUTO = NME_PRODUTO) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='PRODUTO JÁ CADASTRADO';
	END IF;
    SELECT  COD_SUBCATEGORIA INTO ID_SUBCATEGORIA 
		FROM SUBCATEGORIA SCT
        WHERE SCT.NME_SUBCATEGORIA = NME_SUBCATEGORIA LIMIT 1;
	IF ISNULL(ID_SUBCATEGORIA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='PRODUTO ASSOCIADO A UMA SUBCATEGORIA NÃO CADASTRADA NA BASE';
	END IF;         
	SELECT COD_UNIDADE_MEDIDA INTO ID_UNIDADE_MEDIDA
		FROM UNIDADE_MEDIDA UMD
        WHERE UMD.NME_UNIDADE_MEDIDA = NME_UNIDADE_MEDIDA LIMIT 1;
	IF ISNULL(ID_UNIDADE_MEDIDA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='PRODUTO ASSOCIADO A UMA UNIDADE DE MEDIDA NÃO CADASTRADA NA BASE';
	END IF;         
	INSERT INTO PRODUTO (NME_PRODUTO, DSC_PRODUTO, COD_SUBCATEGORIA, COD_UNIDADE_MEDIDA) 
		VALUES (NME_PRODUTO, DSC_PRODUTO, ID_SUBCATEGORIA, ID_UNIDADE_MEDIDA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_SUBCATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_SUBCATEGORIA`(NME_SUBCATEGORIA VARCHAR(100), NME_CATEGORIA VARCHAR(100))
BEGIN
	DECLARE ID_CATEGORIA INT;
    IF EXISTS (SELECT NME_SUBCATEGORIA FROM SUBCATEGORIA SB WHERE SB.NME_SUBCATEGORIA = NME_SUBCATEGORIA) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='SUBCATEGORIA JÁ CADASTRADA';
	END IF;
	SELECT COD_CATEGORIA INTO ID_CATEGORIA 
		FROM CATEGORIA CT 
        WHERE CT.NME_CATEGORIA = NME_CATEGORIA;
	IF ISNULL(ID_CATEGORIA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='SUBCATEGORIA ASSOCIADA A UMA CATEGORIA NÃO CADASTRADA NA BASE';
	END IF;  
	INSERT INTO SUBCATEGORIA (NME_SUBCATEGORIA, COD_CATEGORIA) VALUES (NME_SUBCATEGORIA, ID_CATEGORIA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_TIPO_PAGAMENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_TIPO_PAGAMENTO`(DSC_TIPO_PAGAMENTO VARCHAR(90))
BEGIN
	IF EXISTS (SELECT DSC_TIPO_PAGAMENTO FROM TIPO_PAGAMENTO TP WHERE TP.DSC_TIPO_PAGAMENTO = DSC_TIPO_PAGAMENTO) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='TIPO DE PAGAMENTO JÁ CADASTRADO';
	end if;
	INSERT INTO TIPO_PAGAMENTO (DSC_TIPO_PAGAMENTO) VALUES (DSC_TIPO_PAGAMENTO);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_UNIDADE_MEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_UNIDADE_MEDIDA`(NME_UNIDADE_MEDIDA VARCHAR(100), SGL_UNIDADE_MEDIDA VARCHAR(50))
BEGIN
	IF EXISTS (SELECT NME_UNIDADE_MEDIDA FROM UNIDADE_MEDIDA UM WHERE UM.NME_UNIDADE_MEDIDA = NME_UNIDADE_MEDIDA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='UNIDADE DE MEDIDA JÁ CADASTRADA';
	END IF;
	INSERT INTO UNIDADE_MEDIDA (NME_UNIDADE_MEDIDA, SGL_UNIDADE_MEDIDA) VALUES (NME_UNIDADE_MEDIDA, SGL_UNIDADE_MEDIDA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CADASTRAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CADASTRAR_USUARIO`(DSC_LOGIN VARCHAR(30), DSC_SENHA VARCHAR(255), TPO_USUARIO CHAR(1), FLG_ATIVO TINYINT, COD_PESSOA INT)
BEGIN
	DECLARE ID_PESSOA INT;
    SELECT MIN(COD_PESSOA) INTO ID_PESSOA
		FROM PESSOA PS 
        WHERE PS.COD_PESSOA = COD_PESSOA;
    IF ISNULL(ID_PESSOA) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='USUÁRIO ASSOCIADO A UMA PESSOA NÃO CADASTRADA';
	END IF;	
	IF EXISTS (SELECT DSC_LOGIN FROM USUARIO US WHERE US.DSC_LOGIN = DSC_LOGIN) THEN
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='USUÁRIO JÁ CADASTRADO';
	END IF;
	INSERT INTO USUARIO(DSC_LOGIN, DSC_SENHA, TPO_USUARIO, FLG_ATIVO, 	COD_PESSOA ) 
				VALUES (DSC_LOGIN, DSC_SENHA, TPO_USUARIO, FLG_ATIVO, 	COD_PESSOA);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_BAIRRO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_BAIRRO`(COD_BAIRRO INT)
BEGIN
	DELETE FROM BAIRRO BR WHERE BR.COD_BAIRRO = COD_BAIRRO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_CATEGORIA`(COD_CATEGORIA INT)
BEGIN
	DELETE FROM CATEGORIA CT WHERE CT.COD_CATEGORIA = COD_CATEGORIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_CLIENTE`(COD_PESSOA INT)
BEGIN
	DECLARE ID_PESSOA INT;
    SELECT MIN(COD_PESSOA) INTO ID_PESSOA 
		FROM PESSOA PS
        WHERE PS.COD_PESSOA = COD_PESSOA ;
    DELETE FROM  USUARIO US WHERE US.COD_PESSOA = ID_PESSOA;
    DELETE FROM CLIENTE CL WHERE CL.COD_PESSOA = ID_PESSOA;
    DELETE FROM PESSOA PS WHERE PS.COD_PESSOA = ID_PESSOA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_ESTADO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_ESTADO`(COD_MUNICIPIO INT)
BEGIN
	DELETE FROM ESTADO ES WHERE ES.COD_ESTADO = COD_ESTADO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_MUNICIPIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_MUNICIPIO`(COD_MUNICIPIO INT)
BEGIN
	DELETE FROM MUNICIPIO BR WHERE BR.COD_MUNICIPIO = COD_MUNICIPIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_PRODUTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_PRODUTO`(COD_PRODUTO INT)
BEGIN
	DELETE FROM PRODUTO PR WHERE PR.COD_PRODUTO = COD_PRODUTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_SUBCATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_SUBCATEGORIA`(COD_SUBCATEGORIA INT)
BEGIN
	DELETE FROM SUBCATEGORIA SCT WHERE SCT.COD_SUBCATEGORIA = COD_SUBCATEGORIA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_TIPO_PAGAMENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_TIPO_PAGAMENTO`(COD_TIPO_PAGAMENTO INT)
BEGIN
	DELETE FROM TIPO_PAGAMENTO TP WHERE TP.COD_TIPO_PAGAMENTO = COD_TIPO_PAGAMENTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_UNIDADE_MEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_UNIDADE_MEDIDA`(COD_UNIDADE_MEDIDA INT)
BEGIN
	DELETE FROM UNIDADE_MEDIDA UM WHERE UM.COD_UNIDADE_MEDIDA	= COD_UNIDADE_MEDIDA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EXCLUIR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EXCLUIR_USUARIO`(COD_USUARIO INT)
BEGIN
	DELETE FROM USUARIO US WHERE US.COD_USUARIO = COD_USUARIO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_cliente`
--

/*!50001 DROP VIEW IF EXISTS `vw_cliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cliente` AS select `ps`.`COD_PESSOA` AS `COD_PESSOA`,`ps`.`NME_PESSOA` AS `NME_PESSOA`,`ps`.`COD_CPF_CNPJ` AS `COD_CPF_CNPJ`,`ps`.`NUM_TELEFONE` AS `NUM_TELEFONE`,`ps`.`DSC_EMAIL` AS `DSC_EMAIL`,`cl`.`COD_CLIENTE` AS `COD_CLIENTE`,`cl`.`TPO_SEXO` AS `TPO_SEXO` from (`cliente` `cl` join `pessoa` `ps` on((`cl`.`COD_PESSOA` = `ps`.`COD_PESSOA`))) */;
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

-- Dump completed on 2021-10-11  0:34:21
