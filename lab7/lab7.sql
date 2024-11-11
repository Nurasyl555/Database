CREATE INDEX index_name ON countries USING HASH (name);
SELECT * FROM countries WHERE name = 'string';
DROP INDEX index_name ON countries;

CREATE INDEX index_surname_name ON employees USING HASH (name, surname);
SELECT * FROM employees WHERE name = 'string'AND surname = 'string';
DROP INDEX index_surname_name ON employees;

CREATE UNIQUE INDEX index_salary ON employees (salary);
SELECT * FROM employees WHERE salary < value1 AND salary > value2;
DROP INDEX index_salary ON employees;

CREATE INDEX employees_substr_name_idx
    ON employees (substring(name from 1 for 4));
SELECT * FROM employees
    WHERE substring(name from 1 for 4) = 'abcd';
DROP INDEX employees_substr_name_idx ON employees;

CREATE INDEX employees_department_salary_idx ON employees (department_id, salary);
CREATE INDEX departments_department_budget_idx ON departments (department_id, budget);
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.budget > value2 AND e.salary < value2;
DROP INDEX employees_department_salary_idx ON employees;
DROP INDEX departments_department_budget_idx ON departments;
