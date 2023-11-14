CREATE OR REPLACE FUNCTION fn_full_name(
	first_name VARCHAR(20),
	last_name VARCHAR(20)
)
RETURNS VARCHAR
AS
$$
DECLARE
	full_name VARCHAR(50);
BEGIN
	full_name := concat(INITCAP(first_name), ' ', INITCAP(last_name));
	RETURN full_name;
END;
$$
LANGUAGE plpgsql;