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
WHERE total_cost = (SELECT MIN(total_cost) FROM paths)
UNION
SELECT *
FROM paths
WHERE total_cost = (SELECT MAX(total_cost) FROM paths)
ORDER BY total_cost, tour;