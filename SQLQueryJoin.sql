USE cdManha20212;
go

/*
JUNÇÃO DE TABELAS
Operações realizadas são: união, intersecção e exceção
Lógica de apresentação horizontal
Para que não haja repetições da extração de dados recomenda-se
a utilização do DISTINCT
Para que possa realizar **JOIN**
É necessário que haja relacionamento entre as tabelas
(subquery + union/intersect/except)

As colunas são representadas com o uso do operador (.) ponto
somado a identificação da tabela a qual pertence
EX.: musica.duracao
Dessa maniera sei que a tabela musica tem a coluna duração
Utiliza-se também a cláusula ON para representar os relacionamentos
onde as colunas devem ser iguais e as tabelas diferentes.
EX.: ON gravadora.idGravadora = cd.idGravadora
Caso utilize ao invés de:
INNER JOIN -> UNION
FULL OUTER JOIN -> UNION
LEFT  OUTER JOIN -> PK(intersecção)/FK(união)/ IS NULL(except)
RIGHT OUTER JOIN 
CROSS JOIN -> cruzamento do relacionamento entre tabelas

Há a utilização de (,) no lugar do JOIN
desta maneira usamos a representação do relacionamento 
na cláusula WHERE -> não existindo o uso da cláusula ON

SINTAXE:
SELECT [DISTINCT|ALL] {*|tabela1.coluna(1s, tabela2.coluna2)}
FROM tabela1 {,|INNER JOIN|{FULL|RIGHT|LEFT}OUTER JOIN} tabela2
--PARA (,) usa-se WHERE tabela1.colPK = tabela2.colFK AND condição
--SENÃO usa-se ON tabela1.colPK = tabela2.colFK
WHERE condição;
*/

--Quais são as gravadoras que têm cd gravado?

SELECT gravadora.idGravadora, gravadora.nmGravadora, cd.nmCD, cd.precoVenda
FROM gravadora INNER JOIN cd
ON gravadora.idGravadora = cd.idGravadora;
GO

SELECT gravadora.idGravadora, gravadora.nmGravadora, cd.nmCD, cd.precoVenda
FROM gravadora, cd
WHERE gravadora.idGravadora = cd.idGravadora;
GO

SELECT g.idGravadora, g.nmGravadora, c.nmCD, c.precoVenda
FROM gravadora g INNER JOIN cd c
ON g.idGravadora = c.idGravadora; 
GO

--Quais as músicas (id e nome) que estão no cd 1(nome)
SELECT m.idMusica, m.nmMusica, cd.nmCD
FROM musica m INNER JOIN faixa
ON m.idMusica = faixa.idMusica
INNER JOIN cd
ON faixa.idCD = cd.idCD
WHERE faixa.idCD = 1;
GO

SELECT m.idMusica, m.nmMusica, cd.nmCD
FROM musica m, faixa f, cd
WHERE m.idMusica = f.idMusica AND f.idCD = cd.idCD AND f.idCD = 1;
GO

--Quais os autores(nm) das músicas(nm) do cd 2(nm)?
SELECT a.nmAutor, m.nmMusica, c.nmCD
FROM autor a, musica m, cd c, musicaAutor ma, faixa f
WHERE	a.idAutor = ma.idAutor
AND		ma.idMusica = m.idMusica
AND		m.idMusica = f.idMusica
AND		f.idCD = c.idCD
AND		f.idCD = 2;
GO

SELECT a.nmAutor, m.nmMusica, c.nmCD
FROM autor a INNER JOIN  musicaAutor ma
ON a.idAutor = ma.idAutor
INNER JOIN musica m
ON ma.idMusica = m.idMusica
INNER JOIN faixa f
ON m.idMusica = f.idMusica
INNER JOIN cd c 
ON f.idCD = c.idCD
WHERE f.idCD = 2;
GO

--Quais as gravadoras, autores, musicas, dos cd´s 1,2 e 3
SELECT DISTINCT g.nmGravadora, a.nmAutor, m.nmMusica, c.nmCD
FROM gravadora g INNER JOIN cd c 
ON g.idGravadora = c.idGravadora
INNER JOIN faixa f
ON c.idCD = f.idCD
INNER JOIN musica m
ON f.idMusica = m.idMusica
INNER JOIN musicaAutor ma
ON m.idMusica = ma.idMusica
INNER JOIN autor a
ON ma.idAutor = a.idAutor
WHERE f.idCD IN (1,2,3);
GO

SELECT DISTINCT g.nmGravadora, a.nmAutor, m.nmMusica, c.nmCD
FROM gravadora g, cd c, faixa f, musica m, musicaAutor ma, autor a
WHERE	g.idGravadora = c.idGravadora
AND		c.idCD = f.idCD
AND		f.idMusica = m.idMusica
AND		m.idMusica = ma.idMusica
AND		ma.idAutor = a.idAutor
AND		f.idCD IN (1,2,3);
GO

