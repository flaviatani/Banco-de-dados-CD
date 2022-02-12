/*
STORED PROCEDURE
sub-rotinas: conjunto de comandos que permitem
customizar rotinas com a utiliza��o de vari�veis, onde:
CREATE PROCEDURE sp_nome PAR�METROS:
- ENTRADA (INPUT) -> por ser default n�o precisa citar
- SA�DA (OUTPUT) -> precisa ser citado

ENTRADA
DECLARE @variavel TIPO
PARA CADA OPERA��O, SEJA:

PROCESSAMENTO
-ATRIBUI��O DE CONSTANTE OU C�LCULO
SET @num1 = 22
SET @soma = @num1 + @num2
COMANDOS DE DECIS�O
IF/ IF...ELSE
TUDO QUE ABRE { -> BEGIN
FECHA } -> END
COMANDOS DE REPETI��O
WHILE

SA�DA
PRINT()

PARA EXECUT�-LA DEVE USAR
EXEC sp_nomeProcedure
*/

USE cdManha20212;
GO
ALTER PROCEDURE sp_saudacao AS
DECLARE @msg VARCHAR(20)
SET @msg = 'Acorda turma, �nimo!!!'
PRINT @msg
GO

ALTER PROCEDURE sp_saudacao @msg VARCHAR(50) AS
PRINT @msg
GO

EXEC sp_saudacao 'INTERVALO, PROFESSORA?';
GO

CREATE PROCEDURE sp_soma AS
--entrada
DECLARE @num1 INT, @num2 INT, @res INT
SET @num1 = 6
SET @num2 = 13
--processamento
SET @res = @num1 + @num2
--sa�da
PRINT @res
GO

EXEC sp_soma;
GO

ALTER PROCEDURE sp_soma @num1 INT, @num2 INT AS
--entrada
DECLARE @res INT
--processamento
SET @res = @num1 + @num2
--sa�da
PRINT @res
GO

EXEC sp_soma 22,28;
go

ALTER PROCEDURE sp_soma @num1 INT, @num2 INT, @res INT OUTPUT AS
SET @res = @num1 + @num2
go

DECLARE @saida INT;
EXEC sp_soma 13,74, @saida OUTPUT;
PRINT @saida;
go

--Desafio
--Fazer: sp_som @n1, @n2;
CREATE PROCEDURE sp_som @num1 INT, @num2 INT AS
--entrada
DECLARE @res INT
--processamento
SET @res = @num1 + @num2
--sa�da
PRINT @res
GO
--Fazer: sp_sub @n1, @n2; (verificar o maior n�mero)
CREATE PROCEDURE sp_sub @num1 INT, @num2 INT AS
--entrada
DECLARE @res INT
--processamento
IF(@num1>=@num2)BEGIN
	SET @res = @num1 - @num2
END
ELSE BEGIN
	SET @res = @num2 - @num1
END
--sa�da
PRINT @res
GO
--Fazer: sp_mul @n1, @n2;
CREATE PROCEDURE sp_mul @num1 INT, @num2 INT AS
--entrada
DECLARE @res INT
--processamento
SET @res = @num1 + @num2
--sa�da
PRINT @res
GO
--Fazer: sp_div @n1, @n2; (verificar o maior n�mero)
CREATE PROCEDURE sp_div @num1 INT, @num2 INT AS
--entrada
DECLARE @res INT
--processamento
IF(@num1>=@num2)BEGIN
	SET @res = @num1 / @num2
END
ELSE BEGIN
	SET @res = @num2 / @num1
END
--sa�da
PRINT @res
GO

/*DESAFIO 2
O USU�RIO IR� EXECUTAR
EXEC sp_calcula '+', 6, 28;
e a procedure deve retornar o resultado, 
sabendo-se que as op��es do menu s�o:
'+' para soma
'-' para subtra��o
'*' para multiplica��o
'/' para divis�o
'i' para parImpar
'p' para primos
'm' para media Fatec (P1(0.35) + P2(0.5) e todos t�m 1.5de Trabalho)
'r' para c�lculo de imposto de renda 2021 qual aliquota vai ser aplicada
*/

ALTER PROCEDURE sp_calcula @opc CHAR(1), @n1 INT, @n2 INT AS
IF (@opc = '+') BEGIN
	EXEC sp_som @n1, @n2;
END;
ELSE IF (@opc = '-') BEGIN
	EXEC sp_sub @n1, @n2;
END;
ELSE IF (@opc = '*') BEGIN
	EXEC sp_mul @n1, @n2;
END;
ELSE IF (@opc = '/') BEGIN
	EXEC sp_div @n1, @n2;
END;
ELSE IF (@opc = 'i') BEGIN
	EXEC sp_parImpar @n1, @n2;
END;
ELSE IF (@opc = 'p') BEGIN
	EXEC sp_primos @n1, @n2;
END;
ELSE IF (@opc = 'm') BEGIN
	EXEC sp_media @n1, @n2;
END;
ELSE (@opc = 'r') BEGIN
	EXEC sp_imposto @n1, @n2;
END;
go

exec sp_calcula '-', 13, 74;


