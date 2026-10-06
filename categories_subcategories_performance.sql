--Query to show best peforming sub-categories, and its parent category
--Using standard defensive filters to ensure data integrity

SELECT 
	p.category,
	p.sub_category,
	SUM(o.quantity) AS items_quantity_sold,
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
	AND p.category IS NOT NULL
	AND p.sub_category IS NOT NULL
GROUP BY 
	p.category,
	p.sub_category
ORDER BY 
	total_revenue
DESC
;