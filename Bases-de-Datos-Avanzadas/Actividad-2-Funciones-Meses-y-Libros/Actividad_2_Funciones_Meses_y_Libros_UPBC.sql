-- UPBC - BASES DE DATOS AVANZADAS - ACTIVIDAD 2
-- Funciones de mes y funciones con valores de tabla en linea.
-- Ejecutar todo en Nueva consulta de Microsoft SQL Server (SSMS).
-- Repetible: conserva tablas y registros existentes, y actualiza funciones.

-- PARTE 1. Crear y usar Mis_Empleados.
IF DB_ID(N'Mis_Empleados') IS NULL
    CREATE DATABASE Mis_Empleados;
GO
USE Mis_Empleados;
GO

-- Corregidos los errores de escritura: empleados y PRIMARY KEY.
IF OBJECT_ID(N'dbo.empleados', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.empleados (
        Num_empleado INT PRIMARY KEY,
        Nombre VARCHAR(30),
        fechaingreso DATETIME,
        salario INT
    );
END;
GO

-- El registro original tenia 3 valores para 4 columnas.
-- Aqui se indica tambien el salario; es un valor de ejemplo.
IF NOT EXISTS (SELECT 1 FROM dbo.empleados WHERE Num_empleado = 1)
    INSERT INTO dbo.empleados (Num_empleado, Nombre, fechaingreso, salario)
    VALUES (1, 'Maluma Baby', '20160615', 15000);
GO

-- El ejercicio solicita un NUMERO (1 a 12), no una fecha.
-- Devuelve NULL cuando el numero no representa un mes.
CREATE OR ALTER FUNCTION dbo.f_nombreMes (@numero INT)
RETURNS VARCHAR(12)
AS
BEGIN
    DECLARE @nombre VARCHAR(12);
    SET @nombre = CASE @numero
        WHEN 1 THEN 'Enero'
        WHEN 2 THEN 'Febrero'
        WHEN 3 THEN 'Marzo'
        WHEN 4 THEN 'Abril'
        WHEN 5 THEN 'Mayo'
        WHEN 6 THEN 'Junio'
        WHEN 7 THEN 'Julio'
        WHEN 8 THEN 'Agosto'
        WHEN 9 THEN 'Septiembre'
        WHEN 10 THEN 'Octubre'
        WHEN 11 THEN 'Noviembre'
        WHEN 12 THEN 'Diciembre'
        ELSE NULL
    END;
    RETURN @nombre;
END;
GO

-- Prueba principal: 2 corresponde a Febrero.
SELECT dbo.f_nombreMes(2) AS MesSolicitado;
SELECT dbo.f_nombreMes(6) AS MesSolicitado;

-- MONTH convierte la fecha de ingreso al numero 1-12 requerido.
-- En la hoja original se pasa una fecha directamente; se corrige asi.
SELECT Nombre,
       dbo.f_nombreMes(MONTH(fechaingreso)) AS [mes de ingreso]
FROM dbo.empleados;
GO

-- PARTE 2. Ejemplo 3: base de datos LIBRERIA.
IF DB_ID(N'LIBRERIA') IS NULL
    CREATE DATABASE LIBRERIA;
GO
USE LIBRERIA;
GO

IF OBJECT_ID(N'dbo.libros', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.libros (
        codigo INT PRIMARY KEY,
        titulo VARCHAR(40),
        autor VARCHAR(30),
        editorial VARCHAR(20)
    );
END;
GO

-- Insertar los cinco registros sin duplicarlos al ejecutar otra vez.
IF NOT EXISTS (SELECT 1 FROM dbo.libros WHERE codigo = 1)
    INSERT INTO dbo.libros VALUES (1,'Uno','Richard Bach','Planeta');
IF NOT EXISTS (SELECT 1 FROM dbo.libros WHERE codigo = 2)
    INSERT INTO dbo.libros VALUES (2,'El aleph','Borges','Emece');
IF NOT EXISTS (SELECT 1 FROM dbo.libros WHERE codigo = 3)
    INSERT INTO dbo.libros VALUES (3,'Ilusiones','Richard Bach','Planeta');
IF NOT EXISTS (SELECT 1 FROM dbo.libros WHERE codigo = 4)
    INSERT INTO dbo.libros VALUES (4,'Aprenda PHP','Mario Molina','Nuevo siglo');
IF NOT EXISTS (SELECT 1 FROM dbo.libros WHERE codigo = 5)
    INSERT INTO dbo.libros VALUES (5,'Matematica estas ahi','Paenza','Nuevo siglo');
GO

-- Funcion en linea que filtra por autor (valor predeterminado: Borges).
CREATE OR ALTER FUNCTION dbo.f_libros (@autor VARCHAR(30) = 'Borges')
RETURNS TABLE
AS
RETURN (
    SELECT titulo, editorial
    FROM dbo.libros
    WHERE autor COLLATE Latin1_General_CI_AI LIKE '%' + @autor + '%'
);
GO

SELECT * FROM dbo.f_libros('Bach');
GO

-- Funcion en linea con dos parametros predeterminados.
CREATE OR ALTER FUNCTION dbo.f_libros_autoreditorial
(
    @autor VARCHAR(30) = 'Borges',
    @editorial VARCHAR(20) = 'Emece'
)
RETURNS TABLE
AS
RETURN (
    SELECT titulo, autor, editorial
    FROM dbo.libros
    WHERE autor COLLATE Latin1_General_CI_AI LIKE '%' + @autor + '%'
      AND editorial COLLATE Latin1_General_CI_AI LIKE '%' + @editorial + '%'
);
GO

SELECT * FROM dbo.f_libros_autoreditorial('MOLINA','Nuevo siglo');
SELECT * FROM dbo.f_libros_autoreditorial(DEFAULT, DEFAULT);
GO

-- PARTE 3. Modificar una funcion existente con ALTER FUNCTION.
-- Se agrega el campo codigo al resultado original de f_libros.
ALTER FUNCTION dbo.f_libros (@autor VARCHAR(30) = 'Borges')
RETURNS TABLE
AS
RETURN (
    SELECT codigo, titulo, editorial
    FROM dbo.libros
    WHERE autor COLLATE Latin1_General_CI_AI LIKE '%' + @autor + '%'
);
GO

-- Ahora la consulta devuelve codigo, titulo y editorial.
SELECT * FROM dbo.f_libros('Bach');
GO