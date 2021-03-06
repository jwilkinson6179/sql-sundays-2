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
SELECT id, stadium, team1, team2
FROM game
WHERE id=1012;

-- Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT go.player, go.teamid, ga
.stadium, ga.mdate
FROM game ga JOIN goal go
ON
(id=matchid)
WHERE go.teamid
='GER';

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT ga.team1, ga.team2,           go.player
FROM goal go
JOIN  game ga
on go.matchid
= ga.id
WHERE go.player
LIKE 'Mario%';

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
FROM goal
    JOIN eteam ON teamid=id
WHERE gtime<=10;

-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT g.mdate, t.teamname
FROM game g
    JOIN eteam t ON team1=t.id
WHERE coach='Fernando Santos';

-- List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
FROM goal
    JOIN game ON matchid=id
WHERE stadium='National Stadium, Warsaw';

-- Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id
WHERE (team1='GER' OR team2='GER') AND teamid!='GER';

-- Show teamname and the total number of goals scored.
SELECT teamname, COUNT(player)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname;

-- Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(player)
FROM goal
    JOIN game ON matchid=id
GROUP BY stadium;

-- For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid, mdate, COUNT(player) goals
FROM game JOIN goal ON matchid = id
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid;

-- For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(player) germany_goals
FROM goal
    JOIN game ON matchid = id
WHERE (team1 = 'GER' OR team2='GER') AND teamid='GER'
GROUP BY matchid;

-- Sort your result by mdate, matchid, team1 and team2
SELECT mdate,
    team1,
    SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
    team2,
    SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
FROM game JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2;

