USE cdManha20212;
GO

SELECT AVG(precoVenda) Media
FROM cd;
GO

SELECT *
FROM cd;
GO

SELECT COUNT(*)QtdeGravadora
FROM gravadora;
GO

SELECT COUNT(*)QtdeCD
FROM cd;
GO

SELECT COUNT(*)QtdeMusica
FROM musica;
GO

SELECT COUNT(*)QtdeMusicaAutor
FROM musicaAutor;
GO

SELECT COUNT(*)QtdeCategoria
FROM cdCategoria;
GO

SELECT COUNT(*)QtdeFaixa
FROM faixa;
GO

SELECT AVG(precoVenda)Media
FROM cd;
GO

SELECT SUM(duracao)Soma
FROM musica;
GO

SELECT MIN(menorPreco)Menor, MAX(maiorPreco)Maior
FROM cdCategoria;
GO

SELECT ROUND(STDEV(precoVenda),2) DesvioPadrao, ROUND(VAR(precoVenda),2)Variancia
FROM cd;
GO

--AGRUPAMENTO POR VALOR SEMELHANTE -> CLAUSULA GROUP BY
SELECT *
FROM cd;
GO

SELECT AVG(precoVenda) Media, idGravadora
FROM cd
GROUP BY idGravadora;
GO

SELECT *
FROM musicaAutor;
GO

SELECT COUNT(idAutor) Autores, idMusica
FROM musicaAutor
GROUP BY idMusica;
GO

--Quantas músicas tem cada cd? -> count(*)
SELECT *
FROM faixa;
GO
SELECT COUNT(*)qtdeMusicas, idCD
FROM faixa
GROUP BY idCD;
GO
--Qual a média de preço dos cd´s por gravadora? -> AVG()
SELECT AVG(precoVenda)MediaPreco, idgravadora
FROM cd
GROUP BY idgravadora;
GO
--Qual a menor data de lançamento?
SELECT MIN(dtLancto)MenorData
FROM cd;
GO
--Qual a maior duração?
SELECT MAX(duracao)MaiorDuracao
FROM musica;
GO
--Qual o total de autores agrupados por música?
SELECT COUNT(*)qtdeAutor, idMusica
FROM musicaAutor
GROUP BY idMusica;
GO
--Qual o total de autores agrupados por música das músicas menores que 15?
SELECT COUNT(*)qtdeAutor, idMusica
FROM musicaAutor
WHERE idMusica<15
GROUP BY idMusica;
GO
--Monte o CD=3 com a menor quantidade de músicas, sabendo-se que um cd possui o total de 77 min.
SELECT *
FROM musica
ORDER BY duracao DESC;
GO

SELECT SUM(duracao)
FROM musica
GO

SELECT SUM(duracao)
FROM musica
WHERE idMusica IN(8,12,15,10,5,30,13,4,6,2,22,17,11,23,25,28,9,20);
GO

INSERT INTO faixa (idCD, idMusica, nroFaixa)
VALUES	(3,8,1),
		(3,12,2),
		(3,15,3),
		(3,15,4),
		(3,10,5),
		(3,5,6),
		(3,30,7),
		(3,13,8),
		(3,4,9),
		(3,6,10),
		(3,22,11),
		(3,2,12),
		(3,17,13),
		(3,11,14),
		(3,23,15),
		(3,25,16),
		(3,28,17),
		(3,9,18),
		(3,20,19);
GO

--Apresente a URL em maiúscula UPPER() e endereço em minúculo LOWER()
SELECT UPPER(url), LOWER(endereco)
FROM gravadora;
GO
--Quais as gravadoras que estão na Rod LEFT(coluna, qtdeletras)
SELECT *
FROM gravadora
WHERE UPPER(LEFT(endereco,3))='ROD';
GO

SELECT *
FROM gravadora
WHERE LOWER(LEFT(endereco,2))='av';
GO

SELECT LEFT(endereco,3)
FROM gravadora;
GO
--Qual seu nome em ASCII()
SELECT ASCII('Fatec');
SELECT ASCII('F')F,ASCII('a')a,ASCII('t')t,ASCII('e')e,ASCII('c')c, ASCII('f')+ASCII('a')+ASCII('t')+ASCII('e')+ASCII('c')Total;
GO

--Quais alunos estão na faixa de 500 - 600 -> para ganhar presença na aula de hj...
Select ASCII('F') F,ASCII('e') E,ASCII('l') L,ASCII('i') I,ASCII('p') P,ASCII('e'),
ASCII('F') + ASCII('e') + ASCII('l') + ASCII('i') + ASCII('p') + ASCII('e') as Total

[11:52] ALISSON DOS SANTOS DE SOUSA
SELECT ASCII('A')A,ASCII('L')L,ASCII('I')I,ASCII('S')S,ASCII('S')S,ASCII('O')O,ASCII('N')n, +ASCII('A')+ASCII('L')+ASCII('I')+ASCII('S')+ASCII('S')+ASCII('O')+ASCII('N');

Select ASCII('C') F,ASCII('a') E,ASCII('m') L,ASCII('i') I,ASCII('l') P,ASCII('a'),
ASCII('C') + ASCII('a') + ASCII('m') + ASCII('i') + ASCII('l') + ASCII('a') as Total

SELECT ASCII ('J')J, ASCII('o')O, ASCII ('s')S, ASCII('e'), ASCII('j')+ASCII('o')+ASCII('s') +ASCII('é')Total;
