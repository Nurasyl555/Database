CREATE FUNCTION  increase_value(val integer) RETURNS integer AS $$
    BEGIN
    RETURN val + 1;
    END; $$
    LANGUAGE  plpgsql;
SELECT increase_value(15);
SELECT  increase_value(10);

CREATE OR REPLACE FUNCTION GEL(
    num1 INTEGER,
    num2 INTEGER,
    OUT result TEXT
)
AS $$
BEGIN
    IF num1 > num2 THEN
        result := 'Greater';
    ELSIF num1 = num2 THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$ LANGUAGE plpgsql;
SELECT GEL(10, 15);
SELECT gel(15, 15);

CREATE OR REPLACE FUNCTION number_series(n INTEGER)
    RETURNS TABLE(num INTEGER) AS $$
BEGIN
    RETURN QUERY
        SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;
SELECT number_series(10);
--4
CREATE OR REPLACE FUNCTION find_employee(emp_name VARCHAR)
    RETURNS TABLE(id INTEGER, name VARCHAR, position VARCHAR, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY
        SELECT id, name, position, salary
        FROM employees
        WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR)
    RETURNS TABLE(product_id INTEGER, product_name VARCHAR, price NUMERIC) AS $$
BEGIN
    RETURN QUERY
        SELECT product_id, product_name, price
        FROM products
        WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

--6
CREATE OR REPLACE FUNCTION calculate_bonus(employee_id INTEGER)
    RETURNS NUMERIC AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus
    FROM employees
    WHERE id = employee_id;
    RETURN bonus;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(employee_id INTEGER)
    RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(employee_id);
    UPDATE employees
    SET salary = salary + bonus
    WHERE id = employee_id;
END;
$$ LANGUAGE plpgsql;

--7
CREATE OR REPLACE FUNCTION complex_calculation(num INTEGER, text_input VARCHAR)
    RETURNS TEXT AS $$
DECLARE
    num_result INTEGER;
    text_result VARCHAR;
BEGIN

    BEGIN
        num_result := num * 2;
    END;


    BEGIN
        text_result := text_input || ' is processed';
    END;


    RETURN text_result || ' and the number is ' || num_result;
END;
$$ LANGUAGE plpgsql;