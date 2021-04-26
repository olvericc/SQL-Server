--AULA DIA 26-04-2021
use db05

select nome from cliente
order by nome desc			--order by -> ordenar, desc = decrescente

select idade from cliente	
order by idade asc			--ordey by, ordenar, asc = crescente ou ascendente

--Funções de Agregação
--SUM = soma, AVG = média, MAX = pegar o maior, MIN = pegar o menor

select sum(idade) as 'Total'
from cliente				--soma todas as idades do banco e somam na função sum()

select avg(idade) as 'Média'
from cliente				--calcula a média das idades do banco na função avg()

select max(id) as 'Maior'
from cliente				--pegar o maior ID do banco

select min(id) as 'Menor'
from cliente				--pegar o menor ID do banco

select count(id) as	'Total'		--count => serve para contar a quantidade de linhas existentes no banco
from cliente
go

--exemplo
select count(nome) as 'Total de nomes'
from cliente
go

--Funções de Agrupamento
-- juntar uma quantidade de elementos em um grupo
--select * from cliente
select idade, count(*) as 'Total de idades'
from cliente
group by idade		--função group by => separa em grupos determinada quantia de elementos
go

--inserindo outro cliente
insert into cliente (nome, cpf, codigo, idade, datanasc, telefone, cnh)
values ('Henrrique', 55783494, 959, 18, '26-04-2000', 71994456732, 6043845935)
go

select nome, idade, count(*)
from cliente
group by nome, idade
order by nome --por padrão o sql ordena em ascendente
go

--Having
select idade, sum(idade) as 'Total de idades'
from cliente
group by idade
having sum(idade) > 5		--having serve como filtro, 

--exemplo
select nome, id
from cliente
group by nome, id

select avg(distinct idade)		--apenas a  média das idades distintas
from cliente

select sum(distinct idade)		--apenas a somas idades distintas
from cliente

select sum(idade)				--soma com todas as idades
from cliente

-- Junções!!

select * from aluguel 
select * from cliente

--exemplo
select cli.nome as 'Cliente', fu.nome as 'Funcionario', alu.data, alu.total		--cli => apelido da tabela cliente
from aluguel alu							--alu => apelido da tabela aluguel
inner join cliente cli on cli.id = alu.id_cliente	--inner join => junta informações de duas ou mais tabelas
inner join funcionario fu on fu.id = alu.id_funcionario

--pk = fk

--todos os clientes que realizaram um aluguel...
select cli.nome, count(*) as 'Total'
from aluguel alu
inner join cliente cli	on cli.id = alu.id_cliente
group by cli.nome
having count(*) > 10

--!!!!!!!!!!!!!IMPORTANTE!!!!!!!!!!!!
--adicionando um dado, quando existe uma chave estrangeira
insert into aluguel(numero, id_cliente, id_funcionario, id_veiculo, data, total, desconto)
values(102, 4, 2, 1, '2021-04-26', 100, 25)
go
insert into aluguel(numero, id_cliente, id_funcionario, id_veiculo, data, total, desconto)
values(102, 1, 2, 1, '2021-04-26', 100, 25)
go
insert into aluguel(numero, id_cliente, id_funcionario, id_veiculo, data, total, desconto)
values(103, 6, 3, 3, '2021-04-26', 100, 25)
go
select * from cliente
select * from funcionario
select * from veiculo
select * from aluguel

--nome de todos os clientes que realizaram um aluguel...
select cli.nome
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente

--exemplo de soma
select cli.nome, alu.data, sum(alu.total) as 'Soma de alugueis'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
where alu.data between '01-04-2021' and '26-04-2021'
group by cli.nome, alu.data

--exemplo de média
select cli.nome, alu.data, avg(alu.total) as 'Média de alugueis'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
where alu.data between '01-04-2021' and '26-04-2021'
group by cli.nome, alu.data

--saber o veiculo com mais aluguel
select cli.nome, vei.marca,vei.tipo, count(*) as 'Quantidade'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
inner join veiculo vei on vei.id = alu.id_veiculo
group by cli.nome, vei.marca, vei.tipo
order by cli.nome asc
