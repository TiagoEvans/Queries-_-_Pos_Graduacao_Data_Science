--EXERC�CIO 1
SELECT 
	SUBSTRING (GRUPO_DIAGNOSTICO,3,4)
FROM
	TB_GRUPO_DIAGNOSTICO

--EXERC�CIO 2
SELECT
	RIGHT (DESC_TIPOADMISSAO,3)
FROM
	tb_tipoadmissao

--EXERC�CIO 3
SELECT
	LOWER (PACIENTE)
FROM
	TB_PACIENTE

--EXERC�CIO 4
SELECT
	LEFT (DESC_TIPOADMISSAO,3)
FROM
	tb_tipoadmissao

--EXERC�CIO 5
SELECT
	CONCAT (ESTADO,' - BR')
FROM
	TB_ENDERECO

--EXERC�CIO 6
SELECT
	REPLACE (DESC_ESCOLARIDADE,'Colegial','Ensino M�dio')
FROM
	TB_escolaridade

--EXERC�CIO 7
SELECT * FROM TB_ENDERECO WHERE SUBSTRING (BAIRRO,5,1)='I'

SELECT * FROM TB_ENDERECO WHERE CHARINDEX ('I',BAIRRO,5)=5 ---CERTO
SELECT * FROM TB_ENDERECO WHERE CHARINDEX ('I',BAIRRO,1)=5 ---ERRADO pois est� procurando a partir da posi��o 1

SELECT * FROM TB_ENDERECO WHERE RIGHT(LEFT(BAIRRO,5),1)='I'

--EXERC�CIO 8
SELECT
	BAIRRO, LEN (BAIRRO)
FROM
	TB_ENDERECO

