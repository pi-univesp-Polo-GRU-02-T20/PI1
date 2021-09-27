
-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`CATEGORIA` (
  `COD_CATEGORIA` 		INT(11) 			NOT NULL AUTO_INCREMENT,
  `NME_CATEGORIA` 		VARCHAR(100) 		NOT NULL,
  PRIMARY KEY PK_CATEGORIA (`COD_CATEGORIA`))
;