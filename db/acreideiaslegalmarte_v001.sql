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
  `data_aprovado` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_cliente_acc_pessoa1_idx` (`acc_pessoa_id`),
  CONSTRAINT `fk_acc_cliente_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_cliente`
--

LOCK TABLES `acc_cliente` WRITE;
/*!40000 ALTER TABLE `acc_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_cliente` ENABLE KEYS */;
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
  `acc_pessoa_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_empresa_acc_pessoa1_idx` (`acc_pessoa_id`),
  CONSTRAINT `fk_acc_empresa_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `acc_financeiro`
--

DROP TABLE IF EXISTS `acc_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_financeiro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` int(11) NOT NULL,
  `bsc_banco_id` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `agencia_dv` int(11) NOT NULL,
  `conta` int(11) NOT NULL,
  `conta_dv` int(11) NOT NULL,
  `tipo_conta` int(11) NOT NULL,
  `variacao` varchar(3) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_financeiro_bsc_banco1_idx` (`bsc_banco_id`),
  KEY `fk_acc_financeiro_acc_pessoa1_idx` (`acc_pessoa_id`),
  CONSTRAINT `fk_acc_financeiro_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_financeiro_bsc_banco1` FOREIGN KEY (`bsc_banco_id`) REFERENCES `bsc_banco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_financeiro`
--

LOCK TABLES `acc_financeiro` WRITE;
/*!40000 ALTER TABLE `acc_financeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_financeiro` ENABLE KEYS */;
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
  CONSTRAINT `fk_acc_fornecedor_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor`
--

LOCK TABLES `acc_fornecedor` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_fornecedor` ENABLE KEYS */;
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
  `ordem` int(11) NOT NULL,
  `principal` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_fornecedor_banner_acc_fornecedor1_idx` (`acc_fornecedor_id`),
  CONSTRAINT `fk_acc_fornecedor_banner_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_banner`
--

LOCK TABLES `acc_fornecedor_banner` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_banner` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_fornecedor_desconto`
--

LOCK TABLES `acc_fornecedor_desconto` WRITE;
/*!40000 ALTER TABLE `acc_fornecedor_desconto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_fornecedor_desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acc_operacao`
--

DROP TABLE IF EXISTS `acc_operacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_operacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id_origem` int(11) NOT NULL,
  `acc_pessoa_id_destino` int(11) NOT NULL,
  `acc_tipo_operacao_id` int(11) NOT NULL,
  `acc_operacao_id_relacionada` int(11) DEFAULT NULL,
  `bsc_forma_pagamento_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_operacao_acc_tipo_operacao1_idx` (`acc_tipo_operacao_id`),
  KEY `fk_acc_operacao_bsc_forma_pagamento1_idx` (`bsc_forma_pagamento_id`),
  KEY `fk_acc_operacao_acc_operacao1_idx` (`acc_operacao_id_relacionada`),
  KEY `fk_acc_operacao_acc_pessoa1_idx` (`acc_pessoa_id_origem`),
  KEY `fk_acc_operacao_acc_pessoa2_idx` (`acc_pessoa_id_destino`),
  CONSTRAINT `fk_acc_operacao_acc_operacao1` FOREIGN KEY (`acc_operacao_id_relacionada`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id_origem`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_pessoa2` FOREIGN KEY (`acc_pessoa_id_destino`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  `acc_pessoa_id_amigo` int(11) DEFAULT NULL,
  `acc_pessoa_admin_id` int(11) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_pessoa_seg_usuario1_idx` (`seg_usuario_id`),
  KEY `fk_acc_pessoa_acc_pessoa_admin1_idx` (`acc_pessoa_admin_id`),
  KEY `fk_acc_pessoa_acc_pessoa1_idx` (`acc_pessoa_id_amigo`),
  CONSTRAINT `fk_acc_pessoa_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id_amigo`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_pessoa_acc_pessoa_admin1` FOREIGN KEY (`acc_pessoa_admin_id`) REFERENCES `acc_pessoa_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_pessoa_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_pessoa`
--

LOCK TABLES `acc_pessoa` WRITE;
/*!40000 ALTER TABLE `acc_pessoa` DISABLE KEYS */;
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
-- Table structure for table `acc_usuario_ponto`
--

DROP TABLE IF EXISTS `acc_usuario_ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acc_usuario_ponto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` int(11) NOT NULL,
  `acc_operacao_id` int(11) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_acc_usuario_ponto_acc_operacao1_idx` (`acc_operacao_id`),
  KEY `fk_acc_usuario_ponto_acc_pessoa1_idx` (`acc_pessoa_id`),
  CONSTRAINT `fk_acc_usuario_ponto_acc_operacao1` FOREIGN KEY (`acc_operacao_id`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_usuario_ponto_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acc_usuario_ponto`
--

LOCK TABLES `acc_usuario_ponto` WRITE;
/*!40000 ALTER TABLE `acc_usuario_ponto` DISABLE KEYS */;
/*!40000 ALTER TABLE `acc_usuario_ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_banco`
--

DROP TABLE IF EXISTS `bsc_banco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_banco`
--

LOCK TABLES `bsc_banco` WRITE;
/*!40000 ALTER TABLE `bsc_banco` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_cidade`
--

LOCK TABLES `bsc_cidade` WRITE;
/*!40000 ALTER TABLE `bsc_cidade` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_estado`
--

LOCK TABLES `bsc_estado` WRITE;
/*!40000 ALTER TABLE `bsc_estado` DISABLE KEYS */;
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
  `nome` varchar(60) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_pais`
--

LOCK TABLES `bsc_pais` WRITE;
/*!40000 ALTER TABLE `bsc_pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `bsc_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bsc_tipo_endereco`
--

DROP TABLE IF EXISTS `bsc_tipo_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bsc_tipo_endereco` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_tipo_endereco`
--

LOCK TABLES `bsc_tipo_endereco` WRITE;
/*!40000 ALTER TABLE `bsc_tipo_endereco` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bsc_usuario_endereco`
--

LOCK TABLES `bsc_usuario_endereco` WRITE;
/*!40000 ALTER TABLE `bsc_usuario_endereco` DISABLE KEYS */;
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
  `id` varchar(45) NOT NULL,
  `seg_sessao_id` int(11) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `pagina` varchar(240) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_log_seg_sessao1_idx` (`seg_sessao_id`),
  CONSTRAINT `fk_seg_log_seg_sessao1` FOREIGN KEY (`seg_sessao_id`) REFERENCES `seg_sessao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `data_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario_status`
--

LOCK TABLES `seg_usuario_status` WRITE;
/*!40000 ALTER TABLE `seg_usuario_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `seg_usuario_status` ENABLE KEYS */;
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
  `titpo_pessoa` varchar(15) DEFAULT NULL COMMENT 'fisica ou juridica',
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
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seg_usuario_seg_usuario_status1_idx` (`seg_usuario_status_id`),
  CONSTRAINT `fk_seg_usuario_seg_usuario_status1` FOREIGN KEY (`seg_usuario_status_id`) REFERENCES `seg_usuario_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seg_usuario`
--

LOCK TABLES `seg_usuario` WRITE;
/*!40000 ALTER TABLE `seg_usuario` DISABLE KEYS */;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-24 16:36:20
