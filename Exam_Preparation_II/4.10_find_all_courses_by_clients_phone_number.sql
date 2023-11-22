CREATE OR REPLACE FUNCTION fn_courses_by_client(
    IN phone_num VARCHAR(20),
    OUT course_count INTEGER
)
AS
$$
BEGIN
    course_count := (
		SELECT COUNT(*)
    	FROM courses c
    	JOIN clients cl ON c.client_id = cl.id
    	WHERE cl.phone_number = phone_num
	);
END;
$$
LANGUAGE plpgsql;