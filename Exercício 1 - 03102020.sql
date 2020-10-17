-- EXERCÍCIO 1
SELECT * FROM TB_PACIENTE
-----------------------------------------------
--EXERCÍCIO 2
SELECT
	GRUPO_DIAGNOSTICO
FROM
	TB_GRUPO_DIAGNOSTICO
-----------------------------------------------
--EXERCÍCIO 3
SELECT
	GRUPO_DIAGNOSTICO
FROM
	TB_GRUPO_DIAGNOSTICO
ORDER BY GRUPO_DIAGNOSTICO ASC
-----------------------------------------------
--EXERCÍCIO 4
SELECT *
FROM 
	TB_CONSOLIDADO
ORDER BY Desc_estadoCivil DESC
-----------------------------------------------
--EXERCÍCIO 5
SELECT
	CID
,	DESCRICAO
FROM
	TB_CID
-----------------------------------------------
--EXERCÍCIO 6
SELECT DISTINCT
	BAIRRO AS 'Bairro'
,	CIDADE AS 'Cidade'
,	ESTADO AS 'UF'
FROM
	TB_ENDERECO
ORDER BY
	ESTADO ASC
,	CIDADE DESC
,	BAIRRO ASC
