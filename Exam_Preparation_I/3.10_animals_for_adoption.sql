SELECT
    a."name",
    EXTRACT(YEAR FROM a.birthdate) AS birth_year,
    at.animal_type
FROM animals a
JOIN animal_types at 
	ON a.animal_type_id = at.id 
	AND at.animal_type != 'Birds'
WHERE
    a.owner_id IS NULL
    AND age('2022-01-01', a.birthdate) < interval '5 years'
ORDER BY
    a."name" ASC;