-- Atividade de Fixação Funções de Agregação e Joins

use db05
go

select * from cliente
select * from aluguel

--adicionando mais um registro de aluguel
insert into aluguel (numero, id_cliente, id_funcionario, id_veiculo, data, total, desconto)
values(110, 2, 1, 3, '2021-05-15', 560, 10)
go

-- Questão 1 - Exiba o nome e cpf dos clientes que realizaram mais de 3 alugueis.	(correta)

select cli.nome as 'Nome do cliente', cli.cpf as 'CPF do cliente', count(*) as 'Quantidade de locações'
from aluguel alu
Inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome, cli.cpf
having count(*) > 3
go

-- Questão 2 - Exiba o veículo que foi mais locado no mês de Maio.

select vei.tipo as 'Veiculo', count(*) as 'Locações em Maio'
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
where month(alu.data) = '05'
group by vei.tipo
order by [Locações em Maio] desc
go

-- Questão 3 - Exiba o nome de todos os clientes que nunca realizaram uma locação.  ***

select cli.nome, alu.data
from cliente cli
left join aluguel alu on alu.id_cliente = cli.id
where alu.data is null
go

-- Questão 4 - Exiba todos os veículos que nunca foram alugados.  ***

select vei.marca, alu.data
from veiculo vei
left join aluguel alu on alu.id_veiculo = vei.id
where alu.data is null

-- Questão 5 - Exiba o total de veículos alugados no no mês de Maio.

select count(id_veiculo) as 'Total de veiculos em Maio'
from aluguel alu
where month(alu.data) = '05'
go

-- Questão 6 - Exiba o total de locações por veiculo.

select alu.id_veiculo, count(*) as 'Total'
from aluguel alu
group by alu.id_veiculo  
go

-- Questão 7 - Exiba o nome de todos os clientes que realizaram ou não uma locação.

select cli.nome, alu.data
from cliente cli
left join aluguel alu on alu.id_cliente = cli.id
go

-- Questão 8 - Exiba o grupo de todos os veículos que foram alugados ou não.

select mo.grupo, alu.data as 'Grupo de veiculos'
from veiculo vei
left join aluguel alu on alu.id_veiculo = vei.id
inner join modelo mo on mo.id = vei.id_modeloveiculo
go

-- Questão 9 - Exiba o total de alugueis por cliente.

select cli.nome, count(*) as 'Total'
from cliente cli
inner join aluguel alu on alu.id_cliente = cli.id
group by cli.nome
go

-- Questão 10 - Qual a soma de alugueis por veiculo.

select vei.id, sum(alu.total) as 'Soma dos alugueis por veiculo'
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
group by vei.id
go

-- Questão 11 - Qual a soma dos alugueis por cliente.

select cli.nome, sum(alu.total) as 'Soma dos alugueis por cliente'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome
go

-- Questão 12 -  Qual funcionario realizou mais alugueis no ano atual.

select top(1) fun.id, count(alu.data) as 'Realizou mais aluguel em 2021'
from aluguel alu
inner join funcionario fun on fun.id = alu.id_funcionario
where year (alu.data) = '2021'
group by fun.id
order by [Realizou mais aluguel em 2021] desc
go

--ou
/*
select top(1) fun.id, count(alu.data) as 'Realizou mais aluguel em 2021'
from aluguel alu
inner join funcionario fun on fun.id = alu.id_funcionario
where year (alu.data) = year(GETDATE()) --GETDATE => pega a data atual do sistema mas apenas o ano.
group by fun.id
order by [Realizou mais aluguel em 2021] desc
go
*/

-- Questão 13 - Exiba o total de alugueis realizados por cliente, onde o total seja maior que 2.

select cli.nome 'Nome do Cliente', count(*) as 'Total maior que 2' 
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome
having count(*) > 2
go

-- Questão 14 - Exiba a marca de todos os veículos que foram alugados ou não.

select marca as 'Marca de todos veiculos', alu.data
from veiculo vei
left join aluguel alu on alu.id_veiculo = vei.id
go