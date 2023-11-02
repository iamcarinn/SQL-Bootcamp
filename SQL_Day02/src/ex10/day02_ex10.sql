SELECT t1.name AS person_name1,
	t2.name AS person_name2,
	t1.address AS common_address
FROM person AS t1
	JOIN person AS t2 ON t1.address = t2.address
WHERE t1.id > t2.id
ORDER BY person_name1, person_name2, common_address;