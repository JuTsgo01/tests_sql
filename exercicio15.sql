/*
Descobrimos: categoria mais vendida: cama_mesa_banho = 11115 qtde
objetivo 1: Agrupar o faturamento por estador apenas dos produtos vendidos da categoria cama mesa banho
Ter como resultado: faturamento e qtd do produtos vendidos da categoria cama mesa e banho agrupado por estado
*/ 

-- sub query com INNER JOIN (má prática)



SELECT 
    t3.seller_state AS estado,
    t2.product_id,
    ROUND(SUM(t1.price), 2) AS receita

FROM 
    tb_order_items AS t1


INNER JOIN
    tb_products AS t2
ON 
    t1.product_id = t2.product_id


INNER JOIN
    tb_sellers AS t3
ON
    t1.seller_id = t3.seller_id

INNER JOIN (

        SELECT t2.product_category_name
        FROM 
            tb_order_items AS t1
        INNER JOIN
            tb_products AS t2
        ON t1.product_id = t2.product_id
        GROUP BY
            t2.product_category_name
        ORDER BY
            count(*) DESC
        LIMIT 1
) AS t4

ON t2.product_category_name = t4.product_category_name

GROUP BY 
    t3.seller_state,
    t2.product_id

ORDER BY 3 DESC












