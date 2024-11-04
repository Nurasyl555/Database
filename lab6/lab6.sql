CREATE DATABASE lab_6;

CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY ,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations(location_id)
);

CREATE TABLE employees(
                          employee_id SERIAL PRIMARY KEY,
                          first_name VARCHAR(50),
                          last_name VARCHAR(50),
                          email VARCHAR(50),
                          phone_number VARCHAR(25),
                          salary INTEGER,
                          department_id INTEGER REFERENCES departments(department_id)
);

INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
    ('123 Elm St', '10001', 'New York', 'NY'),
    ('456 Oak Ave', '90001', 'Los Angeles', 'CA'),
    ('789 Maple Dr', '60601', 'Chicago', 'IL');
INSERT INTO departments (department_name, budget, location_id)
VALUES
    ('HR', 50000, 1),
    ('Engineering', 150000, 2),
    ('Marketing', 80000, 3);
INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('John', 'Doe', 'johndoe@example.com', '555-1234', 70000, 1),
    ('Jane', 'Smith', 'janesmith@example.com', '555-5678', 90000, 2),
    ('Alice', 'Johnson', 'alicejohnson@example.com', '555-8765', 75000, 3),
    ('Bob', 'Brown', 'bobbrown@example.com', '555-4321', 80000, 2);
SELECT e.first_name, e.last_name, e.department_id, d.department_name
from employees e
left join departments d on e.department_id = d.department_id;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id =40 OR d.department_id=80;

SELECT e.first_name, e.last_name,  e.department_id , d.department_id, l.city, l.state_province
FROM employees e
left join departments d ON e.department_id = d.department_id
LEFT JOIN  locations l ON d.location_id = l.location_id ;

SELECT d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
 WHERE e.department_id IS NULL;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;
