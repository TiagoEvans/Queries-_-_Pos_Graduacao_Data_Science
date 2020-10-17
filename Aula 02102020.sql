/*
USE DB_SQL_MBA_HIAE
----------------------------------------------------------------
SET DATEFORMAT YMD
----------------------------------------------------------------
SELECT * FROM TB_PACIENTE
----------------------------------------------------------------
SELECT
	PACIENTE, PRONTUARIO, SEXO, DT_NASCIMENTO
FROM
	TB_PACIENTE

----------------------------------------------------------------
--QUERY PACIENTE.
SELECT
	PACIENTE	AS 'Nome do Paciente'
,	PRONTUARIO	AS 'Nº do Prontuário'
,	CASE
		WHEN SEXO = 1
			THEN 'M'
		ELSE 'F'
	END AS 'Sexo'
,	DT_NASCIMENTO AS 'Data de Nascimento'
,	DATEDIFF (DD, DT_NASCIMENTO, GETDATE()) / 365.25 AS Idade
FROM
	TB_PACIENTE
ORDER BY
	SEXO DESC
,	DT_NASCIMENTO DESC

----------------------------------------------------------------
--QUERY CAMPO CALCULADO.
SELECT
	COD_ITEM	AS 'Código Item'
,	DESC_ITEM	AS 'Nome Item'
,	PRECO_CUSTO	AS 'Preço Item'
,	PRECO_CUSTO * 0.5 AS 'Preço Item Ajustado'
FROM
	TB_ITEM
ORDER BY 4 --QUARTA COLUNA (ITEM/CAMPO DO SELECT)

----------------------------------------------------------------
-- Lista os 18 pacientes mais antigos.
SELECT TOP 18 WITH TIES --'WITH TIES' RETORNO CASO O ÚLTIMO ÍTEM SEJA IGUAL AO SEGUINTE (APENAS PARA SQL SERVER)
	*
,	DATEDIFF(DD,DT_NASCIMENTO, GETDATE())/365.25 AS Idade
FROM 
	TB_PACIENTE
ORDER BY 
	DT_NASCIMENTO

----------------------------------------------------------------
-- Lista os 18 pacientes mais novos.
SELECT TOP 18 WITH TIES --'WITH TIES' RETORNO CASO O ÚLTIMO ÍTEM SEJA IGUAL AO SEGUINTE (APENAS PARA SQL SERVER)
	*
,	DATEDIFF(DD,DT_NASCIMENTO, GETDATE())/365.25 AS Idade
FROM 
	TB_PACIENTE
ORDER BY 
	DT_NASCIMENTO DESC

----------------------------------------------------------------
-- Lista os 18 pacientes primeiros pacientes da base ordenados pela data de nascimento.
SELECT
	* 
FROM
	(
		SELECT TOP 18
			*
		FROM
			TB_PACIENTE
		ORDER BY 
			ID_PACIENTE
	) AS TB_PACIENTE_TOP_18
ORDER BY
	DT_NASCIMENTO

----------------------------------------------------------------
-- Query Paciente com CASE.
SELECT
	PACIENTE	AS 'Nome do Paciente'
,	PRONTUARIO	AS 'Nº do Prontuário'
,	CASE
		WHEN SEXO = 1
			THEN 'M'
		WHEN SEXO = 2
			THEN 'F'
		ELSE 'I'
	END AS 'Sexo'
,	DT_NASCIMENTO AS 'Data de Nascimento'
,	DATEDIFF (DD, DT_NASCIMENTO, GETDATE()) / 365.25 AS Idade
FROM
	TB_PACIENTE
ORDER BY
	SEXO DESC
,	DT_NASCIMENTO DESC

----------------------------------------------------------------
-- Seleciona todas as Passagens com Admissão anterior a 2015.
SELECT 
	* 
FROM 
	TB_PASSAGEM
WHERE 
	DATA_ADMISSAO < '2015-01-01'
ORDER BY 
	DATA_ADMISSAO

----------------------------------------------------------------
-- Seleciona todas as Passagens com Admissão superior a 2015.
SELECT 
	* 
FROM 
	TB_PASSAGEM
WHERE 
	DATA_ADMISSAO >= '2015-01-01'
ORDER BY 
	DATA_ADMISSAO

----------------------------------------------------------------
-- Seleciona todos os Pacientes que nasceram DEPOIS de 1990.
SELECT 
	* 
FROM 
	TB_PACIENTE
WHERE 
	DT_NASCIMENTO >= '1990-01-01'
ORDER BY
	DT_NASCIMENTO

----------------------------------------------------------------
-- Seleciona os PACIENTES com data de nascimento igual a 18/02/1945
SELECT 
	* 
FROM 
	TB_PACIENTE
WHERE 
	DT_NASCIMENTO = '1945-02-18'
ORDER BY 
	DT_NASCIMENTO

----------------------------------------------------------------
-- Seleciona os PACIENTES com data de nascimento diferente a 01/01/2000
SELECT 
	* 
FROM 
	TB_PACIENTE
WHERE 
	DT_NASCIMENTO <> '2000-01-01'
ORDER BY 
	DT_NASCIMENTO

----------------------------------------------------------------
-- Seleciona os pacientes do sexo = 2 e que nasceram depois de 01/01/1980
SELECT 
	* 
FROM 
	TB_PACIENTE
WHERE 
	SEXO = 2
	AND 
	DT_NASCIMENTO >= '1980-01-01'
ORDER BY 
	DT_NASCIMENTO

----------------------------------------------------------------
-- Seleciona os pacientes do sexo = 2 ou que nasceram depois de 01/01/1980
SELECT 
	* 
FROM 
	TB_PACIENTE
WHERE 
	SEXO = 2
	OR 
	DT_NASCIMENTO > '1980-01-01'

----------------------------------------------------------------
-- Execute a consulta abaixo e apresente o resultado
SELECT 
	* 
FROM 
	TB_PACIENTE
WHERE 
	DT_NASCIMENTO = '1983-12-09'
	OR
	DT_NASCIMENTO = '1986-01-03'

----------------------------------------------------------------
--A cláusula BETWEEN filtra dados com base em uma faixa de valores.
SELECT
	PACIENTE
,	CONVERT (DATE, DT_NASCIMENTO) AS 'Data de Nascimento'
FROM
	TB_PACIENTE
WHERE
	DT_NASCIMENTO BETWEEN '1990-01-01'AND '2011-01-01'
ORDER BY 
	DT_NASCIMENTO

----------------------------------------------------------------
SELECT 
	* 
FROM 
	 TB_PACIENTE
WHERE 
	DT_NASCIMENTO BETWEEN '1980.1.1' AND '1985.12.31'
ORDER BY 
	DT_NASCIMENTO

----------------------------------------------------------------
SELECT 
	* 
FROM 
	 TB_PACIENTE
WHERE 
	DT_NASCIMENTO NOT BETWEEN '1980.1.1' AND '1985.12.31'
ORDER BY 
	DT_NASCIMENTO

----------------------------------------------------------------
-- Seleciona PACIENTES que possuam nomes que começando por M
SELECT * FROM TB_PACIENTE WHERE PACIENTE LIKE 'M%' 

----------------------------------------------------------------    
-- Nomes terminando por MARIA
SELECT * FROM TB_PACIENTE WHERE PACIENTE LIKE '%MARIA'

----------------------------------------------------------------
-- Nomes terminando por SOUZA
SELECT * FROM TB_PACIENTE WHERE PACIENTE LIKE '%SOUZA'

----------------------------------------------------------------
-- Nomes terminando por ZA
SELECT * FROM TB_PACIENTE WHERE PACIENTE LIKE '%ZA'

----------------------------------------------------------------
-- Nomes contendo MARIA 
SELECT * FROM TB_PACIENTE WHERE PACIENTE LIKE '%MARIA%'

----------------------------------------------------------------
-- Nomes contendo SOUZA
SELECT * FROM TB_PACIENTE WHERE PACIENTE LIKE '%SOUZA%'

----------------------------------------------------------------
-- Nomes contendo ZA
SELECT * FROM TB_PACIENTE WHERE PACIENTE LIKE '%ZA%'

----------------------------------------------------------------
-- Cidades que comecem por qualquer caractere e o segundo seja a letra A
SELECT  CIDADE FROM TB_ENDERECO WHERE CIDADE LIKE '_A%'

----------------------------------------------------------------
-- Cidades cuja penúltima letra seja R
SELECT  CIDADE FROM TB_ENDERECO WHERE CIDADE LIKE '%R_'

----------------------------------------------------------------
-- Cidades que terminem com SA seguido de 3 caracteres quaisquer
SELECT  CIDADE FROM TB_ENDERECO WHERE CIDADE LIKE '%sa___'

----------------------------------------------------------------
-- Cidades que terminem com SA seguido de 3 caracteres quaisquer
SELECT  CIDADE FROM TB_ENDERECO WHERE CIDADE LIKE '____'

----------------------------------------------------------------
--Fornecendo uma ou mais opções para um determinado caractere

-- Exemplo 1
SELECT DISTINCT BAIRRO FROM TB_ENDERECO 
WHERE BAIRRO LIKE '%BROOKLIN [NOVO,PAULISTA]%'

-- Exempo 2 
SELECT * FROM TB_ITEM 
WHERE DESC_ITEM LIKE '%Vitamina B[2-6]%'

--PERMISSION DENIED =(
INSERT INTO TB_ITEM (ID_ITEM,COD_ITEM,DESC_ITEM,DESC_CAT_ITEM,DESC_SUB_CATE_ITEM,FLG_OPME,PRECO_CUSTO,PRECO_VENDA,Categoria_item)
VALUES (10001,'XXXXX','Vitamina B4','Laboratorio Analises Clinicas','Labs.Externos','N',999.00,674.70,'Exames')

----------------------------------------------------------------
--Consultando valores pertencentes ou não a uma lista de elementos

-- Operador IN com valores numéricos
SELECT * FROM tb_consolidado 
WHERE qtd_itens IN (30,33,24,76)
ORDER BY qtd_itens

-- Operador IN com caracteres
SELECT * FROM tb_consolidado
WHERE Desc_estadoCivil IN ('VIÚVO(A)', 'SOLTEIRO(A)')

-- Listar todos os estados que Não estão na lista
SELECT * FROM tb_consolidado
WHERE GRUPO_DIAGNOSTICO NOT IN ('NÃO INFORMADO')

/*
--SELECIONE A TABELA ALT+F1 - TRAZ OS DETALHES DA TABELA
--COLLATION - DETALHES DO CAMPO 
EX.: CP1_CI_AS 
-CI=CASE INSENSITIVE - NÃO DIFERENCIA MAIUSCULA OU MINUSCULA 
-AS=ASCENT SENSITIVE - DIFERENCIA COM/SEM ACENTO
TB_PACIENTE
*/

