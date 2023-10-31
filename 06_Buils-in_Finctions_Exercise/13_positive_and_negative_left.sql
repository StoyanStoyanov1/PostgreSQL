SELECT
    peak_name,
    LEFT(peak_name, 4) AS "Positive Left",
    CASE
        WHEN LENGTH(peak_name) > 4 THEN LEFT(peak_name, LENGTH(peak_name) - 4)
        ELSE ''
    END AS "Negative Left"
FROM
    peaks;