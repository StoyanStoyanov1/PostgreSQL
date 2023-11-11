SELECT
	count(*) AS countries_without_mountains
FROM countries
LEFT JOIN mountains_countries AS mc
	USING (country_code)
WHERE
	mc.country_code IS NULL;