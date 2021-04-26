use db05
go

--Questão 2
create table contato(
	id int not null identity,
	tel1 varchar (15) not null,
	tel2 varchar (15) not null,
	primary key(id),
	id_cliente int not null,
	constraint fk_contatos_cliente foreign key (id_cliente) references cliente(id)
)
go

--Questão 3
alter table funcionario add idade smallint not null
go
alter table funcionario add constraint ValidaIdade check (idade <= 18)
go

--Questão 4
alter table veiculo add placa varchar (10) not null 
go

--Questão 5
alter table veiculo drop column quantidadedisp
go

--Questão 6
drop table contato
go

--Questão 7
-- INSERINDO DADOS NA TABELA CLIENTE
insert into cliente (nome, cpf, codigo, idade, datanasc, telefone, cnh)
values ('Maria', 873475936712, 10, 25, '19/04/1996', 71964578437, 859403728465783)
go
insert into cliente (nome, cpf, codigo, idade, datanasc, telefone, cnh)
values ('Vitor',873475936713, 20, 18, '19/04/2003', 71964578347, 859403728465782)
go
insert into cliente (nome, cpf, codigo, idade, datanasc, telefone, cnh)
values ('Fernando', 873475936714, 30, 21, '19/04/2000', 71964578348, 859403728465784)
go
insert into cliente (nome, cpf, codigo, idade, datanasc, telefone, cnh)
values ('Rogério', 873475936715, 40, 34, '19/04/1987', 71964978348, 859403728465785)
go
select * from cliente

--alterando telefone de int para varchar 
alter table funcionario drop column telefone
go
alter table funcionario add telefone varchar(15) not null
go

-- INSERINDO DADOS NA TABELA FUNCIONARIO
insert into funcionario (nome, endereco, telefone, codigo, rg, cpf, salario, idade)
values ('Mario', 'Rua A, Brotas, numero 345', 71987456321, 100, 856742, 85993234, 2400.00, 19)
go
insert into funcionario (nome, endereco, telefone, codigo, rg, cpf, salario, idade)
values ('Carlos', 'Rua B, Pernambués, numero 873', 71987456322, 200, 856743, 85993235, 1200.00, 21)
go
insert into funcionario (nome, endereco, telefone, codigo, rg, cpf, salario, idade)
values ('Rebeca', 'Rua C, Imbuí, numero 129', 71987456323, 300, 856744, 85993236, 1450.00, 31)
go
insert into funcionario (nome, endereco, telefone, codigo, rg, cpf, salario, idade)
values ('Ian', 'Rua D, Camaçari, numero 453', 71987456324, 400, 856745, 85993236, 1800.00, 24)
go
select * from funcionario

-- INSERINDO DADOS NA TABELA VEICULO
insert into veiculo (tipo, marca, codigo, quantidade, placa)
values ('Sedan', 'Volksvagem', 849375, 2, 'FKSD-9933')
go
insert into veiculo (tipo, marca, codigo, quantidade, placa)
values ('Hatch', 'Chevrolet', 859043, 3, 'HFGD-5566')
go
insert into veiculo (tipo, marca, codigo, quantidade, placa)
values ('Hatchback', 'Hyundai', 643892, 2, 'FBND-0342')
go
insert into veiculo (tipo, marca, codigo, quantidade, placa)
values ('SUV', 'Toyota', 904323, 1, 'HBDS-7743')
go
select * from veiculo
-- INSERINDO DADOS NA TABEL ALUGUEL
insert into aluguel (numero, data, total, desconto)
values (11, '18/04/2021', 500.00, 25)
go
insert into aluguel (numero, data, total, desconto)
values (12, '19/04/2021', 600.00, 15)
go
insert into aluguel (numero, data, total, desconto)
values (13, '30/04/2021', 700.00, 30)
go
insert into aluguel (numero, data, total, desconto)
values (14, '31/05/2021', 800.00, 45)
go
select * from aluguel

--Questão 8

--ATUALIZANDO CLIENTE
update cliente set nome = 'Rogério'
where nome = 'Fernando'
go
select * from cliente

--ATUALIZANDO FUNCIONARIO
update funcionario set nome = 'Marcelo'
where nome = 'Rebeca'
go
select * from funcionario

--ATUALIZANDO VEICULO
update veiculo set tipo = 'Jeep'
where tipo = 'SUV'
go
select * from veiculo

--ATUALIZANDO ALUGUEL
update aluguel set desconto = 20
where desconto = 25
go
select * from aluguel

--Questão 9

--DELETANDO CLIENTE
delete from cliente 
where id = 5;
go

--DELETANDO FUNCIONARIO
delete from funcionario
where id = 4;
go

--DELETANDO VEICULO
delete from veiculo
where id = 4;
go
--DELETANDO ALUGUEL 
delete from aluguel 
where id = 4;
go

--Questão 10
select * from cliente
where id in (1, 2, 3)
go

--Questão 11
select numero from aluguel

--Questão 12
select data from aluguel
where data between '18/04/2021' and '31/05/2021'
go

--Questão 13 ******************
select salario from funcionario
where salario not like 1000.00	--dúvida: uso o comando not like?
go

--Questão 14
select * from cliente
where nome like 'Ma%'
go

--Questão 15
select * from funcionario
where nome like '%Rio'
go

--Questão 16
select * from funcionario 
where nome like '%C%'
go

--Questão 17
select * from aluguel 
where total is null
go

--Questão 18
select * from aluguel
where total is not null
go

--Questão 19
select nome, cnh, idade from cliente
where nome = 'Vitor' and idade >= 18
go


-- Usando Transações no SQL

begin transaction	--início da transação / ou usa begin tran

	--comandos...
	delete from cliente
	where id = 1
	select * from cliente

commit		-- ele confirma a transação
rollback	--ele nega a transação