
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

