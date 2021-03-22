	CREATE DATABASE aula01DB;
	GO --para rodar o código no SGBD

	USE aula01DB --para usar a conexão do banco de dados
	GO	

	--DDL
	--Tabela Clinete
	CREATE TABLE cliente(
		id INT NOT NULL IDENTITY, --identity => mesma coisa que o auto_increment
		nome VARCHAR (100) NOT NULL,
		cpf BIGINT NOT NULL,  --bigint => inteiro grande
		idade SMALLINT NULL DEFAULT 18,  --smallint => inteiro pequeno| default => insere um padrão
		PRIMARY KEY (id)  --chave primária da tabela cliente é id
	)
	GO

	--DML
	INSERT INTO cliente(nome, cpf)  --insere na tabela cliente, nas colunas nome e cpf
	VALUES('Eric', 84939492475)		--os seguintes valores...

	SELECT * FROM cliente  --mostra o resultado das manipulações

	--Tabela Produto

	CREATE TABLE produto(
		id INT NOT NULL IDENTITY,
		descricao VARCHAR (100) NOT NULL,
		quantidade INT NULL DEFAULT 1,  --padrão 1
		valor SMALLMONEY NOT NULL,  -- smallmoney => tipo específico para dinheiro
		PRIMARY KEY (id)
	)
	GO

	--Tabela Funcionário

	CREATE TABLE funcionario(
		id INT NOT NULL IDENTITY,
		nome VARCHAR(100) NOT NULL,
		cpf BIGINT NOT NULL,
		PRIMARY KEY (id)
	)
	GO

	--Tabela Vendas

	CREATE TABLE vendas(
		id INT NOT NULL IDENTITY,
		id_cliente INT NOT NULL,	--Chave estrangeira da tabela cliente
		id_funcionario INT NOT NULL,	--Chave estrangeira da tabela funcionario
		id_produto INT NOT NULL,	--Chave estrangeira da tabela produto
		descricao VARCHAR (100) NULL,
		data_venda DATE NOT NULL,  --DATE, DATETIME, TIME(apenas para horário)
		quantidade INT NULL DEFAULT 1,  --padrão 1
		PRIMARY KEY (id),
		CONSTRAINT FK_VENDAS_CLIENTE FOREIGN KEY (id_cliente) REFERENCES cliente(id),	--constraint => rotular, references => vem de qual tabela?
		CONSTRAINT FK_VENDAS_FUNCIONARIO FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
		CONSTRAINT FK_VENDAS_PRODUTO FOREIGN KEY (id_produto) REFERENCES produto(id)
	)
	GO
	
	--DROP => EXCLUIR DADOS

	DROP TABLE NOMEDATABELA
	DROP DATABASE NOMEDOBANCO

	--ALTER => ALTERAR DADOS

	ALTER TABLE cliente ADD telefone VARCHAR(20) NULL  --ADD => adiciona um novo atributo a uma tabela
	ALTER TABLE cliente ALTER COLUMN telefone BIGINT  --ALTER COLUMN => altera o tipo de dado do atributo na tabela
	ALTER TABLE cliente DROP COLUMN telefone  --DROP COLUMN => apaga a coluna na tabela

	ALTER TABLE cliente ADD CONSTRAINT ValidaIdade CHECK (idade >= 18)  --ADD CONSTRAINT => cria uma regra do tipo check na tabela
	ALTER TABLE cliente DROP CONSTRAINT ValidaIdade	 --DROP CONSTRAINT => apaga a regra criada



