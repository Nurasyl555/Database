CREATE DATABASE lab4;

CREATE TABLE Warehouses (
    code INTEGER PRIMARY KEY,
    location VARCHAR(255),
    capacity INTEGER
);

INSERT INTO Warehouses (code, location, capacity) VALUES
    (1, 'chicago', 3),
    (2, 'chicago', 4),
    (3, 'New York', 7),
    (4, 'los angeles', 2),
    (5, 'San Francisco', 8);

CREATE TABLE Boxes(
    code CHAR(4) PRIMARY KEY,
    contents VARCHAR(255),
    value REAL,
    warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);

INSERT INTO Boxes (code, contents, value, warehouse) VALUES
('OMN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 1),
('POH6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 3),
('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE value > 150;

SELECT DISTINCT contents FROM Boxes;

SELECT Warehouse, COUNT(*) AS number_of_box FROM Boxes group by Warehouse;

SELECT Warehouse, COUNT(*) AS number_of_box FROM Boxes group by Warehouse HAVING COUNT(*)>2;

INSERT INTO Warehouses(code, location, capacity) VALUES
    (6, 'New York', 3);
INSERT INTO Boxes(code, contents, value, warehouse) VALUES
    ('H5RT', 'Papers', 200, 2);

UPDATE Boxes SET value = value * 0.85 WHERE value =(SELECT value FROM Boxes ORDER BY value DESC LIMIT 1 OFFSET 2);

DELETE FROM Boxes WHERE value < 150;
DELETE FROM Boxes WHERE warehouse IN (SELECT code FROM Warehouses WHERE location = 'New York') RETURNING *;