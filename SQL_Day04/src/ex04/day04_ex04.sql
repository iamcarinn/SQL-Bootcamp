CREATE OR REPLACE VIEW v_symmetric_union AS
WITH r AS(SELECT person_id FROM person_visits
			 WHERE visit_date = '2022-01-02'),
	 s AS (SELECT person_id FROM person_visits
			 WHERE visit_date = '2022-01-06'),
	 r_s AS (SELECT * FROM r
			   EXCEPT ALL
			   SELECT * FROM s),
	 s_r AS (SELECT * FROM s
			   EXCEPT ALL
			   SELECT * FROM r)
SELECT * FROM r_s
UNION ALL
SELECT * FROM s_r
ORDER BY person_id;