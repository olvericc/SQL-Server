-- Atividade de Pontuada Procedure

use db05
go

--Criando a procedure

create procedure stp_registraraluguel2 --nome da procedure
	--parametros de entrada (input)
	@data date,
	@id_cliente int,	
	@id_funcionario int,
	@id_veiculo	int,
	@qtd_dias int,
	@valor smallmoney,
	--parametro de saida (output)
	@retorno varchar(50) output
	
as

begin
	--declarando variaveis
	declare @desconto smallmoney;
	declare @total smallmoney;
	declare @calculo smallmoney;
	
	--setando as variaveis

	set @id_cliente = (select id from cliente where id = @id_cliente)
	set @id_funcionario = (select id from funcionario where id = @id_funcionario)
	set @id_veiculo = (select id from veiculo where id = @id_veiculo)

	--calculando o total a se pagar, e desconto

	set @calculo = @valor * @qtd_dias
	set @desconto = @calculo * 0.25
	set @total = @calculo - @desconto

	--validando se cliente existe no banco

	if @id_cliente is not null
		begin
			set @retorno = 'Sucesso! Cliente encontrado no banco'
		end
	else
		begin 
			set @retorno = 'Falha! Cliente não encontrado'
		end

	--validando se funcionario existe no banco

	if @id_funcionario is not null
		begin
			set @retorno = 'Sucesso! Funcionário encontrado no banco'
		end
	else 
		begin
			set @retorno = 'Falha! Funcionário não encontrado'
		end

	--validando se veiculo existe no banco
	
	if @id_veiculo is not null
		begin
			set @retorno = 'Sucesso! Veículo encontrado no banco'
		end
	else
		begin 
			set @retorno = 'Falha! Veículo não encontrado'
		end
	-- se o total a pagar for menor que 50, não registrar o aluguel
		
	if @total < 50
		begin
			set @retorno = 'Problemas ao registrar aluguel devido ao total a pagar ser menor que R$ 50,00'
		end
	
	-- validações

	if @id_cliente is not null and
	   @id_funcionario is not null and
	   @id_veiculo is not null

	   --inserindo dados

	   begin
			insert into aluguel (data, total, desconto, id_cliente, id_funcionario, id_veiculo, qtd_dias, valor)
			values(@data, @total, @desconto, @id_cliente, @id_funcionario, @id_veiculo, @qtd_dias, @valor)
			if @@ROWCOUNT > 0 
				begin
					set @retorno = 'Aluguel registrado com sucesso'
				end
			else 
				begin
					set @retorno = 'Problemas ao registrar o aluguel'
				end
		end
end
go

--executando a procedure

declare @retorno varchar(50);
-- data, id_cliente, id_funcionario, id_veiculo, qtd_dias e valor respectivamente
exec stp_registraraluguel2 '2021-05-21', 6, 2, 1, 1, 90, @retorno output;
print @retorno
go

DROP PROCEDURE stp_registraraluguel2

--visualizando as tabelas
select * from aluguel
select * from veiculo
select * from funcionario
select * from cliente