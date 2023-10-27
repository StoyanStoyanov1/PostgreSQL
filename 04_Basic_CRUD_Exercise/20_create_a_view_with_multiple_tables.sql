CREATE VIEW view_addresses AS
SELECT
    CONCAT(first_name, ' ', last_name) AS "Full Name",
    employees.department_id,
    CONCAT(number, ' ', street) AS "Address"
FROM
    employees
JOIN
    addresses ON employees.address_id = addresses.id
ORDER BY
    "Address";
