SELECT * FROM produtos
SELECT * FROM subcategoria

SELECT
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
FROM
	produtos
RIGHT JOIN subcategoria
	ON produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE id_produto IS NULL