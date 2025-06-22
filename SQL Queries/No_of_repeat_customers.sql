-- Number of Repeat Customers who placed multiple orders

SELECT
  (SELECT COUNT(*) 
   FROM (
     SELECT customer_id
     FROM orders
     GROUP BY customer_id
     HAVING COUNT(id) > 1
   ) AS repeated) AS repeat_customers,

  (SELECT COUNT(*) 
   FROM (
     SELECT customer_id
     FROM orders
     GROUP BY customer_id
     HAVING COUNT(id) = 1
   ) AS single_visit) AS single_time_visitors;