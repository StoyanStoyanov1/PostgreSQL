-- Create view for top-paid employee
CREATE OR REPLACE VIEW top_paid_employee AS
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- Retrieve information for top-paid employee
SELECT * FROM top_paid_employee;