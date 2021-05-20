-- Atividade de Fixa��o Fun��es de Agrega��o e Joins

use db05
go

select * from cliente
select * from aluguel

--adicionando mais um registro de aluguel
insert into aluguel (numero, id_cliente, id_funcionario, id_veiculo, data, total, desconto)
values(110, 2, 1, 3, '2021-05-15', 560, 10)
go

-- Quest�o 1 - Exiba o nome e cpf dos clientes que realizaram mais de 3 alugueis.	(correta)

select cli.nome as 'Nome do cliente', cli.cpf as 'CPF do cliente', count(*) as 'Quantidade de loca��es'
from aluguel alu
Inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome, cli.cpf
having count(*) > 3
go

-- Quest�o 2 - Exiba o ve�culo que foi mais locado no m�s de Maio.

select vei.tipo as 'Veiculo', count(*) as 'Loca��es em Maio'
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
where month(alu.data) = '05'
group by vei.tipo
order by [Loca��es em Maio] desc
go

-- Quest�o 3 - Exiba o nome de todos os clientes que nunca realizaram uma loca��o.  ***

select cli.nome, alu.data
from cliente cli
left join aluguel alu on alu.id_cliente = cli.id
where alu.data is null
go

-- Quest�o 4 - Exiba todos os ve�culos que nunca foram alugados.  ***

select vei.marca, alu.data
from veiculo vei
left join aluguel alu on alu.id_veiculo = vei.id
where alu.data is null

-- Quest�o 5 - Exiba o total de ve�culos alugados no no m�s de Maio.

select count(id_veiculo) as 'Total de veiculos em Maio'
from aluguel alu
where month(alu.data) = '05'
go

-- Quest�o 6 - Exiba o total de loca��es por veiculo.

select alu.id_veiculo, count(*) as 'Total'
from aluguel alu
group by alu.id_veiculo  
go

-- Quest�o 7 - Exiba o nome de todos os clientes que realizaram ou n�o uma loca��o.

select cli.nome, alu.data
from cliente cli
left join aluguel alu on alu.id_cliente = cli.id
go

-- Quest�o 8 - Exiba o grupo de todos os ve�culos que foram alugados ou n�o.

select mo.grupo, alu.data as 'Grupo de veiculos'
from veiculo vei
left join aluguel alu on alu.id_veiculo = vei.id
inner join modelo mo on mo.id = vei.id_modeloveiculo
go

-- Quest�o 9 - Exiba o total de alugueis por cliente.

select cli.nome, count(*) as 'Total'
from cliente cli
inner join aluguel alu on alu.id_cliente = cli.id
group by cli.nome
go

-- Quest�o 10 - Qual a soma de alugueis por veiculo.

select vei.id, sum(alu.total) as 'Soma dos alugueis por veiculo'
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
group by vei.id
go

-- Quest�o 11 - Qual a soma dos alugueis por cliente.

select cli.nome, sum(alu.total) as 'Soma dos alugueis por cliente'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome
go

-- Quest�o 12 -  Qual funcionario realizou mais alugueis no ano atual.

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

-- Quest�o 13 - Exiba o total de alugueis realizados por cliente, onde o total seja maior que 2.

select cli.nome 'Nome do Cliente', count(*) as 'Total maior que 2' 
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome
having count(*) > 2
go

-- Quest�o 14 - Exiba a marca de todos os ve�culos que foram alugados ou n�o.

select marca as 'Marca de todos veiculos', alu.data
from veiculo vei
left join aluguel alu on alu.id_veiculo = vei.id
go