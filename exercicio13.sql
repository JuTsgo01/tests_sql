-- Qual o valor todal de receita gerada por vendedores de cada estado
-- Considere a base completa e apenas pedidos entregues

-- Estado com maior média de faturamento por vendedor é SP e também é o que mais possui vendedores
-- Ou seja, se é a média mais alta com mais vendedores, o faturamento total do estado é maior que de todos os outros


SELECT
    t2.seller_state AS 'estados',
    COUNT(DISTINCT t1.seller_id) AS 'qtde_vendedores',    
    ROUND(SUM(t1.price) / COUNT(DISTINCT t1.seller_id), 2) AS 'receita_media_vendedor'

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
    t2.seller_state

ORDER BY 2 DESC

