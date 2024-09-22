SELECT seller_state AS 'estados',
    COUNT(DISTINCT seller_id) AS 'qtde_vendedor'

FROM tb_sellers

WHERE seller_state IN ('SP', 'RJ', 'PR')

GROUP BY seller_state