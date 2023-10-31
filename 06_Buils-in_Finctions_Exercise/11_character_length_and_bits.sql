SELECT
    CONCAT(mountain_range, ' ', peak_name) AS "Mountain Information",
    CHAR_LENGTH(CONCAT(mountain_range, ' ', peak_name)) AS "Characters Length",
    BIT_LENGTH(CONCAT(mountain_range, ' ', peak_name)) AS "Bits of a String"
FROM
    mountains, peaks
WHERE
	mountains.id = peaks.mountain_id;