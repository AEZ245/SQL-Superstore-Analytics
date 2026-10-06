--Query to determine the top 5 customers by total revenue, and also how many orders they have
--Using standard defensive filters to ensure data integrity

SELECT 
	c.customer_name,
	COUNT(DISTINCT o.order_id) AS total_orders,
	ROUND(SUM(o.quantity * p.unit_price * (1.0 - o.discount))::NUMERIC, 3) AS total_revenue
FROM orders AS o
INNER JOIN products AS p
	ON o.product_id = p.product_id
INNER JOIN customers AS c
	ON o.customer_id = c.id
WHERE o.discount IS NOT NULL
	AND o.order_id IS NOT NULL
	AND p.unit_price != 0
	AND p.unit_price IS NOT NULL
	AND o.quantity IS NOT NULL
	AND o.quantity !=0
	AND c.customer_name IS NOT NULL
GROUP BY
	c.customer_name
ORDER BY total_revenue DESC
LIMIT 5;