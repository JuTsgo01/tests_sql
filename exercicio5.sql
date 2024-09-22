SUB QUERYS

SELECT *

FROM 
    (

    SELECT seller_state AS 'estados',
        COUNT (DISTINCT seller_id) AS 'qtde_vendedor'
    FROM tb_sellers
    GROUP BY seller_state
    )

WHERE qtde_vendedor > 10