
-- Boas práticas no desenvolvimento de rotinas de banco de dados
-- 1 - evitar código hard coded (Fixo dentro do código)
-- 2 - Evitar transformações nos joins  (NOSARG);
-- 3 - Verificar se colunas de joins estão indexadas

-- Modelo de Procedure 
-- Cadastrar Cargo
DROP PROCEDURE IF EXISTS cadastrarCargo;
DELIMITER //
CREATE PROCEDURE cadastrarCargo(cargo VARCHAR(255), cod_usuario INT UNSIGNED)
BEGIN
	INSERT INTO tb_Cargo (nome_cargo) VALUES (cargo);
		CALL registrarLog(cod_usuario, 'Cadastrar Cargo', cargo);
END //
DELIMITER ;

-- Chamada de procedure 
-- 35. CALL registrarAcessoCurso(cod_curso)

#######################################################################################################################
-- EXEMPLO DE TRATAMENTO DE EXCEÇÃO
/*
CREATE TABLE ACTOR2 AS SELECT * FROM  SAKILA.ACTOR;

INSERT INTO ACTOR2 (FIRST_NAME, LAST_NAME, LAST_UPDATE)  VALUES ('PENELOPE', 'GUINESS', '2006-02-15 03:34:33');

DROP TRIGGER TR_CHK_ACTOR ;
DELIMITER //

CREATE TRIGGER TR_CHK_ACTOR BEFORE INSERT 
ON ACTOR2 
FOR EACH ROW 
BEGIN 
DECLARE FIRST_NAME VARCHAR(50);
    DECLARE ID_ACTOR INT  DEFAULT 0;
	SELECT ACTOR_ID INTO ID_ACTOR FROM ACTOR2 WHERE FIRST_NAME = NEW.FIRST_NAME AND LAST_NAME = NEW.LAST_NAME;
    IF ID_ACTOR = 0  THEN 
			SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT='ACTOR ALREADY EXISTS';
    END IF;
END //


*/

