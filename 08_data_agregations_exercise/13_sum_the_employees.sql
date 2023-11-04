SELECT
	count(CASE WHEN department_id = 1 THEN 1 END) AS "Engineering",
	count(CASE WHEN department_id = 2 THEN 1 END) AS "Tool Design",
	count(CASE WHEN department_id = 3 THEN 1 END) AS "Sales",
	count(CASE WHEN department_id = 4 THEN 1 END) AS "Marketing",
	count(CASE WHEN department_id = 5 THEN 1 END) AS "Purchasing",
	count(CASE WHEN department_id = 6 THEN 1 END) AS "Research and Development",
	count(CASE WHEN department_id = 7 THEN 1 END) AS "Production"
FROM
	employees;