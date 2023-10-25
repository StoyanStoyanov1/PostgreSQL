-- Update salaries for Managers
UPDATE employees
SET salary = salary + 100
WHERE job_title = 'Manager';

-- Retrieve information for all Managers
SELECT * FROM employees WHERE job_title = 'Manager';
