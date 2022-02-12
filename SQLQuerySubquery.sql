USE cdManha20212;
GO
SELECT nmCD, precoVenda
FROM cd
WHERE precoVenda > (SELECT AVG(ABS(precoVenda))
					FROM cd);
GO

SELECT idCD, nmCD, precoVenda
FROM cd
WHERE idCD IN (	SELECT idCD
				FROM faixa
				WHERE idMusica IN(2,4));
GO

--Quais os nomes das m�sicas do cd 3?
--1� parte (nome das m�sicas)
SELECT nmMusica
FROM musica;
--2� parte (quais as m�sicas do cd 3)
SELECT idMusica
FROM faixa
WHERE idCD=3;
--junta 1� e 2� parte
SELECT nmMusica
FROM musica 
WHERE idMusica IN  (SELECT idMusica
					FROM faixa
					WHERE idCD=3);
GO
SELECT *
FROM musica 
WHERE idMusica IN  (SELECT idMusica
					FROM faixa
					WHERE idCD IN(3));
GO

/*Qual a idgravadora, nome do cd e precovenda
da gravadora do cd 2 que t�m preco menor que o cd 5
*/
--1� parte: saber quais cd�s s�o da gravadora do cd 2 (nome pre�o)
SELECT idGravadora, nmCD, precoVenda
FROM cd
WHERE idCD=2;
--2� parte: valor do preco do cd 5 
SELECT precoVenda
FROM cd
WHERE idCD=5;
GO

SELECT idGravadora, nmCD, precoVenda
FROM cd
WHERE idCD=2 AND precoVenda < (SELECT precoVenda
								FROM cd
								WHERE idCD=5); 
GO

--Quais as m�sicas (nome e duracao) dos cds 2 e 3?
--1� parte: nome e dura��o das musicas
SELECT nmMusica, duracao
FROM musica;
go
--2� parte: idMusica da faixa dos cd�s 2 e 3
SELECT idMusica
FROM faixa
WHERE idCD IN(2,3);
go
--TUDO JUNTO
SELECT nmMusica, duracao
FROM musica
WHERE idMusica IN (	SELECT idMusica
					FROM faixa
					WHERE idCD IN(2,3));
GO
--Quais os autores do cd 2?
--1� parte: todos os autores
SELECT *
FROM autor;
--2� parte: passar por musicaAutor
SELECT idAutor
FROM musicaAutor;
--3� parte: passar por m�sica
SELECT idMusica
FROM musica;
--4� parte: cd 2 da faixa
SELECT idMusica
FROM faixa
WHERE idCD=2;
--TUDO JUNTO
SELECT *
FROM autor
WHERE idAutor IN (	SELECT idAutor
					FROM musicaAutor
					WHERE idMusica IN (	SELECT idMusica
										FROM musica
										WHERE idMusica IN (	SELECT idMusica
															FROM faixa
															WHERE idCD=2)));
--Quais as gravadoras dos autores 5 e 6?
--1� parte: todas as gravadoras
SELECT *
FROM gravadora;
--2� parte: passa por cd�s
SELECT idgravadora
FROM cd;
--3� parte: passa por faixa
SELECT idCD
FROM faixa;
--4� parte: passa por m�sica
SELECT idMusica
FROM musica;
--5� parte: pega os autores 5 e 6 da musicaAutor
SELECT idMusica
FROM musicaAutor
WHERE idAutor IN (5,6);
-- TUDO JUNTO
SELECT *
FROM gravadora
WHERE idgravadora IN (	SELECT idgravadora
						FROM cd
						WHERE idCD IN (	SELECT idCD
										FROM faixa
										WHERE idMusica IN (	SELECT idMusica
															FROM musica
															WHERE idMusica IN (	SELECT idMusica
																				FROM musicaAutor
																				WHERE idAutor IN (5,6)))));
GO

-- QUAIS AS GRAVADORAS QUE TEM MENOR PRE�O POR GRAVADORA E S�O MAIORES QUE O PRECO DO CD=6
SELECT idGravadora, MIN(precoVenda)Menor
FROM cd
GROUP BY idGravadora
HAVING MIN(precoVenda)>(SELECT precoVenda
						FROM cd
						WHERE idCD=6);
go

--Imagine que gostar�amos de saber quais os CD�s t�m pre�o igual ao menor pre�o de cada gravadora
SELECT idGravadora, MIN(precoVenda)
FROM cd
GROUP BY idGravadora
--e quais s�o os cd�s com os pre�os 5.25, 18, 20.99?
SELECT idCD
FROM cd
WHERE ABS(precoVenda) IN(5.25, 18, 20.99);
GO

SELECT idGravadora, MIN(ABS(precoVenda))MenorPreco
FROM cd
GROUP BY idGravadora
HAVING MIN(ABS(precoVenda)) IN (SELECT ABS(precoVenda)
								FROM cd
								WHERE ABS(precoVenda) IN(5.25, 18, 20.99));
go
-- Quais os cd's e as faixas que t�m musica contenha a palavra AMOR?
--1� PARTE: Buscar tudo da faixa
SELECT *
FROM faixa;
--2� PARTE: Buscar as m�sicas com a palavra AMOR (LIKE, UPPER/LOWER)
SELECT idMusica
FROM musica
WHERE UPPER(nmMusica) LIKE '%AMOR%';

--3� PARTE: Buscar as faixas das m�sicas que retornaram na 1� parte
SELECT nroFaixa
FROM faixa
WHERE idMusica IN (18, 22, 25, 31);

--JUNTA TUDO
SELECT *
FROM faixa
WHERE idMusica IN (SELECT idMusica
					FROM musica
					WHERE UPPER(nmMusica) LIKE '%AMOR%');