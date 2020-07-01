-- Ejercicio Funciones MySQL: Manejo de Cadenas, Fechas y Números
-- Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".

-- 1. Cree la base de datos "empresa".
create database empresa;
use empresa;

-- 2. Cree la tabla "empleados".
create table empleados(
	nombre varchar(30) not null,
    apellido varchar(20) not null,
    documento char(8),
    fechanacimiento datetime,
    fechaingreso datetime,
    sueldo decimal(6,2),
    primary key(documento)
);

-- 3. Ingrese algunos registros:
insert into empleados values('Ana','Acosta','22222222','1970/10/10','1995/05/05',228.50);
insert into empleados values('Carlos','Cáseres','25555555','1978/02/06','1998/05/05',309);
insert into empleados values('Francisco','García','26666666','1978/10/15','1998/10/02',250.68);
insert into empleados values('Gabriela','García','30000000','1985/10/25','2000/12/22',300.25);
insert into empleados values('Luis','López','31111111','1987/02/10','2000/08/21',350.98);

/* 4. Muestre nombre y apellido concatenados, con el apellido en letras mayúsculas, el documento
precedido por "DNI N° " y el sueldo precedido por "$". */
select concat(nombre,' ',ucase(apellido)) as Empleado,
	concat('DNI N° ',documento) as Documento,
    concat('$',sueldo) as Sueldo
from empleados;

-- 5. Muestre el documento y el sueldo redondeado hacia arriba y precedido por "$".
select documento, concat('$',ceiling(sueldo)) as Sueldo from empleados;

-- 6. Muestre los nombres y apellidos de los empleados que cumplen años en el mes de octubre.
select nombre, apellido from empleados where month(fechanacimiento) = 10;

-- 7. Muestre los nombres y apellidos de los empleados que ingresaron entre los años 1995 y 2005.
select nombre, apellido from empleados where year(fechaingreso) between 1995 and 2005;
