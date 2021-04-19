CREATE DATABASE db05
GO
USE db05
GO
--Tabela Cliente
create table cliente(
	id int not null identity,
	nome varchar(30) not null,
	cpf varchar(12) not null,
	codigo varchar (10) not null,
	idade smallint not null,
	datanasc date not null,
	telefone varchar(12) not null,
	cnh varchar (15) not null,
	id_endereco int null,	--fk
	primary key (id),
	constraint fk_cliente_endereco foreign key (id_endereco) references endereco(id)
)
go
--Tabela Endereço
create table endereco(	
	id int not null identity,
	cidade varchar (20) not null,
	estado varchar (20) not null,
	cep int not null,
	complemento varchar (20) not null,
	primary key (id)
)
go
--Tabela Funcionário
create table funcionario(
	id int not null identity,
	nome varchar (30) not null,
	endereco varchar (80) not null,
	telefone varchar(15) not null,
	codigo varchar (10) not null,
	rg varchar(15) not null,
	cpf varchar(12) not null,
	salario money not null,
	primary key (id)
)
go
--Tabela Modelo Veiculo
create table modelo(
	id int not null identity,
	codigo varchar (10) not null,
	grupo varchar(20) not null,
	primary key (id)
)
go
--Tabela Setor
create table setor(
	id int not null identity,
	numero bigint not null,
	categoria varchar (10) not null,
	nome varchar (20) not null,
	primary key (id)
)
go
--Tabela Veículo
create table veiculo(
	id int not null identity,
	tipo varchar (20) not null,
	marca varchar (10) not null,
	codigo varchar (10) not null,
	quantidade int null default 30,
	quantidadedisp int not null,
	id_modeloveiculo int null,  --fk
	id_setor int null,			--fk
	primary key (id),
	constraint fk_veiculo_modelo foreign key (id_modeloveiculo) references modelo(id),
	constraint fk_veiculo_setor foreign key (id_setor) references setor(id)
)
go
--Tabela Aluguel
create table aluguel(
	id int not null identity,
	numero bigint not null,
	data date not null,
	total float not null,
	desconto float not null,
	id_cliente int null,
	id_funcionario int null,
	id_veiculo int null,
	primary key (id),
	constraint fk_alugel_cliente foreign key (id_cliente) references cliente(id),
	constraint fk_aluguel_funcionario foreign key (id_funcionario) references funcionario(id),
	constraint fk_aluguel_veiculo foreign key (id_veiculo) references veiculo(id)
)
go