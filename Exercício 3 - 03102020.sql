--EXERC�CIO 1
SELECT
	CIDADE
FROM
	TB_ENDERECO
WHERE
	CIDADE LIKE '%A%'

---------------------------------------------------------------
--EXERC�CIO 2
SELECT
	CIDADE
FROM
	TB_ENDERECO
WHERE
	CIDADE LIKE 'A%'

---------------------------------------------------------------
--EXERC�CIO 3
SELECT
	BAIRRO
FROM
	TB_ENDERECO
WHERE
	BAIRRO LIKE '%[A,E,I]%' AND
	BAIRRO NOT LIKE '%O%'

---------------------------------------------------------------
--EXERC�CIO 4
SELECT
	*
FROM
	TB_ENDERECO
WHERE CEP IS NOT NULL

---------------------------------------------------------------
--EXERC�CIO 5
SELECT
	*
FROM
	TB_ENDERECO
WHERE LOGRADOURO IS NOT NULL

---------------------------------------------------------------
--EXERC�CIO 6
SELECT
	*
FROM
	TB_PASSAGEM
WHERE TIPO_ADMISSAO IN ('33','32')

---------------------------------------------------------------
--EXERC�CIO 7
SELECT
	*
FROM
	TB_CONSOLIDADO
WHERE
	Desc_estadoCivil IN ('VI�VO(A)','Casado(a)')
-------
SELECT
	*
FROM
	TB_CONSOLIDADO
WHERE
	Desc_estadoCivil LIKE 'VI�VO%' OR
	Desc_estadoCivil LIKE 'Casado%'

---------------------------------------------------------------
--EXERC�CIO 8
SELECT
	*
FROM 
	TB_CONSOLIDADO
WHERE
	GRUPO_DIAGNOSTICO NOT IN ('N�O INFORMADO','OUTROS')