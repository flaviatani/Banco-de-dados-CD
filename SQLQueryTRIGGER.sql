USE cdManha20212
GO

CREATE TABLE auditoria(
idAuditoria INTEGER IDENTITY(1,1) PRIMARY KEY,
usuario VARCHAR(100) NOT NULL,
acao VARCHAR(50) NOT NULL,
data DATETIME NOT NULL,
codigo INTEGER NOT NULL,
tabela VARCHAR(50) NOT NULL
);
GO

CREATE TRIGGER tr_auditorInsereMusica
ON musica
FOR INSERT
AS
SELECT
SUSER_SNAME(),
'Cadastrou',
GETDATE(),
idMusica,
'Musica'
FROM inserted;
GO

ALTER TRIGGER tr_auditorInsereMusica
ON musica
FOR INSERT
AS
INSERT INTO auditoria
SELECT
SUSER_SNAME(),
'Cadastrou',
GETDATE(),
idMusica,
'Musica'
FROM inserted;
GO

CREATE TRIGGER tr_auditorInsereMusica
	ON musica
	FOR INSERT
AS
	SELECT
		SUSER_SNAME(),
		'Cadastrou',
		GETDATE(),
		idMusica,
		'Musica'
FROM inserted;
GO

ALTER TRIGGER tr_auditorInsereMusica
	ON musica
	FOR INSERT
AS
	INSERT INTO auditoria
	SELECT
		SUSER_SNAME(),
		'Cadastrou',
		GETDATE(),
		idMusica,
		'Musica'
FROM inserted;
GO

CREATE TRIGGER tr_auditorAlteraMusica
	ON musica
	FOR UPDATE
AS
	INSERT INTO auditoria
	SELECT
		SUSER_SNAME(),
		'Alterou',
		GETDATE(),
		idMusica,
		'Musica'
FROM inserted;
GO

CREATE TRIGGER tr_auditorExcluiMusica
	ON musica
	FOR DELETE
AS
	INSERT INTO auditoria
	SELECT
		SUSER_SNAME(),
		'Excluiu',
		GETDATE(),
		idMusica,
		'Musica'
FROM deleted;
GO

SELECT * FROM auditoria



CREATE PROCEDURE sp_insereMusica 
	@cod INT,
	@nome VARCHAR(50),
	@tempo DECIMAL(4,2)
AS
	INSERT INTO musica (idMusica, nmMusica, duracao)
	VALUES(@cod, @nome, @tempo)
GO
CREATE PROCEDURE sp_alteraMusica 
	@cod INT,
	@nome VARCHAR(50),
	@tempo DECIMAL(4,2)
AS
	UPDATE musica
	SET nmMusica = @nome, duracao = @tempo
	WHERE idMusica = @cod
GO

Select * from musica

EXEC sp_insereMusica 31, 'Californication', 4.00;
EXEC sp_insereMusica 32, 'Lithium', 4.17;
EXEC sp_insereMusica 33, 'Patience', 5.54;
EXEC sp_insereMusica 34, 'Soldier of love', 2.54;
GO



EXEC sp_alteraMusica 31, 'Californication, RHCP', 4.00;
EXEC sp_alteraMusica 32, 'Lithium, Nirvana', 4.17;
EXEC sp_alteraMusica 33, 'Patience, Guns N Roses', 5.54;
EXEC sp_alteraMusica 34, 'Soldier of love, Pearl Jam', 2.54;


DELETE
FROM musica
WHERE idMusica IN(31,32,33)
GO