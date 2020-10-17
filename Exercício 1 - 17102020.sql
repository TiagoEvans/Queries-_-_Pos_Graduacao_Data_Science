--============================INNER JOIN============================--
--Exercício 5 - Relacione as tabelas TB_PACIENTE e TB_ESTADOCIVIL. Apresente na tela (PACIENTE, DESC_ESTADOCIVIL e DT_NASCIMENTO (Apelidando para Data_de Nascimento)). Filtre a dt_nascimento quando for do ano de 1990.
SELECT 
	TP.PACIENTE,
	TEC.Desc_estadoCivil,
	TP.DT_NASCIMENTO AS 'DATA DE NASCIMENTO'
FROM TB_PACIENTE TP
	INNER JOIN TB_estadoCivil TEC ON TP.ESTADO_CIVIL=TEC.id_estadocivil
WHERE
	YEAR(TP.DT_NASCIMENTO)=1990

--Exercício 6 - Relacione as tabela TB_PASSAGEM, TB_PACIENTE E TB_GRUPO_DIAGNOSTICO. Apresente na tela (ID_PASSAGEM, Grupo_Diagnostico e Dt_Nascimento). Filtre apenas as passagens admitidas no dia 27-03-2017.
SELECT 
	TPASS.ID_PASSAGEM,
	TPASS.DATA_ADMISSAO,
	TGD.GRUPO_DIAGNOSTICO,
	TPAC.DT_NASCIMENTO
FROM TB_PASSAGEM TPASS
	INNER JOIN TB_PACIENTE TPAC ON TPASS.ID_PACIENTE=TPAC.ID_PACIENTE
	INNER JOIN TB_GRUPO_DIAGNOSTICO TGD ON TPASS.ID_GRUPO_DIAGNOSTICO=TGD.ID_GRUPO_DIAGNOSTICO
WHERE 
	YEAR(TPASS.DATA_ADMISSAO)=2017 AND
	MONTH(TPASS.DATA_ADMISSAO)=03 AND
	DAY(TPASS.DATA_ADMISSAO)=27
	--CAST(TPASS.DATA_ADMISSAO AS DATE)='2017-03-27'
	--CONVERT(DATE,TPASS.DATA_ADMISSAO)='2017-03-27'
	--TPASS.DATA_ADMISSAO BETWEER '2017-03-27 00:00:00.000' AND '2017-03-27 23:59:59.999'

--============================LEFT/RIGHT JOIN============================--
--Exercício 1 - Relacione a tabela TB_PASSAGEM com a tabela TB_GRUPO_DIAGNOSTICO e apresente as colunas (ID_PASSAGEM e GRUPO_DIAGNOSTICO) quando o Grupo_diagnostico for diferente de NÃO INFORMADO e OUTROS (Utilize o LEFT JOIN).
SELECT
	PASS.ID_PASSAGEM,
	GDIAG.GRUPO_DIAGNOSTICO
FROM TB_PASSAGEM PASS
	LEFT JOIN TB_GRUPO_DIAGNOSTICO GDIAG 
		ON PASS.ID_GRUPO_DIAGNOSTICO = GDIAG.ID_GRUPO_DIAGNOSTICO
WHERE
	GDIAG.GRUPO_DIAGNOSTICO NOT IN ('NÃO INFORMADO','OUTROS')

--Exercício 2 - Criar uma tabela temporária “Local” com as top 100 primeiras linhas da tabela TB_PACIENTE e chame-a de #Paci.
SELECT TOP 100 *
INTO #PACI
FROM
	TB_PACIENTE

--Exercício 3 - Relacione TB_PASSAGEM com #Paci e apresente todos os registros da coluna ID_PASSAGEM. Filtre passagens com alta em 2017 (Utilize o LEFT JOIN).
SELECT * 
FROM #PACI PAC
	LEFT JOIN TB_PASSAGEM PASS
		ON PAC.ID_PACIENTE = PASS.ID_PACIENTE
WHERE
	YEAR(PASS.DT_ALTA)=2017

--Exercício 4 - Criar uma tabela temporária “Local” com as top 100 primeiras linhas da tabela TB_PASSAGEM e chame-a de #Pass2.
SELECT TOP 100 *
INTO #PASS2
FROM TB_PASSAGEM

--Exercício 5 - Relacione a tabela #Pass2 com a tabela TB_MEDICO e apresente todas as colunas da tabela TB_MEDICO independente se existir passagens atrelado a ela (Utilize o RIGHT JOIN).
SELECT
	PASS.ID_PACIENTE,
	PASS.ID_PACIENTE,
	PACI.PACIENTE,
	MED.*
FROM #PASS2 PASS
	LEFT JOIN TB_PACIENTE PACI
		ON PASS.ID_PACIENTE=PACI.ID_PACIENTE
	RIGHT JOIN TB_MEDICO MED
		ON PASS.id_medico=MED.ID

--Exercício 6 - Selecione todas as colunas da tabela TB_GRUPO_DIAGNOSTICO e relacione com TB_PASSAGEM de forma que apresente apenas os grupos que não existam na TB_PASSAGEM.(LEFT ou RIGTH Join).
SELECT *
FROM TB_GRUPO_DIAGNOSTICO GDIAG
	LEFT JOIN TB_PASSAGEM PASS
		ON GDIAG.ID_GRUPO_DIAGNOSTICO=PASS.ID_GRUPO_DIAGNOSTICO
WHERE
	PASS.ID_GRUPO_DIAGNOSTICO IS NULL

SELECT *
FROM TB_PASSAGEM PASS
	RIGHT JOIN TB_GRUPO_DIAGNOSTICO GDIAG
		ON PASS.ID_GRUPO_DIAGNOSTICO=GDIAG.ID_GRUPO_DIAGNOSTICO
WHERE
	PASS.ID_GRUPO_DIAGNOSTICO IS NULL
