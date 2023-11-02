INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (SELECT MAX(id) FROM person_order) + gs,  id, (SELECT id FROM menu WHERE pizza_name = 'greek pizza'), '2022-02-25'
FROM person
JOIN GENERATE_SERIES(1, (SELECT COUNT(id) FROM person)) AS gs ON gs = person.id;