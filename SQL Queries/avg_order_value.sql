-- Average Order Value per Customer for insights on purchasing behavior

SELECT
  c.id AS company_id,
  c.company AS name_of_company,
  COUNT(o.id) AS total_orders,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount)), 2) AS total_spend,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount)) / COUNT(o.id), 2) AS avg_order_value
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
GROUP BY c.id, c.company
ORDER BY avg_order_value DESC;
