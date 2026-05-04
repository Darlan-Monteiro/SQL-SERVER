-- 1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
-- DimProductSubcategory para a tabela DimProduct.
SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Produto',
	ProductSubcategoryName AS 'Subcategoria'
From
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey


-- 2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e
-- DimProductCategory. Utilize essa coluna para complementar informações na tabela
-- DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.
SELECT 
	ProductSubcategoryKey as 'id subcategoria',
	ProductSubcategoryKey as 'subcategoria',
	ProductCategoryName as 'categoria'
FROM
	DimProductSubcategory

left join DimProductCategory
	ON DimProductCategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey


