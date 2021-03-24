CREATE DATABASE atvd01DB
GO

--Tabela Cliente

CREATE TABLE cliente(
	id INT NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL,
	rg BIGINT NOT NULL,
	cpf BIGINT NOT NULL,
	endereco VARCHAR (150) NOT NULL,
	telefone VARCHAR (15) NOT NULL,
	data_nasc DATE NOT NULL,
	bonus INT NOT NULL,
	PRIMARY KEY (id)
)
GO

--Tabela Funcionário

CREATE TABLE funcionario(
	id INT NOT NULL IDENTITY,
	nome VARCHAR(50) NOT NULL,
	codigo SMALLINT NOT NULL,
	telefone VARCHAR (15) NOT NULL,
	PRIMARY KEY (id)
)
GO 

--Tabela Produto

CREATE TABLE produto(
	id INT NOT NULL IDENTITY,
	descricao VARCHAR (50) NULL,	--nome => descricao
	quantidade INT NULL DEFAULT 1,	--se não for registrado quantidade, por padrão terá 1.
	preco SMALLMONEY NOT NULL,		--preço ou valor...
	--não acho necessário ter total por conta da 3FN (normalização de dados).
	PRIMARY KEY (id)
)
GO

ALTER TABLE produto ADD codigo SMALLINT NOT NULL  --adicionei a coluna codigo na tabela produto

--Tabela Compra

CREATE TABLE compra(
	id INT NOT NULL IDENTITY,
	nome_cliente VARCHAR (50) NOT NULL,
	cpf_cliente BIGINT NOT NULL,
	nome_funcionario VARCHAR (50) NOT NULL,
	codigo_funcionario SMALLINT NOT NULL,
	id_cliente INT NOT NULL, --FK da tabela cliente
	id_funcionario INT NOT NULL, --FK da tabela funcionário
	id_produto INT NOT NULL,  --FK da tabela produto
	PRIMARY KEY (id),
	CONSTRAINT FK_COMPRA_CLIENTE FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	CONSTRAINT FK_COMPRA_FUNCIONARIO FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
	CONSTRAINT FK_COMPRA_PRODUTO FOREIGN KEY (id_produto) REFERENCES produto(id)
)
GO