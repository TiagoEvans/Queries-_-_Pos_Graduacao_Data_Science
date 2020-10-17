--EXERCÍCIO 1
SELECT
	CIDADE
FROM
	TB_ENDERECO
WHERE
	CIDADE LIKE '%A%'

---------------------------------------------------------------
--EXERCÍCIO 2
SELECT
	CIDADE
FROM
	TB_ENDERECO
WHERE
	CIDADE LIKE 'A%'

---------------------------------------------------------------
--EXERCÍCIO 3
SELECT
	BAIRRO
FROM
	TB_ENDERECO
WHERE
	BAIRRO LIKE '%[A,E,I]%' AND
	BAIRRO NOT LIKE '%O%'

---------------------------------------------------------------
--EXERCÍCIO 4
SELECT
	*
FROM
	TB_ENDERECO
WHERE CEP IS NOT NULL

---------------------------------------------------------------
--EXERCÍCIO 5
SELECT
	*
FROM
	TB_ENDERECO
WHERE LOGRADOURO IS NOT NULL

---------------------------------------------------------------
--EXERCÍCIO 6
SELECT
	*
FROM
	TB_PASSAGEM
WHERE TIPO_ADMISSAO IN ('33','32')

---------------------------------------------------------------
--EXERCÍCIO 7
SELECT
	*
FROM
	TB_CONSOLIDADO
WHERE
	Desc_estadoCivil IN ('VIÚVO(A)','Casado(a)')
-------
SELECT
	*
FROM
	TB_CONSOLIDADO
WHERE
	Desc_estadoCivil LIKE 'VIÚVO%' OR
	Desc_estadoCivil LIKE 'Casado%'

---------------------------------------------------------------
--EXERCÍCIO 8
SELECT
	*
FROM 
	TB_CONSOLIDADO
WHERE
	GRUPO_DIAGNOSTICO NOT IN ('NÃO INFORMADO','OUTROS')