SELECT pz.name AS pizzeria_name
FROM person_visits pv
JOIN pizzeria pz ON pz.id = pv.pizzeria_id
JOIN person pr ON pr.id = pv.person_id
WHERE pr.name = 'Andrey'
EXCEPT
SELECT pz.name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON pz.id = m.pizzeria_id
JOIN person pr ON pr.id = po.person_id
WHERE pr.name = 'Andrey'
ORDER BY 1;