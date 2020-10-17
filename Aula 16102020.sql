
/*
--Cria tabela tempor�ria com condi��o
SELECT DISTINCT
	*
INTO ##PACI_TESTE
FROM
	TB_PACIENTE
WHERE PACIENTE = 'JOSE'

-------------------------------------------------------------------
--Apaga tabela
DROP TABLE ##PACI_TESTE

-------------------------------------------------------------------
SELECT * FROM ##PACI_TESTE

-------------------------------------------------------------------

--===============FUN��ES DE CARACTERE===============--

--SUBSTRING - Seleciona parte do texto
SELECT SUBSTRING('Objeto pesquisado','A partir de qual posi��o','Quantidade de caracteres')
SELECT SUBSTRING('SQL Server',1,3)

--LEFT e RIGHT - Retorna os caracteres da esquerda/direita para a direita/esquerda
SELECT RIGHT('Objeto pesquisado','at� qual posi��o retornar� os carateres')
SELECT RIGHT('SQL Server',3)

--LEN - Retorna a quantidade de caracteres
SELECT LEN('Objeto pesquisado')
SELECT LEN('SQL Server ')

--CHARINDEX - retorna a posi��o do caractere 
Select CHARINDEX('objeto procurado', 'local/texto de procura', 'a partir de qual posi��o')
SELECT CHARINDEX('E', 'SQL Server ',1)
********************************************************************
DECLARE @CONT INT = 1DECLARE @TAMANHO INT = LEN('SQL SERVER SQL SERVER')DECLARE @TOTAL INT = 0 WHILE @CONT <= @TAMANHOBEGIN	IF SUBSTRING('SQL SERVER SQL SERVER',@CONT, 1) = 'E' 		SET @TOTAL += 1	SET @CONT += 1ENDSELECT @TOTAL
********************************************************************

--REPLACE - substitue o caractere mencionado por outro
SELECT REPLACE('Objeto pesquisado','Caractere a ser substitu�do','Caractere que ir� substituir')
SELECT REPLACE('SQL Server ','E','R')

--REPLICATE - replica o texto mencionado a quantidade de vezes mencionada
SELECT REPLICATE('Objeto a ser replicado','Quantidade que ir� replicar')
SELECT REPLICATE('SQL Server ',2)

--UPPER e LOWER - converte os caracteres para mai�scula ou min�scula
SELECT LOWER('Objeto a ser editado')
SELECT LOWER('SQL Server ')

--CONCAT - concatema os textos mencionados -- Tamb�m pode ser utilizado o sinal de + entre dois textos
SELECT CONCAT('Objeto a ser concatenado','Objeto a ser concatenado')
SELECT CONCAT('SQL Server ',' 2017')
SELECT 'SQL Server '+' 2017'
--RTRIM e LTRIM - remove espa�os no in�cio ou final dos textos
SELECT RTRIM('Objeto a ser editado')
SELECT RTRIM('SQL Server ')

-------------------------------------------------------------------
*/
--===============FUN��ES DE AGREGA��O===============--

-- AVG() � Calcula a m�dia dos valores em determinado grupo, ignorando valores nulos
-- Calcula o valor m�dio dos itens
SELECT
	AVG(PRECO_CUSTO) AS PRECO_CUSTO_MEDIO 
FROM
	TB_ITEM

-------------------------------------------------------------------
-- COUNT() � Contagem de registros
-- Quantidade de registros existem na tabela pacientes
SELECT 
	COUNT(*) AS QTD_PACIENTES
FROM 
	TB_PACIENTE

-- Conta as passagens ignorando valores nulos
SELECT 	
	COUNT(ID_PASSAGEM) AS QTD_PASSAGENS
FROM 
	TB_PASSAGEM
-- Obs.: Se colocarmos o nome de um campo como argumento da fun��o COUNT, n�o ser�o contados os registros onde o conte�do deste campo seja NULL.

-------------------------------------------------------------------
-- MIN() � retorna o menor valor de um conjunto de valores
-- Retorna o menor valor dos itens
SELECT 
	MIN(PRECO_VENDA) AS MENOR_PRECO_VENDA
FROM 
	TB_ITEM

	-------------------------------------------------------------------
-- MAX() � retorna o maior valor de um conjunto de valores
-- Retorna o maior valor dos itens
SELECT 
	MAX(PRECO_CUSTO) AS MAIOR_QTD_ESTOQUE
FROM 
	TB_ITEM

-------------------------------------------------------------------
-- SUM() � Soma os valores da express�o
-- Se tiver um valor nulo na colua a ser somada, a fun��o apresenta erro retornando valor NULL
-- Soma dos valores
SELECT 
	SUM(PRECO_VENDA) AS MENOR_PRECO_VENDA
FROM 
	TB_ITEM;

-------------------------------------------------------------------
-- GROUP BY� Utilizando a cl�usula GROUP BY � poss�vel agrupar diversos registros com base em 1 ou mais colunas da tabela
-- ***REGRA: TODA coluna que n�o estiver dentro da fun��o de agrega��o ESTAR� no GROUP BY***
--EXEMPLO 1 - Retorna quantidade de bairros por cidade.
SELECT CIDADE, COUNT(BAIRRO) AS BAIRRO 
FROM TB_ENDERECO
GROUP BY CIDADE
ORDER BY BAIRRO -- Neste caso ordenar� o pela cidade de menor para o de maior quantidade de bairros

--EXEMPLO 2 - Retorna quantidade de bairros por cidade.
SELECT CIDADE, COUNT(DISTINCT BAIRRO) AS BAIRRO 
FROM TB_ENDERECO
GROUP BY CIDADE
ORDER BY BAIRRO

--EXEMPLO 3
SELECT DESC_CAT_ITEM, AVG(PRECO_VENDA) AS PRECO_VENDA
FROM TB_ITEM
GROUP BY DESC_CAT_ITEM
ORDER BY PRECO_VENDA DESC-- Neste caso ordenar� o pelo item de maior para o de menor pre�o de venda

--EXEMPLO 4
SELECT YEAR(DT_NASCIMENTO) AS ANO, COUNT(PRONTUARIO) AS QTDE
FROM TB_PACIENTE 
GROUP BY YEAR(DT_NASCIMENTO)
ORDER BY QTDE

--EXEMPLO 5
SELECT DESC_CAT_ITEM, AVG(PRECO_VENDA) AS PRECO_VENDA
FROM TB_ITEM
GROUP BY DESC_CAT_ITEM
HAVING AVG(PRECO_VENDA) > 1933 -- Utilizamos o HAVING ao inv�s do WHERE pois o WHERE, segundo a ordem de consist�ncia do SQL vem antes do SELEC, onde a fun��o de agrega��o est� setada.
ORDER BY PRECO_VENDA DESC


1� FROM
2� WHERE
3� SELECT
4� GROUP BY
5� HAVING	--	
6� ORDER BY