----------------------------------------------------------------
-- Seleciona os endereços com CEP Nulos
SELECT * FROM TB_ENDERECO WHERE CEP IS NULL

-- Seleciona os endereços com logradouro null 
SELECT * FROM TB_ENDERECO WHERE LOGRADOURO IS NULL

-- Seleciona os endereços que possuem logradouro preenchida
SELECT * FROM TB_ENDERECO WHERE LOGRADOURO IS NOT NULL

----------------------------------------------------------------
--ISNULL SUBSTITUE O VALOR NULO DA COLUNA INFORMADA
--Exemplo 1
SELECT 
	ISNULL(LOGRADOURO,'Não Informado') AS LOGRADOURO,
	CASE
		WHEN LOGRADOURO IS NULL
			THEN 'Não Informado'
		ELSE LOGRADOURO
	END LOGRADOURO,
	LOGRADOURO
FROM TB_ENDERECO

--Exemplo 2
SELECT 
	ISNULL(CEP,'00000-000') AS CEP
FROM TB_ENDERECO

----------------------------------------------------------------
SELECT * FROM TB_PACIENTE WHERE YEAR(DT_NASCIMENTO) = 1990

----------------------------------------------------------------
SELECT 
	PACIENTE, 
	DT_NASCIMENTO,
	YEAR(DT_NASCIMENTO) 'Ano',
	MONTH(DT_NASCIMENTO) 'Mês',
	DAY(DT_NASCIMENTO) 'Dia',
	CPF
