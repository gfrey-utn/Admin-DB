-- Ejercicio Funciones Fecha y Hora:
-- Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
create database adminDB;
use adminDB;

-- 1. Elimine la tabla "empleados" si existe.
drop table if exists empleados;

-- 2. Cree la tabla "empleados".
create table empleados(
	documento char(8) not null,
    nombre varchar(30) not null,
    sexo char(1),
    domicilio varchar(30),
    fechaIngreso date,
    fechaNacimiento date,
    sueldoBasico decimal(5,2) unsigned,
    primary key(documento) 
);

-- 3. Ingrese algunos registros.
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('22333111','Juan Pérez','m','Colón 123','1990-02-01','1970-05-10',550);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('25444444','Susana Morales','f','Avellaneda 345','1995-04-01','1975-11-06',650);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('20111222','Héctor Pereyra','m','Caseros 987','1995-04-01','1965-03-25',510);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('30000222','Luis Luque','m','Urquiza 456','1980-09-01','1980-03-29',700);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('20555444','María Laura Torres','f','San Martín 1122','2000-05-15','1965-12-22',700);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('30000234','Alberto Soto','m','Perú 232','2003-08-15','1989-10-10',420);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('20125478','Ana Gómez','f','Sarmiento 975','2004-06-14','1976-09-21',350);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('24154269','Ofelia García','f','Triunvirato 628','2004-09-23','1974-05-12',390);
insert into empleados
(documento,nombre,sexo,domicilio,fechaIngreso,fechaNacimiento,sueldoBasico)
values ('30615426','Federico González','m','Perú 390','1996-08-15','1985-05-01',580);

/* 4. Es política de la empresa festejar cada fin de mes, los cumpleaños de todos los
empleados que cumplen ese mes. Necesitamos los nombres y fecha de nacimiento de los
empleados que cumplen años en el mes de mayo. */
select nombre, fechaNacimiento from empleados where month(fechaNacimiento) = 5;

/* 5. También es política de la empresa aumentar el 1% del sueldo básico a los
empleados cada vez que cumplen un año más de servicio. Necesitamos los nombres,
fecha de ingreso a la empresa y sueldo básico de todos los empleados que cumplen
un año más de servicio en el mes de agosto, y una columna calculando el
incremento de sueldo. */
select nombre, fechaIngreso, sueldoBasico, sueldoBasico*0.01 as incremento
from empleados where month(fechaIngreso) = 8;

/* 6. Actualizamos el sueldo aumentando el 1% a los empleados que cumplen un
año de servicio en el mes de agosto. */
set sql_safe_updates = 0;
update empleados set
sueldoBasico = sueldoBasico * 1.01
where month(fechaIngreso) = 8;

-- 7. Verifique si la actualización se realizó.
select nombre, sueldoBasico from empleados where month(fechaIngreso) = 8;

/* 8. Si el empleado cumple 10, 20, 30, 40, ... años de servicio, se le regala
una placa recordatoria. La Secretaría de Gerencia necesita saber la cantidad de
años de servicio que cumplen los empleados que ingresaron en el mes de agosto
para encargar dichas placas.
En la sentencia anterior, extraemos el año de las fechas actual y de ingreso
con la función "year()" y las restamos, para calcular los años de servicio. */
select nombre, (year(fechaIngreso)-year(fechaNacimiento)) as aniosServicio from empleados
where month(fechaIngreso) = 8;