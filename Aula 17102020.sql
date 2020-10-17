--==========================INNER JOIN==========================--
-- INNER JOIN – Esse é um formato comum de join, que retorna dados apenas quando as duas tabelas tem chaves correspondentes na cláusula ON do join.

-- Consultando as tabelas de passagens e pacientes
SELECT
	ID_PASSAGEM, 
	DT_NASCIMENTO 
FROM
	TB_PASSAGEM 
	INNER JOIN TB_PACIENTE
		ON	TB_PASSAGEM.ID_PACIENTE = TB_PACIENTE. ID_PACIENTE

-------------------------------------------------------------------------------
-- Consultando as tabelas de passagens e pacientes com ALIAS
SELECT
	PASS.ID_PASSAGEM, 
	PACI.DT_NASCIMENTO
FROM
	TB_PASSAGEM AS PASS
	INNER JOIN TB_PACIENTE AS PACI
		ON PASS.ID_PACIENTE = PACI.ID_PACIENTE 

-------------------------------------------------------------------------------
-- Utilizamos neste caso o JOIN
SELECT 
	PASS.ID_PASSAGEM,
	PACI.PRONTUARIO,
	GRUP.GRUPO_DIAGNOSTICO
FROM 
	TB_PASSAGEM PASS
	INNER JOIN TB_PACIENTE PACI
		ON PASS.ID_PACIENTE = PACI.ID_PACIENTE
	INNER JOIN TB_GRUPO_DIAGNOSTICO GRUP
		ON PASS.ID_GRUPO_DIAGNOSTICO = GRUP.ID_GRUPO_DIAGNOSTICO
WHERE 
	GRUP.ID_GRUPO_DIAGNOSTICO = 2

-------------------------------------------------------------------------------
--==========================LEFT JOIN==========================--
-- LEFT JOIN-É um dos formatos mais usados de join, que retorna a Tabela A inteira e apenas os registros que coincidirem com a igualdade do join na TabelaB

-- Utilizando o Left Join
SELECT 
	A.*, B.DATA_ADMISSAO 
FROM 
	TB_PACIENTE A 
	LEFT JOIN 	TB_PASSAGEM B 
		ON A.ID_PACIENTE = B.ID_PACIENTE

-------------------------------------------------------------------------------
-- Utilizando o LEFT JOIN
SELECT 
	A.*, B.QUANTIDADE
FROM 
	TB_ITEM A 
	LEFT JOIN  TB_PASSAGEM_ITEM B
		ON A.ID_ITEM = B.ID_ITEM
WHERE 
	B.ID_ITEM IS NULL

-------------------------------------------------------------------------------
--==========================RIGHT JOIN==========================--
-- RIGHT JOIN- Segue o mesmo raciocínio do left join, mas se aplicando à tabela B em vez da A. 

--Utilizando Right Join
SELECT 
	A.*, B.DATA_ADMISSAO 
FROM 
	TB_PASSAGEM B 
	RIGHT JOIN TB_PACIENTE A
		ON A.ID_PACIENTE = B.ID_PACIENTE

--Itens que não foram utilizados em nenhuma passagem
SELECT 
	A.*, B.QUANTIDADE
FROM 
	TB_PASSAGEM_ITEM B 
	RIGHT JOIN TB_ITEM A
		ON A.ID_ITEM = B.ID_ITEM
WHERE 
	B.ID_ITEM IS NULL

-------------------------------------------------------------------------------
--==========================OUTER JOIN (FULL JOIN)==========================--
-- FULL JOIN – Conhecida com OUTER JOIN ou simplesmente FULL JOIN, este retorna todos os registros de ambas as tabelas. 

--Cria temporárias com mil registros de passagens e pacientes
SELECT TOP 1000 * INTO #PASSAGEM FROM TB_PASSAGEM
SELECT TOP 1000 * INTO #PACIENTE FROM TB_PACIENTE

--Exemplo FULL OUTER JOIN
SELECT 	* 
FROM #PACIENTE A 
	FULL OUTER JOIN #PASSAGEM B
		ON A.ID_PACIENTE = B.ID_PACIENTE

-------------------------------------------------------------------------------
--==========================CROSS JOIN==========================--
-- CROSS JOIN – Basicamente é o produto cartesiano entre as duas tabelas. Para cada linha de TabelaA, são retornadas todas as linhas de TabelaB.
-- É mais fácil entender o Cross Join como um "Join sem cláusula ON", ou seja, todas as combinações de linhas de A e B são devolvidas.
-- Inclusive, se você fizer um Cross Join com cláusla ON, ele "vira" um mero Inner Join.

SELECT 
	GDIAG.GRUPO_DIAGNOSTICO, 
	TIP.desc_tipoadmissao
FROM 
	TB_GRUPO_DIAGNOSTICO GDIAG
	CROSS JOIN tb_tipoadmissao TIP
ORDER BY 
	GRUPO_DIAGNOSTICO

-------------------------------------------------------------------------------
--==========================EXEMPLOS JOIN==========================--

-- Utilizamos neste caso dois JOINs e uma função de agregação.
SELECT 
	C.GRUPO_DIAGNOSTICO, 
	SUM(A.QUANTIDADE) QUANTIDADE 
FROM TB_PASSAGEM_ITEM A
	INNER JOIN TB_PASSAGEM B
		ON A.ID_PASSAGEM = B. ID_PASSAGEM
	INNER JOIN TB_GRUPO_DIAGNOSTICO C 
		ON B.ID_GRUPO_DIAGNOSTICO = C. ID_GRUPO_DIAGNOSTICO
GROUP BY 
	C.GRUPO_DIAGNOSTICO
---------------------------------------------------------------
SELECT 
	BAIRRO, 
	MAX( DT_NASCIMENTO ) AS [Data de Nascimento]
FROM TB_PACIENTE A 
	INNER JOIN
	TB_ENDERECO B
		ON A.ID_PACIENTE = B.ID_PACIENTE
GROUP BY 
	BAIRRO
HAVING 
	MAX( DT_NASCIMENTO ) < '1986-01-01'
ORDER BY 
	MAX	( DT_NASCIMENTO )




