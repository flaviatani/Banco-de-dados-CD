USE cdManha20212;

/*A Junção de tabelas requer o relacionamento entre as tabelas
Para isso cada coluna é de sua respectiva tabela, sendo assim a 
utilização do operador .(ponto) se faz necessário, além disso as
cláusulas WHERE e ON são usadas para identificar qual o relacionamento
existente nesta junção.


Regras: 
1) Haver relacionamento entre as tabelas
2) Utilizar a referência da tabela para cada coluna
3) Cláusula ON para a identificação do relacionamento
A união é caracterizada como horizontal, por isso deve-se 
identificar a tupla que não há repetição.

SINTAXE:
SELECT tabela1.coluna1, tabela2.coluna2, tabela1.coluna3
FROM tabela1 [INNER JOIN / OUTER JOIN] tabela2
ON tabela1.colunaPK = tabela2.colunaFK
WHERE condição
GROUP BY coluna-agregação
HAVING condição-agregação
ORDER BY coluna-ord;
*/
--Para a realização da Junção de União Regular (inner join) --> Intersecção
--EX.:


SELECT cd.codGravadora, cd.nmCD, gravadora.nmGravadora
FROM cd,gravadora
WHERE cd.codGravadora=gravadora.codGravadora;
GO

SELECT cd.codGravadora, cd.nmCD, gravadora.nmGravadora
FROM cd INNER JOIN gravadora
ON cd.codGravadora=gravadora.codGravadora;
GO

--QUAIS AS MÚSICAS QUE FORAM GRAVADAS
SELECT faixa.codMusica, musica.nmMusica, musica.duracao, faixa.codCD, cd.nmCD
FROM faixa, musica,cd
WHERE faixa.codMusica=musica.codMusica AND cd.codCD=faixa.codCD;
GO

SELECT faixa.codMusica, musica.nmMusica, musica.duracao, faixa.codCd, cd.nmCD
FROM musica INNER JOIN faixa
ON faixa.codMusica=musica.codMusica
INNER JOIN cd
ON cd.codCD=faixa.codCD;
GO

--Quais os autores das músicas do cd 2?
SELECT autor.nmAutor, musica.nmMusica, musica.duracao, faixa.codCD
FROM autor, musicaAutor, musica, faixa
WHERE autor.codAutor=musicaAutor.codAutor AND musicaAutor.codMusica=musica.codMusica AND
musica.codMusica=faixa.codMusica AND faixa.codCD=2;
GO


SELECT autor.nmAutor, musica.nmMusica, musica.duracao, faixa.codCD
FROM autor INNER JOIN musicaAutor
ON autor.codAutor=musicaAutor.codAutor
INNER JOIN musica
ON musicaAutor.codMusica=musica.codMusica 
INNER JOIN faixa
ON musica.codMusica=faixa.codMusica
WHERE faixa.codCD=2; 
GO

--Buscar quais as gravadoras que têm cd!

SELECT gravadora.codGravadora, gravadora.nmGravadora, gravadora.URL, cd.nmCd
FROM cd, gravadora
WHERE cd.codGravadora=gravadora.codGravadora;
GO

SELECT gravadora.codGravadora, gravadora.nmGravadora, gravadora.URL, cd.nmCd
FROM cd INNER JOIN gravadora
ON cd.codGravadora=gravadora.codGravadora;
GO

INSERT INTO gravadora
VALUES (12, 'Fatec',NULL, 5851-8949, 5851-5829, NULL); 
go

SELECT gravadora.nmGravadora, cd.codGravadora, cd.nmCD
FROM gravadora, cd
WHERE gravadora.idGravadora=cd.idGravadora;
GO

SELECT gravadora.nmGravadora, cd.codGravadora, cd.nmCD
FROM gravadora INNER JOIN cd
ON gravadora.idGravadora=cd.idGravadora;
GO

--Buscar quais os autores da gravadora 3 COM SEU RESPECTIVO NOME
SELECT DISTINCT autor.codAutor, autor.nmAutor, gravadora.codGravadora, gravadora.nmGravadora 
FROM autor, musicaAutor, musica, faixa, cd, gravadora
WHERE	autor.codAutor=musicaAutor.codAutor 
AND		musicaAutor.codMusica=musica.codMusica
AND		musica.codMusica=faixa.codMusica
AND		faixa.codCD=cd.codCD
AND		cd.codGravadora=gravadora.codGravadora
AND		cd.codGravadora=3;
GO

