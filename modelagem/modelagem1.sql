-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 20/09/2024 às 17:09
-- Versão do servidor: 9.0.1
-- Versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `modelagem1`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `codCidade` int NOT NULL,
  `nome` varchar(50) NOT NULL,
  `siglaEstado` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `classe`
--

CREATE TABLE `classe` (
  `codClasse` int NOT NULL,
  `sigla` varchar(12) DEFAULT NULL,
  `nome` varchar(40) NOT NULL,
  `descricao` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCliente` int NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `codCidade` int NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `tipo` varchar(1) DEFAULT NULL,
  `dataCadastro` date DEFAULT (curdate()),
  `cep` varchar(8) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteFisico`
--

CREATE TABLE `clienteFisico` (
  `codCliente` int DEFAULT NULL,
  `nome` varchar(50) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(11) NOT NULL,
  `rg` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteJuridico`
--

CREATE TABLE `clienteJuridico` (
  `codCliente` int DEFAULT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `IE` varchar(20) NOT NULL,
  `CGC` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `codDepartamento` int NOT NULL,
  `nome` varchar(40) NOT NULL,
  `descricaoFuncional` varchar(80) DEFAULT NULL,
  `localizacao` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `siglaEstado` varchar(2) DEFAULT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `codFornecedor` int DEFAULT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `IE` varchar(20) NOT NULL,
  `CGC` varchar(20) NOT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemPedido`
--

CREATE TABLE `itemPedido` (
  `codPedido` int DEFAULT NULL,
  `codProduto` int DEFAULT NULL,
  `quantidade` float NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemVenda`
--

CREATE TABLE `itemVenda` (
  `codVenda` int DEFAULT NULL,
  `codProduto` int DEFAULT NULL,
  `numeroLote` int DEFAULT NULL,
  `quantidade` float NOT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `codPedido` int NOT NULL,
  `dataRealizacao` date DEFAULT (curdate()),
  `dataEntrega` date DEFAULT NULL,
  `codFornecedor` int DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codProduto` int NOT NULL,
  `descricao` varchar(40) NOT NULL,
  `unidadeMedida` varchar(2) DEFAULT NULL,
  `embalagem` varchar(15) DEFAULT 'Fardo',
  `codClasse` int DEFAULT NULL,
  `precoVenda` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtoLote`
--

CREATE TABLE `produtoLote` (
  `codProduto` int DEFAULT NULL,
  `numeroLote` int DEFAULT NULL,
  `quantidadeAdquirida` float DEFAULT NULL,
  `quantidadeVendida` float DEFAULT NULL,
  `precoCusto` float DEFAULT NULL,
  `dataValidade` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `codVenda` int DEFAULT NULL,
  `codCliente` int DEFAULT NULL,
  `codVendedor` int DEFAULT NULL,
  `dataVenda` date DEFAULT (curdate()),
  `enderecoEntrega` varchar(60) DEFAULT NULL,
  `statusEntrega` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `codVendedor` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNasciemnto` date DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `codCidade` int DEFAULT NULL,
  `dataContratacao` date DEFAULT (curdate()),
  `codDepartamento` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`codCidade`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`codClasse`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCliente`);

--
-- Índices de tabela `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `IE` (`IE`),
  ADD UNIQUE KEY `CGC` (`CGC`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`);

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codDepartamento`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `IE` (`IE`),
  ADD UNIQUE KEY `CGC` (`CGC`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codPedido`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codProduto`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`codVendedor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `codCidade` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `classe`
--
ALTER TABLE `classe`
  MODIFY `codClasse` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCliente` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `codDepartamento` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `codPedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codProduto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `codVendedor` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
