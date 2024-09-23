SELECT product_category_name AS categorias,
    AVG(product_name_lenght) AS tamanho_medio,
    MAX(product_name_lenght) AS tamanho_maximo,
    MIN(product_name_lenght) AS tamanho_minimo

FROM tb_products

GROUP BY product_category_name