go

/*INSER��O DE DADOS
SINTAXE:

INSERT INTO nomeTabela (col1, col2, ..., coln)
VALUES (valor1, 'valor2TipoVarchar', ..., 'valornTipoData');

INSERT INTO nomeTabela
VALUES (valor1, valor2,... valorn);
*/

INSERT INTO autor
VALUES	(1, 'Renato Russo'),
		(2, 'Tom Jobim'),
		(3, 'Chico Buarque'),
		(4, 'Dado Villa-Lobos'),
		(5, 'Marcelo Bonf�'),
		(6, 'Ico Ouro Preto'),
		(7, 'Vin�cius de Moraes');
go

SELECT *
FROM autor;
GO

INSERT INTO musica
VALUES	(1,'Ser�', 2.28),
		(2, 'Ainda � Cedo', 3.55),
		(3, 'Gera��o Coca-Cola', 02.20),
		(4, 'Eduardo e M�nica', 04.32),
		(5, 'Tempo Perdido', 05.00),
		(6, 'Indios', 04.23),
		(7, 'Que Pa�s � este', 03.04),
		(8, 'Faroeste Caboclo', 9.03),
		(9, 'H� Tempos', 03.16),
		(10, 'Pais e Filhos', 05.06),
		(11, 'Meninos e Meninas', 03.22),
		(12, 'Vento no Litoral', 06.05),
		(13, 'Perfei��o', 04.35),
		(14, 'Giz', 03.20),
		(15, 'Dezesseis', 05.28),
		(16, 'Antes das Seis', 03.09),
		(17, 'Meninos Eu Vi', 03.25),
		(18, 'Eu te amo', 03.06),
		(19, 'Piano na Mangueira', 02.23),
		(20, 'A Violeira', 02.54),
		(21, 'Anos Dourados', 02.56),
		(22, 'Olha Maria', 03.55),
		(23, 'Biscate', 03.20),
		(24, 'Retrato em Preto e Branco', 03.03),
		(25, 'Falando de Amor', 03.20),
		(26, 'Pois �', 02.48),
		(27, 'Noite dos Mascarados', 02.42),
		(28, 'Sabi�', 03.20),
		(29, 'Imagina', 02.52),
		(30, 'Bate-Boca', 04.41);
go

SELECT *
FROM musica;
GO

INSERT INTO musicaAutor
VALUES	(1,1),
		(1,4),
		(1,5),
		(2,1),
		(2,4),
		(2,5),
		(2,6),
		(3,1),
		(4,1),
		(5,1),
		(6,1),
		(7,1),
		(8,1),
		(9,1),
		(9,4),
		(10,1),
		(10,4),
		(10,5),
		(11,1),
		(11,4),
		(11,5),
		(12,1),
		(12,4),
		(12,5),
		(13,1),
		(13,4),
		(13,5),
		(14,1),
		(14,4),
		(14,5),
		(15,1),
		(15,4),
		(15,5),
		(16,1),
		(16,4),
		(16,5),
		(17,2),
		(17,3),
		(18,2),
		(18,3),
		(19,2),
		(19,3),
		(20,2),
		(20,3),
		(21,2),
		(21,3),
		(22,2),
		(22,3),
		(22,7),
		(23,3),
		(24,2),
		(24,3),
		(25,2),
		(26,2),
		(26,3),
		(27,3),
		(28,2),
		(28,3),
		(29,2),
		(29,3),
		(30,3);
GO

SELECT *
FROM musicaAutor;
GO

INSERT INTO gravadora
VALUES
	(1, 'EMI', 'Rod. Dutra, KM 29.8', 55659856, 89657894, 'emi@emi-music.com.br'),
	(2, 'Polygram', 'Rod. Imigrantes, KM 29.8', 99659856, 75957894, 'polygram@music.com.br'),
	(3, 'BMG', 'Rod. Anchieta, KM 289.8', 99654456, 75957004, 'bmg@music.com.br'),
	(4, 'Som Livre', 'Av. S�o Jos�, KM 289.8', 99657806, 78957004, 'somlivre@music.com.br'),
	(5, 'EPIC', 'Av. Alda, n. 89', 58793321, 89654789, 'epic@music.com.br');
GO

SELECT *
FROM gravadora;
GO

INSERT INTO cd
VALUES
	(1, 1, 'Mais do Mesmo', -5.00, '1985-03-02', 1),
	(2, 3, 'Bate Boca', -15.00, '1999-07-08', 2),
	(3, 4, 'Elis Regina- Essa Mulher', -18.00, '1986-25-05', 3),
	(4, 3, 'A For�a que Nunca Seca', 5.25, '1981-15-07', 4),
	(5, 4, 'Perfil', 20.99, '1987-02-01', 5),
	(6, 2, 'Barry Manilow Greastest Hits', 25.00, '1958-18-12', 1),
	(7, 5, 'Listen Without Prejudice', 28.00, '1975-11-06', 7);
GO

SELECT *
FROM cd;
GO

DROP TABLE itemCD;
go

ALTER TABLE faixa
DROP CONSTRAINT PK__faixa__6B603B31A32E1E31; 
GO

INSERT INTO faixa (idCD, idMusica, nroFaixa)
VALUES	(1, 1, 1),
		(1, 2, 2),
		(1, 3, 3),
		(1, 4, 4),
		(1, 5, 5),
		(1, 6, 6),
		(1, 7, 7),
		(1, 8, 8),
		(1, 9, 9),
		(1, 10, 10),
		(1, 11, 11),
		(1, 12, 12),
		(1, 13, 13),
		(1, 14, 14),
		(1, 15, 15),
		(1, 16, 16),
		(2, 17, 1),
		(2, 18, 2),
		(2, 19, 3),
		(2, 20, 4),
		(2, 21, 5),
		(2, 22, 6),
		(2, 23, 7),
		(2, 24, 8),
		(2, 25, 9),
		(2, 26, 10),
		(2, 27, 11),
		(2, 28, 12),
		(2, 29, 13),
		(2, 30, 14);
go

SELECT *
FROM faixa;
go
INSERT INTO cdCategoria
VALUES	(1, 10, 20),
		(2, 20, 40),
		(3, 30, 60),
		(4, 11, 22),
		(5, 15, 30),
		(6, 25, 50),
		(7, 21, 42),
		(8, 22, 44),
		(9, 9, 18),
		(10, 5, 10);
GO

SELECT *
FROM gravadora;
go

UPDATE gravadora
SET contato=89657894
WHERE idGravadora=1;
GO
