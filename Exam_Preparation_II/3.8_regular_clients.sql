SELECT
    c.full_name,
    COUNT(DISTINCT co.car_id) AS count_of_cars,
    SUM(co.bill) AS total_sum
FROM clients c
JOIN courses co ON c.id = co.client_id
WHERE
    LENGTH(c.full_name) >= 2
    AND SUBSTRING(c.full_name, 2, 1) = 'a'
GROUP BY
    c.full_name
HAVING
    COUNT(DISTINCT co.car_id) > 1
ORDER BY
    c.full_name;