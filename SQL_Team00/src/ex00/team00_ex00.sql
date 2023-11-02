CREATE TABLE cities (
    point1 VARCHAR(1) NOT NULL,
    point2 VARCHAR(1) NOT NULL,
    cost INTEGER NOT NULL);

INSERT INTO cities (point1, point2, cost) (
	SELECT vals.point1, vals.point2, vals.cost
	FROM (
		SELECT 'a' point1, 'b' point2, 10 cost UNION
		SELECT 'b', 'a', 10 UNION
		SELECT 'a', 'c', 15 UNION
		SELECT 'c', 'a', 15 UNION
		SELECT 'a', 'd', 20 UNION
		SELECT 'd', 'a', 20 UNION
		SELECT 'b', 'c', 35 UNION
		SELECT 'c', 'b', 35 UNION
		SELECT 'b', 'd', 25 UNION
		SELECT 'd', 'b', 25 UNION
		SELECT 'c', 'd', 30 UNION
		SELECT 'd', 'c', 30) vals
WHERE NOT EXISTS (
    SELECT point1, point2, cost
    FROM cities)
ORDER BY point1, point2, cost);

WITH RECURSIVE
 -- ГЕНЕРИРУЕМ ПУТИ С ЦЕНОЙ
traces AS (
 -- Начальное состояние со стоимостью 0, текущей точкой 'a' и пустым комбинированным путем
    SELECT 0 total_cost, CAST('a' AS VARCHAR(1)) current_point, '' combined_tour
    UNION
 -- Рекурсивный шаг - добавляем следующую вершину и стоимость к текущему пути
    SELECT total_cost + cities.cost, cities.point2, combined_tour || ',' || cities.point2
    FROM cities, traces tr
    WHERE cities.point1 = tr.current_point AND combined_tour NOT LIKE ('%' || cities.point2 || '%')),

-- ВОЗВРАЩАЕМ САМЫЕ ДЛИННЫЕ ПУТИ, КОТОРЫЕ ПРИХОДЯТ В ТОЧКУ а
paths AS (
 SELECT total_cost, '{a' || combined_tour || '}' tour
    FROM traces
    WHERE LENGTH(traces.combined_tour) = 8 AND RIGHT(traces.combined_tour, 1) = 'a'
    ORDER BY total_cost, tour)

SELECT *
FROM paths
WHERE total_cost = (SELECT MIN(total_cost) FROM paths);
