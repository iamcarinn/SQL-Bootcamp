(SELECT piz.name, COUNT(*) AS count, 'visit' AS action_type
FROM person_visits pv
INNER JOIN pizzeria piz ON piz.id = pv.pizzeria_id
GROUP BY piz.name
ORDER BY 2 DESC
LIMIT 3)
UNION
(SELECT piz.name, COUNT(*) AS count, 'order' AS action_type
FROM person_order po
INNER JOIN menu m ON m.id = po.menu_id
INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
GROUP BY piz.name
ORDER BY 2 DESC
LIMIT 3)
ORDER BY 3, 2 DESC