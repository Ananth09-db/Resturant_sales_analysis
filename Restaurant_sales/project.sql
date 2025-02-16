-- Number of items on the menu
SELECT COUNT(*) 
FROM menu_items;
-- Most and Least expensive item on menu
SELECT item_name,price AS expensive 
FROM menu_items
ORDER BY price DESC
LIMIT 1;
SELECT item_name,price AS cheapest
FROM menu_items
ORDER BY price 
LIMIT 1;
-- Italian Dishes
SELECT COUNT(*)
FROM menu_items
WHERE category = 'Italian';
-- most expensise
SELECT item_name,price AS expensive 
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC
LIMIT 1;
-- least expensive
SELECT item_name,price AS cheap
FROM menu_items
WHERE category = 'Italian'
ORDER BY price ASC
LIMIT 1;
SELECT category,COUNT(*) AS num_of_items,AVG(price) AS average
FROM menu_items
GROUP BY category;
-- View of order table
SELECT * FROM order_details;
-- Date range
SELECT MIN(order_date) AS oldest,MAX(order_date) AS newest
FROM order_details;
-- No Of Orders in the date range
SELECT COUNT(DISTINCT order_id) num_of_orders
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';
-- How many items ordered witin the date range
SELECT COUNT(*) num_of_items
FROM order_details
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';
-- Which order has the most items
SELECT order_id,COUNT(item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC;
-- Number of order having more than 12 items
SELECT COUNT(*) FROM
(SELECT order_id,COUNT(item_id)
FROM order_details
GROUP BY order_id
HAVING COUNT(item_id)>12) AS num_of_orders;
-- Combining 2 tables
SELECT * 
FROM order_details o
JOIN menu_items m
ON o.item_id=m.menu_item_id;
-- what was most ordered item
SELECT DISTINCT m.item_name,
COUNT(o.order_id) AS num_of_orders
FROM order_details o
JOIN menu_items m
ON o.item_id=m.menu_item_id
GROUP BY m.item_name
ORDER BY COUNT(o.order_id) DESC
LIMIT 1;
-- What was the least ordered item
SELECT DISTINCT m.item_name,
COUNT(o.order_id) AS num_of_orders
FROM order_details o
JOIN menu_items m
ON o.item_id=m.menu_item_id
GROUP BY m.item_name
ORDER BY COUNT(o.order_id)
lIMIT 1;
-- top 5 orders that had most money spent on
SELECT o.order_id,SUM(m.price) AS money_spent
FROM order_details o
JOIN menu_items m 
ON o.item_id=m.menu_item_id
GROUP BY o.order_id
ORDER BY SUM(m.price) DESC
LIMIT 5;
-- complete details of order with highest money spent
SELECT * 
FROM order_details o
JOIN menu_items m
ON o.item_id=m.menu_item_id
WHERE order_id=440;
-- how much items and what category of items did they purchase
SELECT m.category,COUNT(o.item_id) AS num_of_items,SUM(m.price) AS cost
FROM order_details o
JOIN menu_items m
ON o.item_id=m.menu_item_id
WHERE order_id=440
GROUP BY category;
-- details of highest spent orders
SELECT o.order_id,m.category,COUNT(o.item_id) AS num_of_items,SUM(m.price) AS cost
FROM order_details o
JOIN menu_items m
ON o.item_id=m.menu_item_id
WHERE o.order_id IN (440,2075,1957,330,2675)
GROUP BY order_id,category
ORDER BY cost DESC;
-- most expensive order
SELECT o.order_id,SUM(m.price) AS cost
FROM order_details o
LEFT JOIN menu_items m
ON o.item_id=m.menu_item_id
GROUP BY order_id
ORDER BY cost DESC 
LIMIT 1;