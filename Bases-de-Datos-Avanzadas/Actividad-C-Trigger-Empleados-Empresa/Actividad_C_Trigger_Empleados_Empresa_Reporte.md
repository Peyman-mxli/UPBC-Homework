# Actividad C — Disparador de sueldos, base de datos EMPRESA

**Universidad:** Universidad Politécnica de Baja California (UPBC)  
**Asignatura:** Bases de Datos Avanzadas  
**Docente:** M.C. Alicia del Refugio López Aguirre  
**Alumno:** Peyman Miyandashti  
**Grupo:** ITIID 5AFM 2026-3  
**Fecha:** 13 de noviembre de 2026

## Objetivo

Crear la base de datos `empresa` y las tablas `secciones` y `empleados`, con la clave foránea correspondiente, y programar un `TRIGGER` de inserción que impida registrar sueldos superiores al máximo autorizado para cada sección.

## Desarrollo por puntos

1. **Eliminar tablas existentes:** se elimina primero `empleados`, luego `secciones`, para respetar la clave foránea.
2. **Crear las tablas:** `secciones(codigo, nombre, sueldomaximo)` y `empleados(documento, nombre, domicilio, codigoseccion, sueldo)`, con `PRIMARY KEY` y `FOREIGN KEY`.
3. **Insertar datos de práctica:** tres secciones (Administracion: 1500; Sistemas: 2000; Secretaria: 1000) y cuatro empleados (Ana, Bernardo, Carlos, Diana).
4. **Crear el disparador:** `DIS_empleados_insertar`, que compara la tabla lógica `inserted` con `secciones`; si encuentra `sueldo > sueldomaximo`, lanza un error con `RAISERROR` y revierte la transacción con `ROLLBACK TRANSACTION`.
5. **Prueba válida:** Elena Espinoza, Sistemas, sueldo 1900; debe insertarse porque no supera el máximo de 2000.
6. **Consulta:** `SELECT * FROM empleados;` debe mostrar cinco empleados.
7. **Prueba inválida por sueldo:** Fernando Flores, Sistemas, sueldo 2500; el disparador debe rechazarlo. **Error intencional.**
8. **Comprobación posterior:** `SELECT * FROM empleados;` debe seguir mostrando cinco empleados, sin Fernando.
9. **Prueba de integridad referencial:** Gabriela Garcia, sección 99 inexistente; SQL Server debe rechazar la inserción por `FK_empelados_seccion`. **Error intencional.**

## Resultado esperado

| Empleado | Sección | Sueldo | Resultado |
| --- | --- | ---: | --- |
| Ana Acosta | Administracion | 1100 | Aceptado |
| Bernardo Bustos | Administracion | 1200 | Aceptado |
| Carlos Caseres | Sistemas | 1800 | Aceptado |
| Diana Duarte | Secretaria | 1000 | Aceptado |
| Elena Espinoza | Sistemas | 1900 | Aceptado |
| Fernando Flores | Sistemas | 2500 | Rechazado por trigger |
| Gabriela Garcia | No existe (99) | 1500 | Rechazado por FOREIGN KEY |

**Nota:** Los resultados son esperados a partir del código de práctica; no se presentan como ejecución real en el servidor del alumno. El script elimina y vuelve a crear ambas tablas, por lo que no debe ejecutarse sobre datos reales sin respaldo. `GO` separa los lotes y evita el error «CREATE TRIGGER debe ser la única instrucción del lote».

## Conclusión

El trigger implementa una regla de negocio para los sueldos. La clave foránea protege la relación entre `empleados` y `secciones`. Ambos controles evitan datos inconsistentes y complementan la integridad de la base de datos.

## Código SQL completo

```sql
-- ACTIVIDAD C - DISPARADOR DE SUELDOS / BASE DE DATOS EMPRESA
-- Microsoft SQL Server - Nueva consulta
-- AVISO: Esta practica elimina y vuelve a crear las tablas empleados y secciones.
-- Los puntos 7 y 9 generan errores de manera intencional.

-- Crear la base de datos
if db_id('empresa') is null
create database empresa;
GO

use empresa;
GO

-- 1. Eliminar las tablas si existen
if object_id('empleados') is not null
drop table empleados;

if object_id('secciones') is not null
drop table secciones;

-- 2. Crear las tablas
create table secciones(
codigo int identity,
nombre varchar(30),
sueldomaximo decimal(8,2),
constraint PK_secciones primary key(codigo)
);

create table empleados(
documento char(8) not null,
nombre varchar(30) not null,
domicilio varchar(30),
codigoseccion int not null,
sueldo decimal(8,2),
constraint PK_empleados primary key(documento),
constraint FK_empelados_seccion
foreign key (codigoseccion) references secciones(codigo)
);

-- 3. Insertar registros
insert into secciones values('Administracion',1500);
insert into secciones values('Sistemas',2000);
insert into secciones values('Secretaria',1000);

insert into empleados values('22222222','Ana Acosta','Avellaneda 88',1,1100);
insert into empleados values('23333333','Bernardo Bustos','Bulnes 345',1,1200);
insert into empleados values('24444444','Carlos Caseres','Colon 674',2,1800);
insert into empleados values('25555555','Diana Duarte','Colon 873',3,1000);

GO

-- 4. Crear el trigger
create trigger DIS_empleados_insertar
on empleados
for insert
as
begin

if exists(
    select 1
    from inserted
    join secciones
    on inserted.codigoseccion = secciones.codigo
    where inserted.sueldo > secciones.sueldomaximo
)
begin
    raiserror('El sueldo del empleado supera el sueldo maximo permitido para la seccion',16,1);
    rollback transaction;
end

end;

GO

-- 5. Insertar empleado con sueldo permitido
insert into empleados
values('26666666','Elena Espinoza','Reforma 123',2,1900);

GO

-- 6. Verificar el registro permitido
select * from empleados;

GO

-- 7. Intentar insertar sueldo mayor al permitido (ERROR ESPERADO)
insert into empleados
values('27777777','Fernando Flores','Juarez 456',2,2500);

GO

-- 8. Verificar que el empleado no se agrego
select * from empleados;

GO

-- 9. Intentar ingresar una seccion inexistente (ERROR FK ESPERADO)
insert into empleados
values('28888888','Gabriela Garcia','Hidalgo 789',99,1500);

GO

-- Verificar los registros finales
select * from empleados;

```