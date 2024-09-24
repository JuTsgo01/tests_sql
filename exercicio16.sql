
WITH tb_seller_product AS (

    SELECT 
        t1.seller_id,
        t1.product_id,
        COUNT(product_id) AS qtde_produto_vendido,
        ROUND(SUM(t1.price), 2) AS receita

    FROM
        tb_order_items AS t1

    INNER JOIN
        tb_orders AS t2
    ON
        t1.order_id = t2.order_id

    WHERE
        t2.order_status = 'delivered'

    GROUP BY
        t1.seller_id,
        t1.product_id

    ORDER BY
        3 DESC
),

tb_seller_sort AS (

    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY
                                seller_id
                            ORDER BY
                                qtde_produto_vendido DESC,
                                receita DESC) AS order_enumerate

    FROM
        tb_seller_product
)

SELECT 
    seller_id,
    product_id,
    qtde_produto_vendido

FROM
    tb_seller_sort

WHERE
    order_enumerate <= 5