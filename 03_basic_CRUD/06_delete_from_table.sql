-- Delete employees from department 2 and 1
DELETE FROM employees
WHERE department_id IN (1, 2);

-- Retrieve information for all employees ordered by id
SELECT * FROM employees
ORDER BY id