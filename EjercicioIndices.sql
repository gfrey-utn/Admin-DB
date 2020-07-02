-- Ejercicio Índices

use adminDB;
-- 1. Elimine la tabla si existe y créela con la siguiente estructura:
drop table if exists alumnos;

create table alumnos(
	legajo char(5) not null,
    documento char(8) not null,
    apellido varchar(30),
    nombre varchar(30),
    notafinal decimal(4,2),
    primary key (legajo)
);

-- 2. Ingresamos algunos registros.
insert into alumnos values ('A123','22222222','Pérez','Patricia',5.50);
insert into alumnos values ('A234','23333333','López','Ana',9);
insert into alumnos values ('A345','24444444','García','Carlos',8.5);
insert into alumnos values ('A348','25555555','Pérez','Daniela',7.85);
insert into alumnos values ('A457','26666666','Pérez','Fabián',3.2);
insert into alumnos values ('A589','27777777','Gómez','Gastón',6.90);

select * from alumnos;

/* 3. Intente crear un índice único para el campo "apellido".
NOTA: No lo va a permitir porque hay valores duplicados de apellido
(más de un "Pérez"). */
create unique index i_apellidounico on alumnos (apellido);

-- 4. Cree un índice no único, para el campo "apellido".
create index i_apellido on alumnos (apellido);

/* 5. Establezca una restricción "primary key" al campo "legajo" especificando
que cree un índice de tipo primary. */
-- Rta: Agregada la primary key en la creación de la tabla.

/* 6. Establezca la restricción "primary key" al campo "legajo" especificando
que cree un índice. */
-- Rta: Agregada la primary key en la creación de la tabla.

-- 7. Vea los índices de "alumnos":
show index from alumnos;

-- 8. Cree un índice unique para el campo "documento".
create unique index i_documento on alumnos (documento);

-- 9. Intente ingresar un alumno con documento duplicado. (No es posible)
insert into alumnos values ('A728','27777777','Páez','Brian',6);

-- 10. Cree un índice compuesto, no único, para el campo "apellido" y "nombre".
create index i_apellidonombre on alumnos (apellido,nombre);

/* 11. Borre el índice único sobre el campo documento e intente insertar el
registro del punto 9. ¿Puede insertar ahora ese registro? */
drop index i_documento on alumnos;
insert into alumnos values ('A728','27777777','Páez','Brian',6);

-- Rta: Sí, es posible insertarlo ya que no hay más restricciones de unicidad.
