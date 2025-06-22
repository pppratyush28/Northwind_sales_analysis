-- Revenue by SalesPerson

SELECT
CONCAT(e.first_name, ' ', e.last_name) AS employee,
ROUND(SUM(od.unit_price * od.quantity * (1 - od.discount)), 2) AS total_sales
FROM employees e
JOIN orders o ON e.id = o.employee_id
JOIN order_details od ON o.id = od.order_id
GROUP BY employee
ORDER BY total_sales DESC;