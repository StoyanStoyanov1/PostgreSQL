SELECT
    min(avg_area) AS min_average_area
FROM
    (SELECT
        avg(area_in_sq_km) AS avg_area
    FROM
        countries
    GROUP BY
        continent_code) AS subquery;