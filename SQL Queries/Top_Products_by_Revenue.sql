-- Top 10 Products by Revenue to identify the most profitable items

SELECT
p.product_name,
ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount)), 2) AS total_revenue
FROM products p
JOIN order_details od ON p.id = od.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 10;