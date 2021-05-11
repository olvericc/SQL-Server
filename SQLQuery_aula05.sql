<<<<<<< HEAD
-- left join e right

--inner join => conteudo na tabela a direita, e o mesmo conteudo da esquerda, ou seja 1 para 1

-- left join -> prioriza a tabela a esquerda

use db05
go

-- Exemplo de left join

select cli.nome, alu.data
from cliente cli				-- from cliente, left join, quer dizer que cliente é a tabela da esquerda
left join aluguel alu on alu.id_cliente = cli.id			-- a esquerda do left join é a tabela cliente
where alu.data is null			--qual cliente nunca realizou um aluguel

--Inner join = só funciona quando tem valores em comum nas duas tabelas
	--inner join = a (1,2,3) b (1, 3, 5)  --vai exibir 1,3 (pq são em comum)
	--left join 1,2,3,5
	--right join 5,1,2,3

-- Exemplo de Right join
-- clientes que n realizarm aluguel
select cli.nome, alu.data
from cliente cli
right join aluguel alu on alu.id_cliente = cli.id

--mostrar todos veiculos dependente se realizou aluguel ou n

select vei.marca, alu.data
from aluguel alu
right join veiculo vei on vei.id = alu.id_veiculo

select * from veiculo
select* from setor

insert into veiculo(id_modeloveiculo, id_setor, marca, tipo, placa, codigo, quantidade)
values(1, 1, 'Tesla', 'Sedan', 'HFIR-9540', 394544, 4)	
go

-- Visualização da tabela (criando view) com alugados ou nao, pode se usar o alter para alterar a view
create view vw_listar_veiculosalugadosounao
as 
select vei.marca, alu.data
from aluguel alu
right join veiculo vei on vei.id = alu.id_veiculo
go

select * from vw_listar_veiculosalugadosounao --transformou um select grande em apenas uma linha

drop view vw_listar_veiculosalugadosounao --apagando a view
GO

--inserindo uma coluna total em veiculo
alter table veiculo add valor int null
go
-- Procedure 

--procudure para criar registro em aluguel
alter procedure stp_registraraluguel
	@id_cliente int,  --parametro de entrada 
	@id_funcionario int, 
	@id_veiculo	int, 
	@data date,
	@desconto int,
	@numero int,
	@retorno varchar(50) output	--parametro de saida, retornando alguma informação
as
begin --início
	declare @valor smallmoney;
	declare @calculo smallmoney;
	declare @total smallmoney;

	set @valor = (SELECT valor FROM veiculo WHERE id = @id_veiculo)

	if @desconto > 0
	begin
		set @calculo = (@valor / 100) * @desconto
		set @total = @valor + @calculo
	end

	--insert
	insert into aluguel	(id_cliente, id_funcionario, id_veiculo, data, desconto, total, numero)
	values(@id_cliente, @id_funcionario, @id_veiculo, @data, @desconto, @total, @numero)

	if @@ROWCOUNT > 0 -- se o insert for concluido
	begin
		set @retorno = 'Aluguel registrado com sucesso';
	end
	else -- se o insert falhar
	begin
		set @retorno = 'Problemas ao registrar um alugel'
	end

end	--fim
go

-- executando a programação

declare @retorno varchar(50);
exec stp_registraraluguel 1, 2, 3, '2021-05-11', 10  @retorno output;

-- para exibir

print @retorno;	--um jeito para visualizar
--select @retorno; --outro jeito para visualizar
go	

--inserindo registro na tabela veiculo, usando update para adicionar valores nas tabelas

select * from aluguel
select * from veiculo
select * from modelo

insert into veiculo (tipo, marca, codigo, quantidade, id_modeloveiculo, id_setor, placa, valor)
values ('Hatchback', 'BMW', 845034, 1, 1, 1, 'JRKR-8569', 65000)
go

insert into veiculo (valor)
values (70000)
go

-- Transações

--commit
--rollback

begin tran T1 --iniciar transação

	--veiculo id 1
	update veiculo
	set valor = 65000
	where id = 1
	--veiculo id 2
	update veiculo
	set valor = 78000
	where id = 2
	--veiculo id 3
	update veiculo
	set valor = 96000
	where id = 3
	--veiculo id 9
	update veiculo
	set valor = 120000
	where id = 9
	--veiculo id 10
	update veiculo
	set valor = 75000
	where id = 10
	
--se funcionou coloco commit
--se n errou coloco rollback


