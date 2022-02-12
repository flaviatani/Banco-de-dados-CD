USE cdManha20212;
GO

SELECT idMusica, duracao
FROM musica;
GO

SELECT idCD, nmCD, precoVenda
FROM cd;
GO

SELECT *
FROM cdCategoria;
GO

SELECT *
FROM musica
ORDER BY duracao DESC, nmMusica ASC;
GO

SELECT *
FROM autor
ORDER BY nmAutor ASC;
GO

SELECT nmMusica, duracao
FROM musica
WHERE duracao>3;
GO

SELECT *
FROM faixa
WHERE idCD=3;
GO

SELECT *
FROM cd
WHERE idCD=3;
GO

SELECT *
FROM gravadora
WHERE idGravadora=3;
GO

SELECT *
FROM musica
WHERE duracao<5;
GO

SELECT *
FROM cd
WHERE precoVenda>20;
GO

SELECT *
FROM cdCategoria
WHERE maiorPreco<=100;

SELECT *
FROM autor
WHERE idAutor>=2;
GO

SELECT *
FROM faixa
WHERE nroFaixa<>13;
GO

SELECT nmCD, precoVenda, idGravadora
FROM cd
WHERE idGravadora=2 AND precoVenda>10;
GO

SELECT *
FROM cd
WHERE dtLancto>='1980-01-01' AND dtLancto<='1989-31-12';
GO

SELECT *
FROM musica
WHERE	idMusica=10 OR
		idMusica=15 OR
		idMusica=18 OR
		idMusica=20 OR
		idMusica=38;
GO

SELECT nmCD, precoVenda
FROM cd
WHERE NOT (precoVenda<15);
GO

SELECT *
FROM musica
WHERE duracao>=5 AND duracao<=9;
GO

SELECT *
FROM faixa
WHERE	nroFaixa=11 OR
		nroFaixa=13 OR
		nroFaixa=17 OR
		nroFaixa=33 OR
		nroFaixa=50;
GO

SELECT *
FROM gravadora
ORDER BY nmGravadora;
GO

SELECT *
FROM cdCategoria
WHERE menorPreco>20 AND maiorPreco<40;
GO

--inserir 3 gravadoras sem endereço
ALTER TABLE gravadora
ALTER COLUMN endereco VARCHAR(100) NULL;

SELECT *
FROM gravadora;
GO

INSERT INTO gravadora (idGravadora, nmGravadora, telefone, contato, url)
VALUES	(6, 'SONY', 58515544, 956234789, 'sony@music.com.br'),
		(7, 'PROVOX', 31071001, 31064144, 'provox@musica.com'),
		(8, 'ALQUIMIA', 558144578, 55053745, 'alquimia@musica.com');
go

SELECT *
FROM gravadora
WHERE endereco IS NULL;
GO

SELECT *
FROM gravadora
WHERE endereco IS NOT NULL;
GO

SELECT *
FROM cd
WHERE dtLancto BETWEEN '1990-01-01' AND '1999-31-12';
GO

SELECT *
FROM musica
WHERE duracao BETWEEN 5 AND 9;
GO

SELECT *
FROM musica
WHERE	idMusica IN(10,15,18,20,38);
GO

SELECT *
FROM faixa
WHERE	nroFaixa IN (11,13,17,33,50);
GO

SELECT *
FROM cd
WHERE precoVenda LIKE '-%'; --% -> 0, 1 OU MAIS CARACTERES E _ -> 1 POSIÇÃO
GO

SELECT *
FROM musica
WHERE nmMusica LIKE '_A%';
GO

SELECT *
FROM musica
WHERE nmMusica LIKE '%O_';
GO