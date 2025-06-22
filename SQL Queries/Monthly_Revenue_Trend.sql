-- Finding the Monthly Revenue Trend to understand the business' performance over time.

SELECT
  DATE_FORMAT(O.order_date, '%Y-%m') AS month,
  ROUND(SUM(OD.unit_price * od.quantity * (1 - od.discount)), 2) AS revenue
FROM orders O
JOIN order_details OD ON O.id = OD.order_id
GROUP BY month
ORDER BY month;