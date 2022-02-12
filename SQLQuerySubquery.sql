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

--Quais os nomes das músicas do cd 3?
--1ª parte (nome das músicas)
SELECT nmMusica
FROM musica;
--2ª parte (quais as músicas do cd 3)
SELECT idMusica
FROM faixa
WHERE idCD=3;
--junta 1ª e 2ª parte
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
da gravadora do cd 2 que têm preco menor que o cd 5
*/
--1ª parte: saber quais cd´s são da gravadora do cd 2 (nome preço)
SELECT idGravadora, nmCD, precoVenda
FROM cd
WHERE idCD=2;
--2ª parte: valor do preco do cd 5 
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

--Quais as músicas (nome e duracao) dos cds 2 e 3?
--1ª parte: nome e duração das musicas
SELECT nmMusica, duracao
FROM musica;
go
--2ª parte: idMusica da faixa dos cd´s 2 e 3
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
--1ª parte: todos os autores
SELECT *
FROM autor;
--2ª parte: passar por musicaAutor
SELECT idAutor
FROM musicaAutor;
--3ª parte: passar por música
SELECT idMusica
FROM musica;
--4ª parte: cd 2 da faixa
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
--1ª parte: todas as gravadoras
SELECT *
FROM gravadora;
--2ª parte: passa por cd´s
SELECT idgravadora
FROM cd;
--3ª parte: passa por faixa
SELECT idCD
FROM faixa;
--4ª parte: passa por música
SELECT idMusica
FROM musica;
--5ª parte: pega os autores 5 e 6 da musicaAutor
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

-- QUAIS AS GRAVADORAS QUE TEM MENOR PREÇO POR GRAVADORA E SÃO MAIORES QUE O PRECO DO CD=6
SELECT idGravadora, MIN(precoVenda)Menor
FROM cd
GROUP BY idGravadora
HAVING MIN(precoVenda)>(SELECT precoVenda
						FROM cd
						WHERE idCD=6);
go

--Imagine que gostaríamos de saber quais os CD´s têm preço igual ao menor preço de cada gravadora
SELECT idGravadora, MIN(precoVenda)
FROM cd
GROUP BY idGravadora
--e quais são os cd´s com os preços 5.25, 18, 20.99?
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
-- Quais os cd's e as faixas que têm musica contenha a palavra AMOR?
--1ª PARTE: Buscar tudo da faixa
SELECT *
FROM faixa;
--2ª PARTE: Buscar as músicas com a palavra AMOR (LIKE, UPPER/LOWER)
SELECT idMusica
FROM musica
WHERE UPPER(nmMusica) LIKE '%AMOR%';

--3ª PARTE: Buscar as faixas das músicas que retornaram na 1ª parte
SELECT nroFaixa
FROM faixa
WHERE idMusica IN (18, 22, 25, 31);

--JUNTA TUDO
SELECT *
FROM faixa
WHERE idMusica IN (SELECT idMusica
					FROM musica
					WHERE UPPER(nmMusica) LIKE '%AMOR%');