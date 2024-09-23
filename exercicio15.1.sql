/*
Descobrimos: categoria mais vendida: cama_mesa_banho = 11115 qtde
objetivo 1: Agrupar o faturamento por estador apenas dos produtos vendidos da categoria cama mesa banho
Ter como resultado: faturamento e qtd do produtos vendidos da categoria cama mesa e banho agrupado por estado
Onde o Status do produto seja entregue
*/ 

-- Usando WITH(melhor prática)
-- É melhor para o banco organizar o plano de execução e criar uma query mais otimizada


WITH tb_melhor_categoria AS (

    SELECT t2.product_category_name

    FROM 
        tb_order_items AS t1

    INNER JOIN
        tb_products AS t2

    ON 
        t1.product_id = t2.product_id

    GROUP BY
        t2.product_category_name

    ORDER BY
        count(*) DESC

    LIMIT 1
),

tb_status_vendas as(

    SELECT *
    
    FROM 
        tb_orders AS t1
    
    WHERE
        t1.order_status = 'delivered'
),

tb_receita_produto_estado AS (
        
    SELECT 
        t3.seller_state AS 'estado',
        t2.product_id,
        ROUND(SUM(t1.price), 2) AS 'receita',
        t2.product_category_name

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
    
    INNER JOIN
        tb_status_vendas AS t4

    ON 
        t1.order_id = t4.order_id


    GROUP BY 
        t3.seller_state,
        t2.product_id

    ORDER BY 3 DESC
)

SELECT 
    t1.estado,
    t1.product_id,
    t1.receita,
    t1.product_category_name

FROM
    tb_receita_produto_estado AS t1

INNER JOIN
    tb_melhor_categoria AS t2

ON
    t1.product_category_name = t2.product_category_name










