-- 1. a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
-- (channelkey).
-- b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
-- total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).
-- c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
-- para o ano de 2007.

-- a)
SELECT 
	channelKey AS 'CANAL DE VENDAS',
	SUM(SalesQuantity) AS 'QTDE VENDIDA'
FROM 
	FactSales
GROUP BY
	channelKey

-- b)
SELECT 
	StoreKey,
	SUM(SalesQuantity) AS 'QTD VENDIDA',
	SUM(ReturnQuantity) AS 'QTD DEVOLVIDA'
FROM
	FactSales
GROUP BY
	StoreKey

-- c)
SELECT
	channelKey AS 'CANAL DE VENDAS',
	SUM(SalesAmount) AS 'VALOR TOTAL VENDIDO'
FROM 
	FactSales
WHERE DateKey = '2007'
GROUP BY
	channelKey

-- 2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
-- total vendido (SalesAmount) por produto (ProductKey).
-- a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
-- mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
-- $5.000.000.
-- b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
-- Desconsidere o filtro de $5.000.000 aplicado

-- a)
SELECT
	ProductKey AS 'PRODUTO',
	SUM(SalesAmount) AS 'TOTAL VENDIDO'
FROM
	FactSales
GROUP BY
	ProductKey
HAVING 
	SUM(SalesAmount) > 5000000
ORDER BY
	SUM(SalesAmount) DESC

-- B)
SELECT
	TOP(10)
	ProductKey AS 'PRODUTO',
	SUM(SalesAmount) AS 'TOTAL VENDIDO'
FROM
	FactSales
GROUP BY
	ProductKey
ORDER BY
	SUM(SalesAmount) DESC


-- FACTONLINESALES
-- 3. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID
-- (CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
-- SalesQuantity).
-- b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto
-- e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).

-- a)
SELECT TOP(1)
	CustomerKey AS 'CLIENTE',
	SUM(SalesQuantity) AS 'QTDE VENDIDA'
FROM 
	FactOnlineSales
GROUP BY
	CustomerKey

ORDER BY
	SUM(SalesQuantity) DESC

-- b)
SELECT TOP(3)
	ProductKey AS 'ID DO PRODUTO',
	SUM(SalesQuantity) AS 'QTDE VENDIDA'
FROM
	FactOnlineSales
WHERE
	CustomerKey = 19037
GROUP BY
	ProductKey
ORDER BY
	SUM(SalesQuantity) DESC


-- DIMPRODUCT
-- 4. a) Faça um agrupamento e descubra a quantidade total de produtos por marca.
-- b) Determine a média do preço unitário (UnitPrice) para cada ClassName.
-- c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.
-- a)
SELECT
	BrandName AS 'PRODUTOS',
	COUNT(DISTINCT ProductName) AS 'QTDE DE PRODUTOS'
FROM
	DimProduct
GROUP BY
	BrandName
ORDER BY
	COUNT(DISTINCT ProductName) DESC
-- b)
SELECT
	ClassName,
	AVG(UnitPrice) AS 'MÉDIA DO PREÇO UNITÁRIO'
FROM
	DimProduct
GROUP BY
	ClassName
ORDER BY
	AVG(UnitPrice) DESC
-- c)
SELECT
	ColorName AS 'CORES',
	CONCAT(SUM(Weight),' KG') AS 'PESO' 
FROM
	DimProduct
GROUP BY
	ColorName
ORDER BY
	SUM(Weight) DESC

