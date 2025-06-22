-- Revenue by Product Category

SELECT
  p.category,
  ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount)), 2) AS category_revenue
FROM order_details od
JOIN products p ON od.product_id = p.id
GROUP BY p.category
ORDER BY category_revenue DESC;