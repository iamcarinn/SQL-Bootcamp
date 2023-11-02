SELECT p.name, COUNT(*) AS count_of_visits
FROM person_visits pv
INNER JOIN person p ON p.id = pv.person_id
GROUP BY p.name
HAVING COUNT(*) > 3;