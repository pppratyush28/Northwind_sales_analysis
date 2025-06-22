-- Top 10 Customers by Total Spend to understand who the most valuable customers are.

SELECT
  c.id AS company_id,
  c.company AS name_of_company,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount)), 2) AS total_spend
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
GROUP BY c.id, c.company
ORDER BY total_spend DESC
LIMIT 10;