FROM
	TB_PACIENTE
WHERE
	YEAR(DT_NASCIMENTO) = 1980 AND
	MONTH(DT_NASCIMENTO) = 12
 -----
 SELECT 
	PACIENTE, 
	DT_NASCIMENTO,
	YEAR(DT_NASCIMENTO) 'Ano',
	MONTH(DT_NASCIMENTO) 'Mês',
	DAY(DT_NASCIMENTO) 'Dia',
	CPF
FROM
	TB_PACIENTE
WHERE
	DATEPART(YEAR,DT_NASCIMENTO) = 1980 AND
	DATEPART(MONTH,DT_NASCIMENTO) = 12

----------------------------------------------------------------
SELECT
	PACIENTE,
	DT_NASCIMENTO,
	YEAR(DT_NASCIMENTO) 'Ano',
	DATENAME(MONTH,DT_NASCIMENTO) 'Mês',
	DAY(DT_NASCIMENTO) 'Dia',
	DATENAME(WEEKDAY,DT_NASCIMENTO) 'Dia da semana',
	DATEPART(WEEKDAY,DT_NASCIMENTO) 'Dia da semana',
	CPF
FROM
	TB_PACIENTE
WHERE
	DATEPART(WEEKDAY,DT_NASCIMENTO)=6

SELECT DATEPART(DAYOFYEAR,GETDATE())

----------------------------------------------------------------
*/





