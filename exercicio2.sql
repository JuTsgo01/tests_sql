SELECT
    COUNT(*) AS qtde_linhas,
    COUNT(product_id) AS qtde_produtos,
    COUNT(DISTINCT product_id) AS qtde_produtos_unique,
    COUNT(DISTINCT product_category_name) AS qtde_categoria_unique

FROM tb_products

WHERE product_category_name = 'artes'