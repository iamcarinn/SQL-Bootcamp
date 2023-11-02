SELECT piz.name, SUM(total_count) as total_count
FROM (
    (SELECT piz.name, COUNT(*) AS total_count
    FROM person_visits pv
    INNER JOIN pizzeria piz ON piz.id = pv.pizzeria_id
    GROUP BY piz.name
    ORDER BY 2 DESC)
    UNION ALL
    (SELECT piz.name, COUNT(*) AS total_count
    FROM person_order po
    INNER JOIN menu m ON m.id = po.menu_id
    INNER JOIN pizzeria piz ON piz.id = m.pizzeria_id
    GROUP BY piz.name
    ORDER BY 2 DESC)
) AS piz
GROUP BY piz.name
ORDER BY 2 DESC, 1 ASC;