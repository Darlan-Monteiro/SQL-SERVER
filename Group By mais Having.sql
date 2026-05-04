SELECT *
FROM DimProduct

SELECT
	BrandName AS 'MARCA',
	COUNT(BrandName) AS 'TOTAL POR MARCA'
FROM
	DimProduct
GROUP BY
	BrandName
HAVING COUNT(BrandName) >= 200