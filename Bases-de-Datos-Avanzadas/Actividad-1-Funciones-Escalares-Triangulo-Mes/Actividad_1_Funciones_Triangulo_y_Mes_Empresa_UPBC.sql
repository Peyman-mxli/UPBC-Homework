-- UNIVERSIDAD POLITECNICA DE BAJA CALIFORNIA
-- BASES DE DATOS AVANZADAS - ACTIVIDAD 1
-- Funciones escalares: area de triangulo y nombre del mes
-- Base de datos: empresa (se conserva cualquier dato existente)
-- Ejecutar todo en Nueva consulta de SQL Server / SSMS.

-- 1. Crear la base de datos solo si no existe.
IF DB_ID('empresa') IS NULL
    CREATE DATABASE empresa;
GO
USE empresa;
GO

-- 2. ACTIVIDAD: area del triangulo = (base * altura) / 2.
-- CREATE OR ALTER permite volver a ejecutar sin error de "ya existe".
-- CREATE FUNCTION debe iniciar un lote nuevo (GO arriba).
CREATE OR ALTER FUNCTION dbo.f_areaTriangulo
(
    @base DECIMAL(10,2),
    @altura DECIMAL(10,2)
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @area DECIMAL(18,2);

    -- Los valores negativos o nulos no forman un area valida.
    IF @base IS NULL OR @altura IS NULL OR @base < 0 OR @altura < 0
        RETURN NULL;

    SET @area = (@base * @altura) / 2.0;
    RETURN @area;
END;
GO

-- 3. Consultar la funcion del triangulo.
SELECT dbo.f_areaTriangulo(10, 6) AS AreaTriangulo;   -- 30.00
SELECT dbo.f_areaTriangulo(7.5, 4) AS AreaTriangulo;  -- 15.00
SELECT dbo.f_areaTriangulo(12, 8) AS AreaTriangulo;   -- 48.00
GO

-- 4. EJEMPLO 2: nombre del mes en espanol.
-- El ejemplo de clase usa DATENAME(MONTH,...), pero ese texto depende
-- del idioma configurado en SQL Server. MONTH(...) funciona en
-- servidores configurados en ingles o espanol.
-- Un valor por defecto debe indicarse con = NULL; dentro de la
-- funcion se toma la fecha actual cuando se invoca con DEFAULT.
CREATE OR ALTER FUNCTION dbo.f_nombreMes
(
    @fecha DATETIME = NULL
)
RETURNS VARCHAR(10)
AS
BEGIN
    DECLARE @nombre VARCHAR(10);

    IF @fecha IS NULL
        SET @fecha = GETDATE();

    SET @nombre = CASE MONTH(@fecha)
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
    END;

    RETURN @nombre;
END;
GO

-- 5. Consultar el nombre del mes.
SELECT dbo.f_nombreMes('20260115') AS MesEnEspanol; -- Enero
SELECT dbo.f_nombreMes('20260315') AS MesEnEspanol; -- Marzo
SELECT dbo.f_nombreMes('20261113') AS MesEnEspanol; -- Noviembre

-- 6. Para usar el valor predeterminado, enviar DEFAULT.
SELECT dbo.f_nombreMes(DEFAULT) AS MesActual;

-- La siguiente llamada es INCORRECTA y se deja comentada:
-- SELECT dbo.f_nombreMes();
-- SQL Server requiere indicar DEFAULT aunque el parametro tenga valor por defecto.
GO