--Query to determine the top 5 states by total revenue
--Using standard defensive filters to ensure data integrity

SELECT 
	o.country, 
	o.state, 
	o.city, 
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
	AND o.state IS NOT NULL
	AND o.city IS NOT NULL
GROUP BY 
	o.country,
	o.state,
	o.city
ORDER BY total_revenue DESC
LIMIT 5;