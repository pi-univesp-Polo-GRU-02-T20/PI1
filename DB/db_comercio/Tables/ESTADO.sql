-- -----------------------------------------------------
-- TABLE `DB_COMERCIO`.`ESTADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_COMERCIO`.`ESTADO` (
  `COD_ESTADO` 		INT(11) 		NOT NULL,
  `NME_ESTADO` 		VARCHAR(100) 	NOT NULL,
  `SGL_UF` 			VARCHAR(2) 		NOT NULL,
  PRIMARY KEY PK_ESTADO (`COD_ESTADO`))
;

