-- Passos para importação de dados 
-- 1 - Criar estrutura (executar script ALL_TABLES.sql). Link:
--https://github.com/pi-univesp-Polo-GRU-02-T20/PI1/blob/dev/DB/db_comercio/Tables/ALL_TABLES.sql

-- 2 - acessar banco e desabilitar a verificação de chaves estranheiras
USE DB_COMERCIO;

SET FOREIGN_KEY_CHECKS = 0;

-- 3 - Executar cada arquivo da pasta data

-- 4 - Ativar verificação de chaves estrangeiras
SET FOREIGN_KEY_CHECKS = 1;


