CREATE INDEX index_name ON countries USING HASH (name);
SELECT * FROM countries WHERE name = 'USA';
DROP INDEX index_name;

CREATE INDEX index_surname_name ON employees  (name, surname);
SELECT * FROM employees WHERE name = 'Jane'AND surname = 'Smith';
DROP INDEX index_surname_name ;

CREATE UNIQUE INDEX index_salary ON employees (salary);
SELECT * FROM employees WHERE salary < 9000 AND salary > 6000;

DROP INDEX index_salary;

CREATE INDEX employees_substr_name_idx
    ON employees (substring(name from 1 for 4));
SELECT * FROM employees
    WHERE substring(name from 1 for 4) = 'Char';
DROP INDEX employees_substr_name_idx;

CREATE INDEX employees_department_salary_idx ON employees (department_id, salary);
CREATE INDEX departments_department_budget_idx ON departments (department_id, budget);
SELECT * FROM employees e JOIN departments d
ON d.department_id = e.department_id
WHERE d.budget > 100000 AND e.salary < 300000;
DROP INDEX employees_department_salary_idx ;
DROP INDEX departments_department_budget_idx;
