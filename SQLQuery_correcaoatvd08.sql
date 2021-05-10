--Correção da atividade locação

use db05
go

-- Questão 1 - qual a média dos salário dos funcionários

select avg(salario) as 'Média dos salários'
from funcionario
go
	
-- Questão 2 - qual o salário mais baixo e mais alto dos funcionários

select max(salario) as 'Salário mais alto', min(salario) as 'Salário mais baixo'
from funcionario
go

-- Questão 3 - quantos alugueis cada funcionário realizou

select fun.nome as 'Nome do funcionario', count(*) as 'Quantidade de alugueis'
from aluguel alu
inner join funcionario fun on fun.id = alu.id_funcionario
group by fun.nome
go	

-- Questão 4 - quantos funcionarios existem por idade

--select * from funcionario

select idade, count(*) as 'Quantidade por idade'
from funcionario
group by idade
go

-- Questão 5 - quantos descontos distintos existem por veiculo

select id_veiculo, count(distinct desconto) as 'Desconto'
from aluguel
group by id_veiculo
go

-- Questão 6 - quantos salários distintos existem na tabela funcionário

select count (distinct salario) as 'Salários distintos'
from funcionario
go

-- Questão 7 - listar o nome dos clientes, data do aluguel e modelo do veiculo alugado

select cli.nome, data, modelo.grupo as 'Modelo'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
inner join veiculo vei on vei.id = alu.id_veiculo	
inner join modelo on modelo.id = vei.id_modeloveiculo

-- Questão 8 - quantos clientes existem por idade

select idade, count(idade) as 'Quantidade de idades'
from cliente
group by idade
go

--	Questão 9 - qual o total de clientes cadastrados no banco de dads

select count(id) as 'Total de clientes'
from cliente
go

-- Questão 10 - qual total de veiculo por marca

select marca, count(*) as 'Total por marca'
from veiculo 
group by marca
go

--	Questão 11 - exiba o nome dos funcinarios que realizaram mais de duas locaçoes

select fun.nome, count(*) as 'Mais de 2 locações'
from aluguel alu
inner join funcionario fun on fun.id = alu.id_funcionario
group by fun.nome
having count(*) > 2
go

-- Questão 12 - exiba o nome dos clientes que locaram mais de dois veiculos

select cli.nome, count(*) as 'Total'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome
having count(*) > 2
go

-- Questão 13 - qual veiculo foi mais locado no mês de abril

select vei.tipo, count(*) as 'Quantidade/abril'
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
where month(alu.data) = '04' --mês de abril => 04
group by vei.tipo
order by [Quantidade/abril] asc
go

-- Questão 14 - qual veiculo foi mais locado no ano atual

select top(1) vei.tipo, count (alu.id_veiculo) as 'Quantidade alugueis' 
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
where year(alu.data) = '2021'	--ano de 2021
group by vei.tipo	
order by [Quantidade alugueis] desc -- ou vei.marca ou inves de [Quantidade alugueis]
go

-- Questão 15 - Exiba o nome e idade do cliente, nome do funcionário, data do aluguel, marca, modelo, grupo e o nome do setor do veiculo.

select cli.nome as 'Nome Cliente', cli.idade, fun.nome 'Nome Func', data, vei.marca, modelo.grupo as 'Modelo', setor.nome
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
inner join funcionario  fun on fun.id = alu.id_funcionario
inner join veiculo vei on vei.id = alu.id_veiculo
inner join setor on setor.id = vei.id_setor
inner join modelo on modelo.id = vei.id_modeloveiculo
order by cli.nome
go