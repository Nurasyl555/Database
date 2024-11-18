CREATE DATABASE lab7;
CREATE TABLE countries (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL
);

INSERT INTO countries (name) VALUES
         ('USA'),
         ('Germany'),
         ('France'),
         ('India'),
         ('Russia');

UPDATE countries
SET name = 'germany'
WHERE name = 'Germany';


CREATE TABLE employees (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        surname VARCHAR(100) NOT NULL,
        salary NUMERIC(10, 2) NOT NULL,
        department_id INT NOT NULL
);

INSERT INTO employees (name, surname, salary, department_id) VALUES
                                                                 ('John', 'Doe', 5000.00, 1),
                                                                 ('Jane', 'Smith', 6000.00, 2),
                                                                 ('Alice', 'Johnson', 7000.00, 1),
                                                                 ('Bob', 'Brown', 8000.00, 3),
                                                                 ('Charlie', 'Davis', 9000.00, 2);

CREATE TABLE departments (
                             id SERIAL PRIMARY KEY,
                             department_id INT UNIQUE,
                             budget NUMERIC(10, 2) NOT NULL
);

INSERT INTO departments (department_id, budget) VALUES
                                                    (1, 100000.00),
                                                    (2, 200000.00),
                                                    (3, 300000.00);