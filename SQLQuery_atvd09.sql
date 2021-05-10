-- Atividade de Fixa��o Fun��es de Agrega��o e Joins

use db05
go

select * from cliente
select * from aluguel

--adicionando mais um registro de aluguel
insert into aluguel (numero, id_cliente, id_funcionario, id_veiculo, data, total, desconto)
values(110, 2, 1, 3, '2021-05-15', 560, 10)
go

-- Quest�o 1 - Exiba o nome e cpf dos clientes que realizaram mais de 3 alugueis.

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
order by [Loca��es em Maio] asc
go

-- Quest�o 3 - Exiba o nome de todos os clientes que nunca realizaram uma loca��o.  ***

select cli.nome as 'Nome do cliente', count(cli.id) as 'Quantidades de Loca��es'
from aluguel alu
left join cliente cli on cli.id = alu.id_cliente
group by cli.nome
having count(cli.id) < 1
go

-- Quest�o 4 - Exiba todos os ve�culos que nunca foram alugados.  ***

-- Quest�o 5 - Exiba o total de ve�culos alugados no no m�s de Maio.

select sum(id_veiculo) as 'Total de veiculos em Maio'
from aluguel alu
where month(alu.data) = '05'
go

-- Quest�o 6 - Exiba o total de loca��es por veiculo.

