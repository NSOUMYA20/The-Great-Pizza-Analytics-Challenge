-- Orders placed on '2015-01-01' (SELECT + WHERE).
SELECT * FROM orders
WHERE date = '2015-01-01'; 
-- List pizzas with price descending.
SELECT * FROM pizzas
ORDER BY price DESC;
-- Pizzas sold in sizes 'L' or 'XL'.
SELECT * FROM pizzas
WHERE size in ('L','XL'); 
-- Pizzas priced between $15.00 and $17.00.
SELECT * FROM pizzas
WHERE price BETWEEN 15.00 AND 17.00; 
-- Pizzas with "Chicken" in the name.
SELECT * FROM pizza_types
WHERE name LIKE '%Chicken%';
-- Orders on '2015-02-15' or placed after 8 PM.
SELECT * FROM orders
WHERE date = '2015-02-15' OR time > '20:00:00';



