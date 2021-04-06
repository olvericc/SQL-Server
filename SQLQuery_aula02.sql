USE aula01DB
GO

--USANDO O INSERT (INSERE UMA INFORMAÇÃO)
INSERT INTO funcionario (nome, cpf)  --primeiro método
VALUES ('Carol', '42390478376')
GO

INSERT INTO funcionario
VALUES ('Maria', '98742423398')		--segundo método
GO

INSERT INTO funcionario (cpf, nome)		--terceiro método
VALUES('74892384676', 'João')
GO
--visualizando
SELECT * FROM funcionario  --para visualizar a tabela com dados inseridos

--USANDO O UPDATE (ATUALIZA A INFORMAÇÃO)
UPDATE funcionario
	SET 
	nome = 'Pedro', 
	cpf = '94728364783'
	WHERE nome = 'João'

SELECT * FROM funcionario	--visualizando

--USANDO O DELETE (DELETANDO A INFORMAÇÃO)
DELETE FROM funcionario
WHERE id = 2 OR nome='Pedro'
--visualizando
SELECT * FROM funcionario

--ATIVIDADE DE FIXAÇÃO

USE atvd03DB
GO

--inserindo na tabela funcionario 2 registros
--1
INSERT INTO funcionario (nome, carteiraTrabalho, dataContratacao, salario, idade)
VALUES	('Gustavo', 6, '2021-04-06', 650.00, 20)
GO
--2
INSERT INTO funcionario (nome, carteiraTrabalho, dataContratacao, salario, idade)
VALUES ('Fernanda', 7, '2021-04-05', 900.00, 19)
GO
--visualizando
SELECT * FROM funcionario
--atualizando na tabela funcionario 1 registro
UPDATE funcionario
	SET
	nome = 'Carlos',
	carteiraTrabalho = 8,
	dataContratacao = '06/04/2021',
	salario = 600.00,
	idade = 21
	WHERE id = 2 --usei o ID ao invés do nome para atualizar um registro
GO
--visualizando
SELECT * FROM funcionario
--deletando na tabela funcionario 1 registro
DELETE FROM funcionario
WHERE id = 3 OR nome = 'Fernanda'
GO
SELECT * FROM funcionario

-- SELECT * FROM  * => TODAS AS COLUNAS SÃO EXIBIDAS NA TABELA 

SELECT nome, salario FROM funcionario  -- nesse caso, eu escolho as colunas para exibir

SELECT DISTINCT nome FROM funcionario  --mostra todos os <NOMES> diferentes/distintos

SELECT * FROM funcionario	--mostra de acordo com os operadores com a condicional WHERE
WHERE id < 6
-- operadores lógicos:  = < > >= <= <>

--BETWEEN => ENTRE

SELECT * FROM funcionario  --trabalha com intervalos
WHERE id BETWEEN 1 AND 20

SELECT * FROM funcionario		--negação
WHERE id NOT BETWEEN 1 AND 5

SELECT * FROM funcionario	--sem negação
WHERE id >= 1 AND id <= 6

SELECT * FROM funcionario 
WHERE nome LIKE 'Car%' --% no final, é referente ao início da palavra |  LIKE => selecionar ao meu gosto

SELECT * FROM funcionario
WHERE nome LIKE '%da'  --% no início, é referente ao final da palavra

SELECT * FROM funcionario
WHERE nome LIKE '%r%'  --% no inicio ou no fim, é referente a qualquer parte da palavra

SELECT * FROM funcionario
WHERE nome NOT LIKE '%o%'	--NOT LIKE => negação

SELECT * FROM funcionario
WHERE id IN (4, 5, 6)		--IN => trabalha com conjuntos (em uma lista)

SELECT * FROM funcionario
WHERE id NOT IN (4, 5, 6)		--NOT IN => negação

SELECT * FROM funcionario
WHERE id >= 5 AND nome = 'Fernanda'	--usando E (and)

SELECT * FROM funcionario
WHERE id >= 5 OR nome = 'Fernanda'	--usando OU (or)

SELECT id AS 'Código', nome AS 'Funcionário', salario AS 'Salário do mês' FROM funcionario -- AS => Apelidos, ideal para relatórios

