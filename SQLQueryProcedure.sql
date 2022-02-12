USE cdManha20212
GO
/*O USU�RIO IR� EXECUTAR
EXEC sp_calcula '+', 6, 28;
e a procedure deve retornar o resultado,
sabendo-se que as op��es do menu s�o:
'+' para soma
'-' para subtra��o
'*' para multiplica��o
'/' para divis�o
'i' para parImpar
'p' para primos
'm' para media Fatec (P1(0.35) + P2(0.5) e todos t�m 1.5 de Trabalho)
'r' para c�lculo de imposto de renda 2021 qual al�quota vai ser aplicada
*/

--SOMA ---------------------------------------------------
ALTER PROCEDURE sp_som @n1 INT, @n2 INT AS
DECLARE @res INT, @msg VARCHAR(30)
SET @res = @n1 + @n2
SET @msg = 'O resultado da soma �: '
PRINT CONCAT (@msg, @res)
GO

--SUBTRA��O -----------------------------------------------
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

SET @msg = 'O resultado da subtra��o �: '
PRINT CONCAT (@msg, @res)
GO

--MULTIPLICA��O -------------------------------------------
ALTER PROCEDURE sp_mul @n1 INT, @n2 INT AS
DECLARE @res INT, @msg VARCHAR(40)
SET @res = @n1 * @n2
SET @msg = 'O resultado da multiplica��o �: '
PRINT CONCAT (@msg, @res)
GO

--DIVIS�O --------------------------------------------------
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

SET @msg = 'O resultado da divis�o �: '
PRINT CONCAT (@msg, @res)
GO

--PAR OU IMPAR --------------------------------------------------
ALTER PROCEDURE sp_parImpar @n1 NUMERIC(7,2), @n2 NUMERIC(7,2) AS
DECLARE @res VARCHAR(30)
IF @n1 % 2 = 0 BEGIN
	SET @res = ' Primeiro n�mero � PAR.'
END

ELSE 
BEGIN
	SET @res = ' Primeiro n�mero � IMPAR.'
END

PRINT @res

IF @n2 % 2 = 0 
BEGIN
	SET @res = ' Segundo n�mero � PAR.'
END

ELSE 
BEGIN
	SET @res = ' Segundo n�mero � IMPAR.'
END

PRINT @res
go

--M�DIA FATEC -----------------------------------------------------
ALTER PROCEDURE sp_mediaFatec @n1 NUMERIC(5,2), @n2 NUMERIC(5,2) AS
DECLARE @res NUMERIC(5,2), @msg VARCHAR(40)
SET @res = (@n1*0.35) + (@n2*0.5) + 1.5
SET @msg = 'A m�dia do aluno �: '
PRINT CONCAT (@msg, @res)
GO

--N�MEROS PRIMOS ENTRE SI ----------------------------------------
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
	SET @msg = 'Os n�meros s�o primos'
END

ELSE 
BEGIN
	SET @msg = 'Os n�meros n�o s�o primos'
END

PRINT @msg
GO

--C�LCULO DO IMPOSTO DE RENDA SOBRE SAL�RIO ------------------
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

SET @msg = 'A al�quota a ser aplicada no primeiro sal�rio � de '
PRINT CONCAT (@msg, @res,'% e o valor do imposto � de R$ ', @vlr)

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

SET @msg = 'A al�quota a ser aplicada no segundo sal�rio � de '
PRINT CONCAT (@msg, @res,'% e o valor do imposto � de R$ ', @vlr)
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
