-- -----------------------------------------------------
-- SCHEMA DB_COMERCIO
-- -----------------------------------------------------
-- drop schema DB_COMERCIO;
CREATE SCHEMA IF NOT EXISTS `DB_COMERCIO` DEFAULT CHARACTER SET LATIN1 ;

USE `DB_COMERCIO` ;

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`ESTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`ESTADO` (
  `COD_ESTADO` 		INT(11) 		NOT NULL,
  `NME_ESTADO` 		VARCHAR(100) 	NOT NULL,
  `SGL_UF` 			VARCHAR(2) 		NOT NULL,
  PRIMARY KEY PK_ESTADO (`COD_ESTADO`))
;

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`MUNICIPIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`MUNICIPIO` (
  `COD_MUNICIPIO` 		INT(11) 			NOT NULL,
  `NME_CIDADE` 			VARCHAR(100) 		NOT NULL,
  `COD_ESTADO` 			INT(11) 			NOT NULL,
  PRIMARY KEY PK_MUNICIPIO (`COD_MUNICIPIO`),
  INDEX `FK_MUNICIPIO_ESTADO_IDX` (`COD_ESTADO` ASC),
  CONSTRAINT `FK_MUNICIPIO_ESTADO`
    FOREIGN KEY (`COD_ESTADO`)
    REFERENCES `DB_COMERCIO`.`ESTADO` (`COD_ESTADO`)
);

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`BAIRRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`BAIRRO` (
  `COD_BAIRRO` 			INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_BAIRRO` 			VARCHAR(100) 		NOT NULL,
  `COD_MUNICIPIO` 		INT(11) 			NULL DEFAULT NULL,
  PRIMARY KEY PK_BAIRRO(`COD_BAIRRO`),
  INDEX `FK_BAIRRO_MUNICIPIO_IDX` (`COD_MUNICIPIO` ASC) ,
  CONSTRAINT `FK_BAIRRO_MUNICIPIO`
    FOREIGN KEY (`COD_MUNICIPIO`)
    REFERENCES `DB_COMERCIO`.`MUNICIPIO` (`COD_MUNICIPIO`)
);


-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`CATEGORIA` (
  `COD_CATEGORIA` 		INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_CATEGORIA` 		VARCHAR(100) 		NOT NULL,
  PRIMARY KEY PK_CATEGORIA (`COD_CATEGORIA`))
;

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`CLIENTE` (
  `COD_CLIENTE` 		INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_CLIENTE` 		VARCHAR(100) 		NOT NULL,
  `TPO_CLIENTE` 		ENUM('F', 'J') 		NULL DEFAULT NULL,
  `DSC_EMAIL` 			VARCHAR(100) 		NULL DEFAULT NULL,
  `NUM_TELEFONE` 		VARCHAR(20) 		NULL DEFAULT NULL,
  `COD_BAIRRO` 			INT(11) 			NULL DEFAULT NULL,
  `TPO_SEXO` 			ENUM('M', 'F', 'N') NULL DEFAULT NULL,
  PRIMARY KEY PK_CLIENTE(`COD_CLIENTE`),
  INDEX `FK_CLIENTE_BAIRRO_IDX` (`COD_BAIRRO` ASC) ,
  CONSTRAINT `FK_CLIENTE_BAIRRO`
    FOREIGN KEY (`COD_BAIRRO`)
    REFERENCES `DB_COMERCIO`.`BAIRRO` (`COD_BAIRRO`)
);


