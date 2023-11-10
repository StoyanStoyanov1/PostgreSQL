SELECT
	c.country_name,
	r.river_name
FROM countries AS c
LEFT JOIN countries_rivers 
	USING (country_code)
LEFT JOIN rivers AS r 
	ON r.id = countries_rivers.river_id
WHERE c.continent_code LIKE 'AF'
ORDER BY c.country_name
LIMIT 5;

