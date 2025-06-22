-- Segment Customers by Total Spend based on their total lifetime value

SELECT
  c.id,
  c.company,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount)), 2) AS lifetime_value,
  CASE
    WHEN SUM(od.unit_price * od.quantity * (1 - od.discount)) >= 10000 THEN 'High Value'
    WHEN SUM(od.unit_price * od.quantity * (1 - od.discount)) >= 5000 THEN 'Medium Value'
    ELSE 'Low Value'
  END AS customer_segment
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
GROUP BY c.id, c.company
ORDER BY lifetime_value DESC;