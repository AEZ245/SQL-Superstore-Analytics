--Query to show impact of discounts in total revenue
--Using standard defensive filters to ensure data integrity

SELECT 
	CASE
		WHEN o.discount = 0 THEN 'No Discount'
		WHEN o.discount <= 0.15	 THEN 'Low Discount'
		ELSE 'High Discount'
	END AS discount_category,
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
GROUP BY 
	CASE
		WHEN o.discount = 0 THEN 'No Discount'
		WHEN o.discount <= 0.15	 THEN 'Low Discount'
		ELSE 'High Discount'
	END
ORDER BY 
	total_revenue
DESC
;