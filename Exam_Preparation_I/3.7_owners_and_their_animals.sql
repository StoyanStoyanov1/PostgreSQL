WITH OwnerAnimalCounts AS (
    SELECT
        o.name AS owner_name,
        COUNT(a.id) AS count_of_animals
    FROM owners AS o
    LEFT JOIN animals AS a
    ON o.id = a.owner_id
    GROUP BY o.name
    ORDER BY
        count_of_animals DESC,
        owner_name ASC
    LIMIT 5
)

SELECT
    owner_name,
    count_of_animals
FROM
    OwnerAnimalCounts;
