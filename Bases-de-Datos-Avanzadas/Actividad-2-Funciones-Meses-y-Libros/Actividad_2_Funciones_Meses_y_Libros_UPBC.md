# ACTIVIDAD 2 - FUNCIONES ESCALARES Y FUNCIONES DE TABLA EN LINEA

**Universidad:** Universidad Politecnica de Baja California (UPBC)  
**Asignatura:** Bases de Datos Avanzadas  
**Docente:** M.C. Alicia del Refugio Lopez Aguirre  
**Alumno:** Peyman Miyandashti  
**Carrera:** Ingenieria en Tecnologias de la Informacion e Innovacion Digital  
**Grupo:** ITIID 5AFM 2026-3  
**Fecha:** 13 de noviembre de 2026  
**Bases de datos:** Mis_Empleados y LIBRERIA

## 1. Objetivo de la actividad

Elaborar una funcion escalar que reciba un numero del 1 al 12 y retorne el nombre del mes en espanol. Utilizarla con la fecha de ingreso de un empleado. Completar el Ejemplo 3 de funciones con valores de tabla en linea, parametros predeterminados y ALTER FUNCTION.

## 2. Funcion de nombre del mes

La funcion dbo.f_nombreMes recibe el parametro entero @numero y utiliza CASE para transformar un numero del 1 al 12 en el nombre de su mes. Un numero fuera del rango devuelve NULL.

| Numero | Nombre esperado |
|---:|---|
| 1 | Enero |
| 2 | Febrero |
| 6 | Junio |
| 11 | Noviembre |
| 12 | Diciembre |
| 13 | NULL (invalido) |

~~~sql
SELECT dbo.f_nombreMes(2) AS MesSolicitado;
~~~

Resultado esperado: **Febrero**.

## 3. Mis_Empleados y la fecha de ingreso

Se crea Mis_Empleados con la tabla empleados (Num_empleado, Nombre, fechaingreso y salario).

El enunciado tiene tres detalles que requieren correccion: empledos se cambia a empleados; prumary key a PRIMARY KEY; el INSERT original solo contiene tres valores para cuatro columnas, por lo que se agrega un salario de ejemplo (15000).

| Num_empleado | Nombre | fechaingreso | salario |
|---:|---|---|---:|
| 1 | Maluma Baby | 15/06/2016 | 15000 |

La funcion recibe un numero, mientras que fechaingreso es de tipo DATETIME. Por eso se utiliza MONTH(fechaingreso) en la consulta para conservar el objetivo de la actividad:

~~~sql
SELECT Nombre,
       dbo.f_nombreMes(MONTH(fechaingreso)) AS [mes de ingreso]
FROM dbo.empleados;
~~~

Resultado esperado: **Maluma Baby | Junio**.

## 4. Ejemplo 3: LIBRERIA

Se crea la base LIBRERIA y la tabla libros. Se incluyen los cinco registros indicados en el material:

| Codigo | Titulo | Autor | Editorial |
|---:|---|---|---|
| 1 | Uno | Richard Bach | Planeta |
| 2 | El aleph | Borges | Emece |
| 3 | Ilusiones | Richard Bach | Planeta |
| 4 | Aprenda PHP | Mario Molina | Nuevo siglo |
| 5 | Matematica estas ahi | Paenza | Nuevo siglo |

### 4.1 Funcion f_libros

Es una funcion en linea con un parametro @autor. Inicialmente devuelve las columnas titulo y editorial. La consulta de ejemplo es:

~~~sql
SELECT * FROM dbo.f_libros('Bach');
~~~

Resultado esperado: dos registros, Uno y Ilusiones, ambos de editorial Planeta.

### 4.2 Funcion f_libros_autoreditorial

Recibe los parametros @autor y @editorial y devuelve titulo, autor y editorial. Sus valores predeterminados son Borges y Emece.

~~~sql
SELECT * FROM dbo.f_libros_autoreditorial('MOLINA','Nuevo siglo');
SELECT * FROM dbo.f_libros_autoreditorial(DEFAULT,DEFAULT);
~~~

Resultados esperados: Aprenda PHP, Mario Molina, Nuevo siglo; y El aleph, Borges, Emece.

Para garantizar la coincidencia MOLINA/Molina se utiliza una intercalacion insensible a mayusculas. DEFAULT se escribe explicitamente para aplicar los valores por defecto.

## 5. Modificar f_libros con ALTER FUNCTION

Primero se crea f_libros devolviendo titulo y editorial. Despues se modifica mediante ALTER FUNCTION agregando codigo al SELECT, sin intentar crear la misma funcion por segunda vez.

~~~sql
ALTER FUNCTION dbo.f_libros (@autor VARCHAR(30) = 'Borges')
RETURNS TABLE
AS
RETURN (
    SELECT codigo, titulo, editorial
    FROM dbo.libros
    WHERE autor COLLATE Latin1_General_CI_AI LIKE '%' + @autor + '%'
);
GO

SELECT * FROM dbo.f_libros('Bach');
~~~

| Codigo | Titulo | Editorial |
|---:|---|---|
| 1 | Uno | Planeta |
| 3 | Ilusiones | Planeta |

## 6. Instrucciones y resultados esperados

1. Abrir Microsoft SQL Server Management Studio y seleccionar Nueva consulta.
2. Pegar y ejecutar el archivo SQL completo con F5.
3. Comprobar primero Mis_Empleados y despues LIBRERIA.
4. Verificar que ALTER FUNCTION modifica las columnas devueltas por f_libros.

GO separa los lotes para que CREATE OR ALTER FUNCTION y ALTER FUNCTION funcionen. Los comandos IF DB_ID y IF NOT EXISTS permiten ejecutar de nuevo la actividad sin borrar ni duplicar los datos de muestra.

Estos son resultados esperados deducidos del SQL, no capturas ni evidencia de una ejecucion real en el servidor del alumno.

## 7. Conclusion personal

Con esta actividad aprendi la diferencia entre las funciones escalares, que devuelven un solo valor, y las funciones con valores de tabla en linea, que devuelven registros filtrados. Tambien aprendi a utilizar CASE, MONTH, LIKE, DEFAULT y ALTER FUNCTION.

## Anexo A. Codigo T-SQL completo para Nueva consulta

~~~sql
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
~~~
