SELECT CASE WHEN tb_products.product_category_name IS NULL THEN 'outros'
            ELSE tb_products.product_category_name END AS categoria_produto,

        ROUND(SUM(tb_order_items.price), 2) AS faturamento,

        ROUND(SUM(tb_order_items.freight_value), 2) AS despesa_frete,

        COUNT(DISTINCT tb_order_items.product_id) AS qtde_produto_vendido,

        tb_orders.order_approved_at AS data_aprovacao,

        tb_orders.order_status AS status_pedido 

FROM tb_products

INNER JOIN tb_order_items

ON tb_products.product_id = tb_order_items.product_id

INNER JOIN tb_orders 
ON tb_order_items.order_id =  tb_orders.order_id

WHERE tb_orders.order_approved_at LIKE '%2017%'
        AND tb_orders.order_status  = 'delivered'

GROUP BY tb_products.product_category_name

ORDER BY COUNT(DISTINCT tb_order_items.product_id) DESC