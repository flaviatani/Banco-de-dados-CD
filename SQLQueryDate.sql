USE cdManha20212;
GO

SELECT GETDATE();
go

SELECT DAY(GETDATE()) DIA, MONTH(GETDATE()) MES, YEAR(GETDATE()) ANO;
go

SELECT DATEPART(DAYOFYEAR,GETDATE())[DIA DO ANO], DATEPART(WEEKDAY,GETDATE())[DIA DA SEMANA];
go

--Qual o dia da semana em que você nasceu?
SELECT DAY('2006/03/06')DIA, MONTH('2006/03/06')MES, YEAR('2006/03/06')ANO,DATEPART(WEEKDAY,'2006/03/06')[DIA DA SEMANA];
GO

SELECT DATEADD(DAY, 15, dtLancto)quinzena, dtLancto
FROM cd;
GO

--Acrescentar 2 trimestres (QUARTER)
SELECT DATEADD(QUARTER, 2, dtLancto)quinzena, dtLancto
FROM cd;
GO
--Acrescentar 40 anos (YEAR)
SELECT DATEADD(YEAR, 40, dtLancto)quinzena, dtLancto
FROM cd;
GO
--Acrescentar 100 meses (MONTH)
SELECT DATEADD(MONTH, 100, dtLancto)quinzena, dtLancto
FROM cd;
GO

SELECT DATEDIFF(YEAR,'2006/03/06',GETDATE()) ANOS, DATEDIFF(MONTH,'2006/03/06',GETDATE())%12 MESES, DATEDIFF(DAY,'2006/03/06',GETDATE())%364%12 DIAS;
go

SELECT ABS(precoVenda), precoVenda
FROM cd;
GO

SELECT ROUND(ABS(precoVenda),1), precoVenda
FROM cd;
GO

SELECT ROUND(ABS(precoVenda),-1), precoVenda
FROM cd;
GO

--arrendondar as durações das músicas com 1 casa decimal
