-- CALL SP_CADASTRAR_TIPO_PAGAMENTO('BTC');
-- CREATE PROCEDURE SP_CADASTRAR_TIPO_PAGAMENTO(DSC_TIPO_PAGAMENTO VARCHAR(90))

-- CALL SP_ALTERAR_TIPO_PAGAMENTO(5, 'BTC');
-- CREATE PROCEDURE SP_ALTERAR_TIPO_PAGAMENTO(COD_TIPO_PAGAMENTO INT , DSC_TIPO_PAGAMENTO VARCHAR(90))

-- CALL SP_EXCLUIR_TIPO_PAGAMENTO(5);
-- CREATE PROCEDURE SP_EXCLUIR_TIPO_PAGAMENTO(COD_TIPO_PAGAMENTO INT)

-- CALL SP_CADASTRAR_CATEGORIA('CALÇADOS');
-- CREATE PROCEDURE SP_CADASTRAR_CATEGORIA (NME_CATEGORIA VARCHAR(100))

-- CALL SP_ALTERAR_CATEGORIA(9, 'CALÇADO');
-- CREATE PROCEDURE SP_ALTERAR_CATEGORIA(COD_CATEGORIA INT , NME_CATEGORIA VARCHAR(100))

-- CALL SP_EXCLUIR_CATEGORIA(9);
-- CREATE PROCEDURE SP_EXCLUIR_CATEGORIA(COD_CATEGORIA INT)

-- SUBCATEGORIA 
-- CALL SP_CADASTRAR_SUBCATEGORIA('TÊNIS', 'CALÇADOS');
-- CREATE PROCEDURE SP_CADASTRAR_SUBCATEGORIA (NME_SUBCATEGORIA VARCHAR(100), NME_CATEGORIA VARCHAR(100))

-- CALL SP_ALTERAR_SUBCATEGORIA(23, 'TENIS', 'CALÇADOS');
-- CREATE PROCEDURE SP_ALTERAR_SUBCATEGORIA(COD_SUBCATEGORIA INT, NME_SUBCATEGORIA VARCHAR(100), NME_CATEGORIA VARCHAR(100))

-- CALL SP_EXCLUIR_SUBCATEGORIA(22);
-- CREATE PROCEDURE SP_EXCLUIR_SUBCATEGORIA(COD_SUBCATEGORIA INT)

-- CALL SP_CADASTRAR_UNIDADE_MEDIDA('GRAMA DE ONÇA','OZ');
-- CREATE PROCEDURE SP_CADASTRAR_UNIDADE_MEDIDA (NME_UNIDADE_MEDIDA VARCHAR(100), SGL_UNIDADE_MEDIDA VARCHAR(50))

-- CALL SP_ALTERAR_UNIDADE_MEDIDA(6, 'LITRO', 'L');
-- CREATE PROCEDURE SP_ALTERAR_UNIDADE_MEDIDA(COD_UNIDADE_MEDIDA INT , NME_UNIDADE_MEDIDA VARCHAR(100), SGL_UNIDADE_MEDIDA VARCHAR(50))

-- CALL SP_EXCLUIR_UNIDADE_MEDIDA(7);
-- CREATE PROCEDURE SP_EXCLUIR_UNIDADE_MEDIDA(COD_UNIDADE_MEDIDA INT)

-- CALL SP_CADASTRAR_PRODUTO('TENIS ADIDAS', 'TENIS ADIDAS DJNA239DK', 'TENIS', 'UNIDADE');
-- CREATE PROCEDURE SP_CADASTRAR_PRODUTO (NME_PRODUTO VARCHAR(95), DSC_PRODUTO VARCHAR(100),NME_SUBCATEGORIA VARCHAR(95), NME_UNIDADE_MEDIDA VARCHAR(100))

-- CALL SP_ALTERAR_PRODUTO(216546531, 'TENIS ADIDAS', 'TENIS ADIDAS DJNA239DKS', 'TENISO', 'UNIDADE');
-- CREATE PROCEDURE SP_ALTERAR_PRODUTO(COD_PRODUTO INT , NME_PRODUTO VARCHAR(95), DSC_PRODUTO VARCHAR(100),
			-- NME_SUBCATEGORIA VARCHAR(95), NME_UNIDADE_MEDIDA VARCHAR(95))

-- CALL SP_EXCLUIR_PRODUTO(216546531);
-- CREATE PROCEDURE SP_EXCLUIR_PRODUTO(COD_PRODUTO INT)

