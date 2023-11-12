CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR (20))
RETURNS INT AS $$
    DECLARE
    BEGIN
	RETURN
	(SELECT count(*)
	FROM employees e
	JOIN addresses a
	USING(address_id)
	JOIN towns t
	USING(town_id)
	WHERE t.NAME = town_name        
	);
END
$$
LANGUAGE plpgsql;