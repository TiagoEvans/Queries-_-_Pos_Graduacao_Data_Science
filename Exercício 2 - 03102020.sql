--Exerc�cio 1
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	SEXO=2

-----------------------------------------------
--Exerc�cio 2
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	PACIENTE = 'MARINA'

-----------------------------------------------
--Exerc�cio 3
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	ESTADO_CIVIL = 9 AND
	SEXO = 1

-----------------------------------------------
--Exerc�cio 4
SELECT
	*
FROM
	TB_PASSAGEM
WHERE
	DATA_ADMISSAO = '2013-11-20 16:01:04.000' OR
	DT_ALTA = '2014-01-23 17:39:36.000'

-----------------------------------------------
--Exerc�cio 5
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	DT_NASCIMENTO BETWEEN '1990-01-01' AND '2000-12-13'
ORDER BY
	DT_NASCIMENTO

-----------------------------------------------
--Exerc�cio 6
SELECT
	*
FROM
	TB_CONSOLIDADO
WHERE
--	GRUPO_DIAGNOSTICO NOT IN ('N�O INFORMADO')
	NOT (GRUPO_DIAGNOSTICO='N�O INFORMADO')