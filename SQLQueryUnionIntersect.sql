USE cdManha20212
GO

/*
Para união de tabelas é feita as operações de conjuntos:
união, intersecção e exceção
Para executar União de Tabelas é necessário seguir as seguintes regras:
- quantidade de colunas em cada SELECT deve ser igual
- tipos de dados das colunas respectivamente igual
UNION -> agrupar a primeira coluna e trazer em ordem alfabética 
a segunda coluna
UNION ALL -> trazer em blocos, por isso a sequência dos SELECTS
influencia
*/

SELECT idMusica Codigo, nmMusica Nome
FROM musica

UNION

SELECT idAutor, nmAutor
FROM autor;
GO

SELECT idAutor Codigo, nmAutor Nome
FROM autor

UNION

SELECT idMusica, nmMusica 
FROM musica;
GO

SELECT idMusica Codigo, nmMusica Nome
FROM musica
UNION ALL
SELECT idAutor, nmAutor
FROM autor;
GO

SELECT idAutor Codigo, nmAutor Nome
FROM autor
UNION ALL
SELECT idMusica, nmMusica 
FROM musica;
GO

SELECT idMusica, nmMusica
FROM musica
WHERE idMusica BETWEEN 6 and 10
UNION 
SELECT idAutor, nmAutor
FROM autor
WHERE idAutor BETWEEN 1 AND 5; 
go

SELECT idAutor, nmAutor
FROM autor
WHERE idAutor BETWEEN 1 AND 5
UNION
SELECT idMusica, nmMusica
FROM musica
WHERE idMusica BETWEEN 6 and 10;
go

SELECT *
FROM gravadora;

SELECT idGravadora
FROM cd
INTERSECT
SELECT idGravadora
FROM gravadora;
GO

--INTERSECT -> intersecção
--Quais são as músicas que foram gravadas (que têm cd)
SELECT idMusica
FROM musica
INTERSECT
SELECT idMusica
FROM faixa;

--Quais os autores que têm musica
SELECT idAutor
FROM autor
INTERSECT 
SELECT idAutor
FROM musicaAutor




