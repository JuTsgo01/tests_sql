-- Qual o valor todal de receita gerada por vendedores de cada estado
-- Considere a base completa e apenas pedidos entregues

SELECT
    t1.seller_id AS 'id_vendedores',
    sum(t1.price) AS 'faturamento',
    t2.seller_state AS 'estados'


FROM 
    tb_order_items AS t1

INNER JOIN
    tb_sellers AS t2

ON
    t1.seller_id = t2.seller_id

INNER JOIN
    tb_orders AS t3

ON 
    t1.order_id = t3.order_id

WHERE 
    t3.order_status = 'delivered' --selecionando apenas pedidos entregues

GROUP BY
    t1.seller_id, t2.seller_state

ORDER BY
    t1.price DESC