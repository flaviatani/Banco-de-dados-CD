USE cdManha20212
GO
/*O USUÁRIO IRÁ EXECUTAR
EXEC sp_calcula '+', 6, 28;
e a procedure deve retornar o resultado,
sabendo-se que as opções do menu são:
'+' para soma
'-' para subtração
'*' para multiplicação
'/' para divisão
'i' para parImpar
'p' para primos
'm' para media Fatec (P1(0.35) + P2(0.5) e todos têm 1.5 de Trabalho)
'r' para cálculo de imposto de renda 2021 qual alíquota vai ser aplicada
*/

--SOMA ---------------------------------------------------
ALTER PROCEDURE sp_som @n1 INT, @n2 INT AS
DECLARE @res INT, @msg VARCHAR(30)
SET @res = @n1 + @n2
SET @msg = 'O resultado da soma é: '
PRINT CONCAT (@msg, @res)
GO

--SUBTRAÇÃO -----------------------------------------------
ALTER PROCEDURE sp_sub @n1 INT, @n2 INT AS
DECLARE @res INT, @msg VARCHAR(30)
IF @n1 >= @n2 
BEGIN
	SET @res = @n1 - @n2
END

ELSE 
BEGIN
	SET @res = @n2 - @n1
END

SET @msg = 'O resultado da subtração é: '
PRINT CONCAT (@msg, @res)
GO

--MULTIPLICAÇÃO -------------------------------------------
ALTER PROCEDURE sp_mul @n1 INT, @n2 INT AS
DECLARE @res INT, @msg VARCHAR(40)
SET @res = @n1 * @n2
SET @msg = 'O resultado da multiplicação é: '
PRINT CONCAT (@msg, @res)
GO

--DIVISÃO --------------------------------------------------
ALTER PROCEDURE sp_div @n1 NUMERIC(7,2), @n2 NUMERIC(7,2) AS
DECLARE @res NUMERIC(7,2), @msg VARCHAR(30)
IF @n1 >= @n2 
BEGIN
	SET @res = @n1 / @n2
END

ELSE 
BEGIN
	SET @res = @n2 / @n1
END

SET @msg = 'O resultado da divisão é: '
PRINT CONCAT (@msg, @res)
GO

--PAR OU IMPAR --------------------------------------------------
ALTER PROCEDURE sp_parImpar @n1 NUMERIC(7,2), @n2 NUMERIC(7,2) AS
DECLARE @res VARCHAR(30)
IF @n1 % 2 = 0 BEGIN
	SET @res = ' Primeiro número é PAR.'
END

ELSE 
BEGIN
	SET @res = ' Primeiro número é IMPAR.'
END

PRINT @res

IF @n2 % 2 = 0 
BEGIN
	SET @res = ' Segundo número é PAR.'
END

ELSE 
BEGIN
	SET @res = ' Segundo número é IMPAR.'
END

PRINT @res
go

--MÉDIA FATEC -----------------------------------------------------
ALTER PROCEDURE sp_mediaFatec @n1 NUMERIC(5,2), @n2 NUMERIC(5,2) AS
DECLARE @res NUMERIC(5,2), @msg VARCHAR(40)
SET @res = (@n1*0.35) + (@n2*0.5) + 1.5
SET @msg = 'A média do aluno é: '
PRINT CONCAT (@msg, @res)
GO

--NÚMEROS PRIMOS ENTRE SI ----------------------------------------
ALTER PROCEDURE sp_primos @n1 INT, @n2 INT AS
DECLARE @resto INT, @divisor INT, @dividendo INT, @msg VARCHAR(40)
IF @n1 > @n2 
BEGIN
	SET @divisor = @n2
	SET @dividendo = @n1
END

ELSE 
BEGIN
	SET @divisor = @n1
	SET @dividendo = @n2
END

WHILE (@divisor != 0)
BEGIN
	SET @resto = @dividendo % @divisor
	SET @dividendo = @divisor
	SET @divisor = @resto
END

