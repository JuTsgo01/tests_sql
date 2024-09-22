SELECT DISTINCT
 
    CASE WHEN product_category_name IS NULL THEN 'outros'
    
    WHEN product_category_name = 'alimentos' -- primeira forma
        or product_category_name = 'alimentos_bebidas' THEN 'alimentos'
    
    WHEN product_category_name IN ('artes', 'artes_e_artesanato') THEN 'artes' -- segunda forma 

    WHEN product_category_name LIKE '%artigos%' THEN 'artigos' -- terceira forma 

    ELSE product_category_name END
    
    AS 'categorias_fillna'

FROM tb_products

ORDER BY 1 