-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`ENDERECO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`ENDERECO` (
  `COD_CEP` 			INT(11) 			NOT NULL,
  `DSC_ENDERECO` 		VARCHAR(100) 		NULL DEFAULT NULL,
  `COD_BAIRRO` 			INT 				NULL DEFAULT NULL,
  PRIMARY KEY PK_ENDERECO (`COD_CEP`),
  INDEX `FK_BAIRRO_ENDERECO_IDX` (`COD_BAIRRO` ASC) ,
  CONSTRAINT `FK_BAIRRO_ENDERECO`
    FOREIGN KEY (`COD_BAIRRO`)
    REFERENCES `DB_COMERCIO`.`BAIRRO` (`COD_BAIRRO`)
);


-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`FORNECEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`FORNECEDOR` (
  `COD_FORNECEDOR` 		INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_FORNECEDOR` 		VARCHAR(95) 		NULL DEFAULT NULL,
  `NME_RAZAO_SOCIAL` 	VARCHAR(95) 		NULL DEFAULT NULL,
  `COD_CNPJ` 			VARCHAR(95) 		NULL DEFAULT NULL,
  `COD_CEP` 			INT 				NULL DEFAULT NULL,
  `NUM_TELEFONE` 		VARCHAR(95) 		NULL DEFAULT NULL,
  `NUM_CELULAR` 		VARCHAR(95) 		NULL DEFAULT NULL,
  `DSC_EMAIL` 			VARCHAR(95) 		NULL DEFAULT NULL,
  `NRO_ENDERECO` 		VARCHAR(95) 		NULL DEFAULT NULL,
  PRIMARY KEY PK_FORNECEDOR (`COD_FORNECEDOR`),
  INDEX `FK_FORNECEDOR_ENDERECO_IDX` (`COD_CEP` ASC) ,
  CONSTRAINT `FK_FORNECEDOR_ENDERECO`
    FOREIGN KEY (`COD_CEP`)
    REFERENCES `DB_COMERCIO`.`ENDERECO` (`COD_CEP`)
);


-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`TIPO_PAGAMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`TIPO_PAGAMENTO` (
  `COD_TIPO_PAGAMENTO` 	INT(11) 			NOT NULL AUTO_INCREMENT,
  `DSC_TIPO_PAGAMENTO` 	VARCHAR(90) 		NULL DEFAULT NULL,
  PRIMARY KEY PK_TIPO_PAGAMENTO(`COD_TIPO_PAGAMENTO`))
;
-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`COMPRA` (
  `COD_COMPRA` 			INT(11) 			NOT NULL AUTO_INCREMENT,
  `DTA_COMPRA` 			DATETIME 			NULL DEFAULT NULL,
  `COD_NOTA_FISCAL` 	INT(11) 			NULL DEFAULT NULL,
  `VRL_TOTAL` 			DECIMAL(10,2) 		NULL DEFAULT NULL,
  `QTD_PARCELA` 		INT(11) 			NULL DEFAULT NULL,
  `TPO_STATUS_COMPRA` 	CHAR(1) 			NULL DEFAULT NULL,
  `COD_FORNECEDOR` 		INT(11) 			NULL DEFAULT NULL,
  `COD_TIPO_PAGAMENTO` 	INT(11) 			NULL DEFAULT NULL,
  `FLG_PAGO` 			TINYINT 			NULL,
  PRIMARY KEY PK_COMPRA(`COD_COMPRA`),
  INDEX `COD_COMPRA_FORNECEDOR_IDX` (`COD_FORNECEDOR` ASC) ,
  INDEX `FK_COMPRA_TIPO_PAGAMENTO_IDX` (`COD_TIPO_PAGAMENTO` ASC) ,
  CONSTRAINT `FK_COMPRA_FORNECEDOR`
    FOREIGN KEY (`COD_FORNECEDOR`)
    REFERENCES `DB_COMERCIO`.`FORNECEDOR` (`COD_FORNECEDOR`),
  CONSTRAINT `FK_COMPRA_TIPO_PAGAMENTO`
    FOREIGN KEY (`COD_TIPO_PAGAMENTO`)
    REFERENCES `DB_COMERCIO`.`TIPO_PAGAMENTO` (`COD_TIPO_PAGAMENTO`)
);
-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`SUBCATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`SUBCATEGORIA` (
  `COD_SUBCATEGORIA` 	INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_SUBCATEGORIA` 	VARCHAR(95) 		NULL DEFAULT NULL,
  `COD_CATEGORIA` 		INT(11) 			NULL DEFAULT NULL,
  PRIMARY KEY (`COD_SUBCATEGORIA`),
  INDEX `FK_SUBCATEGORIA_CATEGORA_IDX` (`COD_CATEGORIA` ASC) ,
  CONSTRAINT `FK_SUBCATEGORIA_CATEGORA`
    FOREIGN KEY (`COD_CATEGORIA`)
    REFERENCES `DB_COMERCIO`.`CATEGORIA` (`COD_CATEGORIA`)
);

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`UNIDADE_MEDIDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`UNIDADE_MEDIDA` (
  `COD_UNIDADE_MEDIDA` 	INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_UNIDADE_MEDIDA` 	VARCHAR(100) 		NULL DEFAULT NULL,
  PRIMARY KEY PK_UNIDADE_MEDIDA(`COD_UNIDADE_MEDIDA`))