IF @dividendo = 1 
BEGIN
	SET @msg = 'Os números são primos'
END

ELSE 
BEGIN
	SET @msg = 'Os números não são primos'
END

PRINT @msg
GO

--CÁLCULO DO IMPOSTO DE RENDA SOBRE SALÁRIO ------------------
ALTER PROCEDURE sp_calcIR @n1 INT, @n2 NUMERIC(7,2) AS
DECLARE @res NUMERIC(4,2), @msg VARCHAR(60), @vlr NUMERIC(7,2)
IF @n1 < 1903.99 
BEGIN
	SET @res = 0
	SET @vlr = (@n1 * @res / 100) - 0
END

ELSE IF @n1 >= 1903.99 AND @n1 <= 2826.55 
BEGIN
	SET @res = 7.5
	SET @vlr = (@n1 * @res / 100) - 142.8
END

ELSE IF @n1 > 2826.55 AND @n1 <= 3751.05 
BEGIN
	SET @res =	15
	SET @vlr = (@n1 * @res / 100) - 354.8
END

ELSE IF @n1 > 3751.05 AND @n1 <= 4664.68 
BEGIN
	SET @res = 22.5
	SET @vlr = (@n1 * @res / 100) - 636.13
END

ELSE 
BEGIN
	SET @res = 27.5
	SET @vlr = (@n1 * @res / 100) - 869.36
END

SET @msg = 'A alíquota a ser aplicada no primeiro salário é de '
PRINT CONCAT (@msg, @res,'% e o valor do imposto é de R$ ', @vlr)

IF @n2 < 1903.99 
BEGIN
	SET @res = 0
	SET @vlr = (@n2 * @res / 100) - 0
END

ELSE IF @n2 > 1903.99 AND @n2 <= 2826.55 
BEGIN
	SET @res = 7.5
	SET @vlr = (@n2 * @res / 100) - 142.8
END

ELSE IF @n2 > 2826.55 AND @n2 <= 3751.05 
BEGIN
	SET @res =	15
	SET @vlr = (@n2 * @res / 100) - 354.8
END

ELSE IF @n2 > 3751.05 AND @n2 <= 4664.68 
BEGIN
	SET @res = 22.5
	SET @vlr = (@n2 * @res / 100) - 636.13
END

ELSE 
BEGIN
	SET @res = 27.5
	SET @vlr = (@n2 * @res / 100) - 869.36
END

SET @msg = 'A alíquota a ser aplicada no segundo salário é de '
PRINT CONCAT (@msg, @res,'% e o valor do imposto é de R$ ', @vlr)
GO



ALTER PROCEDURE sp_calcula @opc CHAR(1), @n1 NUMERIC(7,2), @n2 NUMERIC(7,2) AS

IF @opc = '+' 
BEGIN
	EXEC sp_som @n1, @n2
END

ELSE IF @opc = '-' 
BEGIN
	EXEC sp_sub @n1, @n2
END

ELSE IF @opc = '*' 
BEGIN
	EXEC sp_mul @n1, @n2
END

ELSE IF @opc = '/' 
BEGIN
	EXEC sp_div @n1, @n2
END

ELSE IF @opc = 'i' 
BEGIN
	EXEC sp_parImpar @n1, @n2
END

ELSE IF @opc = 'p' 
BEGIN
	EXEC sp_primos @n1, @n2
END

ELSE IF @opc = 'm' 
BEGIN
	EXEC sp_mediaFatec @n1, @n2
END

ELSE IF @opc = 'r' 
BEGIN
	EXEC sp_calcIR @n1, @n2
END

GO

EXEC sp_calcula '+', 6, 9
GO

EXEC sp_calcula '-', 6, 9
GO

EXEC sp_calcula '*', 6, 9
GO

EXEC sp_calcula '/', 6, 9
GO

EXEC sp_calcula 'i', 6, 9
GO

EXEC sp_calcula 'p', 6, 9
GO

EXEC sp_calcula 'm', 6, 9
GO

EXEC sp_calcula 'r', 3600, 5000
GO
