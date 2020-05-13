-- Return the customer name and order.id for each order
SELECT c.name, o.id
FROM customers c
    JOIN orders o ON c.id = o.customer_id;

-- Return the order id and quantity of items for each order in desc
SELECT order_id AS orderId, SUM(quantity) AS item_quantity
FROM order_details
GROUP BY order_id
ORDER BY item_quantity DESC;

-- Get the employee name & number of orders handled by each employee
SELECT e.name, COUNT(o.id) AS orders_handled
FROM orders o
    JOIN employees e ON o.employee_id = e.id
GROUP BY e.name
ORDER BY orders_handled DESC;

-- Return the name of the product that was ordered the most
SELECT p.product, SUM(od.quantity) AS most_ordered
FROM order_details od
    JOIN products p ON p.id = od.product_id
GROUP BY p.product
ORDER BY most_ordered DESC
LIMIT 1;

-- OTHER WAY TO JOIN
SELECT p
.product, SUM
(od.quantity) AS most_ordered
FROM order_details od, products p
WHERE p.id = od.product_id
GROUP BY p.product
ORDER BY most_ordered DESC;



-- Practice from https://sqlzoo.net/wiki/The_JOIN_operation
-- Modify it to show the matchid and player name for all goals scored by Germany. 
-- To identify German players, check for: teamid = 'GER'
SELECT g.matchid, g.player
FROM goal g
WHERE g.teamid='GER';

-- Show id, stadium, team1, team2 for just game 1012