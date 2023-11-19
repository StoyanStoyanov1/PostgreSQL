SELECT
	v."name" AS volunteers,
	v.phone_number,
	SUBSTRING(v.address FROM POSITION('Sofia' IN v.address) + LENGTH('Sofia, ')) AS address_in_sofia
FROM volunteers v
JOIN volunteers_departments vd 
    ON vd.id = v.department_id 
    AND vd.department_name = 'Education program assistant'
WHERE v.address LIKE '%Sofia%' 
ORDER BY
    volunteers ASC;