-- CALL SP_EXCLUIR_PRODUTO('Sé', 'Guarulhos');
-- CREATE PROCEDURE SP_CADASTRAR_BAIRRO (NME_BAIRRO VARCHAR(100), NME_MUNICIPIO VARCHAR(100))

-- CALL SP_ALTERAR_BAIRRO(35182, 'PIMENTINHAS', 'LINS');
-- CREATE PROCEDURE SP_ALTERAR_BAIRRO(COD_BAIRRO INT, NME_BAIRRO VARCHAR(100), NME_MUNICIPIO VARCHAR(100))

-- CALL SP_EXCLUIR_BAIRRO(35182);
-- CREATE PROCEDURE SP_EXCLUIR_BAIRRO(COD_BAIRRO INT)

-- CALL SP_CADASTRAR_MUNICIPIO('ARIRANHA', 'ES');
-- CREATE PROCEDURE SP_CADASTRAR_MUNICIPIO (NME_MUNICIPIO VARCHAR(100), SGL_UF VARCHAR(2))

-- CALL SP_ALTERAR_MUNICIPIO (3557304, 'ARIRANHA', 'AM');
-- CREATE PROCEDURE SP_ALTERAR_MUNICIPIO(COD_MUNICIPIO INT, NME_MUNICIPIO VARCHAR(100), SGL_UF VARCHAR(2))

-- CALL SP_EXCLUIR_MUNICIPIO(3557304);
-- CREATE PROCEDURE SP_EXCLUIR_MUNICIPIO(COD_MUNICIPIO INT)

-- CALL SP_CADASTRAR_ESTADO('JUJUBA', 'JJ');
-- CREATE PROCEDURE SP_CADASTRAR_ESTADO (NME_ESTADO VARCHAR(100), SGL_UF VARCHAR(2))

-- CALL SP_ALTERAR_ESTADO (54, 'JUJUBA', 'JA');
-- CREATE PROCEDURE SP_ALTERAR_ESTADO(COD_ESTADO INT, NME_MUNICIPIO VARCHAR(100), SGL_UF VARCHAR(2))

-- CALL SP_EXCLUIR_ESTADO(54);
-- CREATE PROCEDURE SP_EXCLUIR_ESTADO(COD_MUNICIPIO INT)

-- CALL SP_CADASTRAR_USUARIO('GWINGA', '123', 'A', 1, 1);	
-- CREATE PROCEDURE SP_CADASTRAR_USUARIO (DSC_LOGIN VARCHAR(30), DSC_SENHA VARCHAR(255), TPO_USUARIO CHAR(1), FLG_ATIVO TINYINT, COD_PESSOA INT)

-- CALL SP_ALTERAR_USUARIO (1, 'LEODEEP', '123', 'A', 0, 3);	
-- CREATE PROCEDURE SP_ALTERAR_USUARIO(COD_USUARIO INT, DSC_LOGIN VARCHAR(30), DSC_SENHA VARCHAR(255), TPO_USUARIO CHAR(1), FLG_ATIVO TINYINT, COD_PESSOA INT)

-- CALL SP_EXCLUIR_USUARIO(2);
-- CREATE PROCEDURE SP_EXCLUIR_USUARIO(COD_USUARIO INT)

-- CALL SP_CADASTRAR_CLIENTE('MARCELO DANTAS', 'F', '000.000.000-00', '(11)92122-0001', 'MDANTAS@GMAIL.COM', 'M');	
-- CREATE PROCEDURE SP_CADASTRAR_CLIENTE(NME_PESSOA VARCHAR(100), TPO_PESSOA CHAR(1) , COD_CPF_CNPJ VARCHAR(20),
-- 			NUM_TELEFONE VARCHAR(20), DSC_EMAIL VARCHAR(100), TPO_SEXO CHAR(1))

-- CALL SP_ALTERAR_CLIENTE (7, 'MARCELO DANTAS', 'F', '000.000.000-00', '(11)92122-0001', 'MDANTAS@GMAIL.COM.BR', 'N');	
-- CREATE PROCEDURE SP_ALTERAR_CLIENTE(COD_PESSOA INT, NME_PESSOA VARCHAR(100), TPO_PESSOA CHAR(1) , COD_CPF_CNPJ VARCHAR(20),
-- 			NUM_TELEFONE VARCHAR(20), DSC_EMAIL VARCHAR(100), TPO_SEXO CHAR(1))

-- CALL SP_EXCLUIR_CLIENTE(2);
-- CREATE PROCEDURE SP_EXCLUIR_CLIENTE(COD_PESSOA INT)
