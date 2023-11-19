CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department (
    searched_volunteers_department VARCHAR(30)
)
RETURNS INTEGER AS $$
DECLARE 
    count_of_volunteers INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO count_of_volunteers
    FROM volunteers_departments vd
    JOIN volunteers v ON vd.id = v.department_id
    WHERE vd.department_name = searched_volunteers_department;

    RETURN count_of_volunteers;
END;
$$
LANGUAGE plpgsql;

-- To use the function, you can call it as follows:
SELECT fn_get_volunteers_count_from_department('Education program assistant');
SELECT fn_get_volunteers_count_from_department('Guest engagement');
SELECT fn_get_volunteers_count_from_department('Zoo events');

-- Second solution
CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department (
    searched_volunteers_department VARCHAR(30)
)
RETURNS INTEGER AS $$
DECLARE 
    count_of_volunteers INTEGER;
BEGIN
	count_of_volunteers := (
		SELECT count(*)
		FROM volunteers_departments vd
		JOIN volunteers v ON vd.id = v.department_id
		WHERE vd.department_name = searched_volunteers_department
	);

    RETURN count_of_volunteers;
END;
$$
LANGUAGE plpgsql;