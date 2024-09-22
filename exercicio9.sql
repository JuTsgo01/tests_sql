SELECT product_category_name AS 'categorias',
    AVG(product_name_lenght) AS 'tamanho_medio',
    MAX(product_name_lenght) AS 'tamanho_maximo',
    MIN(product_name_lenght) AS 'tamanho_minimo'

FROM tb_products

WHERE product_name_lenght > 10

GROUP BY product_category_name

HAVING AVG(product_name_lenght) > 10

ORDER BY AVG(product_name_lenght) ASC
