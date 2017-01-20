-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 29-Jun-2016 às 20:21
-- Versão do servidor: 5.6.25
-- PHP Version: 5.6.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `acreideiaslegalmarte`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_arvore`
--

CREATE TABLE IF NOT EXISTS `acc_arvore` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `nivel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_cliente`
--

CREATE TABLE IF NOT EXISTS `acc_cliente` (
  `id` int(11) NOT NULL,
  `acc_pessoa_id` int(11) NOT NULL,
  `data_aprovado` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_comissao`
--

CREATE TABLE IF NOT EXISTS `acc_comissao` (
  `id` int(11) NOT NULL,
  `acc_arvore_id` int(11) NOT NULL,
  `pct` decimal(5,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_empresa`
--

CREATE TABLE IF NOT EXISTS `acc_empresa` (
  `id` int(11) NOT NULL,
  `acc_pessoa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_financeiro`
--

CREATE TABLE IF NOT EXISTS `acc_financeiro` (
  `id` int(11) NOT NULL,
  `acc_pessoa_id` int(11) NOT NULL,
  `bsc_banco_id` int(11) NOT NULL,
  `agencia` int(11) NOT NULL,
  `agencia_dv` int(11) NOT NULL,
  `conta` int(11) NOT NULL,
  `conta_dv` int(11) NOT NULL,
  `tipo_conta` int(11) NOT NULL,
  `variacao` varchar(3) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_fornecedor`
--

CREATE TABLE IF NOT EXISTS `acc_fornecedor` (
  `id` int(11) NOT NULL,
  `acc_pessoa_id` int(11) NOT NULL,
  `nome_fantasia` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `site` varchar(120) DEFAULT NULL,
  `contato_1` varchar(15) NOT NULL,
  `contato_2` varchar(15) DEFAULT NULL,
  `contato_3` varchar(15) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_fornecedor_banner`
--

CREATE TABLE IF NOT EXISTS `acc_fornecedor_banner` (
  `id` int(11) NOT NULL,
  `acc_fornecedor_id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `endereco` varchar(120) NOT NULL,
  `ordem` int(11) NOT NULL,
  `principal` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_fornecedor_desconto`
--

CREATE TABLE IF NOT EXISTS `acc_fornecedor_desconto` (
  `id` int(11) NOT NULL,
  `acc_fornecedor_id` int(11) NOT NULL,
  `pct` decimal(5,2) NOT NULL,
  `limite_inicio` decimal(10,2) NOT NULL,
  `limite_fim` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_operacao`
--

CREATE TABLE IF NOT EXISTS `acc_operacao` (
  `id` int(11) NOT NULL,
  `acc_pessoa_id_origem` int(11) NOT NULL,
  `acc_pessoa_id_destino` int(11) NOT NULL,
  `acc_tipo_operacao_id` int(11) NOT NULL,
  `acc_operacao_id_relacionada` int(11) DEFAULT NULL,
  `bsc_forma_pagamento_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_operacao_produto`
--

CREATE TABLE IF NOT EXISTS `acc_operacao_produto` (
  `id` int(11) NOT NULL,
  `acc_operacao_id` int(11) NOT NULL,
  `acc_produto_id` int(11) NOT NULL,
  `quantidade` decimal(10,2) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_pessoa`
--

CREATE TABLE IF NOT EXISTS `acc_pessoa` (
  `id` int(11) NOT NULL,
  `seg_usuario_id` int(11) NOT NULL,
  `acc_pessoa_id_amigo` int(11) DEFAULT NULL,
  `acc_pessoa_admin_id` int(11) NOT NULL,
  `nickname` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_pessoa_admin`
--

CREATE TABLE IF NOT EXISTS `acc_pessoa_admin` (
  `id` int(11) NOT NULL,
  `acc_pessoa_id` int(11) NOT NULL,
  `pct_participacao` decimal(5,2) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_produto`
--

CREATE TABLE IF NOT EXISTS `acc_produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `descricao` varchar(360) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_produto_imagem`
--

CREATE TABLE IF NOT EXISTS `acc_produto_imagem` (
  `id` int(11) NOT NULL,
  `acc_produto_id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(240) DEFAULT NULL,
  `endereco` varchar(120) NOT NULL,
  `ordem` int(11) NOT NULL,
  `principal` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_tipo_operacao`
--

CREATE TABLE IF NOT EXISTS `acc_tipo_operacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(240) NOT NULL,
  `operador` varchar(30) NOT NULL COMMENT 'adicao_credito, subtracao_debito',
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acc_usuario_ponto`
--

CREATE TABLE IF NOT EXISTS `acc_usuario_ponto` (
  `id` int(11) NOT NULL,
  `acc_pessoa_id` int(11) NOT NULL,
  `acc_operacao_id` int(11) NOT NULL,
  `quantidade_ponto` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bsc_banco`
--

CREATE TABLE IF NOT EXISTS `bsc_banco` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bsc_cidade`
--

CREATE TABLE IF NOT EXISTS `bsc_cidade` (
  `id` int(11) NOT NULL,
  `bsc_estado_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bsc_estado`
--

CREATE TABLE IF NOT EXISTS `bsc_estado` (
  `id` int(11) NOT NULL,
  `bsc_pais_id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sigla` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bsc_forma_pagamento`
--

CREATE TABLE IF NOT EXISTS `bsc_forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bsc_pais`
--

CREATE TABLE IF NOT EXISTS `bsc_pais` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `sigla` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bsc_tipo_endereco`
--

CREATE TABLE IF NOT EXISTS `bsc_tipo_endereco` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `bsc_usuario_endereco`
--

CREATE TABLE IF NOT EXISTS `bsc_usuario_endereco` (
  `id` int(11) NOT NULL,
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
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_acao`
--

CREATE TABLE IF NOT EXISTS `seg_acao` (
  `id` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_log`
--

CREATE TABLE IF NOT EXISTS `seg_log` (
  `id` varchar(45) NOT NULL,
  `seg_sessao_id` int(11) NOT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `pagina` varchar(240) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_modulo`
--

CREATE TABLE IF NOT EXISTS `seg_modulo` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_modulo_acao`
--

CREATE TABLE IF NOT EXISTS `seg_modulo_acao` (
  `id` int(11) NOT NULL,
  `seg_modulo_id` int(11) NOT NULL,
  `seg_acao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_permissao`
--

CREATE TABLE IF NOT EXISTS `seg_permissao` (
  `id` int(11) NOT NULL,
  `seg_usuario_id` int(11) NOT NULL,
  `seg_modulo_has_seg_acao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_sessao`
--

CREATE TABLE IF NOT EXISTS `seg_sessao` (
  `id` int(11) NOT NULL,
  `seg_usuario_id` int(11) NOT NULL,
  `codigo_sessao` varchar(200) NOT NULL,
  `navegador` varchar(120) DEFAULT NULL,
  `sistema_operacional` varchar(120) DEFAULT NULL,
  `data_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_logout` timestamp NULL DEFAULT NULL,
  `host` varchar(60) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_usuario_status`
--

CREATE TABLE IF NOT EXISTS `seg_usuario_status` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `seg_usuario_status`
--

INSERT INTO `seg_usuario_status` (`id`, `nome`, `descricao`, `status`) VALUES
(1, 'Teste', 'Teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_usuario`
--

CREATE TABLE IF NOT EXISTS `seg_usuario` (
  `id` int(11) NOT NULL,
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
  `status` int(11) NOT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  `email_codigo_validacao` varchar(256) DEFAULT NULL,
  `senha_codigo_recuperacao` varchar(256) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `seg_usuario`
--

INSERT INTO `seg_usuario` (`id`, `seg_usuario_status_id`, `nome`, `nickname`, `email`, `login`, `senha`, `data_nascimento`, `tipo_pessoa`, `cpf_cnpj`, `rg_ie`, `rg_orgao_expedidor`, `sexo`, `estado_civil`, `contato_1`, `contato_2`, `contato_3`, `foto`, `foto_original`, `status`, `data_cadastro`, `email_codigo_validacao`, `senha_codigo_recuperacao`) VALUES
(5, 1, '', 'Nome do Usuário', 'email@gmail.com', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '123', NULL),
(17, 1, '', 'Nome x', 'emailx@hotmail.com', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, '123456', NULL),
(18, 1, '', 'adkasjdja', 'email@gmai.com', '', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `seg_usuario_seguranca`
--

CREATE TABLE IF NOT EXISTS `seg_usuario_seguranca` (
  `id` int(11) NOT NULL,
  `seg_usuario_id` int(11) NOT NULL,
  `senha_antiga` varchar(256) NOT NULL,
  `senha_provisoria` varchar(256) DEFAULT NULL,
  `data_solicitacao` timestamp NULL DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acc_arvore`
--
ALTER TABLE `acc_arvore`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_cliente`
--
ALTER TABLE `acc_cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_cliente_acc_pessoa1_idx` (`acc_pessoa_id`);

--
-- Indexes for table `acc_comissao`
--
ALTER TABLE `acc_comissao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_comissao_acc_arvore1_idx` (`acc_arvore_id`);

--
-- Indexes for table `acc_empresa`
--
ALTER TABLE `acc_empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_empresa_acc_pessoa1_idx` (`acc_pessoa_id`);

--
-- Indexes for table `acc_financeiro`
--
ALTER TABLE `acc_financeiro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_financeiro_bsc_banco1_idx` (`bsc_banco_id`),
  ADD KEY `fk_acc_financeiro_acc_pessoa1_idx` (`acc_pessoa_id`);

--
-- Indexes for table `acc_fornecedor`
--
ALTER TABLE `acc_fornecedor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_fornecedor_acc_pessoa1_idx` (`acc_pessoa_id`);

--
-- Indexes for table `acc_fornecedor_banner`
--
ALTER TABLE `acc_fornecedor_banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_fornecedor_banner_acc_fornecedor1_idx` (`acc_fornecedor_id`);

--
-- Indexes for table `acc_fornecedor_desconto`
--
ALTER TABLE `acc_fornecedor_desconto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_fornecedor_desconto_acc_fornecedor1_idx` (`acc_fornecedor_id`);

--
-- Indexes for table `acc_operacao`
--
ALTER TABLE `acc_operacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_operacao_acc_tipo_operacao1_idx` (`acc_tipo_operacao_id`),
  ADD KEY `fk_acc_operacao_bsc_forma_pagamento1_idx` (`bsc_forma_pagamento_id`),
  ADD KEY `fk_acc_operacao_acc_operacao1_idx` (`acc_operacao_id_relacionada`),
  ADD KEY `fk_acc_operacao_acc_pessoa1_idx` (`acc_pessoa_id_origem`),
  ADD KEY `fk_acc_operacao_acc_pessoa2_idx` (`acc_pessoa_id_destino`);

--
-- Indexes for table `acc_operacao_produto`
--
ALTER TABLE `acc_operacao_produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_operacao_produto_acc_operacao1_idx` (`acc_operacao_id`),
  ADD KEY `fk_acc_operacao_produto_acc_produto1_idx` (`acc_produto_id`);

--
-- Indexes for table `acc_pessoa`
--
ALTER TABLE `acc_pessoa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_pessoa_seg_usuario1_idx` (`seg_usuario_id`),
  ADD KEY `fk_acc_pessoa_acc_pessoa_admin1_idx` (`acc_pessoa_admin_id`),
  ADD KEY `fk_acc_pessoa_acc_pessoa1_idx` (`acc_pessoa_id_amigo`);

--
-- Indexes for table `acc_pessoa_admin`
--
ALTER TABLE `acc_pessoa_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_pessoa_admin_acc_pessoa1_idx` (`acc_pessoa_id`);

--
-- Indexes for table `acc_produto`
--
ALTER TABLE `acc_produto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_produto_imagem`
--
ALTER TABLE `acc_produto_imagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_produto_imagem_acc_produto1_idx` (`acc_produto_id`);

--
-- Indexes for table `acc_tipo_operacao`
--
ALTER TABLE `acc_tipo_operacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `acc_usuario_ponto`
--
ALTER TABLE `acc_usuario_ponto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_acc_usuario_ponto_acc_operacao1_idx` (`acc_operacao_id`),
  ADD KEY `fk_acc_usuario_ponto_acc_pessoa1_idx` (`acc_pessoa_id`);

--
-- Indexes for table `bsc_banco`
--
ALTER TABLE `bsc_banco`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bsc_cidade`
--
ALTER TABLE `bsc_cidade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bsc_cidade_bsc_estado1_idx` (`bsc_estado_id`);

--
-- Indexes for table `bsc_estado`
--
ALTER TABLE `bsc_estado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bsc_estado_bsc_pais_idx` (`bsc_pais_id`);

--
-- Indexes for table `bsc_forma_pagamento`
--
ALTER TABLE `bsc_forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bsc_pais`
--
ALTER TABLE `bsc_pais`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bsc_tipo_endereco`
--
ALTER TABLE `bsc_tipo_endereco`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bsc_usuario_endereco`
--
ALTER TABLE `bsc_usuario_endereco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bsc_usuario_endereco_bsc_tipo_endereco1_idx` (`bsc_tipo_endereco_id`),
  ADD KEY `fk_bsc_usuario_endereco_seg_usuario1_idx` (`seg_usuario_id`),
  ADD KEY `fk_bsc_usuario_endereco_bsc_cidade1_idx` (`bsc_cidade_id`);

--
-- Indexes for table `seg_acao`
--
ALTER TABLE `seg_acao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seg_log`
--
ALTER TABLE `seg_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seg_log_seg_sessao1_idx` (`seg_sessao_id`);

--
-- Indexes for table `seg_modulo`
--
ALTER TABLE `seg_modulo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seg_modulo_acao`
--
ALTER TABLE `seg_modulo_acao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seg_modulo_has_seg_acao_seg_modulo1_idx` (`seg_modulo_id`),
  ADD KEY `fk_seg_modulo_has_seg_acao_seg_acao1_idx` (`seg_acao_id`);

--
-- Indexes for table `seg_permissao`
--
ALTER TABLE `seg_permissao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seg_permissao_seg_usuario1_idx` (`seg_usuario_id`),
  ADD KEY `fk_seg_permissao_seg_modulo_has_seg_acao1_idx` (`seg_modulo_has_seg_acao_id`);

--
-- Indexes for table `seg_sessao`
--
ALTER TABLE `seg_sessao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seg_sessao_seg_usuario1_idx` (`seg_usuario_id`);

--
-- Indexes for table `seg_usuario_status`
--
ALTER TABLE `seg_usuario_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seg_usuario`
--
ALTER TABLE `seg_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seg_usuario_seg_usuario_status1_idx` (`seg_usuario_status_id`);

--
-- Indexes for table `seg_usuario_seguranca`
--
ALTER TABLE `seg_usuario_seguranca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_seg_usuario_seguranca_seg_usuario1_idx` (`seg_usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acc_arvore`
--
ALTER TABLE `acc_arvore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_cliente`
--
ALTER TABLE `acc_cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_comissao`
--
ALTER TABLE `acc_comissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_empresa`
--
ALTER TABLE `acc_empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_financeiro`
--
ALTER TABLE `acc_financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_fornecedor`
--
ALTER TABLE `acc_fornecedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_fornecedor_banner`
--
ALTER TABLE `acc_fornecedor_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_fornecedor_desconto`
--
ALTER TABLE `acc_fornecedor_desconto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_operacao`
--
ALTER TABLE `acc_operacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_operacao_produto`
--
ALTER TABLE `acc_operacao_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_pessoa`
--
ALTER TABLE `acc_pessoa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_pessoa_admin`
--
ALTER TABLE `acc_pessoa_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_produto`
--
ALTER TABLE `acc_produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_produto_imagem`
--
ALTER TABLE `acc_produto_imagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_tipo_operacao`
--
ALTER TABLE `acc_tipo_operacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `acc_usuario_ponto`
--
ALTER TABLE `acc_usuario_ponto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bsc_banco`
--
ALTER TABLE `bsc_banco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bsc_cidade`
--
ALTER TABLE `bsc_cidade`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bsc_estado`
--
ALTER TABLE `bsc_estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bsc_forma_pagamento`
--
ALTER TABLE `bsc_forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bsc_pais`
--
ALTER TABLE `bsc_pais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bsc_usuario_endereco`
--
ALTER TABLE `bsc_usuario_endereco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seg_acao`
--
ALTER TABLE `seg_acao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seg_modulo`
--
ALTER TABLE `seg_modulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seg_modulo_acao`
--
ALTER TABLE `seg_modulo_acao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seg_permissao`
--
ALTER TABLE `seg_permissao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seg_sessao`
--
ALTER TABLE `seg_sessao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `seg_usuario_status`
--
ALTER TABLE `seg_usuario_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `seg_usuario`
--
ALTER TABLE `seg_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `seg_usuario_seguranca`
--
ALTER TABLE `seg_usuario_seguranca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `acc_cliente`
--
ALTER TABLE `acc_cliente`
  ADD CONSTRAINT `fk_acc_cliente_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_comissao`
--
ALTER TABLE `acc_comissao`
  ADD CONSTRAINT `fk_acc_comissao_acc_arvore1` FOREIGN KEY (`acc_arvore_id`) REFERENCES `acc_arvore` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_empresa`
--
ALTER TABLE `acc_empresa`
  ADD CONSTRAINT `fk_acc_empresa_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_financeiro`
--
ALTER TABLE `acc_financeiro`
  ADD CONSTRAINT `fk_acc_financeiro_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_financeiro_bsc_banco1` FOREIGN KEY (`bsc_banco_id`) REFERENCES `bsc_banco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_fornecedor`
--
ALTER TABLE `acc_fornecedor`
  ADD CONSTRAINT `fk_acc_fornecedor_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_fornecedor_banner`
--
ALTER TABLE `acc_fornecedor_banner`
  ADD CONSTRAINT `fk_acc_fornecedor_banner_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_fornecedor_desconto`
--
ALTER TABLE `acc_fornecedor_desconto`
  ADD CONSTRAINT `fk_acc_fornecedor_desconto_acc_fornecedor1` FOREIGN KEY (`acc_fornecedor_id`) REFERENCES `acc_fornecedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_operacao`
--
ALTER TABLE `acc_operacao`
  ADD CONSTRAINT `fk_acc_operacao_acc_operacao1` FOREIGN KEY (`acc_operacao_id_relacionada`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_operacao_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id_origem`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_operacao_acc_pessoa2` FOREIGN KEY (`acc_pessoa_id_destino`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_operacao_acc_tipo_operacao1` FOREIGN KEY (`acc_tipo_operacao_id`) REFERENCES `acc_tipo_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_operacao_bsc_forma_pagamento1` FOREIGN KEY (`bsc_forma_pagamento_id`) REFERENCES `bsc_forma_pagamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_operacao_produto`
--
ALTER TABLE `acc_operacao_produto`
  ADD CONSTRAINT `fk_acc_operacao_produto_acc_operacao1` FOREIGN KEY (`acc_operacao_id`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_operacao_produto_acc_produto1` FOREIGN KEY (`acc_produto_id`) REFERENCES `acc_produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_pessoa`
--
ALTER TABLE `acc_pessoa`
  ADD CONSTRAINT `fk_acc_pessoa_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id_amigo`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_pessoa_acc_pessoa_admin1` FOREIGN KEY (`acc_pessoa_admin_id`) REFERENCES `acc_pessoa_admin` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_pessoa_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_pessoa_admin`
--
ALTER TABLE `acc_pessoa_admin`
  ADD CONSTRAINT `fk_acc_pessoa_admin_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_produto_imagem`
--
ALTER TABLE `acc_produto_imagem`
  ADD CONSTRAINT `fk_acc_produto_imagem_acc_produto1` FOREIGN KEY (`acc_produto_id`) REFERENCES `acc_produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `acc_usuario_ponto`
--
ALTER TABLE `acc_usuario_ponto`
  ADD CONSTRAINT `fk_acc_usuario_ponto_acc_operacao1` FOREIGN KEY (`acc_operacao_id`) REFERENCES `acc_operacao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acc_usuario_ponto_acc_pessoa1` FOREIGN KEY (`acc_pessoa_id`) REFERENCES `acc_pessoa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `bsc_cidade`
--
ALTER TABLE `bsc_cidade`
  ADD CONSTRAINT `fk_bsc_cidade_bsc_estado1` FOREIGN KEY (`bsc_estado_id`) REFERENCES `bsc_estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `bsc_estado`
--
ALTER TABLE `bsc_estado`
  ADD CONSTRAINT `fk_bsc_estado_bsc_pais` FOREIGN KEY (`bsc_pais_id`) REFERENCES `bsc_pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `bsc_usuario_endereco`
--
ALTER TABLE `bsc_usuario_endereco`
  ADD CONSTRAINT `fk_bsc_usuario_endereco_bsc_cidade1` FOREIGN KEY (`bsc_cidade_id`) REFERENCES `bsc_cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bsc_usuario_endereco_bsc_tipo_endereco1` FOREIGN KEY (`bsc_tipo_endereco_id`) REFERENCES `bsc_tipo_endereco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bsc_usuario_endereco_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seg_log`
--
ALTER TABLE `seg_log`
  ADD CONSTRAINT `fk_seg_log_seg_sessao1` FOREIGN KEY (`seg_sessao_id`) REFERENCES `seg_sessao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seg_modulo_acao`
--
ALTER TABLE `seg_modulo_acao`
  ADD CONSTRAINT `fk_seg_modulo_has_seg_acao_seg_acao1` FOREIGN KEY (`seg_acao_id`) REFERENCES `seg_acao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seg_modulo_has_seg_acao_seg_modulo1` FOREIGN KEY (`seg_modulo_id`) REFERENCES `seg_modulo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seg_permissao`
--
ALTER TABLE `seg_permissao`
  ADD CONSTRAINT `fk_seg_permissao_seg_modulo_has_seg_acao1` FOREIGN KEY (`seg_modulo_has_seg_acao_id`) REFERENCES `seg_modulo_acao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seg_permissao_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seg_sessao`
--
ALTER TABLE `seg_sessao`
  ADD CONSTRAINT `fk_seg_sessao_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seg_usuario`
--
ALTER TABLE `seg_usuario`
  ADD CONSTRAINT `fk_seg_usuario_seg_usuario_status1` FOREIGN KEY (`seg_usuario_status_id`) REFERENCES `seg_usuario_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `seg_usuario_seguranca`
--
ALTER TABLE `seg_usuario_seguranca`
  ADD CONSTRAINT `fk_seg_usuario_seguranca_seg_usuario1` FOREIGN KEY (`seg_usuario_id`) REFERENCES `seg_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
