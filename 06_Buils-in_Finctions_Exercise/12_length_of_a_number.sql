SELECT
    population,
    LENGTH(CAST(population AS VARCHAR)) AS "Population Length"
FROM
    countries;