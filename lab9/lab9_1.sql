CREATE FUNCTION list_products(category_name VARCHAR)
    RETURNS TABLE(category_name VARCHAR, id INTEGER) AS $$
    BEGIN
    RETURN QUERY
    SELECT name, id FROM category WHERE category_name = name
    END; $$