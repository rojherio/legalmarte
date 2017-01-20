-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: acreideiaslegalmarte
-- ------------------------------------------------------
-- Server version	5.5.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `acc_arvore`
--

DROP TABLE IF EXISTS `acc_arvore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_arvore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `nivel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_arvore`
--

LOCK TABLES `acc_arvore` WRITE;
/*!40000 ALTER TABLE `acc_arvore` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_arvore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_cliente`
--

DROP TABLE IF EXISTS `acc_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` int(11) NOT NULL,
  `acc_cliente_status_id` int(11) NOT NULL,
  `data_aprovado` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_cliente_acc_pessoa1_idx` (`acc_pessoa_id`),
  KEY `fk_acc_cliente_acc_cliente_status1_idx` (`acc_cliente_status_id`),
  CONSTRAINT `fk_acc_cliente_acc_cliente_status1` FOREIGN KEY (`acc_cliente_status_id`) REFERENCES `acc_cliente_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cliente`
--

LOCK TABLES `acc_cliente` WRITE;
/*!40000 ALTER TABLE `acc_cliente` DISABLE KEYS */;
INSERT INTO `acc_cliente` VALUES (2,2,1,NULL,0,'2016-07-27 03:51:01');
/*!40000 ALTER TABLE `acc_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_cliente_acomp`
--

DROP TABLE IF EXISTS `acc_cliente_acomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cliente_acomp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_cliente_id` int(11) NOT NULL,
  `acc_cliente_status_id_antes` int(11) NOT NULL,
  `acc_cliente_status_id_depois` int(11) NOT NULL,
  `titulo` varchar(240) NOT NULL,
  `descricao` text NOT NULL,
  `visualizada` int(11) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_cliente_acomp_acc_cliente1_idx` (`acc_cliente_id`),
  KEY `fk_acc_cliente_acomp_acc_cliente_status1_idx` (`acc_cliente_status_id_antes`),
  KEY `fk_acc_cliente_acomp_acc_cliente_status2_idx` (`acc_cliente_status_id_depois`),
  CONSTRAINT `fk_acc_cliente_acomp_acc_cliente1` FOREIGN KEY (`acc_cliente_id`) REFERENCES `acc_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_acomp_acc_cliente_status1` FOREIGN KEY (`acc_cliente_status_id_antes`) REFERENCES `acc_cliente_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_acomp_acc_cliente_status2` FOREIGN KEY (`acc_cliente_status_id_depois`) REFERENCES `acc_cliente_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cliente_acomp`
--

