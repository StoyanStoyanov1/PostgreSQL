SELECT
	CONCAT(elevation, ' ', REPEAT('-', 3), REPEAT('>', 2), ' ', peak_name)
FROM
	peaks
WHERE
	elevation >= 4884;