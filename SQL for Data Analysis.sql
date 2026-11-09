-- Task 3: SQL for Data Analysis
-- Database: ecommerce

USE ecommerce;

-- 1. SELECT
SELECT * FROM customers;

-- 2. WHERE
SELECT * FROM customers WHERE city = 'Lucknow';

-- 3. ORDER BY
SELECT product_name, price FROM products ORDER BY price DESC;

-- 4. GROUP BY + COUNT
SELECT category, COUNT(*) AS total_products
FROM products
GROUP BY category;

-- 5. AVG
SELECT AVG(price) AS average_price FROM products;

-- 6. GROUP BY + AVG
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;

-- 7. SUM
SELECT SUM(quantity) AS total_quantity_sold FROM orders;

-- 8. INNER JOIN
SELECT c.name, c.city, o.order_id, o.order_date
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- 9. LEFT JOIN
SELECT c.name, o.order_id, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 10. RIGHT JOIN
SELECT p.product_name, o.order_id, o.quantity
FROM orders o
RIGHT JOIN products p ON o.product_id = p.product_id;

-- 11. Three table JOIN
SELECT c.name, p.product_name, o.quantity, (p.price * o.quantity) AS total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id;

-- 12. Subquery: price above average
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 13. Subquery: customers who placed orders
SELECT name, city
FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- 14. View (created earlier)
-- CREATE VIEW customer_order_summary AS
-- SELECT c.name, p.product_name, o.quantity, (p.price * o.quantity) AS total_amount
-- FROM orders o
-- JOIN customers c ON o.customer_id = c.customer_id
-- JOIN products p ON o.product_id = p.product_id;
SELECT * FROM customer_order_summary;

-- 15. View with GROUP BY
SELECT name, SUM(total_amount) AS total_spent
FROM customer_order_summary
GROUP BY name
ORDER BY total_spent DESC;

-- 16. Index (created earlier)
-- CREATE INDEX idx_orders_customer ON orders(customer_id);

-- 17. Show index
SHOW INDEX FROM orders;

-- 18. EXPLAIN
EXPLAIN SELECT * FROM orders WHERE customer_id = 1;