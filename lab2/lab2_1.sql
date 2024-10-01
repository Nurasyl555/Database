CREATE DATABASE lab2;
CREATE TABLE countries(
    county_id SERIAL PRIMARY KEY ,
    country_name VARCHAR(100),
    region_id INTEGER,
    population INTEGER
);

INSERT INTO countries (country_name, region_id, population)
VALUES ('USA', 51, 140000000);

INSERT INTO countries(county_id, country_name)
VALUES (3, 'Germany');

INSERT INTO countries(region_id)
values (null);

INSERT INTO countries(country_name, region_id, population)
VALUES ('Russia', 27, 56000000),
        ('Kazakhstan', 17, 18000000),
        ('China', 78, 1400000000);
AlTER TABLE countries ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';
ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'Kazakhs';
INSERT INTO countries (region_id, population)
VALUES (3, 2000000);

INSERT INTO countries DEFAULT VALUES ;

CREATE TABLE countries_new AS SELECT * FROM countries;
UPDATE countries SET region_id = 1 where  region_id IS NULL;

SELECT country_name, population * 1.10 AS "NEW population"  FROM countries;

UPDATE countries SET population = 90000 WHERE population IS NULL;

DELETE FROM countries where population <= 100000;

DELETE FROM countries_new WHERE county_id IN(SELECT county_id FROM countries)
RETURNING *;
DELETE FROM countries
RETURNING *;