=======
-- left join e right

--inner join => conteudo na tabela a direita, e o mesmo conteudo da esquerda, ou seja 1 para 1

-- left join -> prioriza a tabela a esquerda

use db05
go

-- Exemplo de left join

select cli.nome, alu.data
from cliente cli				-- from cliente, left join, quer dizer que cliente é a tabela da esquerda
left join aluguel alu on alu.id_cliente = cli.id			-- a esquerda do left join é a tabela cliente
where alu.data is null			--qual cliente nunca realizou um aluguel

--Inner join = só funciona quando tem valores em comum nas duas tabelas
	--inner join = a (1,2,3) b (1, 3, 5)  --vai exibir 1,3 (pq são em comum)
	--left join 1,2,3,5
	--right join 5,1,2,3

-- Exemplo de Right join
-- clientes que n realizarm aluguel
select cli.nome, alu.data
from cliente cli
right join aluguel alu on alu.id_cliente = cli.id

--mostrar todos veiculos dependente se realizou aluguel ou n

select vei.marca, alu.data
from aluguel alu
right join veiculo vei on vei.id = alu.id_veiculo

select * from veiculo
select* from setor

insert into veiculo(id_modeloveiculo, id_setor, marca, tipo, placa, codigo, quantidade)
values(1, 1, 'Tesla', 'Sedan', 'HFIR-9540', 394544, 4)	
go

-- Visualização da tabela (criando view) com alugados ou nao, pode se usar o alter para alterar a view
create view vw_listar_veiculosalugadosounao
as 
select vei.marca, alu.data
from aluguel alu
right join veiculo vei on vei.id = alu.id_veiculo
go

select * from vw_listar_veiculosalugadosounao --transformou um select grande em apenas uma linha

drop view vw_listar_veiculosalugadosounao --apagando a view
GO

--inserindo uma coluna total em veiculo
alter table veiculo add valor int null
go
-- Procedure 

--procudure para criar registro em aluguel
alter procedure stp_registraraluguel
	@id_cliente int,  --parametro de entrada 
	@id_funcionario int, 
	@id_veiculo	int, 
	@data date,
	@desconto int,
	@numero int,
	@retorno varchar(50) output	--parametro de saida, retornando alguma informação
as
begin --início
	declare @valor smallmoney;
	declare @calculo smallmoney;
	declare @total smallmoney;

	set @valor = (SELECT valor FROM veiculo WHERE id = @id_veiculo)

	if @desconto > 0
	begin
		set @calculo = (@valor / 100) * @desconto
		set @total = @valor + @calculo
	end

	--insert
	insert into aluguel	(id_cliente, id_funcionario, id_veiculo, data, desconto, total, numero)
	values(@id_cliente, @id_funcionario, @id_veiculo, @data, @desconto, @total, @numero)

	if @@ROWCOUNT > 0 -- se o insert for concluido
	begin
		set @retorno = 'Aluguel registrado com sucesso';
	end
	else -- se o insert falhar
	begin
		set @retorno = 'Problemas ao registrar um alugel'
	end

end	--fim
go

-- executando a programação

declare @retorno varchar(50);
exec stp_registraraluguel 1, 2, 3, '2021-05-11', 10  @retorno output;

-- para exibir

print @retorno;	--um jeito para visualizar
--select @retorno; --outro jeito para visualizar
go	

--inserindo registro na tabela veiculo, usando update para adicionar valores nas tabelas

select * from aluguel
select * from veiculo
select * from modelo

insert into veiculo (tipo, marca, codigo, quantidade, id_modeloveiculo, id_setor, placa, valor)
values ('Hatchback', 'BMW', 845034, 1, 1, 1, 'JRKR-8569', 65000)
go

insert into veiculo (valor)
values (70000)
go

-- Transações

--commit
--rollback

begin tran T1 --iniciar transação

	--veiculo id 1
	update veiculo
	set valor = 65000
	where id = 1
	--veiculo id 2
	update veiculo
	set valor = 78000
	where id = 2
	--veiculo id 3
	update veiculo
	set valor = 96000
	where id = 3
	--veiculo id 9
	update veiculo
	set valor = 120000
	where id = 9
	--veiculo id 10
	update veiculo
	set valor = 75000
	where id = 10
	
--se funcionou coloco commit
--se n errou coloco rollback


>>>>>>> d983341f94155304d9c152b7ccc3bb0cdc00b861
select * from veiculo