CREATE OR REPLACE PROCEDURE sp_increase_salaries(
	department_name VARCHAR (30)
) 
AS
$$
BEGIN
    UPDATE employees
    SET salary = salary * 1.05
    WHERE department_id = 
    (SELECT d.department_id
        FROM departments d
        WHERE d.name = department_name
        GROUP BY d.department_id
	);
END
$$
LANGUAGE plpgsql;