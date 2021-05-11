CREATE DATABASE db03
GO

USE db03
GO

--Tabela Cliente

CREATE TABLE cliente(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (50) NOT NULL,
	idade VARCHAR (2) NULL DEFAULT 18,
	telefone VARCHAR (10) NOT NULL,
	rg VARCHAR (15) NOT NULL,
	cpf VARCHAR (15) NOT NULL,
	data_nasc DATE NOT NULL,
	endereco VARCHAR (60) NOT NULL,
	forma_pag VARCHAR (20) NOT NULL,
	PRIMARY KEY (id)
)
GO

--Tabela Dependente (o dependente possui um cliente)
CREATE TABLE dependente(
	id INT NOT NULL IDENTITY,
	id_cliente INT NOT NULL,
	nome VARCHAR (50) NOT NULL,
	sexo VARCHAR (1) NOT NULL,
	relacao VARCHAR (10) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK_DEPEN_CLIENTE FOREIGN KEY (id_cliente) REFERENCES cliente(id)
)
GO

--Tabela Funcionário

CREATE TABLE funcionario(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (50) NOT NULL,
	rg VARCHAR (15) NOT NULL,
	cpf VARCHAR (15) NOT NULL,
	telefone VARCHAR (10) NOT NULL,
	endereco VARCHAR (60) NOT NULL,
	email VARCHAR (20) NOT NULL,
	salario MONEY NOT NULL,
	PRIMARY KEY (id)
)
GO

--Tabela Gibis (produtos)

CREATE TABLE gibis(
	id INT NOT NULL IDENTITY,
	titulo VARCHAR (30) NOT NULL,
	descricao VARCHAR (25) NOT NULL,
	quantidade INT NULL DEFAULT 1,
	tipo VARCHAR (10) NOT NULL,
	PRIMARY KEY (id)
)
GO

--Tabela Gerente

CREATE TABLE gerente(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (50) NOT NULL,
	PRIMARY KEY (id)
)
GO

--Tabela Fornecedor

CREATE TABLE fornecedor(
	id INT NOT NULL IDENTITY,
	situação VARCHAR(30) NOT NULL,
	data_entrega DATE NOT NULL,
	data_pedido DATE NOT NULL,
	valor MONEY NOT NULL,
	id_gibis INT NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK_FORNECEDOR_GIBIS FOREIGN KEY (id_gibis) REFERENCES gibis(id)
)
GO	

--Tabela Contato-fornecedor

CREATE TABLE contato_f(
	id INT NOT NULL IDENTITY,
	id_fornecedor INT NOT NULL,
	nome VARCHAR (50) NOT NULL,
	cnpj VARCHAR (10) NOT NULL,
	telefone VARCHAR (10) NOT NULL,
	descricao VARCHAR (30) NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK_CONTATO_FORNECEDOR FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
)
GO

--Tabela Compra

CREATE TABLE compra(
	id INT NOT NULL IDENTITY,
	filme VARCHAR (20) NOT NULL,
	anime VARCHAR (20) NOT NULL,
	serie VARCHAR (20) NOT NULL,
	cupom INT NOT NULL,
	id_cliente INT NOT NULL,  --chave estrangeira da tabela cliente
	id_funcionario INT NOT NULL,  --chave estrangeira da tabela funcionario
	id_gibis INT NOT NULL,  --chave estrangeira da tabela produtos (gibis)
	id_gerente INT NOT NULL,  --chave estrangeira da tabela gerente
	PRIMARY KEY (id),
	CONSTRAINT FK_COMPRA_CLIENTE FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	CONSTRAINT FK_COMPRA_FUNCIONARIO FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
	CONSTRAINT FK_COMPRA_GIBIS FOREIGN KEY (id_gibis) REFERENCES gibis(id),
	CONSTRAINT FK_COMPRA_GERENTE FOREIGN KEY (id_gerente) REFERENCES gerente(id)
)
GO