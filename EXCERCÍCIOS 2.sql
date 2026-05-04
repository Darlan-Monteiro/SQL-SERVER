-- 1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade 
-- Devolvida para o canal de venda mais importante da empresa:  Store.

SELECT
	TOP(100) *
FROM 
	FactSales

SELECT
	SUM(SalesQuantity) AS 'QUANTIDADE VENDIDA',
	SUM(ReturnQuantity) AS 'QUANTIDADE DEVOLVIDADE'

FROM 
	FactSales



-- 2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes 
-- da empresa, mas apenas de ocupação Professional.  Utilize um comando SQL para atingir esse 
-- resultado.

SELECT 
	AVG(YearlyIncome) AS 'MÉDIA SALARIAL'
FROM 
	DimCustomer
WHERE
	Occupation = 'Professional'



-- 3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na 
-- empresa. O seu gerente te pediu os seguintes números e informações: 
-- a) Quantos funcionários tem a loja com mais funcionários? 
-- b) Qual é o nome dessa loja? 
-- c) Quantos funcionários tem a loja com menos funcionários? 
-- d) Qual é o nome dessa loja? 

-- A & B
SELECT *
FROM
	DimStore

SELECT TOP(1) 
	StoreName AS 'NOME DA LOJA COM A MAIOR QTDE',
	EmployeeCount AS 'QTDE FUNCIONÁRIOS'
FROM
	DimStore
ORDER BY 
	EmployeeCount DESC

-- C & D
SELECT *
FROM
	DimStore

SELECT TOP(1)
	StoreName AS 'NOME DA LOJA COM A MENOR QTDE',
	EmployeeCount AS 'QTDE FUNCIONÁRIOS'
FROM
	DimStore
WHERE
	EmployeeCount IS NOT NULL
ORDER BY
	EmployeeCount ASC


-- 4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade 
-- total de funcionários do sexo Masculino e do sexo Feminino.  
-- a) Descubra essas duas informações utilizando o SQL. 
-- b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as 
-- seguintes informações de cada um deles: Nome, E-mail, Data de Contratação. 

-- A
SELECT *
FROM DimEmployee

SELECT 	
	COUNT(Gender) AS 'MASCULINO'
FROM 
	DimEmployee
WHERE
	Gender = 'M'

SELECT 	
	COUNT(Gender) AS 'FEMININO'
FROM 
	DimEmployee
WHERE
	Gender = 'F'

-- B
SELECT *
FROM DimEmployee

SELECT
	TOP(1)
	FirstName AS 'PRIMEIRO NOME',
	LastName AS 'SOBRENOME',
	EmailAddress AS 'E-MAIL',
	StartDate AS 'DATA DE CONTRATAÇÃO'
FROM 
	DimEmployee
WHERE
	Gender = 'M' AND
	EndDate IS NULL
ORDER BY
	StartDate ASC

SELECT
	TOP(1)
	FirstName AS 'PRIMEIRO NOME',
	LastName AS 'SOBRENOME',
	EmailAddress AS 'E-MAIL',
	StartDate AS 'DATA DE CONTRATAÇÃO'
FROM 
	DimEmployee
WHERE
	Gender = 'F' AND
	EndDate IS NULL
ORDER BY
	StartDate ASC


-- 5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes 
-- informações: 
-- a) Quantidade distinta de cores de produtos. 
-- b) Quantidade distinta de marcas 
-- c) Quantidade distinta de classes de produto 
-- Para simplificar, você pode fazer isso em uma mesma consulta.
SELECT
	COUNT(DISTINCT ColorName) AS 'CORES DISTINTAS',
	COUNT(DISTINCT BrandName) AS 'MARCAS DISTINTAS',
	COUNT(DISTINCT ClassName) AS 'CLASSES DISTINTAS'
FROM DimProduct
