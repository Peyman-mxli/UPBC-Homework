# ACTIVIDAD 1 — FUNCIONES ESCALARES EN SQL SERVER

**Universidad:** Universidad Politécnica de Baja California (UPBC)  
**Materia:** Bases de Datos Avanzadas  
**Docente:** M.C. Alicia del Refugio López Aguirre  
**Alumno:** Peyman Miyandashti  
**Carrera:** Ingeniería en Tecnologías de la Información e Innovación Digital  
**Grupo:** ITIID 5AFM 2026-3  
**Fecha:** 13 de noviembre de 2026  
**Base de datos:** empresa

## 1. Enunciado y objetivo

Elaborar una función que calcule el área de un triángulo enviando como parámetros la base y la altura. El Ejemplo 2 muestra una función que recibe una fecha y regresa el nombre del mes en español y explica cómo utilizar el argumento DEFAULT.

La actividad utiliza funciones escalares de SQL Server: cada función retorna un valor con RETURN.

## 2. Función para el área de un triángulo

La fórmula es **Área = (base × altura) / 2**. La función `dbo.f_areaTriangulo(@base, @altura)` recibe dos parámetros DECIMAL(10,2), aplica la fórmula y retorna DECIMAL(18,2). Si los valores son negativos o NULL, retorna NULL.

| Base | Altura | Operación | Área esperada |
|---:|---:|---|---:|
| 10 | 6 | (10 × 6) / 2 | 30.00 |
| 7.5 | 4 | (7.5 × 4) / 2 | 15.00 |
| 12 | 8 | (12 × 8) / 2 | 48.00 |

**Pruebas:**

```sql
SELECT dbo.f_areaTriangulo(10,6) AS AreaTriangulo;
SELECT dbo.f_areaTriangulo(7.5,4) AS AreaTriangulo;
SELECT dbo.f_areaTriangulo(12,8) AS AreaTriangulo;
```

## 3. Ejemplo 2: función para obtener el nombre del mes

La función `dbo.f_nombreMes(@fecha)` recibe una fecha y devuelve su mes en español. El ejemplo original utiliza `DATENAME(MONTH,@fecha)`, que depende del idioma de SQL Server. La solución usa `MONTH(@fecha)` para garantizar resultados correctos tanto en sesiones en español como en inglés.

El parámetro `@fecha DATETIME = NULL` permite solicitar la fecha actual del servidor. Cuando se llama con `DEFAULT`, se utiliza `GETDATE()` dentro de la función.

| Llamada | Resultado esperado |
|---|---|
| `dbo.f_nombreMes('2026-01-15')` | Enero |
| `dbo.f_nombreMes('2026-03-15')` | Marzo |
| `dbo.f_nombreMes('2026-11-13')` | Noviembre |
| `dbo.f_nombreMes(DEFAULT)` | Mes actual del servidor |

## 4. ¿Por qué se utiliza DEFAULT?

En una función escalar de SQL Server, aunque el parámetro tenga un valor por defecto, la llamada desde SELECT debe incluir el argumento `DEFAULT`. `dbo.f_nombreMes()` produce error por ausencia del argumento. La forma correcta es:

```sql
SELECT dbo.f_nombreMes(DEFAULT) AS MesActual;
```

## 5. Procedimiento para ejecutar

1. Abrir Microsoft SQL Server Management Studio y conectarse al servidor local.
2. Pulsar **Nueva consulta**.
3. Copiar el archivo SQL adjunto, que incluye las dos funciones y ejemplos.
4. Ejecutar el script completo con F5. Los separadores `GO` permiten crear cada función en su propio lote.
5. Revisar los resultados esperados de las áreas y los nombres de los meses.

El script usa la base `empresa` trabajada en la actividad anterior y no elimina ninguna tabla ni sus registros. `CREATE OR ALTER FUNCTION` actualiza las funciones si ya existían, sin producir error de duplicado.

## 6. Conclusión

Aprendí a crear funciones escalares en T-SQL, definir parámetros, realizar cálculos matemáticos y devolver resultados con RETURN. También comprendí por qué SQL Server requiere DEFAULT al llamar a una función desde SELECT y cómo obtener los meses en español sin depender del idioma de la sesión.

**Nota:** los resultados mostrados son resultados esperados deducidos del código. No sustituyen la evidencia de ejecución real en SQL Server del estudiante.

## Anexo A. Código completo para Nueva consulta

```sql
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
SELECT dbo.f_nombreMes('2026-01-15') AS MesEnEspanol; -- Enero
SELECT dbo.f_nombreMes('2026-03-15') AS MesEnEspanol; -- Marzo
SELECT dbo.f_nombreMes('2026-11-13') AS MesEnEspanol; -- Noviembre

-- 6. Para usar el valor predeterminado, enviar DEFAULT.
SELECT dbo.f_nombreMes(DEFAULT) AS MesActual;

-- La siguiente llamada es INCORRECTA y se deja comentada:
-- SELECT dbo.f_nombreMes();
-- SQL Server requiere indicar DEFAULT aunque el parametro tenga valor por defecto.
GO
```
