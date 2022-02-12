CREATE DATABASE cdManha20212;
USE cdManha20212;
go

CREATE TABLE musica(
idMusica INTEGER NOT NULL PRIMARY KEY,
nmMusica VARCHAR(50) NOT NULL,
duracao DECIMAL(4,2) --10 minutos -> 10.59
);
GO

CREATE TABLE autor(
idAutor INT NOT NULL PRIMARY KEY,
nmAutor VARCHAR(50) NOT NULL
);
GO

CREATE TABLE musicaAutor(
idMusica INTEGER NOT NULL,
idAutor INT NOT NULL,
FOREIGN KEY (idMusica)
REFERENCES musica (idMusica),
FOREIGN KEY (idAutor)
REFERENCES autor (idAutor)
);
GO

CREATE TABLE gravadora(
idGravadora INTEGER NOT NULL PRIMARY KEY,
nmGravadora VARCHAR(50) NOT NULL,
endereco VARCHAR(100) NOT NULL,
telefone NUMERIC(9) NOT NULL,
contato NUMERIC(9) NOT NULL,
url VARCHAR(80) NOT NULL
);
GO

CREATE TABLE cd(
idCD INT NOT NULL PRIMARY KEY,
idGravadora INT NOT NULL,
nmCD VARCHAR(50) NOT NULL,
precoVenda DECIMAL(5,2) NOT NULL,
dtLancto DATETIME NOT NULL,
cdIndicado INT NOT NULL,
FOREIGN KEY(idGravadora)
REFERENCES gravadora (idGravadora),
FOREIGN KEY (cdIndicado)
REFERENCES cd(idCD)
);
GO

/*ALTER TABLE cd
ADD FOREIGN KEY (cdIndicado)
REFERENCES cd(idCD);
*/
go
/*
ALTER TABLE cd
ALTER COLUMN cdIndicado INTEGER NOT NULL;
*/
go
CREATE TABLE faixa(
idCD INT NOT NULL,
idMusica INT NOT NULL,
nroFaixa INT NOT NULL PRIMARY KEY,
FOREIGN KEY (idCD)
REFERENCES cd(idCD),
FOREIGN KEY (idMusica)
REFERENCES musica(idMusica)
);
GO

CREATE TABLE itemCD(
idCD INT NOT NULL,
idMusica INT NOT NULL,
nroFaixa INT NOT NULL,
FOREIGN KEY (idCD)
REFERENCES cd(idCD),
FOREIGN KEY (idMusica)
REFERENCES musica(idMusica),
FOREIGN KEY (nroFaixa)
REFERENCES faixa(nroFaixa)
);

CREATE TABLE cdCategoria(
idCategoria INTEGER NOT NULL PRIMARY KEY,
menorPreco DECIMAL(5,2) NOT NULL,
maiorPreco DECIMAL(5,2) NOT NULL
);
go