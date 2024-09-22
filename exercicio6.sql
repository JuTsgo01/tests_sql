SELECT product_category_name,
    MAX(product_description_lenght) AS 'tamanho_maximo',
    AVG(product_description_lenght) AS 'tamanho_medio',
    MIN(product_description_lenght) AS 'tamanho_minimo'

FROM tb_products

GROUP BY product_category_name