-- Total quantity of pizzas sold (SUM).
SELECT SUM(quantity) AS total_quantity_pizzas_sold
FROM order_details;
-- Average pizza price (AVG).
SELECT ROUND(AVG(price),2) AS avg_pizza_price
FROM pizzas; 
-- Total order value per order (JOIN, SUM, GROUP BY).
SELECT o.order_id, SUM(od.quantity*p.price) AS order_value
FROM orders o 
JOIN order_details od 
ON o.order_id = od.order_id
JOIN pizzas p
ON p.pizza_id = od.pizza_id
GROUP BY o.order_id; 
-- Total quantity sold per pizza category (JOIN, GROUP BY).
SELECT pt.category, SUM(od.quantity) AS total_quantity
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od 
ON od.pizza_id = p.pizza_id
GROUP BY pt.category; 
-- Categories with more than 5,000 pizzas sold (HAVING).
SELECT pt.category, SUM(od.quantity) AS total_quantity
FROM pizza_types pt
JOIN pizzas p
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details od 
ON od.pizza_id = p.pizza_id
GROUP BY pt.category
HAVING SUM(od.quantity) > 5000; 
-- Pizzas never ordered (LEFT/RIGHT JOIN).
SELECT p.pizza_id, p.pizza_type_id, p.size, p.price
FROM pizzas p
LEFT JOIN order_details od
ON p.pizza_id = od.pizza_id
WHERE od.order_id IS NULL; 
-- Price differences between different sizes of the same pizza (SELF JOIN).
SELECT 
    p1.pizza_type_id,
    p1.size AS size_1,
    p1.price AS price_1,
    p2.size AS size_2,
    p2.price AS price_2,
    (p2.price - p1.price) AS price_difference
FROM pizzas p1
JOIN pizzas p2
  ON p1.pizza_type_id = p2.pizza_type_id
 AND (CASE p1.size WHEN 'S' THEN 1 WHEN 'M' THEN 2 WHEN 'L' THEN 3 WHEN 'XL' THEN 4 WHEN 'XXL' THEN 5 END)
    <
     (CASE p2.size WHEN 'S' THEN 1 WHEN 'M' THEN 2 WHEN 'L' THEN 3 WHEN 'XL' THEN 4 WHEN 'XXL' THEN 5 END);













