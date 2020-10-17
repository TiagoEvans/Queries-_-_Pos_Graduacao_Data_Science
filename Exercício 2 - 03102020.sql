--Exercício 1
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	SEXO=2

-----------------------------------------------
--Exercício 2
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	PACIENTE = 'MARINA'

-----------------------------------------------
--Exercício 3
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	ESTADO_CIVIL = 9 AND
	SEXO = 1

-----------------------------------------------
--Exercício 4
SELECT
	*
FROM
	TB_PASSAGEM
WHERE
	DATA_ADMISSAO = '2013-11-20 16:01:04.000' OR
	DT_ALTA = '2014-01-23 17:39:36.000'

-----------------------------------------------
--Exercício 5
SELECT
	*
FROM
	TB_PACIENTE
WHERE
	DT_NASCIMENTO BETWEEN '1990-01-01' AND '2000-12-13'
ORDER BY
	DT_NASCIMENTO

-----------------------------------------------
--Exercício 6
SELECT
	*
FROM
	TB_CONSOLIDADO
WHERE
--	GRUPO_DIAGNOSTICO NOT IN ('NÃO INFORMADO')
	NOT (GRUPO_DIAGNOSTICO='NÃO INFORMADO')