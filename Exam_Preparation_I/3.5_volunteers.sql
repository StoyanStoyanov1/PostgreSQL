SELECT
    v.name,
    v.phone_number,
    v.address,
    v.animal_id,
    v.department_id
FROM
    volunteers AS v
ORDER BY
    v.name ASC,
    v.animal_id ASC,
    v.department_id ASC;
