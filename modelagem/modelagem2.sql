-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 20/09/2024 às 19:36
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
  `siglaEstado` char(2) DEFAULT NULL
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
  `tipo` char(1) DEFAULT NULL,
  `dataCadastro` date DEFAULT (curdate()),
  `cep` char(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clienteFisico`
--

CREATE TABLE `clienteFisico` (
  `codCliente` int NOT NULL,
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
  `codCliente` int NOT NULL,
  `nomeFantasia` varchar(80) DEFAULT NULL,
  `razaoSocial` varchar(80) NOT NULL,
  `IE` varchar(20) NOT NULL,
  `CGC` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contasPagar`
--

CREATE TABLE `contasPagar` (
  `codTitulo` int NOT NULL,
  `dataVencimento` date NOT NULL,
  `parcela` int DEFAULT NULL,
  `codPedido` int DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `localPagamento` varchar(80) DEFAULT NULL,
  `juros` float DEFAULT NULL,
  `correcaoMonetaria` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contasReceber`
--

CREATE TABLE `contasReceber` (
  `codTitulo` int NOT NULL,
  `dataVencimento` date NOT NULL,
  `codVenda` int NOT NULL,
  `parcela` int DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `localPagamento` varchar(80) DEFAULT NULL,
  `juros` float DEFAULT NULL,
  `correcaoMonetaria` float DEFAULT NULL
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
  `siglaEstado` varchar(2) NOT NULL,
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
  `codPedido` int NOT NULL,
  `codProduto` int DEFAULT NULL,
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
  `unidadeMedida` char(2) DEFAULT NULL,
  `embalagem` varchar(15) DEFAULT 'Fardo',
  `codClasse` int DEFAULT NULL,
  `precoVenda` float DEFAULT NULL,
  `estoqueMinimo` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtoLote`
--

CREATE TABLE `produtoLote` (
  `codProduto` int DEFAULT NULL,
  `numeroLote` int NOT NULL,
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
  `codVenda` int NOT NULL,
  `codCliente` int DEFAULT NULL,
  `codVendedor` int DEFAULT NULL,
  `dataVenda` date DEFAULT (curdate()),
  `enderecoEntrega` varchar(60) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `codVendedor` int NOT NULL,
  `nome` varchar(60) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
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
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `siglaEstado` (`siglaEstado`);

--
-- Índices de tabela `classe`
--
ALTER TABLE `classe`
  ADD PRIMARY KEY (`codClasse`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCliente`),
  ADD KEY `codCidade` (`codCidade`);

--
-- Índices de tabela `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD PRIMARY KEY (`codCliente`),
  ADD UNIQUE KEY `razaoSocial` (`razaoSocial`),
  ADD UNIQUE KEY `IE` (`IE`),
  ADD UNIQUE KEY `CGC` (`CGC`),
  ADD UNIQUE KEY `nomeFantasia` (`nomeFantasia`);

--
-- Índices de tabela `contasPagar`
--
ALTER TABLE `contasPagar`
  ADD PRIMARY KEY (`codTitulo`),
  ADD KEY `codPedido` (`codPedido`);

--
-- Índices de tabela `contasReceber`
--
ALTER TABLE `contasReceber`
  ADD PRIMARY KEY (`codTitulo`),
  ADD KEY `codVenda` (`codVenda`);

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
  ADD PRIMARY KEY (`siglaEstado`),
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
-- Índices de tabela `itemVenda`
--
ALTER TABLE `itemVenda`
  ADD PRIMARY KEY (`codPedido`),
  ADD KEY `codProduto` (`codProduto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`codPedido`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codProduto`),
  ADD KEY `codClasse` (`codClasse`);

--
-- Índices de tabela `produtoLote`
--
ALTER TABLE `produtoLote`
  ADD PRIMARY KEY (`numeroLote`),
  ADD KEY `codProduto` (`codProduto`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`codVenda`),
  ADD KEY `codCliente` (`codCliente`),
  ADD KEY `codVendedor` (`codVendedor`);

--
-- Índices de tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`codVendedor`),
  ADD KEY `codCidade` (`codCidade`),
  ADD KEY `codDepartamento` (`codDepartamento`);

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

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `cidade`
--
ALTER TABLE `cidade`
  ADD CONSTRAINT `cidade_ibfk_1` FOREIGN KEY (`siglaEstado`) REFERENCES `estado` (`siglaEstado`);

--
-- Restrições para tabelas `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`);

--
-- Restrições para tabelas `clienteFisico`
--
ALTER TABLE `clienteFisico`
  ADD CONSTRAINT `clienteFisico_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`);

--
-- Restrições para tabelas `clienteJuridico`
--
ALTER TABLE `clienteJuridico`
  ADD CONSTRAINT `clienteJuridico_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`);

--
-- Restrições para tabelas `contasPagar`
--
ALTER TABLE `contasPagar`
  ADD CONSTRAINT `contasPagar_ibfk_1` FOREIGN KEY (`codPedido`) REFERENCES `pedido` (`codPedido`);

--
-- Restrições para tabelas `contasReceber`
--
ALTER TABLE `contasReceber`
  ADD CONSTRAINT `contasReceber_ibfk_1` FOREIGN KEY (`codVenda`) REFERENCES `venda` (`codVenda`);

--
-- Restrições para tabelas `itemVenda`
--
ALTER TABLE `itemVenda`
  ADD CONSTRAINT `itemVenda_ibfk_1` FOREIGN KEY (`codPedido`) REFERENCES `pedido` (`codPedido`),
  ADD CONSTRAINT `itemVenda_ibfk_2` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`);

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codClasse`) REFERENCES `classe` (`codClasse`);

--
-- Restrições para tabelas `produtoLote`
--
ALTER TABLE `produtoLote`
  ADD CONSTRAINT `produtoLote_ibfk_1` FOREIGN KEY (`codProduto`) REFERENCES `produto` (`codProduto`);

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`codCliente`) REFERENCES `cliente` (`codCliente`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`codVendedor`) REFERENCES `vendedor` (`codVendedor`);

--
-- Restrições para tabelas `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`codCidade`) REFERENCES `cidade` (`codCidade`),
  ADD CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`codDepartamento`) REFERENCES `departamento` (`codDepartamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
