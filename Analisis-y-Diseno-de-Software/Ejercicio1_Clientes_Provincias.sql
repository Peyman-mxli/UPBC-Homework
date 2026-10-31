
CREATE DATABASE EJERCICIO1_CLIENTES;
USE EJERCICIO1_CLIENTES;

IF OBJECT_ID('clientes', 'U') IS NOT NULL
    DROP TABLE clientes;

IF OBJECT_ID('provincias', 'U') IS NOT NULL
    DROP TABLE provincias;

CREATE TABLE provincias (
    codigo TINYINT IDENTITY,
    nombre VARCHAR(20),
    PRIMARY KEY (codigo)
);

CREATE TABLE clientes (
    codigo INT IDENTITY,
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    codigoprovincia TINYINT NOT NULL,
    PRIMARY KEY (codigo)
);
GO

INSERT INTO provincias (nombre)
VALUES ('Cordoba');

INSERT INTO provincias (nombre)
VALUES ('Santa Fe');

INSERT INTO provincias (nombre)
VALUES ('Corrientes');

INSERT INTO clientes
VALUES ('Lopez Marcos','Colon 111','Córdoba',1);

INSERT INTO clientes
VALUES ('Perez Ana','San Martin 222','Cruz del Eje',1);

INSERT INTO clientes
VALUES ('Garcia Juan','Rivadavia 333','Villa Maria',1);

INSERT INTO clientes
VALUES ('Perez Luis','Sarmiento 444','Rosario',2);

INSERT INTO clientes
VALUES ('Pereyra Lucas','San Martin 555','Cruz del Eje',1);

INSERT INTO clientes
VALUES ('Gomez Ines','San Martin 666','Santa Fe',2);

INSERT INTO clientes
VALUES ('Torres Fabiola','Alem 777','Ibera',3);


SELECT
    c.nombre AS Cliente,
    c.domicilio AS Domicilio,
    c.ciudad AS Ciudad,
    p.nombre AS Provincia
FROM clientes AS c
INNER JOIN provincias AS p
    ON c.codigoprovincia = p.codigo;


SELECT
    c.nombre AS Cliente,
    c.domicilio AS Domicilio,
    c.ciudad AS Ciudad,
    p.nombre AS Provincia
FROM clientes AS c
INNER JOIN provincias AS p
    ON c.codigoprovincia = p.codigo
ORDER BY p.nombre;


SELECT
    c.nombre AS Cliente,
    c.domicilio AS Domicilio,
    c.ciudad AS Ciudad,
    p.nombre AS Provincia
FROM clientes AS c
INNER JOIN provincias AS p
    ON c.codigoprovincia = p.codigo
WHERE p.nombre = 'Santa Fe';
