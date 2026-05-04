SELECT *
FROM DimProduct

SELECT
	ColorName AS 'COR DO PRODUTO',
	COUNT(*) AS 'TOTAL DE PRODUTOS'
FROM
	DimProduct
WHERE
	BrandName =	'Contoso'
GROUP BY
	ColorName
