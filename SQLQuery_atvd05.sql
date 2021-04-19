USE atvd03DB
GO

select * from funcionario
-- APAGANDO TODOS OS DADOS DA TABELA USANDO -TRUNCATE TABLE-
ALTER TABLE htf DROP CONSTRAINT FK_HTF_FUNCIONARIO
ALTER TABLE dependente DROP CONSTRAINT FK_DEPENDENTE_FUNCIONARIO
TRUNCATE TABLE funcionario	--truncate => apaga todos os dados da tabela, incluindo id

--INSERINDO REGISTROS

INSERT INTO funcionario (nome, carteiraTrabalho, dataContratacao, salario, idade)
VALUES ('Maria', 1255, '2021-04-12', 650.00, 19)
GO
INSERT INTO funcionario (nome, carteiraTrabalho, dataContratacao, salario, idade)
VALUES ('Arnaldo', 1266, '2021-04-11', 980.00, 23)
GO
INSERT INTO funcionario (nome, carteiraTrabalho, dataContratacao, salario, idade)
VALUES ('Mateus', 1277, '2021-04-10', 720.00, 20)
GO
INSERT INTO funcionario (nome, carteiraTrabalho, dataContratacao, salario, idade)
VALUES ('Fernanda', 1288, '2021-04-09', 1200.00, 18)
GO
SELECT * FROM funcionario

--QUESTÃO 1 
SELECT * FROM funcionario
WHERE id BETWEEN 1 AND 4
GO
--QUESTÃO 2
SELECT carteiraTrabalho, nome FROM funcionario
WHERE salario NOT BETWEEN 1000 AND 3000		--not between => fora do intervalo
GO
--Ou usamos
SELECT nome, carteiraTrabalho FROM funcionario
WHERE salario <> 1000 & 3000	--cuidado!!!! (melhor trabalhar com a sintaxe completa)
GO
--QUESTÃO 3
SELECT nome, dataContratacao FROM funcionario 
WHERE nome LIKE 'Mar%' 
GO
--QUESTÃO 4
SELECT carteiraTrabalho, nome, dataContratacao FROM funcionario
WHERE id IN (1, 2, 3)
GO
--QUESTÃO 5
SELECT carteiraTrabalho, nome, dataContratacao FROM funcionario
WHERE id NOT IN (1, 2, 3)
GO
--QUESTÃO 6

SELECT nomeBR, id FROM filme
WHERE id = 1 AND nomeBR = 'LagoAzul'
GO

--QUESTÃO 7 
SELECT id, nomeBR FROM filme
WHERE id= 2 OR nomeBR = 'Quebrando Regras 3'
GO

--QUESTÃO 8
SELECT nome, capacidade FROM sala
WHERE capacidade >= 10 AND capacidade <= 50
GO

--QUESTÃO 9
SELECT * FROM filme
WHERE nomeEN IS NULL
GO

--QUESTÃO 10
SELECT * FROM filme
WHERE nomeEN IS NOT NULL
GO