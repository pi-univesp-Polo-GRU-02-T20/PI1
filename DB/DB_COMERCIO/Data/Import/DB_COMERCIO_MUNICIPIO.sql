-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: DB_COMERCIO
-- ------------------------------------------------------
-- Server version	5.7.35

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
-- Dumping data for table `MUNICIPIO`
--

LOCK TABLES `MUNICIPIO` WRITE;
/*!40000 ALTER TABLE `MUNICIPIO` DISABLE KEYS */;
INSERT INTO `MUNICIPIO` VALUES (3500105,'Adamantina',35),(3500204,'Adolfo',35),(3500303,'Aguaí',35),(3500402,'Águas da Prata',35),(3500501,'Águas de Lindóia',35),(3500550,'Águas de Santa Bárbara',35),(3500600,'Águas de São Pedro',35),(3500709,'Agudos',35),(3500758,'Alambari',35),(3500808,'Alfredo Marcondes',35),(3500907,'Altair',35),(3501004,'Altinópolis',35),(3501103,'Alto Alegre',35),(3501152,'Alumínio',35),(3501202,'Álvares Florence',35),(3501301,'Álvares Machado',35),(3501400,'Álvaro de Carvalho',35),(3501509,'Alvinlândia',35),(3501608,'Americana',35),(3501707,'Américo Brasiliense',35),(3501806,'Américo de Campos',35),(3501905,'Amparo',35),(3502002,'Analândia',35),(3502101,'Andradina',35),(3502200,'Angatuba',35),(3502309,'Anhembi',35),(3502408,'Anhumas',35),(3502507,'Aparecida',35),(3502606,'Aparecida d\'Oeste',35),(3502705,'Apiaí',35),(3502754,'Araçariguama',35),(3502804,'Araçatuba',35),(3502903,'Araçoiaba da Serra',35),(3503000,'Aramina',35),(3503109,'Arandu',35),(3503158,'Arapeí',35),(3503208,'Araraquara',35),(3503307,'Araras',35),(3503356,'Arco-Íris',35),(3503406,'Arealva',35),(3503505,'Areias',35),(3503604,'Areiópolis',35),(3503703,'Ariranha',35),(3503802,'Artur Nogueira',35),(3503901,'Arujá',35),(3503950,'Aspásia',35),(3504008,'Assis',35),(3504107,'Atibaia',35),(3504206,'Auriflama',35),(3504305,'Avaí',35),(3504404,'Avanhandava',35),(3504503,'Avaré',35),(3504602,'Bady Bassitt',35),(3504701,'Balbinos',35),(3504800,'Bálsamo',35),(3504909,'Bananal',35),(3505005,'Barão de Antonina',35),(3505104,'Barbosa',35),(3505203,'Bariri',35),(3505302,'Barra Bonita',35),(3505351,'Barra do Chapéu',35),(3505401,'Barra do Turvo',35),(3505500,'Barretos',35),(3505609,'Barrinha',35),(3505708,'Barueri',35),(3505807,'Bastos',35),(3505906,'Batatais',35),(3506003,'Bauru',35),(3506102,'Bebedouro',35),(3506201,'Bento de Abreu',35),(3506300,'Bernardino de Campos',35),(3506359,'Bertioga',35),(3506409,'Bilac',35),(3506508,'Birigui',35),(3506607,'Biritiba Mirim',35),(3506706,'Boa Esperança do Sul',35),(3506805,'Bocaina',35),(3506904,'Bofete',35),(3507001,'Boituva',35),(3507100,'Bom Jesus dos Perdões',35),(3507159,'Bom Sucesso de Itararé',35),(3507209,'Borá',35),(3507308,'Boracéia',35),(3507407,'Borborema',35),(3507456,'Borebi',35),(3507506,'Botucatu',35),(3507605,'Bragança Paulista',35),(3507704,'Braúna',35),(3507753,'Brejo Alegre',35),(3507803,'Brodowski',35),(3507902,'Brotas',35),(3508009,'Buri',35),(3508108,'Buritama',35),(3508207,'Buritizal',35),(3508306,'Cabrália Paulista',35),(3508405,'Cabreúva',35),(3508504,'Caçapava',35),(3508603,'Cachoeira Paulista',35),(3508702,'Caconde',35),(3508801,'Cafelândia',35),(3508900,'Caiabu',35),(3509007,'Caieiras',35),(3509106,'Caiuá',35),(3509205,'Cajamar',35),(3509254,'Cajati',35),(3509304,'Cajobi',35),(3509403,'Cajuru',35),(3509452,'Campina do Monte Alegre',35),(3509502,'Campinas',35),(3509601,'Campo Limpo Paulista',35),(3509700,'Campos do Jordão',35),(3509809,'Campos Novos Paulista',35),(3509908,'Cananéia',35),(3509957,'Canas',35),(3510005,'Cândido Mota',35),(3510104,'Cândido Rodrigues',35),(3510153,'Canitar',35),(3510203,'Capão Bonito',35),(3510302,'Capela do Alto',35),(3510401,'Capivari',35),(3510500,'Caraguatatuba',35),(3510609,'Carapicuíba',35),(3510708,'Cardoso',35),(3510807,'Casa Branca',35),(3510906,'Cássia dos Coqueiros',35),(3511003,'Castilho',35),(3511102,'Catanduva',35),(3511201,'Catiguá',35),(3511300,'Cedral',35),(3511409,'Cerqueira César',35),(3511508,'Cerquilho',35),(3511607,'Cesário Lange',35),(3511706,'Charqueada',35),(3511904,'Clementina',35),(3512001,'Colina',35),(3512100,'Colômbia',35),(3512209,'Conchal',35),(3512308,'Conchas',35),(3512407,'Cordeirópolis',35),(3512506,'Coroados',35),(3512605,'Coronel Macedo',35),(3512704,'Corumbataí',35),(3512803,'Cosmópolis',35),(3512902,'Cosmorama',35),(3513009,'Cotia',35),(3513108,'Cravinhos',35),(3513207,'Cristais Paulista',35),(3513306,'Cruzália',35),(3513405,'Cruzeiro',35),(3513504,'Cubatão',35),(3513603,'Cunha',35),(3513702,'Descalvado',35),(3513801,'Diadema',35),(3513850,'Dirce Reis',35),(3513900,'Divinolândia',35),(3514007,'Dobrada',35),(3514106,'Dois Córregos',35),(3514205,'Dolcinópolis',35),(3514304,'Dourado',35),(3514403,'Dracena',35),(3514502,'Duartina',35),(3514601,'Dumont',35),(3514700,'Echaporã',35),(3514809,'Eldorado',35),(3514908,'Elias Fausto',35),(3514924,'Elisiário',35),(3514957,'Embaúba',35),(3515004,'Embu das Artes',35),(3515103,'Embu-Guaçu',35),(3515129,'Emilianópolis',35),(3515152,'Engenheiro Coelho',35),(3515186,'Espírito Santo do Pinhal',35),(3515194,'Espírito Santo do Turvo',35),(3515202,'Estrela d\'Oeste',35),(3515301,'Estrela do Norte',35),(3515350,'Euclides da Cunha Paulista',35),(3515400,'Fartura',35),(3515509,'Fernandópolis',35),(3515608,'Fernando Prestes',35),(3515657,'Fernão',35),(3515707,'Ferraz de Vasconcelos',35),(3515806,'Flora Rica',35),(3515905,'Floreal',35),(3516002,'Flórida Paulista',35),(3516101,'Florínea',35),(3516200,'Franca',35),(3516309,'Francisco Morato',35),(3516408,'Franco da Rocha',35),(3516507,'Gabriel Monteiro',35),(3516606,'Gália',35),(3516705,'Garça',35),(3516804,'Gastão Vidigal',35),(3516853,'Gavião Peixoto',35),(3516903,'General Salgado',35),(3517000,'Getulina',35),(3517109,'Glicério',35),(3517208,'Guaiçara',35),(3517307,'Guaimbê',35),(3517406,'Guaíra',35),(3517505,'Guapiaçu',35),(3517604,'Guapiara',35),(3517703,'Guará',35),(3517802,'Guaraçaí',35),(3517901,'Guaraci',35),(3518008,'Guarani d\'Oeste',35),(3518107,'Guarantã',35),(3518206,'Guararapes',35),(3518305,'Guararema',35),(3518404,'Guaratinguetá',35),(3518503,'Guareí',35),(3518602,'Guariba',35),(3518701,'Guarujá',35),(3518800,'Guarulhos',35),(3518859,'Guatapará',35),(3518909,'Guzolândia',35),(3519006,'Herculândia',35),(3519055,'Holambra',35),(3519071,'Hortolândia',35),(3519105,'Iacanga',35),(3519204,'Iacri',35),(3519253,'Iaras',35),(3519303,'Ibaté',35),(3519402,'Ibirá',35),(3519501,'Ibirarema',35),(3519600,'Ibitinga',35),(3519709,'Ibiúna',35),(3519808,'Icém',35),(3519907,'Iepê',35),(3520004,'Igaraçu do Tietê',35),(3520103,'Igarapava',35),(3520202,'Igaratá',35),(3520301,'Iguape',35),(3520400,'Ilhabela',35),(3520426,'Ilha Comprida',35),(3520442,'Ilha Solteira',35),(3520509,'Indaiatuba',35),(3520608,'Indiana',35),(3520707,'Indiaporã',35),(3520806,'Inúbia Paulista',35),(3520905,'Ipaussu',35),(3521002,'Iperó',35),(3521101,'Ipeúna',35),(3521150,'Ipiguá',35),(3521200,'Iporanga',35),(3521309,'Ipuã',35),(3521408,'Iracemápolis',35),(3521507,'Irapuã',35),(3521606,'Irapuru',35),(3521705,'Itaberá',35),(3521804,'Itaí',35),(3521903,'Itajobi',35),(3522000,'Itaju',35),(3522109,'Itanhaém',35),(3522158,'Itaoca',35),(3522208,'Itapecerica da Serra',35),(3522307,'Itapetininga',35),(3522406,'Itapeva',35),(3522505,'Itapevi',35),(3522604,'Itapira',35),(3522653,'Itapirapuã Paulista',35),(3522703,'Itápolis',35),(3522802,'Itaporanga',35),(3522901,'Itapuí',35),(3523008,'Itapura',35),(3523107,'Itaquaquecetuba',35),(3523206,'Itararé',35),(3523305,'Itariri',35),(3523404,'Itatiba',35),(3523503,'Itatinga',35),(3523602,'Itirapina',35),(3523701,'Itirapuã',35),(3523800,'Itobi',35),(3523909,'Itu',35),(3524006,'Itupeva',35),(3524105,'Ituverava',35),(3524204,'Jaborandi',35),(3524303,'Jaboticabal',35),(3524402,'Jacareí',35),(3524501,'Jaci',35),(3524600,'Jacupiranga',35),(3524709,'Jaguariúna',35),(3524808,'Jales',35),(3524907,'Jambeiro',35),(3525003,'Jandira',35),(3525102,'Jardinópolis',35),(3525201,'Jarinu',35),(3525300,'Jaú',35),(3525409,'Jeriquara',35),(3525508,'Joanópolis',35),(3525607,'João Ramalho',35),(3525706,'José Bonifácio',35),(3525805,'Júlio Mesquita',35),(3525854,'Jumirim',35),(3525904,'Jundiaí',35),(3526001,'Junqueirópolis',35),(3526100,'Juquiá',35),(3526209,'Juquitiba',35),(3526308,'Lagoinha',35),(3526407,'Laranjal Paulista',35),(3526506,'Lavínia',35),(3526605,'Lavrinhas',35),(3526704,'Leme',35),(3526803,'Lençóis Paulista',35),(3526902,'Limeira',35),(3527009,'Lindóia',35),(3527108,'Lins',35),(3527207,'Lorena',35),(3527256,'Lourdes',35),(3527306,'Louveira',35),(3527405,'Lucélia',35),(3527504,'Lucianópolis',35),(3527603,'Luís Antônio',35),(3527702,'Luiziânia',35),(3527801,'Lupércio',35),(3527900,'Lutécia',35),(3528007,'Macatuba',35),(3528106,'Macaubal',35),(3528205,'Macedônia',35),(3528304,'Magda',35),(3528403,'Mairinque',35),(3528502,'Mairiporã',35),(3528601,'Manduri',35),(3528700,'Marabá Paulista',35),(3528809,'Maracaí',35),(3528858,'Marapoama',35),(3528908,'Mariápolis',35),(3529005,'Marília',35),(3529104,'Marinópolis',35),(3529203,'Martinópolis',35),(3529302,'Matão',35),(3529401,'Mauá',35),(3529500,'Mendonça',35),(3529609,'Meridiano',35),(3529658,'Mesópolis',35),(3529708,'Miguelópolis',35),(3529807,'Mineiros do Tietê',35),(3529906,'Miracatu',35),(3530003,'Mira Estrela',35),(3530102,'Mirandópolis',35),(3530201,'Mirante do Paranapanema',35),(3530300,'Mirassol',35),(3530409,'Mirassolândia',35),(3530508,'Mococa',35),(3530607,'Mogi das Cruzes',35),(3530706,'Mogi Guaçu',35),(3530805,'Mogi Mirim',35),(3530904,'Mombuca',35),(3531001,'Monções',35),(3531100,'Mongaguá',35),(3531209,'Monte Alegre do Sul',35),(3531308,'Monte Alto',35),(3531407,'Monte Aprazível',35),(3531506,'Monte Azul Paulista',35),(3531605,'Monte Castelo',35),(3531704,'Monteiro Lobato',35),(3531803,'Monte Mor',35),(3531902,'Morro Agudo',35),(3532009,'Morungaba',35),(3532058,'Motuca',35),(3532108,'Murutinga do Sul',35),(3532157,'Nantes',35),(3532207,'Narandiba',35),(3532306,'Natividade da Serra',35),(3532405,'Nazaré Paulista',35),(3532504,'Neves Paulista',35),(3532603,'Nhandeara',35),(3532702,'Nipoã',35),(3532801,'Nova Aliança',35),(3532827,'Nova Campina',35),(3532843,'Nova Canaã Paulista',35),(3532868,'Nova Castilho',35),(3532900,'Nova Europa',35),(3533007,'Nova Granada',35),(3533106,'Nova Guataporanga',35),(3533205,'Nova Independência',35),(3533254,'Novais',35),(3533304,'Nova Luzitânia',35),(3533403,'Nova Odessa',35),(3533502,'Novo Horizonte',35),(3533601,'Nuporanga',35),(3533700,'Ocauçu',35),(3533809,'Óleo',35),(3533908,'Olímpia',35),(3534005,'Onda Verde',35),(3534104,'Oriente',35),(3534203,'Orindiúva',35),(3534302,'Orlândia',35),(3534401,'Osasco',35),(3534500,'Oscar Bressane',35),(3534609,'Osvaldo Cruz',35),(3534708,'Ourinhos',35),(3534757,'Ouroeste',35),(3534807,'Ouro Verde',35),(3534906,'Pacaembu',35),(3535002,'Palestina',35),(3535101,'Palmares Paulista',35),(3535200,'Palmeira d\'Oeste',35),(3535309,'Palmital',35),(3535408,'Panorama',35),(3535507,'Paraguaçu Paulista',35),(3535606,'Paraibuna',35),(3535705,'Paraíso',35),(3535804,'Paranapanema',35),(3535903,'Paranapuã',35),(3536000,'Parapuã',35),(3536109,'Pardinho',35),(3536208,'Pariquera-Açu',35),(3536257,'Parisi',35),(3536307,'Patrocínio Paulista',35),(3536406,'Paulicéia',35),(3536505,'Paulínia',35),(3536570,'Paulistânia',35),(3536604,'Paulo de Faria',35),(3536703,'Pederneiras',35),(3536802,'Pedra Bela',35),(3536901,'Pedranópolis',35),(3537008,'Pedregulho',35),(3537107,'Pedreira',35),(3537156,'Pedrinhas Paulista',35),(3537206,'Pedro de Toledo',35),(3537305,'Penápolis',35),(3537404,'Pereira Barreto',35),(3537503,'Pereiras',35),(3537602,'Peruíbe',35),(3537701,'Piacatu',35),(3537800,'Piedade',35),(3537909,'Pilar do Sul',35),(3538006,'Pindamonhangaba',35),(3538105,'Pindorama',35),(3538204,'Pinhalzinho',35),(3538303,'Piquerobi',35),(3538501,'Piquete',35),(3538600,'Piracaia',35),(3538709,'Piracicaba',35),(3538808,'Piraju',35),(3538907,'Pirajuí',35),(3539004,'Pirangi',35),(3539103,'Pirapora do Bom Jesus',35),(3539202,'Pirapozinho',35),(3539301,'Pirassununga',35),(3539400,'Piratininga',35),(3539509,'Pitangueiras',35),(3539608,'Planalto',35),(3539707,'Platina',35),(3539806,'Poá',35),(3539905,'Poloni',35),(3540002,'Pompéia',35),(3540101,'Pongaí',35),(3540200,'Pontal',35),(3540259,'Pontalinda',35),(3540309,'Pontes Gestal',35),(3540408,'Populina',35),(3540507,'Porangaba',35),(3540606,'Porto Feliz',35),(3540705,'Porto Ferreira',35),(3540754,'Potim',35),(3540804,'Potirendaba',35),(3540853,'Pracinha',35),(3540903,'Pradópolis',35),(3541000,'Praia Grande',35),(3541059,'Pratânia',35),(3541109,'Presidente Alves',35),(3541208,'Presidente Bernardes',35),(3541307,'Presidente Epitácio',35),(3541406,'Presidente Prudente',35),(3541505,'Presidente Venceslau',35),(3541604,'Promissão',35),(3541653,'Quadra',35),(3541703,'Quatá',35),(3541802,'Queiroz',35),(3541901,'Queluz',35),(3542008,'Quintana',35),(3542107,'Rafard',35),(3542206,'Rancharia',35),(3542305,'Redenção da Serra',35),(3542404,'Regente Feijó',35),(3542503,'Reginópolis',35),(3542602,'Registro',35),(3542701,'Restinga',35),(3542800,'Ribeira',35),(3542909,'Ribeirão Bonito',35),(3543006,'Ribeirão Branco',35),(3543105,'Ribeirão Corrente',35),(3543204,'Ribeirão do Sul',35),(3543238,'Ribeirão dos Índios',35),(3543253,'Ribeirão Grande',35),(3543303,'Ribeirão Pires',35),(3543402,'Ribeirão Preto',35),(3543501,'Riversul',35),(3543600,'Rifaina',35),(3543709,'Rincão',35),(3543808,'Rinópolis',35),(3543907,'Rio Claro',35),(3544004,'Rio das Pedras',35),(3544103,'Rio Grande da Serra',35),(3544202,'Riolândia',35),(3544251,'Rosana',35),(3544301,'Roseira',35),(3544400,'Rubiácea',35),(3544509,'Rubinéia',35),(3544608,'Sabino',35),(3544707,'Sagres',35),(3544806,'Sales',35),(3544905,'Sales Oliveira',35),(3545001,'Salesópolis',35),(3545100,'Salmourão',35),(3545159,'Saltinho',35),(3545209,'Salto',35),(3545308,'Salto de Pirapora',35),(3545407,'Salto Grande',35),(3545506,'Sandovalina',35),(3545605,'Santa Adélia',35),(3545704,'Santa Albertina',35),(3545803,'Santa Bárbara d\'Oeste',35),(3546009,'Santa Branca',35),(3546108,'Santa Clara d\'Oeste',35),(3546207,'Santa Cruz da Conceição',35),(3546256,'Santa Cruz da Esperança',35),(3546306,'Santa Cruz das Palmeiras',35),(3546405,'Santa Cruz do Rio Pardo',35),(3546504,'Santa Ernestina',35),(3546603,'Santa Fé do Sul',35),(3546702,'Santa Gertrudes',35),(3546801,'Santa Isabel',35),(3546900,'Santa Lúcia',35),(3547007,'Santa Maria da Serra',35),(3547106,'Santa Mercedes',35),(3547205,'Santana da Ponte Pensa',35),(3547304,'Santana de Parnaíba',35),(3547403,'Santa Rita d\'Oeste',35),(3547502,'Santa Rita do Passa Quatro',35),(3547601,'Santa Rosa de Viterbo',35),(3547650,'Santa Salete',35),(3547700,'Santo Anastácio',35),(3547809,'Santo André',35),(3547908,'Santo Antônio da Alegria',35),(3548005,'Santo Antônio de Posse',35),(3548054,'Santo Antônio do Aracanguá',35),(3548104,'Santo Antônio do Jardim',35),(3548203,'Santo Antônio do Pinhal',35),(3548302,'Santo Expedito',35),(3548401,'Santópolis do Aguapeí',35),(3548500,'Santos',35),(3548609,'São Bento do Sapucaí',35),(3548708,'São Bernardo do Campo',35),(3548807,'São Caetano do Sul',35),(3548906,'São Carlos',35),(3549003,'São Francisco',35),(3549102,'São João da Boa Vista',35),(3549201,'São João das Duas Pontes',35),(3549250,'São João de Iracema',35),(3549300,'São João do Pau d\'Alho',35),(3549409,'São Joaquim da Barra',35),(3549508,'São José da Bela Vista',35),(3549607,'São José do Barreiro',35),(3549706,'São José do Rio Pardo',35),(3549805,'São José do Rio Preto',35),(3549904,'São José dos Campos',35),(3549953,'São Lourenço da Serra',35),(3550001,'São Luiz do Paraitinga',35),(3550100,'São Manuel',35),(3550209,'São Miguel Arcanjo',35),(3550308,'São Paulo',35),(3550407,'São Pedro',35),(3550506,'São Pedro do Turvo',35),(3550605,'São Roque',35),(3550704,'São Sebastião',35),(3550803,'São Sebastião da Grama',35),(3550902,'São Simão',35),(3551009,'São Vicente',35),(3551108,'Sarapuí',35),(3551207,'Sarutaiá',35),(3551306,'Sebastianópolis do Sul',35),(3551405,'Serra Azul',35),(3551504,'Serrana',35),(3551603,'Serra Negra',35),(3551702,'Sertãozinho',35),(3551801,'Sete Barras',35),(3551900,'Severínia',35),(3552007,'Silveiras',35),(3552106,'Socorro',35),(3552205,'Sorocaba',35),(3552304,'Sud Mennucci',35),(3552403,'Sumaré',35),(3552502,'Suzano',35),(3552551,'Suzanápolis',35),(3552601,'Tabapuã',35),(3552700,'Tabatinga',35),(3552809,'Taboão da Serra',35),(3552908,'Taciba',35),(3553005,'Taguaí',35),(3553104,'Taiaçu',35),(3553203,'Taiúva',35),(3553302,'Tambaú',35),(3553401,'Tanabi',35),(3553500,'Tapiraí',35),(3553609,'Tapiratiba',35),(3553658,'Taquaral',35),(3553708,'Taquaritinga',35),(3553807,'Taquarituba',35),(3553856,'Taquarivaí',35),(3553906,'Tarabai',35),(3553955,'Tarumã',35),(3554003,'Tatuí',35),(3554102,'Taubaté',35),(3554201,'Tejupá',35),(3554300,'Teodoro Sampaio',35),(3554409,'Terra Roxa',35),(3554508,'Tietê',35),(3554607,'Timburi',35),(3554656,'Torre de Pedra',35),(3554706,'Torrinha',35),(3554755,'Trabiju',35),(3554805,'Tremembé',35),(3554904,'Três Fronteiras',35),(3554953,'Tuiuti',35),(3555000,'Tupã',35),(3555109,'Tupi Paulista',35),(3555208,'Turiúba',35),(3555307,'Turmalina',35),(3555356,'Ubarana',35),(3555406,'Ubatuba',35),(3555505,'Ubirajara',35),(3555604,'Uchoa',35),(3555703,'União Paulista',35),(3555802,'Urânia',35),(3555901,'Uru',35),(3556008,'Urupês',35),(3556107,'Valentim Gentil',35),(3556206,'Valinhos',35),(3556305,'Valparaíso',35),(3556354,'Vargem',35),(3556404,'Vargem Grande do Sul',35),(3556453,'Vargem Grande Paulista',35),(3556503,'Várzea Paulista',35),(3556602,'Vera Cruz',35),(3556701,'Vinhedo',35),(3556800,'Viradouro',35),(3556909,'Vista Alegre do Alto',35),(3556958,'Vitória Brasil',35),(3557006,'Votorantim',35),(3557105,'Votuporanga',35),(3557154,'Zacarias',35),(3557204,'Chavantes',35),(3557303,'Estiva Gerbi',35);
/*!40000 ALTER TABLE `MUNICIPIO` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-02  0:57:33
