-- EXERC�CIO 1
SELECT * FROM TB_PACIENTE
-----------------------------------------------
--EXERC�CIO 2
SELECT
	GRUPO_DIAGNOSTICO
FROM
	TB_GRUPO_DIAGNOSTICO
-----------------------------------------------
--EXERC�CIO 3
SELECT
	GRUPO_DIAGNOSTICO
FROM
	TB_GRUPO_DIAGNOSTICO
ORDER BY GRUPO_DIAGNOSTICO ASC
-----------------------------------------------
--EXERC�CIO 4
SELECT *
FROM 
	TB_CONSOLIDADO
ORDER BY Desc_estadoCivil DESC
-----------------------------------------------
--EXERC�CIO 5
SELECT
	CID
,	DESCRICAO
FROM
	TB_CID
-----------------------------------------------
--EXERC�CIO 6
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
