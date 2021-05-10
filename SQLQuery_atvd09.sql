-- Atividade de Fixação Funções de Agregação e Joins

use db05
go

select * from cliente
select * from aluguel

--adicionando mais um registro de aluguel
insert into aluguel (numero, id_cliente, id_funcionario, id_veiculo, data, total, desconto)
values(110, 2, 1, 3, '2021-05-15', 560, 10)
go

-- Questão 1 - Exiba o nome e cpf dos clientes que realizaram mais de 3 alugueis.

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
order by [Locações em Maio] asc
go

-- Questão 3 - Exiba o nome de todos os clientes que nunca realizaram uma locação.  ***

select cli.nome as 'Nome do cliente', count(cli.id) as 'Quantidades de Locações'
from aluguel alu
left join cliente cli on cli.id = alu.id_cliente
group by cli.nome
having count(cli.id) < 1
go

-- Questão 4 - Exiba todos os veículos que nunca foram alugados.  ***

-- Questão 5 - Exiba o total de veículos alugados no no mês de Maio.

select sum(id_veiculo) as 'Total de veiculos em Maio'
from aluguel alu
where month(alu.data) = '05'
go

-- Questão 6 - Exiba o total de locações por veiculo.

