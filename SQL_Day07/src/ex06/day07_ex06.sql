SELECT piz.name, COUNT(*) AS count_of_orders, ROUND(AVG(m.price)) AS average_price,
MAX(m.price) AS max_price, MIN(m.price) AS min_price
FROM person_order po
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY piz.name
ORDER BY 1;