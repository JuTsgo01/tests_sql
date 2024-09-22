--exercicio 12

--Qual o total de receita gerada por consumidores de cada estado?
--OBS: considere a base completa e com apenas pedidos que foram entregue


/* Resultado 2: receita por estado*/
SELECT 
    t2.customer_state AS 'estado_cliente',
    SUM(t3.price)  AS 'faturamento'

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

GROUP BY t2.customer_state

ORDER BY 2 DESC;