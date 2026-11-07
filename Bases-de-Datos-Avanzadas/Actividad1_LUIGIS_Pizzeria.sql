-- ACTIVIDAD 1 - LUIGIS / SQL SERVER / SSMS
IF DB_ID(N'LUIGIS') IS NULL
BEGIN
    CREATE DATABASE LUIGIS;
END;
GO

USE LUIGIS;
GO

DROP PROCEDURE IF EXISTS dbo.TABLA_PIZERIA;
GO

CREATE PROCEDURE dbo.TABLA_PIZERIA
AS
BEGIN
    SET NOCOUNT ON;

    DROP TABLE IF EXISTS dbo.ORDENES;
    DROP TABLE IF EXISTS dbo.CLIENTE;
    DROP TABLE IF EXISTS dbo.PIZZA;
    DROP TABLE IF EXISTS dbo.[SIZE];

    CREATE TABLE dbo.CLIENTE (
        cve_c INT NOT NULL PRIMARY KEY,
        nombre VARCHAR(60) NOT NULL,
        tel VARCHAR(20) NOT NULL,
        dire VARCHAR(100) NOT NULL
    );

    CREATE TABLE dbo.PIZZA (
        cve_p INT NOT NULL PRIMARY KEY,
        nombre VARCHAR(60) NOT NULL,
        ingrediente VARCHAR(160) NOT NULL
    );

    CREATE TABLE dbo.[SIZE] (
        cve_t INT NOT NULL PRIMARY KEY,
        nombre VARCHAR(30) NOT NULL
    );

    CREATE TABLE dbo.ORDENES (
        cve_o INT NOT NULL PRIMARY KEY,
        cve_c INT NOT NULL,
        cve_p INT NOT NULL,
        cve_t INT NOT NULL,
        fecha DATE NOT NULL,
        precio DECIMAL(10,2) NOT NULL,
        FOREIGN KEY (cve_c) REFERENCES dbo.CLIENTE(cve_c),
        FOREIGN KEY (cve_p) REFERENCES dbo.PIZZA(cve_p),
        FOREIGN KEY (cve_t) REFERENCES dbo.[SIZE](cve_t),
        CHECK (precio >= 0)
    );

    INSERT INTO dbo.CLIENTE VALUES
    (1,'Ana Lopez','6861001001','Av. Reforma 101'),
    (2,'Juan Perez','6861001002','Calle Morelos 202'),
    (3,'Maria Garcia','6861001003','Blvd. Lazaro Cardenas 303'),
    (4,'Luis Torres','6861001004','Calzada Independencia 404'),
    (5,'Sofia Ramirez','6861001005','Av. Madero 505');

    INSERT INTO dbo.PIZZA VALUES
    (1,'Pepperoni','Mozzarella, tomate, pepperoni'),
    (2,'Hawaiana','Mozzarella, jamon, pina'),
    (3,'Mexicana','Mozzarella, chorizo, jalapeno, cebolla'),
    (4,'Vegetariana','Mozzarella, champinones, pimiento, aceitunas'),
    (5,'Cuatro quesos','Mozzarella, manchego, parmesano, gouda');

    INSERT INTO dbo.[SIZE] VALUES
    (1,'Individual'), (2,'Chica'), (3,'Mediana'),
    (4,'Grande'), (5,'Familiar');

    INSERT INTO dbo.ORDENES VALUES
    (101,1,1,3,'2026-11-06',189.00),
    (102,2,2,4,'2026-11-06',249.00),
    (103,3,3,2,'2026-11-06',149.00),
    (104,4,4,5,'2026-11-06',299.00),
    (105,5,5,1,'2026-11-06',109.00);
END;
GO

EXEC dbo.TABLA_PIZERIA;
GO

SELECT * FROM dbo.CLIENTE ORDER BY cve_c;
SELECT * FROM dbo.PIZZA ORDER BY cve_p;
SELECT * FROM dbo.[SIZE] ORDER BY cve_t;
SELECT * FROM dbo.ORDENES ORDER BY cve_o;

SELECT o.cve_o AS Orden, c.nombre AS Cliente,
       p.nombre AS Pizza, t.nombre AS Tamano,
       o.fecha AS Fecha, o.precio AS Precio
FROM dbo.ORDENES AS o
JOIN dbo.CLIENTE AS c ON o.cve_c = c.cve_c
JOIN dbo.PIZZA AS p ON o.cve_p = p.cve_p
JOIN dbo.[SIZE] AS t ON o.cve_t = t.cve_t
ORDER BY o.cve_o;

SELECT 'CLIENTE' AS Tabla, COUNT(*) AS Registros FROM dbo.CLIENTE
UNION ALL SELECT 'PIZZA', COUNT(*) FROM dbo.PIZZA
UNION ALL SELECT 'SIZE', COUNT(*) FROM dbo.[SIZE]
UNION ALL SELECT 'ORDENES', COUNT(*) FROM dbo.ORDENES;
