--Qual o peso médio dos pordutos por vendedor de cada estado?
--Considere apenas o ano de 2017 e pedidos entregues
-- Usei a a data da aprovação da venda, pois se foi aprovado, foi vendido

SELECT 
    t1.seller_id AS 'vendedor',
    AVG(t3.product_weight_g) AS 'peso_medio',
    t4.seller_state AS 'estado'


FROM
    tb_order_items AS t1


INNER JOIN
    tb_orders AS t2
ON
    t1.order_id = t2.order_id


INNER JOIN
    tb_products AS t3
ON 
    t1.product_id = t3.product_id


INNER JOIN
    tb_sellers AS t4
ON t1.seller_id = t4.seller_id


WHERE
    t2.order_status = 'delivered'
AND
    STRFTIME('%Y-%m-%d', t2.order_approved_at) LIKE '2017%'


GROUP BY
    t1.seller_id

ORDER BY
    AVG(t3.product_weight_g) DESC
