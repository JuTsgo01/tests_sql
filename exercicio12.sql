--exercicio 12

--Qual o total de receita gerada por consumidores de cada estado?
--OBS: considere a base completa e com apenas pedidos que foram entregue



SELECT
    t1.customer_id AS 'clientes',
    t2.customer_state AS 'estado_cliente',
    ROUND(SUM(t3.price), 2) AS 'faturamento'

FROM 
    tb_orders AS t1

INNER JOIN
    tb_customers AS t2
ON 
    t1.customer_id = t2.customer_id

INNER JOIN
    tb_order_items as t3

ON t1.order_id = t3.order_id

WHERE t1.order_status = 'delivered'

GROUP BY t1.customer_id

ORDER BY 3 DESC

