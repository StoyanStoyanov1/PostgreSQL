UPDATE coaches c
SET salary = salary * coach_level
FROM players_coaches pc
WHERE c.first_name LIKE 'C%' AND pc.coach_id = c.id;