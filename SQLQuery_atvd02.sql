--Atividade de fixa��o DDL (ALTER E DROP)

--quest�o 1
ALTER TABLE cliente ADD sexo VARCHAR (1) NULL
--quest�o 2
CREATE TABLE dependente(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (20) NOT NULL,
	PRIMARY KEY (id)
)
GO
ALTER TABLE dependente ADD idade SMALLINT NOT NULL
--quest�o 3
ALTER TABLE dependente ADD CONSTRAINT ValidaIdade CHECK (idade<15)
--quest�o 4
CREATE TABLE copia(
	id INT NOT NULL IDENTITY,
)
GO
DROP TABLE copia
--quest�o 5
CREATE TABLE dependente2(
	id INT NOT NULL IDENTITY,
	id_cliente INT NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK_DEPENDENTE FOREIGN KEY (id_cliente) REFERENCES cliente(id)
)
GO
--quest�o 6
ALTER TABLE cliente ADD saldo MONEY NOT NULL
ALTER TABLE cliente DROP COLUMN saldo