LOCK TABLES `acc_cliente_acomp` WRITE;
/*!40000 ALTER TABLE `acc_cliente_acomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_cliente_acomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_cliente_bancario`
--

DROP TABLE IF EXISTS `acc_cliente_bancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cliente_bancario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_cliente_id` int(11) NOT NULL,
  `bsc_banco_id` int(11) NOT NULL,
  `bsc_tipo_bancario_id` int(11) NOT NULL,
  `agencia` varchar(15) NOT NULL,
  `agencia_dv` varchar(2) NOT NULL,
  `conta` varchar(15) NOT NULL,
  `conta_dv` varchar(2) NOT NULL,
  `tipo_conta` int(11) NOT NULL,
  `variacao` varchar(3) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_cliente_bancario_acc_cliente1_idx` (`acc_cliente_id`),
  KEY `fk_acc_cliente_bancario_bsc_banco1_idx` (`bsc_banco_id`),
  KEY `fk_acc_cliente_bancario_bsc_tipo_bancario1_idx` (`bsc_tipo_bancario_id`),
  CONSTRAINT `fk_acc_cliente_bancario_acc_cliente1` FOREIGN KEY (`acc_cliente_id`) REFERENCES `acc_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_bancario_bsc_banco1` FOREIGN KEY (`bsc_banco_id`) REFERENCES `bsc_banco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_bancario_bsc_tipo_bancario1` FOREIGN KEY (`bsc_tipo_bancario_id`) REFERENCES `bsc_tipo_bancario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cliente_bancario`
--

LOCK TABLES `acc_cliente_bancario` WRITE;
/*!40000 ALTER TABLE `acc_cliente_bancario` DISABLE KEYS */;
INSERT INTO `acc_cliente_bancario` VALUES (1,2,2,1,'2358','2','48554','3',1,'',0,NULL);
/*!40000 ALTER TABLE `acc_cliente_bancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_cliente_ponto`
--

DROP TABLE IF EXISTS `acc_cliente_ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cliente_ponto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_cliente_id` int(11) NOT NULL,
  `acc_operacao_id` int(11) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_cliente_ponto_acc_cliente1_idx` (`acc_cliente_id`),
  KEY `fk_acc_cliente_ponto_acc_operacao1_idx` (`acc_operacao_id`),
  CONSTRAINT `fk_acc_cliente_ponto_acc_cliente1` FOREIGN KEY (`acc_cliente_id`) REFERENCES `acc_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_ponto_acc_operacao1` FOREIGN KEY (`acc_operacao_id`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cliente_ponto`
--

LOCK TABLES `acc_cliente_ponto` WRITE;
/*!40000 ALTER TABLE `acc_cliente_ponto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_cliente_ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_cliente_status`
--

DROP TABLE IF EXISTS `acc_cliente_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_cliente_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `class` varchar(30) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cliente_status`
--

LOCK TABLES `acc_cliente_status` WRITE;
/*!40000 ALTER TABLE `acc_cliente_status` DISABLE KEYS */;
INSERT INTO `acc_cliente_status` VALUES (1,'Ativo','cadastrado, validado e autorizado a efetuar troca','success',1),(2,'Aguardando Validação','cadastrado, aguardando validação','info',1),(3,'Pendênte','cadastrado, validado com pendência','warning',1),(4,'Bloqueado','cadastrado, validado e bloqueado','danger',1),(5,'Inativo','cadastrado, validado e inativo','default',1);
/*!40000 ALTER TABLE `acc_cliente_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_comissao`
--

DROP TABLE IF EXISTS `acc_comissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_comissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_arvore_id` int(11) NOT NULL,
  `pct` decimal(5,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_comissao_acc_arvore1_idx` (`acc_arvore_id`),
  CONSTRAINT `fk_acc_comissao_acc_arvore1` FOREIGN KEY (`acc_arvore_id`) REFERENCES `acc_arvore` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_comissao`
--

LOCK TABLES `acc_comissao` WRITE;
/*!40000 ALTER TABLE `acc_comissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_comissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_empresa`
--

DROP TABLE IF EXISTS `acc_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_empresa`
--

LOCK TABLES `acc_empresa` WRITE;
/*!40000 ALTER TABLE `acc_empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor`
--

DROP TABLE IF EXISTS `acc_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` int(11) NOT NULL,
  `acc_fornecedor_status_id` int(11) NOT NULL,
  `razao_social` varchar(200) DEFAULT NULL,
  `nome_fantasia` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `site` varchar(120) DEFAULT NULL,
  `contato_1` varchar(15) NOT NULL,
  `contato_2` varchar(15) DEFAULT NULL,
  `contato_3` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedor_acc_pessoa1_idx` (`acc_pessoa_id`),
  KEY `fk_acc_fornecedor_acc_fornecedor_status1_idx` (`acc_fornecedor_status_id`),
  CONSTRAINT `fk_acc_fornecedor_acc_fornecedor_status1` FOREIGN KEY (`acc_fornecedor_status_id`) REFERENCES `acc_fornecedor_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor`
--

LOCK TABLES `acc_fornecedor` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor` DISABLE KEYS */;
INSERT INTO `acc_fornecedor` VALUES (1,2,2,'Rogério Moura Rosas MEI','R M Rosas','rogerioegabriel@hotmail.com','','','','',0,'2016-07-28 20:42:21');
/*!40000 ALTER TABLE `acc_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor_acomp`
--

DROP TABLE IF EXISTS `acc_fornecedor_acomp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor_acomp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` int(11) NOT NULL,
  `acc_fornecedor_status_id_antes` int(11) NOT NULL,
  `acc_fornecedor_status_id_depois` int(11) NOT NULL,
  `titulo` varchar(240) NOT NULL,
  `descricao` text NOT NULL,
  `visualizada` int(11) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedor_acomp_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  KEY `fk_acc_fornecedor_acomp_acc_fornecedor_status1_idx` (`acc_fornecedor_status_id_antes`),
  KEY `fk_acc_fornecedor_acomp_acc_fornecedor_status2_idx` (`acc_fornecedor_status_id_depois`),
  CONSTRAINT `fk_acc_fornecedor_acomp_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_acomp_acc_fornecedor_status1` FOREIGN KEY (`acc_fornecedor_status_id_antes`) REFERENCES `acc_fornecedor_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_acomp_acc_fornecedor_status2` FOREIGN KEY (`acc_fornecedor_status_id_depois`) REFERENCES `acc_fornecedor_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_acomp`
--

LOCK TABLES `acc_fornecedor_acomp` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_acomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_fornecedor_acomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor_bancario`
--

DROP TABLE IF EXISTS `acc_fornecedor_bancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor_bancario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` int(11) NOT NULL,
  `bsc_banco_id` int(11) NOT NULL,
  `bsc_tipo_bancario_id` int(11) NOT NULL,
  `agencia` varchar(15) NOT NULL,
  `agencia_dv` varchar(2) NOT NULL,
  `conta` varchar(15) NOT NULL,
  `conta_dv` varchar(2) NOT NULL,
  `tipo_conta` int(11) NOT NULL,
  `variacao` varchar(3) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedor_bancario_bsc_banco1_idx` (`bsc_banco_id`),
  KEY `fk_acc_fornecedor_bancario_bsc_tipo_bancario1_idx` (`bsc_tipo_bancario_id`),
  KEY `fk_acc_fornecedor_bancario_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  CONSTRAINT `fk_acc_fornecedor_bancario_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_bancario_bsc_banco1` FOREIGN KEY (`bsc_banco_id`) REFERENCES `bsc_banco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_bancario_bsc_tipo_bancario1` FOREIGN KEY (`bsc_tipo_bancario_id`) REFERENCES `bsc_tipo_bancario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_bancario`
--

LOCK TABLES `acc_fornecedor_bancario` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_bancario` DISABLE KEYS */;
INSERT INTO `acc_fornecedor_bancario` VALUES (1,1,2,2,'2358','2','48554','3',1,'001',0,NULL);
/*!40000 ALTER TABLE `acc_fornecedor_bancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor_banner`
--

DROP TABLE IF EXISTS `acc_fornecedor_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(120) NOT NULL,
  `ordem` int(11) DEFAULT NULL,
  `principal` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedor_banner_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  CONSTRAINT `fk_acc_fornecedor_banner_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_banner`
--

LOCK TABLES `acc_fornecedor_banner` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_banner` DISABLE KEYS */;
INSERT INTO `acc_fornecedor_banner` VALUES (3,1,'banner 1 ok','../acrecompras_anexos/banner_fornecedor/14020160727112212.jpg',1,1,0,'2016-07-28 20:42:13'),(4,1,'Banner 3 ok','../acrecompras_anexos/banner_fornecedor/19920160727112212.jpg',1,0,0,'2016-07-28 20:42:13');
/*!40000 ALTER TABLE `acc_fornecedor_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor_desconto`
--

DROP TABLE IF EXISTS `acc_fornecedor_desconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor_desconto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` int(11) NOT NULL,
  `pct` decimal(5,2) NOT NULL,
  `limite_inicio` decimal(10,2) NOT NULL,
  `limite_fim` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedor_desconto_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  CONSTRAINT `fk_acc_fornecedor_desconto_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_desconto`
--

LOCK TABLES `acc_fornecedor_desconto` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_desconto` DISABLE KEYS */;
INSERT INTO `acc_fornecedor_desconto` VALUES (34,1,8.99,500.50,0.00,1,'2016-07-28 20:41:05'),(35,1,5.00,400.00,0.00,1,'2016-07-28 20:41:05'),(36,1,3.05,300.05,0.00,1,'2016-07-28 20:41:05'),(37,1,12.50,600.50,0.00,1,'2016-07-28 20:41:05');
/*!40000 ALTER TABLE `acc_fornecedor_desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor_endereco`
--

DROP TABLE IF EXISTS `acc_fornecedor_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsc_cidade_id` int(11) NOT NULL,
  `bsc_tipo_endereco_id` int(11) NOT NULL,
  `acc_fornecedor_id` int(11) NOT NULL,
  `logradouro` varchar(200) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `complemento` text,
  `bairro` varchar(45) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedor_endereco_bsc_cidade1_idx` (`bsc_cidade_id`),
  KEY `fk_acc_fornecedor_endereco_bsc_tipo_endereco1_idx` (`bsc_tipo_endereco_id`),
  KEY `fk_acc_fornecedor_endereco_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  CONSTRAINT `fk_acc_fornecedor_endereco_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_endereco_bsc_cidade1` FOREIGN KEY (`bsc_cidade_id`) REFERENCES `bsc_cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_endereco_bsc_tipo_endereco1` FOREIGN KEY (`bsc_tipo_endereco_id`) REFERENCES `bsc_tipo_endereco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_endereco`
--

LOCK TABLES `acc_fornecedor_endereco` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_endereco` DISABLE KEYS */;
INSERT INTO `acc_fornecedor_endereco` VALUES (1,94,2,1,'Rua Cruzeiro do Sul','420','','Conjunto Esperança','69.915-122','-9.9787221','-67.8371148','2016-07-27 16:20:23');
/*!40000 ALTER TABLE `acc_fornecedor_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor_ponto`
--

DROP TABLE IF EXISTS `acc_fornecedor_ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor_ponto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` int(11) NOT NULL,
  `acc_operacao_id` int(11) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedo_ponto_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  KEY `fk_acc_fornecedor_ponto_acc_operacao1_idx` (`acc_operacao_id`),
  CONSTRAINT `fk_acc_fornecedor_ponto_acc_operacao1` FOREIGN KEY (`acc_operacao_id`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedo_ponto_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_ponto`
--

LOCK TABLES `acc_fornecedor_ponto` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_ponto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_fornecedor_ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_fornecedor_status`
--

DROP TABLE IF EXISTS `acc_fornecedor_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_fornecedor_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `class` varchar(30) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_status`
--

LOCK TABLES `acc_fornecedor_status` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_status` DISABLE KEYS */;
INSERT INTO `acc_fornecedor_status` VALUES (1,'Ativo','cadastrado, validado e autorizado a efetuar troca','success',1),(2,'Aguardando Validação','cadastrado, aguardando validação','info',1),(3,'Pendênte','cadastrado, validado com pendência','warning',1),(4,'Bloqueado','cadastrado, validado e bloqueado','danger',1),(5,'Inativo','cadastrado, validado e inativo','default',1),(6,'Aguardando Ativação','cadastrado, novo, sem solicitação de validação','info',1);
/*!40000 ALTER TABLE `acc_fornecedor_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_operacao`
--

DROP TABLE IF EXISTS `acc_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_operacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_tipo_operacao_id` int(11) NOT NULL,
  `acc_cliente_id` int(11) DEFAULT NULL,
  `acc_fornecedor_id` int(11) DEFAULT NULL,
  `acc_operacao_id_relacionada` int(11) DEFAULT NULL,
  `bsc_forma_pagamento_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_operacao_acc_tipo_operacao1_idx` (`acc_tipo_operacao_id`),
  KEY `fk_acc_operacao_bsc_forma_pagamento1_idx` (`bsc_forma_pagamento_id`),
  KEY `fk_acc_operacao_acc_operacao1_idx` (`acc_operacao_id_relacionada`),
  KEY `fk_acc_operacao_acc_cliente1_idx` (`acc_cliente_id`),
  KEY `fk_acc_operacao_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  CONSTRAINT `fk_acc_operacao_acc_cliente1` FOREIGN KEY (`acc_cliente_id`) REFERENCES `acc_cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_operacao1` FOREIGN KEY (`acc_operacao_id_relacionada`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_tipo_operacao1` FOREIGN KEY (`acc_tipo_operacao_id`) REFERENCES `acc_tipo_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_bsc_forma_pagamento1` FOREIGN KEY (`bsc_forma_pagamento_id`) REFERENCES `bsc_forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_operacao`
--

LOCK TABLES `acc_operacao` WRITE;
/*!40000 ALTER TABLE `acc_operacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_operacao_produto`
--

DROP TABLE IF EXISTS `acc_operacao_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_operacao_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_operacao_id` int(11) NOT NULL,
  `acc_produto_id` int(11) NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_operacao_produto_acc_operacao1_idx` (`acc_operacao_id`),
  KEY `fk_acc_operacao_produto_acc_produto1_idx` (`acc_produto_id`),
  CONSTRAINT `fk_acc_operacao_produto_acc_operacao1` FOREIGN KEY (`acc_operacao_id`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_produto_acc_produto1` FOREIGN KEY (`acc_produto_id`) REFERENCES `acc_produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_operacao_produto`
--

LOCK TABLES `acc_operacao_produto` WRITE;
/*!40000 ALTER TABLE `acc_operacao_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_operacao_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_pessoa`
--

DROP TABLE IF EXISTS `acc_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` int(11) NOT NULL,
  `acc_pessoa_admin_id` int(11) DEFAULT NULL,
  `acc_pessoa_id_amigo` int(11) DEFAULT NULL,
  `nickname` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_pessoa_seg_usuario1_idx` (`seg_usuario_id`),
  KEY `fk_acc_pessoa_acc_pessoa1_idx` (`acc_pessoa_id_amigo`),
  KEY `fk_acc_pessoa_acc_pessoa_admin1_idx` (`acc_pessoa_admin_id`),
  CONSTRAINT `fk_acc_pessoa_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id_amigo`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_pessoa_acc_pessoa_admin1` FOREIGN KEY (`acc_pessoa_admin_id`) REFERENCES `acc_pessoa_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_pessoa_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_pessoa`
--

LOCK TABLES `acc_pessoa` WRITE;
/*!40000 ALTER TABLE `acc_pessoa` DISABLE KEYS */;
INSERT INTO `acc_pessoa` VALUES (2,2,NULL,NULL,'rojherio',1,'2016-07-27 03:51:01');
/*!40000 ALTER TABLE `acc_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_pessoa_admin`
--

DROP TABLE IF EXISTS `acc_pessoa_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_pessoa_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` int(11) NOT NULL,
  `pct_participacao` decimal(5,2) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_pessoa_admin_acc_pessoa1_idx` (`acc_pessoa_id`),
  CONSTRAINT `fk_acc_pessoa_admin_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_pessoa_admin`
--

LOCK TABLES `acc_pessoa_admin` WRITE;
/*!40000 ALTER TABLE `acc_pessoa_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_pessoa_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_produto`
--

DROP TABLE IF EXISTS `acc_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `descricao` varchar(360) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_produto`
--

LOCK TABLES `acc_produto` WRITE;
/*!40000 ALTER TABLE `acc_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_produto_imagem`
--

DROP TABLE IF EXISTS `acc_produto_imagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_produto_imagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_produto_id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(240) DEFAULT NULL,
  `endereco` varchar(120) NOT NULL,
  `ordem` int(11) NOT NULL,
  `principal` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_produto_imagem_acc_produto1_idx` (`acc_produto_id`),
  CONSTRAINT `fk_acc_produto_imagem_acc_produto1` FOREIGN KEY (`acc_produto_id`) REFERENCES `acc_produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_produto_imagem`
--

LOCK TABLES `acc_produto_imagem` WRITE;
/*!40000 ALTER TABLE `acc_produto_imagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_produto_imagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_tipo_operacao`
--

DROP TABLE IF EXISTS `acc_tipo_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_tipo_operacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(240) NOT NULL,
  `operador` varchar(30) NOT NULL COMMENT 'adicao_credito, subtracao_debito',
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_tipo_operacao`
--

LOCK TABLES `acc_tipo_operacao` WRITE;
/*!40000 ALTER TABLE `acc_tipo_operacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_tipo_operacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_banco`
--

DROP TABLE IF EXISTS `bsc_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(5) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_banco`
--

LOCK TABLES `bsc_banco` WRITE;
/*!40000 ALTER TABLE `bsc_banco` DISABLE KEYS */;
INSERT INTO `bsc_banco` VALUES (1,'000','Banco Bankpar S.A.',1),(2,'001','Banco do Brasil S.A.',1),(3,'003','Banco da Amazônia S.A.',1),(4,'004','Banco do Nordeste do Brasil S.A.',1),(5,'012','Banco Standard de Investimentos S.A.',1),(6,'014','Natixis Brasil S.A. Banco Múltiplo',1),(7,'019','Banco Azteca do Brasil S.A.',1),(8,'021','BANESTES S.A. Banco do Estado do Espírito Santo',1),(9,'024','Banco de Pernambuco S.A. - BANDEPE',1),(10,'025','Banco Alfa S.A.',1),(11,'029','Banco Banerj S.A.',1),(12,'031','Banco Beg S.A.',1),(13,'033','Banco Santander (Brasil) S.A.',1),(14,'036','Banco Bradesco BBI S.A.',1),(15,'037','Banco do Estado do Pará S.A.',1),(16,'039','Banco do Estado do Piauí S.A. - BEP',1),(17,'040','Banco Cargill S.A.',1),(18,'041','Banco do Estado do Rio Grande do Sul S.A.',1),(19,'044','Banco BVA S.A.',1),(20,'045','Banco Opportunity S.A.',1),(21,'047','Banco do Estado de Sergipe S.A.',1),(22,'062','Hipercard Banco Múltiplo S.A.',1),(23,'063','Banco Ibi S.A. Banco Múltiplo',1),(24,'064','Goldman Sachs do Brasil Banco Múltiplo S.A.',1),(25,'065','Banco Bracce S.A.',1),(26,'066','Banco Morgan Stanley S.A.',1),(27,'069','BPN Brasil Banco Múltiplo S.A.',1),(28,'070','BRB - Banco de Brasília S.A.',1),(29,'072','Banco Rural Mais S.A.',1),(30,'073','BB Banco Popular do Brasil S.A.',1),(31,'074','Banco J. Safra S.A.',1),(32,'075','Banco CR2 S.A.',1),(33,'076','Banco KDB S.A.',1),(34,'078','BES Investimento do Brasil S.A.-Banco de Investimento',1),(35,'079','JBS Banco S.A.',1),(36,'084','Unicred Norte do Paraná',1),(37,'096','Banco BM&F de Serviços de Liquidação e Custódia S.A',1),(38,'104','Caixa Econômica Federal',1),(39,'107','Banco BBM S.A.',1),(40,'168','HSBC Finance (Brasil) S.A. - Banco Múltiplo',1),(41,'184','Banco Itaú BBA S.A.',1),(42,'204','Banco Bradesco Cartões S.A.',1),(43,'208','Banco BTG Pactual S.A.',1),(44,'212','Banco Matone S.A.',1),(45,'213','Banco Arbi S.A.',1),(46,'214','Banco Dibens S.A.',1),(47,'215','Banco Comercial e de Investimento Sudameris S.A.',1),(48,'217','Banco John Deere S.A.',1),(49,'218','Banco Bonsucesso S.A.',1),(50,'222','Banco Credit Agricole Brasil S.A.',1),(51,'224','Banco Fibra S.A.',1),(52,'225','Banco Brascan S.A.',1),(53,'229','Banco Cruzeiro do Sul S.A.',1),(54,'230','Unicard Banco Múltiplo S.A.',1),(55,'233','Banco GE Capital S.A.',1),(56,'237','Banco Bradesco S.A.',1),(57,'241','Banco Clássico S.A.',1),(58,'243','Banco Máxima S.A.',1),(59,'246','Banco ABC Brasil S.A.',1),(60,'248','Banco Boavista Interatlântico S.A.',1),(61,'249','Banco Investcred Unibanco S.A.',1),(62,'250','Banco Schahin S.A.',1),(63,'254','Paraná Banco S.A.',1),(64,'263','Banco Cacique S.A.',1),(65,'265','Banco Fator S.A.',1),(66,'266','Banco Cédula S.A.',1),(67,'300','Banco de La Nacion Argentina',1),(68,'318','Banco BMG S.A.',1),(69,'320','Banco Industrial e Comercial S.A.',1),(70,'341','Itaú Unibanco S.A.',1),(71,'356','Banco Real S.A.',1),(72,'366','Banco Société Générale Brasil S.A.',1),(73,'370','Banco WestLB do Brasil S.A.',1),(74,'376','Banco J. P. Morgan S.A.',1),(75,'389','Banco Mercantil do Brasil S.A.',1),(76,'394','Banco Bradesco Financiamentos S.A.',1),(77,'399','HSBC Bank Brasil S.A. - Banco Múltiplo',1),(78,'409','UNIBANCO - União de Bancos Brasileiros S.A.',1),(79,'412','Banco Capital S.A.',1),(80,'422','Banco Safra S.A.',1),(81,'453','Banco Rural S.A.',1),(82,'456','Banco de Tokyo-Mitsubishi UFJ Brasil S.A.',1),(83,'464','Banco Sumitomo Mitsui Brasileiro S.A.',1),(84,'473','Banco Caixa Geral - Brasil S.A.',1),(85,'477','Citibank N.A.',1),(86,'479','Banco ItaúBank S.A',1),(87,'487','Deutsche Bank S.A. - Banco Alemão',1),(88,'488','JPMorgan Chase Bank',1),(89,'492','ING Bank N.V.',1),(90,'494','Banco de La Republica Oriental del Uruguay',1),(91,'495','Banco de La Provincia de Buenos Aires',1),(92,'505','Banco Credit Suisse (Brasil) S.A.',1),(93,'600','Banco Luso Brasileiro S.A.',1),(94,'604','Banco Industrial do Brasil S.A.',1),(95,'610','Banco VR S.A.',1),(96,'611','Banco Paulista S.A.',1),(97,'612','Banco Guanabara S.A.',1),(98,'613','Banco Pecúnia S.A.',1),(99,'623','Banco Panamericano S.A.',1),(100,'626','Banco Ficsa S.A.',1),(101,'630','Banco Intercap S.A.',1),(102,'633','Banco Rendimento S.A.',1),(103,'634','Banco Triângulo S.A.',1),(104,'637','Banco Sofisa S.A.',1),(105,'638','Banco Prosper S.A.',1),(106,'641','Banco Alvorada S.A.',1),(107,'643','Banco Pine S.A.',1),(108,'652','Itaú Unibanco Holding S.A.',1),(109,'653','Banco Indusval S.A.',1),(110,'654','Banco A.J.Renner S.A.',1),(111,'655','Banco Votorantim S.A.',1),(112,'707','Banco Daycoval S.A.',1),(113,'719','Banif-Banco Internacional do Funchal (Brasil)S.A.',1),(114,'721','Banco Credibel S.A.',1),(115,'724','Banco Porto Seguro S.A.',1),(116,'734','Banco Gerdau S.A.',1),(117,'735','Banco Pottencial S.A.',1),(118,'738','Banco Morada S.A.',1),(119,'739','Banco BGN S.A.',1),(120,'740','Banco Barclays S.A.',1),(121,'741','Banco Ribeirão Preto S.A.',1),(122,'743','Banco Semear S.A.',1),(123,'744','BankBoston N.A.',1),(124,'745','Banco Citibank S.A.',1),(125,'746','Banco Modal S.A.',1),(126,'747','Banco Rabobank International Brasil S.A.',1),(127,'748','Banco Cooperativo Sicredi S.A.',1),(128,'749','Banco Simples S.A.',1),(129,'751','Dresdner Bank Brasil S.A. - Banco Múltiplo',1),(130,'752','Banco BNP Paribas Brasil S.A.',1),(131,'753','NBC Bank Brasil S.A. - Banco Múltiplo',1),(132,'755','Bank of America Merrill Lynch Banco Múltiplo S.A.',1),(133,'756','Banco Cooperativo do Brasil S.A. - BANCOOB',1),(134,'757','Banco KEB do Brasil S.A.',1),(135,'077-9','Banco Intermedium S.A.',1),(136,'081-7','Concórdia Banco S.A.',1),(137,'082-5','Banco Topázio S.A.',1),(138,'083-3','Banco da China Brasil S.A.',1),(139,'085-x','Cooperativa Central de Crédito Urbano-CECRED',1),(140,'086-8','OBOE Crédito Financiamento e Investimento S.A.',1),(141,'087-6','Cooperativa Unicred Central Santa Catarina',1),(142,'088-4','Banco Randon S.A.',1),(143,'089-2','Cooperativa de Crédito Rural da Região de Mogiana',1),(144,'090-2','Cooperativa Central de Economia e Crédito Mutuo das Unicreds',1),(145,'091-4','Unicred Central do Rio Grande do Sul',1),(146,'092-2','Brickell S.A. Crédito, financiamento e Investimento',1),(147,'094-2','Banco Petra S.A.',1),(148,'097-3','Cooperativa Central de Crédito Noroeste Brasileiro Ltda.',1),(149,'098-1','Credicorol Cooperativa de Crédito Rural',1),(150,'099-x','Cooperativa Central de Economia e Credito Mutuo das Unicreds',1),(151,'M03','Banco Fiat S.A.',0),(152,'M06','Banco de Lage Landen Brasil S.A.',0),(153,'M07','Banco GMAC S.A.',0),(154,'M08','Banco Citicard S.A.',0),(155,'M09','Banco Itaucred Financiamentos S.A.',0),(156,'M10','Banco Moneo S.A.',0),(157,'M11','Banco IBM S.A.',0),(158,'M12','Banco Maxinvest S.A.',0),(159,'M13','Banco Tricury S.A.',0),(160,'M14','Banco Volkswagen S.A.',0),(161,'M15','Banco BRJ S.A.',0),(162,'M16','Banco Rodobens S.A.',0),(163,'M17','Banco Ourinvest S.A.',0),(164,'M18','Banco Ford S.A.',0),(165,'M19','Banco CNH Capital S.A.',0),(166,'M20','Banco Toyota do Brasil S.A.',0),(167,'M21','Banco Daimlerchrysler S.A.',0),(168,'M22','Banco Honda S.A.',0),(169,'M23','Banco Volvo (Brasil) S.A.',0),(170,'M24','Banco PSA Finance Brasil S.A.',0);
/*!40000 ALTER TABLE `bsc_banco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_cidade`
--

DROP TABLE IF EXISTS `bsc_cidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsc_estado_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bsc_cidade_bsc_estado1_idx` (`bsc_estado_id`),
  CONSTRAINT `fk_bsc_cidade_bsc_estado1` FOREIGN KEY (`bsc_estado_id`) REFERENCES `bsc_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5565 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_cidade`
--

LOCK TABLES `bsc_cidade` WRITE;
/*!40000 ALTER TABLE `bsc_cidade` DISABLE KEYS */;
INSERT INTO `bsc_cidade` VALUES (1,8,'Afonso Cláudio',NULL),(2,8,'Água Doce do Norte',NULL),(3,8,'Águia Branca',NULL),(4,8,'Alegre',NULL),(5,8,'Alfredo Chaves',NULL),(6,8,'Alto Rio Novo',NULL),(7,8,'Anchieta',NULL),(8,8,'Apiacá',NULL),(9,8,'Aracruz',NULL),(10,8,'Atilio Vivacqua',NULL),(11,8,'Baixo Guandu',NULL),(12,8,'Barra de São Francisco',NULL),(13,8,'Boa Esperança',NULL),(14,8,'Bom Jesus do Norte',NULL),(15,8,'Brejetuba',NULL),(16,8,'Cachoeiro de Itapemirim',NULL),(17,8,'Cariacica',NULL),(18,8,'Castelo',NULL),(19,8,'Colatina',NULL),(20,8,'Conceição da Barra',NULL),(21,8,'Conceição do Castelo',NULL),(22,8,'Divino de São Lourenço',NULL),(23,8,'Domingos Martins',NULL),(24,8,'Dores do Rio Preto',NULL),(25,8,'Ecoporanga',NULL),(26,8,'Fundão',NULL),(27,8,'Governador Lindenberg',NULL),(28,8,'Guaçuí',NULL),(29,8,'Guarapari',NULL),(30,8,'Ibatiba',NULL),(31,8,'Ibiraçu',NULL),(32,8,'Ibitirama',NULL),(33,8,'Iconha',NULL),(34,8,'Irupi',NULL),(35,8,'Itaguaçu',NULL),(36,8,'Itapemirim',NULL),(37,8,'Itarana',NULL),(38,8,'Iúna',NULL),(39,8,'Jaguaré',NULL),(40,8,'Jerônimo Monteiro',NULL),(41,8,'João Neiva',NULL),(42,8,'Laranja da Terra',NULL),(43,8,'Linhares',NULL),(44,8,'Mantenópolis',NULL),(45,8,'Marataízes',NULL),(46,8,'Marechal Floriano',NULL),(47,8,'Marilândia',NULL),(48,8,'Mimoso do Sul',NULL),(49,8,'Montanha',NULL),(50,8,'Mucurici',NULL),(51,8,'Muniz Freire',NULL),(52,8,'Muqui',NULL),(53,8,'Nova Venécia',NULL),(54,8,'Pancas',NULL),(55,8,'Pedro Canário',NULL),(56,8,'Pinheiros',NULL),(57,8,'Piúma',NULL),(58,8,'Ponto Belo',NULL),(59,8,'Presidente Kennedy',NULL),(60,8,'Rio Bananal',NULL),(61,8,'Rio Novo do Sul',NULL),(62,8,'Santa Leopoldina',NULL),(63,8,'Santa Maria de Jetibá',NULL),(64,8,'Santa Teresa',NULL),(65,8,'São Domingos do Norte',NULL),(66,8,'São Gabriel da Palha',NULL),(67,8,'São José do Calçado',NULL),(68,8,'São Mateus',NULL),(69,8,'São Roque do Canaã',NULL),(70,8,'Serra',NULL),(71,8,'Sooretama',NULL),(72,8,'Vargem Alta',NULL),(73,8,'Venda Nova do Imigrante',NULL),(74,8,'Viana',NULL),(75,8,'Vila Pavão',NULL),(76,8,'Vila Valério',NULL),(77,8,'Vila Velha',NULL),(78,8,'Vitória',NULL),(79,1,'Acrelândia',NULL),(80,1,'Assis Brasil',NULL),(81,1,'Brasiléia',NULL),(82,1,'Bujari',NULL),(83,1,'Capixaba',NULL),(84,1,'Cruzeiro do Sul',NULL),(85,1,'Epitaciolândia',NULL),(86,1,'Feijó',NULL),(87,1,'Jordão',NULL),(88,1,'Mâncio Lima',NULL),(89,1,'Manoel Urbano',NULL),(90,1,'Marechal Thaumaturgo',NULL),(91,1,'Plácido de Castro',NULL),(92,1,'Porto Acre',NULL),(93,1,'Porto Walter',NULL),(94,1,'Rio Branco',NULL),(95,1,'Rodrigues Alves',NULL),(96,1,'Santa Rosa do Purus',NULL),(97,1,'Sena Madureira',NULL),(98,1,'Senador Guiomard',NULL),(99,1,'Tarauacá',NULL),(100,1,'Xapuri',NULL),(101,2,'Água Branca',NULL),(102,2,'Anadia',NULL),(103,2,'Arapiraca',NULL),(104,2,'Atalaia',NULL),(105,2,'Barra de Santo Antônio',NULL),(106,2,'Barra de São Miguel',NULL),(107,2,'Batalha',NULL),(108,2,'Belém',NULL),(109,2,'Belo Monte',NULL),(110,2,'Boca da Mata',NULL),(111,2,'Branquinha',NULL),(112,2,'Cacimbinhas',NULL),(113,2,'Cajueiro',NULL),(114,2,'Campestre',NULL),(115,2,'Campo Alegre',NULL),(116,2,'Campo Grande',NULL),(117,2,'Canapi',NULL),(118,2,'Capela',NULL),(119,2,'Carneiros',NULL),(120,2,'Chã Preta',NULL),(121,2,'Coité do Nóia',NULL),(122,2,'Colônia Leopoldina',NULL),(123,2,'Coqueiro Seco',NULL),(124,2,'Coruripe',NULL),(125,2,'Craíbas',NULL),(126,2,'Delmiro Gouveia',NULL),(127,2,'Dois Riachos',NULL),(128,2,'Estrela de Alagoas',NULL),(129,2,'Feira Grande',NULL),(130,2,'Feliz Deserto',NULL),(131,2,'Flexeiras',NULL),(132,2,'Girau do Ponciano',NULL),(133,2,'Ibateguara',NULL),(134,2,'Igaci',NULL),(135,2,'Igreja Nova',NULL),(136,2,'Inhapi',NULL),(137,2,'Jacaré dos Homens',NULL),(138,2,'Jacuípe',NULL),(139,2,'Japaratinga',NULL),(140,2,'Jaramataia',NULL),(141,2,'Jequiá da Praia',NULL),(142,2,'Joaquim Gomes',NULL),(143,2,'Jundiá',NULL),(144,2,'Junqueiro',NULL),(145,2,'Lagoa da Canoa',NULL),(146,2,'Limoeiro de Anadia',NULL),(147,2,'Maceió',NULL),(148,2,'Major Isidoro',NULL),(149,2,'Mar Vermelho',NULL),(150,2,'Maragogi',NULL),(151,2,'Maravilha',NULL),(152,2,'Marechal Deodoro',NULL),(153,2,'Maribondo',NULL),(154,2,'Mata Grande',NULL),(155,2,'Matriz de Camaragibe',NULL),(156,2,'Messias',NULL),(157,2,'Minador do Negrão',NULL),(158,2,'Monteirópolis',NULL),(159,2,'Murici',NULL),(160,2,'Novo Lino',NULL),(161,2,'Olho d`Água das Flores',NULL),(162,2,'Olho d`Água do Casado',NULL),(163,2,'Olho d`Água Grande',NULL),(164,2,'Olivença',NULL),(165,2,'Ouro Branco',NULL),(166,2,'Palestina',NULL),(167,2,'Palmeira dos Índios',NULL),(168,2,'Pão de Açúcar',NULL),(169,2,'Pariconha',NULL),(170,2,'Paripueira',NULL),(171,2,'Passo de Camaragibe',NULL),(172,2,'Paulo Jacinto',NULL),(173,2,'Penedo',NULL),(174,2,'Piaçabuçu',NULL),(175,2,'Pilar',NULL),(176,2,'Pindoba',NULL),(177,2,'Piranhas',NULL),(178,2,'Poço das Trincheiras',NULL),(179,2,'Porto Calvo',NULL),(180,2,'Porto de Pedras',NULL),(181,2,'Porto Real do Colégio',NULL),(182,2,'Quebrangulo',NULL),(183,2,'Rio Largo',NULL),(184,2,'Roteiro',NULL),(185,2,'Santa Luzia do Norte',NULL),(186,2,'Santana do Ipanema',NULL),(187,2,'Santana do Mundaú',NULL),(188,2,'São Brás',NULL),(189,2,'São José da Laje',NULL),(190,2,'São José da Tapera',NULL),(191,2,'São Luís do Quitunde',NULL),(192,2,'São Miguel dos Campos',NULL),(193,2,'São Miguel dos Milagres',NULL),(194,2,'São Sebastião',NULL),(195,2,'Satuba',NULL),(196,2,'Senador Rui Palmeira',NULL),(197,2,'Tanque d`Arca',NULL),(198,2,'Taquarana',NULL),(199,2,'Teotônio Vilela',NULL),(200,2,'Traipu',NULL),(201,2,'União dos Palmares',NULL),(202,2,'Viçosa',NULL),(203,4,'Amapá',NULL),(204,4,'Calçoene',NULL),(205,4,'Cutias',NULL),(206,4,'Ferreira Gomes',NULL),(207,4,'Itaubal',NULL),(208,4,'Laranjal do Jari',NULL),(209,4,'Macapá',NULL),(210,4,'Mazagão',NULL),(211,4,'Oiapoque',NULL),(212,4,'Pedra Branca do Amaparí',NULL),(213,4,'Porto Grande',NULL),(214,4,'Pracuúba',NULL),(215,4,'Santana',NULL),(216,4,'Serra do Navio',NULL),(217,4,'Tartarugalzinho',NULL),(218,4,'Vitória do Jari',NULL),(219,3,'Alvarães',NULL),(220,3,'Amaturá',NULL),(221,3,'Anamã',NULL),(222,3,'Anori',NULL),(223,3,'Apuí',NULL),(224,3,'Atalaia do Norte',NULL),(225,3,'Autazes',NULL),(226,3,'Barcelos',NULL),(227,3,'Barreirinha',NULL),(228,3,'Benjamin Constant',NULL),(229,3,'Beruri',NULL),(230,3,'Boa Vista do Ramos',NULL),(231,3,'Boca do Acre',NULL),(232,3,'Borba',NULL),(233,3,'Caapiranga',NULL),(234,3,'Canutama',NULL),(235,3,'Carauari',NULL),(236,3,'Careiro',NULL),(237,3,'Careiro da Várzea',NULL),(238,3,'Coari',NULL),(239,3,'Codajás',NULL),(240,3,'Eirunepé',NULL),(241,3,'Envira',NULL),(242,3,'Fonte Boa',NULL),(243,3,'Guajará',NULL),(244,3,'Humaitá',NULL),(245,3,'Ipixuna',NULL),(246,3,'Iranduba',NULL),(247,3,'Itacoatiara',NULL),(248,3,'Itamarati',NULL),(249,3,'Itapiranga',NULL),(250,3,'Japurá',NULL),(251,3,'Juruá',NULL),(252,3,'Jutaí',NULL),(253,3,'Lábrea',NULL),(254,3,'Manacapuru',NULL),(255,3,'Manaquiri',NULL),(256,3,'Manaus',NULL),(257,3,'Manicoré',NULL),(258,3,'Maraã',NULL),(259,3,'Maués',NULL),(260,3,'Nhamundá',NULL),(261,3,'Nova Olinda do Norte',NULL),(262,3,'Novo Airão',NULL),(263,3,'Novo Aripuanã',NULL),(264,3,'Parintins',NULL),(265,3,'Pauini',NULL),(266,3,'Presidente Figueiredo',NULL),(267,3,'Rio Preto da Eva',NULL),(268,3,'Santa Isabel do Rio Negro',NULL),(269,3,'Santo Antônio do Içá',NULL),(270,3,'São Gabriel da Cachoeira',NULL),(271,3,'São Paulo de Olivença',NULL),(272,3,'São Sebastião do Uatumã',NULL),(273,3,'Silves',NULL),(274,3,'Tabatinga',NULL),(275,3,'Tapauá',NULL),(276,3,'Tefé',NULL),(277,3,'Tonantins',NULL),(278,3,'Uarini',NULL),(279,3,'Urucará',NULL),(280,3,'Urucurituba',NULL),(281,5,'Abaíra',NULL),(282,5,'Abaré',NULL),(283,5,'Acajutiba',NULL),(284,5,'Adustina',NULL),(285,5,'Água Fria',NULL),(286,5,'Aiquara',NULL),(287,5,'Alagoinhas',NULL),(288,5,'Alcobaça',NULL),(289,5,'Almadina',NULL),(290,5,'Amargosa',NULL),(291,5,'Amélia Rodrigues',NULL),(292,5,'América Dourada',NULL),(293,5,'Anagé',NULL),(294,5,'Andaraí',NULL),(295,5,'Andorinha',NULL),(296,5,'Angical',NULL),(297,5,'Anguera',NULL),(298,5,'Antas',NULL),(299,5,'Antônio Cardoso',NULL),(300,5,'Antônio Gonçalves',NULL),(301,5,'Aporá',NULL),(302,5,'Apuarema',NULL),(303,5,'Araças',NULL),(304,5,'Aracatu',NULL),(305,5,'Araci',NULL),(306,5,'Aramari',NULL),(307,5,'Arataca',NULL),(308,5,'Aratuípe',NULL),(309,5,'Aurelino Leal',NULL),(310,5,'Baianópolis',NULL),(311,5,'Baixa Grande',NULL),(312,5,'Banzaê',NULL),(313,5,'Barra',NULL),(314,5,'Barra da Estiva',NULL),(315,5,'Barra do Choça',NULL),(316,5,'Barra do Mendes',NULL),(317,5,'Barra do Rocha',NULL),(318,5,'Barreiras',NULL),(319,5,'Barro Alto',NULL),(320,5,'Barro Preto (antigo Gov. Lomanto Jr.)',NULL),(321,5,'Barrocas',NULL),(322,5,'Belmonte',NULL),(323,5,'Belo Campo',NULL),(324,5,'Biritinga',NULL),(325,5,'Boa Nova',NULL),(326,5,'Boa Vista do Tupim',NULL),(327,5,'Bom Jesus da Lapa',NULL),(328,5,'Bom Jesus da Serra',NULL),(329,5,'Boninal',NULL),(330,5,'Bonito',NULL),(331,5,'Boquira',NULL),(332,5,'Botuporã',NULL),(333,5,'Brejões',NULL),(334,5,'Brejolândia',NULL),(335,5,'Brotas de Macaúbas',NULL),(336,5,'Brumado',NULL),(337,5,'Buerarema',NULL),(338,5,'Buritirama',NULL),(339,5,'Caatiba',NULL),(340,5,'Cabaceiras do Paraguaçu',NULL),(341,5,'Cachoeira',NULL),(342,5,'Caculé',NULL),(343,5,'Caém',NULL),(344,5,'Caetanos',NULL),(345,5,'Caetité',NULL),(346,5,'Cafarnaum',NULL),(347,5,'Cairu',NULL),(348,5,'Caldeirão Grande',NULL),(349,5,'Camacan',NULL),(350,5,'Camaçari',NULL),(351,5,'Camamu',NULL),(352,5,'Campo Alegre de Lourdes',NULL),(353,5,'Campo Formoso',NULL),(354,5,'Canápolis',NULL),(355,5,'Canarana',NULL),(356,5,'Canavieiras',NULL),(357,5,'Candeal',NULL),(358,5,'Candeias',NULL),(359,5,'Candiba',NULL),(360,5,'Cândido Sales',NULL),(361,5,'Cansanção',NULL),(362,5,'Canudos',NULL),(363,5,'Capela do Alto Alegre',NULL),(364,5,'Capim Grosso',NULL),(365,5,'Caraíbas',NULL),(366,5,'Caravelas',NULL),(367,5,'Cardeal da Silva',NULL),(368,5,'Carinhanha',NULL),(369,5,'Casa Nova',NULL),(370,5,'Castro Alves',NULL),(371,5,'Catolândia',NULL),(372,5,'Catu',NULL),(373,5,'Caturama',NULL),(374,5,'Central',NULL),(375,5,'Chorrochó',NULL),(376,5,'Cícero Dantas',NULL),(377,5,'Cipó',NULL),(378,5,'Coaraci',NULL),(379,5,'Cocos',NULL),(380,5,'Conceição da Feira',NULL),(381,5,'Conceição do Almeida',NULL),(382,5,'Conceição do Coité',NULL),(383,5,'Conceição do Jacuípe',NULL),(384,5,'Conde',NULL),(385,5,'Condeúba',NULL),(386,5,'Contendas do Sincorá',NULL),(387,5,'Coração de Maria',NULL),(388,5,'Cordeiros',NULL),(389,5,'Coribe',NULL),(390,5,'Coronel João Sá',NULL),(391,5,'Correntina',NULL),(392,5,'Cotegipe',NULL),(393,5,'Cravolândia',NULL),(394,5,'Crisópolis',NULL),(395,5,'Cristópolis',NULL),(396,5,'Cruz das Almas',NULL),(397,5,'Curaçá',NULL),(398,5,'Dário Meira',NULL),(399,5,'Dias d`Ávila',NULL),(400,5,'Dom Basílio',NULL),(401,5,'Dom Macedo Costa',NULL),(402,5,'Elísio Medrado',NULL),(403,5,'Encruzilhada',NULL),(404,5,'Entre Rios',NULL),(405,5,'Érico Cardoso',NULL),(406,5,'Esplanada',NULL),(407,5,'Euclides da Cunha',NULL),(408,5,'Eunápolis',NULL),(409,5,'Fátima',NULL),(410,5,'Feira da Mata',NULL),(411,5,'Feira de Santana',NULL),(412,5,'Filadélfia',NULL),(413,5,'Firmino Alves',NULL),(414,5,'Floresta Azul',NULL),(415,5,'Formosa do Rio Preto',NULL),(416,5,'Gandu',NULL),(417,5,'Gavião',NULL),(418,5,'Gentio do Ouro',NULL),(419,5,'Glória',NULL),(420,5,'Gongogi',NULL),(421,5,'Governador Mangabeira',NULL),(422,5,'Guajeru',NULL),(423,5,'Guanambi',NULL),(424,5,'Guaratinga',NULL),(425,5,'Heliópolis',NULL),(426,5,'Iaçu',NULL),(427,5,'Ibiassucê',NULL),(428,5,'Ibicaraí',NULL),(429,5,'Ibicoara',NULL),(430,5,'Ibicuí',NULL),(431,5,'Ibipeba',NULL),(432,5,'Ibipitanga',NULL),(433,5,'Ibiquera',NULL),(434,5,'Ibirapitanga',NULL),(435,5,'Ibirapuã',NULL),(436,5,'Ibirataia',NULL),(437,5,'Ibitiara',NULL),(438,5,'Ibititá',NULL),(439,5,'Ibotirama',NULL),(440,5,'Ichu',NULL),(441,5,'Igaporã',NULL),(442,5,'Igrapiúna',NULL),(443,5,'Iguaí',NULL),(444,5,'Ilhéus',NULL),(445,5,'Inhambupe',NULL),(446,5,'Ipecaetá',NULL),(447,5,'Ipiaú',NULL),(448,5,'Ipirá',NULL),(449,5,'Ipupiara',NULL),(450,5,'Irajuba',NULL),(451,5,'Iramaia',NULL),(452,5,'Iraquara',NULL),(453,5,'Irará',NULL),(454,5,'Irecê',NULL),(455,5,'Itabela',NULL),(456,5,'Itaberaba',NULL),(457,5,'Itabuna',NULL),(458,5,'Itacaré',NULL),(459,5,'Itaeté',NULL),(460,5,'Itagi',NULL),(461,5,'Itagibá',NULL),(462,5,'Itagimirim',NULL),(463,5,'Itaguaçu da Bahia',NULL),(464,5,'Itaju do Colônia',NULL),(465,5,'Itajuípe',NULL),(466,5,'Itamaraju',NULL),(467,5,'Itamari',NULL),(468,5,'Itambé',NULL),(469,5,'Itanagra',NULL),(470,5,'Itanhém',NULL),(471,5,'Itaparica',NULL),(472,5,'Itapé',NULL),(473,5,'Itapebi',NULL),(474,5,'Itapetinga',NULL),(475,5,'Itapicuru',NULL),(476,5,'Itapitanga',NULL),(477,5,'Itaquara',NULL),(478,5,'Itarantim',NULL),(479,5,'Itatim',NULL),(480,5,'Itiruçu',NULL),(481,5,'Itiúba',NULL),(482,5,'Itororó',NULL),(483,5,'Ituaçu',NULL),(484,5,'Ituberá',NULL),(485,5,'Iuiú',NULL),(486,5,'Jaborandi',NULL),(487,5,'Jacaraci',NULL),(488,5,'Jacobina',NULL),(489,5,'Jaguaquara',NULL),(490,5,'Jaguarari',NULL),(491,5,'Jaguaripe',NULL),(492,5,'Jandaíra',NULL),(493,5,'Jequié',NULL),(494,5,'Jeremoabo',NULL),(495,5,'Jiquiriçá',NULL),(496,5,'Jitaúna',NULL),(497,5,'João Dourado',NULL),(498,5,'Juazeiro',NULL),(499,5,'Jucuruçu',NULL),(500,5,'Jussara',NULL),(501,5,'Jussari',NULL),(502,5,'Jussiape',NULL),(503,5,'Lafaiete Coutinho',NULL),(504,5,'Lagoa Real',NULL),(505,5,'Laje',NULL),(506,5,'Lajedão',NULL),(507,5,'Lajedinho',NULL),(508,5,'Lajedo do Tabocal',NULL),(509,5,'Lamarão',NULL),(510,5,'Lapão',NULL),(511,5,'Lauro de Freitas',NULL),(512,5,'Lençóis',NULL),(513,5,'Licínio de Almeida',NULL),(514,5,'Livramento de Nossa Senhora',NULL),(515,5,'Luís Eduardo Magalhães',NULL),(516,5,'Macajuba',NULL),(517,5,'Macarani',NULL),(518,5,'Macaúbas',NULL),(519,5,'Macururé',NULL),(520,5,'Madre de Deus',NULL),(521,5,'Maetinga',NULL),(522,5,'Maiquinique',NULL),(523,5,'Mairi',NULL),(524,5,'Malhada',NULL),(525,5,'Malhada de Pedras',NULL),(526,5,'Manoel Vitorino',NULL),(527,5,'Mansidão',NULL),(528,5,'Maracás',NULL),(529,5,'Maragogipe',NULL),(530,5,'Maraú',NULL),(531,5,'Marcionílio Souza',NULL),(532,5,'Mascote',NULL),(533,5,'Mata de São João',NULL),(534,5,'Matina',NULL),(535,5,'Medeiros Neto',NULL),(536,5,'Miguel Calmon',NULL),(537,5,'Milagres',NULL),(538,5,'Mirangaba',NULL),(539,5,'Mirante',NULL),(540,5,'Monte Santo',NULL),(541,5,'Morpará',NULL),(542,5,'Morro do Chapéu',NULL),(543,5,'Mortugaba',NULL),(544,5,'Mucugê',NULL),(545,5,'Mucuri',NULL),(546,5,'Mulungu do Morro',NULL),(547,5,'Mundo Novo',NULL),(548,5,'Muniz Ferreira',NULL),(549,5,'Muquém de São Francisco',NULL),(550,5,'Muritiba',NULL),(551,5,'Mutuípe',NULL),(552,5,'Nazaré',NULL),(553,5,'Nilo Peçanha',NULL),(554,5,'Nordestina',NULL),(555,5,'Nova Canaã',NULL),(556,5,'Nova Fátima',NULL),(557,5,'Nova Ibiá',NULL),(558,5,'Nova Itarana',NULL),(559,5,'Nova Redenção',NULL),(560,5,'Nova Soure',NULL),(561,5,'Nova Viçosa',NULL),(562,5,'Novo Horizonte',NULL),(563,5,'Novo Triunfo',NULL),(564,5,'Olindina',NULL),(565,5,'Oliveira dos Brejinhos',NULL),(566,5,'Ouriçangas',NULL),(567,5,'Ourolândia',NULL),(568,5,'Palmas de Monte Alto',NULL),(569,5,'Palmeiras',NULL),(570,5,'Paramirim',NULL),(571,5,'Paratinga',NULL),(572,5,'Paripiranga',NULL),(573,5,'Pau Brasil',NULL),(574,5,'Paulo Afonso',NULL),(575,5,'Pé de Serra',NULL),(576,5,'Pedrão',NULL),(577,5,'Pedro Alexandre',NULL),(578,5,'Piatã',NULL),(579,5,'Pilão Arcado',NULL),(580,5,'Pindaí',NULL),(581,5,'Pindobaçu',NULL),(582,5,'Pintadas',NULL),(583,5,'Piraí do Norte',NULL),(584,5,'Piripá',NULL),(585,5,'Piritiba',NULL),(586,5,'Planaltino',NULL),(587,5,'Planalto',NULL),(588,5,'Poções',NULL),(589,5,'Pojuca',NULL),(590,5,'Ponto Novo',NULL),(591,5,'Porto Seguro',NULL),(592,5,'Potiraguá',NULL),(593,5,'Prado',NULL),(594,5,'Presidente Dutra',NULL),(595,5,'Presidente Jânio Quadros',NULL),(596,5,'Presidente Tancredo Neves',NULL),(597,5,'Queimadas',NULL),(598,5,'Quijingue',NULL),(599,5,'Quixabeira',NULL),(600,5,'Rafael Jambeiro',NULL),(601,5,'Remanso',NULL),(602,5,'Retirolândia',NULL),(603,5,'Riachão das Neves',NULL),(604,5,'Riachão do Jacuípe',NULL),(605,5,'Riacho de Santana',NULL),(606,5,'Ribeira do Amparo',NULL),(607,5,'Ribeira do Pombal',NULL),(608,5,'Ribeirão do Largo',NULL),(609,5,'Rio de Contas',NULL),(610,5,'Rio do Antônio',NULL),(611,5,'Rio do Pires',NULL),(612,5,'Rio Real',NULL),(613,5,'Rodelas',NULL),(614,5,'Ruy Barbosa',NULL),(615,5,'Salinas da Margarida',NULL),(616,5,'Salvador',NULL),(617,5,'Santa Bárbara',NULL),(618,5,'Santa Brígida',NULL),(619,5,'Santa Cruz Cabrália',NULL),(620,5,'Santa Cruz da Vitória',NULL),(621,5,'Santa Inês',NULL),(622,5,'Santa Luzia',NULL),(623,5,'Santa Maria da Vitória',NULL),(624,5,'Santa Rita de Cássia',NULL),(625,5,'Santa Teresinha',NULL),(626,5,'Santaluz',NULL),(627,5,'Santana',NULL),(628,5,'Santanópolis',NULL),(629,5,'Santo Amaro',NULL),(630,5,'Santo Antônio de Jesus',NULL),(631,5,'Santo Estêvão',NULL),(632,5,'São Desidério',NULL),(633,5,'São Domingos',NULL),(634,5,'São Felipe',NULL),(635,5,'São Félix',NULL),(636,5,'São Félix do Coribe',NULL),(637,5,'São Francisco do Conde',NULL),(638,5,'São Gabriel',NULL),(639,5,'São Gonçalo dos Campos',NULL),(640,5,'São José da Vitória',NULL),(641,5,'São José do Jacuípe',NULL),(642,5,'São Miguel das Matas',NULL),(643,5,'São Sebastião do Passé',NULL),(644,5,'Sapeaçu',NULL),(645,5,'Sátiro Dias',NULL),(646,5,'Saubara',NULL),(647,5,'Saúde',NULL),(648,5,'Seabra',NULL),(649,5,'Sebastião Laranjeiras',NULL),(650,5,'Senhor do Bonfim',NULL),(651,5,'Sento Sé',NULL),(652,5,'Serra do Ramalho',NULL),(653,5,'Serra Dourada',NULL),(654,5,'Serra Preta',NULL),(655,5,'Serrinha',NULL),(656,5,'Serrolândia',NULL),(657,5,'Simões Filho',NULL),(658,5,'Sítio do Mato',NULL),(659,5,'Sítio do Quinto',NULL),(660,5,'Sobradinho',NULL),(661,5,'Souto Soares',NULL),(662,5,'Tabocas do Brejo Velho',NULL),(663,5,'Tanhaçu',NULL),(664,5,'Tanque Novo',NULL),(665,5,'Tanquinho',NULL),(666,5,'Taperoá',NULL),(667,5,'Tapiramutá',NULL),(668,5,'Teixeira de Freitas',NULL),(669,5,'Teodoro Sampaio',NULL),(670,5,'Teofilândia',NULL),(671,5,'Teolândia',NULL),(672,5,'Terra Nova',NULL),(673,5,'Tremedal',NULL),(674,5,'Tucano',NULL),(675,5,'Uauá',NULL),(676,5,'Ubaíra',NULL),(677,5,'Ubaitaba',NULL),(678,5,'Ubatã',NULL),(679,5,'Uibaí',NULL),(680,5,'Umburanas',NULL),(681,5,'Una',NULL),(682,5,'Urandi',NULL),(683,5,'Uruçuca',NULL),(684,5,'Utinga',NULL),(685,5,'Valença',NULL),(686,5,'Valente',NULL),(687,5,'Várzea da Roça',NULL),(688,5,'Várzea do Poço',NULL),(689,5,'Várzea Nova',NULL),(690,5,'Varzedo',NULL),(691,5,'Vera Cruz',NULL),(692,5,'Vereda',NULL),(693,5,'Vitória da Conquista',NULL),(694,5,'Wagner',NULL),(695,5,'Wanderley',NULL),(696,5,'Wenceslau Guimarães',NULL),(697,5,'Xique-Xique',NULL),(698,6,'Abaiara',NULL),(699,6,'Acarape',NULL),(700,6,'Acaraú',NULL),(701,6,'Acopiara',NULL),(702,6,'Aiuaba',NULL),(703,6,'Alcântaras',NULL),(704,6,'Altaneira',NULL),(705,6,'Alto Santo',NULL),(706,6,'Amontada',NULL),(707,6,'Antonina do Norte',NULL),(708,6,'Apuiarés',NULL),(709,6,'Aquiraz',NULL),(710,6,'Aracati',NULL),(711,6,'Aracoiaba',NULL),(712,6,'Ararendá',NULL),(713,6,'Araripe',NULL),(714,6,'Aratuba',NULL),(715,6,'Arneiroz',NULL),(716,6,'Assaré',NULL),(717,6,'Aurora',NULL),(718,6,'Baixio',NULL),(719,6,'Banabuiú',NULL),(720,6,'Barbalha',NULL),(721,6,'Barreira',NULL),(722,6,'Barro',NULL),(723,6,'Barroquinha',NULL),(724,6,'Baturité',NULL),(725,6,'Beberibe',NULL),(726,6,'Bela Cruz',NULL),(727,6,'Boa Viagem',NULL),(728,6,'Brejo Santo',NULL),(729,6,'Camocim',NULL),(730,6,'Campos Sales',NULL),(731,6,'Canindé',NULL),(732,6,'Capistrano',NULL),(733,6,'Caridade',NULL),(734,6,'Cariré',NULL),(735,6,'Caririaçu',NULL),(736,6,'Cariús',NULL),(737,6,'Carnaubal',NULL),(738,6,'Cascavel',NULL),(739,6,'Catarina',NULL),(740,6,'Catunda',NULL),(741,6,'Caucaia',NULL),(742,6,'Cedro',NULL),(743,6,'Chaval',NULL),(744,6,'Choró',NULL),(745,6,'Chorozinho',NULL),(746,6,'Coreaú',NULL),(747,6,'Crateús',NULL),(748,6,'Crato',NULL),(749,6,'Croatá',NULL),(750,6,'Cruz',NULL),(751,6,'Deputado Irapuan Pinheiro',NULL),(752,6,'Ererê',NULL),(753,6,'Eusébio',NULL),(754,6,'Farias Brito',NULL),(755,6,'Forquilha',NULL),(756,6,'Fortaleza',NULL),(757,6,'Fortim',NULL),(758,6,'Frecheirinha',NULL),(759,6,'General Sampaio',NULL),(760,6,'Graça',NULL),(761,6,'Granja',NULL),(762,6,'Granjeiro',NULL),(763,6,'Groaíras',NULL),(764,6,'Guaiúba',NULL),(765,6,'Guaraciaba do Norte',NULL),(766,6,'Guaramiranga',NULL),(767,6,'Hidrolândia',NULL),(768,6,'Horizonte',NULL),(769,6,'Ibaretama',NULL),(770,6,'Ibiapina',NULL),(771,6,'Ibicuitinga',NULL),(772,6,'Icapuí',NULL),(773,6,'Icó',NULL),(774,6,'Iguatu',NULL),(775,6,'Independência',NULL),(776,6,'Ipaporanga',NULL),(777,6,'Ipaumirim',NULL),(778,6,'Ipu',NULL),(779,6,'Ipueiras',NULL),(780,6,'Iracema',NULL),(781,6,'Irauçuba',NULL),(782,6,'Itaiçaba',NULL),(783,6,'Itaitinga',NULL),(784,6,'Itapagé',NULL),(785,6,'Itapipoca',NULL),(786,6,'Itapiúna',NULL),(787,6,'Itarema',NULL),(788,6,'Itatira',NULL),(789,6,'Jaguaretama',NULL),(790,6,'Jaguaribara',NULL),(791,6,'Jaguaribe',NULL),(792,6,'Jaguaruana',NULL),(793,6,'Jardim',NULL),(794,6,'Jati',NULL),(795,6,'Jijoca de Jericoacoara',NULL),(796,6,'Juazeiro do Norte',NULL),(797,6,'Jucás',NULL),(798,6,'Lavras da Mangabeira',NULL),(799,6,'Limoeiro do Norte',NULL),(800,6,'Madalena',NULL),(801,6,'Maracanaú',NULL),(802,6,'Maranguape',NULL),(803,6,'Marco',NULL),(804,6,'Martinópole',NULL),(805,6,'Massapê',NULL),(806,6,'Mauriti',NULL),(807,6,'Meruoca',NULL),(808,6,'Milagres',NULL),(809,6,'Milhã',NULL),(810,6,'Miraíma',NULL),(811,6,'Missão Velha',NULL),(812,6,'Mombaça',NULL),(813,6,'Monsenhor Tabosa',NULL),(814,6,'Morada Nova',NULL),(815,6,'Moraújo',NULL),(816,6,'Morrinhos',NULL),(817,6,'Mucambo',NULL),(818,6,'Mulungu',NULL),(819,6,'Nova Olinda',NULL),(820,6,'Nova Russas',NULL),(821,6,'Novo Oriente',NULL),(822,6,'Ocara',NULL),(823,6,'Orós',NULL),(824,6,'Pacajus',NULL),(825,6,'Pacatuba',NULL),(826,6,'Pacoti',NULL),(827,6,'Pacujá',NULL),(828,6,'Palhano',NULL),(829,6,'Palmácia',NULL),(830,6,'Paracuru',NULL),(831,6,'Paraipaba',NULL),(832,6,'Parambu',NULL),(833,6,'Paramoti',NULL),(834,6,'Pedra Branca',NULL),(835,6,'Penaforte',NULL),(836,6,'Pentecoste',NULL),(837,6,'Pereiro',NULL),(838,6,'Pindoretama',NULL),(839,6,'Piquet Carneiro',NULL),(840,6,'Pires Ferreira',NULL),(841,6,'Poranga',NULL),(842,6,'Porteiras',NULL),(843,6,'Potengi',NULL),(844,6,'Potiretama',NULL),(845,6,'Quiterianópolis',NULL),(846,6,'Quixadá',NULL),(847,6,'Quixelô',NULL),(848,6,'Quixeramobim',NULL),(849,6,'Quixeré',NULL),(850,6,'Redenção',NULL),(851,6,'Reriutaba',NULL),(852,6,'Russas',NULL),(853,6,'Saboeiro',NULL),(854,6,'Salitre',NULL),(855,6,'Santa Quitéria',NULL),(856,6,'Santana do Acaraú',NULL),(857,6,'Santana do Cariri',NULL),(858,6,'São Benedito',NULL),(859,6,'São Gonçalo do Amarante',NULL),(860,6,'São João do Jaguaribe',NULL),(861,6,'São Luís do Curu',NULL),(862,6,'Senador Pompeu',NULL),(863,6,'Senador Sá',NULL),(864,6,'Sobral',NULL),(865,6,'Solonópole',NULL),(866,6,'Tabuleiro do Norte',NULL),(867,6,'Tamboril',NULL),(868,6,'Tarrafas',NULL),(869,6,'Tauá',NULL),(870,6,'Tejuçuoca',NULL),(871,6,'Tianguá',NULL),(872,6,'Trairi',NULL),(873,6,'Tururu',NULL),(874,6,'Ubajara',NULL),(875,6,'Umari',NULL),(876,6,'Umirim',NULL),(877,6,'Uruburetama',NULL),(878,6,'Uruoca',NULL),(879,6,'Varjota',NULL),(880,6,'Várzea Alegre',NULL),(881,6,'Viçosa do Ceará',NULL),(882,7,'Brasília',NULL),(883,9,'Abadia de Goiás',NULL),(884,9,'Abadiânia',NULL),(885,9,'Acreúna',NULL),(886,9,'Adelândia',NULL),(887,9,'Água Fria de Goiás',NULL),(888,9,'Água Limpa',NULL),(889,9,'Águas Lindas de Goiás',NULL),(890,9,'Alexânia',NULL),(891,9,'Aloândia',NULL),(892,9,'Alto Horizonte',NULL),(893,9,'Alto Paraíso de Goiás',NULL),(894,9,'Alvorada do Norte',NULL),(895,9,'Amaralina',NULL),(896,9,'Americano do Brasil',NULL),(897,9,'Amorinópolis',NULL),(898,9,'Anápolis',NULL),(899,9,'Anhanguera',NULL),(900,9,'Anicuns',NULL),(901,9,'Aparecida de Goiânia',NULL),(902,9,'Aparecida do Rio Doce',NULL),(903,9,'Aporé',NULL),(904,9,'Araçu',NULL),(905,9,'Aragarças',NULL),(906,9,'Aragoiânia',NULL),(907,9,'Araguapaz',NULL),(908,9,'Arenópolis',NULL),(909,9,'Aruanã',NULL),(910,9,'Aurilândia',NULL),(911,9,'Avelinópolis',NULL),(912,9,'Baliza',NULL),(913,9,'Barro Alto',NULL),(914,9,'Bela Vista de Goiás',NULL),(915,9,'Bom Jardim de Goiás',NULL),(916,9,'Bom Jesus de Goiás',NULL),(917,9,'Bonfinópolis',NULL),(918,9,'Bonópolis',NULL),(919,9,'Brazabrantes',NULL),(920,9,'Britânia',NULL),(921,9,'Buriti Alegre',NULL),(922,9,'Buriti de Goiás',NULL),(923,9,'Buritinópolis',NULL),(924,9,'Cabeceiras',NULL),(925,9,'Cachoeira Alta',NULL),(926,9,'Cachoeira de Goiás',NULL),(927,9,'Cachoeira Dourada',NULL),(928,9,'Caçu',NULL),(929,9,'Caiapônia',NULL),(930,9,'Caldas Novas',NULL),(931,9,'Caldazinha',NULL),(932,9,'Campestre de Goiás',NULL),(933,9,'Campinaçu',NULL),(934,9,'Campinorte',NULL),(935,9,'Campo Alegre de Goiás',NULL),(936,9,'Campo Limpo de Goiás',NULL),(937,9,'Campos Belos',NULL),(938,9,'Campos Verdes',NULL),(939,9,'Carmo do Rio Verde',NULL),(940,9,'Castelândia',NULL),(941,9,'Catalão',NULL),(942,9,'Caturaí',NULL),(943,9,'Cavalcante',NULL),(944,9,'Ceres',NULL),(945,9,'Cezarina',NULL),(946,9,'Chapadão do Céu',NULL),(947,9,'Cidade Ocidental',NULL),(948,9,'Cocalzinho de Goiás',NULL),(949,9,'Colinas do Sul',NULL),(950,9,'Córrego do Ouro',NULL),(951,9,'Corumbá de Goiás',NULL),(952,9,'Corumbaíba',NULL),(953,9,'Cristalina',NULL),(954,9,'Cristianópolis',NULL),(955,9,'Crixás',NULL),(956,9,'Cromínia',NULL),(957,9,'Cumari',NULL),(958,9,'Damianópolis',NULL),(959,9,'Damolândia',NULL),(960,9,'Davinópolis',NULL),(961,9,'Diorama',NULL),(962,9,'Divinópolis de Goiás',NULL),(963,9,'Doverlândia',NULL),(964,9,'Edealina',NULL),(965,9,'Edéia',NULL),(966,9,'Estrela do Norte',NULL),(967,9,'Faina',NULL),(968,9,'Fazenda Nova',NULL),(969,9,'Firminópolis',NULL),(970,9,'Flores de Goiás',NULL),(971,9,'Formosa',NULL),(972,9,'Formoso',NULL),(973,9,'Gameleira de Goiás',NULL),(974,9,'Goianápolis',NULL),(975,9,'Goiandira',NULL),(976,9,'Goianésia',NULL),(977,9,'Goiânia',NULL),(978,9,'Goianira',NULL),(979,9,'Goiás',NULL),(980,9,'Goiatuba',NULL),(981,9,'Gouvelândia',NULL),(982,9,'Guapó',NULL),(983,9,'Guaraíta',NULL),(984,9,'Guarani de Goiás',NULL),(985,9,'Guarinos',NULL),(986,9,'Heitoraí',NULL),(987,9,'Hidrolândia',NULL),(988,9,'Hidrolina',NULL),(989,9,'Iaciara',NULL),(990,9,'Inaciolândia',NULL),(991,9,'Indiara',NULL),(992,9,'Inhumas',NULL),(993,9,'Ipameri',NULL),(994,9,'Ipiranga de Goiás',NULL),(995,9,'Iporá',NULL),(996,9,'Israelândia',NULL),(997,9,'Itaberaí',NULL),(998,9,'Itaguari',NULL),(999,9,'Itaguaru',NULL),(1000,9,'Itajá',NULL),(1001,9,'Itapaci',NULL),(1002,9,'Itapirapuã',NULL),(1003,9,'Itapuranga',NULL),(1004,9,'Itarumã',NULL),(1005,9,'Itauçu',NULL),(1006,9,'Itumbiara',NULL),(1007,9,'Ivolândia',NULL),(1008,9,'Jandaia',NULL),(1009,9,'Jaraguá',NULL),(1010,9,'Jataí',NULL),(1011,9,'Jaupaci',NULL),(1012,9,'Jesúpolis',NULL),(1013,9,'Joviânia',NULL),(1014,9,'Jussara',NULL),(1015,9,'Lagoa Santa',NULL),(1016,9,'Leopoldo de Bulhões',NULL),(1017,9,'Luziânia',NULL),(1018,9,'Mairipotaba',NULL),(1019,9,'Mambaí',NULL),(1020,9,'Mara Rosa',NULL),(1021,9,'Marzagão',NULL),(1022,9,'Matrinchã',NULL),(1023,9,'Maurilândia',NULL),(1024,9,'Mimoso de Goiás',NULL),(1025,9,'Minaçu',NULL),(1026,9,'Mineiros',NULL),(1027,9,'Moiporá',NULL),(1028,9,'Monte Alegre de Goiás',NULL),(1029,9,'Montes Claros de Goiás',NULL),(1030,9,'Montividiu',NULL),(1031,9,'Montividiu do Norte',NULL),(1032,9,'Morrinhos',NULL),(1033,9,'Morro Agudo de Goiás',NULL),(1034,9,'Mossâmedes',NULL),(1035,9,'Mozarlândia',NULL),(1036,9,'Mundo Novo',NULL),(1037,9,'Mutunópolis',NULL),(1038,9,'Nazário',NULL),(1039,9,'Nerópolis',NULL),(1040,9,'Niquelândia',NULL),(1041,9,'Nova América',NULL),(1042,9,'Nova Aurora',NULL),(1043,9,'Nova Crixás',NULL),(1044,9,'Nova Glória',NULL),(1045,9,'Nova Iguaçu de Goiás',NULL),(1046,9,'Nova Roma',NULL),(1047,9,'Nova Veneza',NULL),(1048,9,'Novo Brasil',NULL),(1049,9,'Novo Gama',NULL),(1050,9,'Novo Planalto',NULL),(1051,9,'Orizona',NULL),(1052,9,'Ouro Verde de Goiás',NULL),(1053,9,'Ouvidor',NULL),(1054,9,'Padre Bernardo',NULL),(1055,9,'Palestina de Goiás',NULL),(1056,9,'Palmeiras de Goiás',NULL),(1057,9,'Palmelo',NULL),(1058,9,'Palminópolis',NULL),(1059,9,'Panamá',NULL),(1060,9,'Paranaiguara',NULL),(1061,9,'Paraúna',NULL),(1062,9,'Perolândia',NULL),(1063,9,'Petrolina de Goiás',NULL),(1064,9,'Pilar de Goiás',NULL),(1065,9,'Piracanjuba',NULL),(1066,9,'Piranhas',NULL),(1067,9,'Pirenópolis',NULL),(1068,9,'Pires do Rio',NULL),(1069,9,'Planaltina',NULL),(1070,9,'Pontalina',NULL),(1071,9,'Porangatu',NULL),(1072,9,'Porteirão',NULL),(1073,9,'Portelândia',NULL),(1074,9,'Posse',NULL),(1075,9,'Professor Jamil',NULL),(1076,9,'Quirinópolis',NULL),(1077,9,'Rialma',NULL),(1078,9,'Rianápolis',NULL),(1079,9,'Rio Quente',NULL),(1080,9,'Rio Verde',NULL),(1081,9,'Rubiataba',NULL),(1082,9,'Sanclerlândia',NULL),(1083,9,'Santa Bárbara de Goiás',NULL),(1084,9,'Santa Cruz de Goiás',NULL),(1085,9,'Santa Fé de Goiás',NULL),(1086,9,'Santa Helena de Goiás',NULL),(1087,9,'Santa Isabel',NULL),(1088,9,'Santa Rita do Araguaia',NULL),(1089,9,'Santa Rita do Novo Destino',NULL),(1090,9,'Santa Rosa de Goiás',NULL),(1091,9,'Santa Tereza de Goiás',NULL),(1092,9,'Santa Terezinha de Goiás',NULL),(1093,9,'Santo Antônio da Barra',NULL),(1094,9,'Santo Antônio de Goiás',NULL),(1095,9,'Santo Antônio do Descoberto',NULL),(1096,9,'São Domingos',NULL),(1097,9,'São Francisco de Goiás',NULL),(1098,9,'São João d`Aliança',NULL),(1099,9,'São João da Paraúna',NULL),(1100,9,'São Luís de Montes Belos',NULL),(1101,9,'São Luíz do Norte',NULL),(1102,9,'São Miguel do Araguaia',NULL),(1103,9,'São Miguel do Passa Quatro',NULL),(1104,9,'São Patrício',NULL),(1105,9,'São Simão',NULL),(1106,9,'Senador Canedo',NULL),(1107,9,'Serranópolis',NULL),(1108,9,'Silvânia',NULL),(1109,9,'Simolândia',NULL),(1110,9,'Sítio d`Abadia',NULL),(1111,9,'Taquaral de Goiás',NULL),(1112,9,'Teresina de Goiás',NULL),(1113,9,'Terezópolis de Goiás',NULL),(1114,9,'Três Ranchos',NULL),(1115,9,'Trindade',NULL),(1116,9,'Trombas',NULL),(1117,9,'Turvânia',NULL),(1118,9,'Turvelândia',NULL),(1119,9,'Uirapuru',NULL),(1120,9,'Uruaçu',NULL),(1121,9,'Uruana',NULL),(1122,9,'Urutaí',NULL),(1123,9,'Valparaíso de Goiás',NULL),(1124,9,'Varjão',NULL),(1125,9,'Vianópolis',NULL),(1126,9,'Vicentinópolis',NULL),(1127,9,'Vila Boa',NULL),(1128,9,'Vila Propício',NULL),(1129,10,'Açailândia',NULL),(1130,10,'Afonso Cunha',NULL),(1131,10,'Água Doce do Maranhão',NULL),(1132,10,'Alcântara',NULL),(1133,10,'Aldeias Altas',NULL),(1134,10,'Altamira do Maranhão',NULL),(1135,10,'Alto Alegre do Maranhão',NULL),(1136,10,'Alto Alegre do Pindaré',NULL),(1137,10,'Alto Parnaíba',NULL),(1138,10,'Amapá do Maranhão',NULL),(1139,10,'Amarante do Maranhão',NULL),(1140,10,'Anajatuba',NULL),(1141,10,'Anapurus',NULL),(1142,10,'Apicum-Açu',NULL),(1143,10,'Araguanã',NULL),(1144,10,'Araioses',NULL),(1145,10,'Arame',NULL),(1146,10,'Arari',NULL),(1147,10,'Axixá',NULL),(1148,10,'Bacabal',NULL),(1149,10,'Bacabeira',NULL),(1150,10,'Bacuri',NULL),(1151,10,'Bacurituba',NULL),(1152,10,'Balsas',NULL),(1153,10,'Barão de Grajaú',NULL),(1154,10,'Barra do Corda',NULL),(1155,10,'Barreirinhas',NULL),(1156,10,'Bela Vista do Maranhão',NULL),(1157,10,'Belágua',NULL),(1158,10,'Benedito Leite',NULL),(1159,10,'Bequimão',NULL),(1160,10,'Bernardo do Mearim',NULL),(1161,10,'Boa Vista do Gurupi',NULL),(1162,10,'Bom Jardim',NULL),(1163,10,'Bom Jesus das Selvas',NULL),(1164,10,'Bom Lugar',NULL),(1165,10,'Brejo',NULL),(1166,10,'Brejo de Areia',NULL),(1167,10,'Buriti',NULL),(1168,10,'Buriti Bravo',NULL),(1169,10,'Buriticupu',NULL),(1170,10,'Buritirana',NULL),(1171,10,'Cachoeira Grande',NULL),(1172,10,'Cajapió',NULL),(1173,10,'Cajari',NULL),(1174,10,'Campestre do Maranhão',NULL),(1175,10,'Cândido Mendes',NULL),(1176,10,'Cantanhede',NULL),(1177,10,'Capinzal do Norte',NULL),(1178,10,'Carolina',NULL),(1179,10,'Carutapera',NULL),(1180,10,'Caxias',NULL),(1181,10,'Cedral',NULL),(1182,10,'Central do Maranhão',NULL),(1183,10,'Centro do Guilherme',NULL),(1184,10,'Centro Novo do Maranhão',NULL),(1185,10,'Chapadinha',NULL),(1186,10,'Cidelândia',NULL),(1187,10,'Codó',NULL),(1188,10,'Coelho Neto',NULL),(1189,10,'Colinas',NULL),(1190,10,'Conceição do Lago-Açu',NULL),(1191,10,'Coroatá',NULL),(1192,10,'Cururupu',NULL),(1193,10,'Davinópolis',NULL),(1194,10,'Dom Pedro',NULL),(1195,10,'Duque Bacelar',NULL),(1196,10,'Esperantinópolis',NULL),(1197,10,'Estreito',NULL),(1198,10,'Feira Nova do Maranhão',NULL),(1199,10,'Fernando Falcão',NULL),(1200,10,'Formosa da Serra Negra',NULL),(1201,10,'Fortaleza dos Nogueiras',NULL),(1202,10,'Fortuna',NULL),(1203,10,'Godofredo Viana',NULL),(1204,10,'Gonçalves Dias',NULL),(1205,10,'Governador Archer',NULL),(1206,10,'Governador Edison Lobão',NULL),(1207,10,'Governador Eugênio Barros',NULL),(1208,10,'Governador Luiz Rocha',NULL),(1209,10,'Governador Newton Bello',NULL),(1210,10,'Governador Nunes Freire',NULL),(1211,10,'Graça Aranha',NULL),(1212,10,'Grajaú',NULL),(1213,10,'Guimarães',NULL),(1214,10,'Humberto de Campos',NULL),(1215,10,'Icatu',NULL),(1216,10,'Igarapé do Meio',NULL),(1217,10,'Igarapé Grande',NULL),(1218,10,'Imperatriz',NULL),(1219,10,'Itaipava do Grajaú',NULL),(1220,10,'Itapecuru Mirim',NULL),(1221,10,'Itinga do Maranhão',NULL),(1222,10,'Jatobá',NULL),(1223,10,'Jenipapo dos Vieiras',NULL),(1224,10,'João Lisboa',NULL),(1225,10,'Joselândia',NULL),(1226,10,'Junco do Maranhão',NULL),(1227,10,'Lago da Pedra',NULL),(1228,10,'Lago do Junco',NULL),(1229,10,'Lago dos Rodrigues',NULL),(1230,10,'Lago Verde',NULL),(1231,10,'Lagoa do Mato',NULL),(1232,10,'Lagoa Grande do Maranhão',NULL),(1233,10,'Lajeado Novo',NULL),(1234,10,'Lima Campos',NULL),(1235,10,'Loreto',NULL),(1236,10,'Luís Domingues',NULL),(1237,10,'Magalhães de Almeida',NULL),(1238,10,'Maracaçumé',NULL),(1239,10,'Marajá do Sena',NULL),(1240,10,'Maranhãozinho',NULL),(1241,10,'Mata Roma',NULL),(1242,10,'Matinha',NULL),(1243,10,'Matões',NULL),(1244,10,'Matões do Norte',NULL),(1245,10,'Milagres do Maranhão',NULL),(1246,10,'Mirador',NULL),(1247,10,'Miranda do Norte',NULL),(1248,10,'Mirinzal',NULL),(1249,10,'Monção',NULL),(1250,10,'Montes Altos',NULL),(1251,10,'Morros',NULL),(1252,10,'Nina Rodrigues',NULL),(1253,10,'Nova Colinas',NULL),(1254,10,'Nova Iorque',NULL),(1255,10,'Nova Olinda do Maranhão',NULL),(1256,10,'Olho d`Água das Cunhãs',NULL),(1257,10,'Olinda Nova do Maranhão',NULL),(1258,10,'Paço do Lumiar',NULL),(1259,10,'Palmeirândia',NULL),(1260,10,'Paraibano',NULL),(1261,10,'Parnarama',NULL),(1262,10,'Passagem Franca',NULL),(1263,10,'Pastos Bons',NULL),(1264,10,'Paulino Neves',NULL),(1265,10,'Paulo Ramos',NULL),(1266,10,'Pedreiras',NULL),(1267,10,'Pedro do Rosário',NULL),(1268,10,'Penalva',NULL),(1269,10,'Peri Mirim',NULL),(1270,10,'Peritoró',NULL),(1271,10,'Pindaré-Mirim',NULL),(1272,10,'Pinheiro',NULL),(1273,10,'Pio XII',NULL),(1274,10,'Pirapemas',NULL),(1275,10,'Poção de Pedras',NULL),(1276,10,'Porto Franco',NULL),(1277,10,'Porto Rico do Maranhão',NULL),(1278,10,'Presidente Dutra',NULL),(1279,10,'Presidente Juscelino',NULL),(1280,10,'Presidente Médici',NULL),(1281,10,'Presidente Sarney',NULL),(1282,10,'Presidente Vargas',NULL),(1283,10,'Primeira Cruz',NULL),(1284,10,'Raposa',NULL),(1285,10,'Riachão',NULL),(1286,10,'Ribamar Fiquene',NULL),(1287,10,'Rosário',NULL),(1288,10,'Sambaíba',NULL),(1289,10,'Santa Filomena do Maranhão',NULL),(1290,10,'Santa Helena',NULL),(1291,10,'Santa Inês',NULL),(1292,10,'Santa Luzia',NULL),(1293,10,'Santa Luzia do Paruá',NULL),(1294,10,'Santa Quitéria do Maranhão',NULL),(1295,10,'Santa Rita',NULL),(1296,10,'Santana do Maranhão',NULL),(1297,10,'Santo Amaro do Maranhão',NULL),(1298,10,'Santo Antônio dos Lopes',NULL),(1299,10,'São Benedito do Rio Preto',NULL),(1300,10,'São Bento',NULL),(1301,10,'São Bernardo',NULL),(1302,10,'São Domingos do Azeitão',NULL),(1303,10,'São Domingos do Maranhão',NULL),(1304,10,'São Félix de Balsas',NULL),(1305,10,'São Francisco do Brejão',NULL),(1306,10,'São Francisco do Maranhão',NULL),(1307,10,'São João Batista',NULL),(1308,10,'São João do Carú',NULL),(1309,10,'São João do Paraíso',NULL),(1310,10,'São João do Soter',NULL),(1311,10,'São João dos Patos',NULL),(1312,10,'São José de Ribamar',NULL),(1313,10,'São José dos Basílios',NULL),(1314,10,'São Luís',NULL),(1315,10,'São Luís Gonzaga do Maranhão',NULL),(1316,10,'São Mateus do Maranhão',NULL),(1317,10,'São Pedro da Água Branca',NULL),(1318,10,'São Pedro dos Crentes',NULL),(1319,10,'São Raimundo das Mangabeiras',NULL),(1320,10,'São Raimundo do Doca Bezerra',NULL),(1321,10,'São Roberto',NULL),(1322,10,'São Vicente Ferrer',NULL),(1323,10,'Satubinha',NULL),(1324,10,'Senador Alexandre Costa',NULL),(1325,10,'Senador La Rocque',NULL),(1326,10,'Serrano do Maranhão',NULL),(1327,10,'Sítio Novo',NULL),(1328,10,'Sucupira do Norte',NULL),(1329,10,'Sucupira do Riachão',NULL),(1330,10,'Tasso Fragoso',NULL),(1331,10,'Timbiras',NULL),(1332,10,'Timon',NULL),(1333,10,'Trizidela do Vale',NULL),(1334,10,'Tufilândia',NULL),(1335,10,'Tuntum',NULL),(1336,10,'Turiaçu',NULL),(1337,10,'Turilândia',NULL),(1338,10,'Tutóia',NULL),(1339,10,'Urbano Santos',NULL),(1340,10,'Vargem Grande',NULL),(1341,10,'Viana',NULL),(1342,10,'Vila Nova dos Martírios',NULL),(1343,10,'Vitória do Mearim',NULL),(1344,10,'Vitorino Freire',NULL),(1345,10,'Zé Doca',NULL),(1346,13,'Acorizal',NULL),(1347,13,'Água Boa',NULL),(1348,13,'Alta Floresta',NULL),(1349,13,'Alto Araguaia',NULL),(1350,13,'Alto Boa Vista',NULL),(1351,13,'Alto Garças',NULL),(1352,13,'Alto Paraguai',NULL),(1353,13,'Alto Taquari',NULL),(1354,13,'Apiacás',NULL),(1355,13,'Araguaiana',NULL),(1356,13,'Araguainha',NULL),(1357,13,'Araputanga',NULL),(1358,13,'Arenápolis',NULL),(1359,13,'Aripuanã',NULL),(1360,13,'Barão de Melgaço',NULL),(1361,13,'Barra do Bugres',NULL),(1362,13,'Barra do Garças',NULL),(1363,13,'Bom Jesus do Araguaia',NULL),(1364,13,'Brasnorte',NULL),(1365,13,'Cáceres',NULL),(1366,13,'Campinápolis',NULL),(1367,13,'Campo Novo do Parecis',NULL),(1368,13,'Campo Verde',NULL),(1369,13,'Campos de Júlio',NULL),(1370,13,'Canabrava do Norte',NULL),(1371,13,'Canarana',NULL),(1372,13,'Carlinda',NULL),(1373,13,'Castanheira',NULL),(1374,13,'Chapada dos Guimarães',NULL),(1375,13,'Cláudia',NULL),(1376,13,'Cocalinho',NULL),(1377,13,'Colíder',NULL),(1378,13,'Colniza',NULL),(1379,13,'Comodoro',NULL),(1380,13,'Confresa',NULL),(1381,13,'Conquista d`Oeste',NULL),(1382,13,'Cotriguaçu',NULL),(1383,13,'Cuiabá',NULL),(1384,13,'Curvelândia',NULL),(1385,13,'Curvelândia',NULL),(1386,13,'Denise',NULL),(1387,13,'Diamantino',NULL),(1388,13,'Dom Aquino',NULL),(1389,13,'Feliz Natal',NULL),(1390,13,'Figueirópolis d`Oeste',NULL),(1391,13,'Gaúcha do Norte',NULL),(1392,13,'General Carneiro',NULL),(1393,13,'Glória d`Oeste',NULL),(1394,13,'Guarantã do Norte',NULL),(1395,13,'Guiratinga',NULL),(1396,13,'Indiavaí',NULL),(1397,13,'Ipiranga do Norte',NULL),(1398,13,'Itanhangá',NULL),(1399,13,'Itaúba',NULL),(1400,13,'Itiquira',NULL),(1401,13,'Jaciara',NULL),(1402,13,'Jangada',NULL),(1403,13,'Jauru',NULL),(1404,13,'Juara',NULL),(1405,13,'Juína',NULL),(1406,13,'Juruena',NULL),(1407,13,'Juscimeira',NULL),(1408,13,'Lambari d`Oeste',NULL),(1409,13,'Lucas do Rio Verde',NULL),(1410,13,'Luciára',NULL),(1411,13,'Marcelândia',NULL),(1412,13,'Matupá',NULL),(1413,13,'Mirassol d`Oeste',NULL),(1414,13,'Nobres',NULL),(1415,13,'Nortelândia',NULL),(1416,13,'Nossa Senhora do Livramento',NULL),(1417,13,'Nova Bandeirantes',NULL),(1418,13,'Nova Brasilândia',NULL),(1419,13,'Nova Canaã do Norte',NULL),(1420,13,'Nova Guarita',NULL),(1421,13,'Nova Lacerda',NULL),(1422,13,'Nova Marilândia',NULL),(1423,13,'Nova Maringá',NULL),(1424,13,'Nova Monte verde',NULL),(1425,13,'Nova Mutum',NULL),(1426,13,'Nova Olímpia',NULL),(1427,13,'Nova Santa Helena',NULL),(1428,13,'Nova Ubiratã',NULL),(1429,13,'Nova Xavantina',NULL),(1430,13,'Novo Horizonte do Norte',NULL),(1431,13,'Novo Mundo',NULL),(1432,13,'Novo Santo Antônio',NULL),(1433,13,'Novo São Joaquim',NULL),(1434,13,'Paranaíta',NULL),(1435,13,'Paranatinga',NULL),(1436,13,'Pedra Preta',NULL),(1437,13,'Peixoto de Azevedo',NULL),(1438,13,'Planalto da Serra',NULL),(1439,13,'Poconé',NULL),(1440,13,'Pontal do Araguaia',NULL),(1441,13,'Ponte Branca',NULL),(1442,13,'Pontes e Lacerda',NULL),(1443,13,'Porto Alegre do Norte',NULL),(1444,13,'Porto dos Gaúchos',NULL),(1445,13,'Porto Esperidião',NULL),(1446,13,'Porto Estrela',NULL),(1447,13,'Poxoréo',NULL),(1448,13,'Primavera do Leste',NULL),(1449,13,'Querência',NULL),(1450,13,'Reserva do Cabaçal',NULL),(1451,13,'Ribeirão Cascalheira',NULL),(1452,13,'Ribeirãozinho',NULL),(1453,13,'Rio Branco',NULL),(1454,13,'Rondolândia',NULL),(1455,13,'Rondonópolis',NULL),(1456,13,'Rosário Oeste',NULL),(1457,13,'Salto do Céu',NULL),(1458,13,'Santa Carmem',NULL),(1459,13,'Santa Cruz do Xingu',NULL),(1460,13,'Santa Rita do Trivelato',NULL),(1461,13,'Santa Terezinha',NULL),(1462,13,'Santo Afonso',NULL),(1463,13,'Santo Antônio do Leste',NULL),(1464,13,'Santo Antônio do Leverger',NULL),(1465,13,'São Félix do Araguaia',NULL),(1466,13,'São José do Povo',NULL),(1467,13,'São José do Rio Claro',NULL),(1468,13,'São José do Xingu',NULL),(1469,13,'São José dos Quatro Marcos',NULL),(1470,13,'São Pedro da Cipa',NULL),(1471,13,'Sapezal',NULL),(1472,13,'Serra Nova Dourada',NULL),(1473,13,'Sinop',NULL),(1474,13,'Sorriso',NULL),(1475,13,'Tabaporã',NULL),(1476,13,'Tangará da Serra',NULL),(1477,13,'Tapurah',NULL),(1478,13,'Terra Nova do Norte',NULL),(1479,13,'Tesouro',NULL),(1480,13,'Torixoréu',NULL),(1481,13,'União do Sul',NULL),(1482,13,'Vale de São Domingos',NULL),(1483,13,'Várzea Grande',NULL),(1484,13,'Vera',NULL),(1485,13,'Vila Bela da Santíssima Trindade',NULL),(1486,13,'Vila Rica',NULL),(1487,12,'Água Clara',NULL),(1488,12,'Alcinópolis',NULL),(1489,12,'Amambaí',NULL),(1490,12,'Anastácio',NULL),(1491,12,'Anaurilândia',NULL),(1492,12,'Angélica',NULL),(1493,12,'Antônio João',NULL),(1494,12,'Aparecida do Taboado',NULL),(1495,12,'Aquidauana',NULL),(1496,12,'Aral Moreira',NULL),(1497,12,'Bandeirantes',NULL),(1498,12,'Bataguassu',NULL),(1499,12,'Bataiporã',NULL),(1500,12,'Bela Vista',NULL),(1501,12,'Bodoquena',NULL),(1502,12,'Bonito',NULL),(1503,12,'Brasilândia',NULL),(1504,12,'Caarapó',NULL),(1505,12,'Camapuã',NULL),(1506,12,'Campo Grande',NULL),(1507,12,'Caracol',NULL),(1508,12,'Cassilândia',NULL),(1509,12,'Chapadão do Sul',NULL),(1510,12,'Corguinho',NULL),(1511,12,'Coronel Sapucaia',NULL),(1512,12,'Corumbá',NULL),(1513,12,'Costa Rica',NULL),(1514,12,'Coxim',NULL),(1515,12,'Deodápolis',NULL),(1516,12,'Dois Irmãos do Buriti',NULL),(1517,12,'Douradina',NULL),(1518,12,'Dourados',NULL),(1519,12,'Eldorado',NULL),(1520,12,'Fátima do Sul',NULL),(1521,12,'Figueirão',NULL),(1522,12,'Glória de Dourados',NULL),(1523,12,'Guia Lopes da Laguna',NULL),(1524,12,'Iguatemi',NULL),(1525,12,'Inocência',NULL),(1526,12,'Itaporã',NULL),(1527,12,'Itaquiraí',NULL),(1528,12,'Ivinhema',NULL),(1529,12,'Japorã',NULL),(1530,12,'Jaraguari',NULL),(1531,12,'Jardim',NULL),(1532,12,'Jateí',NULL),(1533,12,'Juti',NULL),(1534,12,'Ladário',NULL),(1535,12,'Laguna Carapã',NULL),(1536,12,'Maracaju',NULL),(1537,12,'Miranda',NULL),(1538,12,'Mundo Novo',NULL),(1539,12,'Naviraí',NULL),(1540,12,'Nioaque',NULL),(1541,12,'Nova Alvorada do Sul',NULL),(1542,12,'Nova Andradina',NULL),(1543,12,'Novo Horizonte do Sul',NULL),(1544,12,'Paranaíba',NULL),(1545,12,'Paranhos',NULL),(1546,12,'Pedro Gomes',NULL),(1547,12,'Ponta Porã',NULL),(1548,12,'Porto Murtinho',NULL),(1549,12,'Ribas do Rio Pardo',NULL),(1550,12,'Rio Brilhante',NULL),(1551,12,'Rio Negro',NULL),(1552,12,'Rio Verde de Mato Grosso',NULL),(1553,12,'Rochedo',NULL),(1554,12,'Santa Rita do Pardo',NULL),(1555,12,'São Gabriel do Oeste',NULL),(1556,12,'Selvíria',NULL),(1557,12,'Sete Quedas',NULL),(1558,12,'Sidrolândia',NULL),(1559,12,'Sonora',NULL),(1560,12,'Tacuru',NULL),(1561,12,'Taquarussu',NULL),(1562,12,'Terenos',NULL),(1563,12,'Três Lagoas',NULL),(1564,12,'Vicentina',NULL),(1565,11,'Abadia dos Dourados',NULL),(1566,11,'Abaeté',NULL),(1567,11,'Abre Campo',NULL),(1568,11,'Acaiaca',NULL),(1569,11,'Açucena',NULL),(1570,11,'Água Boa',NULL),(1571,11,'Água Comprida',NULL),(1572,11,'Aguanil',NULL),(1573,11,'Águas Formosas',NULL),(1574,11,'Águas Vermelhas',NULL),(1575,11,'Aimorés',NULL),(1576,11,'Aiuruoca',NULL),(1577,11,'Alagoa',NULL),(1578,11,'Albertina',NULL),(1579,11,'Além Paraíba',NULL),(1580,11,'Alfenas',NULL),(1581,11,'Alfredo Vasconcelos',NULL),(1582,11,'Almenara',NULL),(1583,11,'Alpercata',NULL),(1584,11,'Alpinópolis',NULL),(1585,11,'Alterosa',NULL),(1586,11,'Alto Caparaó',NULL),(1587,11,'Alto Jequitibá',NULL),(1588,11,'Alto Rio Doce',NULL),(1589,11,'Alvarenga',NULL),(1590,11,'Alvinópolis',NULL),(1591,11,'Alvorada de Minas',NULL),(1592,11,'Amparo do Serra',NULL),(1593,11,'Andradas',NULL),(1594,11,'Andrelândia',NULL),(1595,11,'Angelândia',NULL),(1596,11,'Antônio Carlos',NULL),(1597,11,'Antônio Dias',NULL),(1598,11,'Antônio Prado de Minas',NULL),(1599,11,'Araçaí',NULL),(1600,11,'Aracitaba',NULL),(1601,11,'Araçuaí',NULL),(1602,11,'Araguari',NULL),(1603,11,'Arantina',NULL),(1604,11,'Araponga',NULL),(1605,11,'Araporã',NULL),(1606,11,'Arapuá',NULL),(1607,11,'Araújos',NULL),(1608,11,'Araxá',NULL),(1609,11,'Arceburgo',NULL),(1610,11,'Arcos',NULL),(1611,11,'Areado',NULL),(1612,11,'Argirita',NULL),(1613,11,'Aricanduva',NULL),(1614,11,'Arinos',NULL),(1615,11,'Astolfo Dutra',NULL),(1616,11,'Ataléia',NULL),(1617,11,'Augusto de Lima',NULL),(1618,11,'Baependi',NULL),(1619,11,'Baldim',NULL),(1620,11,'Bambuí',NULL),(1621,11,'Bandeira',NULL),(1622,11,'Bandeira do Sul',NULL),(1623,11,'Barão de Cocais',NULL),(1624,11,'Barão de Monte Alto',NULL),(1625,11,'Barbacena',NULL),(1626,11,'Barra Longa',NULL),(1627,11,'Barroso',NULL),(1628,11,'Bela Vista de Minas',NULL),(1629,11,'Belmiro Braga',NULL),(1630,11,'Belo Horizonte',NULL),(1631,11,'Belo Oriente',NULL),(1632,11,'Belo Vale',NULL),(1633,11,'Berilo',NULL),(1634,11,'Berizal',NULL),(1635,11,'Bertópolis',NULL),(1636,11,'Betim',NULL),(1637,11,'Bias Fortes',NULL),(1638,11,'Bicas',NULL),(1639,11,'Biquinhas',NULL),(1640,11,'Boa Esperança',NULL),(1641,11,'Bocaina de Minas',NULL),(1642,11,'Bocaiúva',NULL),(1643,11,'Bom Despacho',NULL),(1644,11,'Bom Jardim de Minas',NULL),(1645,11,'Bom Jesus da Penha',NULL),(1646,11,'Bom Jesus do Amparo',NULL),(1647,11,'Bom Jesus do Galho',NULL),(1648,11,'Bom Repouso',NULL),(1649,11,'Bom Sucesso',NULL),(1650,11,'Bonfim',NULL),(1651,11,'Bonfinópolis de Minas',NULL),(1652,11,'Bonito de Minas',NULL),(1653,11,'Borda da Mata',NULL),(1654,11,'Botelhos',NULL),(1655,11,'Botumirim',NULL),(1656,11,'Brás Pires',NULL),(1657,11,'Brasilândia de Minas',NULL),(1658,11,'Brasília de Minas',NULL),(1659,11,'Brasópolis',NULL),(1660,11,'Braúnas',NULL),(1661,11,'Brumadinho',NULL),(1662,11,'Bueno Brandão',NULL),(1663,11,'Buenópolis',NULL),(1664,11,'Bugre',NULL),(1665,11,'Buritis',NULL),(1666,11,'Buritizeiro',NULL),(1667,11,'Cabeceira Grande',NULL),(1668,11,'Cabo Verde',NULL),(1669,11,'Cachoeira da Prata',NULL),(1670,11,'Cachoeira de Minas',NULL),(1671,11,'Cachoeira de Pajeú',NULL),(1672,11,'Cachoeira Dourada',NULL),(1673,11,'Caetanópolis',NULL),(1674,11,'Caeté',NULL),(1675,11,'Caiana',NULL),(1676,11,'Cajuri',NULL),(1677,11,'Caldas',NULL),(1678,11,'Camacho',NULL),(1679,11,'Camanducaia',NULL),(1680,11,'Cambuí',NULL),(1681,11,'Cambuquira',NULL),(1682,11,'Campanário',NULL),(1683,11,'Campanha',NULL),(1684,11,'Campestre',NULL),(1685,11,'Campina Verde',NULL),(1686,11,'Campo Azul',NULL),(1687,11,'Campo Belo',NULL),(1688,11,'Campo do Meio',NULL),(1689,11,'Campo Florido',NULL),(1690,11,'Campos Altos',NULL),(1691,11,'Campos Gerais',NULL),(1692,11,'Cana Verde',NULL),(1693,11,'Canaã',NULL),(1694,11,'Canápolis',NULL),(1695,11,'Candeias',NULL),(1696,11,'Cantagalo',NULL),(1697,11,'Caparaó',NULL),(1698,11,'Capela Nova',NULL),(1699,11,'Capelinha',NULL),(1700,11,'Capetinga',NULL),(1701,11,'Capim Branco',NULL),(1702,11,'Capinópolis',NULL),(1703,11,'Capitão Andrade',NULL),(1704,11,'Capitão Enéas',NULL),(1705,11,'Capitólio',NULL),(1706,11,'Caputira',NULL),(1707,11,'Caraí',NULL),(1708,11,'Caranaíba',NULL),(1709,11,'Carandaí',NULL),(1710,11,'Carangola',NULL),(1711,11,'Caratinga',NULL),(1712,11,'Carbonita',NULL),(1713,11,'Careaçu',NULL),(1714,11,'Carlos Chagas',NULL),(1715,11,'Carmésia',NULL),(1716,11,'Carmo da Cachoeira',NULL),(1717,11,'Carmo da Mata',NULL),(1718,11,'Carmo de Minas',NULL),(1719,11,'Carmo do Cajuru',NULL),(1720,11,'Carmo do Paranaíba',NULL),(1721,11,'Carmo do Rio Claro',NULL),(1722,11,'Carmópolis de Minas',NULL),(1723,11,'Carneirinho',NULL),(1724,11,'Carrancas',NULL),(1725,11,'Carvalhópolis',NULL),(1726,11,'Carvalhos',NULL),(1727,11,'Casa Grande',NULL),(1728,11,'Cascalho Rico',NULL),(1729,11,'Cássia',NULL),(1730,11,'Cataguases',NULL),(1731,11,'Catas Altas',NULL),(1732,11,'Catas Altas da Noruega',NULL),(1733,11,'Catuji',NULL),(1734,11,'Catuti',NULL),(1735,11,'Caxambu',NULL),(1736,11,'Cedro do Abaeté',NULL),(1737,11,'Central de Minas',NULL),(1738,11,'Centralina',NULL),(1739,11,'Chácara',NULL),(1740,11,'Chalé',NULL),(1741,11,'Chapada do Norte',NULL),(1742,11,'Chapada Gaúcha',NULL),(1743,11,'Chiador',NULL),(1744,11,'Cipotânea',NULL),(1745,11,'Claraval',NULL),(1746,11,'Claro dos Poções',NULL),(1747,11,'Cláudio',NULL),(1748,11,'Coimbra',NULL),(1749,11,'Coluna',NULL),(1750,11,'Comendador Gomes',NULL),(1751,11,'Comercinho',NULL),(1752,11,'Conceição da Aparecida',NULL),(1753,11,'Conceição da Barra de Minas',NULL),(1754,11,'Conceição das Alagoas',NULL),(1755,11,'Conceição das Pedras',NULL),(1756,11,'Conceição de Ipanema',NULL),(1757,11,'Conceição do Mato Dentro',NULL),(1758,11,'Conceição do Pará',NULL),(1759,11,'Conceição do Rio Verde',NULL),(1760,11,'Conceição dos Ouros',NULL),(1761,11,'Cônego Marinho',NULL),(1762,11,'Confins',NULL),(1763,11,'Congonhal',NULL),(1764,11,'Congonhas',NULL),(1765,11,'Congonhas do Norte',NULL),(1766,11,'Conquista',NULL),(1767,11,'Conselheiro Lafaiete',NULL),(1768,11,'Conselheiro Pena',NULL),(1769,11,'Consolação',NULL),(1770,11,'Contagem',NULL),(1771,11,'Coqueiral',NULL),(1772,11,'Coração de Jesus',NULL),(1773,11,'Cordisburgo',NULL),(1774,11,'Cordislândia',NULL),(1775,11,'Corinto',NULL),(1776,11,'Coroaci',NULL),(1777,11,'Coromandel',NULL),(1778,11,'Coronel Fabriciano',NULL),(1779,11,'Coronel Murta',NULL),(1780,11,'Coronel Pacheco',NULL),(1781,11,'Coronel Xavier Chaves',NULL),(1782,11,'Córrego Danta',NULL),(1783,11,'Córrego do Bom Jesus',NULL),(1784,11,'Córrego Fundo',NULL),(1785,11,'Córrego Novo',NULL),(1786,11,'Couto de Magalhães de Minas',NULL),(1787,11,'Crisólita',NULL),(1788,11,'Cristais',NULL),(1789,11,'Cristália',NULL),(1790,11,'Cristiano Otoni',NULL),(1791,11,'Cristina',NULL),(1792,11,'Crucilândia',NULL),(1793,11,'Cruzeiro da Fortaleza',NULL),(1794,11,'Cruzília',NULL),(1795,11,'Cuparaque',NULL),(1796,11,'Curral de Dentro',NULL),(1797,11,'Curvelo',NULL),(1798,11,'Datas',NULL),(1799,11,'Delfim Moreira',NULL),(1800,11,'Delfinópolis',NULL),(1801,11,'Delta',NULL),(1802,11,'Descoberto',NULL),(1803,11,'Desterro de Entre Rios',NULL),(1804,11,'Desterro do Melo',NULL),(1805,11,'Diamantina',NULL),(1806,11,'Diogo de Vasconcelos',NULL),(1807,11,'Dionísio',NULL),(1808,11,'Divinésia',NULL),(1809,11,'Divino',NULL),(1810,11,'Divino das Laranjeiras',NULL),(1811,11,'Divinolândia de Minas',NULL),(1812,11,'Divinópolis',NULL),(1813,11,'Divisa Alegre',NULL),(1814,11,'Divisa Nova',NULL),(1815,11,'Divisópolis',NULL),(1816,11,'Dom Bosco',NULL),(1817,11,'Dom Cavati',NULL),(1818,11,'Dom Joaquim',NULL),(1819,11,'Dom Silvério',NULL),(1820,11,'Dom Viçoso',NULL),(1821,11,'Dona Eusébia',NULL),(1822,11,'Dores de Campos',NULL),(1823,11,'Dores de Guanhães',NULL),(1824,11,'Dores do Indaiá',NULL),(1825,11,'Dores do Turvo',NULL),(1826,11,'Doresópolis',NULL),(1827,11,'Douradoquara',NULL),(1828,11,'Durandé',NULL),(1829,11,'Elói Mendes',NULL),(1830,11,'Engenheiro Caldas',NULL),(1831,11,'Engenheiro Navarro',NULL),(1832,11,'Entre Folhas',NULL),(1833,11,'Entre Rios de Minas',NULL),(1834,11,'Ervália',NULL),(1835,11,'Esmeraldas',NULL),(1836,11,'Espera Feliz',NULL),(1837,11,'Espinosa',NULL),(1838,11,'Espírito Santo do Dourado',NULL),(1839,11,'Estiva',NULL),(1840,11,'Estrela Dalva',NULL),(1841,11,'Estrela do Indaiá',NULL),(1842,11,'Estrela do Sul',NULL),(1843,11,'Eugenópolis',NULL),(1844,11,'Ewbank da Câmara',NULL),(1845,11,'Extrema',NULL),(1846,11,'Fama',NULL),(1847,11,'Faria Lemos',NULL),(1848,11,'Felício dos Santos',NULL),(1849,11,'Felisburgo',NULL),(1850,11,'Felixlândia',NULL),(1851,11,'Fernandes Tourinho',NULL),(1852,11,'Ferros',NULL),(1853,11,'Fervedouro',NULL),(1854,11,'Florestal',NULL),(1855,11,'Formiga',NULL),(1856,11,'Formoso',NULL),(1857,11,'Fortaleza de Minas',NULL),(1858,11,'Fortuna de Minas',NULL),(1859,11,'Francisco Badaró',NULL),(1860,11,'Francisco Dumont',NULL),(1861,11,'Francisco Sá',NULL),(1862,11,'Franciscópolis',NULL),(1863,11,'Frei Gaspar',NULL),(1864,11,'Frei Inocêncio',NULL),(1865,11,'Frei Lagonegro',NULL),(1866,11,'Fronteira',NULL),(1867,11,'Fronteira dos Vales',NULL),(1868,11,'Fruta de Leite',NULL),(1869,11,'Frutal',NULL),(1870,11,'Funilândia',NULL),(1871,11,'Galiléia',NULL),(1872,11,'Gameleiras',NULL),(1873,11,'Glaucilândia',NULL),(1874,11,'Goiabeira',NULL),(1875,11,'Goianá',NULL),(1876,11,'Gonçalves',NULL),(1877,11,'Gonzaga',NULL),(1878,11,'Gouveia',NULL),(1879,11,'Governador Valadares',NULL),(1880,11,'Grão Mogol',NULL),(1881,11,'Grupiara',NULL),(1882,11,'Guanhães',NULL),(1883,11,'Guapé',NULL),(1884,11,'Guaraciaba',NULL),(1885,11,'Guaraciama',NULL),(1886,11,'Guaranésia',NULL),(1887,11,'Guarani',NULL),(1888,11,'Guarará',NULL),(1889,11,'Guarda-Mor',NULL),(1890,11,'Guaxupé',NULL),(1891,11,'Guidoval',NULL),(1892,11,'Guimarânia',NULL),(1893,11,'Guiricema',NULL),(1894,11,'Gurinhatã',NULL),(1895,11,'Heliodora',NULL),(1896,11,'Iapu',NULL),(1897,11,'Ibertioga',NULL),(1898,11,'Ibiá',NULL),(1899,11,'Ibiaí',NULL),(1900,11,'Ibiracatu',NULL),(1901,11,'Ibiraci',NULL),(1902,11,'Ibirité',NULL),(1903,11,'Ibitiúra de Minas',NULL),(1904,11,'Ibituruna',NULL),(1905,11,'Icaraí de Minas',NULL),(1906,11,'Igarapé',NULL),(1907,11,'Igaratinga',NULL),(1908,11,'Iguatama',NULL),(1909,11,'Ijaci',NULL),(1910,11,'Ilicínea',NULL),(1911,11,'Imbé de Minas',NULL),(1912,11,'Inconfidentes',NULL),(1913,11,'Indaiabira',NULL),(1914,11,'Indianópolis',NULL),(1915,11,'Ingaí',NULL),(1916,11,'Inhapim',NULL),(1917,11,'Inhaúma',NULL),(1918,11,'Inimutaba',NULL),(1919,11,'Ipaba',NULL),(1920,11,'Ipanema',NULL),(1921,11,'Ipatinga',NULL),(1922,11,'Ipiaçu',NULL),(1923,11,'Ipuiúna',NULL),(1924,11,'Iraí de Minas',NULL),(1925,11,'Itabira',NULL),(1926,11,'Itabirinha de Mantena',NULL),(1927,11,'Itabirito',NULL),(1928,11,'Itacambira',NULL),(1929,11,'Itacarambi',NULL),(1930,11,'Itaguara',NULL),(1931,11,'Itaipé',NULL),(1932,11,'Itajubá',NULL),(1933,11,'Itamarandiba',NULL),(1934,11,'Itamarati de Minas',NULL),(1935,11,'Itambacuri',NULL),(1936,11,'Itambé do Mato Dentro',NULL),(1937,11,'Itamogi',NULL),(1938,11,'Itamonte',NULL),(1939,11,'Itanhandu',NULL),(1940,11,'Itanhomi',NULL),(1941,11,'Itaobim',NULL),(1942,11,'Itapagipe',NULL),(1943,11,'Itapecerica',NULL),(1944,11,'Itapeva',NULL),(1945,11,'Itatiaiuçu',NULL),(1946,11,'Itaú de Minas',NULL),(1947,11,'Itaúna',NULL),(1948,11,'Itaverava',NULL),(1949,11,'Itinga',NULL),(1950,11,'Itueta',NULL),(1951,11,'Ituiutaba',NULL),(1952,11,'Itumirim',NULL),(1953,11,'Iturama',NULL),(1954,11,'Itutinga',NULL),(1955,11,'Jaboticatubas',NULL),(1956,11,'Jacinto',NULL),(1957,11,'Jacuí',NULL),(1958,11,'Jacutinga',NULL),(1959,11,'Jaguaraçu',NULL),(1960,11,'Jaíba',NULL),(1961,11,'Jampruca',NULL),(1962,11,'Janaúba',NULL),(1963,11,'Januária',NULL),(1964,11,'Japaraíba',NULL),(1965,11,'Japonvar',NULL),(1966,11,'Jeceaba',NULL),(1967,11,'Jenipapo de Minas',NULL),(1968,11,'Jequeri',NULL),(1969,11,'Jequitaí',NULL),(1970,11,'Jequitibá',NULL),(1971,11,'Jequitinhonha',NULL),(1972,11,'Jesuânia',NULL),(1973,11,'Joaíma',NULL),(1974,11,'Joanésia',NULL),(1975,11,'João Monlevade',NULL),(1976,11,'João Pinheiro',NULL),(1977,11,'Joaquim Felício',NULL),(1978,11,'Jordânia',NULL),(1979,11,'José Gonçalves de Minas',NULL),(1980,11,'José Raydan',NULL),(1981,11,'Josenópolis',NULL),(1982,11,'Juatuba',NULL),(1983,11,'Juiz de Fora',NULL),(1984,11,'Juramento',NULL),(1985,11,'Juruaia',NULL),(1986,11,'Juvenília',NULL),(1987,11,'Ladainha',NULL),(1988,11,'Lagamar',NULL),(1989,11,'Lagoa da Prata',NULL),(1990,11,'Lagoa dos Patos',NULL),(1991,11,'Lagoa Dourada',NULL),(1992,11,'Lagoa Formosa',NULL),(1993,11,'Lagoa Grande',NULL),(1994,11,'Lagoa Santa',NULL),(1995,11,'Lajinha',NULL),(1996,11,'Lambari',NULL),(1997,11,'Lamim',NULL),(1998,11,'Laranjal',NULL),(1999,11,'Lassance',NULL),(2000,11,'Lavras',NULL),(2001,11,'Leandro Ferreira',NULL),(2002,11,'Leme do Prado',NULL),(2003,11,'Leopoldina',NULL),(2004,11,'Liberdade',NULL),(2005,11,'Lima Duarte',NULL),(2006,11,'Limeira do Oeste',NULL),(2007,11,'Lontra',NULL),(2008,11,'Luisburgo',NULL),(2009,11,'Luislândia',NULL),(2010,11,'Luminárias',NULL),(2011,11,'Luz',NULL),(2012,11,'Machacalis',NULL),(2013,11,'Machado',NULL),(2014,11,'Madre de Deus de Minas',NULL),(2015,11,'Malacacheta',NULL),(2016,11,'Mamonas',NULL),(2017,11,'Manga',NULL),(2018,11,'Manhuaçu',NULL),(2019,11,'Manhumirim',NULL),(2020,11,'Mantena',NULL),(2021,11,'Mar de Espanha',NULL),(2022,11,'Maravilhas',NULL),(2023,11,'Maria da Fé',NULL),(2024,11,'Mariana',NULL),(2025,11,'Marilac',NULL),(2026,11,'Mário Campos',NULL),(2027,11,'Maripá de Minas',NULL),(2028,11,'Marliéria',NULL),(2029,11,'Marmelópolis',NULL),(2030,11,'Martinho Campos',NULL),(2031,11,'Martins Soares',NULL),(2032,11,'Mata Verde',NULL),(2033,11,'Materlândia',NULL),(2034,11,'Mateus Leme',NULL),(2035,11,'Mathias Lobato',NULL),(2036,11,'Matias Barbosa',NULL),(2037,11,'Matias Cardoso',NULL),(2038,11,'Matipó',NULL),(2039,11,'Mato Verde',NULL),(2040,11,'Matozinhos',NULL),(2041,11,'Matutina',NULL),(2042,11,'Medeiros',NULL),(2043,11,'Medina',NULL),(2044,11,'Mendes Pimentel',NULL),(2045,11,'Mercês',NULL),(2046,11,'Mesquita',NULL),(2047,11,'Minas Novas',NULL),(2048,11,'Minduri',NULL),(2049,11,'Mirabela',NULL),(2050,11,'Miradouro',NULL),(2051,11,'Miraí',NULL),(2052,11,'Miravânia',NULL),(2053,11,'Moeda',NULL),(2054,11,'Moema',NULL),(2055,11,'Monjolos',NULL),(2056,11,'Monsenhor Paulo',NULL),(2057,11,'Montalvânia',NULL),(2058,11,'Monte Alegre de Minas',NULL),(2059,11,'Monte Azul',NULL),(2060,11,'Monte Belo',NULL),(2061,11,'Monte Carmelo',NULL),(2062,11,'Monte Formoso',NULL),(2063,11,'Monte Santo de Minas',NULL),(2064,11,'Monte Sião',NULL),(2065,11,'Montes Claros',NULL),(2066,11,'Montezuma',NULL),(2067,11,'Morada Nova de Minas',NULL),(2068,11,'Morro da Garça',NULL),(2069,11,'Morro do Pilar',NULL),(2070,11,'Munhoz',NULL),(2071,11,'Muriaé',NULL),(2072,11,'Mutum',NULL),(2073,11,'Muzambinho',NULL),(2074,11,'Nacip Raydan',NULL),(2075,11,'Nanuque',NULL),(2076,11,'Naque',NULL),(2077,11,'Natalândia',NULL),(2078,11,'Natércia',NULL),(2079,11,'Nazareno',NULL),(2080,11,'Nepomuceno',NULL),(2081,11,'Ninheira',NULL),(2082,11,'Nova Belém',NULL),(2083,11,'Nova Era',NULL),(2084,11,'Nova Lima',NULL),(2085,11,'Nova Módica',NULL),(2086,11,'Nova Ponte',NULL),(2087,11,'Nova Porteirinha',NULL),(2088,11,'Nova Resende',NULL),(2089,11,'Nova Serrana',NULL),(2090,11,'Nova União',NULL),(2091,11,'Novo Cruzeiro',NULL),(2092,11,'Novo Oriente de Minas',NULL),(2093,11,'Novorizonte',NULL),(2094,11,'Olaria',NULL),(2095,11,'Olhos-d`Água',NULL),(2096,11,'Olímpio Noronha',NULL),(2097,11,'Oliveira',NULL),(2098,11,'Oliveira Fortes',NULL),(2099,11,'Onça de Pitangui',NULL),(2100,11,'Oratórios',NULL),(2101,11,'Orizânia',NULL),(2102,11,'Ouro Branco',NULL),(2103,11,'Ouro Fino',NULL),(2104,11,'Ouro Preto',NULL),(2105,11,'Ouro Verde de Minas',NULL),(2106,11,'Padre Carvalho',NULL),(2107,11,'Padre Paraíso',NULL),(2108,11,'Pai Pedro',NULL),(2109,11,'Paineiras',NULL),(2110,11,'Pains',NULL),(2111,11,'Paiva',NULL),(2112,11,'Palma',NULL),(2113,11,'Palmópolis',NULL),(2114,11,'Papagaios',NULL),(2115,11,'Pará de Minas',NULL),(2116,11,'Paracatu',NULL),(2117,11,'Paraguaçu',NULL),(2118,11,'Paraisópolis',NULL),(2119,11,'Paraopeba',NULL),(2120,11,'Passa Quatro',NULL),(2121,11,'Passa Tempo',NULL),(2122,11,'Passabém',NULL),(2123,11,'Passa-Vinte',NULL),(2124,11,'Passos',NULL),(2125,11,'Patis',NULL),(2126,11,'Patos de Minas',NULL),(2127,11,'Patrocínio',NULL),(2128,11,'Patrocínio do Muriaé',NULL),(2129,11,'Paula Cândido',NULL),(2130,11,'Paulistas',NULL),(2131,11,'Pavão',NULL),(2132,11,'Peçanha',NULL),(2133,11,'Pedra Azul',NULL),(2134,11,'Pedra Bonita',NULL),(2135,11,'Pedra do Anta',NULL),(2136,11,'Pedra do Indaiá',NULL),(2137,11,'Pedra Dourada',NULL),(2138,11,'Pedralva',NULL),(2139,11,'Pedras de Maria da Cruz',NULL),(2140,11,'Pedrinópolis',NULL),(2141,11,'Pedro Leopoldo',NULL),(2142,11,'Pedro Teixeira',NULL),(2143,11,'Pequeri',NULL),(2144,11,'Pequi',NULL),(2145,11,'Perdigão',NULL),(2146,11,'Perdizes',NULL),(2147,11,'Perdões',NULL),(2148,11,'Periquito',NULL),(2149,11,'Pescador',NULL),(2150,11,'Piau',NULL),(2151,11,'Piedade de Caratinga',NULL),(2152,11,'Piedade de Ponte Nova',NULL),(2153,11,'Piedade do Rio Grande',NULL),(2154,11,'Piedade dos Gerais',NULL),(2155,11,'Pimenta',NULL),(2156,11,'Pingo-d`Água',NULL),(2157,11,'Pintópolis',NULL),(2158,11,'Piracema',NULL),(2159,11,'Pirajuba',NULL),(2160,11,'Piranga',NULL),(2161,11,'Piranguçu',NULL),(2162,11,'Piranguinho',NULL),(2163,11,'Pirapetinga',NULL),(2164,11,'Pirapora',NULL),(2165,11,'Piraúba',NULL),(2166,11,'Pitangui',NULL),(2167,11,'Piumhi',NULL),(2168,11,'Planura',NULL),(2169,11,'Poço Fundo',NULL),(2170,11,'Poços de Caldas',NULL),(2171,11,'Pocrane',NULL),(2172,11,'Pompéu',NULL),(2173,11,'Ponte Nova',NULL),(2174,11,'Ponto Chique',NULL),(2175,11,'Ponto dos Volantes',NULL),(2176,11,'Porteirinha',NULL),(2177,11,'Porto Firme',NULL),(2178,11,'Poté',NULL),(2179,11,'Pouso Alegre',NULL),(2180,11,'Pouso Alto',NULL),(2181,11,'Prados',NULL),(2182,11,'Prata',NULL),(2183,11,'Pratápolis',NULL),(2184,11,'Pratinha',NULL),(2185,11,'Presidente Bernardes',NULL),(2186,11,'Presidente Juscelino',NULL),(2187,11,'Presidente Kubitschek',NULL),(2188,11,'Presidente Olegário',NULL),(2189,11,'Prudente de Morais',NULL),(2190,11,'Quartel Geral',NULL),(2191,11,'Queluzito',NULL),(2192,11,'Raposos',NULL),(2193,11,'Raul Soares',NULL),(2194,11,'Recreio',NULL),(2195,11,'Reduto',NULL),(2196,11,'Resende Costa',NULL),(2197,11,'Resplendor',NULL),(2198,11,'Ressaquinha',NULL),(2199,11,'Riachinho',NULL),(2200,11,'Riacho dos Machados',NULL),(2201,11,'Ribeirão das Neves',NULL),(2202,11,'Ribeirão Vermelho',NULL),(2203,11,'Rio Acima',NULL),(2204,11,'Rio Casca',NULL),(2205,11,'Rio do Prado',NULL),(2206,11,'Rio Doce',NULL),(2207,11,'Rio Espera',NULL),(2208,11,'Rio Manso',NULL),(2209,11,'Rio Novo',NULL),(2210,11,'Rio Paranaíba',NULL),(2211,11,'Rio Pardo de Minas',NULL),(2212,11,'Rio Piracicaba',NULL),(2213,11,'Rio Pomba',NULL),(2214,11,'Rio Preto',NULL),(2215,11,'Rio Vermelho',NULL),(2216,11,'Ritápolis',NULL),(2217,11,'Rochedo de Minas',NULL),(2218,11,'Rodeiro',NULL),(2219,11,'Romaria',NULL),(2220,11,'Rosário da Limeira',NULL),(2221,11,'Rubelita',NULL),(2222,11,'Rubim',NULL),(2223,11,'Sabará',NULL),(2224,11,'Sabinópolis',NULL),(2225,11,'Sacramento',NULL),(2226,11,'Salinas',NULL),(2227,11,'Salto da Divisa',NULL),(2228,11,'Santa Bárbara',NULL),(2229,11,'Santa Bárbara do Leste',NULL),(2230,11,'Santa Bárbara do Monte Verde',NULL),(2231,11,'Santa Bárbara do Tugúrio',NULL),(2232,11,'Santa Cruz de Minas',NULL),(2233,11,'Santa Cruz de Salinas',NULL),(2234,11,'Santa Cruz do Escalvado',NULL),(2235,11,'Santa Efigênia de Minas',NULL),(2236,11,'Santa Fé de Minas',NULL),(2237,11,'Santa Helena de Minas',NULL),(2238,11,'Santa Juliana',NULL),(2239,11,'Santa Luzia',NULL),(2240,11,'Santa Margarida',NULL),(2241,11,'Santa Maria de Itabira',NULL),(2242,11,'Santa Maria do Salto',NULL),(2243,11,'Santa Maria do Suaçuí',NULL),(2244,11,'Santa Rita de Caldas',NULL),(2245,11,'Santa Rita de Ibitipoca',NULL),(2246,11,'Santa Rita de Jacutinga',NULL),(2247,11,'Santa Rita de Minas',NULL),(2248,11,'Santa Rita do Itueto',NULL),(2249,11,'Santa Rita do Sapucaí',NULL),(2250,11,'Santa Rosa da Serra',NULL),(2251,11,'Santa Vitória',NULL),(2252,11,'Santana da Vargem',NULL),(2253,11,'Santana de Cataguases',NULL),(2254,11,'Santana de Pirapama',NULL),(2255,11,'Santana do Deserto',NULL),(2256,11,'Santana do Garambéu',NULL),(2257,11,'Santana do Jacaré',NULL),(2258,11,'Santana do Manhuaçu',NULL),(2259,11,'Santana do Paraíso',NULL),(2260,11,'Santana do Riacho',NULL),(2261,11,'Santana dos Montes',NULL),(2262,11,'Santo Antônio do Amparo',NULL),(2263,11,'Santo Antônio do Aventureiro',NULL),(2264,11,'Santo Antônio do Grama',NULL),(2265,11,'Santo Antônio do Itambé',NULL),(2266,11,'Santo Antônio do Jacinto',NULL),(2267,11,'Santo Antônio do Monte',NULL),(2268,11,'Santo Antônio do Retiro',NULL),(2269,11,'Santo Antônio do Rio Abaixo',NULL),(2270,11,'Santo Hipólito',NULL),(2271,11,'Santos Dumont',NULL),(2272,11,'São Bento Abade',NULL),(2273,11,'São Brás do Suaçuí',NULL),(2274,11,'São Domingos das Dores',NULL),(2275,11,'São Domingos do Prata',NULL),(2276,11,'São Félix de Minas',NULL),(2277,11,'São Francisco',NULL),(2278,11,'São Francisco de Paula',NULL),(2279,11,'São Francisco de Sales',NULL),(2280,11,'São Francisco do Glória',NULL),(2281,11,'São Geraldo',NULL),(2282,11,'São Geraldo da Piedade',NULL),(2283,11,'São Geraldo do Baixio',NULL),(2284,11,'São Gonçalo do Abaeté',NULL),(2285,11,'São Gonçalo do Pará',NULL),(2286,11,'São Gonçalo do Rio Abaixo',NULL),(2287,11,'São Gonçalo do Rio Preto',NULL),(2288,11,'São Gonçalo do Sapucaí',NULL),(2289,11,'São Gotardo',NULL),(2290,11,'São João Batista do Glória',NULL),(2291,11,'São João da Lagoa',NULL),(2292,11,'São João da Mata',NULL),(2293,11,'São João da Ponte',NULL),(2294,11,'São João das Missões',NULL),(2295,11,'São João del Rei',NULL),(2296,11,'São João do Manhuaçu',NULL),(2297,11,'São João do Manteninha',NULL),(2298,11,'São João do Oriente',NULL),(2299,11,'São João do Pacuí',NULL),(2300,11,'São João do Paraíso',NULL),(2301,11,'São João Evangelista',NULL),(2302,11,'São João Nepomuceno',NULL),(2303,11,'São Joaquim de Bicas',NULL),(2304,11,'São José da Barra',NULL),(2305,11,'São José da Lapa',NULL),(2306,11,'São José da Safira',NULL),(2307,11,'São José da Varginha',NULL),(2308,11,'São José do Alegre',NULL),(2309,11,'São José do Divino',NULL),(2310,11,'São José do Goiabal',NULL),(2311,11,'São José do Jacuri',NULL),(2312,11,'São José do Mantimento',NULL),(2313,11,'São Lourenço',NULL),(2314,11,'São Miguel do Anta',NULL),(2315,11,'São Pedro da União',NULL),(2316,11,'São Pedro do Suaçuí',NULL),(2317,11,'São Pedro dos Ferros',NULL),(2318,11,'São Romão',NULL),(2319,11,'São Roque de Minas',NULL),(2320,11,'São Sebastião da Bela Vista',NULL),(2321,11,'São Sebastião da Vargem Alegre',NULL),(2322,11,'São Sebastião do Anta',NULL),(2323,11,'São Sebastião do Maranhão',NULL),(2324,11,'São Sebastião do Oeste',NULL),(2325,11,'São Sebastião do Paraíso',NULL),(2326,11,'São Sebastião do Rio Preto',NULL),(2327,11,'São Sebastião do Rio Verde',NULL),(2328,11,'São Thomé das Letras',NULL),(2329,11,'São Tiago',NULL),(2330,11,'São Tomás de Aquino',NULL),(2331,11,'São Vicente de Minas',NULL),(2332,11,'Sapucaí-Mirim',NULL),(2333,11,'Sardoá',NULL),(2334,11,'Sarzedo',NULL),(2335,11,'Sem-Peixe',NULL),(2336,11,'Senador Amaral',NULL),(2337,11,'Senador Cortes',NULL),(2338,11,'Senador Firmino',NULL),(2339,11,'Senador José Bento',NULL),(2340,11,'Senador Modestino Gonçalves',NULL),(2341,11,'Senhora de Oliveira',NULL),(2342,11,'Senhora do Porto',NULL),(2343,11,'Senhora dos Remédios',NULL),(2344,11,'Sericita',NULL),(2345,11,'Seritinga',NULL),(2346,11,'Serra Azul de Minas',NULL),(2347,11,'Serra da Saudade',NULL),(2348,11,'Serra do Salitre',NULL),(2349,11,'Serra dos Aimorés',NULL),(2350,11,'Serrania',NULL),(2351,11,'Serranópolis de Minas',NULL),(2352,11,'Serranos',NULL),(2353,11,'Serro',NULL),(2354,11,'Sete Lagoas',NULL),(2355,11,'Setubinha',NULL),(2356,11,'Silveirânia',NULL),(2357,11,'Silvianópolis',NULL),(2358,11,'Simão Pereira',NULL),(2359,11,'Simonésia',NULL),(2360,11,'Sobrália',NULL),(2361,11,'Soledade de Minas',NULL),(2362,11,'Tabuleiro',NULL),(2363,11,'Taiobeiras',NULL),(2364,11,'Taparuba',NULL),(2365,11,'Tapira',NULL),(2366,11,'Tapiraí',NULL),(2367,11,'Taquaraçu de Minas',NULL),(2368,11,'Tarumirim',NULL),(2369,11,'Teixeiras',NULL),(2370,11,'Teófilo Otoni',NULL),(2371,11,'Timóteo',NULL),(2372,11,'Tiradentes',NULL),(2373,11,'Tiros',NULL),(2374,11,'Tocantins',NULL),(2375,11,'Tocos do Moji',NULL),(2376,11,'Toledo',NULL),(2377,11,'Tombos',NULL),(2378,11,'Três Corações',NULL),(2379,11,'Três Marias',NULL),(2380,11,'Três Pontas',NULL),(2381,11,'Tumiritinga',NULL),(2382,11,'Tupaciguara',NULL),(2383,11,'Turmalina',NULL),(2384,11,'Turvolândia',NULL),(2385,11,'Ubá',NULL),(2386,11,'Ubaí',NULL),(2387,11,'Ubaporanga',NULL),(2388,11,'Uberaba',NULL),(2389,11,'Uberlândia',NULL),(2390,11,'Umburatiba',NULL),(2391,11,'Unaí',NULL),(2392,11,'União de Minas',NULL),(2393,11,'Uruana de Minas',NULL),(2394,11,'Urucânia',NULL),(2395,11,'Urucuia',NULL),(2396,11,'Vargem Alegre',NULL),(2397,11,'Vargem Bonita',NULL),(2398,11,'Vargem Grande do Rio Pardo',NULL),(2399,11,'Varginha',NULL),(2400,11,'Varjão de Minas',NULL),(2401,11,'Várzea da Palma',NULL),(2402,11,'Varzelândia',NULL),(2403,11,'Vazante',NULL),(2404,11,'Verdelândia',NULL),(2405,11,'Veredinha',NULL),(2406,11,'Veríssimo',NULL),(2407,11,'Vermelho Novo',NULL),(2408,11,'Vespasiano',NULL),(2409,11,'Viçosa',NULL),(2410,11,'Vieiras',NULL),(2411,11,'Virgem da Lapa',NULL),(2412,11,'Virgínia',NULL),(2413,11,'Virginópolis',NULL),(2414,11,'Virgolândia',NULL),(2415,11,'Visconde do Rio Branco',NULL),(2416,11,'Volta Grande',NULL),(2417,11,'Wenceslau Braz',NULL),(2418,14,'Abaetetuba',NULL),(2419,14,'Abel Figueiredo',NULL),(2420,14,'Acará',NULL),(2421,14,'Afuá',NULL),(2422,14,'Água Azul do Norte',NULL),(2423,14,'Alenquer',NULL),(2424,14,'Almeirim',NULL),(2425,14,'Altamira',NULL),(2426,14,'Anajás',NULL),(2427,14,'Ananindeua',NULL),(2428,14,'Anapu',NULL),(2429,14,'Augusto Corrêa',NULL),(2430,14,'Aurora do Pará',NULL),(2431,14,'Aveiro',NULL),(2432,14,'Bagre',NULL),(2433,14,'Baião',NULL),(2434,14,'Bannach',NULL),(2435,14,'Barcarena',NULL),(2436,14,'Belém',NULL),(2437,14,'Belterra',NULL),(2438,14,'Benevides',NULL),(2439,14,'Bom Jesus do Tocantins',NULL),(2440,14,'Bonito',NULL),(2441,14,'Bragança',NULL),(2442,14,'Brasil Novo',NULL),(2443,14,'Brejo Grande do Araguaia',NULL),(2444,14,'Breu Branco',NULL),(2445,14,'Breves',NULL),(2446,14,'Bujaru',NULL),(2447,14,'Cachoeira do Arari',NULL),(2448,14,'Cachoeira do Piriá',NULL),(2449,14,'Cametá',NULL),(2450,14,'Canaã dos Carajás',NULL),(2451,14,'Capanema',NULL),(2452,14,'Capitão Poço',NULL),(2453,14,'Castanhal',NULL),(2454,14,'Chaves',NULL),(2455,14,'Colares',NULL),(2456,14,'Conceição do Araguaia',NULL),(2457,14,'Concórdia do Pará',NULL),(2458,14,'Cumaru do Norte',NULL),(2459,14,'Curionópolis',NULL),(2460,14,'Curralinho',NULL),(2461,14,'Curuá',NULL),(2462,14,'Curuçá',NULL),(2463,14,'Dom Eliseu',NULL),(2464,14,'Eldorado dos Carajás',NULL),(2465,14,'Faro',NULL),(2466,14,'Floresta do Araguaia',NULL),(2467,14,'Garrafão do Norte',NULL),(2468,14,'Goianésia do Pará',NULL),(2469,14,'Gurupá',NULL),(2470,14,'Igarapé-Açu',NULL),(2471,14,'Igarapé-Miri',NULL),(2472,14,'Inhangapi',NULL),(2473,14,'Ipixuna do Pará',NULL),(2474,14,'Irituia',NULL),(2475,14,'Itaituba',NULL),(2476,14,'Itupiranga',NULL),(2477,14,'Jacareacanga',NULL),(2478,14,'Jacundá',NULL),(2479,14,'Juruti',NULL),(2480,14,'Limoeiro do Ajuru',NULL),(2481,14,'Mãe do Rio',NULL),(2482,14,'Magalhães Barata',NULL),(2483,14,'Marabá',NULL),(2484,14,'Maracanã',NULL),(2485,14,'Marapanim',NULL),(2486,14,'Marituba',NULL),(2487,14,'Medicilândia',NULL),(2488,14,'Melgaço',NULL),(2489,14,'Mocajuba',NULL),(2490,14,'Moju',NULL),(2491,14,'Monte Alegre',NULL),(2492,14,'Muaná',NULL),(2493,14,'Nova Esperança do Piriá',NULL),(2494,14,'Nova Ipixuna',NULL),(2495,14,'Nova Timboteua',NULL),(2496,14,'Novo Progresso',NULL),(2497,14,'Novo Repartimento',NULL),(2498,14,'Óbidos',NULL),(2499,14,'Oeiras do Pará',NULL),(2500,14,'Oriximiná',NULL),(2501,14,'Ourém',NULL),(2502,14,'Ourilândia do Norte',NULL),(2503,14,'Pacajá',NULL),(2504,14,'Palestina do Pará',NULL),(2505,14,'Paragominas',NULL),(2506,14,'Parauapebas',NULL),(2507,14,'Pau d`Arco',NULL),(2508,14,'Peixe-Boi',NULL),(2509,14,'Piçarra',NULL),(2510,14,'Placas',NULL),(2511,14,'Ponta de Pedras',NULL),(2512,14,'Portel',NULL),(2513,14,'Porto de Moz',NULL),(2514,14,'Prainha',NULL),(2515,14,'Primavera',NULL),(2516,14,'Quatipuru',NULL),(2517,14,'Redenção',NULL),(2518,14,'Rio Maria',NULL),(2519,14,'Rondon do Pará',NULL),(2520,14,'Rurópolis',NULL),(2521,14,'Salinópolis',NULL),(2522,14,'Salvaterra',NULL),(2523,14,'Santa Bárbara do Pará',NULL),(2524,14,'Santa Cruz do Arari',NULL),(2525,14,'Santa Isabel do Pará',NULL),(2526,14,'Santa Luzia do Pará',NULL),(2527,14,'Santa Maria das Barreiras',NULL),(2528,14,'Santa Maria do Pará',NULL),(2529,14,'Santana do Araguaia',NULL),(2530,14,'Santarém',NULL),(2531,14,'Santarém Novo',NULL),(2532,14,'Santo Antônio do Tauá',NULL),(2533,14,'São Caetano de Odivelas',NULL),(2534,14,'São Domingos do Araguaia',NULL),(2535,14,'São Domingos do Capim',NULL),(2536,14,'São Félix do Xingu',NULL),(2537,14,'São Francisco do Pará',NULL),(2538,14,'São Geraldo do Araguaia',NULL),(2539,14,'São João da Ponta',NULL),(2540,14,'São João de Pirabas',NULL),(2541,14,'São João do Araguaia',NULL),(2542,14,'São Miguel do Guamá',NULL),(2543,14,'São Sebastião da Boa Vista',NULL),(2544,14,'Sapucaia',NULL),(2545,14,'Senador José Porfírio',NULL),(2546,14,'Soure',NULL),(2547,14,'Tailândia',NULL),(2548,14,'Terra Alta',NULL),(2549,14,'Terra Santa',NULL),(2550,14,'Tomé-Açu',NULL),(2551,14,'Tracuateua',NULL),(2552,14,'Trairão',NULL),(2553,14,'Tucumã',NULL),(2554,14,'Tucuruí',NULL),(2555,14,'Ulianópolis',NULL),(2556,14,'Uruará',NULL),(2557,14,'Vigia',NULL),(2558,14,'Viseu',NULL),(2559,14,'Vitória do Xingu',NULL),(2560,14,'Xinguara',NULL),(2561,15,'Água Branca',NULL),(2562,15,'Aguiar',NULL),(2563,15,'Alagoa Grande',NULL),(2564,15,'Alagoa Nova',NULL),(2565,15,'Alagoinha',NULL),(2566,15,'Alcantil',NULL),(2567,15,'Algodão de Jandaíra',NULL),(2568,15,'Alhandra',NULL),(2569,15,'Amparo',NULL),(2570,15,'Aparecida',NULL),(2571,15,'Araçagi',NULL),(2572,15,'Arara',NULL),(2573,15,'Araruna',NULL),(2574,15,'Areia',NULL),(2575,15,'Areia de Baraúnas',NULL),(2576,15,'Areial',NULL),(2577,15,'Aroeiras',NULL),(2578,15,'Assunção',NULL),(2579,15,'Baía da Traição',NULL),(2580,15,'Bananeiras',NULL),(2581,15,'Baraúna',NULL),(2582,15,'Barra de Santa Rosa',NULL),(2583,15,'Barra de Santana',NULL),(2584,15,'Barra de São Miguel',NULL),(2585,15,'Bayeux',NULL),(2586,15,'Belém',NULL),(2587,15,'Belém do Brejo do Cruz',NULL),(2588,15,'Bernardino Batista',NULL),(2589,15,'Boa Ventura',NULL),(2590,15,'Boa Vista',NULL),(2591,15,'Bom Jesus',NULL),(2592,15,'Bom Sucesso',NULL),(2593,15,'Bonito de Santa Fé',NULL),(2594,15,'Boqueirão',NULL),(2595,15,'Borborema',NULL),(2596,15,'Brejo do Cruz',NULL),(2597,15,'Brejo dos Santos',NULL),(2598,15,'Caaporã',NULL),(2599,15,'Cabaceiras',NULL),(2600,15,'Cabedelo',NULL),(2601,15,'Cachoeira dos Índios',NULL),(2602,15,'Cacimba de Areia',NULL),(2603,15,'Cacimba de Dentro',NULL),(2604,15,'Cacimbas',NULL),(2605,15,'Caiçara',NULL),(2606,15,'Cajazeiras',NULL),(2607,15,'Cajazeirinhas',NULL),(2608,15,'Caldas Brandão',NULL),(2609,15,'Camalaú',NULL),(2610,15,'Campina Grande',NULL),(2611,15,'Campo de Santana',NULL),(2612,15,'Capim',NULL),(2613,15,'Caraúbas',NULL),(2614,15,'Carrapateira',NULL),(2615,15,'Casserengue',NULL),(2616,15,'Catingueira',NULL),(2617,15,'Catolé do Rocha',NULL),(2618,15,'Caturité',NULL),(2619,15,'Conceição',NULL),(2620,15,'Condado',NULL),(2621,15,'Conde',NULL),(2622,15,'Congo',NULL),(2623,15,'Coremas',NULL),(2624,15,'Coxixola',NULL),(2625,15,'Cruz do Espírito Santo',NULL),(2626,15,'Cubati',NULL),(2627,15,'Cuité',NULL),(2628,15,'Cuité de Mamanguape',NULL),(2629,15,'Cuitegi',NULL),(2630,15,'Curral de Cima',NULL),(2631,15,'Curral Velho',NULL),(2632,15,'Damião',NULL),(2633,15,'Desterro',NULL),(2634,15,'Diamante',NULL),(2635,15,'Dona Inês',NULL),(2636,15,'Duas Estradas',NULL),(2637,15,'Emas',NULL),(2638,15,'Esperança',NULL),(2639,15,'Fagundes',NULL),(2640,15,'Frei Martinho',NULL),(2641,15,'Gado Bravo',NULL),(2642,15,'Guarabira',NULL),(2643,15,'Gurinhém',NULL),(2644,15,'Gurjão',NULL),(2645,15,'Ibiara',NULL),(2646,15,'Igaracy',NULL),(2647,15,'Imaculada',NULL),(2648,15,'Ingá',NULL),(2649,15,'Itabaiana',NULL),(2650,15,'Itaporanga',NULL),(2651,15,'Itapororoca',NULL),(2652,15,'Itatuba',NULL),(2653,15,'Jacaraú',NULL),(2654,15,'Jericó',NULL),(2655,15,'João Pessoa',NULL),(2656,15,'Juarez Távora',NULL),(2657,15,'Juazeirinho',NULL),(2658,15,'Junco do Seridó',NULL),(2659,15,'Juripiranga',NULL),(2660,15,'Juru',NULL),(2661,15,'Lagoa',NULL),(2662,15,'Lagoa de Dentro',NULL),(2663,15,'Lagoa Seca',NULL),(2664,15,'Lastro',NULL),(2665,15,'Livramento',NULL),(2666,15,'Logradouro',NULL),(2667,15,'Lucena',NULL),(2668,15,'Mãe d`Água',NULL),(2669,15,'Malta',NULL),(2670,15,'Mamanguape',NULL),(2671,15,'Manaíra',NULL),(2672,15,'Marcação',NULL),(2673,15,'Mari',NULL),(2674,15,'Marizópolis',NULL),(2675,15,'Massaranduba',NULL),(2676,15,'Mataraca',NULL),(2677,15,'Matinhas',NULL),(2678,15,'Mato Grosso',NULL),(2679,15,'Maturéia',NULL),(2680,15,'Mogeiro',NULL),(2681,15,'Montadas',NULL),(2682,15,'Monte Horebe',NULL),(2683,15,'Monteiro',NULL),(2684,15,'Mulungu',NULL),(2685,15,'Natuba',NULL),(2686,15,'Nazarezinho',NULL),(2687,15,'Nova Floresta',NULL),(2688,15,'Nova Olinda',NULL),(2689,15,'Nova Palmeira',NULL),(2690,15,'Olho d`Água',NULL),(2691,15,'Olivedos',NULL),(2692,15,'Ouro Velho',NULL),(2693,15,'Parari',NULL),(2694,15,'Passagem',NULL),(2695,15,'Patos',NULL),(2696,15,'Paulista',NULL),(2697,15,'Pedra Branca',NULL),(2698,15,'Pedra Lavrada',NULL),(2699,15,'Pedras de Fogo',NULL),(2700,15,'Pedro Régis',NULL),(2701,15,'Piancó',NULL),(2702,15,'Picuí',NULL),(2703,15,'Pilar',NULL),(2704,15,'Pilões',NULL),(2705,15,'Pilõezinhos',NULL),(2706,15,'Pirpirituba',NULL),(2707,15,'Pitimbu',NULL),(2708,15,'Pocinhos',NULL),(2709,15,'Poço Dantas',NULL),(2710,15,'Poço de José de Moura',NULL),(2711,15,'Pombal',NULL),(2712,15,'Prata',NULL),(2713,15,'Princesa Isabel',NULL),(2714,15,'Puxinanã',NULL),(2715,15,'Queimadas',NULL),(2716,15,'Quixabá',NULL),(2717,15,'Remígio',NULL),(2718,15,'Riachão',NULL),(2719,15,'Riachão do Bacamarte',NULL),(2720,15,'Riachão do Poço',NULL),(2721,15,'Riacho de Santo Antônio',NULL),(2722,15,'Riacho dos Cavalos',NULL),(2723,15,'Rio Tinto',NULL),(2724,15,'Salgadinho',NULL),(2725,15,'Salgado de São Félix',NULL),(2726,15,'Santa Cecília',NULL),(2727,15,'Santa Cruz',NULL),(2728,15,'Santa Helena',NULL),(2729,15,'Santa Inês',NULL),(2730,15,'Santa Luzia',NULL),(2731,15,'Santa Rita',NULL),(2732,15,'Santa Teresinha',NULL),(2733,15,'Santana de Mangueira',NULL),(2734,15,'Santana dos Garrotes',NULL),(2735,15,'Santarém',NULL),(2736,15,'Santo André',NULL),(2737,15,'São Bentinho',NULL),(2738,15,'São Bento',NULL),(2739,15,'São Domingos de Pombal',NULL),(2740,15,'São Domingos do Cariri',NULL),(2741,15,'São Francisco',NULL),(2742,15,'São João do Cariri',NULL),(2743,15,'São João do Rio do Peixe',NULL),(2744,15,'São João do Tigre',NULL),(2745,15,'São José da Lagoa Tapada',NULL),(2746,15,'São José de Caiana',NULL),(2747,15,'São José de Espinharas',NULL),(2748,15,'São José de Piranhas',NULL),(2749,15,'São José de Princesa',NULL),(2750,15,'São José do Bonfim',NULL),(2751,15,'São José do Brejo do Cruz',NULL),(2752,15,'São José do Sabugi',NULL),(2753,15,'São José dos Cordeiros',NULL),(2754,15,'São José dos Ramos',NULL),(2755,15,'São Mamede',NULL),(2756,15,'São Miguel de Taipu',NULL),(2757,15,'São Sebastião de Lagoa de Roça',NULL),(2758,15,'São Sebastião do Umbuzeiro',NULL),(2759,15,'Sapé',NULL),(2760,15,'Seridó',NULL),(2761,15,'Serra Branca',NULL),(2762,15,'Serra da Raiz',NULL),(2763,15,'Serra Grande',NULL),(2764,15,'Serra Redonda',NULL),(2765,15,'Serraria',NULL),(2766,15,'Sertãozinho',NULL),(2767,15,'Sobrado',NULL),(2768,15,'Solânea',NULL),(2769,15,'Soledade',NULL),(2770,15,'Sossêgo',NULL),(2771,15,'Sousa',NULL),(2772,15,'Sumé',NULL),(2773,15,'Taperoá',NULL),(2774,15,'Tavares',NULL),(2775,15,'Teixeira',NULL),(2776,15,'Tenório',NULL),(2777,15,'Triunfo',NULL),(2778,15,'Uiraúna',NULL),(2779,15,'Umbuzeiro',NULL),(2780,15,'Várzea',NULL),(2781,15,'Vieirópolis',NULL),(2782,15,'Vista Serrana',NULL),(2783,15,'Zabelê',NULL),(2784,18,'Abatiá',NULL),(2785,18,'Adrianópolis',NULL),(2786,18,'Agudos do Sul',NULL),(2787,18,'Almirante Tamandaré',NULL),(2788,18,'Altamira do Paraná',NULL),(2789,18,'Alto Paraíso',NULL),(2790,18,'Alto Paraná',NULL),(2791,18,'Alto Piquiri',NULL),(2792,18,'Altônia',NULL),(2793,18,'Alvorada do Sul',NULL),(2794,18,'Amaporã',NULL),(2795,18,'Ampére',NULL),(2796,18,'Anahy',NULL),(2797,18,'Andirá',NULL),(2798,18,'Ângulo',NULL),(2799,18,'Antonina',NULL),(2800,18,'Antônio Olinto',NULL),(2801,18,'Apucarana',NULL),(2802,18,'Arapongas',NULL),(2803,18,'Arapoti',NULL),(2804,18,'Arapuã',NULL),(2805,18,'Araruna',NULL),(2806,18,'Araucária',NULL),(2807,18,'Ariranha do Ivaí',NULL),(2808,18,'Assaí',NULL),(2809,18,'Assis Chateaubriand',NULL),(2810,18,'Astorga',NULL),(2811,18,'Atalaia',NULL),(2812,18,'Balsa Nova',NULL),(2813,18,'Bandeirantes',NULL),(2814,18,'Barbosa Ferraz',NULL),(2815,18,'Barra do Jacaré',NULL),(2816,18,'Barracão',NULL),(2817,18,'Bela Vista da Caroba',NULL),(2818,18,'Bela Vista do Paraíso',NULL),(2819,18,'Bituruna',NULL),(2820,18,'Boa Esperança',NULL),(2821,18,'Boa Esperança do Iguaçu',NULL),(2822,18,'Boa Ventura de São Roque',NULL),(2823,18,'Boa Vista da Aparecida',NULL),(2824,18,'Bocaiúva do Sul',NULL),(2825,18,'Bom Jesus do Sul',NULL),(2826,18,'Bom Sucesso',NULL),(2827,18,'Bom Sucesso do Sul',NULL),(2828,18,'Borrazópolis',NULL),(2829,18,'Braganey',NULL),(2830,18,'Brasilândia do Sul',NULL),(2831,18,'Cafeara',NULL),(2832,18,'Cafelândia',NULL),(2833,18,'Cafezal do Sul',NULL),(2834,18,'Califórnia',NULL),(2835,18,'Cambará',NULL),(2836,18,'Cambé',NULL),(2837,18,'Cambira',NULL),(2838,18,'Campina da Lagoa',NULL),(2839,18,'Campina do Simão',NULL),(2840,18,'Campina Grande do Sul',NULL),(2841,18,'Campo Bonito',NULL),(2842,18,'Campo do Tenente',NULL),(2843,18,'Campo Largo',NULL),(2844,18,'Campo Magro',NULL),(2845,18,'Campo Mourão',NULL),(2846,18,'Cândido de Abreu',NULL),(2847,18,'Candói',NULL),(2848,18,'Cantagalo',NULL),(2849,18,'Capanema',NULL),(2850,18,'Capitão Leônidas Marques',NULL),(2851,18,'Carambeí',NULL),(2852,18,'Carlópolis',NULL),(2853,18,'Cascavel',NULL),(2854,18,'Castro',NULL),(2855,18,'Catanduvas',NULL),(2856,18,'Centenário do Sul',NULL),(2857,18,'Cerro Azul',NULL),(2858,18,'Céu Azul',NULL),(2859,18,'Chopinzinho',NULL),(2860,18,'Cianorte',NULL),(2861,18,'Cidade Gaúcha',NULL),(2862,18,'Clevelândia',NULL),(2863,18,'Colombo',NULL),(2864,18,'Colorado',NULL),(2865,18,'Congonhinhas',NULL),(2866,18,'Conselheiro Mairinck',NULL),(2867,18,'Contenda',NULL),(2868,18,'Corbélia',NULL),(2869,18,'Cornélio Procópio',NULL),(2870,18,'Coronel Domingos Soares',NULL),(2871,18,'Coronel Vivida',NULL),(2872,18,'Corumbataí do Sul',NULL),(2873,18,'Cruz Machado',NULL),(2874,18,'Cruzeiro do Iguaçu',NULL),(2875,18,'Cruzeiro do Oeste',NULL),(2876,18,'Cruzeiro do Sul',NULL),(2877,18,'Cruzmaltina',NULL),(2878,18,'Curitiba',NULL),(2879,18,'Curiúva',NULL),(2880,18,'Diamante d`Oeste',NULL),(2881,18,'Diamante do Norte',NULL),(2882,18,'Diamante do Sul',NULL),(2883,18,'Dois Vizinhos',NULL),(2884,18,'Douradina',NULL),(2885,18,'Doutor Camargo',NULL),(2886,18,'Doutor Ulysses',NULL),(2887,18,'Enéas Marques',NULL),(2888,18,'Engenheiro Beltrão',NULL),(2889,18,'Entre Rios do Oeste',NULL),(2890,18,'Esperança Nova',NULL),(2891,18,'Espigão Alto do Iguaçu',NULL),(2892,18,'Farol',NULL),(2893,18,'Faxinal',NULL),(2894,18,'Fazenda Rio Grande',NULL),(2895,18,'Fênix',NULL),(2896,18,'Fernandes Pinheiro',NULL),(2897,18,'Figueira',NULL),(2898,18,'Flor da Serra do Sul',NULL),(2899,18,'Floraí',NULL),(2900,18,'Floresta',NULL),(2901,18,'Florestópolis',NULL),(2902,18,'Flórida',NULL),(2903,18,'Formosa do Oeste',NULL),(2904,18,'Foz do Iguaçu',NULL),(2905,18,'Foz do Jordão',NULL),(2906,18,'Francisco Alves',NULL),(2907,18,'Francisco Beltrão',NULL),(2908,18,'General Carneiro',NULL),(2909,18,'Godoy Moreira',NULL),(2910,18,'Goioerê',NULL),(2911,18,'Goioxim',NULL),(2912,18,'Grandes Rios',NULL),(2913,18,'Guaíra',NULL),(2914,18,'Guairaçá',NULL),(2915,18,'Guamiranga',NULL),(2916,18,'Guapirama',NULL),(2917,18,'Guaporema',NULL),(2918,18,'Guaraci',NULL),(2919,18,'Guaraniaçu',NULL),(2920,18,'Guarapuava',NULL),(2921,18,'Guaraqueçaba',NULL),(2922,18,'Guaratuba',NULL),(2923,18,'Honório Serpa',NULL),(2924,18,'Ibaiti',NULL),(2925,18,'Ibema',NULL),(2926,18,'Ibiporã',NULL),(2927,18,'Icaraíma',NULL),(2928,18,'Iguaraçu',NULL),(2929,18,'Iguatu',NULL),(2930,18,'Imbaú',NULL),(2931,18,'Imbituva',NULL),(2932,18,'Inácio Martins',NULL),(2933,18,'Inajá',NULL),(2934,18,'Indianópolis',NULL),(2935,18,'Ipiranga',NULL),(2936,18,'Iporã',NULL),(2937,18,'Iracema do Oeste',NULL),(2938,18,'Irati',NULL),(2939,18,'Iretama',NULL),(2940,18,'Itaguajé',NULL),(2941,18,'Itaipulândia',NULL),(2942,18,'Itambaracá',NULL),(2943,18,'Itambé',NULL),(2944,18,'Itapejara d`Oeste',NULL),(2945,18,'Itaperuçu',NULL),(2946,18,'Itaúna do Sul',NULL),(2947,18,'Ivaí',NULL),(2948,18,'Ivaiporã',NULL),(2949,18,'Ivaté',NULL),(2950,18,'Ivatuba',NULL),(2951,18,'Jaboti',NULL),(2952,18,'Jacarezinho',NULL),(2953,18,'Jaguapitã',NULL),(2954,18,'Jaguariaíva',NULL),(2955,18,'Jandaia do Sul',NULL),(2956,18,'Janiópolis',NULL),(2957,18,'Japira',NULL),(2958,18,'Japurá',NULL),(2959,18,'Jardim Alegre',NULL),(2960,18,'Jardim Olinda',NULL),(2961,18,'Jataizinho',NULL),(2962,18,'Jesuítas',NULL),(2963,18,'Joaquim Távora',NULL),(2964,18,'Jundiaí do Sul',NULL),(2965,18,'Juranda',NULL),(2966,18,'Jussara',NULL),(2967,18,'Kaloré',NULL),(2968,18,'Lapa',NULL),(2969,18,'Laranjal',NULL),(2970,18,'Laranjeiras do Sul',NULL),(2971,18,'Leópolis',NULL),(2972,18,'Lidianópolis',NULL),(2973,18,'Lindoeste',NULL),(2974,18,'Loanda',NULL),(2975,18,'Lobato',NULL),(2976,18,'Londrina',NULL),(2977,18,'Luiziana',NULL),(2978,18,'Lunardelli',NULL),(2979,18,'Lupionópolis',NULL),(2980,18,'Mallet',NULL),(2981,18,'Mamborê',NULL),(2982,18,'Mandaguaçu',NULL),(2983,18,'Mandaguari',NULL),(2984,18,'Mandirituba',NULL),(2985,18,'Manfrinópolis',NULL),(2986,18,'Mangueirinha',NULL),(2987,18,'Manoel Ribas',NULL),(2988,18,'Marechal Cândido Rondon',NULL),(2989,18,'Maria Helena',NULL),(2990,18,'Marialva',NULL),(2991,18,'Marilândia do Sul',NULL),(2992,18,'Marilena',NULL),(2993,18,'Mariluz',NULL),(2994,18,'Maringá',NULL),(2995,18,'Mariópolis',NULL),(2996,18,'Maripá',NULL),(2997,18,'Marmeleiro',NULL),(2998,18,'Marquinho',NULL),(2999,18,'Marumbi',NULL),(3000,18,'Matelândia',NULL),(3001,18,'Matinhos',NULL),(3002,18,'Mato Rico',NULL),(3003,18,'Mauá da Serra',NULL),(3004,18,'Medianeira',NULL),(3005,18,'Mercedes',NULL),(3006,18,'Mirador',NULL),(3007,18,'Miraselva',NULL),(3008,18,'Missal',NULL),(3009,18,'Moreira Sales',NULL),(3010,18,'Morretes',NULL),(3011,18,'Munhoz de Melo',NULL),(3012,18,'Nossa Senhora das Graças',NULL),(3013,18,'Nova Aliança do Ivaí',NULL),(3014,18,'Nova América da Colina',NULL),(3015,18,'Nova Aurora',NULL),(3016,18,'Nova Cantu',NULL),(3017,18,'Nova Esperança',NULL),(3018,18,'Nova Esperança do Sudoeste',NULL),(3019,18,'Nova Fátima',NULL),(3020,18,'Nova Laranjeiras',NULL),(3021,18,'Nova Londrina',NULL),(3022,18,'Nova Olímpia',NULL),(3023,18,'Nova Prata do Iguaçu',NULL),(3024,18,'Nova Santa Bárbara',NULL),(3025,18,'Nova Santa Rosa',NULL),(3026,18,'Nova Tebas',NULL),(3027,18,'Novo Itacolomi',NULL),(3028,18,'Ortigueira',NULL),(3029,18,'Ourizona',NULL),(3030,18,'Ouro Verde do Oeste',NULL),(3031,18,'Paiçandu',NULL),(3032,18,'Palmas',NULL),(3033,18,'Palmeira',NULL),(3034,18,'Palmital',NULL),(3035,18,'Palotina',NULL),(3036,18,'Paraíso do Norte',NULL),(3037,18,'Paranacity',NULL),(3038,18,'Paranaguá',NULL),(3039,18,'Paranapoema',NULL),(3040,18,'Paranavaí',NULL),(3041,18,'Pato Bragado',NULL),(3042,18,'Pato Branco',NULL),(3043,18,'Paula Freitas',NULL),(3044,18,'Paulo Frontin',NULL),(3045,18,'Peabiru',NULL),(3046,18,'Perobal',NULL),(3047,18,'Pérola',NULL),(3048,18,'Pérola d`Oeste',NULL),(3049,18,'Piên',NULL),(3050,18,'Pinhais',NULL),(3051,18,'Pinhal de São Bento',NULL),(3052,18,'Pinhalão',NULL),(3053,18,'Pinhão',NULL),(3054,18,'Piraí do Sul',NULL),(3055,18,'Piraquara',NULL),(3056,18,'Pitanga',NULL),(3057,18,'Pitangueiras',NULL),(3058,18,'Planaltina do Paraná',NULL),(3059,18,'Planalto',NULL),(3060,18,'Ponta Grossa',NULL),(3061,18,'Pontal do Paraná',NULL),(3062,18,'Porecatu',NULL),(3063,18,'Porto Amazonas',NULL),(3064,18,'Porto Barreiro',NULL),(3065,18,'Porto Rico',NULL),(3066,18,'Porto Vitória',NULL),(3067,18,'Prado Ferreira',NULL),(3068,18,'Pranchita',NULL),(3069,18,'Presidente Castelo Branco',NULL),(3070,18,'Primeiro de Maio',NULL),(3071,18,'Prudentópolis',NULL),(3072,18,'Quarto Centenário',NULL),(3073,18,'Quatiguá',NULL),(3074,18,'Quatro Barras',NULL),(3075,18,'Quatro Pontes',NULL),(3076,18,'Quedas do Iguaçu',NULL),(3077,18,'Querência do Norte',NULL),(3078,18,'Quinta do Sol',NULL),(3079,18,'Quitandinha',NULL),(3080,18,'Ramilândia',NULL),(3081,18,'Rancho Alegre',NULL),(3082,18,'Rancho Alegre d`Oeste',NULL),(3083,18,'Realeza',NULL),(3084,18,'Rebouças',NULL),(3085,18,'Renascença',NULL),(3086,18,'Reserva',NULL),(3087,18,'Reserva do Iguaçu',NULL),(3088,18,'Ribeirão Claro',NULL),(3089,18,'Ribeirão do Pinhal',NULL),(3090,18,'Rio Azul',NULL),(3091,18,'Rio Bom',NULL),(3092,18,'Rio Bonito do Iguaçu',NULL),(3093,18,'Rio Branco do Ivaí',NULL),(3094,18,'Rio Branco do Sul',NULL),(3095,18,'Rio Negro',NULL),(3096,18,'Rolândia',NULL),(3097,18,'Roncador',NULL),(3098,18,'Rondon',NULL),(3099,18,'Rosário do Ivaí',NULL),(3100,18,'Sabáudia',NULL),(3101,18,'Salgado Filho',NULL),(3102,18,'Salto do Itararé',NULL),(3103,18,'Salto do Lontra',NULL),(3104,18,'Santa Amélia',NULL),(3105,18,'Santa Cecília do Pavão',NULL),(3106,18,'Santa Cruz de Monte Castelo',NULL),(3107,18,'Santa Fé',NULL),(3108,18,'Santa Helena',NULL),(3109,18,'Santa Inês',NULL),(3110,18,'Santa Isabel do Ivaí',NULL),(3111,18,'Santa Izabel do Oeste',NULL),(3112,18,'Santa Lúcia',NULL),(3113,18,'Santa Maria do Oeste',NULL),(3114,18,'Santa Mariana',NULL),(3115,18,'Santa Mônica',NULL),(3116,18,'Santa Tereza do Oeste',NULL),(3117,18,'Santa Terezinha de Itaipu',NULL),(3118,18,'Santana do Itararé',NULL),(3119,18,'Santo Antônio da Platina',NULL),(3120,18,'Santo Antônio do Caiuá',NULL),(3121,18,'Santo Antônio do Paraíso',NULL),(3122,18,'Santo Antônio do Sudoeste',NULL),(3123,18,'Santo Inácio',NULL),(3124,18,'São Carlos do Ivaí',NULL),(3125,18,'São Jerônimo da Serra',NULL),(3126,18,'São João',NULL),(3127,18,'São João do Caiuá',NULL),(3128,18,'São João do Ivaí',NULL),(3129,18,'São João do Triunfo',NULL),(3130,18,'São Jorge d`Oeste',NULL),(3131,18,'São Jorge do Ivaí',NULL),(3132,18,'São Jorge do Patrocínio',NULL),(3133,18,'São José da Boa Vista',NULL),(3134,18,'São José das Palmeiras',NULL),(3135,18,'São José dos Pinhais',NULL),(3136,18,'São Manoel do Paraná',NULL),(3137,18,'São Mateus do Sul',NULL),(3138,18,'São Miguel do Iguaçu',NULL),(3139,18,'São Pedro do Iguaçu',NULL),(3140,18,'São Pedro do Ivaí',NULL),(3141,18,'São Pedro do Paraná',NULL),(3142,18,'São Sebastião da Amoreira',NULL),(3143,18,'São Tomé',NULL),(3144,18,'Sapopema',NULL),(3145,18,'Sarandi',NULL),(3146,18,'Saudade do Iguaçu',NULL),(3147,18,'Sengés',NULL),(3148,18,'Serranópolis do Iguaçu',NULL),(3149,18,'Sertaneja',NULL),(3150,18,'Sertanópolis',NULL),(3151,18,'Siqueira Campos',NULL),(3152,18,'Sulina',NULL),(3153,18,'Tamarana',NULL),(3154,18,'Tamboara',NULL),(3155,18,'Tapejara',NULL),(3156,18,'Tapira',NULL),(3157,18,'Teixeira Soares',NULL),(3158,18,'Telêmaco Borba',NULL),(3159,18,'Terra Boa',NULL),(3160,18,'Terra Rica',NULL),(3161,18,'Terra Roxa',NULL),(3162,18,'Tibagi',NULL),(3163,18,'Tijucas do Sul',NULL),(3164,18,'Toledo',NULL),(3165,18,'Tomazina',NULL),(3166,18,'Três Barras do Paraná',NULL),(3167,18,'Tunas do Paraná',NULL),(3168,18,'Tuneiras do Oeste',NULL),(3169,18,'Tupãssi',NULL),(3170,18,'Turvo',NULL),(3171,18,'Ubiratã',NULL),(3172,18,'Umuarama',NULL),(3173,18,'União da Vitória',NULL),(3174,18,'Uniflor',NULL),(3175,18,'Uraí',NULL),(3176,18,'Ventania',NULL),(3177,18,'Vera Cruz do Oeste',NULL),(3178,18,'Verê',NULL),(3179,18,'Virmond',NULL),(3180,18,'Vitorino',NULL),(3181,18,'Wenceslau Braz',NULL),(3182,18,'Xambrê',NULL),(3183,16,'Abreu e Lima',NULL),(3184,16,'Afogados da Ingazeira',NULL),(3185,16,'Afrânio',NULL),(3186,16,'Agrestina',NULL),(3187,16,'Água Preta',NULL),(3188,16,'Águas Belas',NULL),(3189,16,'Alagoinha',NULL),(3190,16,'Aliança',NULL),(3191,16,'Altinho',NULL),(3192,16,'Amaraji',NULL),(3193,16,'Angelim',NULL),(3194,16,'Araçoiaba',NULL),(3195,16,'Araripina',NULL),(3196,16,'Arcoverde',NULL),(3197,16,'Barra de Guabiraba',NULL),(3198,16,'Barreiros',NULL),(3199,16,'Belém de Maria',NULL),(3200,16,'Belém de São Francisco',NULL),(3201,16,'Belo Jardim',NULL),(3202,16,'Betânia',NULL),(3203,16,'Bezerros',NULL),(3204,16,'Bodocó',NULL),(3205,16,'Bom Conselho',NULL),(3206,16,'Bom Jardim',NULL),(3207,16,'Bonito',NULL),(3208,16,'Brejão',NULL),(3209,16,'Brejinho',NULL),(3210,16,'Brejo da Madre de Deus',NULL),(3211,16,'Buenos Aires',NULL),(3212,16,'Buíque',NULL),(3213,16,'Cabo de Santo Agostinho',NULL),(3214,16,'Cabrobó',NULL),(3215,16,'Cachoeirinha',NULL),(3216,16,'Caetés',NULL),(3217,16,'Calçado',NULL),(3218,16,'Calumbi',NULL),(3219,16,'Camaragibe',NULL),(3220,16,'Camocim de São Félix',NULL),(3221,16,'Camutanga',NULL),(3222,16,'Canhotinho',NULL),(3223,16,'Capoeiras',NULL),(3224,16,'Carnaíba',NULL),(3225,16,'Carnaubeira da Penha',NULL),(3226,16,'Carpina',NULL),(3227,16,'Caruaru',NULL),(3228,16,'Casinhas',NULL),(3229,16,'Catende',NULL),(3230,16,'Cedro',NULL),(3231,16,'Chã de Alegria',NULL),(3232,16,'Chã Grande',NULL),(3233,16,'Condado',NULL),(3234,16,'Correntes',NULL),(3235,16,'Cortês',NULL),(3236,16,'Cumaru',NULL),(3237,16,'Cupira',NULL),(3238,16,'Custódia',NULL),(3239,16,'Dormentes',NULL),(3240,16,'Escada',NULL),(3241,16,'Exu',NULL),(3242,16,'Feira Nova',NULL),(3243,16,'Fernando de Noronha',NULL),(3244,16,'Ferreiros',NULL),(3245,16,'Flores',NULL),(3246,16,'Floresta',NULL),(3247,16,'Frei Miguelinho',NULL),(3248,16,'Gameleira',NULL),(3249,16,'Garanhuns',NULL),(3250,16,'Glória do Goitá',NULL),(3251,16,'Goiana',NULL),(3252,16,'Granito',NULL),(3253,16,'Gravatá',NULL),(3254,16,'Iati',NULL),(3255,16,'Ibimirim',NULL),(3256,16,'Ibirajuba',NULL),(3257,16,'Igarassu',NULL),(3258,16,'Iguaraci',NULL),(3259,16,'Ilha de Itamaracá',NULL),(3260,16,'Inajá',NULL),(3261,16,'Ingazeira',NULL),(3262,16,'Ipojuca',NULL),(3263,16,'Ipubi',NULL),(3264,16,'Itacuruba',NULL),(3265,16,'Itaíba',NULL),(3266,16,'Itambé',NULL),(3267,16,'Itapetim',NULL),(3268,16,'Itapissuma',NULL),(3269,16,'Itaquitinga',NULL),(3270,16,'Jaboatão dos Guararapes',NULL),(3271,16,'Jaqueira',NULL),(3272,16,'Jataúba',NULL),(3273,16,'Jatobá',NULL),(3274,16,'João Alfredo',NULL),(3275,16,'Joaquim Nabuco',NULL),(3276,16,'Jucati',NULL),(3277,16,'Jupi',NULL),(3278,16,'Jurema',NULL),(3279,16,'Lagoa do Carro',NULL),(3280,16,'Lagoa do Itaenga',NULL),(3281,16,'Lagoa do Ouro',NULL),(3282,16,'Lagoa dos Gatos',NULL),(3283,16,'Lagoa Grande',NULL),(3284,16,'Lajedo',NULL),(3285,16,'Limoeiro',NULL),(3286,16,'Macaparana',NULL),(3287,16,'Machados',NULL),(3288,16,'Manari',NULL),(3289,16,'Maraial',NULL),(3290,16,'Mirandiba',NULL),(3291,16,'Moreilândia',NULL),(3292,16,'Moreno',NULL),(3293,16,'Nazaré da Mata',NULL),(3294,16,'Olinda',NULL),(3295,16,'Orobó',NULL),(3296,16,'Orocó',NULL),(3297,16,'Ouricuri',NULL),(3298,16,'Palmares',NULL),(3299,16,'Palmeirina',NULL),(3300,16,'Panelas',NULL),(3301,16,'Paranatama',NULL),(3302,16,'Parnamirim',NULL),(3303,16,'Passira',NULL),(3304,16,'Paudalho',NULL),(3305,16,'Paulista',NULL),(3306,16,'Pedra',NULL),(3307,16,'Pesqueira',NULL),(3308,16,'Petrolândia',NULL),(3309,16,'Petrolina',NULL),(3310,16,'Poção',NULL),(3311,16,'Pombos',NULL),(3312,16,'Primavera',NULL),(3313,16,'Quipapá',NULL),(3314,16,'Quixaba',NULL),(3315,16,'Recife',NULL),(3316,16,'Riacho das Almas',NULL),(3317,16,'Ribeirão',NULL),(3318,16,'Rio Formoso',NULL),(3319,16,'Sairé',NULL),(3320,16,'Salgadinho',NULL),(3321,16,'Salgueiro',NULL),(3322,16,'Saloá',NULL),(3323,16,'Sanharó',NULL),(3324,16,'Santa Cruz',NULL),(3325,16,'Santa Cruz da Baixa Verde',NULL),(3326,16,'Santa Cruz do Capibaribe',NULL),(3327,16,'Santa Filomena',NULL),(3328,16,'Santa Maria da Boa Vista',NULL),(3329,16,'Santa Maria do Cambucá',NULL),(3330,16,'Santa Terezinha',NULL),(3331,16,'São Benedito do Sul',NULL),(3332,16,'São Bento do Una',NULL),(3333,16,'São Caitano',NULL),(3334,16,'São João',NULL),(3335,16,'São Joaquim do Monte',NULL),(3336,16,'São José da Coroa Grande',NULL),(3337,16,'São José do Belmonte',NULL),(3338,16,'São José do Egito',NULL),(3339,16,'São Lourenço da Mata',NULL),(3340,16,'São Vicente Ferrer',NULL),(3341,16,'Serra Talhada',NULL),(3342,16,'Serrita',NULL),(3343,16,'Sertânia',NULL),(3344,16,'Sirinhaém',NULL),(3345,16,'Solidão',NULL),(3346,16,'Surubim',NULL),(3347,16,'Tabira',NULL),(3348,16,'Tacaimbó',NULL),(3349,16,'Tacaratu',NULL),(3350,16,'Tamandaré',NULL),(3351,16,'Taquaritinga do Norte',NULL),(3352,16,'Terezinha',NULL),(3353,16,'Terra Nova',NULL),(3354,16,'Timbaúba',NULL),(3355,16,'Toritama',NULL),(3356,16,'Tracunhaém',NULL),(3357,16,'Trindade',NULL),(3358,16,'Triunfo',NULL),(3359,16,'Tupanatinga',NULL),(3360,16,'Tuparetama',NULL),(3361,16,'Venturosa',NULL),(3362,16,'Verdejante',NULL),(3363,16,'Vertente do Lério',NULL),(3364,16,'Vertentes',NULL),(3365,16,'Vicência',NULL),(3366,16,'Vitória de Santo Antão',NULL),(3367,16,'Xexéu',NULL),(3368,17,'Acauã',NULL),(3369,17,'Agricolândia',NULL),(3370,17,'Água Branca',NULL),(3371,17,'Alagoinha do Piauí',NULL),(3372,17,'Alegrete do Piauí',NULL),(3373,17,'Alto Longá',NULL),(3374,17,'Altos',NULL),(3375,17,'Alvorada do Gurguéia',NULL),(3376,17,'Amarante',NULL),(3377,17,'Angical do Piauí',NULL),(3378,17,'Anísio de Abreu',NULL),(3379,17,'Antônio Almeida',NULL),(3380,17,'Aroazes',NULL),(3381,17,'Aroeiras do Itaim',NULL),(3382,17,'Arraial',NULL),(3383,17,'Assunção do Piauí',NULL),(3384,17,'Avelino Lopes',NULL),(3385,17,'Baixa Grande do Ribeiro',NULL),(3386,17,'Barra d`Alcântara',NULL),(3387,17,'Barras',NULL),(3388,17,'Barreiras do Piauí',NULL),(3389,17,'Barro Duro',NULL),(3390,17,'Batalha',NULL),(3391,17,'Bela Vista do Piauí',NULL),(3392,17,'Belém do Piauí',NULL),(3393,17,'Beneditinos',NULL),(3394,17,'Bertolínia',NULL),(3395,17,'Betânia do Piauí',NULL),(3396,17,'Boa Hora',NULL),(3397,17,'Bocaina',NULL),(3398,17,'Bom Jesus',NULL),(3399,17,'Bom Princípio do Piauí',NULL),(3400,17,'Bonfim do Piauí',NULL),(3401,17,'Boqueirão do Piauí',NULL),(3402,17,'Brasileira',NULL),(3403,17,'Brejo do Piauí',NULL),(3404,17,'Buriti dos Lopes',NULL),(3405,17,'Buriti dos Montes',NULL),(3406,17,'Cabeceiras do Piauí',NULL),(3407,17,'Cajazeiras do Piauí',NULL),(3408,17,'Cajueiro da Praia',NULL),(3409,17,'Caldeirão Grande do Piauí',NULL),(3410,17,'Campinas do Piauí',NULL),(3411,17,'Campo Alegre do Fidalgo',NULL),(3412,17,'Campo Grande do Piauí',NULL),(3413,17,'Campo Largo do Piauí',NULL),(3414,17,'Campo Maior',NULL),(3415,17,'Canavieira',NULL),(3416,17,'Canto do Buriti',NULL),(3417,17,'Capitão de Campos',NULL),(3418,17,'Capitão Gervásio Oliveira',NULL),(3419,17,'Caracol',NULL),(3420,17,'Caraúbas do Piauí',NULL),(3421,17,'Caridade do Piauí',NULL),(3422,17,'Castelo do Piauí',NULL),(3423,17,'Caxingó',NULL),(3424,17,'Cocal',NULL),(3425,17,'Cocal de Telha',NULL),(3426,17,'Cocal dos Alves',NULL),(3427,17,'Coivaras',NULL),(3428,17,'Colônia do Gurguéia',NULL),(3429,17,'Colônia do Piauí',NULL),(3430,17,'Conceição do Canindé',NULL),(3431,17,'Coronel José Dias',NULL),(3432,17,'Corrente',NULL),(3433,17,'Cristalândia do Piauí',NULL),(3434,17,'Cristino Castro',NULL),(3435,17,'Curimatá',NULL),(3436,17,'Currais',NULL),(3437,17,'Curral Novo do Piauí',NULL),(3438,17,'Curralinhos',NULL),(3439,17,'Demerval Lobão',NULL),(3440,17,'Dirceu Arcoverde',NULL),(3441,17,'Dom Expedito Lopes',NULL),(3442,17,'Dom Inocêncio',NULL),(3443,17,'Domingos Mourão',NULL),(3444,17,'Elesbão Veloso',NULL),(3445,17,'Eliseu Martins',NULL),(3446,17,'Esperantina',NULL),(3447,17,'Fartura do Piauí',NULL),(3448,17,'Flores do Piauí',NULL),(3449,17,'Floresta do Piauí',NULL),(3450,17,'Floriano',NULL),(3451,17,'Francinópolis',NULL),(3452,17,'Francisco Ayres',NULL),(3453,17,'Francisco Macedo',NULL),(3454,17,'Francisco Santos',NULL),(3455,17,'Fronteiras',NULL),(3456,17,'Geminiano',NULL),(3457,17,'Gilbués',NULL),(3458,17,'Guadalupe',NULL),(3459,17,'Guaribas',NULL),(3460,17,'Hugo Napoleão',NULL),(3461,17,'Ilha Grande',NULL),(3462,17,'Inhuma',NULL),(3463,17,'Ipiranga do Piauí',NULL),(3464,17,'Isaías Coelho',NULL),(3465,17,'Itainópolis',NULL),(3466,17,'Itaueira',NULL),(3467,17,'Jacobina do Piauí',NULL),(3468,17,'Jaicós',NULL),(3469,17,'Jardim do Mulato',NULL),(3470,17,'Jatobá do Piauí',NULL),(3471,17,'Jerumenha',NULL),(3472,17,'João Costa',NULL),(3473,17,'Joaquim Pires',NULL),(3474,17,'Joca Marques',NULL),(3475,17,'José de Freitas',NULL),(3476,17,'Juazeiro do Piauí',NULL),(3477,17,'Júlio Borges',NULL),(3478,17,'Jurema',NULL),(3479,17,'Lagoa Alegre',NULL),(3480,17,'Lagoa de São Francisco',NULL),(3481,17,'Lagoa do Barro do Piauí',NULL),(3482,17,'Lagoa do Piauí',NULL),(3483,17,'Lagoa do Sítio',NULL),(3484,17,'Lagoinha do Piauí',NULL),(3485,17,'Landri Sales',NULL),(3486,17,'Luís Correia',NULL),(3487,17,'Luzilândia',NULL),(3488,17,'Madeiro',NULL),(3489,17,'Manoel Emídio',NULL),(3490,17,'Marcolândia',NULL),(3491,17,'Marcos Parente',NULL),(3492,17,'Massapê do Piauí',NULL),(3493,17,'Matias Olímpio',NULL),(3494,17,'Miguel Alves',NULL),(3495,17,'Miguel Leão',NULL),(3496,17,'Milton Brandão',NULL),(3497,17,'Monsenhor Gil',NULL),(3498,17,'Monsenhor Hipólito',NULL),(3499,17,'Monte Alegre do Piauí',NULL),(3500,17,'Morro Cabeça no Tempo',NULL),(3501,17,'Morro do Chapéu do Piauí',NULL),(3502,17,'Murici dos Portelas',NULL),(3503,17,'Nazaré do Piauí',NULL),(3504,17,'Nossa Senhora de Nazaré',NULL),(3505,17,'Nossa Senhora dos Remédios',NULL),(3506,17,'Nova Santa Rita',NULL),(3507,17,'Novo Oriente do Piauí',NULL),(3508,17,'Novo Santo Antônio',NULL),(3509,17,'Oeiras',NULL),(3510,17,'Olho d`Água do Piauí',NULL),(3511,17,'Padre Marcos',NULL),(3512,17,'Paes Landim',NULL),(3513,17,'Pajeú do Piauí',NULL),(3514,17,'Palmeira do Piauí',NULL),(3515,17,'Palmeirais',NULL),(3516,17,'Paquetá',NULL),(3517,17,'Parnaguá',NULL),(3518,17,'Parnaíba',NULL),(3519,17,'Passagem Franca do Piauí',NULL),(3520,17,'Patos do Piauí',NULL),(3521,17,'Pau d`Arco do Piauí',NULL),(3522,17,'Paulistana',NULL),(3523,17,'Pavussu',NULL),(3524,17,'Pedro II',NULL),(3525,17,'Pedro Laurentino',NULL),(3526,17,'Picos',NULL),(3527,17,'Pimenteiras',NULL),(3528,17,'Pio IX',NULL),(3529,17,'Piracuruca',NULL),(3530,17,'Piripiri',NULL),(3531,17,'Porto',NULL),(3532,17,'Porto Alegre do Piauí',NULL),(3533,17,'Prata do Piauí',NULL),(3534,17,'Queimada Nova',NULL),(3535,17,'Redenção do Gurguéia',NULL),(3536,17,'Regeneração',NULL),(3537,17,'Riacho Frio',NULL),(3538,17,'Ribeira do Piauí',NULL),(3539,17,'Ribeiro Gonçalves',NULL),(3540,17,'Rio Grande do Piauí',NULL),(3541,17,'Santa Cruz do Piauí',NULL),(3542,17,'Santa Cruz dos Milagres',NULL),(3543,17,'Santa Filomena',NULL),(3544,17,'Santa Luz',NULL),(3545,17,'Santa Rosa do Piauí',NULL),(3546,17,'Santana do Piauí',NULL),(3547,17,'Santo Antônio de Lisboa',NULL),(3548,17,'Santo Antônio dos Milagres',NULL),(3549,17,'Santo Inácio do Piauí',NULL),(3550,17,'São Braz do Piauí',NULL),(3551,17,'São Félix do Piauí',NULL),(3552,17,'São Francisco de Assis do Piauí',NULL),(3553,17,'São Francisco do Piauí',NULL),(3554,17,'São Gonçalo do Gurguéia',NULL),(3555,17,'São Gonçalo do Piauí',NULL),(3556,17,'São João da Canabrava',NULL),(3557,17,'São João da Fronteira',NULL),(3558,17,'São João da Serra',NULL),(3559,17,'São João da Varjota',NULL),(3560,17,'São João do Arraial',NULL),(3561,17,'São João do Piauí',NULL),(3562,17,'São José do Divino',NULL),(3563,17,'São José do Peixe',NULL),(3564,17,'São José do Piauí',NULL),(3565,17,'São Julião',NULL),(3566,17,'São Lourenço do Piauí',NULL),(3567,17,'São Luis do Piauí',NULL),(3568,17,'São Miguel da Baixa Grande',NULL),(3569,17,'São Miguel do Fidalgo',NULL),(3570,17,'São Miguel do Tapuio',NULL),(3571,17,'São Pedro do Piauí',NULL),(3572,17,'São Raimundo Nonato',NULL),(3573,17,'Sebastião Barros',NULL),(3574,17,'Sebastião Leal',NULL),(3575,17,'Sigefredo Pacheco',NULL),(3576,17,'Simões',NULL),(3577,17,'Simplício Mendes',NULL),(3578,17,'Socorro do Piauí',NULL),(3579,17,'Sussuapara',NULL),(3580,17,'Tamboril do Piauí',NULL),(3581,17,'Tanque do Piauí',NULL),(3582,17,'Teresina',NULL),(3583,17,'União',NULL),(3584,17,'Uruçuí',NULL),(3585,17,'Valença do Piauí',NULL),(3586,17,'Várzea Branca',NULL),(3587,17,'Várzea Grande',NULL),(3588,17,'Vera Mendes',NULL),(3589,17,'Vila Nova do Piauí',NULL),(3590,17,'Wall Ferraz',NULL),(3591,19,'Angra dos Reis',NULL),(3592,19,'Aperibé',NULL),(3593,19,'Araruama',NULL),(3594,19,'Areal',NULL),(3595,19,'Armação dos Búzios',NULL),(3596,19,'Arraial do Cabo',NULL),(3597,19,'Barra do Piraí',NULL),(3598,19,'Barra Mansa',NULL),(3599,19,'Belford Roxo',NULL),(3600,19,'Bom Jardim',NULL),(3601,19,'Bom Jesus do Itabapoana',NULL),(3602,19,'Cabo Frio',NULL),(3603,19,'Cachoeiras de Macacu',NULL),(3604,19,'Cambuci',NULL),(3605,19,'Campos dos Goytacazes',NULL),(3606,19,'Cantagalo',NULL),(3607,19,'Carapebus',NULL),(3608,19,'Cardoso Moreira',NULL),(3609,19,'Carmo',NULL),(3610,19,'Casimiro de Abreu',NULL),(3611,19,'Comendador Levy Gasparian',NULL),(3612,19,'Conceição de Macabu',NULL),(3613,19,'Cordeiro',NULL),(3614,19,'Duas Barras',NULL),(3615,19,'Duque de Caxias',NULL),(3616,19,'Engenheiro Paulo de Frontin',NULL),(3617,19,'Guapimirim',NULL),(3618,19,'Iguaba Grande',NULL),(3619,19,'Itaboraí',NULL),(3620,19,'Itaguaí',NULL),(3621,19,'Italva',NULL),(3622,19,'Itaocara',NULL),(3623,19,'Itaperuna',NULL),(3624,19,'Itatiaia',NULL),(3625,19,'Japeri',NULL),(3626,19,'Laje do Muriaé',NULL),(3627,19,'Macaé',NULL),(3628,19,'Macuco',NULL),(3629,19,'Magé',NULL),(3630,19,'Mangaratiba',NULL),(3631,19,'Maricá',NULL),(3632,19,'Mendes',NULL),(3633,19,'Mesquita',NULL),(3634,19,'Miguel Pereira',NULL),(3635,19,'Miracema',NULL),(3636,19,'Natividade',NULL),(3637,19,'Nilópolis',NULL),(3638,19,'Niterói',NULL),(3639,19,'Nova Friburgo',NULL),(3640,19,'Nova Iguaçu',NULL),(3641,19,'Paracambi',NULL),(3642,19,'Paraíba do Sul',NULL),(3643,19,'Parati',NULL),(3644,19,'Paty do Alferes',NULL),(3645,19,'Petrópolis',NULL),(3646,19,'Pinheiral',NULL),(3647,19,'Piraí',NULL),(3648,19,'Porciúncula',NULL),(3649,19,'Porto Real',NULL),(3650,19,'Quatis',NULL),(3651,19,'Queimados',NULL),(3652,19,'Quissamã',NULL),(3653,19,'Resende',NULL),(3654,19,'Rio Bonito',NULL),(3655,19,'Rio Claro',NULL),(3656,19,'Rio das Flores',NULL),(3657,19,'Rio das Ostras',NULL),(3658,19,'Rio de Janeiro',NULL),(3659,19,'Santa Maria Madalena',NULL),(3660,19,'Santo Antônio de Pádua',NULL),(3661,19,'São Fidélis',NULL),(3662,19,'São Francisco de Itabapoana',NULL),(3663,19,'São Gonçalo',NULL),(3664,19,'São João da Barra',NULL),(3665,19,'São João de Meriti',NULL),(3666,19,'São José de Ubá',NULL),(3667,19,'São José do Vale do Rio Pret',NULL),(3668,19,'São Pedro da Aldeia',NULL),(3669,19,'São Sebastião do Alto',NULL),(3670,19,'Sapucaia',NULL),(3671,19,'Saquarema',NULL),(3672,19,'Seropédica',NULL),(3673,19,'Silva Jardim',NULL),(3674,19,'Sumidouro',NULL),(3675,19,'Tanguá',NULL),(3676,19,'Teresópolis',NULL),(3677,19,'Trajano de Morais',NULL),(3678,19,'Três Rios',NULL),(3679,19,'Valença',NULL),(3680,19,'Varre-Sai',NULL),(3681,19,'Vassouras',NULL),(3682,19,'Volta Redonda',NULL),(3683,20,'Acari',NULL),(3684,20,'Açu',NULL),(3685,20,'Afonso Bezerra',NULL),(3686,20,'Água Nova',NULL),(3687,20,'Alexandria',NULL),(3688,20,'Almino Afonso',NULL),(3689,20,'Alto do Rodrigues',NULL),(3690,20,'Angicos',NULL),(3691,20,'Antônio Martins',NULL),(3692,20,'Apodi',NULL),(3693,20,'Areia Branca',NULL),(3694,20,'Arês',NULL),(3695,20,'Augusto Severo',NULL),(3696,20,'Baía Formosa',NULL),(3697,20,'Baraúna',NULL),(3698,20,'Barcelona',NULL),(3699,20,'Bento Fernandes',NULL),(3700,20,'Bodó',NULL),(3701,20,'Bom Jesus',NULL),(3702,20,'Brejinho',NULL),(3703,20,'Caiçara do Norte',NULL),(3704,20,'Caiçara do Rio do Vento',NULL),(3705,20,'Caicó',NULL),(3706,20,'Campo Redondo',NULL),(3707,20,'Canguaretama',NULL),(3708,20,'Caraúbas',NULL),(3709,20,'Carnaúba dos Dantas',NULL),(3710,20,'Carnaubais',NULL),(3711,20,'Ceará-Mirim',NULL),(3712,20,'Cerro Corá',NULL),(3713,20,'Coronel Ezequiel',NULL),(3714,20,'Coronel João Pessoa',NULL),(3715,20,'Cruzeta',NULL),(3716,20,'Currais Novos',NULL),(3717,20,'Doutor Severiano',NULL),(3718,20,'Encanto',NULL),(3719,20,'Equador',NULL),(3720,20,'Espírito Santo',NULL),(3721,20,'Extremoz',NULL),(3722,20,'Felipe Guerra',NULL),(3723,20,'Fernando Pedroza',NULL),(3724,20,'Florânia',NULL),(3725,20,'Francisco Dantas',NULL),(3726,20,'Frutuoso Gomes',NULL),(3727,20,'Galinhos',NULL),(3728,20,'Goianinha',NULL),(3729,20,'Governador Dix-Sept Rosado',NULL),(3730,20,'Grossos',NULL),(3731,20,'Guamaré',NULL),(3732,20,'Ielmo Marinho',NULL),(3733,20,'Ipanguaçu',NULL),(3734,20,'Ipueira',NULL),(3735,20,'Itajá',NULL),(3736,20,'Itaú',NULL),(3737,20,'Jaçanã',NULL),(3738,20,'Jandaíra',NULL),(3739,20,'Janduís',NULL),(3740,20,'Januário Cicco',NULL),(3741,20,'Japi',NULL),(3742,20,'Jardim de Angicos',NULL),(3743,20,'Jardim de Piranhas',NULL),(3744,20,'Jardim do Seridó',NULL),(3745,20,'João Câmara',NULL),(3746,20,'João Dias',NULL),(3747,20,'José da Penha',NULL),(3748,20,'Jucurutu',NULL),(3749,20,'Jundiá',NULL),(3750,20,'Lagoa d`Anta',NULL),(3751,20,'Lagoa de Pedras',NULL),(3752,20,'Lagoa de Velhos',NULL),(3753,20,'Lagoa Nova',NULL),(3754,20,'Lagoa Salgada',NULL),(3755,20,'Lajes',NULL),(3756,20,'Lajes Pintadas',NULL),(3757,20,'Lucrécia',NULL),(3758,20,'Luís Gomes',NULL),(3759,20,'Macaíba',NULL),(3760,20,'Macau',NULL),(3761,20,'Major Sales',NULL),(3762,20,'Marcelino Vieira',NULL),(3763,20,'Martins',NULL),(3764,20,'Maxaranguape',NULL),(3765,20,'Messias Targino',NULL),(3766,20,'Montanhas',NULL),(3767,20,'Monte Alegre',NULL),(3768,20,'Monte das Gameleiras',NULL),(3769,20,'Mossoró',NULL),(3770,20,'Natal',NULL),(3771,20,'Nísia Floresta',NULL),(3772,20,'Nova Cruz',NULL),(3773,20,'Olho-d`Água do Borges',NULL),(3774,20,'Ouro Branco',NULL),(3775,20,'Paraná',NULL),(3776,20,'Paraú',NULL),(3777,20,'Parazinho',NULL),(3778,20,'Parelhas',NULL),(3779,20,'Parnamirim',NULL),(3780,20,'Passa e Fica',NULL),(3781,20,'Passagem',NULL),(3782,20,'Patu',NULL),(3783,20,'Pau dos Ferros',NULL),(3784,20,'Pedra Grande',NULL),(3785,20,'Pedra Preta',NULL),(3786,20,'Pedro Avelino',NULL),(3787,20,'Pedro Velho',NULL),(3788,20,'Pendências',NULL),(3789,20,'Pilões',NULL),(3790,20,'Poço Branco',NULL),(3791,20,'Portalegre',NULL),(3792,20,'Porto do Mangue',NULL),(3793,20,'Presidente Juscelino',NULL),(3794,20,'Pureza',NULL),(3795,20,'Rafael Fernandes',NULL),(3796,20,'Rafael Godeiro',NULL),(3797,20,'Riacho da Cruz',NULL),(3798,20,'Riacho de Santana',NULL),(3799,20,'Riachuelo',NULL),(3800,20,'Rio do Fogo',NULL),(3801,20,'Rodolfo Fernandes',NULL),(3802,20,'Ruy Barbosa',NULL),(3803,20,'Santa Cruz',NULL),(3804,20,'Santa Maria',NULL),(3805,20,'Santana do Matos',NULL),(3806,20,'Santana do Seridó',NULL),(3807,20,'Santo Antônio',NULL),(3808,20,'São Bento do Norte',NULL),(3809,20,'São Bento do Trairí',NULL),(3810,20,'São Fernando',NULL),(3811,20,'São Francisco do Oeste',NULL),(3812,20,'São Gonçalo do Amarante',NULL),(3813,20,'São João do Sabugi',NULL),(3814,20,'São José de Mipibu',NULL),(3815,20,'São José do Campestre',NULL),(3816,20,'São José do Seridó',NULL),(3817,20,'São Miguel',NULL),(3818,20,'São Miguel do Gostoso',NULL),(3819,20,'São Paulo do Potengi',NULL),(3820,20,'São Pedro',NULL),(3821,20,'São Rafael',NULL),(3822,20,'São Tomé',NULL),(3823,20,'São Vicente',NULL),(3824,20,'Senador Elói de Souza',NULL),(3825,20,'Senador Georgino Avelino',NULL),(3826,20,'Serra de São Bento',NULL),(3827,20,'Serra do Mel',NULL),(3828,20,'Serra Negra do Norte',NULL),(3829,20,'Serrinha',NULL),(3830,20,'Serrinha dos Pintos',NULL),(3831,20,'Severiano Melo',NULL),(3832,20,'Sítio Novo',NULL),(3833,20,'Taboleiro Grande',NULL),(3834,20,'Taipu',NULL),(3835,20,'Tangará',NULL),(3836,20,'Tenente Ananias',NULL),(3837,20,'Tenente Laurentino Cruz',NULL),(3838,20,'Tibau',NULL),(3839,20,'Tibau do Sul',NULL),(3840,20,'Timbaúba dos Batistas',NULL),(3841,20,'Touros',NULL),(3842,20,'Triunfo Potiguar',NULL),(3843,20,'Umarizal',NULL),(3844,20,'Upanema',NULL),(3845,20,'Várzea',NULL),(3846,20,'Venha-Ver',NULL),(3847,20,'Vera Cruz',NULL),(3848,20,'Viçosa',NULL),(3849,20,'Vila Flor',NULL),(3850,23,'Aceguá',NULL),(3851,23,'Água Santa',NULL),(3852,23,'Agudo',NULL),(3853,23,'Ajuricaba',NULL),(3854,23,'Alecrim',NULL),(3855,23,'Alegrete',NULL),(3856,23,'Alegria',NULL),(3857,23,'Almirante Tamandaré do Sul',NULL),(3858,23,'Alpestre',NULL),(3859,23,'Alto Alegre',NULL),(3860,23,'Alto Feliz',NULL),(3861,23,'Alvorada',NULL),(3862,23,'Amaral Ferrador',NULL),(3863,23,'Ametista do Sul',NULL),(3864,23,'André da Rocha',NULL),(3865,23,'Anta Gorda',NULL),(3866,23,'Antônio Prado',NULL),(3867,23,'Arambaré',NULL),(3868,23,'Araricá',NULL),(3869,23,'Aratiba',NULL),(3870,23,'Arroio do Meio',NULL),(3871,23,'Arroio do Padre',NULL),(3872,23,'Arroio do Sal',NULL),(3873,23,'Arroio do Tigre',NULL),(3874,23,'Arroio dos Ratos',NULL),(3875,23,'Arroio Grande',NULL),(3876,23,'Arvorezinha',NULL),(3877,23,'Augusto Pestana',NULL),(3878,23,'Áurea',NULL),(3879,23,'Bagé',NULL),(3880,23,'Balneário Pinhal',NULL),(3881,23,'Barão',NULL),(3882,23,'Barão de Cotegipe',NULL),(3883,23,'Barão do Triunfo',NULL),(3884,23,'Barra do Guarita',NULL),(3885,23,'Barra do Quaraí',NULL),(3886,23,'Barra do Ribeiro',NULL),(3887,23,'Barra do Rio Azul',NULL),(3888,23,'Barra Funda',NULL),(3889,23,'Barracão',NULL),(3890,23,'Barros Cassal',NULL),(3891,23,'Benjamin Constant do Sul',NULL),(3892,23,'Bento Gonçalves',NULL),(3893,23,'Boa Vista das Missões',NULL),(3894,23,'Boa Vista do Buricá',NULL),(3895,23,'Boa Vista do Cadeado',NULL),(3896,23,'Boa Vista do Incra',NULL),(3897,23,'Boa Vista do Sul',NULL),(3898,23,'Bom Jesus',NULL),(3899,23,'Bom Princípio',NULL),(3900,23,'Bom Progresso',NULL),(3901,23,'Bom Retiro do Sul',NULL),(3902,23,'Boqueirão do Leão',NULL),(3903,23,'Bossoroca',NULL),(3904,23,'Bozano',NULL),(3905,23,'Braga',NULL),(3906,23,'Brochier',NULL),(3907,23,'Butiá',NULL),(3908,23,'Caçapava do Sul',NULL),(3909,23,'Cacequi',NULL),(3910,23,'Cachoeira do Sul',NULL),(3911,23,'Cachoeirinha',NULL),(3912,23,'Cacique Doble',NULL),(3913,23,'Caibaté',NULL),(3914,23,'Caiçara',NULL),(3915,23,'Camaquã',NULL),(3916,23,'Camargo',NULL),(3917,23,'Cambará do Sul',NULL),(3918,23,'Campestre da Serra',NULL),(3919,23,'Campina das Missões',NULL),(3920,23,'Campinas do Sul',NULL),(3921,23,'Campo Bom',NULL),(3922,23,'Campo Novo',NULL),(3923,23,'Campos Borges',NULL),(3924,23,'Candelária',NULL),(3925,23,'Cândido Godói',NULL),(3926,23,'Candiota',NULL),(3927,23,'Canela',NULL),(3928,23,'Canguçu',NULL),(3929,23,'Canoas',NULL),(3930,23,'Canudos do Vale',NULL),(3931,23,'Capão Bonito do Sul',NULL),(3932,23,'Capão da Canoa',NULL),(3933,23,'Capão do Cipó',NULL),(3934,23,'Capão do Leão',NULL),(3935,23,'Capela de Santana',NULL),(3936,23,'Capitão',NULL),(3937,23,'Capivari do Sul',NULL),(3938,23,'Caraá',NULL),(3939,23,'Carazinho',NULL),(3940,23,'Carlos Barbosa',NULL),(3941,23,'Carlos Gomes',NULL),(3942,23,'Casca',NULL),(3943,23,'Caseiros',NULL),(3944,23,'Catuípe',NULL),(3945,23,'Caxias do Sul',NULL),(3946,23,'Centenário',NULL),(3947,23,'Cerrito',NULL),(3948,23,'Cerro Branco',NULL),(3949,23,'Cerro Grande',NULL),(3950,23,'Cerro Grande do Sul',NULL),(3951,23,'Cerro Largo',NULL),(3952,23,'Chapada',NULL),(3953,23,'Charqueadas',NULL),(3954,23,'Charrua',NULL),(3955,23,'Chiapeta',NULL),(3956,23,'Chuí',NULL),(3957,23,'Chuvisca',NULL),(3958,23,'Cidreira',NULL),(3959,23,'Ciríaco',NULL),(3960,23,'Colinas',NULL),(3961,23,'Colorado',NULL),(3962,23,'Condor',NULL),(3963,23,'Constantina',NULL),(3964,23,'Coqueiro Baixo',NULL),(3965,23,'Coqueiros do Sul',NULL),(3966,23,'Coronel Barros',NULL),(3967,23,'Coronel Bicaco',NULL),(3968,23,'Coronel Pilar',NULL),(3969,23,'Cotiporã',NULL),(3970,23,'Coxilha',NULL),(3971,23,'Crissiumal',NULL),(3972,23,'Cristal',NULL),(3973,23,'Cristal do Sul',NULL),(3974,23,'Cruz Alta',NULL),(3975,23,'Cruzaltense',NULL),(3976,23,'Cruzeiro do Sul',NULL),(3977,23,'David Canabarro',NULL),(3978,23,'Derrubadas',NULL),(3979,23,'Dezesseis de Novembro',NULL),(3980,23,'Dilermando de Aguiar',NULL),(3981,23,'Dois Irmãos',NULL),(3982,23,'Dois Irmãos das Missões',NULL),(3983,23,'Dois Lajeados',NULL),(3984,23,'Dom Feliciano',NULL),(3985,23,'Dom Pedrito',NULL),(3986,23,'Dom Pedro de Alcântara',NULL),(3987,23,'Dona Francisca',NULL),(3988,23,'Doutor Maurício Cardoso',NULL),(3989,23,'Doutor Ricardo',NULL),(3990,23,'Eldorado do Sul',NULL),(3991,23,'Encantado',NULL),(3992,23,'Encruzilhada do Sul',NULL),(3993,23,'Engenho Velho',NULL),(3994,23,'Entre Rios do Sul',NULL),(3995,23,'Entre-Ijuís',NULL),(3996,23,'Erebango',NULL),(3997,23,'Erechim',NULL),(3998,23,'Ernestina',NULL),(3999,23,'Erval Grande',NULL),(4000,23,'Erval Seco',NULL),(4001,23,'Esmeralda',NULL),(4002,23,'Esperança do Sul',NULL),(4003,23,'Espumoso',NULL),(4004,23,'Estação',NULL),(4005,23,'Estância Velha',NULL),(4006,23,'Esteio',NULL),(4007,23,'Estrela',NULL),(4008,23,'Estrela Velha',NULL),(4009,23,'Eugênio de Castro',NULL),(4010,23,'Fagundes Varela',NULL),(4011,23,'Farroupilha',NULL),(4012,23,'Faxinal do Soturno',NULL),(4013,23,'Faxinalzinho',NULL),(4014,23,'Fazenda Vilanova',NULL),(4015,23,'Feliz',NULL),(4016,23,'Flores da Cunha',NULL),(4017,23,'Floriano Peixoto',NULL),(4018,23,'Fontoura Xavier',NULL),(4019,23,'Formigueiro',NULL),(4020,23,'Forquetinha',NULL),(4021,23,'Fortaleza dos Valos',NULL),(4022,23,'Frederico Westphalen',NULL),(4023,23,'Garibaldi',NULL),(4024,23,'Garruchos',NULL),(4025,23,'Gaurama',NULL),(4026,23,'General Câmara',NULL),(4027,23,'Gentil',NULL),(4028,23,'Getúlio Vargas',NULL),(4029,23,'Giruá',NULL),(4030,23,'Glorinha',NULL),(4031,23,'Gramado',NULL),(4032,23,'Gramado dos Loureiros',NULL),(4033,23,'Gramado Xavier',NULL),(4034,23,'Gravataí',NULL),(4035,23,'Guabiju',NULL),(4036,23,'Guaíba',NULL),(4037,23,'Guaporé',NULL),(4038,23,'Guarani das Missões',NULL),(4039,23,'Harmonia',NULL),(4040,23,'Herval',NULL),(4041,23,'Herveiras',NULL),(4042,23,'Horizontina',NULL),(4043,23,'Hulha Negra',NULL),(4044,23,'Humaitá',NULL),(4045,23,'Ibarama',NULL),(4046,23,'Ibiaçá',NULL),(4047,23,'Ibiraiaras',NULL),(4048,23,'Ibirapuitã',NULL),(4049,23,'Ibirubá',NULL),(4050,23,'Igrejinha',NULL),(4051,23,'Ijuí',NULL),(4052,23,'Ilópolis',NULL),(4053,23,'Imbé',NULL),(4054,23,'Imigrante',NULL),(4055,23,'Independência',NULL),(4056,23,'Inhacorá',NULL),(4057,23,'Ipê',NULL),(4058,23,'Ipiranga do Sul',NULL),(4059,23,'Iraí',NULL),(4060,23,'Itaara',NULL),(4061,23,'Itacurubi',NULL),(4062,23,'Itapuca',NULL),(4063,23,'Itaqui',NULL),(4064,23,'Itati',NULL),(4065,23,'Itatiba do Sul',NULL),(4066,23,'Ivorá',NULL),(4067,23,'Ivoti',NULL),(4068,23,'Jaboticaba',NULL),(4069,23,'Jacuizinho',NULL),(4070,23,'Jacutinga',NULL),(4071,23,'Jaguarão',NULL),(4072,23,'Jaguari',NULL),(4073,23,'Jaquirana',NULL),(4074,23,'Jari',NULL),(4075,23,'Jóia',NULL),(4076,23,'Júlio de Castilhos',NULL),(4077,23,'Lagoa Bonita do Sul',NULL),(4078,23,'Lagoa dos Três Cantos',NULL),(4079,23,'Lagoa Vermelha',NULL),(4080,23,'Lagoão',NULL),(4081,23,'Lajeado',NULL),(4082,23,'Lajeado do Bugre',NULL),(4083,23,'Lavras do Sul',NULL),(4084,23,'Liberato Salzano',NULL),(4085,23,'Lindolfo Collor',NULL),(4086,23,'Linha Nova',NULL),(4087,23,'Maçambara',NULL),(4088,23,'Machadinho',NULL),(4089,23,'Mampituba',NULL),(4090,23,'Manoel Viana',NULL),(4091,23,'Maquiné',NULL),(4092,23,'Maratá',NULL),(4093,23,'Marau',NULL),(4094,23,'Marcelino Ramos',NULL),(4095,23,'Mariana Pimentel',NULL),(4096,23,'Mariano Moro',NULL),(4097,23,'Marques de Souza',NULL),(4098,23,'Mata',NULL),(4099,23,'Mato Castelhano',NULL),(4100,23,'Mato Leitão',NULL),(4101,23,'Mato Queimado',NULL),(4102,23,'Maximiliano de Almeida',NULL),(4103,23,'Minas do Leão',NULL),(4104,23,'Miraguaí',NULL),(4105,23,'Montauri',NULL),(4106,23,'Monte Alegre dos Campos',NULL),(4107,23,'Monte Belo do Sul',NULL),(4108,23,'Montenegro',NULL),(4109,23,'Mormaço',NULL),(4110,23,'Morrinhos do Sul',NULL),(4111,23,'Morro Redondo',NULL),(4112,23,'Morro Reuter',NULL),(4113,23,'Mostardas',NULL),(4114,23,'Muçum',NULL),(4115,23,'Muitos Capões',NULL),(4116,23,'Muliterno',NULL),(4117,23,'Não-Me-Toque',NULL),(4118,23,'Nicolau Vergueiro',NULL),(4119,23,'Nonoai',NULL),(4120,23,'Nova Alvorada',NULL),(4121,23,'Nova Araçá',NULL),(4122,23,'Nova Bassano',NULL),(4123,23,'Nova Boa Vista',NULL),(4124,23,'Nova Bréscia',NULL),(4125,23,'Nova Candelária',NULL),(4126,23,'Nova Esperança do Sul',NULL),(4127,23,'Nova Hartz',NULL),(4128,23,'Nova Pádua',NULL),(4129,23,'Nova Palma',NULL),(4130,23,'Nova Petrópolis',NULL),(4131,23,'Nova Prata',NULL),(4132,23,'Nova Ramada',NULL),(4133,23,'Nova Roma do Sul',NULL),(4134,23,'Nova Santa Rita',NULL),(4135,23,'Novo Barreiro',NULL),(4136,23,'Novo Cabrais',NULL),(4137,23,'Novo Hamburgo',NULL),(4138,23,'Novo Machado',NULL),(4139,23,'Novo Tiradentes',NULL),(4140,23,'Novo Xingu',NULL),(4141,23,'Osório',NULL),(4142,23,'Paim Filho',NULL),(4143,23,'Palmares do Sul',NULL),(4144,23,'Palmeira das Missões',NULL),(4145,23,'Palmitinho',NULL),(4146,23,'Panambi',NULL),(4147,23,'Pantano Grande',NULL),(4148,23,'Paraí',NULL),(4149,23,'Paraíso do Sul',NULL),(4150,23,'Pareci Novo',NULL),(4151,23,'Parobé',NULL),(4152,23,'Passa Sete',NULL),(4153,23,'Passo do Sobrado',NULL),(4154,23,'Passo Fundo',NULL),(4155,23,'Paulo Bento',NULL),(4156,23,'Paverama',NULL),(4157,23,'Pedras Altas',NULL),(4158,23,'Pedro Osório',NULL),(4159,23,'Pejuçara',NULL),(4160,23,'Pelotas',NULL),(4161,23,'Picada Café',NULL),(4162,23,'Pinhal',NULL),(4163,23,'Pinhal da Serra',NULL),(4164,23,'Pinhal Grande',NULL),(4165,23,'Pinheirinho do Vale',NULL),(4166,23,'Pinheiro Machado',NULL),(4167,23,'Pirapó',NULL),(4168,23,'Piratini',NULL),(4169,23,'Planalto',NULL),(4170,23,'Poço das Antas',NULL),(4171,23,'Pontão',NULL),(4172,23,'Ponte Preta',NULL),(4173,23,'Portão',NULL),(4174,23,'Porto Alegre',NULL),(4175,23,'Porto Lucena',NULL),(4176,23,'Porto Mauá',NULL),(4177,23,'Porto Vera Cruz',NULL),(4178,23,'Porto Xavier',NULL),(4179,23,'Pouso Novo',NULL),(4180,23,'Presidente Lucena',NULL),(4181,23,'Progresso',NULL),(4182,23,'Protásio Alves',NULL),(4183,23,'Putinga',NULL),(4184,23,'Quaraí',NULL),(4185,23,'Quatro Irmãos',NULL),(4186,23,'Quevedos',NULL),(4187,23,'Quinze de Novembro',NULL),(4188,23,'Redentora',NULL),(4189,23,'Relvado',NULL),(4190,23,'Restinga Seca',NULL),(4191,23,'Rio dos Índios',NULL),(4192,23,'Rio Grande',NULL),(4193,23,'Rio Pardo',NULL),(4194,23,'Riozinho',NULL),(4195,23,'Roca Sales',NULL),(4196,23,'Rodeio Bonito',NULL),(4197,23,'Rolador',NULL),(4198,23,'Rolante',NULL),(4199,23,'Ronda Alta',NULL),(4200,23,'Rondinha',NULL),(4201,23,'Roque Gonzales',NULL),(4202,23,'Rosário do Sul',NULL),(4203,23,'Sagrada Família',NULL),(4204,23,'Saldanha Marinho',NULL),(4205,23,'Salto do Jacuí',NULL),(4206,23,'Salvador das Missões',NULL),(4207,23,'Salvador do Sul',NULL),(4208,23,'Sananduva',NULL),(4209,23,'Santa Bárbara do Sul',NULL),(4210,23,'Santa Cecília do Sul',NULL),(4211,23,'Santa Clara do Sul',NULL),(4212,23,'Santa Cruz do Sul',NULL),(4213,23,'Santa Margarida do Sul',NULL),(4214,23,'Santa Maria',NULL),(4215,23,'Santa Maria do Herval',NULL),(4216,23,'Santa Rosa',NULL),(4217,23,'Santa Tereza',NULL),(4218,23,'Santa Vitória do Palmar',NULL),(4219,23,'Santana da Boa Vista',NULL),(4220,23,'Santana do Livramento',NULL),(4221,23,'Santiago',NULL),(4222,23,'Santo Ângelo',NULL),(4223,23,'Santo Antônio da Patrulha',NULL),(4224,23,'Santo Antônio das Missões',NULL),(4225,23,'Santo Antônio do Palma',NULL),(4226,23,'Santo Antônio do Planalto',NULL),(4227,23,'Santo Augusto',NULL),(4228,23,'Santo Cristo',NULL),(4229,23,'Santo Expedito do Sul',NULL),(4230,23,'São Borja',NULL),(4231,23,'São Domingos do Sul',NULL),(4232,23,'São Francisco de Assis',NULL),(4233,23,'São Francisco de Paula',NULL),(4234,23,'São Gabriel',NULL),(4235,23,'São Jerônimo',NULL),(4236,23,'São João da Urtiga',NULL),(4237,23,'São João do Polêsine',NULL),(4238,23,'São Jorge',NULL),(4239,23,'São José das Missões',NULL),(4240,23,'São José do Herval',NULL),(4241,23,'São José do Hortêncio',NULL),(4242,23,'São José do Inhacorá',NULL),(4243,23,'São José do Norte',NULL),(4244,23,'São José do Ouro',NULL),(4245,23,'São José do Sul',NULL),(4246,23,'São José dos Ausentes',NULL),(4247,23,'São Leopoldo',NULL),(4248,23,'São Lourenço do Sul',NULL),(4249,23,'São Luiz Gonzaga',NULL),(4250,23,'São Marcos',NULL),(4251,23,'São Martinho',NULL),(4252,23,'São Martinho da Serra',NULL),(4253,23,'São Miguel das Missões',NULL),(4254,23,'São Nicolau',NULL),(4255,23,'São Paulo das Missões',NULL),(4256,23,'São Pedro da Serra',NULL),(4257,23,'São Pedro das Missões',NULL),(4258,23,'São Pedro do Butiá',NULL),(4259,23,'São Pedro do Sul',NULL),(4260,23,'São Sebastião do Caí',NULL),(4261,23,'São Sepé',NULL),(4262,23,'São Valentim',NULL),(4263,23,'São Valentim do Sul',NULL),(4264,23,'São Valério do Sul',NULL),(4265,23,'São Vendelino',NULL),(4266,23,'São Vicente do Sul',NULL),(4267,23,'Sapiranga',NULL),(4268,23,'Sapucaia do Sul',NULL),(4269,23,'Sarandi',NULL),(4270,23,'Seberi',NULL),(4271,23,'Sede Nova',NULL),(4272,23,'Segredo',NULL),(4273,23,'Selbach',NULL),(4274,23,'Senador Salgado Filho',NULL),(4275,23,'Sentinela do Sul',NULL),(4276,23,'Serafina Corrêa',NULL),(4277,23,'Sério',NULL),(4278,23,'Sertão',NULL),(4279,23,'Sertão Santana',NULL),(4280,23,'Sete de Setembro',NULL),(4281,23,'Severiano de Almeida',NULL),(4282,23,'Silveira Martins',NULL),(4283,23,'Sinimbu',NULL),(4284,23,'Sobradinho',NULL),(4285,23,'Soledade',NULL),(4286,23,'Tabaí',NULL),(4287,23,'Tapejara',NULL),(4288,23,'Tapera',NULL),(4289,23,'Tapes',NULL),(4290,23,'Taquara',NULL),(4291,23,'Taquari',NULL),(4292,23,'Taquaruçu do Sul',NULL),(4293,23,'Tavares',NULL),(4294,23,'Tenente Portela',NULL),(4295,23,'Terra de Areia',NULL),(4296,23,'Teutônia',NULL),(4297,23,'Tio Hugo',NULL),(4298,23,'Tiradentes do Sul',NULL),(4299,23,'Toropi',NULL),(4300,23,'Torres',NULL),(4301,23,'Tramandaí',NULL),(4302,23,'Travesseiro',NULL),(4303,23,'Três Arroios',NULL),(4304,23,'Três Cachoeiras',NULL),(4305,23,'Três Coroas',NULL),(4306,23,'Três de Maio',NULL),(4307,23,'Três Forquilhas',NULL),(4308,23,'Três Palmeiras',NULL),(4309,23,'Três Passos',NULL),(4310,23,'Trindade do Sul',NULL),(4311,23,'Triunfo',NULL),(4312,23,'Tucunduva',NULL),(4313,23,'Tunas',NULL),(4314,23,'Tupanci do Sul',NULL),(4315,23,'Tupanciretã',NULL),(4316,23,'Tupandi',NULL),(4317,23,'Tuparendi',NULL),(4318,23,'Turuçu',NULL),(4319,23,'Ubiretama',NULL),(4320,23,'União da Serra',NULL),(4321,23,'Unistalda',NULL),(4322,23,'Uruguaiana',NULL),(4323,23,'Vacaria',NULL),(4324,23,'Vale do Sol',NULL),(4325,23,'Vale Real',NULL),(4326,23,'Vale Verde',NULL),(4327,23,'Vanini',NULL),(4328,23,'Venâncio Aires',NULL),(4329,23,'Vera Cruz',NULL),(4330,23,'Veranópolis',NULL),(4331,23,'Vespasiano Correa',NULL),(4332,23,'Viadutos',NULL),(4333,23,'Viamão',NULL),(4334,23,'Vicente Dutra',NULL),(4335,23,'Victor Graeff',NULL),(4336,23,'Vila Flores',NULL),(4337,23,'Vila Lângaro',NULL),(4338,23,'Vila Maria',NULL),(4339,23,'Vila Nova do Sul',NULL),(4340,23,'Vista Alegre',NULL),(4341,23,'Vista Alegre do Prata',NULL),(4342,23,'Vista Gaúcha',NULL),(4343,23,'Vitória das Missões',NULL),(4344,23,'Westfália',NULL),(4345,23,'Xangri-lá',NULL),(4346,21,'Alta Floresta d`Oeste',NULL),(4347,21,'Alto Alegre dos Parecis',NULL),(4348,21,'Alto Paraíso',NULL),(4349,21,'Alvorada d`Oeste',NULL),(4350,21,'Ariquemes',NULL),(4351,21,'Buritis',NULL),(4352,21,'Cabixi',NULL),(4353,21,'Cacaulândia',NULL),(4354,21,'Cacoal',NULL),(4355,21,'Campo Novo de Rondônia',NULL),(4356,21,'Candeias do Jamari',NULL),(4357,21,'Castanheiras',NULL),(4358,21,'Cerejeiras',NULL),(4359,21,'Chupinguaia',NULL),(4360,21,'Colorado do Oeste',NULL),(4361,21,'Corumbiara',NULL),(4362,21,'Costa Marques',NULL),(4363,21,'Cujubim',NULL),(4364,21,'Espigão d`Oeste',NULL),(4365,21,'Governador Jorge Teixeira',NULL),(4366,21,'Guajará-Mirim',NULL),(4367,21,'Itapuã do Oeste',NULL),(4368,21,'Jaru',NULL),(4369,21,'Ji-Paraná',NULL),(4370,21,'Machadinho d`Oeste',NULL),(4371,21,'Ministro Andreazza',NULL),(4372,21,'Mirante da Serra',NULL),(4373,21,'Monte Negro',NULL),(4374,21,'Nova Brasilândia d`Oeste',NULL),(4375,21,'Nova Mamoré',NULL),(4376,21,'Nova União',NULL),(4377,21,'Novo Horizonte do Oeste',NULL),(4378,21,'Ouro Preto do Oeste',NULL),(4379,21,'Parecis',NULL),(4380,21,'Pimenta Bueno',NULL),(4381,21,'Pimenteiras do Oeste',NULL),(4382,21,'Porto Velho',NULL),(4383,21,'Presidente Médici',NULL),(4384,21,'Primavera de Rondônia',NULL),(4385,21,'Rio Crespo',NULL),(4386,21,'Rolim de Moura',NULL),(4387,21,'Santa Luzia d`Oeste',NULL),(4388,21,'São Felipe d`Oeste',NULL),(4389,21,'São Francisco do Guaporé',NULL),(4390,21,'São Miguel do Guaporé',NULL),(4391,21,'Seringueiras',NULL),(4392,21,'Teixeirópolis',NULL),(4393,21,'Theobroma',NULL),(4394,21,'Urupá',NULL),(4395,21,'Vale do Anari',NULL),(4396,21,'Vale do Paraíso',NULL),(4397,21,'Vilhena',NULL),(4398,22,'Alto Alegre',NULL),(4399,22,'Amajari',NULL),(4400,22,'Boa Vista',NULL),(4401,22,'Bonfim',NULL),(4402,22,'Cantá',NULL),(4403,22,'Caracaraí',NULL),(4404,22,'Caroebe',NULL),(4405,22,'Iracema',NULL),(4406,22,'Mucajaí',NULL),(4407,22,'Normandia',NULL),(4408,22,'Pacaraima',NULL),(4409,22,'Rorainópolis',NULL),(4410,22,'São João da Baliza',NULL),(4411,22,'São Luiz',NULL),(4412,22,'Uiramutã',NULL),(4413,24,'Abdon Batista',NULL),(4414,24,'Abelardo Luz',NULL),(4415,24,'Agrolândia',NULL),(4416,24,'Agronômica',NULL),(4417,24,'Água Doce',NULL),(4418,24,'Águas de Chapecó',NULL),(4419,24,'Águas Frias',NULL),(4420,24,'Águas Mornas',NULL),(4421,24,'Alfredo Wagner',NULL),(4422,24,'Alto Bela Vista',NULL),(4423,24,'Anchieta',NULL),(4424,24,'Angelina',NULL),(4425,24,'Anita Garibaldi',NULL),(4426,24,'Anitápolis',NULL),(4427,24,'Antônio Carlos',NULL),(4428,24,'Apiúna',NULL),(4429,24,'Arabutã',NULL),(4430,24,'Araquari',NULL),(4431,24,'Araranguá',NULL),(4432,24,'Armazém',NULL),(4433,24,'Arroio Trinta',NULL),(4434,24,'Arvoredo',NULL),(4435,24,'Ascurra',NULL),(4436,24,'Atalanta',NULL),(4437,24,'Aurora',NULL),(4438,24,'Balneário Arroio do Silva',NULL),(4439,24,'Balneário Barra do Sul',NULL),(4440,24,'Balneário Camboriú',NULL),(4441,24,'Balneário Gaivota',NULL),(4442,24,'Bandeirante',NULL),(4443,24,'Barra Bonita',NULL),(4444,24,'Barra Velha',NULL),(4445,24,'Bela Vista do Toldo',NULL),(4446,24,'Belmonte',NULL),(4447,24,'Benedito Novo',NULL),(4448,24,'Biguaçu',NULL),(4449,24,'Blumenau',NULL),(4450,24,'Bocaina do Sul',NULL),(4451,24,'Bom Jardim da Serra',NULL),(4452,24,'Bom Jesus',NULL),(4453,24,'Bom Jesus do Oeste',NULL),(4454,24,'Bom Retiro',NULL),(4455,24,'Bombinhas',NULL),(4456,24,'Botuverá',NULL),(4457,24,'Braço do Norte',NULL),(4458,24,'Braço do Trombudo',NULL),(4459,24,'Brunópolis',NULL),(4460,24,'Brusque',NULL),(4461,24,'Caçador',NULL),(4462,24,'Caibi',NULL),(4463,24,'Calmon',NULL),(4464,24,'Camboriú',NULL),(4465,24,'Campo Alegre',NULL),(4466,24,'Campo Belo do Sul',NULL),(4467,24,'Campo Erê',NULL),(4468,24,'Campos Novos',NULL),(4469,24,'Canelinha',NULL),(4470,24,'Canoinhas',NULL),(4471,24,'Capão Alto',NULL),(4472,24,'Capinzal',NULL),(4473,24,'Capivari de Baixo',NULL),(4474,24,'Catanduvas',NULL),(4475,24,'Caxambu do Sul',NULL),(4476,24,'Celso Ramos',NULL),(4477,24,'Cerro Negro',NULL),(4478,24,'Chapadão do Lageado',NULL),(4479,24,'Chapecó',NULL),(4480,24,'Cocal do Sul',NULL),(4481,24,'Concórdia',NULL),(4482,24,'Cordilheira Alta',NULL),(4483,24,'Coronel Freitas',NULL),(4484,24,'Coronel Martins',NULL),(4485,24,'Correia Pinto',NULL),(4486,24,'Corupá',NULL),(4487,24,'Criciúma',NULL),(4488,24,'Cunha Porã',NULL),(4489,24,'Cunhataí',NULL),(4490,24,'Curitibanos',NULL),(4491,24,'Descanso',NULL),(4492,24,'Dionísio Cerqueira',NULL),(4493,24,'Dona Emma',NULL),(4494,24,'Doutor Pedrinho',NULL),(4495,24,'Entre Rios',NULL),(4496,24,'Ermo',NULL),(4497,24,'Erval Velho',NULL),(4498,24,'Faxinal dos Guedes',NULL),(4499,24,'Flor do Sertão',NULL),(4500,24,'Florianópolis',NULL),(4501,24,'Formosa do Sul',NULL),(4502,24,'Forquilhinha',NULL),(4503,24,'Fraiburgo',NULL),(4504,24,'Frei Rogério',NULL),(4505,24,'Galvão',NULL),(4506,24,'Garopaba',NULL),(4507,24,'Garuva',NULL),(4508,24,'Gaspar',NULL),(4509,24,'Governador Celso Ramos',NULL),(4510,24,'Grão Pará',NULL),(4511,24,'Gravatal',NULL),(4512,24,'Guabiruba',NULL),(4513,24,'Guaraciaba',NULL),(4514,24,'Guaramirim',NULL),(4515,24,'Guarujá do Sul',NULL),(4516,24,'Guatambú',NULL),(4517,24,'Herval d`Oeste',NULL),(4518,24,'Ibiam',NULL),(4519,24,'Ibicaré',NULL),(4520,24,'Ibirama',NULL),(4521,24,'Içara',NULL),(4522,24,'Ilhota',NULL),(4523,24,'Imaruí',NULL),(4524,24,'Imbituba',NULL),(4525,24,'Imbuia',NULL),(4526,24,'Indaial',NULL),(4527,24,'Iomerê',NULL),(4528,24,'Ipira',NULL),(4529,24,'Iporã do Oeste',NULL),(4530,24,'Ipuaçu',NULL),(4531,24,'Ipumirim',NULL),(4532,24,'Iraceminha',NULL),(4533,24,'Irani',NULL),(4534,24,'Irati',NULL),(4535,24,'Irineópolis',NULL),(4536,24,'Itá',NULL),(4537,24,'Itaiópolis',NULL),(4538,24,'Itajaí',NULL),(4539,24,'Itapema',NULL),(4540,24,'Itapiranga',NULL),(4541,24,'Itapoá',NULL),(4542,24,'Ituporanga',NULL),(4543,24,'Jaborá',NULL),(4544,24,'Jacinto Machado',NULL),(4545,24,'Jaguaruna',NULL),(4546,24,'Jaraguá do Sul',NULL),(4547,24,'Jardinópolis',NULL),(4548,24,'Joaçaba',NULL),(4549,24,'Joinville',NULL),(4550,24,'José Boiteux',NULL),(4551,24,'Jupiá',NULL),(4552,24,'Lacerdópolis',NULL),(4553,24,'Lages',NULL),(4554,24,'Laguna',NULL),(4555,24,'Lajeado Grande',NULL),(4556,24,'Laurentino',NULL),(4557,24,'Lauro Muller',NULL),(4558,24,'Lebon Régis',NULL),(4559,24,'Leoberto Leal',NULL),(4560,24,'Lindóia do Sul',NULL),(4561,24,'Lontras',NULL),(4562,24,'Luiz Alves',NULL),(4563,24,'Luzerna',NULL),(4564,24,'Macieira',NULL),(4565,24,'Mafra',NULL),(4566,24,'Major Gercino',NULL),(4567,24,'Major Vieira',NULL),(4568,24,'Maracajá',NULL),(4569,24,'Maravilha',NULL),(4570,24,'Marema',NULL),(4571,24,'Massaranduba',NULL),(4572,24,'Matos Costa',NULL),(4573,24,'Meleiro',NULL),(4574,24,'Mirim Doce',NULL),(4575,24,'Modelo',NULL),(4576,24,'Mondaí',NULL),(4577,24,'Monte Carlo',NULL),(4578,24,'Monte Castelo',NULL),(4579,24,'Morro da Fumaça',NULL),(4580,24,'Morro Grande',NULL),(4581,24,'Navegantes',NULL),(4582,24,'Nova Erechim',NULL),(4583,24,'Nova Itaberaba',NULL),(4584,24,'Nova Trento',NULL),(4585,24,'Nova Veneza',NULL),(4586,24,'Novo Horizonte',NULL),(4587,24,'Orleans',NULL),(4588,24,'Otacílio Costa',NULL),(4589,24,'Ouro',NULL),(4590,24,'Ouro Verde',NULL),(4591,24,'Paial',NULL),(4592,24,'Painel',NULL),(4593,24,'Palhoça',NULL),(4594,24,'Palma Sola',NULL),(4595,24,'Palmeira',NULL),(4596,24,'Palmitos',NULL),(4597,24,'Papanduva',NULL),(4598,24,'Paraíso',NULL),(4599,24,'Passo de Torres',NULL),(4600,24,'Passos Maia',NULL),(4601,24,'Paulo Lopes',NULL),(4602,24,'Pedras Grandes',NULL),(4603,24,'Penha',NULL),(4604,24,'Peritiba',NULL),(4605,24,'Petrolândia',NULL),(4606,24,'Piçarras',NULL),(4607,24,'Pinhalzinho',NULL),(4608,24,'Pinheiro Preto',NULL),(4609,24,'Piratuba',NULL),(4610,24,'Planalto Alegre',NULL),(4611,24,'Pomerode',NULL),(4612,24,'Ponte Alta',NULL),(4613,24,'Ponte Alta do Norte',NULL),(4614,24,'Ponte Serrada',NULL),(4615,24,'Porto Belo',NULL),(4616,24,'Porto União',NULL),(4617,24,'Pouso Redondo',NULL),(4618,24,'Praia Grande',NULL),(4619,24,'Presidente Castelo Branco',NULL),(4620,24,'Presidente Getúlio',NULL),(4621,24,'Presidente Nereu',NULL),(4622,24,'Princesa',NULL),(4623,24,'Quilombo',NULL),(4624,24,'Rancho Queimado',NULL),(4625,24,'Rio das Antas',NULL),(4626,24,'Rio do Campo',NULL),(4627,24,'Rio do Oeste',NULL),(4628,24,'Rio do Sul',NULL),(4629,24,'Rio dos Cedros',NULL),(4630,24,'Rio Fortuna',NULL),(4631,24,'Rio Negrinho',NULL),(4632,24,'Rio Rufino',NULL),(4633,24,'Riqueza',NULL),(4634,24,'Rodeio',NULL),(4635,24,'Romelândia',NULL),(4636,24,'Salete',NULL),(4637,24,'Saltinho',NULL),(4638,24,'Salto Veloso',NULL),(4639,24,'Sangão',NULL),(4640,24,'Santa Cecília',NULL),(4641,24,'Santa Helena',NULL),(4642,24,'Santa Rosa de Lima',NULL),(4643,24,'Santa Rosa do Sul',NULL),(4644,24,'Santa Terezinha',NULL),(4645,24,'Santa Terezinha do Progresso',NULL),(4646,24,'Santiago do Sul',NULL),(4647,24,'Santo Amaro da Imperatriz',NULL),(4648,24,'São Bento do Sul',NULL),(4649,24,'São Bernardino',NULL),(4650,24,'São Bonifácio',NULL),(4651,24,'São Carlos',NULL),(4652,24,'São Cristovão do Sul',NULL),(4653,24,'São Domingos',NULL),(4654,24,'São Francisco do Sul',NULL),(4655,24,'São João Batista',NULL),(4656,24,'São João do Itaperiú',NULL),(4657,24,'São João do Oeste',NULL),(4658,24,'São João do Sul',NULL),(4659,24,'São Joaquim',NULL),(4660,24,'São José',NULL),(4661,24,'São José do Cedro',NULL),(4662,24,'São José do Cerrito',NULL),(4663,24,'São Lourenço do Oeste',NULL),(4664,24,'São Ludgero',NULL),(4665,24,'São Martinho',NULL),(4666,24,'São Miguel da Boa Vista',NULL),(4667,24,'São Miguel do Oeste',NULL),(4668,24,'São Pedro de Alcântara',NULL),(4669,24,'Saudades',NULL),(4670,24,'Schroeder',NULL),(4671,24,'Seara',NULL),(4672,24,'Serra Alta',NULL),(4673,24,'Siderópolis',NULL),(4674,24,'Sombrio',NULL),(4675,24,'Sul Brasil',NULL),(4676,24,'Taió',NULL),(4677,24,'Tangará',NULL),(4678,24,'Tigrinhos',NULL),(4679,24,'Tijucas',NULL),(4680,24,'Timbé do Sul',NULL),(4681,24,'Timbó',NULL),(4682,24,'Timbó Grande',NULL),(4683,24,'Três Barras',NULL),(4684,24,'Treviso',NULL),(4685,24,'Treze de Maio',NULL),(4686,24,'Treze Tílias',NULL),(4687,24,'Trombudo Central',NULL),(4688,24,'Tubarão',NULL),(4689,24,'Tunápolis',NULL),(4690,24,'Turvo',NULL),(4691,24,'União do Oeste',NULL),(4692,24,'Urubici',NULL),(4693,24,'Urupema',NULL),(4694,24,'Urussanga',NULL),(4695,24,'Vargeão',NULL),(4696,24,'Vargem',NULL),(4697,24,'Vargem Bonita',NULL),(4698,24,'Vidal Ramos',NULL),(4699,24,'Videira',NULL),(4700,24,'Vitor Meireles',NULL),(4701,24,'Witmarsum',NULL),(4702,24,'Xanxerê',NULL),(4703,24,'Xavantina',NULL),(4704,24,'Xaxim',NULL),(4705,24,'Zortéa',NULL),(4706,26,'Adamantina',NULL),(4707,26,'Adolfo',NULL),(4708,26,'Aguaí',NULL),(4709,26,'Águas da Prata',NULL),(4710,26,'Águas de Lindóia',NULL),(4711,26,'Águas de Santa Bárbara',NULL),(4712,26,'Águas de São Pedro',NULL),(4713,26,'Agudos',NULL),(4714,26,'Alambari',NULL),(4715,26,'Alfredo Marcondes',NULL),(4716,26,'Altair',NULL),(4717,26,'Altinópolis',NULL),(4718,26,'Alto Alegre',NULL),(4719,26,'Alumínio',NULL),(4720,26,'Álvares Florence',NULL),(4721,26,'Álvares Machado',NULL),(4722,26,'Álvaro de Carvalho',NULL),(4723,26,'Alvinlândia',NULL),(4724,26,'Americana',NULL),(4725,26,'Américo Brasiliense',NULL),(4726,26,'Américo de Campos',NULL),(4727,26,'Amparo',NULL),(4728,26,'Analândia',NULL),(4729,26,'Andradina',NULL),(4730,26,'Angatuba',NULL),(4731,26,'Anhembi',NULL),(4732,26,'Anhumas',NULL),(4733,26,'Aparecida',NULL),(4734,26,'Aparecida d`Oeste',NULL),(4735,26,'Apiaí',NULL),(4736,26,'Araçariguama',NULL),(4737,26,'Araçatuba',NULL),(4738,26,'Araçoiaba da Serra',NULL),(4739,26,'Aramina',NULL),(4740,26,'Arandu',NULL),(4741,26,'Arapeí',NULL),(4742,26,'Araraquara',NULL),(4743,26,'Araras',NULL),(4744,26,'Arco-Íris',NULL),(4745,26,'Arealva',NULL),(4746,26,'Areias',NULL),(4747,26,'Areiópolis',NULL),(4748,26,'Ariranha',NULL),(4749,26,'Artur Nogueira',NULL),(4750,26,'Arujá',NULL),(4751,26,'Aspásia',NULL),(4752,26,'Assis',NULL),(4753,26,'Atibaia',NULL),(4754,26,'Auriflama',NULL),(4755,26,'Avaí',NULL),(4756,26,'Avanhandava',NULL),(4757,26,'Avaré',NULL),(4758,26,'Bady Bassitt',NULL),(4759,26,'Balbinos',NULL),(4760,26,'Bálsamo',NULL),(4761,26,'Bananal',NULL),(4762,26,'Barão de Antonina',NULL),(4763,26,'Barbosa',NULL),(4764,26,'Bariri',NULL),(4765,26,'Barra Bonita',NULL),(4766,26,'Barra do Chapéu',NULL),(4767,26,'Barra do Turvo',NULL),(4768,26,'Barretos',NULL),(4769,26,'Barrinha',NULL),(4770,26,'Barueri',NULL),(4771,26,'Bastos',NULL),(4772,26,'Batatais',NULL),(4773,26,'Bauru',NULL),(4774,26,'Bebedouro',NULL),(4775,26,'Bento de Abreu',NULL),(4776,26,'Bernardino de Campos',NULL),(4777,26,'Bertioga',NULL),(4778,26,'Bilac',NULL),(4779,26,'Birigui',NULL),(4780,26,'Biritiba-Mirim',NULL),(4781,26,'Boa Esperança do Sul',NULL),(4782,26,'Bocaina',NULL),(4783,26,'Bofete',NULL),(4784,26,'Boituva',NULL),(4785,26,'Bom Jesus dos Perdões',NULL),(4786,26,'Bom Sucesso de Itararé',NULL),(4787,26,'Borá',NULL),(4788,26,'Boracéia',NULL),(4789,26,'Borborema',NULL),(4790,26,'Borebi',NULL),(4791,26,'Botucatu',NULL),(4792,26,'Bragança Paulista',NULL),(4793,26,'Braúna',NULL),(4794,26,'Brejo Alegre',NULL),(4795,26,'Brodowski',NULL),(4796,26,'Brotas',NULL),(4797,26,'Buri',NULL),(4798,26,'Buritama',NULL),(4799,26,'Buritizal',NULL),(4800,26,'Cabrália Paulista',NULL),(4801,26,'Cabreúva',NULL),(4802,26,'Caçapava',NULL),(4803,26,'Cachoeira Paulista',NULL),(4804,26,'Caconde',NULL),(4805,26,'Cafelândia',NULL),(4806,26,'Caiabu',NULL),(4807,26,'Caieiras',NULL),(4808,26,'Caiuá',NULL),(4809,26,'Cajamar',NULL),(4810,26,'Cajati',NULL),(4811,26,'Cajobi',NULL),(4812,26,'Cajuru',NULL),(4813,26,'Campina do Monte Alegre',NULL),(4814,26,'Campinas',NULL),(4815,26,'Campo Limpo Paulista',NULL),(4816,26,'Campos do Jordão',NULL),(4817,26,'Campos Novos Paulista',NULL),(4818,26,'Cananéia',NULL),(4819,26,'Canas',NULL),(4820,26,'Cândido Mota',NULL),(4821,26,'Cândido Rodrigues',NULL),(4822,26,'Canitar',NULL),(4823,26,'Capão Bonito',NULL),(4824,26,'Capela do Alto',NULL),(4825,26,'Capivari',NULL),(4826,26,'Caraguatatuba',NULL),(4827,26,'Carapicuíba',NULL),(4828,26,'Cardoso',NULL),(4829,26,'Casa Branca',NULL),(4830,26,'Cássia dos Coqueiros',NULL),(4831,26,'Castilho',NULL),(4832,26,'Catanduva',NULL),(4833,26,'Catiguá',NULL),(4834,26,'Cedral',NULL),(4835,26,'Cerqueira César',NULL),(4836,26,'Cerquilho',NULL),(4837,26,'Cesário Lange',NULL),(4838,26,'Charqueada',NULL),(4839,26,'Chavantes',NULL),(4840,26,'Clementina',NULL),(4841,26,'Colina',NULL),(4842,26,'Colômbia',NULL),(4843,26,'Conchal',NULL),(4844,26,'Conchas',NULL),(4845,26,'Cordeirópolis',NULL),(4846,26,'Coroados',NULL),(4847,26,'Coronel Macedo',NULL),(4848,26,'Corumbataí',NULL),(4849,26,'Cosmópolis',NULL),(4850,26,'Cosmorama',NULL),(4851,26,'Cotia',NULL),(4852,26,'Cravinhos',NULL),(4853,26,'Cristais Paulista',NULL),(4854,26,'Cruzália',NULL),(4855,26,'Cruzeiro',NULL),(4856,26,'Cubatão',NULL),(4857,26,'Cunha',NULL),(4858,26,'Descalvado',NULL),(4859,26,'Diadema',NULL),(4860,26,'Dirce Reis',NULL),(4861,26,'Divinolândia',NULL),(4862,26,'Dobrada',NULL),(4863,26,'Dois Córregos',NULL),(4864,26,'Dolcinópolis',NULL),(4865,26,'Dourado',NULL),(4866,26,'Dracena',NULL),(4867,26,'Duartina',NULL),(4868,26,'Dumont',NULL),(4869,26,'Echaporã',NULL),(4870,26,'Eldorado',NULL),(4871,26,'Elias Fausto',NULL),(4872,26,'Elisiário',NULL),(4873,26,'Embaúba',NULL),(4874,26,'Embu',NULL),(4875,26,'Embu-Guaçu',NULL),(4876,26,'Emilianópolis',NULL),(4877,26,'Engenheiro Coelho',NULL),(4878,26,'Espírito Santo do Pinhal',NULL),(4879,26,'Espírito Santo do Turvo',NULL),(4880,26,'Estiva Gerbi',NULL),(4881,26,'Estrela d`Oeste',NULL),(4882,26,'Estrela do Norte',NULL),(4883,26,'Euclides da Cunha Paulista',NULL),(4884,26,'Fartura',NULL),(4885,26,'Fernando Prestes',NULL),(4886,26,'Fernandópolis',NULL),(4887,26,'Fernão',NULL),(4888,26,'Ferraz de Vasconcelos',NULL),(4889,26,'Flora Rica',NULL),(4890,26,'Floreal',NULL),(4891,26,'Flórida Paulista',NULL),(4892,26,'Florínia',NULL),(4893,26,'Franca',NULL),(4894,26,'Francisco Morato',NULL),(4895,26,'Franco da Rocha',NULL),(4896,26,'Gabriel Monteiro',NULL),(4897,26,'Gália',NULL),(4898,26,'Garça',NULL),(4899,26,'Gastão Vidigal',NULL),(4900,26,'Gavião Peixoto',NULL),(4901,26,'General Salgado',NULL),(4902,26,'Getulina',NULL),(4903,26,'Glicério',NULL),(4904,26,'Guaiçara',NULL),(4905,26,'Guaimbê',NULL),(4906,26,'Guaíra',NULL),(4907,26,'Guapiaçu',NULL),(4908,26,'Guapiara',NULL),(4909,26,'Guará',NULL),(4910,26,'Guaraçaí',NULL),(4911,26,'Guaraci',NULL),(4912,26,'Guarani d`Oeste',NULL),(4913,26,'Guarantã',NULL),(4914,26,'Guararapes',NULL),(4915,26,'Guararema',NULL),(4916,26,'Guaratinguetá',NULL),(4917,26,'Guareí',NULL),(4918,26,'Guariba',NULL),(4919,26,'Guarujá',NULL),(4920,26,'Guarulhos',NULL),(4921,26,'Guatapará',NULL),(4922,26,'Guzolândia',NULL),(4923,26,'Herculândia',NULL),(4924,26,'Holambra',NULL),(4925,26,'Hortolândia',NULL),(4926,26,'Iacanga',NULL),(4927,26,'Iacri',NULL),(4928,26,'Iaras',NULL),(4929,26,'Ibaté',NULL),(4930,26,'Ibirá',NULL),(4931,26,'Ibirarema',NULL),(4932,26,'Ibitinga',NULL),(4933,26,'Ibiúna',NULL),(4934,26,'Icém',NULL),(4935,26,'Iepê',NULL),(4936,26,'Igaraçu do Tietê',NULL),(4937,26,'Igarapava',NULL),(4938,26,'Igaratá',NULL),(4939,26,'Iguape',NULL),(4940,26,'Ilha Comprida',NULL),(4941,26,'Ilha Solteira',NULL),(4942,26,'Ilhabela',NULL),(4943,26,'Indaiatuba',NULL),(4944,26,'Indiana',NULL),(4945,26,'Indiaporã',NULL),(4946,26,'Inúbia Paulista',NULL),(4947,26,'Ipaussu',NULL),(4948,26,'Iperó',NULL),(4949,26,'Ipeúna',NULL),(4950,26,'Ipiguá',NULL),(4951,26,'Iporanga',NULL),(4952,26,'Ipuã',NULL),(4953,26,'Iracemápolis',NULL),(4954,26,'Irapuã',NULL),(4955,26,'Irapuru',NULL),(4956,26,'Itaberá',NULL),(4957,26,'Itaí',NULL),(4958,26,'Itajobi',NULL),(4959,26,'Itaju',NULL),(4960,26,'Itanhaém',NULL),(4961,26,'Itaóca',NULL),(4962,26,'Itapecerica da Serra',NULL),(4963,26,'Itapetininga',NULL),(4964,26,'Itapeva',NULL),(4965,26,'Itapevi',NULL),(4966,26,'Itapira',NULL),(4967,26,'Itapirapuã Paulista',NULL),(4968,26,'Itápolis',NULL),(4969,26,'Itaporanga',NULL),(4970,26,'Itapuí',NULL),(4971,26,'Itapura',NULL),(4972,26,'Itaquaquecetuba',NULL),(4973,26,'Itararé',NULL),(4974,26,'Itariri',NULL),(4975,26,'Itatiba',NULL),(4976,26,'Itatinga',NULL),(4977,26,'Itirapina',NULL),(4978,26,'Itirapuã',NULL),(4979,26,'Itobi',NULL),(4980,26,'Itu',NULL),(4981,26,'Itupeva',NULL),(4982,26,'Ituverava',NULL),(4983,26,'Jaborandi',NULL),(4984,26,'Jaboticabal',NULL),(4985,26,'Jacareí',NULL),(4986,26,'Jaci',NULL),(4987,26,'Jacupiranga',NULL),(4988,26,'Jaguariúna',NULL),(4989,26,'Jales',NULL),(4990,26,'Jambeiro',NULL),(4991,26,'Jandira',NULL),(4992,26,'Jardinópolis',NULL),(4993,26,'Jarinu',NULL),(4994,26,'Jaú',NULL),(4995,26,'Jeriquara',NULL),(4996,26,'Joanópolis',NULL),(4997,26,'João Ramalho',NULL),(4998,26,'José Bonifácio',NULL),(4999,26,'Júlio Mesquita',NULL),(5000,26,'Jumirim',NULL),(5001,26,'Jundiaí',NULL),(5002,26,'Junqueirópolis',NULL),(5003,26,'Juquiá',NULL),(5004,26,'Juquitiba',NULL),(5005,26,'Lagoinha',NULL),(5006,26,'Laranjal Paulista',NULL),(5007,26,'Lavínia',NULL),(5008,26,'Lavrinhas',NULL),(5009,26,'Leme',NULL),(5010,26,'Lençóis Paulista',NULL),(5011,26,'Limeira',NULL),(5012,26,'Lindóia',NULL),(5013,26,'Lins',NULL),(5014,26,'Lorena',NULL),(5015,26,'Lourdes',NULL),(5016,26,'Louveira',NULL),(5017,26,'Lucélia',NULL),(5018,26,'Lucianópolis',NULL),(5019,26,'Luís Antônio',NULL),(5020,26,'Luiziânia',NULL),(5021,26,'Lupércio',NULL),(5022,26,'Lutécia',NULL),(5023,26,'Macatuba',NULL),(5024,26,'Macaubal',NULL),(5025,26,'Macedônia',NULL),(5026,26,'Magda',NULL),(5027,26,'Mairinque',NULL),(5028,26,'Mairiporã',NULL),(5029,26,'Manduri',NULL),(5030,26,'Marabá Paulista',NULL),(5031,26,'Maracaí',NULL),(5032,26,'Marapoama',NULL),(5033,26,'Mariápolis',NULL),(5034,26,'Marília',NULL),(5035,26,'Marinópolis',NULL),(5036,26,'Martinópolis',NULL),(5037,26,'Matão',NULL),(5038,26,'Mauá',NULL),(5039,26,'Mendonça',NULL),(5040,26,'Meridiano',NULL),(5041,26,'Mesópolis',NULL),(5042,26,'Miguelópolis',NULL),(5043,26,'Mineiros do Tietê',NULL),(5044,26,'Mira Estrela',NULL),(5045,26,'Miracatu',NULL),(5046,26,'Mirandópolis',NULL),(5047,26,'Mirante do Paranapanema',NULL),(5048,26,'Mirassol',NULL),(5049,26,'Mirassolândia',NULL),(5050,26,'Mococa',NULL),(5051,26,'Mogi das Cruzes',NULL),(5052,26,'Mogi Guaçu',NULL),(5053,26,'Moji Mirim',NULL),(5054,26,'Mombuca',NULL),(5055,26,'Monções',NULL),(5056,26,'Mongaguá',NULL),(5057,26,'Monte Alegre do Sul',NULL),(5058,26,'Monte Alto',NULL),(5059,26,'Monte Aprazível',NULL),(5060,26,'Monte Azul Paulista',NULL),(5061,26,'Monte Castelo',NULL),(5062,26,'Monte Mor',NULL),(5063,26,'Monteiro Lobato',NULL),(5064,26,'Morro Agudo',NULL),(5065,26,'Morungaba',NULL),(5066,26,'Motuca',NULL),(5067,26,'Murutinga do Sul',NULL),(5068,26,'Nantes',NULL),(5069,26,'Narandiba',NULL),(5070,26,'Natividade da Serra',NULL),(5071,26,'Nazaré Paulista',NULL),(5072,26,'Neves Paulista',NULL),(5073,26,'Nhandeara',NULL),(5074,26,'Nipoã',NULL),(5075,26,'Nova Aliança',NULL),(5076,26,'Nova Campina',NULL),(5077,26,'Nova Canaã Paulista',NULL),(5078,26,'Nova Castilho',NULL),(5079,26,'Nova Europa',NULL),(5080,26,'Nova Granada',NULL),(5081,26,'Nova Guataporanga',NULL),(5082,26,'Nova Independência',NULL),(5083,26,'Nova Luzitânia',NULL),(5084,26,'Nova Odessa',NULL),(5085,26,'Novais',NULL),(5086,26,'Novo Horizonte',NULL),(5087,26,'Nuporanga',NULL),(5088,26,'Ocauçu',NULL),(5089,26,'Óleo',NULL),(5090,26,'Olímpia',NULL),(5091,26,'Onda Verde',NULL),(5092,26,'Oriente',NULL),(5093,26,'Orindiúva',NULL),(5094,26,'Orlândia',NULL),(5095,26,'Osasco',NULL),(5096,26,'Oscar Bressane',NULL),(5097,26,'Osvaldo Cruz',NULL),(5098,26,'Ourinhos',NULL),(5099,26,'Ouro Verde',NULL),(5100,26,'Ouroeste',NULL),(5101,26,'Pacaembu',NULL),(5102,26,'Palestina',NULL),(5103,26,'Palmares Paulista',NULL),(5104,26,'Palmeira d`Oeste',NULL),(5105,26,'Palmital',NULL),(5106,26,'Panorama',NULL),(5107,26,'Paraguaçu Paulista',NULL),(5108,26,'Paraibuna',NULL),(5109,26,'Paraíso',NULL),(5110,26,'Paranapanema',NULL),(5111,26,'Paranapuã',NULL),(5112,26,'Parapuã',NULL),(5113,26,'Pardinho',NULL),(5114,26,'Pariquera-Açu',NULL),(5115,26,'Parisi',NULL),(5116,26,'Patrocínio Paulista',NULL),(5117,26,'Paulicéia',NULL),(5118,26,'Paulínia',NULL),(5119,26,'Paulistânia',NULL),(5120,26,'Paulo de Faria',NULL),(5121,26,'Pederneiras',NULL),(5122,26,'Pedra Bela',NULL),(5123,26,'Pedranópolis',NULL),(5124,26,'Pedregulho',NULL),(5125,26,'Pedreira',NULL),(5126,26,'Pedrinhas Paulista',NULL),(5127,26,'Pedro de Toledo',NULL),(5128,26,'Penápolis',NULL),(5129,26,'Pereira Barreto',NULL),(5130,26,'Pereiras',NULL),(5131,26,'Peruíbe',NULL),(5132,26,'Piacatu',NULL),(5133,26,'Piedade',NULL),(5134,26,'Pilar do Sul',NULL),(5135,26,'Pindamonhangaba',NULL),(5136,26,'Pindorama',NULL),(5137,26,'Pinhalzinho',NULL),(5138,26,'Piquerobi',NULL),(5139,26,'Piquete',NULL),(5140,26,'Piracaia',NULL),(5141,26,'Piracicaba',NULL),(5142,26,'Piraju',NULL),(5143,26,'Pirajuí',NULL),(5144,26,'Pirangi',NULL),(5145,26,'Pirapora do Bom Jesus',NULL),(5146,26,'Pirapozinho',NULL),(5147,26,'Pirassununga',NULL),(5148,26,'Piratininga',NULL),(5149,26,'Pitangueiras',NULL),(5150,26,'Planalto',NULL),(5151,26,'Platina',NULL),(5152,26,'Poá',NULL),(5153,26,'Poloni',NULL),(5154,26,'Pompéia',NULL),(5155,26,'Pongaí',NULL),(5156,26,'Pontal',NULL),(5157,26,'Pontalinda',NULL),(5158,26,'Pontes Gestal',NULL),(5159,26,'Populina',NULL),(5160,26,'Porangaba',NULL),(5161,26,'Porto Feliz',NULL),(5162,26,'Porto Ferreira',NULL),(5163,26,'Potim',NULL),(5164,26,'Potirendaba',NULL),(5165,26,'Pracinha',NULL),(5166,26,'Pradópolis',NULL),(5167,26,'Praia Grande',NULL),(5168,26,'Pratânia',NULL),(5169,26,'Presidente Alves',NULL),(5170,26,'Presidente Bernardes',NULL),(5171,26,'Presidente Epitácio',NULL),(5172,26,'Presidente Prudente',NULL),(5173,26,'Presidente Venceslau',NULL),(5174,26,'Promissão',NULL),(5175,26,'Quadra',NULL),(5176,26,'Quatá',NULL),(5177,26,'Queiroz',NULL),(5178,26,'Queluz',NULL),(5179,26,'Quintana',NULL),(5180,26,'Rafard',NULL),(5181,26,'Rancharia',NULL),(5182,26,'Redenção da Serra',NULL),(5183,26,'Regente Feijó',NULL),(5184,26,'Reginópolis',NULL),(5185,26,'Registro',NULL),(5186,26,'Restinga',NULL),(5187,26,'Ribeira',NULL),(5188,26,'Ribeirão Bonito',NULL),(5189,26,'Ribeirão Branco',NULL),(5190,26,'Ribeirão Corrente',NULL),(5191,26,'Ribeirão do Sul',NULL),(5192,26,'Ribeirão dos Índios',NULL),(5193,26,'Ribeirão Grande',NULL),(5194,26,'Ribeirão Pires',NULL),(5195,26,'Ribeirão Preto',NULL),(5196,26,'Rifaina',NULL),(5197,26,'Rincão',NULL),(5198,26,'Rinópolis',NULL),(5199,26,'Rio Claro',NULL),(5200,26,'Rio das Pedras',NULL),(5201,26,'Rio Grande da Serra',NULL),(5202,26,'Riolândia',NULL),(5203,26,'Riversul',NULL),(5204,26,'Rosana',NULL),(5205,26,'Roseira',NULL),(5206,26,'Rubiácea',NULL),(5207,26,'Rubinéia',NULL),(5208,26,'Sabino',NULL),(5209,26,'Sagres',NULL),(5210,26,'Sales',NULL),(5211,26,'Sales Oliveira',NULL),(5212,26,'Salesópolis',NULL),(5213,26,'Salmourão',NULL),(5214,26,'Saltinho',NULL),(5215,26,'Salto',NULL),(5216,26,'Salto de Pirapora',NULL),(5217,26,'Salto Grande',NULL),(5218,26,'Sandovalina',NULL),(5219,26,'Santa Adélia',NULL),(5220,26,'Santa Albertina',NULL),(5221,26,'Santa Bárbara d`Oeste',NULL),(5222,26,'Santa Branca',NULL),(5223,26,'Santa Clara d`Oeste',NULL),(5224,26,'Santa Cruz da Conceição',NULL),(5225,26,'Santa Cruz da Esperança',NULL),(5226,26,'Santa Cruz das Palmeiras',NULL),(5227,26,'Santa Cruz do Rio Pardo',NULL),(5228,26,'Santa Ernestina',NULL),(5229,26,'Santa Fé do Sul',NULL),(5230,26,'Santa Gertrudes',NULL),(5231,26,'Santa Isabel',NULL),(5232,26,'Santa Lúcia',NULL),(5233,26,'Santa Maria da Serra',NULL),(5234,26,'Santa Mercedes',NULL),(5235,26,'Santa Rita d`Oeste',NULL),(5236,26,'Santa Rita do Passa Quatro',NULL),(5237,26,'Santa Rosa de Viterbo',NULL),(5238,26,'Santa Salete',NULL),(5239,26,'Santana da Ponte Pensa',NULL),(5240,26,'Santana de Parnaíba',NULL),(5241,26,'Santo Anastácio',NULL),(5242,26,'Santo André',NULL),(5243,26,'Santo Antônio da Alegria',NULL),(5244,26,'Santo Antônio de Posse',NULL),(5245,26,'Santo Antônio do Aracanguá',NULL),(5246,26,'Santo Antônio do Jardim',NULL),(5247,26,'Santo Antônio do Pinhal',NULL),(5248,26,'Santo Expedito',NULL),(5249,26,'Santópolis do Aguapeí',NULL),(5250,26,'Santos',NULL),(5251,26,'São Bento do Sapucaí',NULL),(5252,26,'São Bernardo do Campo',NULL),(5253,26,'São Caetano do Sul',NULL),(5254,26,'São Carlos',NULL),(5255,26,'São Francisco',NULL),(5256,26,'São João da Boa Vista',NULL),(5257,26,'São João das Duas Pontes',NULL),(5258,26,'São João de Iracema',NULL),(5259,26,'São João do Pau d`Alho',NULL),(5260,26,'São Joaquim da Barra',NULL),(5261,26,'São José da Bela Vista',NULL),(5262,26,'São José do Barreiro',NULL),(5263,26,'São José do Rio Pardo',NULL),(5264,26,'São José do Rio Preto',NULL),(5265,26,'São José dos Campos',NULL),(5266,26,'São Lourenço da Serra',NULL),(5267,26,'São Luís do Paraitinga',NULL),(5268,26,'São Manuel',NULL),(5269,26,'São Miguel Arcanjo',NULL),(5270,26,'São Paulo',NULL),(5271,26,'São Pedro',NULL),(5272,26,'São Pedro do Turvo',NULL),(5273,26,'São Roque',NULL),(5274,26,'São Sebastião',NULL),(5275,26,'São Sebastião da Grama',NULL),(5276,26,'São Simão',NULL),(5277,26,'São Vicente',NULL),(5278,26,'Sarapuí',NULL),(5279,26,'Sarutaiá',NULL),(5280,26,'Sebastianópolis do Sul',NULL),(5281,26,'Serra Azul',NULL),(5282,26,'Serra Negra',NULL),(5283,26,'Serrana',NULL),(5284,26,'Sertãozinho',NULL),(5285,26,'Sete Barras',NULL),(5286,26,'Severínia',NULL),(5287,26,'Silveiras',NULL),(5288,26,'Socorro',NULL),(5289,26,'Sorocaba',NULL),(5290,26,'Sud Mennucci',NULL),(5291,26,'Sumaré',NULL),(5292,26,'Suzanápolis',NULL),(5293,26,'Suzano',NULL),(5294,26,'Tabapuã',NULL),(5295,26,'Tabatinga',NULL),(5296,26,'Taboão da Serra',NULL),(5297,26,'Taciba',NULL),(5298,26,'Taguaí',NULL),(5299,26,'Taiaçu',NULL),(5300,26,'Taiúva',NULL),(5301,26,'Tambaú',NULL),(5302,26,'Tanabi',NULL),(5303,26,'Tapiraí',NULL),(5304,26,'Tapiratiba',NULL),(5305,26,'Taquaral',NULL),(5306,26,'Taquaritinga',NULL),(5307,26,'Taquarituba',NULL),(5308,26,'Taquarivaí',NULL),(5309,26,'Tarabai',NULL),(5310,26,'Tarumã',NULL),(5311,26,'Tatuí',NULL),(5312,26,'Taubaté',NULL),(5313,26,'Tejupá',NULL),(5314,26,'Teodoro Sampaio',NULL),(5315,26,'Terra Roxa',NULL),(5316,26,'Tietê',NULL),(5317,26,'Timburi',NULL),(5318,26,'Torre de Pedra',NULL),(5319,26,'Torrinha',NULL),(5320,26,'Trabiju',NULL),(5321,26,'Tremembé',NULL),(5322,26,'Três Fronteiras',NULL),(5323,26,'Tuiuti',NULL),(5324,26,'Tupã',NULL),(5325,26,'Tupi Paulista',NULL),(5326,26,'Turiúba',NULL),(5327,26,'Turmalina',NULL),(5328,26,'Ubarana',NULL),(5329,26,'Ubatuba',NULL),(5330,26,'Ubirajara',NULL),(5331,26,'Uchoa',NULL),(5332,26,'União Paulista',NULL),(5333,26,'Urânia',NULL),(5334,26,'Uru',NULL),(5335,26,'Urupês',NULL),(5336,26,'Valentim Gentil',NULL),(5337,26,'Valinhos',NULL),(5338,26,'Valparaíso',NULL),(5339,26,'Vargem',NULL),(5340,26,'Vargem Grande do Sul',NULL),(5341,26,'Vargem Grande Paulista',NULL),(5342,26,'Várzea Paulista',NULL),(5343,26,'Vera Cruz',NULL),(5344,26,'Vinhedo',NULL),(5345,26,'Viradouro',NULL),(5346,26,'Vista Alegre do Alto',NULL),(5347,26,'Vitória Brasil',NULL),(5348,26,'Votorantim',NULL),(5349,26,'Votuporanga',NULL),(5350,26,'Zacarias',NULL),(5351,25,'Amparo de São Francisco',NULL),(5352,25,'Aquidabã',NULL),(5353,25,'Aracaju',NULL),(5354,25,'Arauá',NULL),(5355,25,'Areia Branca',NULL),(5356,25,'Barra dos Coqueiros',NULL),(5357,25,'Boquim',NULL),(5358,25,'Brejo Grande',NULL),(5359,25,'Campo do Brito',NULL),(5360,25,'Canhoba',NULL),(5361,25,'Canindé de São Francisco',NULL),(5362,25,'Capela',NULL),(5363,25,'Carira',NULL),(5364,25,'Carmópolis',NULL),(5365,25,'Cedro de São João',NULL),(5366,25,'Cristinápolis',NULL),(5367,25,'Cumbe',NULL),(5368,25,'Divina Pastora',NULL),(5369,25,'Estância',NULL),(5370,25,'Feira Nova',NULL),(5371,25,'Frei Paulo',NULL),(5372,25,'Gararu',NULL),(5373,25,'General Maynard',NULL),(5374,25,'Gracho Cardoso',NULL),(5375,25,'Ilha das Flores',NULL),(5376,25,'Indiaroba',NULL),(5377,25,'Itabaiana',NULL),(5378,25,'Itabaianinha',NULL),(5379,25,'Itabi',NULL),(5380,25,'Itaporanga d`Ajuda',NULL),(5381,25,'Japaratuba',NULL),(5382,25,'Japoatã',NULL),(5383,25,'Lagarto',NULL),(5384,25,'Laranjeiras',NULL),(5385,25,'Macambira',NULL),(5386,25,'Malhada dos Bois',NULL),(5387,25,'Malhador',NULL),(5388,25,'Maruim',NULL),(5389,25,'Moita Bonita',NULL),(5390,25,'Monte Alegre de Sergipe',NULL),(5391,25,'Muribeca',NULL),(5392,25,'Neópolis',NULL),(5393,25,'Nossa Senhora Aparecida',NULL),(5394,25,'Nossa Senhora da Glória',NULL),(5395,25,'Nossa Senhora das Dores',NULL),(5396,25,'Nossa Senhora de Lourdes',NULL),(5397,25,'Nossa Senhora do Socorro',NULL),(5398,25,'Pacatuba',NULL),(5399,25,'Pedra Mole',NULL),(5400,25,'Pedrinhas',NULL),(5401,25,'Pinhão',NULL),(5402,25,'Pirambu',NULL),(5403,25,'Poço Redondo',NULL),(5404,25,'Poço Verde',NULL),(5405,25,'Porto da Folha',NULL),(5406,25,'Propriá',NULL),(5407,25,'Riachão do Dantas',NULL),(5408,25,'Riachuelo',NULL),(5409,25,'Ribeirópolis',NULL),(5410,25,'Rosário do Catete',NULL),(5411,25,'Salgado',NULL),(5412,25,'Santa Luzia do Itanhy',NULL),(5413,25,'Santa Rosa de Lima',NULL),(5414,25,'Santana do São Francisco',NULL),(5415,25,'Santo Amaro das Brotas',NULL),(5416,25,'São Cristóvão',NULL),(5417,25,'São Domingos',NULL),(5418,25,'São Francisco',NULL),(5419,25,'São Miguel do Aleixo',NULL),(5420,25,'Simão Dias',NULL),(5421,25,'Siriri',NULL),(5422,25,'Telha',NULL),(5423,25,'Tobias Barreto',NULL),(5424,25,'Tomar do Geru',NULL),(5425,25,'Umbaúba',NULL),(5426,27,'Abreulândia',NULL),(5427,27,'Aguiarnópolis',NULL),(5428,27,'Aliança do Tocantins',NULL),(5429,27,'Almas',NULL),(5430,27,'Alvorada',NULL),(5431,27,'Ananás',NULL),(5432,27,'Angico',NULL),(5433,27,'Aparecida do Rio Negro',NULL),(5434,27,'Aragominas',NULL),(5435,27,'Araguacema',NULL),(5436,27,'Araguaçu',NULL),(5437,27,'Araguaína',NULL),(5438,27,'Araguanã',NULL),(5439,27,'Araguatins',NULL),(5440,27,'Arapoema',NULL),(5441,27,'Arraias',NULL),(5442,27,'Augustinópolis',NULL),(5443,27,'Aurora do Tocantins',NULL),(5444,27,'Axixá do Tocantins',NULL),(5445,27,'Babaçulândia',NULL),(5446,27,'Bandeirantes do Tocantins',NULL),(5447,27,'Barra do Ouro',NULL),(5448,27,'Barrolândia',NULL),(5449,27,'Bernardo Sayão',NULL),(5450,27,'Bom Jesus do Tocantins',NULL),(5451,27,'Brasilândia do Tocantins',NULL),(5452,27,'Brejinho de Nazaré',NULL),(5453,27,'Buriti do Tocantins',NULL),(5454,27,'Cachoeirinha',NULL),(5455,27,'Campos Lindos',NULL),(5456,27,'Cariri do Tocantins',NULL),(5457,27,'Carmolândia',NULL),(5458,27,'Carrasco Bonito',NULL),(5459,27,'Caseara',NULL),(5460,27,'Centenário',NULL),(5461,27,'Chapada da Natividade',NULL),(5462,27,'Chapada de Areia',NULL),(5463,27,'Colinas do Tocantins',NULL),(5464,27,'Colméia',NULL),(5465,27,'Combinado',NULL),(5466,27,'Conceição do Tocantins',NULL),(5467,27,'Couto de Magalhães',NULL),(5468,27,'Cristalândia',NULL),(5469,27,'Crixás do Tocantins',NULL),(5470,27,'Darcinópolis',NULL),(5471,27,'Dianópolis',NULL),(5472,27,'Divinópolis do Tocantins',NULL),(5473,27,'Dois Irmãos do Tocantins',NULL),(5474,27,'Dueré',NULL),(5475,27,'Esperantina',NULL),(5476,27,'Fátima',NULL),(5477,27,'Figueirópolis',NULL),(5478,27,'Filadélfia',NULL),(5479,27,'Formoso do Araguaia',NULL),(5480,27,'Fortaleza do Tabocão',NULL),(5481,27,'Goianorte',NULL),(5482,27,'Goiatins',NULL),(5483,27,'Guaraí',NULL),(5484,27,'Gurupi',NULL),(5485,27,'Ipueiras',NULL),(5486,27,'Itacajá',NULL),(5487,27,'Itaguatins',NULL),(5488,27,'Itapiratins',NULL),(5489,27,'Itaporã do Tocantins',NULL),(5490,27,'Jaú do Tocantins',NULL),(5491,27,'Juarina',NULL),(5492,27,'Lagoa da Confusão',NULL),(5493,27,'Lagoa do Tocantins',NULL),(5494,27,'Lajeado',NULL),(5495,27,'Lavandeira',NULL),(5496,27,'Lizarda',NULL),(5497,27,'Luzinópolis',NULL),(5498,27,'Marianópolis do Tocantins',NULL),(5499,27,'Mateiros',NULL),(5500,27,'Maurilândia do Tocantins',NULL),(5501,27,'Miracema do Tocantins',NULL),(5502,27,'Miranorte',NULL),(5503,27,'Monte do Carmo',NULL),(5504,27,'Monte Santo do Tocantins',NULL),(5505,27,'Muricilândia',NULL),(5506,27,'Natividade',NULL),(5507,27,'Nazaré',NULL),(5508,27,'Nova Olinda',NULL),(5509,27,'Nova Rosalândia',NULL),(5510,27,'Novo Acordo',NULL),(5511,27,'Novo Alegre',NULL),(5512,27,'Novo Jardim',NULL),(5513,27,'Oliveira de Fátima',NULL),(5514,27,'Palmas',NULL),(5515,27,'Palmeirante',NULL),(5516,27,'Palmeiras do Tocantins',NULL),(5517,27,'Palmeirópolis',NULL),(5518,27,'Paraíso do Tocantins',NULL),(5519,27,'Paranã',NULL),(5520,27,'Pau d`Arco',NULL),(5521,27,'Pedro Afonso',NULL),(5522,27,'Peixe',NULL),(5523,27,'Pequizeiro',NULL),(5524,27,'Pindorama do Tocantins',NULL),(5525,27,'Piraquê',NULL),(5526,27,'Pium',NULL),(5527,27,'Ponte Alta do Bom Jesus',NULL),(5528,27,'Ponte Alta do Tocantins',NULL),(5529,27,'Porto Alegre do Tocantins',NULL),(5530,27,'Porto Nacional',NULL),(5531,27,'Praia Norte',NULL),(5532,27,'Presidente Kennedy',NULL),(5533,27,'Pugmil',NULL),(5534,27,'Recursolândia',NULL),(5535,27,'Riachinho',NULL),(5536,27,'Rio da Conceição',NULL),(5537,27,'Rio dos Bois',NULL),(5538,27,'Rio Sono',NULL),(5539,27,'Sampaio',NULL),(5540,27,'Sandolândia',NULL),(5541,27,'Santa Fé do Araguaia',NULL),(5542,27,'Santa Maria do Tocantins',NULL),(5543,27,'Santa Rita do Tocantins',NULL),(5544,27,'Santa Rosa do Tocantins',NULL),(5545,27,'Santa Tereza do Tocantins',NULL),(5546,27,'Santa Terezinha do Tocantins',NULL),(5547,27,'São Bento do Tocantins',NULL),(5548,27,'São Félix do Tocantins',NULL),(5549,27,'São Miguel do Tocantins',NULL),(5550,27,'São Salvador do Tocantins',NULL),(5551,27,'São Sebastião do Tocantins',NULL),(5552,27,'São Valério da Natividade',NULL),(5553,27,'Silvanópolis',NULL),(5554,27,'Sítio Novo do Tocantins',NULL),(5555,27,'Sucupira',NULL),(5556,27,'Taguatinga',NULL),(5557,27,'Taipas do Tocantins',NULL),(5558,27,'Talismã',NULL),(5559,27,'Tocantínia',NULL),(5560,27,'Tocantinópolis',NULL),(5561,27,'Tupirama',NULL),(5562,27,'Tupiratins',NULL),(5563,27,'Wanderlândia',NULL),(5564,27,'Xambioá',NULL);
/*!40000 ALTER TABLE `bsc_cidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_estado`
--

DROP TABLE IF EXISTS `bsc_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsc_pais_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` char(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bsc_estado_bsc_pais_idx` (`bsc_pais_id`),
  CONSTRAINT `fk_bsc_estado_bsc_pais` FOREIGN KEY (`bsc_pais_id`) REFERENCES `bsc_pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_estado`
--

LOCK TABLES `bsc_estado` WRITE;
/*!40000 ALTER TABLE `bsc_estado` DISABLE KEYS */;
INSERT INTO `bsc_estado` VALUES (1,1,'Acre','AC'),(2,1,'Alagoas','AL'),(3,1,'Amazonas','AM'),(4,1,'Amapá','AP'),(5,1,'Bahia','BA'),(6,1,'Ceará','CE'),(7,1,'Distrito Federal','DF'),(8,1,'Espírito Santo','ES'),(9,1,'Goiás','GO'),(10,1,'Maranhão','MA'),(11,1,'Minas Gerais','MG'),(12,1,'Mato Grosso do Sul','MS'),(13,1,'Mato Grosso','MT'),(14,1,'Pará','PA'),(15,1,'Paraíba','PB'),(16,1,'Pernambuco','PE'),(17,1,'Piauí','PI'),(18,1,'Paraná','PR'),(19,1,'Rio de Janeiro','RJ'),(20,1,'Rio Grande do Norte','RN'),(21,1,'Rondônia','RO'),(22,1,'Roraima','RR'),(23,1,'Rio Grande do Sul','RS'),(24,1,'Santa Catarina','SC'),(25,1,'Sergipe','SE'),(26,1,'São Paulo','SP'),(27,1,'Tocantins','TO');
/*!40000 ALTER TABLE `bsc_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_forma_pagamento`
--

DROP TABLE IF EXISTS `bsc_forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_forma_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_forma_pagamento`
--

LOCK TABLES `bsc_forma_pagamento` WRITE;
/*!40000 ALTER TABLE `bsc_forma_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsc_forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_pais`
--

DROP TABLE IF EXISTS `bsc_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `name` varchar(120) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_pais`
--

LOCK TABLES `bsc_pais` WRITE;
/*!40000 ALTER TABLE `bsc_pais` DISABLE KEYS */;
INSERT INTO `bsc_pais` VALUES (1,'AFEGANISTÃO','AFGHANISTAN',NULL),(2,'ACROTÍRI E DECELIA','AKROTIRI E DEKÉLIA',NULL),(3,'ÁFRICA DO SUL','SOUTH AFRICA',NULL),(4,'ALBÂNIA','ALBANIA',NULL),(5,'ALEMANHA','GERMANY',NULL),(6,'AMERICAN SAMOA','AMERICAN SAMOA',NULL),(7,'ANDORRA','ANDORRA',NULL),(8,'ANGOLA','ANGOLA',NULL),(9,'ANGUILLA','ANGUILLA',NULL),(10,'ANTÍGUA E BARBUDA','ANTIGUA AND BARBUDA',NULL),(11,'ANTILHAS NEERLANDESAS','NETHERLANDS ANTILLES',NULL),(12,'ARÁBIA SAUDITA','SAUDI ARABIA',NULL),(13,'ARGÉLIA','ALGERIA',NULL),(14,'ARGENTINA','ARGENTINA',NULL),(15,'ARMÉNIA','ARMENIA',NULL),(16,'ARUBA','ARUBA',NULL),(17,'AUSTRÁLIA','AUSTRALIA',NULL),(18,'ÁUSTRIA','AUSTRIA',NULL),(19,'AZERBAIJÃO','AZERBAIJAN',NULL),(20,'BAHAMAS','BAHAMAS, THE',NULL),(21,'BANGLADECHE','BANGLADESH',NULL),(22,'BARBADOS','BARBADOS',NULL),(23,'BARÉM','BAHRAIN',NULL),(24,'BASSAS DA ÍNDIA','BASSAS DA INDIA',NULL),(25,'BÉLGICA','BELGIUM',NULL),(26,'BELIZE','BELIZE',NULL),(27,'BENIM','BENIN',NULL),(28,'BERMUDAS','BERMUDA',NULL),(29,'BIELORRÚSSIA','BELARUS',NULL),(30,'BOLÍVIA','BOLIVIA',NULL),(31,'BÓSNIA E HERZEGOVINA','BOSNIA AND HERZEGOVINA',NULL),(32,'BOTSUANA','BOTSWANA',NULL),(33,'BRASIL','BRAZIL',NULL),(34,'BRUNEI DARUSSALAM','BRUNEI DARUSSALAM',NULL),(35,'BULGÁRIA','BULGARIA',NULL),(36,'BURQUINA FASO','BURKINA FASO',NULL),(37,'BURUNDI','BURUNDI',NULL),(38,'BUTÃO','BHUTAN',NULL),(39,'CABO VERDE','CAPE VERDE',NULL),(40,'CAMARÕES','CAMEROON',NULL),(41,'CAMBOJA','CAMBODIA',NULL),(42,'CANADÁ','CANADA',NULL),(43,'CATAR','QATAR',NULL),(44,'CAZAQUISTÃO','KAZAKHSTAN',NULL),(45,'CENTRO-AFRICANA REPÚBLICA','CENTRAL AFRICAN REPUBLIC',NULL),(46,'CHADE','CHAD',NULL),(47,'CHILE','CHILE',NULL),(48,'CHINA','CHINA',NULL),(49,'CHIPRE','CYPRUS',NULL),(50,'COLÔMBIA','COLOMBIA',NULL),(51,'COMORES','COMOROS',NULL),(52,'CONGO','CONGO',NULL),(53,'CONGO REPÚBLICA DEMOCRÁTICA','CONGO DEMOCRATIC REPUBLIC',NULL),(54,'COREIA DO NORTE','KOREA NORTH',NULL),(55,'COREIA DO SUL','KOREA SOUTH',NULL),(56,'COSTA DO MARFIM','IVORY COAST',NULL),(57,'COSTA RICA','COSTA RICA',NULL),(58,'CROÁCIA','CROATIA',NULL),(59,'CUBA','CUBA',NULL),(60,'DINAMARCA','DENMARK',NULL),(61,'DOMÍNICA','DOMINICA',NULL),(62,'EGIPTO','EGYPT',NULL),(63,'EMIRADOS ÁRABES UNIDOS','UNITED ARAB EMIRATES',NULL),(64,'EQUADOR','ECUADOR',NULL),(65,'ERITREIA','ERITREA',NULL),(66,'ESLOVÁQUIA','SLOVAKIA',NULL),(67,'ESLOVÉNIA','SLOVENIA',NULL),(68,'ESPANHA','SPAIN',NULL),(69,'ESTADOS UNIDOS','UNITED STATES',NULL),(70,'ESTÓNIA','ESTONIA',NULL),(71,'ETIÓPIA','ETHIOPIA',NULL),(72,'FAIXA DE GAZA','GAZA STRIP',NULL),(73,'FIJI','FIJI',NULL),(74,'FILIPINAS','PHILIPPINES',NULL),(75,'FINLÂNDIA','FINLAND',NULL),(76,'FRANÇA','FRANCE',NULL),(77,'GABÃO','GABON',NULL),(78,'GÂMBIA','GAMBIA',NULL),(79,'GANA','GHANA',NULL),(80,'GEÓRGIA','GEORGIA',NULL),(81,'GIBRALTAR','GIBRALTAR',NULL),(82,'GRANADA','GRENADA',NULL),(83,'GRÉCIA','GREECE',NULL),(84,'GRONELÂNDIA','GREENLAND',NULL),(85,'GUADALUPE','GUADELOUPE',NULL),(86,'GUAM','GUAM',NULL),(87,'GUATEMALA','GUATEMALA',NULL),(88,'GUERNSEY','GUERNSEY',NULL),(89,'GUIANA','GUYANA',NULL),(90,'GUIANA FRANCESA','FRENCH GUIANA',NULL),(91,'GUINÉ','GUINEA',NULL),(92,'GUINÉ EQUATORIAL','EQUATORIAL GUINEA',NULL),(93,'GUINÉ-BISSAU','GUINEA-BISSAU',NULL),(94,'HAITI','HAITI',NULL),(95,'HONDURAS','HONDURAS',NULL),(96,'HONG KONG','HONG KONG',NULL),(97,'HUNGRIA','HUNGARY',NULL),(98,'IÉMEN','YEMEN',NULL),(99,'ILHA BOUVET','BOUVET ISLAND',NULL),(100,'ILHA CHRISTMAS','CHRISTMAS ISLAND',NULL),(101,'ILHA DE CLIPPERTON','CLIPPERTON ISLAND',NULL),(102,'ILHA DE JOÃO DA NOVA','JUAN DE NOVA ISLAND',NULL),(103,'ILHA DE MAN','ISLE OF MAN',NULL),(104,'ILHA DE NAVASSA','NAVASSA ISLAND',NULL),(105,'ILHA EUROPA','EUROPA ISLAND',NULL),(106,'ILHA NORFOLK','NORFOLK ISLAND',NULL),(107,'ILHA TROMELIN','TROMELIN ISLAND',NULL),(108,'ILHAS ASHMORE E CARTIER','ASHMORE AND CARTIER ISLANDS',NULL),(109,'ILHAS CAIMAN','CAYMAN ISLANDS',NULL),(110,'ILHAS COCOS (KEELING)','COCOS (KEELING) ISLANDS',NULL),(111,'ILHAS COOK','COOK ISLANDS',NULL),(112,'ILHAS DO MAR DE CORAL','CORAL SEA ISLANDS',NULL),(113,'ILHAS FALKLANDS (ILHAS MALVINAS)','FALKLAND ISLANDS (ISLAS MALVINAS)',NULL),(114,'ILHAS FEROE','FAROE ISLANDS',NULL),(115,'ILHAS GEÓRGIA DO SUL E SANDWICH DO SUL','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS',NULL),(116,'ILHAS MARIANAS DO NORTE','NORTHERN MARIANA ISLANDS',NULL),(117,'ILHAS MARSHALL','MARSHALL ISLANDS',NULL),(118,'ILHAS PARACEL','PARACEL ISLANDS',NULL),(119,'ILHAS PITCAIRN','PITCAIRN ISLANDS',NULL),(120,'ILHAS SALOMÃO','SOLOMON ISLANDS',NULL),(121,'ILHAS SPRATLY','SPRATLY ISLANDS',NULL),(122,'ILHAS VIRGENS AMERICANAS','UNITED STATES VIRGIN ISLANDS',NULL),(123,'ILHAS VIRGENS BRITÂNICAS','BRITISH VIRGIN ISLANDS',NULL),(124,'ÍNDIA','INDIA',NULL),(125,'INDONÉSIA','INDONESIA',NULL),(126,'IRÃO','IRAN',NULL),(127,'IRAQUE','IRAQ',NULL),(128,'IRLANDA','IRELAND',NULL),(129,'ISLÂNDIA','ICELAND',NULL),(130,'ISRAEL','ISRAEL',NULL),(131,'ITÁLIA','ITALY',NULL),(132,'JAMAICA','JAMAICA',NULL),(133,'JAN MAYEN','JAN MAYEN',NULL),(134,'JAPÃO','JAPAN',NULL),(135,'JERSEY','JERSEY',NULL),(136,'JIBUTI','DJIBOUTI',NULL),(137,'JORDÂNIA','JORDAN',NULL),(138,'KIRIBATI','KIRIBATI',NULL),(139,'KOWEIT','KUWAIT',NULL),(140,'LAOS','LAOS',NULL),(141,'LESOTO','LESOTHO',NULL),(142,'LETÓNIA','LATVIA',NULL),(143,'LÍBANO','LEBANON',NULL),(144,'LIBÉRIA','LIBERIA',NULL),(145,'LÍBIA','LIBYAN ARAB JAMAHIRIYA',NULL),(146,'LISTENSTAINE','LIECHTENSTEIN',NULL),(147,'LITUÂNIA','LITHUANIA',NULL),(148,'LUXEMBURGO','LUXEMBOURG',NULL),(149,'MACAU','MACAO',NULL),(150,'MACEDÓNIA','MACEDONIA',NULL),(151,'MADAGÁSCAR','MADAGASCAR',NULL),(152,'MALÁSIA','MALAYSIA',NULL),(153,'MALAVI','MALAWI',NULL),(154,'MALDIVAS','MALDIVES',NULL),(155,'MALI','MALI',NULL),(156,'MALTA','MALTA',NULL),(157,'MARROCOS','MOROCCO',NULL),(158,'MARTINICA','MARTINIQUE',NULL),(159,'MAURÍCIA','MAURITIUS',NULL),(160,'MAURITÂNIA','MAURITANIA',NULL),(161,'MAYOTTE','MAYOTTE',NULL),(162,'MÉXICO','MEXICO',NULL),(163,'MIANMAR','MYANMAR BURMA',NULL),(164,'MICRONÉSIA','MICRONESIA',NULL),(165,'MOÇAMBIQUE','MOZAMBIQUE',NULL),(166,'MOLDÁVIA','MOLDOVA',NULL),(167,'MÓNACO','MONACO',NULL),(168,'MONGÓLIA','MONGOLIA',NULL),(169,'MONTENEGRO','MONTENEGRO',NULL),(170,'MONTSERRAT','MONTSERRAT',NULL),(171,'NAMÍBIA','NAMIBIA',NULL),(172,'NAURU','NAURU',NULL),(173,'NEPAL','NEPAL',NULL),(174,'NICARÁGUA','NICARAGUA',NULL),(175,'NÍGER','NIGER',NULL),(176,'NIGÉRIA','NIGERIA',NULL),(177,'NIUE','NIUE',NULL),(178,'NORUEGA','NORWAY',NULL),(179,'NOVA CALEDÓNIA','NEW CALEDONIA',NULL),(180,'NOVA ZELÂNDIA','NEW ZEALAND',NULL),(181,'OMÃ','OMAN',NULL),(182,'PAÍSES BAIXOS','NETHERLANDS',NULL),(183,'PALAU','PALAU',NULL),(184,'PALESTINA','PALESTINE',NULL),(185,'PANAMÁ','PANAMA',NULL),(186,'PAPUÁSIA-NOVA GUINÉ','PAPUA NEW GUINEA',NULL),(187,'PAQUISTÃO','PAKISTAN',NULL),(188,'PARAGUAI','PARAGUAY',NULL),(189,'PERU','PERU',NULL),(190,'POLINÉSIA FRANCESA','FRENCH POLYNESIA',NULL),(191,'POLÓNIA','POLAND',NULL),(192,'PORTO RICO','PUERTO RICO',NULL),(193,'PORTUGAL','PORTUGAL',NULL),(194,'QUÉNIA','KENYA',NULL),(195,'QUIRGUIZISTÃO','KYRGYZSTAN',NULL),(196,'REINO UNIDO','UNITED KINGDOM',NULL),(197,'REPÚBLICA CHECA','CZECH REPUBLIC',NULL),(198,'REPÚBLICA DOMINICANA','DOMINICAN REPUBLIC',NULL),(199,'ROMÉNIA','ROMANIA',NULL),(200,'RUANDA','RWANDA',NULL),(201,'RÚSSIA','RUSSIAN FEDERATION',NULL),(202,'SAHARA OCCIDENTAL','WESTERN SAHARA',NULL),(203,'SALVADOR','EL SALVADOR',NULL),(204,'SAMOA','SAMOA',NULL),(205,'SANTA HELENA','SAINT HELENA',NULL),(206,'SANTA LÚCIA','SAINT LUCIA',NULL),(207,'SANTA SÉ','HOLY SEE',NULL),(208,'SÃO CRISTÓVÃO E NEVES','SAINT KITTS AND NEVIS',NULL),(209,'SÃO MARINO','SAN MARINO',NULL),(210,'SÃO PEDRO E MIQUELÃO','SAINT PIERRE AND MIQUELON',NULL),(211,'SÃO TOMÉ E PRÍNCIPE','SAO TOME AND PRINCIPE',NULL),(212,'SÃO VICENTE E GRANADINAS','SAINT VINCENT AND THE GRENADINES',NULL),(213,'SEICHELES','SEYCHELLES',NULL),(214,'SENEGAL','SENEGAL',NULL),(215,'SERRA LEOA','SIERRA LEONE',NULL),(216,'SÉRVIA','SERBIA',NULL),(217,'SINGAPURA','SINGAPORE',NULL),(218,'SÍRIA','SYRIA',NULL),(219,'SOMÁLIA','SOMALIA',NULL),(220,'SRI LANCA','SRI LANKA',NULL),(221,'SUAZILÂNDIA','SWAZILAND',NULL),(222,'SUDÃO','SUDAN',NULL),(223,'SUÉCIA','SWEDEN',NULL),(224,'SUÍÇA','SWITZERLAND',NULL),(225,'SURINAME','SURINAME',NULL),(226,'SVALBARD','SVALBARD',NULL),(227,'TAILÂNDIA','THAILAND',NULL),(228,'TAIWAN','TAIWAN',NULL),(229,'TAJIQUISTÃO','TAJIKISTAN',NULL),(230,'TANZÂNIA','TANZANIA',NULL),(231,'TERRITÓRIO BRITÂNICO DO OCEANO ÍNDICO','BRITISH INDIAN OCEAN TERRITORY',NULL),(232,'TERRITÓRIO DAS ILHAS HEARD E MCDONALD','HEARD ISLAND AND MCDONALD ISLANDS',NULL),(233,'TIMOR-LESTE','TIMOR-LESTE',NULL),(234,'TOGO','TOGO',NULL),(235,'TOKELAU','TOKELAU',NULL),(236,'TONGA','TONGA',NULL),(237,'TRINDADE E TOBAGO','TRINIDAD AND TOBAGO',NULL),(238,'TUNÍSIA','TUNISIA',NULL),(239,'TURKS E CAICOS','TURKS AND CAICOS ISLANDS',NULL),(240,'TURQUEMENISTÃO','TURKMENISTAN',NULL),(241,'TURQUIA','TURKEY',NULL),(242,'TUVALU','TUVALU',NULL),(243,'UCRÂNIA','UKRAINE',NULL),(244,'UGANDA','UGANDA',NULL),(245,'URUGUAI','URUGUAY',NULL),(246,'USBEQUISTÃO','UZBEKISTAN',NULL),(247,'VANUATU','VANUATU',NULL),(248,'VENEZUELA','VENEZUELA',NULL),(249,'VIETNAME','VIETNAM',NULL),(250,'WALLIS E FUTUNA','WALLIS AND FUTUNA',NULL),(251,'ZÂMBIA','ZAMBIA',NULL),(252,'ZIMBABUÉ','ZIMBABWE',NULL);
/*!40000 ALTER TABLE `bsc_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_tipo_bancario`
--

DROP TABLE IF EXISTS `bsc_tipo_bancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_tipo_bancario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_tipo_bancario`
--

LOCK TABLES `bsc_tipo_bancario` WRITE;
/*!40000 ALTER TABLE `bsc_tipo_bancario` DISABLE KEYS */;
INSERT INTO `bsc_tipo_bancario` VALUES (1,'Pessoa'),(2,'Fornecedor');
/*!40000 ALTER TABLE `bsc_tipo_bancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_tipo_endereco`
--

DROP TABLE IF EXISTS `bsc_tipo_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_tipo_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_tipo_endereco`
--

LOCK TABLES `bsc_tipo_endereco` WRITE;
/*!40000 ALTER TABLE `bsc_tipo_endereco` DISABLE KEYS */;
INSERT INTO `bsc_tipo_endereco` VALUES (1,'Residencial'),(2,'Comercial');
/*!40000 ALTER TABLE `bsc_tipo_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_usuario_endereco`
--

DROP TABLE IF EXISTS `bsc_usuario_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_usuario_endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsc_cidade_id` int(11) NOT NULL,
  `bsc_tipo_endereco_id` int(11) NOT NULL,
  `seg_usuario_id` int(11) NOT NULL,
  `logradouro` varchar(200) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `complemento` text,
  `bairro` varchar(45) NOT NULL,
  `cep` varchar(10) DEFAULT NULL,
  `latitude` varchar(45) DEFAULT NULL,
  `longitude` varchar(45) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bsc_usuario_endereco_bsc_tipo_endereco1_idx` (`bsc_tipo_endereco_id`),
  KEY `fk_bsc_usuario_endereco_seg_usuario1_idx` (`seg_usuario_id`),
  KEY `fk_bsc_usuario_endereco_bsc_cidade1_idx` (`bsc_cidade_id`),
  CONSTRAINT `fk_bsc_usuario_endereco_bsc_cidade1` FOREIGN KEY (`bsc_cidade_id`) REFERENCES `bsc_cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bsc_usuario_endereco_bsc_tipo_endereco1` FOREIGN KEY (`bsc_tipo_endereco_id`) REFERENCES `bsc_tipo_endereco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bsc_usuario_endereco_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_usuario_endereco`
--

LOCK TABLES `bsc_usuario_endereco` WRITE;
/*!40000 ALTER TABLE `bsc_usuario_endereco` DISABLE KEYS */;
INSERT INTO `bsc_usuario_endereco` VALUES (1,94,1,2,'Rua Cruzeiro do Sul','420','','Esperança','69.915-122',NULL,NULL,NULL);
/*!40000 ALTER TABLE `bsc_usuario_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_acao`
--

DROP TABLE IF EXISTS `seg_acao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_acao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_acao`
--

LOCK TABLES `seg_acao` WRITE;
/*!40000 ALTER TABLE `seg_acao` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_acao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_log`
--

DROP TABLE IF EXISTS `seg_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_sessao_id` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `pagina` varchar(240) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_log_seg_sessao2_idx` (`seg_sessao_id`),
  CONSTRAINT `fk_seg_log_seg_sessao2` FOREIGN KEY (`seg_sessao_id`) REFERENCES `seg_sessao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_log`
--

LOCK TABLES `seg_log` WRITE;
/*!40000 ALTER TABLE `seg_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_modulo`
--

DROP TABLE IF EXISTS `seg_modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(240) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_modulo`
--

LOCK TABLES `seg_modulo` WRITE;
/*!40000 ALTER TABLE `seg_modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_modulo_acao`
--

DROP TABLE IF EXISTS `seg_modulo_acao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_modulo_acao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_modulo_id` int(11) NOT NULL,
  `seg_acao_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_modulo_has_seg_acao_seg_modulo1_idx` (`seg_modulo_id`),
  KEY `fk_seg_modulo_has_seg_acao_seg_acao1_idx` (`seg_acao_id`),
  CONSTRAINT `fk_seg_modulo_has_seg_acao_seg_acao1` FOREIGN KEY (`seg_acao_id`) REFERENCES `seg_acao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_seg_modulo_has_seg_acao_seg_modulo1` FOREIGN KEY (`seg_modulo_id`) REFERENCES `seg_modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_modulo_acao`
--

LOCK TABLES `seg_modulo_acao` WRITE;
/*!40000 ALTER TABLE `seg_modulo_acao` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_modulo_acao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_permissao`
--

DROP TABLE IF EXISTS `seg_permissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` int(11) NOT NULL,
  `seg_modulo_has_seg_acao_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_permissao_seg_usuario1_idx` (`seg_usuario_id`),
  KEY `fk_seg_permissao_seg_modulo_has_seg_acao1_idx` (`seg_modulo_has_seg_acao_id`),
  CONSTRAINT `fk_seg_permissao_seg_modulo_has_seg_acao1` FOREIGN KEY (`seg_modulo_has_seg_acao_id`) REFERENCES `seg_modulo_acao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_seg_permissao_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_permissao`
--

LOCK TABLES `seg_permissao` WRITE;
/*!40000 ALTER TABLE `seg_permissao` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_permissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_sessao`
--

DROP TABLE IF EXISTS `seg_sessao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_sessao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` int(11) NOT NULL,
  `codigo_sessao` varchar(200) NOT NULL,
  `navegador` varchar(120) DEFAULT NULL,
  `sistema_operacional` varchar(120) DEFAULT NULL,
  `data_login` timestamp NULL DEFAULT NULL,
  `data_logout` timestamp NULL DEFAULT NULL,
  `host` varchar(60) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_sessao_seg_usuario1_idx` (`seg_usuario_id`),
  CONSTRAINT `fk_seg_sessao_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_sessao`
--

LOCK TABLES `seg_sessao` WRITE;
/*!40000 ALTER TABLE `seg_sessao` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_sessao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_usuario`
--

DROP TABLE IF EXISTS `seg_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_usuario_status_id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `nickname` varchar(45) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(256) NOT NULL,
  `data_nascimento` timestamp NULL DEFAULT NULL,
  `tipo_pessoa` varchar(15) DEFAULT NULL COMMENT 'fisica ou juridica',
  `cpf_cnpj` varchar(18) DEFAULT NULL,
  `rg_ie` varchar(17) DEFAULT NULL,
  `rg_orgao_expedidor` varchar(45) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  `contato_1` varchar(15) DEFAULT NULL,
  `contato_2` varchar(15) DEFAULT NULL,
  `contato_3` varchar(15) DEFAULT NULL,
  `foto` varchar(120) DEFAULT NULL,
  `foto_original` varchar(120) DEFAULT NULL,
  `email_codigo_validacao` varchar(256) DEFAULT NULL,
  `senha_codigo_recuperacao` varchar(256) DEFAULT NULL,
  `senha_codigo_manter_logado` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_usuario_seg_usuario_status1_idx` (`seg_usuario_status_id`),
  CONSTRAINT `fk_seg_usuario_seg_usuario_status1` FOREIGN KEY (`seg_usuario_status_id`) REFERENCES `seg_usuario_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario`
--

LOCK TABLES `seg_usuario` WRITE;
/*!40000 ALTER TABLE `seg_usuario` DISABLE KEYS */;
INSERT INTO `seg_usuario` VALUES (2,1,'Rogério Moura Rosas','rojherio','rojheriorosas@gmail.com','','a050905511f0722fc20d2bdbfb499ca08d424c91','1988-06-19 05:00:00',NULL,'885.566.892-72','412549','SSP/AC','1','3','','','',NULL,NULL,'8802523556',NULL,NULL,1,'2016-07-27 03:51:01');
/*!40000 ALTER TABLE `seg_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_usuario_seguranca`
--

DROP TABLE IF EXISTS `seg_usuario_seguranca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_usuario_seguranca` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` int(11) NOT NULL,
  `senha_antiga` varchar(256) NOT NULL,
  `senha_provisoria` varchar(256) DEFAULT NULL,
  `data_solicitacao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_usuario_seguranca_seg_usuario1_idx` (`seg_usuario_id`),
  CONSTRAINT `fk_seg_usuario_seguranca_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario_seguranca`
--

LOCK TABLES `seg_usuario_seguranca` WRITE;
/*!40000 ALTER TABLE `seg_usuario_seguranca` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_usuario_seguranca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seg_usuario_status`
--

DROP TABLE IF EXISTS `seg_usuario_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seg_usuario_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario_status`
--

LOCK TABLES `seg_usuario_status` WRITE;
/*!40000 ALTER TABLE `seg_usuario_status` DISABLE KEYS */;
INSERT INTO `seg_usuario_status` VALUES (1,'Ativo','cadastrado, validado e com atividade de compra recente',1),(2,'Aguardando Validação','cadastrado, aguardando validação',1),(3,'Inativo','cadastrado, validado e sem atividade de compra',1),(4,'Bloqueado','cadastrado, validado e sem atividade de compra recente',1);
/*!40000 ALTER TABLE `seg_usuario_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-28 13:35:55
