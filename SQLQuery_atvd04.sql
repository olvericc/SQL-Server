--PARTE 1
-- Criando o banco de dados
CREATE DATABASE atvd03DB
GO
-- Usando o banco de dados
USE atvd03DB
GO
-- Tabela funcionário
CREATE TABLE funcionario(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (45) NOT NULL,
	carteiraTrabalho INT NOT NULL,
	dataContratacao DATE NOT NULL,
	salario FLOAT NOT NULL,
	PRIMARY KEY (id)
)
GO
-- Tabela função
CREATE TABLE funcao(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (45) NOT NULL,
	PRIMARY KEY (id)
)
GO
-- Tabela horario
CREATE TABLE horario(
	id INT NOT NULL IDENTITY,
	horario TIME NOT NULL,
	PRIMARY KEY (id)
)
GO
-- Tabela horario_trabalho_funcionario
CREATE TABLE htf(
	id INT NOT NULL IDENTITY,
	id_horario INT NOT NULL,	--FK HORARIO
	id_funcionario INT NOT NULL,	--FK FUNCIONARIO
	id_funcao INT NOT NULL,		--FK FUNCAO
	PRIMARY KEY (id),
	CONSTRAINT FK_HTF_HORARIO FOREIGN KEY (id_horario) REFERENCES horario(id),
	CONSTRAINT FK_HTF_FUNCIONARIO FOREIGN KEY (id_funcionario) REFERENCES funcionario(id),
	CONSTRAINT FK_HTF_FUNCAO FOREIGN KEY (id_funcao) REFERENCES funcao(id)
)
GO
--Tabela sala
CREATE TABLE sala(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (45) NOT NULL,
	capacidade INT NOT NULL,
	PRIMARY KEY (id)
)
GO
--Tabela diretor
CREATE TABLE diretor(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (45) NOT NULL,
	PRIMARY KEY (id)
)
GO
--Tabela genero
CREATE TABLE genero(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (45) NOT NULL,
	PRIMARY KEY (id)
)
GO
--Tabela filme
CREATE TABLE filme(
	id INT NOT NULL IDENTITY,
	nomeBR VARCHAR (45) NOT NULL,
	nomeEN VARCHAR (45) NOT NULL,
	anoLancamento INT NOT NULL,
	sinopse TEXT NOT NULL,
	id_diretor INT NOT NULL,	--FK DIRETOR
	id_genero INT NOT NULL,		--FK GENERO
	PRIMARY KEY (id),
	CONSTRAINT FK_FILME_DIRETOR FOREIGN KEY (id_diretor) REFERENCES diretor(id),
	CONSTRAINT FK_FILME_GENERO FOREIGN KEY (id_genero) REFERENCES genero(id)
)
GO
--Tabela filme_exibido_sala
CREATE TABLE fes(
	id INT NOT NULL IDENTITY,
	id_filme INT NOT NULL,	--FK FILME
	id_sala INT NOT NULL,	--FK SALA
	id_horario INT NOT NULL,	--FK HORARIO
	PRIMARY KEY (id),
	CONSTRAINT FK_FES_FILME FOREIGN KEY (id_filme) REFERENCES filme(id),
	CONSTRAINT FK_FES_SALA FOREIGN KEY (id_sala) REFERENCES sala(id),
	CONSTRAINT FK_FES_HORARIO FOREIGN KEY (id_horario) REFERENCES horario(id)
)
GO
--Tabela premiacao
CREATE TABLE premiacao(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (45) NOT NULL,
	ano BIGINT NOT NULL,
	PRIMARY KEY (id)
)
GO
--Tabela filme_has_premiacao
CREATE TABLE fhp(
	id INT NOT NULL IDENTITY,
	ganhou INT NOT NULL,
	id_filme INT NOT NULL,
	id_premiacao INT NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK_FHP_FILME FOREIGN KEY (id_filme) REFERENCES filme(id),
	CONSTRAINT FK_FHP_PREMIACAO FOREIGN KEY (id_premiacao) REFERENCES premiacao(id)
)
GO
--PARTE 2
--questão 2
ALTER TABLE funcionario ADD idade SMALLINT NOT NULL
ALTER TABLE funcionario ADD CONSTRAINT ValidaIdade CHECK (idade<18)
--questão 3
--Tabela dependente
CREATE TABLE dependente(
	id INT NOT NULL IDENTITY,
	nome VARCHAR (45) NOT NULL,
	idade SMALLINT NOT NULL,
	id_funcionario INT NOT NULL,
	PRIMARY KEY (id),
	CONSTRAINT FK_DEPENDENTE_FUNCIONARIO FOREIGN KEY (id_funcionario) REFERENCES funcionario(id)
)
GO
--questão 4
ALTER TABLE diretor ADD sexo VARCHAR (1) NOT NULL
--questão 5
ALTER TABLE diretor DROP COLUMN sexo
--questão 6 
ALTER TABLE fhp DROP CONSTRAINT FK_FHP_PREMIACAO
DROP TABLE premiacao
--questão 7
ALTER TABLE filme ADD quantidade INT NULL DEFAULT 30