 Beginner-Level Queries

 1) List all customers who signed up in 2024.

 SELECT * FROM customers
WHERE EXTRACT(YEAR FROM signup_date) = 2024;

2) Get the number of orders by each order status.

SELECT status, COUNT(*) AS total_orders
FROM orders
GROUP BY status;

3) Show the top 5 most expensive products.

SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

4) Find all customers from Canada.

SELECT * FROM customers
WHERE country = 'Canada';

 Intermediate-Level Queries

 5) Total revenue per product (based on quantity × item_price).

 SELECT a.product_name, SUM(oi.quantity * oi.item_price) AS total_revenue
FROM order_items oi
JOIN products a ON oi.product_id = a.product_id
GROUP BY a.product_name
ORDER BY total_revenue DESC;

6) Monthly order count (only completed orders).

SELECT extract('month'from order_date) AS month, COUNT(*) AS total_orders
FROM orders
WHERE status = 'Completed'
GROUP BY month
ORDER BY month;

7) List customers with more than 1 order.

SELECT c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.first_name, c.last_name
HAVING COUNT(o.order_id) > 1;

8) Which category generated the highest revenue?

SELECT p.category, SUM(oi.quantity * oi.item_price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY revenue DESC;

Advanced-Level Queries

9) Rank customers by total amount spent.

SELECT c.first_name, c.last_name,
       SUM(oi.quantity * oi.item_price) AS total_spent,
       RANK() OVER (ORDER BY SUM(oi.quantity * oi.item_price) DESC) AS spending_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.status = 'Completed'
GROUP BY c.first_name, c.last_name;

10) CTE to find categories with revenue over ₹1000

WITH category_sales AS (
  SELECT p.category, SUM(oi.quantity * oi.item_price) AS revenue
  FROM order_items oi
  JOIN products p ON oi.product_id = p.product_id
  JOIN orders o ON o.order_id = oi.order_id
  WHERE o.status = 'Completed'
  GROUP BY p.category
)
SELECT * FROM category_sales
WHERE revenue > 1000;

11) Customers who spent more than average total customer spending

WITH customer_spending AS (
  SELECT c.customer_id, SUM(oi.quantity * oi.item_price) AS total_spent
  FROM customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  WHERE o.status = 'Completed'
  GROUP BY c.customer_id
),
avg_spending AS (
  SELECT AVG(total_spent) AS avg_spent FROM customer_spending
)
SELECT cs.*
FROM customer_spending cs, avg_spending
WHERE cs.total_spent > avg_spent;






























































































 









