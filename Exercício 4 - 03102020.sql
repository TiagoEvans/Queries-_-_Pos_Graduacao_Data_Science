--Exerc�cio 1
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	DAY(DT_NASCIMENTO)=1

------------------------------------------------------
--Exerc�cio 2
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	MONTH(DT_NASCIMENTO)=3

------------------------------------------------------
--Exerc�cio 3
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	YEAR(DT_NASCIMENTO)=1990

------------------------------------------------------
--Exerc�cio 4
SELECT
	*
,	DATEDIFF(DAY,DT_NASCIMENTO,GETDATE()) 'Dias vividos'
,	DATEDIFF(DAY,DT_NASCIMENTO,GETDATE()) / 365.25 'Idade'
FROM
	TB_PACIENTE	

------------------------------------------------------
--Exerc�cio 5
SELECT
	*
,	DT_NASCIMENTO
,	DATEADD(YEAR,2,DT_NASCIMENTO) 'Data adicionada'
FROM
	TB_PACIENTE

------------------------------------------------------
--Exerc�cio 6
SELECT
	GETDATE()

------------------------------------------------------
--Exerc�cio 7
SELECT
	EOMONTH(GETDATE())

------------------------------------------------------
--Exerc�cio 8
SELECT
	DATENAME(WEEKDAY,GETDATE())

------------------------------------------------------
set language Portuguese
------------------------------------------------------
SELECT D
FROM TB_PACIENTE