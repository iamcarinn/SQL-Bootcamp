SELECT p.address, piz.name, COUNT(*) AS count_of_orders
FROM person_order po
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN person p ON p.id = po.person_id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY p.address, piz.name
ORDER BY 1,2;