(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'female'
EXCEPT ALL
SELECT pizzeria.name
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'male')
UNION ALL
(SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'male'
EXCEPT ALL
SELECT pizzeria.name
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
JOIN person ON person.id = person_visits.person_id
WHERE person.gender = 'female')
ORDER BY 1;