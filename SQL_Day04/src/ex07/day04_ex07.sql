INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES((SELECT MAX(id) + 1 FROM person_visits),
	  (SELECT id FROM person WHERE name = 'Dmitriy'),
	  (SELECT DISTINCT pizzeria.id FROM person_visits
		JOIN person ON person.id = person_visits.person_id
		JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    	JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id
	WHERE pizzeria.name != 'Papa Johns' AND menu.price < 800),
	  '2022-01-08');
	  
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- select * from  mv_dmitriy_visits_and_eats;