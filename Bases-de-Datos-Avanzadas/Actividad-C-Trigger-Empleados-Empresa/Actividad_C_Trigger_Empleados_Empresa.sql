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