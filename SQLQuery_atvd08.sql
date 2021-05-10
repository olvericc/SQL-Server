use db05

-- Questão 1	(correta)
-- visualizando os dados inseridos na tabela funcionario

select * from funcionario

select avg(salario) as 'Média de salário'
from funcionario
go

-- Questão 2	(correta)

-- SALÁRIO MAIS ALTO E MAIS BAIXO

select max(salario) as 'Maior salário', min(salario) as 'Menor salário'
from funcionario
go

-- Questão 3	(errada) fiz de cliente ao invés do funcionário

select cli.nome, count(*) as 'Total de alugueis'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome

-- Questão 4	(errada) esqueci do group by idade

select count(idade) as 'Total por idade'
from funcionario

-- Questão 5	(errada) pois não mostrei o id do veiculo, mostrei o desconto

select alu.desconto, count(distinct desconto)	'Desconto distintos'
from aluguel alu
group by alu.desconto

-- Questão 6	(correta)

select count (distinct salario) as 'Salários distintos'
from funcionario

-- Questão 7	(correta) ****

--inserindo registros na tabela modelo
insert into modelo(codigo, grupo)
values ('50', 'caro')
go

select * from modelo
--optei trocar modelo por marca...

select cli.nome as 'Nome do cliente', alu.data as 'Data aluguel', vei.marca as	'Modelo veiculo'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
inner join veiculo vei on vei.id = alu.id_veiculo
group by cli.nome, alu.data, vei.marca
go

-- Questão 8	(correta)

select cli.idade, count(idade) as 'Total por idade'
from cliente cli
group by cli.idade

-- Questão 9	(correta)

select count(id) as 'Total de clientes'
from cliente

-- Questão 10	(correta) apenas mudei a ordem

select count(marca) as 'Total de veiculos', vei.marca
from veiculo vei
group by vei.marca

-- Questão 11	(correta) ****  > 2 ou >= 2

select fun.nome, count(*) as 'Total'
from aluguel alu
inner join funcionario fun on fun.id = alu.id_funcionario
group by fun.nome 
having count(*) >= 2
go

-- Questão 12	(correta) **** > 2 ou >= 2

select cli.nome, count(*) as 'Total'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome
having count(*) >= 2
go

-- Questão 13 (corrigida) ok

--month() => where month, enquanto o mês for...

select vei.tipo, count(alu.id_veiculo) as 'Quantidade/abril'
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
where month(alu.data) = '04' --mês de abril => 04
group by vei.tipo
order by [Quantidade/abril] asc
go

-- Questão 14 (corrigida) ok

--top() => exibe apenas o regtro solicitado
--year => where year, enquanto o ano for ... 

select top(3) vei.tipo, count (alu.id_veiculo) as 'Quantidade alugueis' 
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
where year(alu.data) = '2021'	--ano de 2021
group by vei.tipo	
order by [Quantidade alugueis] desc
go

select * from veiculo

-- Questão 15	(correta)

--inserindo registro na tabela setor
insert into setor(categoria, nome, numero)
values ('Esporte', 'setor 1', 8593)
go
select * from aluguel

select cli.nome as 'Nome cliente',cli.idade as 'Idade cliente', fun.nome as 'Nome funcionario', alu.data as 'Data aluguel', vei.marca as 'Marca veiculo', vei.tipo as 'Tipo veiculo', mode.grupo as 'Modelo veiculo', setor.nome as 'Nome setor'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
inner join funcionario fun on fun.id = alu.id_funcionario
inner join veiculo vei on vei.id = alu.id_veiculo
inner join modelo mode on mode.id = vei.id_modeloveiculo
inner join setor setor on setor.id = vei.id_setor
