USE cdManha20212;
GO

SELECT nmCD, precoVenda
FROM cd
WHERE precoVenda > (SELECT AVG(ABS(precoVenda))
					FROM cd);
GO

SELECT idCD, nmCD, precoVenda
FROM cd
WHERE idCD IN (SELECT idCD
				FROM faixa
				WHERE idMusica IN(2,4));
GO

--Quais os nomes das músicas do cd 3?
--1ª parte (nome das musicas)
--2ª parte (quais as musicas do cd 3)
--junta as partes

SELECT nmMusica
FROM musica
WHERE idMusica IN (SELECT idMusica
					FROM faixa
					WHERE idCD IN(3));
GO

/*Qual a gravadora, nome do cd e precovenda 
da gravadora do cd 2 que tem preco menor que o cd 5 */
--1ª parte: saber quais cd's são da gravadora do cd 2 (nome preco)
--2ª parte: valor do preco do cd 5

SELECT idCD, idGravadora, nmCD, precoVenda
FROM cd
WHERE idCD = 2 AND precoVenda < (SELECT precoVenda
									FROM cd
									WHERE idCD = 5);
GO

--Desafios Subquery
SELECT nmMusica, duracao
FROM musica
WHERE idMusica IN (SELECT idMusica
					FROM faixa
					WHERE idCD IN(2, 3));
GO

SELECT *
FROM autor
WHERE idAutor IN (SELECT idAutor 
					FROM musicaAutor
					WHERE idMusica IN
					(SELECT idMusica
						FROM musica
						WHERE idMusica IN
						(SELECT idMusica
							FROM faixa
							WHERE idCD=2)));
GO					

SELECT *
FROM gravadora
WHERE idGravadora IN (SELECT idGravadora 
						FROM cd
						WHERE idCD IN (SELECT idCD
							FROM faixa
							WHERE idMusica IN (SELECT idMusica
								FROM musica
								WHERE idMusica IN (SELECT idMusica
									FROM musicaAutor
									WHERE idAutor IN (5,6)))));
GO

SELECT idGravadora, MIN(precoVenda)Menor
FROM cd
GROUP BY idGravadora
HAVING MIN(precoVenda)>(SELECT precoVenda
							FROM cd
							WHERE idCD=6);
GO

SELECT idGravadora, MIN(ABS(precoVenda))
FROM cd
GROUP BY idGravadora
HAVING MIN(ABS(precoVenda)) IN (SELECT ABS(precoVenda)
								FROM cd
								WHERE ABS(precoVenda) IN(5.25, 18, 20.99));
GO

SELECT *
FROM faixa
WHERE idMusica IN (SELECT idMusica
					FROM musica
					WHERE UPPER(nmMusica)LIKE '%AMOR%');