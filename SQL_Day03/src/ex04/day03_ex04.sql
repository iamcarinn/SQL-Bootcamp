(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'female'
EXCEPT
SELECT pizzeria.name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'male')
UNION
(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'male'
EXCEPT
SELECT pizzeria.name
FROM pizzeria
JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON person_order.menu_id = menu.id
JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'female')
ORDER BY 1;