SELECT DISTINCT autor.codAutor, autor.nmAutor, gravadora.nmGravadora, gravadora.codGravadora
FROM gravadora INNER JOIN cd
ON cd.codGravadora=gravadora.codGravadora
INNER JOIN faixa
ON faixa.codCD=cd.codCD
INNER JOIN musica
ON musica.codMusica=faixa.codMusica
INNER JOIN musicaAutor
ON musicaAutor.codMusica=musica.codMusica
INNER JOIN autor
ON autor.codAutor=musicaAutor.codAutor
WHERE cd.codGravadora=3;
GO




/*para a realização de união o apontamento segue para a tabela que tenha PK
--para a realização da intersecção aponto para a tabela de FK
--Se a 1ª tabela for a que possui PK -> UNIÃO LEFT OUTER JOIN
--Se a 1ª tabela for a que possui FK -> INTERSECÇÃO
--Se a 1ª tabela for a que possui PK e utiliza WHERE com a coluna FK e IS NULL -> EXCEÇãO
*/

--Quais são as músicas que estão nos cd´s gravados (INTERSECT)
SELECT musica.nmMusica, musica.duracao, faixa.idCD, cd.nmCD
FROM musica INNER JOIN faixa
ON musica.idMusica = faixa.idMusica
INNER JOIN cd
ON faixa.idCD = cd.idCD;
go

--Quais são todas as músicas gravadas ou não em cd´s (UNION olhar para a tabela que têm a PK)
SELECT musica.idmusica, musica.nmMusica, musica.duracao, faixa.idCD, cd.nmCD
FROM musica LEFT OUTER JOIN faixa
ON musica.idMusica = faixa.idMusica
RIGHT OUTER JOIN cd
ON faixa.idCD = cd.idCD;
go

--Inserir 3 músicas

/*ALTER TABLE faixa
DROP CONSTRAINT PK__faixa__nroFaixa__30E
*/
INSERT INTO musica
VALUES	(31,'Paradise', 4.21),
		(32, 'Viva La Vida', 4.03),
		(33, 'A Sky Full Of Stars', 4.14);
go

--Quais os cd´s que não foram gravados (EXCEPT)
SELECT faixa.idmusica, musica.nmMusica, musica.duracao, faixa.idCD, cd.nmCD
FROM musica LEFT OUTER JOIN faixa
ON musica.idMusica = faixa.idMusica
RIGHT OUTER JOIN cd
ON faixa.idCD = cd.idCD
WHERE faixa.idCD IS NULL;
GO

--Quais as músicas (id e nm e duracao) dos cd´s (id) gravados
SELECT faixa.idMusica, musica.nmMusica, musica.duracao, faixa.idCD
FROM faixa LEFT OUTER JOIN musica --intersecção
ON faixa.idMusica=musica.idMusica;
GO

--Quais as músicas (id e nm e duracao) dos cd´s (id) gravados (PARA UNIÃO olhar para tabela com pk)
SELECT m.idMusica, m.nmMusica, m.duracao, f.idCD
FROM musica m LEFT OUTER JOIN faixa f
ON m.idMusica = f.idMusica;
GO

--Quais as músicas (id e nm e duracao) e cd´s (id) que não foram gravados (PARA EXCEÇÃO)
SELECT m.idMusica, m.nmMusica, m.duracao, f.idCD, c.nmCD
FROM musica m FULL OUTER JOIN faixa f
ON m.idMusica = f.idMusica
FULL OUTER JOIN cd c
ON f.idCD = c.idCD
WHERE f.idCD IS NULL;
GO

--LEFT OUTER JOIN
--LEFT APONTA PARA A ESQUERDA (1ª TABELA QUE APARECE NO FROM)
--UNIÃO: PK ESTÁ À ESQUERDA
--INTERSECÇÃO: FK ESTÁ À ESQUERDA

