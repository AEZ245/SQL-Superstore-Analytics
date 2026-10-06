--Query to determine the 5 products with the most revenue while mantaining standard defensive measures
SELECT 
	o.product_id,
	p.product_name,
	p.category,
	p.sub_category,
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
GROUP BY o.product_id,
	p.product_name,
	p.category,
	p.sub_category
ORDER BY total_revenue DESC
LIMIT 5;
