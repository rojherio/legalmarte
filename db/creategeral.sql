-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema acreideiaslegalmarte
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema acreideiaslegalmarte
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `acreideiaslegalmarte` DEFAULT CHARACTER SET utf8 ;
USE `acreideiaslegalmarte` ;

-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(100) NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seg_status_id` INT NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `nickname` VARCHAR(45) NULL,
  `email` VARCHAR(120) NOT NULL,
  `login` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(256) NOT NULL,
  `data_nascimento` TIMESTAMP NULL,
  `tipo_pessoa` VARCHAR(15) NULL COMMENT 'fisica ou juridica',
  `cpf_cnpj` VARCHAR(18) NULL,
  `rg_ie` VARCHAR(17) NULL,
  `rg_orgao_expedidor` VARCHAR(45) NULL,
  `sexo` CHAR(1) NULL,
  `estado_civil` VARCHAR(45) NULL,
  `contato_1` VARCHAR(15) NULL,
  `contato_2` VARCHAR(15) NULL,
  `contato_3` VARCHAR(15) NULL,
  `foto` VARCHAR(120) NULL,
  `foto_original` VARCHAR(120) NULL,
  `email_codigo_validacao` VARCHAR(256) NULL,
  `senha_codigo_recuperacao` VARCHAR(256) NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seg_usuario_seg_status1_idx` (`seg_status_id` ASC),
  CONSTRAINT `fk_seg_usuario_seg_status1`
    FOREIGN KEY (`seg_status_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_pessoa_admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_pessoa_admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` INT NOT NULL,
  `pct_participacao` DECIMAL(5,2) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_pessoa_admin_acc_pessoa1_idx` (`acc_pessoa_id` ASC),
  CONSTRAINT `fk_acc_pessoa_admin_acc_pessoa1`
    FOREIGN KEY (`acc_pessoa_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_pessoa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` INT NOT NULL,
  `acc_pessoa_admin_id` INT NULL,
  `acc_pessoa_id_amigo` INT NULL,
  `nickname` VARCHAR(45) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  INDEX `fk_acc_pessoa_seg_usuario1_idx` (`seg_usuario_id` ASC),
  PRIMARY KEY (`id`),
  INDEX `fk_acc_pessoa_acc_pessoa1_idx` (`acc_pessoa_id_amigo` ASC),
  INDEX `fk_acc_pessoa_acc_pessoa_admin1_idx` (`acc_pessoa_admin_id` ASC),
  CONSTRAINT `fk_acc_pessoa_seg_usuario1`
    FOREIGN KEY (`seg_usuario_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_pessoa_acc_pessoa1`
    FOREIGN KEY (`acc_pessoa_id_amigo`)
    REFERENCES `acreideiaslegalmarte`.`acc_pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_pessoa_acc_pessoa_admin1`
    FOREIGN KEY (`acc_pessoa_admin_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_pessoa_admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_cliente_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_cliente_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(100) NULL,
  `class` VARCHAR(30) NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` INT NOT NULL,
  `acc_cliente_status_id` INT NOT NULL,
  `data_aprovado` TIMESTAMP NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_cliente_acc_pessoa1_idx` (`acc_pessoa_id` ASC),
  INDEX `fk_acc_cliente_acc_cliente_status1_idx` (`acc_cliente_status_id` ASC),
  CONSTRAINT `fk_acc_cliente_acc_pessoa1`
    FOREIGN KEY (`acc_pessoa_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_acc_cliente_status1`
    FOREIGN KEY (`acc_cliente_status_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_cliente_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(30) NOT NULL,
  `descricao` VARCHAR(100) NULL,
  `class` VARCHAR(30) NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_pessoa_id` INT NOT NULL,
  `acc_fornecedor_status_id` INT NOT NULL,
  `razao_social` VARCHAR(200) NULL,
  `nome_fantasia` VARCHAR(120) NULL,
  `email` VARCHAR(120) NULL,
  `site` VARCHAR(120) NULL,
  `contato_1` VARCHAR(15) NOT NULL,
  `contato_2` VARCHAR(15) NULL,
  `contato_3` VARCHAR(15) NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_fornecedor_acc_pessoa1_idx` (`acc_pessoa_id` ASC),
  INDEX `fk_acc_fornecedor_acc_fornecedor_status1_idx` (`acc_fornecedor_status_id` ASC),
  CONSTRAINT `fk_acc_fornecedor_acc_pessoa1`
    FOREIGN KEY (`acc_pessoa_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_pessoa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_acc_fornecedor_status1`
    FOREIGN KEY (`acc_fornecedor_status_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_empresa` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `descricao` VARCHAR(360) NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `quantidade_ponto` DECIMAL(10,2) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_tipo_operacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_tipo_operacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(240) NOT NULL,
  `operador` VARCHAR(30) NOT NULL COMMENT 'adicao_credito, subtracao_debito',
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_forma_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_forma_pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_operacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_operacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_tipo_operacao_id` INT NOT NULL,
  `acc_cliente_id` INT NULL,
  `acc_fornecedor_id` INT NULL,
  `acc_operacao_id_relacionada` INT NULL,
  `bsc_forma_pagamento_id` INT NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_operacao_acc_tipo_operacao1_idx` (`acc_tipo_operacao_id` ASC),
  INDEX `fk_acc_operacao_bsc_forma_pagamento1_idx` (`bsc_forma_pagamento_id` ASC),
  INDEX `fk_acc_operacao_acc_operacao1_idx` (`acc_operacao_id_relacionada` ASC),
  INDEX `fk_acc_operacao_acc_cliente1_idx` (`acc_cliente_id` ASC),
  INDEX `fk_acc_operacao_acc_fornecedor1_idx` (`acc_fornecedor_id` ASC),
  CONSTRAINT `fk_acc_operacao_acc_tipo_operacao1`
    FOREIGN KEY (`acc_tipo_operacao_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_tipo_operacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_bsc_forma_pagamento1`
    FOREIGN KEY (`bsc_forma_pagamento_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_forma_pagamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_operacao1`
    FOREIGN KEY (`acc_operacao_id_relacionada`)
    REFERENCES `acreideiaslegalmarte`.`acc_operacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_cliente1`
    FOREIGN KEY (`acc_cliente_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_acc_fornecedor1`
    FOREIGN KEY (`acc_fornecedor_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_cliente_ponto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_cliente_ponto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_cliente_id` INT NOT NULL,
  `acc_operacao_id` INT NOT NULL,
  `quantidade_ponto` DECIMAL(10,2) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_cliente_ponto_acc_cliente1_idx` (`acc_cliente_id` ASC),
  INDEX `fk_acc_cliente_ponto_acc_operacao1_idx` (`acc_operacao_id` ASC),
  CONSTRAINT `fk_acc_cliente_ponto_acc_cliente1`
    FOREIGN KEY (`acc_cliente_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_ponto_acc_operacao1`
    FOREIGN KEY (`acc_operacao_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_operacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_operacao_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_operacao_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_operacao_id` INT NOT NULL,
  `acc_produto_id` INT NOT NULL,
  `quantidade` DECIMAL(10,2) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `quantidade_ponto` DECIMAL(10,2) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_operacao_produto_acc_operacao1_idx` (`acc_operacao_id` ASC),
  INDEX `fk_acc_operacao_produto_acc_produto1_idx` (`acc_produto_id` ASC),
  CONSTRAINT `fk_acc_operacao_produto_acc_operacao1`
    FOREIGN KEY (`acc_operacao_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_operacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_operacao_produto_acc_produto1`
    FOREIGN KEY (`acc_produto_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_pais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(120) NOT NULL,
  `name` VARCHAR(120) NULL,
  `sigla` VARCHAR(10) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bsc_pais_id` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `sigla` CHAR(2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bsc_estado_bsc_pais_idx` (`bsc_pais_id` ASC),
  CONSTRAINT `fk_bsc_estado_bsc_pais`
    FOREIGN KEY (`bsc_pais_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_pais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_cidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bsc_estado_id` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `sigla` CHAR(3) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bsc_cidade_bsc_estado1_idx` (`bsc_estado_id` ASC),
  CONSTRAINT `fk_bsc_cidade_bsc_estado1`
    FOREIGN KEY (`bsc_estado_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_tipo_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_tipo_endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_usuario_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_usuario_endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bsc_cidade_id` INT NOT NULL,
  `bsc_tipo_endereco_id` INT NOT NULL,
  `seg_usuario_id` INT NOT NULL,
  `logradouro` VARCHAR(200) NOT NULL,
  `numero` VARCHAR(20) NOT NULL,
  `complemento` TEXT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(10) NULL,
  `latitude` VARCHAR(45) NULL,
  `longitude` VARCHAR(45) NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bsc_usuario_endereco_bsc_tipo_endereco1_idx` (`bsc_tipo_endereco_id` ASC),
  INDEX `fk_bsc_usuario_endereco_seg_usuario1_idx` (`seg_usuario_id` ASC),
  INDEX `fk_bsc_usuario_endereco_bsc_cidade1_idx` (`bsc_cidade_id` ASC),
  CONSTRAINT `fk_bsc_usuario_endereco_bsc_tipo_endereco1`
    FOREIGN KEY (`bsc_tipo_endereco_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_tipo_endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bsc_usuario_endereco_seg_usuario1`
    FOREIGN KEY (`seg_usuario_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bsc_usuario_endereco_bsc_cidade1`
    FOREIGN KEY (`bsc_cidade_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_banco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_banco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(5) NOT NULL,
  `nome` VARCHAR(120) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`bsc_tipo_bancario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`bsc_tipo_bancario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_cliente_bancario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_cliente_bancario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_cliente_id` INT NOT NULL,
  `bsc_banco_id` INT NOT NULL,
  `bsc_tipo_bancario_id` INT NOT NULL,
  `agencia` VARCHAR(15) NOT NULL,
  `agencia_dv` VARCHAR(2) NOT NULL,
  `conta` VARCHAR(15) NOT NULL,
  `conta_dv` VARCHAR(2) NOT NULL,
  `tipo_conta` INT NOT NULL,
  `variacao` VARCHAR(3) NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_cliente_bancario_acc_cliente1_idx` (`acc_cliente_id` ASC),
  INDEX `fk_acc_cliente_bancario_bsc_banco1_idx` (`bsc_banco_id` ASC),
  INDEX `fk_acc_cliente_bancario_bsc_tipo_bancario1_idx` (`bsc_tipo_bancario_id` ASC),
  CONSTRAINT `fk_acc_cliente_bancario_acc_cliente1`
    FOREIGN KEY (`acc_cliente_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_bancario_bsc_banco1`
    FOREIGN KEY (`bsc_banco_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_banco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_bancario_bsc_tipo_bancario1`
    FOREIGN KEY (`bsc_tipo_bancario_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_tipo_bancario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor_banner`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor_banner` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `endereco` VARCHAR(120) NOT NULL,
  `ordem` INT NULL,
  `principal` INT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_fornecedor_banner_acc_fornecedor1_idx` (`acc_fornecedor_id` ASC),
  CONSTRAINT `fk_acc_fornecedor_banner_acc_fornecedor1`
    FOREIGN KEY (`acc_fornecedor_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor_desconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor_desconto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` INT NOT NULL,
  `pct` DECIMAL(5,2) NOT NULL,
  `limite_inicio` DECIMAL(10,2) NOT NULL,
  `limite_fim` DECIMAL(10,2) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_fornecedor_desconto_acc_fornecedor1_idx` (`acc_fornecedor_id` ASC),
  CONSTRAINT `fk_acc_fornecedor_desconto_acc_fornecedor1`
    FOREIGN KEY (`acc_fornecedor_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_produto_imagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_produto_imagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_produto_id` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(240) NULL,
  `endereco` VARCHAR(120) NOT NULL,
  `ordem` INT NOT NULL,
  `principal` INT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_produto_imagem_acc_produto1_idx` (`acc_produto_id` ASC),
  CONSTRAINT `fk_acc_produto_imagem_acc_produto1`
    FOREIGN KEY (`acc_produto_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_arvore`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_arvore` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nivel` INT NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_comissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_comissao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_arvore_id` INT NOT NULL,
  `pct` DECIMAL(5,2) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_comissao_acc_arvore1_idx` (`acc_arvore_id` ASC),
  CONSTRAINT `fk_acc_comissao_acc_arvore1`
    FOREIGN KEY (`acc_arvore_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_arvore` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_sessao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_sessao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` INT NOT NULL,
  `codigo_sessao` VARCHAR(200) NOT NULL,
  `navegador` VARCHAR(120) NULL,
  `sistema_operacional` VARCHAR(120) NULL,
  `data_login` TIMESTAMP NULL,
  `data_logout` TIMESTAMP NULL,
  `host` VARCHAR(60) NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seg_sessao_seg_usuario1_idx` (`seg_usuario_id` ASC),
  CONSTRAINT `fk_seg_sessao_seg_usuario1`
    FOREIGN KEY (`seg_usuario_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_modulo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_modulo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(240) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_acao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_acao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `descricao` VARCHAR(240) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_modulo_acao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_modulo_acao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seg_modulo_id` INT NOT NULL,
  `seg_acao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seg_modulo_has_seg_acao_seg_modulo1_idx` (`seg_modulo_id` ASC),
  INDEX `fk_seg_modulo_has_seg_acao_seg_acao1_idx` (`seg_acao_id` ASC),
  CONSTRAINT `fk_seg_modulo_has_seg_acao_seg_modulo1`
    FOREIGN KEY (`seg_modulo_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_modulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seg_modulo_has_seg_acao_seg_acao1`
    FOREIGN KEY (`seg_acao_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_acao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_permissao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_permissao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` INT NOT NULL,
  `seg_modulo_has_seg_acao_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seg_permissao_seg_usuario1_idx` (`seg_usuario_id` ASC),
  INDEX `fk_seg_permissao_seg_modulo_has_seg_acao1_idx` (`seg_modulo_has_seg_acao_id` ASC),
  CONSTRAINT `fk_seg_permissao_seg_usuario1`
    FOREIGN KEY (`seg_usuario_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seg_permissao_seg_modulo_has_seg_acao1`
    FOREIGN KEY (`seg_modulo_has_seg_acao_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_modulo_acao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_usuario_seguranca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_usuario_seguranca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seg_usuario_id` INT NOT NULL,
  `senha_antiga` VARCHAR(256) NOT NULL,
  `senha_provisoria` VARCHAR(256) NULL,
  `data_solicitacao` TIMESTAMP NULL,
  `data_alteracao` TIMESTAMP NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seg_usuario_seguranca_seg_usuario1_idx` (`seg_usuario_id` ASC),
  CONSTRAINT `fk_seg_usuario_seguranca_seg_usuario1`
    FOREIGN KEY (`seg_usuario_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`seg_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`seg_log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seg_sessao_id` INT NOT NULL,
  `ip` VARCHAR(20) NOT NULL,
  `pagina` VARCHAR(240) NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seg_log_seg_sessao2_idx` (`seg_sessao_id` ASC),
  CONSTRAINT `fk_seg_log_seg_sessao2`
    FOREIGN KEY (`seg_sessao_id`)
    REFERENCES `acreideiaslegalmarte`.`seg_sessao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor_acomp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor_acomp` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` INT NOT NULL,
  `acc_fornecedor_status_id_antes` INT NOT NULL,
  `acc_fornecedor_status_id_depois` INT NOT NULL,
  `titulo` VARCHAR(240) NOT NULL,
  `descricao` TEXT NOT NULL,
  `visualizada` INT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_fornecedor_acomp_acc_fornecedor1_idx` (`acc_fornecedor_id` ASC),
  INDEX `fk_acc_fornecedor_acomp_acc_fornecedor_status1_idx` (`acc_fornecedor_status_id_antes` ASC),
  INDEX `fk_acc_fornecedor_acomp_acc_fornecedor_status2_idx` (`acc_fornecedor_status_id_depois` ASC),
  CONSTRAINT `fk_acc_fornecedor_acomp_acc_fornecedor1`
    FOREIGN KEY (`acc_fornecedor_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_acomp_acc_fornecedor_status1`
    FOREIGN KEY (`acc_fornecedor_status_id_antes`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_acomp_acc_fornecedor_status2`
    FOREIGN KEY (`acc_fornecedor_status_id_depois`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor_ponto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor_ponto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` INT NOT NULL,
  `acc_operacao_id` INT NOT NULL,
  `quantidade_ponto` DECIMAL(10,2) NOT NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_fornecedo_ponto_acc_fornecedor1_idx` (`acc_fornecedor_id` ASC),
  INDEX `fk_acc_fornecedor_ponto_acc_operacao1_idx` (`acc_operacao_id` ASC),
  CONSTRAINT `fk_acc_fornecedo_ponto_acc_fornecedor1`
    FOREIGN KEY (`acc_fornecedor_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_ponto_acc_operacao1`
    FOREIGN KEY (`acc_operacao_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_operacao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_cliente_acomp`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_cliente_acomp` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_cliente_id` INT NOT NULL,
  `acc_cliente_status_id_antes` INT NOT NULL,
  `acc_cliente_status_id_depois` INT NOT NULL,
  `titulo` VARCHAR(240) NOT NULL,
  `descricao` TEXT NOT NULL,
  `visualizada` INT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_cliente_acomp_acc_cliente1_idx` (`acc_cliente_id` ASC),
  INDEX `fk_acc_cliente_acomp_acc_cliente_status1_idx` (`acc_cliente_status_id_antes` ASC),
  INDEX `fk_acc_cliente_acomp_acc_cliente_status2_idx` (`acc_cliente_status_id_depois` ASC),
  CONSTRAINT `fk_acc_cliente_acomp_acc_cliente1`
    FOREIGN KEY (`acc_cliente_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_acomp_acc_cliente_status1`
    FOREIGN KEY (`acc_cliente_status_id_antes`)
    REFERENCES `acreideiaslegalmarte`.`acc_cliente_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_cliente_acomp_acc_cliente_status2`
    FOREIGN KEY (`acc_cliente_status_id_depois`)
    REFERENCES `acreideiaslegalmarte`.`acc_cliente_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor_endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor_endereco` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bsc_cidade_id` INT NOT NULL,
  `bsc_tipo_endereco_id` INT NOT NULL,
  `acc_fornecedor_id` INT NOT NULL,
  `logradouro` VARCHAR(200) NOT NULL,
  `numero` VARCHAR(20) NOT NULL,
  `complemento` TEXT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(10) NULL,
  `latitude` VARCHAR(45) NULL,
  `longitude` VARCHAR(45) NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_fornecedor_endereco_bsc_cidade1_idx` (`bsc_cidade_id` ASC),
  INDEX `fk_acc_fornecedor_endereco_bsc_tipo_endereco1_idx` (`bsc_tipo_endereco_id` ASC),
  INDEX `fk_acc_fornecedor_endereco_acc_fornecedor1_idx` (`acc_fornecedor_id` ASC),
  CONSTRAINT `fk_acc_fornecedor_endereco_bsc_cidade1`
    FOREIGN KEY (`bsc_cidade_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_cidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_endereco_bsc_tipo_endereco1`
    FOREIGN KEY (`bsc_tipo_endereco_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_tipo_endereco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_endereco_acc_fornecedor1`
    FOREIGN KEY (`acc_fornecedor_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `acreideiaslegalmarte`.`acc_fornecedor_bancario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `acreideiaslegalmarte`.`acc_fornecedor_bancario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `acc_fornecedor_id` INT NOT NULL,
  `bsc_banco_id` INT NOT NULL,
  `bsc_tipo_bancario_id` INT NOT NULL,
  `agencia` VARCHAR(15) NOT NULL,
  `agencia_dv` VARCHAR(2) NOT NULL,
  `conta` VARCHAR(15) NOT NULL,
  `conta_dv` VARCHAR(2) NOT NULL,
  `tipo_conta` INT NOT NULL,
  `variacao` VARCHAR(3) NULL,
  `status` INT NOT NULL,
  `data_cadastro` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_acc_fornecedor_bancario_bsc_banco1_idx` (`bsc_banco_id` ASC),
  INDEX `fk_acc_fornecedor_bancario_bsc_tipo_bancario1_idx` (`bsc_tipo_bancario_id` ASC),
  INDEX `fk_acc_fornecedor_bancario_acc_fornecedor1_idx` (`acc_fornecedor_id` ASC),
  CONSTRAINT `fk_acc_fornecedor_bancario_bsc_banco1`
    FOREIGN KEY (`bsc_banco_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_banco` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_bancario_bsc_tipo_bancario1`
    FOREIGN KEY (`bsc_tipo_bancario_id`)
    REFERENCES `acreideiaslegalmarte`.`bsc_tipo_bancario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_acc_fornecedor_bancario_acc_fornecedor1`
    FOREIGN KEY (`acc_fornecedor_id`)
    REFERENCES `acreideiaslegalmarte`.`acc_fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