--RIGHT OUTER JOIN
--RIGHT APONTA PARA A DIREITA (2ª TABELA QUE APARECE NO FROM)
--UNIÃO: PK QUE ESTIVER À DIREIRA (NA 2ª TABELA)
--INTERSECÇÃO: FK QUE ESTÁ À DIREITA (2ª TABELA DO FROM)


--QUAIS OS NOMES DOS CD´S, NRO DA FAIXA E OS NOMES DAS MUSICAS APENAS DO CD 1 E 2--intersecção

SELECT cd.nmCD, faixa.nroFaixa, musica.nmMusica
FROM cd RIGHT OUTER JOIN faixa --Tabela Faixa tem a FK
ON cd.idCD=faixa.idCD
LEFT OUTER JOIN musica -- Tabela Faixa têm a FK
ON faixa.idMusica=musica.idMusica
WHERE faixa.idCD IN (1,2);
GO

--QUAIS OS NOMES DOS CD´S, NRO DA FAIXA E OS NOMES DAS MUSICAS APENAS DO CD 1 E 2
--UNIÃO
SELECT cd.nmCD, faixa.nroFaixa, musica.nmMusica, cd.idCD
FROM cd LEFT OUTER JOIN faixa
ON cd.idCD = faixa.idCD
RIGHT OUTER JOIN musica
ON faixa.idMusica = musica.idMusica
WHERE faixa.idCD IN(1,2);
GO
SELECT c.nmCD, f.nroFaixa, m.nmMusica, f.idCD
FROM cd c LEFT OUTER JOIN faixa f
ON c.idCD = f.idCD
RIGHT OUTER JOIN musica m
ON f.idMusica = m.idMusica
WHERE f.idCD IN(1,2);
GO
--QUAIS OS NOMES DOS CD´S, NRO DA FAIXA E OS NOMES DAS MUSICAS QUE NÃO ESTEJAM NOS CD´S 1 E 2
--EXCEÇÃO
SELECT cd.nmCD, faixa.nroFaixa, musica.nmMusica, cd.idCD
FROM cd FULL OUTER JOIN faixa
ON cd.idCD = faixa.idCD
FULL OUTER JOIN musica
ON faixa.idMusica = musica.idMusica
WHERE faixa.idCD IS NULL OR faixa.idCD NOT IN(1,2);
GO


SELECT c.nmCD, f.nroFaixa, m.nmMusica, f.idCD
FROM cd c LEFT OUTER JOIN faixa f
ON c.idCD = f.idCD
RIGHT OUTER JOIN musica m
ON f.idMusica = m.idMusica
WHERE f.idCD IN(1,2) OR f.idCD IS NULL;
GO


--INSERIR 2 MÚSICAS

INSERT INTO musica
VALUES (32, 'Mama Mia', '02.39');

INSERT INTO musica
VALUES (33, 'I have a dream', '04.24');
GO
--QUAIS AS MÚSICAS QUE NÃO FORAM GRAVADAS
SELECT cd.nmCD, faixa.nroFaixa, musica.nmMusica
FROM cd LEFT OUTER JOIN faixa 
ON cd.idCD=faixa.idCD 
RIGHT OUTER JOIN musica
ON faixa.idMusica=musica.idMusica
WHERE faixa.idMusica IS NULL;
GO
--QUAIS OS NOMES DOS CD´S, NRO DA FAIXA E OS NOMES DAS MUSICAS dos cd´s 1 e 2

SELECT a.nmCD, b.nroFaixa, c.nmMusica
FROM cd a, faixa b, musica c
WHERE a.idCD IN (1,2)
AND a.idCD=b.idCD
AND b.idMusica=c.idMusica;
GO

SELECT a.nmCD, b.nroFaixa, c.nmMusica
FROM cd a INNER JOIN faixa b
ON a.idCD=b.idCD
INNER JOIN musica c
ON b.idMusica=c.idMusica
WHERE a.idCD IN (1,2);
GO




--DESAFIOS

/*Quais os cd´s, o preco de venda e cd da categoria
dos precos que estejam entre o menor preço e maior preço da categoria
*/

SELECT cd.idCD, cd.precoVenda
FROM cd

UNION ALL

