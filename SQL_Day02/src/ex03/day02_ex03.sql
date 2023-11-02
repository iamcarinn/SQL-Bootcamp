WITH series_cte AS (SELECT CAST(series AS DATE) AS missing_date
FROM generate_series('2022-01-01' :: date, '2022-01-10', '1 day') AS series)
SELECT missing_date
FROM series_cte
LEFT JOIN (SELECT *
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS tmp ON tmp.visit_date = missing_date
WHERE pizzeria_id IS NULL
ORDER BY missing_date;