--Atividade de fixação DDL (ALTER E DROP)

--questão 1
ALTER TABLE cliente ADD sexo VARCHAR (1) NULL
--questão 2
CREATE TABLE dependente(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (20) NOT NULL,
	PRIMARY KEY (id)
)
GO
ALTER TABLE dependente ADD idade SMALLINT NOT NULL
--questão 3
ALTER TABLE dependente ADD CONSTRAINT ValidaIdade CHECK (idade<15)
--questão 4
CREATE TABLE copia(
	id INT NOT NULL IDENTITY,
)
GO
DROP TABLE copia
--questão 5
CREATE TABLE dependente2(
	id INT NOT NULL IDENTITY,
	id_cliente INT NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK_DEPENDENTE FOREIGN KEY (id_cliente) REFERENCES cliente(id)
)
GO
--questão 6
ALTER TABLE cliente ADD saldo MONEY NOT NULL
ALTER TABLE cliente DROP COLUMN saldo