SELECT cdCategoria.idCategoria, cdCategoria.menorPreco
FROM cdCategoria
WHERE menorPreco BETWEEN 4.50 AND 20.00

UNION ALL

SELECT cdCategoria.idCategoria, cdCategoria.maiorPreco
FROM cdCategoria
WHERE maiorPreco BETWEEN 4.50 AND 20.00
GO

SELECT cdCategoria.idCategoria, cdCategoria.menorPreco, cdCategoria.maiorPreco
FROM cdCategoria
WHERE maiorPreco BETWEEN 4.50 AND 20.00 and menorPreco BETWEEN 4.50 AND 20.00;
go

SELECT cd.idCD, cd.precoVenda
FROM cd

UNION ALL

SELECT cdCategoria.idCategoria, cdCategoria.menorPreco
FROM cdCategoria
WHERE cdCategoria.menorPreco BETWEEN 4.50 AND 20.00

UNION ALL

SELECT cdCategoria.idCategoria,cdCategoria.maiorPreco
FROM cdCategoria
WHERE cdCategoria.maiorPreco BETWEEN 4.50 AND 20.00
GO

SELECT cdCategoria.idCategoria,cdCategoria.menorPreco, cdCategoria.maiorPreco
FROM cdCategoria 
WHERE (cdCategoria.menorPreco BETWEEN 4.50 AND 20.00) AND (cdCategoria.maiorPreco BETWEEN 4.50 AND 20.00);
GO

SELECT cd.idCD, cd.precoVenda
FROM cd
UNION ALL
SELECT cdCategoria.idCategoria, cdCategoria.menorPreco
FROM cdCategoria
UNION ALL
SELECT cdCategoria.idCategoria, cdCategoria.maiorPreco
FROM cdCategoria;
GO

--Quais as músicas(id, nm) e autores(id, nm) da gravadora(id, nm) 3
SELECT	DISTINCT g.idGravadora, g.nmGravadora,
		m.idMusica, m.nmMusica,
		a.idAutor, a.nmAutor
FROM	gravadora g, cd c, faixa f, musica m, musicaAutor ma, autor a
WHERE	g.idGravadora = c.idGravadora
AND		c.idCD = f.idCD
AND		f.idMusica = m.idMusica
AND		m.idMusica = ma.idMusica
AND		ma.idAutor = a.idAutor
AND		c.idGravadora = 3;
GO

SELECT musica.nmMusica,autor.nmAutor, gravadora.nmGravadora, cd.idGravadora
FROM gravadora RIGHT OUTER JOIN cd
ON gravadora.idGravadora=cd.idGravadora
RIGHT OUTER JOIN faixa
ON faixa.idCD=cd.idCD
LEFT OUTER JOIN musica
ON musica.idMusica=faixa.idMusica
RIGHT OUTER JOIN musicaAutor
ON musicaAutor.idMusica=musica.idMusica
LEFT OUTER JOIN autor
ON autor.idAutor=musicaAutor.idAutor
WHERE cd.idGravadora=3;
GO

SELECT DISTINCT musica.nmMusica, autor.nmAutor, cd.idGravadora
FROM autor RIGHT OUTER JOIN musicaAutor
ON autor.idAutor=musicaAutor.idAutor
LEFT OUTER JOIN musica
ON musicaAutor.idMusica=musica.idMusica
RIGHT OUTER JOIN faixa
ON musica.idMusica=faixa.idMusica
LEFT OUTER JOIN cd
ON faixa.idCD=cd.idCD
WHERE cd.idGravadora=3;
GO

--QUAIS AS MÚSICAS(nmMusica) QUE SEJAM DOS CD´S(nmCD) COM PRECO MENOR QUE 15

SELECT musica.nmMusica, cd.nmCD, cd.precoVenda
FROM musica LEFT OUTER JOIN faixa
ON musica.idMusica=faixa.idMusica
RIGHT OUTER JOIN cd
ON cd.idCD=faixa.idCD
WHERE cd.precoVenda<15;
GO






SELECT a.nmCD, a.precoVenda, b.idCategoria
FROM cd a, cdCategoria b
WHERE a.precoVenda BETWEEN b.menorPreco AND b.maiorPreco;
GO



