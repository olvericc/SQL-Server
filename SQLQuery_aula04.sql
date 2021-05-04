use db05
go

-- Inner Join => juntar se houver nas duas tabelas
--ligação da chave primária com a chave estrangeira

select cli.id, alu.id_cliente
from aluguel alu
inner join cliente cli on cli.id = alu.id_cliente
go

--1 = 1 = true
--2 = null - false

-- Left Join

--cliente que realizou aluguel com data não nula

select cli.nome, alu.data 
from cliente cli
left join aluguel alu on alu.id_cliente = cli.id
--where alu.data is null --cliente que não realizou aluguel quando a data é nula...
order by alu.data desc
go

-- Rigth Join

--trazer todos clientes que realizaram aluguel

select cli.nome, alu.data
from aluguel alu
right join cliente cli on cli.id = alu.id_cliente
go

-- Full Join

select * from  aluguel

select cli.nome, alu.data
from aluguel alu
full outer join cliente	cli on cli.id = alu.id_cliente
--full join cliente cli on cli.id = alu.id_cliente

