
WITH tb_seller_order_dateapproved AS (

    SELECT t1.seller_id,
            t1.order_id,
            DATE(t2.order_approved_at) as data_order
            


    FROM
        tb_order_items as t1

    INNER JOIN
        tb_orders AS t2
    ON t1.order_id = t2.order_id

    WHERE
        order_status = 'delivered'
),

tb_seller_sort AS (

    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY Seller_id, data_order) AS date_sort


    FROM
        tb_seller_order_dateapproved
),

tb_seller_data_lag AS (

SELECT seller_id,
        order_id,
        data_order,
        LAG(data_order) OVER (PARTITION BY
                                seller_id
                             ORDER BY 
                                data_order) AS lag_data

FROM
    tb_seller_sort

WHERE 
    date_sort = 1 
) 


SELECT *

FROM
    tb_seller_data_lag;