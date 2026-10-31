-- ADVANCED DATABASES — Unit 1 / SQL Server
-- Run in a TEST SQL Server instance. Drops and recreates practice database.
USE master;
GO
IF DB_ID('UPBC_AdvancedDatabases_Practice') IS NULL
    CREATE DATABASE UPBC_AdvancedDatabases_Practice;
GO
USE UPBC_AdvancedDatabases_Practice;
GO
IF OBJECT_ID('dbo.books', 'U') IS NOT NULL DROP TABLE dbo.books;
IF OBJECT_ID('dbo.publishers', 'U') IS NOT NULL DROP TABLE dbo.publishers;
GO
CREATE TABLE dbo.publishers (
    id TINYINT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);
CREATE TABLE dbo.books (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(60) NOT NULL DEFAULT 'Unknown',
    publisher_id TINYINT NULL,
    price DECIMAL(7,2) NOT NULL,
    CONSTRAINT FK_books_publishers FOREIGN KEY(publisher_id)
        REFERENCES dbo.publishers(id)
);
INSERT dbo.publishers(name) VALUES ('Planeta'),('Emece'),('Siglo XXI'),('No Books Publisher');
INSERT dbo.books(title,author,publisher_id,price) VALUES
('El Aleph','Borges',2,20.00),
('Martin Fierro','Jose Hernandez',1,30.00),
('Learn PHP','Mario Molina',3,50.00),
('Java in 10 Minutes','Unknown',3,45.00),
('One','Richard Bach',1,15.00),
('Illusions','Richard Bach',1,18.00),
('Bridge to Infinity','Richard Bach',2,20.00),
('Anthology','Borges',1,25.00);
-- 1. INNER JOIN
SELECT b.title,b.author,p.name AS publisher
FROM dbo.books AS b
INNER JOIN dbo.publishers AS p ON b.publisher_id = p.id;
-- 2. Filter + order
SELECT b.title,b.author,p.name AS publisher
FROM dbo.books AS b
JOIN dbo.publishers AS p ON b.publisher_id = p.id
WHERE p.name = 'Siglo XXI'
ORDER BY b.title;
-- 3. LEFT JOIN keeps all publishers
SELECT p.name,b.title
FROM dbo.publishers AS p
LEFT JOIN dbo.books AS b ON p.id = b.publisher_id;
-- 4. RIGHT JOIN (equivalent orientation)
SELECT p.name,b.title
FROM dbo.books AS b
RIGHT JOIN dbo.publishers AS p ON b.publisher_id = p.id;
-- 5. Unmatched publishers
SELECT p.name
FROM dbo.publishers AS p
LEFT JOIN dbo.books AS b ON p.id = b.publisher_id
WHERE b.id IS NULL;
-- 6. Maximum price subquery
SELECT title,price FROM dbo.books
WHERE price = (SELECT MAX(price) FROM dbo.books);
-- 7. Publishers of Richard Bach books
SELECT name FROM dbo.publishers WHERE id IN
  (SELECT publisher_id FROM dbo.books WHERE author = 'Richard Bach');
-- 8. ANY vs ALL
SELECT title,price FROM dbo.books
WHERE price > ANY
  (SELECT price FROM dbo.books WHERE author = 'Richard Bach');
SELECT title,price FROM dbo.books
WHERE price > ALL
  (SELECT price FROM dbo.books WHERE author = 'Richard Bach');
-- 9. Book stats
SELECT COUNT(*) AS book_count, MIN(price) AS min_price,
       MAX(price) AS max_price, AVG(price) AS average_price
FROM dbo.books;
GO
