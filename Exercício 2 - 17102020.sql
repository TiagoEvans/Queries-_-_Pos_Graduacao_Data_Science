--Exercício 1 - Relacione as tabelas TB_PACIENTE e TB_ENDERECO e apresente as colunas PACIENTE e BAIRRO de forma distinta (FULL OUTER JOIN).
SELECT DISTINCT
	PACI.PACIENTE,
	ENDE.BAIRRO
FROM TB_PACIENTE PACI
	FULL JOIN TB_ENDERECO ENDE ON PACI.ID_PACIENTE=ENDE.ID_PACIENTE

--Exercício 2 - Relacione as tabelas tb_tipoadmissao e TB_GRUPO_DIAGNOSTICO e apresente um plano cartesiano das colunas desc_tipoadmissao e GRUPO_DIAGNOSTICO distintamente (CROSS JOIN).
SELECT DISTINCT
	GD.GRUPO_DIAGNOSTICO,
	TAD.desc_tipoadmissao
	
FROM tb_tipoadmissao TAD
	CROSS JOIN TB_GRUPO_DIAGNOSTICO GD
