-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: us-cdbr-east-04.cleardb.com    Database: heroku_72a407c7956ec68
-- ------------------------------------------------------
-- Server version	5.6.50-log

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
  `COD_BAIRRO` int(11) NOT NULL AUTO_INCREMENT,
  `NME_BAIRRO` varchar(100) NOT NULL,
  `COD_MUNICIPIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_BAIRRO`),
  KEY `FK_BAIRRO_MUNICIPIO_IDX` (`COD_MUNICIPIO`),
  KEY `IDX_BAIRRO` (`NME_BAIRRO`),
  CONSTRAINT `FK_BAIRRO_MUNICIPIO` FOREIGN KEY (`COD_MUNICIPIO`) REFERENCES `municipio` (`COD_MUNICIPIO`)
) ENGINE=InnoDB AUTO_INCREMENT=34535 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairro`
--

LOCK TABLES `bairro` WRITE;
/*!40000 ALTER TABLE `bairro` DISABLE KEYS */;
INSERT INTO `bairro` VALUES (17271,'Jardim Helena',3550308),(23026,'Vila Curuçá',3550308),(29808,'Itaim Paulista',3550308),(34517,'Vila Jacuí',3550308);
/*!40000 ALTER TABLE `bairro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `COD_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `NME_CATEGORIA` varchar(100) NOT NULL,
  PRIMARY KEY (`COD_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Brinquedos'),(2,'Cosméticos'),(3,'Eletrônicos'),(4,'Mochilas'),(5,'Escolar'),(6,'Escritório'),(7,'Material infantil'),(8,'Acessórios'),(10,'Calçados'),(11,'Roupas'),(13,'chapéus'),(25,'centro');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco` (
  `COD_ENDERECO` int(11) NOT NULL,
  `DSC_COMPLEMENTO` varchar(255) DEFAULT NULL,
  `NRO_ENDERECO` int(11) DEFAULT NULL,
  `DSC_PONTO_REFERENCIA` varchar(255) DEFAULT NULL,
  `COD_CEP` int(11) DEFAULT NULL,
  `COD_PESSOA` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_ENDERECO`),
  KEY `FK_ENDERECO_LOGRADOURO_idx` (`COD_CEP`),
  KEY `FK_ENDERECO_PESSOA_idx` (`COD_PESSOA`),
  CONSTRAINT `FK_ENDERECO_LOGRADOURO` FOREIGN KEY (`COD_CEP`) REFERENCES `logradouro` (`COD_CEP`),
  CONSTRAINT `FK_ENDERECO_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `COD_ESTADO` int(11) NOT NULL AUTO_INCREMENT,
  `NME_ESTADO` varchar(100) NOT NULL,
  `SGL_UF` varchar(2) NOT NULL,
  PRIMARY KEY (`COD_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES (11,'Rondônia','RO'),(12,'Acre','AC'),(13,'Amazonas','AM'),(14,'Roraima','RR'),(15,'PARÁ','pa'),(16,'Amapá','AP'),(17,'Tocantins','TO'),(21,'Maranhão','MA'),(22,'Piauí','PI'),(23,'Ceará','CE'),(24,'Rio Grande do Norte','RN'),(25,'Paraíba','PB'),(26,'Pernambuco','PE'),(27,'Alagoas','AL'),(28,'Sergipe','SE'),(29,'Bahia','BA'),(31,'Minas Gerais','MG'),(32,'Espírito Santo','ES'),(33,'Rio de Janeiro','RJ'),(35,'São Paulo','SP'),(41,'Paraná','PR'),(42,'Santa Catarina','SC'),(43,'Rio Grande do Sul','RS'),(50,'Mato Grosso do Sul','MS'),(51,'Mato Grosso','MT'),(52,'Goiás','GO'),(53,'Distrito Federal','DF');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_operacao`
--

DROP TABLE IF EXISTS `item_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_operacao` (
  `COD_ITEM_OPERACAO` int(11) NOT NULL AUTO_INCREMENT,
  `QTD_ITEM` float DEFAULT NULL,
  `VLR_ITEM` decimal(10,2) DEFAULT NULL,
  `COD_OPERACAO` int(11) NOT NULL,
  `COD_PRODUTO` int(11) NOT NULL,
  PRIMARY KEY (`COD_ITEM_OPERACAO`),
  KEY `FK_ITEM_COMPRA_IDX` (`COD_OPERACAO`),
  KEY `FK_ITEM_COMPRA_PRODUTO_IDX` (`COD_PRODUTO`),
  CONSTRAINT `FK_ITEM_COMPRA` FOREIGN KEY (`COD_OPERACAO`) REFERENCES `operacao` (`COD_OPERACAO`),
  CONSTRAINT `FK_ITEM_COMPRA_PRODUTO` FOREIGN KEY (`COD_PRODUTO`) REFERENCES `produto` (`COD_PRODUTO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_operacao`
--

LOCK TABLES `item_operacao` WRITE;
/*!40000 ALTER TABLE `item_operacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logradouro`
--

DROP TABLE IF EXISTS `logradouro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logradouro` (
  `COD_CEP` int(11) NOT NULL AUTO_INCREMENT,
  `COD_BAIRRO` int(11) NOT NULL,
  `DSC_LOGRADOURO` varchar(255) DEFAULT NULL,
  `DSC_COMPLEMENTO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COD_CEP`,`COD_BAIRRO`),
  KEY `FK_BAIRRO_ENDERECO_IDX` (`COD_BAIRRO`),
  CONSTRAINT `FK_BAIRRO_ENDERECO` FOREIGN KEY (`COD_BAIRRO`) REFERENCES `bairro` (`COD_BAIRRO`)
) ENGINE=InnoDB AUTO_INCREMENT=8421142 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logradouro`
--

LOCK TABLES `logradouro` WRITE;
/*!40000 ALTER TABLE `logradouro` DISABLE KEYS */;
INSERT INTO `logradouro` VALUES (3813370,34517,'Rua Rio Farias',''),(3827001,34517,'Avenida Doutor Assis Ribeiro - de 8864/8865 ao fim',''),(8030000,23026,'Avenida Coca',''),(8030010,23026,'Rua Mucunã',''),(8030020,23026,'Avenida Guabá',''),(8030040,23026,'Praça Francisco Pereira',''),(8030050,23026,'Rua Cembira - até 877/878',''),(8030060,23026,'Rua Joaquim Gil de Carvalho',''),(8030062,23026,'Viela Vô Francisco (Parque Industrial)',''),(8030070,23026,'Rua Ivoturucaia',''),(8030100,23026,'Rua Chacuru',''),(8030110,23026,'Rua Palanque',''),(8030120,23026,'Rua Capão Alto',''),(8030130,23026,'Rua Isabel Botelho',''),(8030150,23026,'Rua Jereba',''),(8030160,23026,'Praça Nereu Silva',''),(8030170,23026,'Rua Guarupu',''),(8030180,23026,'Avenida Cavoa',''),(8030190,23026,'Rua Grapirá',''),(8030195,23026,'Rua Reverendo Bolivar Bandeira',''),(8030200,23026,'Praça do Galeão',''),(8030210,23026,'Praça Brígida Amélia da Cruz',''),(8030220,23026,'Rua Guaracica',''),(8030230,23026,'Rua Ana Grou',''),(8030240,23026,'Rua Iririgo',''),(8030250,23026,'Rua Jacupema',''),(8030260,23026,'Rua Jaburu',''),(8030270,23026,'Rua Inúbia',''),(8030275,23026,'Rua Vittório Capellaro',''),(8030280,23026,'Rua Jaguaraba',''),(8030290,23026,'Rua Guirapa',''),(8030295,23026,'Travessa Alberto de Colônia',''),(8030300,23026,'Praça João de Figueiredo',''),(8030310,23026,'Rua Guaraitá',''),(8030320,23026,'Rua Gupeva',''),(8030330,23026,'Praça Jaguamitanga',''),(8030340,23026,'Rua Guaxima',''),(8030350,23026,'Rua João Maximiano Mafra',''),(8030360,23026,'Avenida dos Guachos',''),(8030370,23026,'Rua Guti',''),(8030380,23026,'Rua Moricoca',''),(8030400,23026,'Rua Ererê',''),(8030410,23026,'Rua Garopá',''),(8030420,23026,'Rua Gijoca',''),(8030430,23026,'Rua Guiraró',''),(8030440,23026,'Rua Luciano Guerra',''),(8030450,23026,'Rua Cupim',''),(8030460,23026,'Rua Jaguar',''),(8030470,23026,'Rua Donato Vessechi',''),(8030480,23026,'Rua Alfredo Clemente Filho',''),(8030490,23026,'Rua Carlos Gonzalez',''),(8030500,23026,'Avenida Pedro Meira',''),(8030510,23026,'Rua Diogo Oliver',''),(8030520,23026,'Rua Luís França',''),(8030530,23026,'Rua Isaías Gomes',''),(8030540,23026,'Rua Arsênio Guilherme',''),(8030550,23026,'Rua Mário Masini',''),(8030560,23026,'Rua Alice Dilon Braga',''),(8030570,23026,'Rua Higino Messa',''),(8030580,23026,'Rua Benedito Bueno',''),(8030600,23026,'Rua João de Mesquita',''),(8030610,23026,'Avenida Dama Entre Verdes',''),(8030620,23026,'Rua Lélia',''),(8030630,23026,'Rua Pimenteira',''),(8030640,23026,'Rua Jardineira',''),(8030650,23026,'Rua Lírio Branco',''),(8030651,23026,'Rua Particular 23 (Parque Industrial)',''),(8030652,23026,'Rua Particular 22 (Pq Industrial)',''),(8030653,23026,'Rua Particular 21 (Pq Industrial)',''),(8030654,23026,'Rua Particular 20 (Pq Industrial)',''),(8030655,23026,'Rua Particular 19 (Parque Industrial)',''),(8030656,23026,'Rua Particular 18 (Parque Industrial)',''),(8030657,23026,'Rua Particular 17 (Parque Industrial)',''),(8030658,23026,'Rua Particular 16 (Parque Industrial)',''),(8030660,23026,'Rua Rainha Margarida',''),(8030670,23026,'Rua Manguezais',''),(8030680,23026,'Rua Erva de S. Martinho',''),(8030700,23026,'Rua Juan de Salcedo',''),(8030710,23026,'Rua Frederico Bergius',''),(8030720,23026,'Rua Jorge Jones',''),(8030730,23026,'Rua Rui Barbosa Lima',''),(8030740,23026,'Rua José Cesarini',''),(8030750,23026,'Rua Botão de Prata',''),(8030760,23026,'Rua Raiz-Forte',''),(8030770,23026,'Rua Amélia Rodrigues',''),(8030790,23026,'Rua Aquiléia',''),(8030800,23026,'Rua Brincos de Princesa',''),(8030810,23026,'Rua Amarelinhas',''),(8031450,23026,'Rua Parreira-Brava',''),(8031451,23026,'Rua Particular C (Vila Curuça Velha)',''),(8031452,23026,'Rua Particular B (Vila Curuçá Velha)',''),(8031453,23026,'Rua Particular D (Vila Curuçá Velha)',''),(8031454,23026,'Rua Particular A (Vila Curuçá Velha)',''),(8031455,23026,'Rua Particular E (Vila Curuçá Velha)',''),(8031470,23026,'Rua Morro Tubiacanga',''),(8031480,23026,'Rua Morro da Conceição',''),(8031490,23026,'Rua Bacopá',''),(8031540,23026,'Rua Alexandrina Honória Rodrigues',''),(8031550,23026,'Travessa Mirrá',''),(8031560,23026,'Rua Georgina Diniz Braghiroli',''),(8031561,23026,'Rua Ferdinando Artaria (Vila Curuça Velha)',''),(8031562,23026,'Travessa Flor-Estrela (Vila Curuça Velha)',''),(8031563,23026,'Rua Antônio Rosselino (Vila Curuça Velha)',''),(8031565,23026,'Travessa Maria Antonieta Berny',''),(8031590,23026,'Rua Joaquim Leal',''),(8031595,23026,'Travessa Francisco Élio',''),(8031600,23026,'Rua Morro do Caieiro',''),(8031620,23026,'Rua Padre Eduardo Roberto',''),(8031630,23026,'Via de Pedestre Minotauro',''),(8031640,23026,'Rua Professora Abigail Bolsanelli',''),(8031650,23026,'Rua Ângelo Caldini',''),(8031660,23026,'Rua Trapoeraba',''),(8031700,23026,'Rua José Velucci',''),(8031760,23026,'Rua Benjamin Capusso',''),(8031765,23026,'Travessa Francisco de Paula Conceição Júnior',''),(8031768,23026,'Travessa José Gomes da Costa',''),(8031780,23026,'Rua Marcílio Rosseto',''),(8031790,23026,'Rua Angelino Guerino',''),(8031800,23026,'Rua Maria de Ágreda',''),(8031820,23026,'Rua Vera Corene',''),(8032004,23026,'Rua Luiz Bonadiez',''),(8032006,23026,'Travessa Luigi Marchesi',''),(8032010,23026,'Rua Cembira - de 879/880 ao fim',''),(8032015,23026,'Parque Chico Mendes',''),(8032565,23026,'Travessa Benedito Bandeira',''),(8050005,34517,'Rua Álamo (Jd Ruth)',''),(8050010,34517,'Rua das Amendoeiras (Jd Ruth)',''),(8050020,34517,'Rua Frésia (Jd Santana)',''),(8050030,34517,'Rua Folha de Santana (Jd S Maria)',''),(8050040,34517,'Rua Flor de Cachimbo (Jd S Maria)',''),(8050050,34517,'Rua Fruta-do-Paraíso (Jd S Maria)',''),(8050060,34517,'Rua Flor da Redenção (Jd S Maria)',''),(8050070,34517,'Rua Flor da Ressurreição (Jd S Maria)',''),(8050080,34517,'Rua Flor do Espírito Santo (Jd Santana)',''),(8050090,34517,'Rua Jasmim de Porcelana (Jd S Maria)',''),(8050093,34517,'Rua Flor da Aurora (Jd S Maria)',''),(8050095,34517,'Rua Flor do Olimpo (Jd S Maria)',''),(8050097,34517,'Rua Flor de Seda (Jd S Maria)',''),(8050099,34517,'Avenida Jacu-Pêssego (Nova Trabalhadores) - até 99998/99999',''),(8050100,34517,'Rua Fruta-de-Caiapó (Jd Santana)',''),(8050110,34517,'Rua Jacarandá do Campo (Jd Santana)',''),(8050120,34517,'Rua Dom Francisco de Campos Barreto (Jd S Maria)',''),(8050125,34517,'Rua Jatobarana (Jd S Maria)',''),(8050130,34517,'Rua Maria Santana - até 689/690',''),(8050135,34517,'Viela Santana',''),(8050137,34517,'Viela Lírios',''),(8050139,34517,'Viela Flores',''),(8050140,34517,'Rua Folha da Fonte (Jd S Maria)',''),(8050150,34517,'Rua Guamirim (Jd S Maria)',''),(8050155,34517,'Via de Pedestre Leonardo Rangel de Souza',''),(8050160,34517,'Rua Bernardo Castanhon (Jd S Maria)',''),(8050165,34517,'Rua Palmeira do Piauí (Vl Reis)',''),(8050170,34517,'Rua dos Kiris (Vl S Maria)',''),(8050175,34517,'Rua Tião Carreiro (Vl Reis)',''),(8050180,34517,'Rua Cafuz (Vl Reis)',''),(8050190,34517,'Rua Bryônia (Vl Reis)',''),(8050200,34517,'Rua Cairuçu (Vl Reis)',''),(8050210,34517,'Rua Sorgo',''),(8050220,34517,'Rua dos Cálamos (Vl Reis)',''),(8050221,34517,'Viela Servidão',''),(8050222,34517,'Viela Particular Servidão',''),(8050225,34517,'Rua do Ipê Amarelo (Jd S Maria)',''),(8050230,34517,'Rua Flor de Natal (Vl Reis)',''),(8050235,34517,'Rua das Arecas',''),(8060000,34517,'Avenida Tenente Laudelino Ferreira do Amaral - até 558/559',''),(8060005,34517,'Viaduto Engenheiro Luiz Alfredo Falcão Bauer',''),(8060010,34517,'Rua Inácio Maciel',''),(8060020,34517,'Praça José Cardoso de Moura',''),(8060030,34517,'Rua Parioto',''),(8060040,34517,'Rua Taiuvinha',''),(8060050,34517,'Rua Brazilina Tereza',''),(8060060,34517,'Rua Coronel Manuel Feliciano de Souza',''),(8060065,34517,'Avenida Tenente Laudelino Ferreira do Amaral - de 560/561 ao fim',''),(8060070,34517,'Avenida Doutor Ussiel Cirilo',''),(8060080,34517,'Rua Erva Mate',''),(8060090,34517,'Rua Vilma',''),(8060100,34517,'Rua Tapiçuá',''),(8060110,34517,'Praça Fortunato da Silveira',''),(8060120,34517,'Avenida Afonso Lopes de Baião - até 628/629',''),(8060125,34517,'Viela Afonso Lopes de Baião',''),(8060130,34517,'Rua Elita',''),(8060140,34517,'Rua João Felisberto Moreira',''),(8060150,34517,'Rua Dona Ana Flora Pinheiro de Sousa',''),(8060160,34517,'Rua Guchi Toda',''),(8060170,34517,'Rua Tilly',''),(8060180,34517,'Rua Glênio Peres',''),(8060190,34517,'Rua Marrela',''),(8060200,34517,'Rua Jaime Barcelos',''),(8060205,34517,'Rua Edward Romoaldo',''),(8060207,34517,'Travessa Denis de Lair',''),(8060210,34517,'Rua Francisco Castanheda',''),(8060220,34517,'Rua Édipo Feliciano',''),(8060225,34517,'Via de Pedestre Pedro Augusto Reais',''),(8060230,34517,'Rua Aracaji-Mirim',''),(8060240,34517,'Rua Lígia Moreira de Salles Gomes',''),(8060260,34517,'Praça José de Barros Abreu',''),(8060265,34517,'Travessa Cônego Artusi',''),(8060270,34517,'Rua Amélia Cardoso Caropreso',''),(8060280,34517,'Rua João Franco de Sousa',''),(8060283,34517,'Rua Aulide Carini',''),(8060285,34517,'Travessa Maria Eliza Gomes de Abreu',''),(8060290,34517,'Rua João Álvares Pires',''),(8060300,34517,'Rua Tarapitinga',''),(8060310,34517,'Rua Tejuguaçu',''),(8060320,34517,'Rua Claro de Minas',''),(8060322,34517,'Travessa Hermes de Lima',''),(8060330,34517,'Rua Domingos Antônio Laureano',''),(8060340,34517,'Rua Ernesto Bainha Lopes',''),(8060350,34517,'Rua Tsutomu Henni',''),(8060355,34517,'Rua João Eugênio',''),(8060360,34517,'Rua Piedade de Ponte Nova',''),(8060370,34517,'Rua Santana de Pirapama',''),(8060371,34517,'Viela Santana de Pirapama',''),(8060375,34517,'Rua Baixo das Curimatás',''),(8060380,34517,'Rua Américo Sugai',''),(8060383,34517,'Travessa Professor Richard Wasicky',''),(8060385,34517,'Rua João Nunes da Mata',''),(8060387,34517,'Travessa Inácio Ferreira',''),(8060390,34517,'Rua Friande',''),(8060395,34517,'Travessa Benedito Moraes',''),(8060400,34517,'Avenida dos Guris',''),(8060401,34517,'Viela Guris',''),(8060410,34517,'Rua Carvalho de Almeida',''),(8060420,34517,'Rua Bernardo Bellotto',''),(8060430,34517,'Rua Carlo Crivelli',''),(8060970,34517,'Rua Dona Ana Flora Pinheiro de Sousa, 76 ',' AC Vinte e Quatro de Maio'),(8061200,34517,'Avenida Rio Jacuí',''),(8061205,34517,'Avenida Marginal',''),(8080550,17271,'Rua Curuapanema',''),(8081130,17271,'Rua Suçuarana',''),(8081160,17271,'Rua Sabiá-Laranjeira',''),(8081170,17271,'Rua Salvador Fernandes Cardia',''),(8081180,17271,'Rua Tujumirim',''),(8081185,17271,'Praça das Campainhas',''),(8081210,17271,'Rua Tetiximira',''),(8081240,17271,'Rua Ipê Branco',''),(8081435,17271,'Travessa Sudão',''),(8090280,17271,'Avenida Félix Nascentes Pinto',''),(8090281,17271,'Rua Canarinho (Ch Três Meninas)',''),(8090282,17271,'Rua Santa Efigênia (Ch Três Meninas)',''),(8090283,17271,'Rua Maria de Lourdes (Ch Três Meninas)',''),(8090284,17271,'Rua 03 de Outubro (Ch Três Meninas)',''),(8090290,17271,'Rua São Brás do Suaçuí',''),(8090300,17271,'Rua Antônio de Sousa e Castro',''),(8090310,17271,'Rua Juriti Azul',''),(8090320,17271,'Rua Guainambé',''),(8090330,17271,'Rua Conceição de Minas',''),(8090340,17271,'Rua Domingos Trigueiros',''),(8090350,17271,'Rua Emílio Cardoso Aires',''),(8090360,17271,'Rua Tucunaré',''),(8090370,17271,'Rua Kumaki Aoki',''),(8090380,17271,'Rua Engenheiro Álvaro de Sales Oliveira',''),(8090390,17271,'Rua Doutor Gregório de Oliveira e Castro',''),(8090400,17271,'Rua Tinguaçu',''),(8090410,17271,'Praça Carmo da Cachoeira',''),(8090420,17271,'Rua São João Batista dos Passos',''),(8090430,17271,'Rua Cruzeiro da Fortaleza',''),(8090440,17271,'Rua Rio da Lagoa',''),(8090450,17271,'Rua Miraporanga',''),(8090460,17271,'Rua Carlo Maratti',''),(8090470,17271,'Rua Erva Andorinha',''),(8090480,17271,'Rua Fortaleza de Minas',''),(8090490,17271,'Rua Alexandre Machado Pereira',''),(8090500,17271,'Rua Raiz Amarela',''),(8090510,17271,'Rua Araguaia Paraense',''),(8090520,17271,'Rua Cachoeira do Brumado',''),(8090530,17271,'Rua Camomila',''),(8090540,17271,'Rua Algodoeiros',''),(8090550,17271,'Rua Sodré de Aragão',''),(8090551,17271,'Rua Recife (Jd Arizona)',''),(8090552,17271,'Rua Amazonas (Jd Arizona)',''),(8090553,17271,'Rua Bahia (Jd Arizona)',''),(8090554,17271,'Rua Piauí (Jd Arizona)',''),(8090555,17271,'Rua Vitória (Jd Arizona)',''),(8090556,17271,'Rua Alagoas (Jd Arizona)',''),(8090557,17271,'Rua Leonel de Azevedo (Jd Arizona)',''),(8090558,17271,'Rua Nossa Senhora da Paz (Jd Arizona)',''),(8090559,17271,'Rua Santa Helena (Jd Arizona)',''),(8090560,17271,'Rua das Cactáceas',''),(8090570,17271,'Rua Mamangá',''),(8090580,17271,'Rua dos Mururés',''),(8090590,17271,'Praça Craveiro do Campo',''),(8090600,17271,'Rua Cirilo Alves da Silva',''),(8090601,17271,'Rua Morada do Sol (Jardim Arizona)',''),(8090602,17271,'Rua Creusa de Souza Silva',''),(8090603,17271,'Rua Beija-flor (Jardim Arizona)',''),(8090604,17271,'Rua Esperança',''),(8090605,17271,'Rua das Flores (Jardim Arizona)',''),(8090606,17271,'Rua das Andorinhas (Jardim Arizona)',''),(8090620,17271,'Rua Francisco Cirillo',''),(8090630,17271,'Rua Antônio Joaquim de Carvalho',''),(8090640,17271,'Rua Pedro de Sousa Portugal',''),(8090650,17271,'Rua dos Girassóis',''),(8090660,17271,'Rua Inácio Alvarez',''),(8090670,17271,'Rua Santa Rosa da Serra',''),(8090690,17271,'Rua Palmeira-Imperial',''),(8090700,17271,'Rua Graciosa',''),(8090710,17271,'Rua dos Cajus',''),(8090720,17271,'Rua Rosa Rubra',''),(8090740,17271,'Rua Guarauna',''),(8090750,17271,'Rua Boiçuaíba',''),(8090753,17271,'Rua Cosme dos Santos',''),(8110115,29808,'Rua Adolfo Baci',''),(8110225,29808,'Travessa Ébano Oriental',''),(8110300,29808,'Rua Vereda do Paraíso',''),(8110343,29808,'Rua Imore',''),(8110345,29808,'Rua Abure',''),(8111005,29808,'Rua Particular A',''),(8111008,29808,'Rua Particular B',''),(8111050,29808,'Rua Manuel Duarte Ferro - até 405/406',''),(8111075,29808,'Travessa Euristeo',''),(8111180,29808,'Rua Monsenhor Salim - até 655/656',''),(8111200,29808,'Rua Enseada Itapacoroia',''),(8111230,29808,'Rua Colônia D\'Assunção',''),(8111280,29808,'Rua Baltazar Gonsalves Malho',''),(8111300,29808,'Avenida Córrego Três Pontes',''),(8111325,29808,'Viela Santa Terezinha',''),(8115000,29808,'Avenida Marechal Tito - de 4050 ao fim - lado par',''),(8115100,29808,'Avenida Marechal Tito - de 4191 ao fim - lado ímpar',''),(8115971,29808,'Avenida Marechal Tito, 7255 ',' CLI Leve Leite Leste'),(8115972,29808,'Avenida Marechal Tito, 7255 ',' CDD Itaim Paulista'),(8120000,29808,'Avenida Barão de Alagoas',''),(8120010,29808,'Praça Bernardo Ravasco',''),(8120020,29808,'Rua Pascoal de Miranda',''),(8120030,29808,'Rua Manuel de Castilho',''),(8120040,29808,'Rua Ribeiro Escobar',''),(8120050,29808,'Rua Padre Eustáquio',''),(8120060,29808,'Rua Paraú',''),(8120070,29808,'Rua Santo Antônio da Glória',''),(8120080,29808,'Rua Serra dos Aimorés',''),(8120090,29808,'Rua Lázaro Diniz',''),(8120100,29808,'Rua Cachoeira Alta',''),(8120110,29808,'Praça Lions Clube Itaim Paulista',''),(8120120,29808,'Rua Maria Felícia',''),(8120130,29808,'Rua Francisco Faustino',''),(8120140,29808,'Rua Vigia da Encruzilhada',''),(8120150,29808,'Rua Sargento Manuel Alboz',''),(8120160,29808,'Rua do Convento',''),(8120200,29808,'Rua João Carlos Leite Penteado',''),(8120240,29808,'Avenida Inácio Penteado',''),(8120300,29808,'Rua Nogueira Viotti',''),(8120305,29808,'Praça Hector Júlio Paride Bsarnabó',''),(8120310,29808,'Praça Ministro Brito Bastos',''),(8120320,29808,'Rua Almirante Alves Câmara',''),(8120330,29808,'Rua Colaço de Oliveira',''),(8120340,29808,'Rua Albuquerque Pinheiro',''),(8120350,29808,'Rua do Refrão',''),(8120360,29808,'Rua Pacutinga',''),(8120370,29808,'Rua João de Castilho Pinto',''),(8120380,29808,'Rua Professor Zeferino Ferraz',''),(8120390,29808,'Rua Povos Guaranis',''),(8120400,29808,'Praça Monsenhor Francisco Bastos',''),(8120410,29808,'Rua Mandaguaçu',''),(8120420,29808,'Rua Valente de Novais',''),(8120430,29808,'Rua João da Silva',''),(8120440,29808,'Rua Sardoá',''),(8120450,29808,'Rua Cândido Gomide',''),(8120455,29808,'Praça Yerchanik Kissajikian',''),(8120460,29808,'Rua Floraí',''),(8120470,29808,'Rua Itajuibe - até 907/908',''),(8120540,29808,'Rua João Lourenço Rebelo',''),(8120550,29808,'Rua Francisco Velasquez',''),(8121800,29808,'Rua Valsa dos Casais',''),(8121810,29808,'Rua Serra do Luar',''),(8121830,29808,'Rua Cio da Terra',''),(8131030,29808,'Rua José Mário Donizetti Baroni',''),(8131060,29808,'Rua Minha Cidade',''),(8131070,29808,'Rua Aguinaldo Bezerra dos Santos',''),(8131180,29808,'Rua Padre Francisco Veloso',''),(8131210,29808,'Rua Jacinto Soares',''),(8131215,29808,'Rua Pedro Gil',''),(8131220,29808,'Rua Estudantes da China',''),(8131225,29808,'Rua Ilha da Paz (Enc. Norte)',''),(8131230,29808,'Rua Che',''),(8131240,29808,'Rua do Espaço Ecológico',''),(8131250,29808,'Rua Oswaldo Barreto',''),(8131260,29808,'Rua Djalma de Andrade',''),(8131280,29808,'Rua Teodomiro Pereira',''),(8131290,29808,'Rua Águia do Universo',''),(8131300,29808,'Rua Ary Cordovil',''),(8131310,29808,'Rua Padre Virgílio Campelo',''),(8131315,29808,'Rua Barão de Almeida Galeão',''),(8131320,29808,'Rua Renata Agondi',''),(8131325,29808,'Rua Visconde de Guedes Teixeira',''),(8131330,29808,'Rua Carlos Aguiar',''),(8131340,29808,'Rua Carmem de Almeida',''),(8131350,29808,'Rua Vitório Negrelle',''),(8131360,29808,'Rua Paulo Tapajós',''),(8131370,29808,'Rua Dom João Peres de Aboim',''),(8132410,29808,'Rua Chuva na Montanha',''),(8132430,29808,'Rua Coração Paulista',''),(8132460,29808,'Rua Espelho Mágico',''),(8132470,29808,'Rua Porto da Saudade',''),(8132480,29808,'Rua Canção dos Piratas',''),(8132485,29808,'Rua Senador Darcy Ribeiro',''),(8132490,29808,'Rua Alberto Evaristo Ginastera',''),(8132495,29808,'Rua André Breton',''),(8140000,29808,'Rua Tibúrcio de Sousa',''),(8140010,29808,'Praça Silva Teles',''),(8140060,29808,'Rua Antônio João de Medeiros',''),(8140313,29808,'Rua Açaiá',''),(8140970,29808,'Rua Tibúrcio de Sousa, 8 ',' AC Itaim Paulista'),(8140972,29808,'Rua Tibúrcio de Sousa, 437 ',' AC Silva Teles'),(8141005,29808,'Rua Mar Eterno',''),(8141008,29808,'Rua da Cançoneta',''),(8141015,29808,'Rua Camurça',''),(8141018,29808,'Rua Lírio dos Vales',''),(8141730,29808,'Rua Luiza Augusta Garlippe',''),(8141740,29808,'Rua Maria Célia Correa',''),(8190303,29808,'Rua Armando Nóbrega Colângelo',''),(8371060,17271,'Rua Fortim do Descalvado',''),(8371150,17271,'Rua Aguarico',''),(8371160,17271,'Rua Lorenzo Penna',''),(8371165,17271,'Rua Taubiú',''),(8371170,17271,'Rua Peruna',''),(8371180,17271,'Rua Arinos',''),(8371190,17271,'Rua Almeida Falcão',''),(8371200,17271,'Rua Antônio Coutinho',''),(8371210,17271,'Rua Fortim Itapoã',''),(8371220,17271,'Travessa da Leveza',''),(8371230,17271,'Travessa do Passeio',''),(8371240,17271,'Rua Simão Cerqueira',''),(8371250,17271,'Rua Pindaré',''),(8371260,17271,'Rua Cauim',''),(8371270,17271,'Praça Domingos Dias Sereno',''),(8420000,17271,'Estrada Itaquera-Guaianazes - de 1723/1724 a 2558/2559',''),(8420010,17271,'Rua Hilário Pires',''),(8420020,17271,'Rua Doutor Oliveira Arruda',''),(8420030,17271,'Rua São Marçal',''),(8420040,17271,'Rua Doutor Ribeiro de Andrade',''),(8420050,17271,'Rua Veiga Bueno',''),(8420060,17271,'Rua Mafalda Santanin Bettio',''),(8420070,17271,'Rua Roseira',''),(8420080,17271,'Rua Erli',''),(8420081,17271,'Rua Shiono Katayama',''),(8420090,17271,'Rua Manuel Calhamares',''),(8420092,17271,'Avenida José Pinheiro Borges',''),(8420100,17271,'Rua Itarana',''),(8420110,17271,'Rua Diogo Sanches',''),(8420120,17271,'Rua Juvelina',''),(8420130,17271,'Avenida Nossa Senhora de Guadalupe',''),(8420150,17271,'Rua Esteves Ferreira',''),(8420160,17271,'Rua Agostinho Delgado de Arouche',''),(8420170,17271,'Rua Bernardo Guedes de Toledo',''),(8420180,17271,'Rua José Cubas do Prado',''),(8420190,17271,'Rua Francisco Pinheiro de Sepeda',''),(8420200,17271,'Rua Frei Francisco',''),(8420210,17271,'Rua Sílvio Marques Júnior',''),(8420220,17271,'Rua João Piqueras',''),(8420230,17271,'Rua Frei André Blanco',''),(8420240,17271,'Rua Sebastião de Barros',''),(8420250,17271,'Rua Belo Vale',''),(8420260,17271,'Rua Lourenço Xavier',''),(8420270,17271,'Rua Engenheiro Romeu Belluomini',''),(8420280,17271,'Avenida Professor Osvaldo de Oliveira',''),(8420290,17271,'Rua Tomé Málio',''),(8420300,17271,'Rua Ferreira de Camargo',''),(8420318,17271,'Rua Santa Rita da Estrela',''),(8420320,17271,'Rua Patrícia Galvão',''),(8420340,17271,'Rua Padre Cristóvão Valente',''),(8420350,17271,'Rua Serafim dos Anjos',''),(8420355,17271,'Rua Joaquim Pardave',''),(8420360,17271,'Rua Jean Murat',''),(8420370,17271,'Rua Caetano Duarte',''),(8420380,17271,'Rua Silvestre da Silva',''),(8420400,17271,'Rua Santa Edith',''),(8420600,17271,'Rua Pilar do Sul',''),(8420970,17271,'Rua Pilar do Sul, 50 ',' CDD Cidade Tiradentes'),(8421141,17271,'Rua Vista Alegre','');
/*!40000 ALTER TABLE `logradouro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `COD_MUNICIPIO` int(11) NOT NULL AUTO_INCREMENT,
  `NME_MUNICIPIO` varchar(100) NOT NULL,
  `COD_ESTADO` int(11) NOT NULL,
  PRIMARY KEY (`COD_MUNICIPIO`),
  KEY `FK_MUNICIPIO_ESTADO_IDX` (`COD_ESTADO`),
  CONSTRAINT `FK_MUNICIPIO_ESTADO` FOREIGN KEY (`COD_ESTADO`) REFERENCES `estado` (`COD_ESTADO`)
) ENGINE=InnoDB AUTO_INCREMENT=3557304 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (3500105,'Adamantina',35),(3500204,'Adolfo',35),(3500303,'Aguaí',35),(3500402,'Águas da Prata',35),(3500501,'Águas de Lindóia',35),(3500550,'Águas de Santa Bárbara',35),(3500600,'Águas de São Pedro',35),(3500709,'Agudos',35),(3500758,'Alambari',35),(3500808,'Alfredo Marcondes',35),(3500907,'Altair',35),(3501004,'Altinópolis',35),(3501103,'Alto Alegre',35),(3501152,'Alumínio',35),(3501202,'Álvares Florence',35),(3501301,'Álvares Machado',35),(3501400,'Álvaro de Carvalho',35),(3501509,'Alvinlândia',35),(3501608,'Americana',35),(3501707,'Américo Brasiliense',35),(3501806,'Américo de Campos',35),(3501905,'Amparo',35),(3502002,'Analândia',35),(3502101,'Andradina',35),(3502200,'Angatuba',35),(3502309,'Anhembi',35),(3502408,'Anhumas',35),(3502507,'Aparecida',35),(3502606,'Aparecida d\'Oeste',35),(3502705,'Apiaí',35),(3502754,'Araçariguama',35),(3502804,'Araçatuba',35),(3502903,'Araçoiaba da Serra',35),(3503000,'Aramina',35),(3503109,'Arandu',35),(3503158,'Arapeí',35),(3503208,'Araraquara',35),(3503307,'Araras',35),(3503356,'Arco-Íris',35),(3503406,'Arealva',35),(3503505,'Areias',35),(3503604,'Areiópolis',35),(3503802,'Artur Nogueira',35),(3503901,'Arujá',35),(3503950,'Aspásia',35),(3504008,'Assis',35),(3504107,'Atibaia',35),(3504206,'Auriflama',35),(3504305,'Avaí',35),(3504404,'Avanhandava',35),(3504503,'Avaré',35),(3504602,'Bady Bassitt',35),(3504701,'Balbinos',35),(3504800,'Bálsamo',35),(3504909,'Bananal',35),(3505005,'Barão de Antonina',35),(3505104,'Barbosa',35),(3505203,'Bariri',35),(3505302,'Barra Bonita',35),(3505351,'Barra do Chapéu',35),(3505401,'Barra do Turvo',35),(3505500,'Barretos',35),(3505609,'Barrinha',35),(3505708,'Barueri',35),(3505807,'Bastos',35),(3505906,'Batatais',35),(3506003,'Bauru',35),(3506102,'Bebedouro',35),(3506201,'Bento de Abreu',35),(3506300,'Bernardino de Campos',35),(3506359,'Bertioga',35),(3506409,'Bilac',35),(3506508,'Birigui',35),(3506607,'Biritiba Mirim',35),(3506706,'Boa Esperança do Sul',35),(3506805,'Bocaina',35),(3506904,'Bofete',35),(3507001,'Boituva',35),(3507100,'Bom Jesus dos Perdões',35),(3507159,'Bom Sucesso de Itararé',35),(3507209,'Borá',35),(3507308,'Boracéia',35),(3507407,'Borborema',35),(3507456,'Borebi',35),(3507506,'Botucatu',35),(3507605,'Bragança Paulista',35),(3507704,'Braúna',35),(3507753,'Brejo Alegre',35),(3507803,'Brodowski',35),(3507902,'Brotas',35),(3508009,'Buri',35),(3508108,'Buritama',35),(3508207,'Buritizal',35),(3508306,'Cabrália Paulista',35),(3508405,'Cabreúva',35),(3508504,'Caçapava',35),(3508603,'Cachoeira Paulista',35),(3508702,'Caconde',35),(3508801,'Cafelândia',35),(3508900,'Caiabu',35),(3509007,'Caieiras',35),(3509106,'Caiuá',35),(3509205,'Cajamar',35),(3509254,'Cajati',35),(3509304,'Cajobi',35),(3509403,'Cajuru',35),(3509452,'Campina do Monte Alegre',35),(3509502,'Campinas',35),(3509601,'Campo Limpo Paulista',35),(3509700,'Campos do Jordão',35),(3509809,'Campos Novos Paulista',35),(3509908,'Cananéia',35),(3509957,'Canas',35),(3510005,'Cândido Mota',35),(3510104,'Cândido Rodrigues',35),(3510153,'Canitar',35),(3510203,'Capão Bonito',35),(3510302,'Capela do Alto',35),(3510401,'Capivari',35),(3510500,'Caraguatatuba',35),(3510609,'Carapicuíba',35),(3510708,'Cardoso',35),(3510807,'Casa Branca',35),(3510906,'Cássia dos Coqueiros',35),(3511003,'Castilho',35),(3511102,'Catanduva',35),(3511201,'Catiguá',35),(3511300,'Cedral',35),(3511409,'Cerqueira César',35),(3511508,'Cerquilho',35),(3511607,'Cesário Lange',35),(3511706,'Charqueada',35),(3511904,'Clementina',35),(3512001,'Colina',35),(3512100,'Colômbia',35),(3512209,'Conchal',35),(3512308,'Conchas',35),(3512407,'Cordeirópolis',35),(3512506,'Coroados',35),(3512605,'Coronel Macedo',35),(3512704,'Corumbataí',35),(3512803,'Cosmópolis',35),(3512902,'Cosmorama',35),(3513009,'Cotia',35),(3513108,'Cravinhos',35),(3513207,'Cristais Paulista',35),(3513306,'Cruzália',35),(3513405,'Cruzeiro',35),(3513504,'Cubatão',35),(3513603,'Cunha',35),(3513702,'Descalvado',35),(3513801,'Diadema',35),(3513850,'Dirce Reis',35),(3513900,'Divinolândia',35),(3514007,'Dobrada',35),(3514106,'Dois Córregos',35),(3514205,'Dolcinópolis',35),(3514304,'Dourado',35),(3514403,'Dracena',35),(3514502,'Duartina',35),(3514601,'Dumont',35),(3514700,'Echaporã',35),(3514809,'Eldorado',35),(3514908,'Elias Fausto',35),(3514924,'Elisiário',35),(3514957,'Embaúba',35),(3515004,'Embu das Artes',35),(3515103,'Embu-Guaçu',35),(3515129,'Emilianópolis',35),(3515152,'Engenheiro Coelho',35),(3515186,'Espírito Santo do Pinhal',35),(3515194,'Espírito Santo do Turvo',35),(3515202,'Estrela d\'Oeste',35),(3515301,'Estrela do Norte',35),(3515350,'Euclides da Cunha Paulista',35),(3515400,'Fartura',35),(3515509,'Fernandópolis',35),(3515608,'Fernando Prestes',35),(3515657,'Fernão',35),(3515707,'Ferraz de Vasconcelos',35),(3515806,'Flora Rica',35),(3515905,'Floreal',35),(3516002,'Flórida Paulista',35),(3516101,'Florínea',35),(3516200,'Franca',35),(3516309,'Francisco Morato',35),(3516408,'Franco da Rocha',35),(3516507,'Gabriel Monteiro',35),(3516606,'Gália',35),(3516705,'Garça',35),(3516804,'Gastão Vidigal',35),(3516853,'Gavião Peixoto',35),(3516903,'General Salgado',35),(3517000,'Getulina',35),(3517109,'Glicério',35),(3517208,'Guaiçara',35),(3517307,'Guaimbê',35),(3517406,'Guaíra',35),(3517505,'Guapiaçu',35),(3517604,'Guapiara',35),(3517703,'Guará',35),(3517802,'Guaraçaí',35),(3517901,'Guaraci',35),(3518008,'Guarani d\'Oeste',35),(3518107,'Guarantã',35),(3518206,'Guararapes',35),(3518305,'Guararema',35),(3518404,'Guaratinguetá',35),(3518503,'Guareí',35),(3518602,'Guariba',35),(3518701,'Guarujá',35),(3518800,'Guarulhos',35),(3518859,'Guatapará',35),(3518909,'Guzolândia',35),(3519006,'Herculândia',35),(3519055,'Holambra',35),(3519071,'Hortolândia',35),(3519105,'Iacanga',35),(3519204,'Iacri',35),(3519253,'Iaras',35),(3519303,'Ibaté',35),(3519402,'Ibirá',35),(3519501,'Ibirarema',35),(3519600,'Ibitinga',35),(3519709,'Ibiúna',35),(3519808,'Icém',35),(3519907,'Iepê',35),(3520004,'Igaraçu do Tietê',35),(3520103,'Igarapava',35),(3520202,'Igaratá',35),(3520301,'Iguape',35),(3520400,'Ilhabela',35),(3520426,'Ilha Comprida',35),(3520442,'Ilha Solteira',35),(3520509,'Indaiatuba',35),(3520608,'Indiana',35),(3520707,'Indiaporã',35),(3520806,'Inúbia Paulista',35),(3520905,'Ipaussu',35),(3521002,'Iperó',35),(3521101,'Ipeúna',35),(3521150,'Ipiguá',35),(3521200,'Iporanga',35),(3521309,'Ipuã',35),(3521408,'Iracemápolis',35),(3521507,'Irapuã',35),(3521606,'Irapuru',35),(3521705,'Itaberá',35),(3521804,'Itaí',35),(3521903,'Itajobi',35),(3522000,'Itaju',35),(3522109,'Itanhaém',35),(3522158,'Itaoca',35),(3522208,'Itapecerica da Serra',35),(3522307,'Itapetininga',35),(3522406,'Itapeva',35),(3522505,'Itapevi',35),(3522604,'Itapira',35),(3522653,'Itapirapuã Paulista',35),(3522703,'Itápolis',35),(3522802,'Itaporanga',35),(3522901,'Itapuí',35),(3523008,'Itapura',35),(3523107,'Itaquaquecetuba',35),(3523206,'Itararé',35),(3523305,'Itariri',35),(3523404,'Itatiba',35),(3523503,'Itatinga',35),(3523602,'Itirapina',35),(3523701,'Itirapuã',35),(3523800,'Itobi',35),(3523909,'Itu',35),(3524006,'Itupeva',35),(3524105,'Ituverava',35),(3524204,'Jaborandi',35),(3524303,'Jaboticabal',35),(3524402,'Jacareí',35),(3524501,'Jaci',35),(3524600,'Jacupiranga',35),(3524709,'Jaguariúna',35),(3524808,'Jales',35),(3524907,'Jambeiro',35),(3525003,'Jandira',35),(3525102,'Jardinópolis',35),(3525201,'Jarinu',35),(3525300,'Jaú',35),(3525409,'Jeriquara',35),(3525508,'Joanópolis',35),(3525607,'João Ramalho',35),(3525706,'José Bonifácio',35),(3525805,'Júlio Mesquita',35),(3525854,'Jumirim',35),(3525904,'Jundiaí',35),(3526001,'Junqueirópolis',35),(3526100,'Juquiá',35),(3526209,'Juquitiba',35),(3526308,'Lagoinha',35),(3526407,'Laranjal Paulista',35),(3526506,'Lavínia',35),(3526605,'Lavrinhas',35),(3526704,'Leme',35),(3526803,'Lençóis Paulista',35),(3526902,'Limeira',35),(3527009,'Lindóia',35),(3527108,'Lins',35),(3527207,'Lorena',35),(3527256,'Lourdes',35),(3527306,'Louveira',35),(3527405,'Lucélia',35),(3527504,'Lucianópolis',35),(3527603,'Luís Antônio',35),(3527702,'Luiziânia',35),(3527801,'Lupércio',35),(3527900,'Lutécia',35),(3528007,'Macatuba',35),(3528106,'Macaubal',35),(3528205,'Macedônia',35),(3528304,'Magda',35),(3528403,'Mairinque',35),(3528502,'Mairiporã',35),(3528601,'Manduri',35),(3528700,'Marabá Paulista',35),(3528809,'Maracaí',35),(3528858,'Marapoama',35),(3528908,'Mariápolis',35),(3529005,'Marília',35),(3529104,'Marinópolis',35),(3529203,'Martinópolis',35),(3529302,'Matão',35),(3529401,'Mauá',35),(3529500,'Mendonça',35),(3529609,'Meridiano',35),(3529658,'Mesópolis',35),(3529708,'Miguelópolis',35),(3529807,'Mineiros do Tietê',35),(3529906,'Miracatu',35),(3530003,'Mira Estrela',35),(3530102,'Mirandópolis',35),(3530201,'Mirante do Paranapanema',35),(3530300,'Mirassol',35),(3530409,'Mirassolândia',35),(3530508,'Mococa',35),(3530607,'Mogi das Cruzes',35),(3530706,'Mogi Guaçu',35),(3530805,'Mogi Mirim',35),(3530904,'Mombuca',35),(3531001,'Monções',35),(3531100,'Mongaguá',35),(3531209,'Monte Alegre do Sul',35),(3531308,'Monte Alto',35),(3531407,'Monte Aprazível',35),(3531506,'Monte Azul Paulista',35),(3531605,'Monte Castelo',35),(3531704,'Monteiro Lobato',35),(3531803,'Monte Mor',35),(3531902,'Morro Agudo',35),(3532009,'Morungaba',35),(3532058,'Motuca',35),(3532108,'Murutinga do Sul',35),(3532157,'Nantes',35),(3532207,'Narandiba',35),(3532306,'Natividade da Serra',35),(3532405,'Nazaré Paulista',35),(3532504,'Neves Paulista',35),(3532603,'Nhandeara',35),(3532702,'Nipoã',35),(3532801,'Nova Aliança',35),(3532827,'Nova Campina',35),(3532843,'Nova Canaã Paulista',35),(3532868,'Nova Castilho',35),(3532900,'Nova Europa',35),(3533007,'Nova Granada',35),(3533106,'Nova Guataporanga',35),(3533205,'Nova Independência',35),(3533254,'Novais',35),(3533304,'Nova Luzitânia',35),(3533403,'Nova Odessa',35),(3533502,'Novo Horizonte',35),(3533601,'Nuporanga',35),(3533700,'Ocauçu',35),(3533809,'Óleo',35),(3533908,'Olímpia',35),(3534005,'Onda Verde',35),(3534104,'Oriente',35),(3534203,'Orindiúva',35),(3534302,'Orlândia',35),(3534401,'Osasco',35),(3534500,'Oscar Bressane',35),(3534609,'Osvaldo Cruz',35),(3534708,'Ourinhos',35),(3534757,'Ouroeste',35),(3534807,'Ouro Verde',35),(3534906,'Pacaembu',35),(3535002,'Palestina',35),(3535101,'Palmares Paulista',35),(3535200,'Palmeira d\'Oeste',35),(3535309,'Palmital',35),(3535408,'Panorama',35),(3535507,'Paraguaçu Paulista',35),(3535606,'Paraibuna',35),(3535705,'Paraíso',35),(3535804,'Paranapanema',35),(3535903,'Paranapuã',35),(3536000,'Parapuã',35),(3536109,'Pardinho',35),(3536208,'Pariquera-Açu',35),(3536257,'Parisi',35),(3536307,'Patrocínio Paulista',35),(3536406,'Paulicéia',35),(3536505,'Paulínia',35),(3536570,'Paulistânia',35),(3536604,'Paulo de Faria',35),(3536703,'Pederneiras',35),(3536802,'Pedra Bela',35),(3536901,'Pedranópolis',35),(3537008,'Pedregulho',35),(3537107,'Pedreira',35),(3537156,'Pedrinhas Paulista',35),(3537206,'Pedro de Toledo',35),(3537305,'Penápolis',35),(3537404,'Pereira Barreto',35),(3537503,'Pereiras',35),(3537602,'Peruíbe',35),(3537701,'Piacatu',35),(3537800,'Piedade',35),(3537909,'Pilar do Sul',35),(3538006,'Pindamonhangaba',35),(3538105,'Pindorama',35),(3538204,'Pinhalzinho',35),(3538303,'Piquerobi',35),(3538501,'Piquete',35),(3538600,'Piracaia',35),(3538709,'Piracicaba',35),(3538808,'Piraju',35),(3538907,'Pirajuí',35),(3539004,'Pirangi',35),(3539103,'Pirapora do Bom Jesus',35),(3539202,'Pirapozinho',35),(3539301,'Pirassununga',35),(3539400,'Piratininga',35),(3539509,'Pitangueiras',35),(3539608,'Planalto',35),(3539707,'Platina',35),(3539806,'Poá',35),(3539905,'Poloni',35),(3540002,'Pompéia',35),(3540101,'Pongaí',35),(3540200,'Pontal',35),(3540259,'Pontalinda',35),(3540309,'Pontes Gestal',35),(3540408,'Populina',35),(3540507,'Porangaba',35),(3540606,'Porto Feliz',35),(3540705,'Porto Ferreira',35),(3540754,'Potim',35),(3540804,'Potirendaba',35),(3540853,'Pracinha',35),(3540903,'Pradópolis',35),(3541000,'Praia Grande',35),(3541059,'Pratânia',35),(3541109,'Presidente Alves',35),(3541208,'Presidente Bernardes',35),(3541307,'Presidente Epitácio',35),(3541406,'Presidente Prudente',35),(3541505,'Presidente Venceslau',35),(3541604,'Promissão',35),(3541653,'Quadra',35),(3541703,'Quatá',35),(3541802,'Queiroz',35),(3541901,'Queluz',35),(3542008,'Quintana',35),(3542107,'Rafard',35),(3542206,'Rancharia',35),(3542305,'Redenção da Serra',35),(3542404,'Regente Feijó',35),(3542503,'Reginópolis',35),(3542602,'Registro',35),(3542701,'Restinga',35),(3542800,'Ribeira',35),(3542909,'Ribeirão Bonito',35),(3543006,'Ribeirão Branco',35),(3543105,'Ribeirão Corrente',35),(3543204,'Ribeirão do Sul',35),(3543238,'Ribeirão dos Índios',35),(3543253,'Ribeirão Grande',35),(3543303,'Ribeirão Pires',35),(3543402,'Ribeirão Preto',35),(3543501,'Riversul',35),(3543600,'Rifaina',35),(3543709,'Rincão',35),(3543808,'Rinópolis',35),(3543907,'Rio Claro',35),(3544004,'Rio das Pedras',35),(3544103,'Rio Grande da Serra',35),(3544202,'Riolândia',35),(3544251,'Rosana',35),(3544301,'Roseira',35),(3544400,'Rubiácea',35),(3544509,'Rubinéia',35),(3544608,'Sabino',35),(3544707,'Sagres',35),(3544806,'Sales',35),(3544905,'Sales Oliveira',35),(3545001,'Salesópolis',35),(3545100,'Salmourão',35),(3545159,'Saltinho',35),(3545209,'Salto',35),(3545308,'Salto de Pirapora',35),(3545407,'Salto Grande',35),(3545506,'Sandovalina',35),(3545605,'Santa Adélia',35),(3545704,'Santa Albertina',35),(3545803,'Santa Bárbara d\'Oeste',35),(3546009,'Santa Branca',35),(3546108,'Santa Clara d\'Oeste',35),(3546207,'Santa Cruz da Conceição',35),(3546256,'Santa Cruz da Esperança',35),(3546306,'Santa Cruz das Palmeiras',35),(3546405,'Santa Cruz do Rio Pardo',35),(3546504,'Santa Ernestina',35),(3546603,'Santa Fé do Sul',35),(3546702,'Santa Gertrudes',35),(3546801,'Santa Isabel',35),(3546900,'Santa Lúcia',35),(3547007,'Santa Maria da Serra',35),(3547106,'Santa Mercedes',35),(3547205,'Santana da Ponte Pensa',35),(3547304,'Santana de Parnaíba',35),(3547403,'Santa Rita d\'Oeste',35),(3547502,'Santa Rita do Passa Quatro',35),(3547601,'Santa Rosa de Viterbo',35),(3547650,'Santa Salete',35),(3547700,'Santo Anastácio',35),(3547809,'Santo André',35),(3547908,'Santo Antônio da Alegria',35),(3548005,'Santo Antônio de Posse',35),(3548054,'Santo Antônio do Aracanguá',35),(3548104,'Santo Antônio do Jardim',35),(3548203,'Santo Antônio do Pinhal',35),(3548302,'Santo Expedito',35),(3548401,'Santópolis do Aguapeí',35),(3548500,'Santos',35),(3548609,'São Bento do Sapucaí',35),(3548708,'São Bernardo do Campo',35),(3548807,'São Caetano do Sul',35),(3548906,'São Carlos',35),(3549003,'São Francisco',35),(3549102,'São João da Boa Vista',35),(3549201,'São João das Duas Pontes',35),(3549250,'São João de Iracema',35),(3549300,'São João do Pau d\'Alho',35),(3549409,'São Joaquim da Barra',35),(3549508,'São José da Bela Vista',35),(3549607,'São José do Barreiro',35),(3549706,'São José do Rio Pardo',35),(3549805,'São José do Rio Preto',35),(3549904,'São José dos Campos',35),(3549953,'São Lourenço da Serra',35),(3550001,'São Luiz do Paraitinga',35),(3550100,'São Manuel',35),(3550209,'São Miguel Arcanjo',35),(3550308,'São Paulo',35),(3550407,'São Pedro',35),(3550506,'São Pedro do Turvo',35),(3550605,'São Roque',35),(3550704,'São Sebastião',35),(3550803,'São Sebastião da Grama',35),(3550902,'São Simão',35),(3551009,'São Vicente',35),(3551108,'Sarapuí',35),(3551207,'Sarutaiá',35),(3551306,'Sebastianópolis do Sul',35),(3551405,'Serra Azul',35),(3551504,'Serrana',35),(3551603,'Serra Negra',35),(3551702,'Sertãozinho',35),(3551801,'Sete Barras',35),(3551900,'Severínia',35),(3552007,'Silveiras',35),(3552106,'Socorro',35),(3552205,'Sorocaba',35),(3552304,'Sud Mennucci',35),(3552403,'Sumaré',35),(3552502,'Suzano',35),(3552551,'Suzanápolis',35),(3552601,'Tabapuã',35),(3552700,'Tabatinga',35),(3552809,'Taboão da Serra',35),(3552908,'Taciba',35),(3553005,'Taguaí',35),(3553104,'Taiaçu',35),(3553203,'Taiúva',35),(3553302,'Tambaú',35),(3553401,'Tanabi',35),(3553500,'Tapiraí',35),(3553609,'Tapiratiba',35),(3553658,'Taquaral',35),(3553708,'Taquaritinga',35),(3553807,'Taquarituba',35),(3553856,'Taquarivaí',35),(3553906,'Tarabai',35),(3553955,'Tarumã',35),(3554003,'Tatuí',35),(3554102,'Taubaté',35),(3554201,'Tejupá',35),(3554300,'Teodoro Sampaio',35),(3554409,'Terra Roxa',35),(3554508,'Tietê',35),(3554607,'Timburi',35),(3554656,'Torre de Pedra',35),(3554706,'Torrinha',35),(3554755,'Trabiju',35),(3554805,'Tremembé',35),(3554904,'Três Fronteiras',35),(3554953,'Tuiuti',35),(3555000,'Tupã',35),(3555109,'Tupi Paulista',35),(3555208,'Turiúba',35),(3555307,'Turmalina',35),(3555356,'Ubarana',35),(3555406,'Ubatuba',35),(3555505,'Ubirajara',35),(3555604,'Uchoa',35),(3555703,'União Paulista',35),(3555802,'Urânia',35),(3555901,'Uru',35),(3556008,'Urupês',35),(3556107,'Valentim Gentil',35),(3556206,'Valinhos',35),(3556305,'Valparaíso',35),(3556354,'Vargem',35),(3556404,'Vargem Grande do Sul',35),(3556453,'Vargem Grande Paulista',35),(3556503,'Várzea Paulista',35),(3556602,'Vera Cruz',35),(3556701,'Vinhedo',35),(3556800,'Viradouro',35),(3556909,'Vista Alegre do Alto',35),(3556958,'Vitória Brasil',35),(3557006,'Votorantim',35),(3557105,'Votuporanga',35),(3557154,'Zacarias',35),(3557204,'Chavantes',35),(3557303,'Estiva Gerbi',35);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operacao`
--

DROP TABLE IF EXISTS `operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operacao` (
  `COD_OPERACAO` int(11) NOT NULL AUTO_INCREMENT,
  `DTA_OPERACAO` datetime DEFAULT NULL,
  `COD_NOTA_FISCAL` varchar(30) DEFAULT NULL,
  `VLR_TOTAL` decimal(10,2) DEFAULT NULL,
  `QTD_PARCELA` int(11) DEFAULT NULL,
  `TPO_STATUS` enum('P','O') DEFAULT NULL COMMENT 'P - pedido (compra ou venda); O - orçamento\\n',
  `COD_PESSOA` int(11) DEFAULT NULL,
  `FLG_PAGO` tinyint(4) DEFAULT NULL,
  `TPO_OPERACAO` enum('C','V') DEFAULT NULL COMMENT 'C - Compra; V - Venda',
  PRIMARY KEY (`COD_OPERACAO`),
  KEY `FK_OPERACAO_PESSOA_idx` (`COD_PESSOA`),
  CONSTRAINT `FK_OPERACAO_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operacao`
--

LOCK TABLES `operacao` WRITE;
/*!40000 ALTER TABLE `operacao` DISABLE KEYS */;
INSERT INTO `operacao` VALUES (2,'2021-11-02 19:52:17','265546132456',25.00,1,'P',9,1,'C'),(3,'2021-05-02 19:52:17','265546132456',10.00,2,'P',13,0,'V'),(4,'2021-05-02 19:52:17','265546132456',10.00,2,'P',13,0,'V');
/*!40000 ALTER TABLE `operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento_operacao`
--

DROP TABLE IF EXISTS `pagamento_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento_operacao` (
  `COD_PAGAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `VLR_PAGAMENTO` decimal(10,2) DEFAULT NULL,
  `DTA_PAGAMENTO` date DEFAULT NULL,
  `DTA_VENCIMENTO` date DEFAULT NULL,
  `COD_OPERACAO` int(11) NOT NULL,
  `COD_TIPO_PAGAMENTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PAGAMENTO`),
  KEY `FK_PARCELA_COMPRA_IDX` (`COD_OPERACAO`),
  KEY `FK_TIPO_PAGAMENTO_OPERACAO__idx` (`COD_TIPO_PAGAMENTO`),
  CONSTRAINT `FK_PARCELA_COMPRA` FOREIGN KEY (`COD_OPERACAO`) REFERENCES `operacao` (`COD_OPERACAO`),
  CONSTRAINT `FK_TIPO_PAGAMENTO_OPERACAO_` FOREIGN KEY (`COD_TIPO_PAGAMENTO`) REFERENCES `tipo_pagamento` (`COD_TIPO_PAGAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento_operacao`
--

LOCK TABLES `pagamento_operacao` WRITE;
/*!40000 ALTER TABLE `pagamento_operacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa` (
  `COD_PESSOA` int(11) NOT NULL AUTO_INCREMENT,
  `NME_PESSOA` varchar(45) NOT NULL,
  PRIMARY KEY (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (9,'Mauricio de Souza'),(13,'AMERICANAS');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_fisica`
--

DROP TABLE IF EXISTS `pessoa_fisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_fisica` (
  `COD_PESSOA` int(11) NOT NULL AUTO_INCREMENT,
  `SGL_UF_NATURALIDADE` char(2) DEFAULT NULL,
  `DTA_NASCIMENTO` date NOT NULL,
  `TPO_SEXO` char(1) DEFAULT NULL COMMENT 'M - MASCULINO; F - FEMININO; N - NEUTRO',
  PRIMARY KEY (`COD_PESSOA`),
  KEY `FK_PESSOA_FISICA_PESSOA_IDX` (`COD_PESSOA`),
  CONSTRAINT `FK_PESSOA_FISICA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_fisica`
--

LOCK TABLES `pessoa_fisica` WRITE;
/*!40000 ALTER TABLE `pessoa_fisica` DISABLE KEYS */;
INSERT INTO `pessoa_fisica` VALUES (9,'SP','1980-10-31','M');
/*!40000 ALTER TABLE `pessoa_fisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa_juridica`
--

DROP TABLE IF EXISTS `pessoa_juridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoa_juridica` (
  `COD_PESSOA` int(11) NOT NULL AUTO_INCREMENT,
  `NME_RAZAO_SOCIAL` varchar(200) NOT NULL,
  `COD_CNPJ` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`COD_PESSOA`),
  KEY `FK_PESSOA_JURIDICA_PESSOA_IDX` (`COD_PESSOA`),
  CONSTRAINT `FK_PESSOA_JURIDICA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa_juridica`
--

LOCK TABLES `pessoa_juridica` WRITE;
/*!40000 ALTER TABLE `pessoa_juridica` DISABLE KEYS */;
INSERT INTO `pessoa_juridica` VALUES (13,'LAME4','0254578123/0001-37');
/*!40000 ALTER TABLE `pessoa_juridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `COD_PRODUTO` int(11) NOT NULL AUTO_INCREMENT,
  `NME_PRODUTO` varchar(95) DEFAULT NULL,
  `DSC_PRODUTO` varchar(255) DEFAULT NULL,
  `COD_SUBCATEGORIA` int(11) DEFAULT NULL,
  `COD_UNIDADE_MEDIDA` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PRODUTO`),
  KEY `FK_PRODUTO_SUBCATEGORIA_IDX` (`COD_SUBCATEGORIA`),
  KEY `FK_PRODUTO_UNIDADE_MEDIDA_IDX` (`COD_UNIDADE_MEDIDA`),
  CONSTRAINT `FK_PRODUTO_SUBCATEGORIA` FOREIGN KEY (`COD_SUBCATEGORIA`) REFERENCES `subcategoria` (`COD_SUBCATEGORIA`),
  CONSTRAINT `FK_PRODUTO_UNIDADE_MEDIDA` FOREIGN KEY (`COD_UNIDADE_MEDIDA`) REFERENCES `unidade_medida` (`COD_UNIDADE_MEDIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=216546535 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (216546521,'Carrinho de controle remoto Hotweels SJ23','Hotwells',1,1),(216546522,'Boneca Barbie','Boneca Barbie Princesas edição especial KIS34',2,2),(216546523,'Caixa de Som Sem fio','Caixa de som Sem fio JBL q10',3,2),(216546524,'Caneta BIC','Caneta BIC preta ',15,2),(216546525,'Case com anel Moto G','Case com Anel Moto G Preto',4,2),(216546526,'Case com anel Moto G','Case com Anel Moto G Amarelo',4,2),(216546527,'Case com anel Moto G','Case com Anel Moto G Verde',4,2),(216546528,'Caderno 20 matérias','Caderno espiral capa dura Jandaia',12,2),(216546529,'Caderno 20 matérias','Caderno espiral capa dura Tilibra',12,2),(216546530,'Tenis Nike','Tenis Nike JJDASIUN2',9,2),(216546532,'Carrinho de controle remoto Hotweels SJ23','Hotwells',1,1),(216546533,'Carrinho de controle remoto Hotweels SJ23','Hotwells',1,1),(216546534,'Carrinho de controle remoto Hotweels SJ23','Hotwells',1,1);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategoria`
--

DROP TABLE IF EXISTS `subcategoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategoria` (
  `COD_SUBCATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `NME_SUBCATEGORIA` varchar(95) DEFAULT NULL,
  `COD_CATEGORIA` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_SUBCATEGORIA`),
  KEY `FK_SUBCATEGORIA_CATEGORA_IDX` (`COD_CATEGORIA`),
  CONSTRAINT `FK_SUBCATEGORIA_CATEGORA` FOREIGN KEY (`COD_CATEGORIA`) REFERENCES `categoria` (`COD_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategoria`
--

LOCK TABLES `subcategoria` WRITE;
/*!40000 ALTER TABLE `subcategoria` DISABLE KEYS */;
INSERT INTO `subcategoria` VALUES (1,'Carinho',1),(2,'Boneca',1),(3,'Receptor wifi',3),(4,'Case para celular',2),(5,'Case para notebook',2),(6,'Mouse',3),(7,'Teclado',3),(8,'Receptor Wireless',3),(9,'TENIS',NULL),(10,'TENIS',NULL),(11,'TENIS',NULL),(12,'CADERNO',3),(13,'Régua',5),(14,'Lápis',5),(15,'Caneta',5),(16,'Estojo',5),(17,'Guarda-chuva',8),(18,'Fralda',7),(19,'Mamadeira',7),(20,'Suporte Notebook',6),(21,'Grampeador',6),(23,'TENIS',NULL);
/*!40000 ALTER TABLE `subcategoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pagamento`
--

DROP TABLE IF EXISTS `tipo_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pagamento` (
  `COD_TIPO_PAGAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `NME_TIPO_PAGAMENTO` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`COD_TIPO_PAGAMENTO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pagamento`
--

LOCK TABLES `tipo_pagamento` WRITE;
/*!40000 ALTER TABLE `tipo_pagamento` DISABLE KEYS */;
INSERT INTO `tipo_pagamento` VALUES (1,'Dinheiro'),(2,'Débito'),(3,'Crédito'),(4,'PIX'),(6,'Btc');
/*!40000 ALTER TABLE `tipo_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_medida`
--

DROP TABLE IF EXISTS `unidade_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_medida` (
  `COD_UNIDADE_MEDIDA` int(11) NOT NULL AUTO_INCREMENT,
  `NME_UNIDADE_MEDIDA` varchar(100) DEFAULT NULL,
  `SGL_UNIDADE_MEDIDA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`COD_UNIDADE_MEDIDA`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_medida`
--

LOCK TABLES `unidade_medida` WRITE;
/*!40000 ALTER TABLE `unidade_medida` DISABLE KEYS */;
INSERT INTO `unidade_medida` VALUES (1,'Peça','Pc'),(2,'Unidade','Un'),(3,'Quilograma','Kg'),(4,'Caixa','Cx'),(5,'Grama de Onça','Oz'),(6,'Litro','l'),(8,'Copo','cp');
/*!40000 ALTER TABLE `unidade_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `COD_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `DSC_LOGIN` varchar(20) DEFAULT NULL,
  `DSC_SENHA` varchar(128) DEFAULT NULL,
  `FLG_ATIVO` tinyint(4) DEFAULT NULL,
  `COD_PESSOA` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_USUARIO`),
  UNIQUE KEY `DSC_LOGIN_UNIQUE` (`DSC_LOGIN`),
  KEY `FK_USUARIO_PESSOA` (`COD_PESSOA`),
  CONSTRAINT `FK_USUARIO_PESSOA` FOREIGN KEY (`COD_PESSOA`) REFERENCES `pessoa` (`COD_PESSOA`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (6,'string','$2a$10$fGU1HL8dGRdzV2fbHUNLn.3NfgTyGfoq7OHrZqjnhBvp9dAJyybxe',1,NULL),(9,'TESTE CAD','$2a$10$q3XRJNoPbRTCE/eigWdy2u3vnhLmJlg.O/PUW2iD0ape4GBh9AjK.',1,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-07 22:39:42
