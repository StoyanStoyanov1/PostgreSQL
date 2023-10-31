SELECT
    peak_name,
    RIGHT(peak_name, 4) AS "Positive Left",
    CASE
        WHEN LENGTH(peak_name) > 4 THEN RIGHT(peak_name, LENGTH(peak_name) - 4)
        ELSE ''
    END AS "Negative Left"
FROM
    peaks;