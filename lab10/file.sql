CREATE DATABASE lab10;
CREATE TABLE Books(
                      book_id SERIAL PRIMARY KEY,
                      title VARCHAR(255),
                      author VARCHAR(255),
                      price DECIMAL(7, 2),
                      quantity INTEGER
);
CREATE TABLE Customers(
                          customer_id SERIAL PRIMARY KEY ,
                          name VARCHAR(50),
                          email VARCHAR(60)
);

CREATE TABLE Orders(
                       order_id SERIAL PRIMARY KEY ,
                       book_id INTEGER NOT NULL ,
                       customer_id INTEGER,
                       order_date DATE,
                       quantity INTEGER,
                       FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
                       FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);
INSERT INTO Books (book_id, title, author, price, quantity)
VALUES
    (1, 'Database 101', 'A. Smith', 40.00, 10),
    (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
    (3, 'Advanced DB', 'C. Lee', 50.00, 5);
INSERT INTO Customers (customer_id, name, email)
VALUES
    (101, 'John Doe', 'johndoe@example.com'),
    (102, 'Jane Doe', 'janedoe@example.com');
BEGIN ;
INSERT INTO Orders(book_id, customer_id, order_date, quantity)
VALUES(1, 101, CURRENT_DATE, 2);
UPDATE Books
SET quantity = quantity - 2 WHERE  book_id = 1;
COMMIT ;

BEGIN;
INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (3, 102, CURRENT_DATE, 10);
DO $$
    BEGIN
        IF (SELECT quantity FROM Books WHERE book_id = 3) < 10 THEN
            RAISE NOTICE 'Недостаточно количества книг. Транзакция откатывается.';
            ROLLBACK;  -- Откат транзакции при недостаточности количества
            RETURN;    -- Выход из блока
        END IF;
    END $$;
COMMIT;


--3
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED ;
UPDATE Books SET price = 45.00 where book_id = 1;
COMMIT ;

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT price
FROM Books
WHERE book_id = 1;
COMMIT;
--4
BEGIN;
UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 101;
COMMIT;
