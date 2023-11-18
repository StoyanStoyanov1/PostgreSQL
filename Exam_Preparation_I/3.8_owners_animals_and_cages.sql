SELECT
	CONCAT(o."name", ' - ', a."name") AS "Owners - Animals",
	o.phone_number AS "Phone Number",
	ac.cage_id AS "Cage ID"
FROM owners o
JOIN animals a ON a.owner_id = o.id
JOIN animal_types at 
	ON at.id = a.animal_type_id 
	AND at.animal_type = 'Mammals'
JOIN animals_cages ac ON ac.animal_id = a.id
ORDER BY o."name" ASC, a."name" DESC;