SELECT CAST(series AS DATE) AS missing_date
FROM generate_series('2022-01-01' :: date, '2022-01-10', '1 day') AS series
         LEFT JOIN (SELECT *
                    FROM person_visits
                    WHERE person_id = 1
                       OR person_id = 2) AS tmp ON tmp.visit_date = series
WHERE pizzeria_id IS NULL
ORDER BY missing_date;