;

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`PRODUTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`PRODUTO` (
  `COD_PRODUTO` 		INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_PRODUTO` 		VARCHAR(95) 		NULL DEFAULT NULL,
  `DSC_PRODUTO` 		VARCHAR(255) 		NULL DEFAULT NULL,
  `COD_SUBCATEGORIA` 	INT(11) 			NULL DEFAULT NULL,
  `COD_UNIDADE_MEDIDA` 	INT 				NULL,
  PRIMARY KEY PK_PRODUTO(`COD_PRODUTO`),
  INDEX `FK_PRODUTO_SUBCATEGORIA_IDX` (`COD_SUBCATEGORIA` ASC) ,
  INDEX `FK_PRODUTO_UNIDADE_MEDIDA_IDX` (`COD_UNIDADE_MEDIDA` ASC) ,
  CONSTRAINT `FK_PRODUTO_SUBCATEGORIA`
    FOREIGN KEY (`COD_SUBCATEGORIA`)
    REFERENCES `DB_COMERCIO`.`SUBCATEGORIA` (`COD_SUBCATEGORIA`),
  CONSTRAINT `FK_PRODUTO_UNIDADE_MEDIDA`
    FOREIGN KEY (`COD_UNIDADE_MEDIDA`)
    REFERENCES `DB_COMERCIO`.`UNIDADE_MEDIDA` (`COD_UNIDADE_MEDIDA`)
);

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`ITEM_COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`ITEM_COMPRA` (
  `COD_ITEM_COMPRA` 	INT(11) 			NOT NULL AUTO_INCREMENT,
  `QTD_ITEM_COMPRA` 	FLOAT 				NULL DEFAULT NULL,
  `VLR_ITEM_COMPRA` 	DECIMAL(10,2) 		NULL DEFAULT NULL,
  `COD_COMPRA` 			INT(11) 			NOT NULL,
  `COD_PRODUTO` 		INT(11) 			NOT NULL,
  PRIMARY KEY PK_ITEM_COMPRA(`COD_ITEM_COMPRA`),
  INDEX `FK_ITEM_COMPRA_IDX` (`COD_COMPRA` ASC) ,
  INDEX `FK_ITEM_COMPRA_PRODUTO_IDX` (`COD_PRODUTO` ASC) ,
  CONSTRAINT `FK_ITEM_COMPRA`
    FOREIGN KEY (`COD_COMPRA`)
    REFERENCES `DB_COMERCIO`.`COMPRA` (`COD_COMPRA`),
  CONSTRAINT `FK_ITEM_COMPRA_PRODUTO`
    FOREIGN KEY (`COD_PRODUTO`)
    REFERENCES `DB_COMERCIO`.`PRODUTO` (`COD_PRODUTO`)
);

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`USUARIO` (
  `COD_USUARIO` 		INT(11) 		NOT NULL AUTO_INCREMENT,
  `NME_USUARIO` 		VARCHAR(100) 	NULL DEFAULT NULL,
  `DSC_LOGIN` 			VARCHAR(30) 	NOT NULL,
  `DSC_SENHA` 			VARCHAR(255) 	NOT NULL,
  `TPO_USUARIO` 		INT(11) 		NULL DEFAULT NULL,
  `FLG_ATIVO` 			TINYINT(1) 		NULL DEFAULT NULL,
  PRIMARY KEY PK_USUARIO(`COD_USUARIO`))
;
-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`VENDA` (
  `COD_VENDA` 			INT(11) 			NOT NULL AUTO_INCREMENT,
  `DTA_VENDA` 			DATETIME 			NULL DEFAULT NULL,
  `COD_NF` 				INT(11) 			NULL DEFAULT NULL,
  `VLR_TOTAL` 			DECIMAL(10,2) 		NULL DEFAULT NULL,
  `QTD_PARCELA` 		INT(11) 			NULL DEFAULT NULL,
  `SIT_VENDA` 			INT(11) 			NULL DEFAULT NULL,
  `COD_CLIENTE` 		INT(11) 			NULL DEFAULT NULL,
  `COD_TIPO_PAGAMENTO` 	INT(11) 			NULL DEFAULT NULL,
  `COD_USUARIO` 		INT(11) 			NULL DEFAULT NULL,
  `FLG_RECEBIDO` 		TINYINT 			NULL,
  PRIMARY KEY PK_VENDA (`COD_VENDA`),
  INDEX `FK_VENDA_USUARIO_IDX` (`COD_USUARIO` ASC) ,
  INDEX `FK_VENDA_CLIENTE_IDX` (`COD_CLIENTE` ASC) ,
  CONSTRAINT `FK_VENDA_USUARIO`
    FOREIGN KEY (`COD_USUARIO`)
    REFERENCES `DB_COMERCIO`.`USUARIO` (`COD_USUARIO`),
  CONSTRAINT `FK_VENDA_CLIENTE`
    FOREIGN KEY (`COD_CLIENTE`)
    REFERENCES `DB_COMERCIO`.`CLIENTE` (`COD_CLIENTE`)
);


-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`ITEM_VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`ITEM_VENDA` (
  `COD_ITEM_VENDA` 		INT(11) 			NOT NULL AUTO_INCREMENT,
  `QTD_ITEM_VENDA` 		FLOAT 				NULL DEFAULT NULL,
  `VLR_ITEM_VENDA` 		DECIMAL(10,2) 		NULL DEFAULT NULL,
  `COD_VENDA` 			INT(11) 			NOT NULL,
  `COD_PRODUTO` 		INT(11) 			NOT NULL,
  PRIMARY KEY PK_ITEM_VENDA(`COD_ITEM_VENDA`),
  INDEX `FK_ITEM_VENDA_IDX` (`COD_VENDA` ASC) ,
  INDEX `FK_ITEM_VENDA_PRODUTO_IDX` (`COD_PRODUTO` ASC) ,
  CONSTRAINT `FK_ITEM_VENDA`
    FOREIGN KEY (`COD_VENDA`)
    REFERENCES `DB_COMERCIO`.`VENDA` (`COD_VENDA`),
  CONSTRAINT `FK_ITEM_VENDA_PRODUTO`
    FOREIGN KEY (`COD_PRODUTO`)
    REFERENCES `DB_COMERCIO`.`PRODUTO` (`COD_PRODUTO`)
);

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`PARCELA_COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`PARCELA_COMPRA` (
  `COD_PARCELA_COMPRA` INT(11) 			NOT NULL AUTO_INCREMENT,
  `VLR_PARCELA` 		DECIMAL(10,2) 	NULL DEFAULT NULL,
  `DTA_PAGAMENTO` 		DATE 			NULL DEFAULT NULL,
  `DTA_VENCIMENTO` 		DATE 			NULL DEFAULT NULL,
  `COD_COMPRA` 			INT(11) 		NOT NULL,
  PRIMARY KEY PK_PARCELA_COMPRA(`COD_PARCELA_COMPRA`),
  INDEX `FK_PARCELA_COMPRA_IDX` (`COD_COMPRA` ASC) ,
  CONSTRAINT `FK_PARCELA_COMPRA`
    FOREIGN KEY (`COD_COMPRA`)
    REFERENCES `DB_COMERCIO`.`COMPRA` (`COD_COMPRA`)
);

-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`PARCELA_VENDA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`PARCELA_VENDA` (
  `COD_PARCELA_VENDA` 	INT(11) 		NOT NULL AUTO_INCREMENT,
  `VLR_PARCELA` 		DECIMAL(10,2) 	NULL DEFAULT NULL,
  `DTA_PAGAMENTO` 		DATETIME 		NULL DEFAULT NULL,
  `DTA_VENCIMENTO` 		DATETIME 		NULL DEFAULT NULL,
  `COD_VENDA` 			INT(11) 		NOT NULL,
  PRIMARY KEY PK_PARCELA_VENDA (`COD_PARCELA_VENDA`),
  INDEX `FK_PARCELA_VENDA_IDX` (`COD_VENDA` ASC) ,
  CONSTRAINT `FK_PARCELA_VENDA`
    FOREIGN KEY (`COD_VENDA`)
    REFERENCES `DB_COMERCIO`.`VENDA` (`COD_VENDA`)
)
;

