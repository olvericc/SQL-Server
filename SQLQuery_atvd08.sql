use db05

-- Quest�o 1	(correta)
-- visualizando os dados inseridos na tabela funcionario

select * from funcionario

select avg(salario) as 'M�dia de sal�rio'
from funcionario
go

-- Quest�o 2	(correta)

-- SAL�RIO MAIS ALTO E MAIS BAIXO

select max(salario) as 'Maior sal�rio', min(salario) as 'Menor sal�rio'
from funcionario
go

-- Quest�o 3	(errada) fiz de cliente ao inv�s do funcion�rio

select cli.nome, count(*) as 'Total de alugueis'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome

-- Quest�o 4	(errada) esqueci do group by idade

select count(idade) as 'Total por idade'
from funcionario

-- Quest�o 5	(errada) pois n�o mostrei o id do veiculo, mostrei o desconto

select alu.desconto, count(distinct desconto)	'Desconto distintos'
from aluguel alu
group by alu.desconto

-- Quest�o 6	(correta)

select count (distinct salario) as 'Sal�rios distintos'
from funcionario

-- Quest�o 7	(correta) ****

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

-- Quest�o 8	(correta)

select cli.idade, count(idade) as 'Total por idade'
from cliente cli
group by cli.idade

-- Quest�o 9	(correta)

select count(id) as 'Total de clientes'
from cliente

-- Quest�o 10	(correta) apenas mudei a ordem

select count(marca) as 'Total de veiculos', vei.marca
from veiculo vei
group by vei.marca

-- Quest�o 11	(correta) ****  > 2 ou >= 2

select fun.nome, count(*) as 'Total'
from aluguel alu
inner join funcionario fun on fun.id = alu.id_funcionario
group by fun.nome 
having count(*) >= 2
go

-- Quest�o 12	(correta) **** > 2 ou >= 2

select cli.nome, count(*) as 'Total'
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
group by cli.nome
having count(*) >= 2
go

-- Quest�o 13 (corrigida) ok

--month() => where month, enquanto o m�s for...

select vei.tipo, count(alu.id_veiculo) as 'Quantidade/abril'
from aluguel alu
inner join veiculo vei on vei.id = alu.id_veiculo
where month(alu.data) = '04' --m�s de abril => 04
group by vei.tipo
order by [Quantidade/abril] asc
go

-- Quest�o 14 (corrigida) ok

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

-- Quest�o 15	(correta)

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
