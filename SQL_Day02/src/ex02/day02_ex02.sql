SELECT 
    COALESCE(person.name, '-') AS person_name,
    visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM pizzeria
	FULL JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03')
		AS tmp ON tmp.pizzeria_id = pizzeria.id
	FULL JOIN person ON tmp.person_id = person.id
ORDER BY
    person_name, visit_date, pizzeria_name;