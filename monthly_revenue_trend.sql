--Query to show total monthly revenue 
--Using standard defensive filters to ensure data integrity

SELECT 
	TO_CHAR(o.order_date, 'YYYY-Mon') AS year_month,
	ROUND(SUM(o.quantity * p.unit_price * (1.0 - o.discount))::NUMERIC, 3) AS total_revenue 
FROM orders AS o 
INNER JOIN products AS p 
	ON o.product_id = p.product_id 
WHERE o.discount IS NOT NULL
	AND o.order_id IS NOT NULL
	AND p.unit_price != 0
	AND p.unit_price IS NOT NULL
	AND o.quantity IS NOT NULL
	AND o.quantity !=0
	AND o.order_date IS NOT NULL
GROUP BY 
	EXTRACT(YEAR FROM o.order_date),
	EXTRACT(MONTH FROM o.order_date),
	TO_CHAR(o.order_date, 'YYYY-Mon')
ORDER BY 
	EXTRACT(YEAR FROM o.order_date),
	EXTRACT(MONTH FROM o.order_date)
ASC
;