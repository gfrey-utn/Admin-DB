-- Ejercicio Gestión de Permisos

-- 1. Mostrar en MySQL el listado de usuarios-hosts del servidor MySQL.
select * from mysql.user;

/* 2. Crear un usuario gráficamente utilizando la herramienta MySQL Workbench
con nombre 'userWork' y password '1234'. Haz que sólo se pueda conectar desde
la red '127.0.0.1'. Su perfil de usuario es el siguiente: 
	- No podrá ejecutar más de 10 consultas por hora.
    - Tendrá un rol administrativo de administrador de usuarios (esto le
      permitirá conceder y revocar permisos a otros usuarios).
Una vez creado este usuario, comprobar la lista de usuarios creados y los
permisos que tienen. */

select * from mysql.user;

/* 3. Crea un usuario anónimo (es decir, que no tenga password) de nombre
'anonimo' directamente en la tabla 'user' y que tenga acceso desde cualquier
IP. Luego, comprobar que se ha creado el nuevo usuario. */

insert into mysql.user (Host, User, Select_priv, ssl_cipher, x509_issuer,
x509_subject) values ('%', 'anonimo', 'Y', '', '', '');

select * from mysql.user;
-- Link a la imagen del resultado de la consulta:
-- https://drive.google.com/file/d/1oqbGbtdgCeqlen3yKkhykS_EIQqnC02o/view?usp=sharing

/* 4. Conectado como 'root', crea un usuario de nombre 'accesolocal' que pueda
seleccionar todas las tablas de todas las bases de datos. */
create user 'accesolocal'@'localhost';
grant select on *.* to 'accesolocal'@'localhost';
flush privileges;

/* 5. Conectado como 'root', crea un usuario de nombre 'accesolimitado' y cuyo
password sea provisorio durante un mes con valor '911'. Conceder permisos a
este nuevo usuario para que sólo pueda ejecutar consultas a cualquier tabla de
la base pubs. */
create user 'accesolimitado'@'localhost' identified by '911' password expire
interval 30 day;
grant select on pubs.* to 'accesolimitado'@'localhost';
flush privileges;

/* 6. Conectado como 'root', crea un usuario de nombre 'accesoclientes' y cuyo
password sea '321'. Conceder permisos a este nuevo usuario para que pueda
ejecutar cualquier operación sobre la tabla de clientes de la base negocio. */
create user 'accesoclientes'@'localhost' identified by '321';
grant select, insert, update, delete, create, drop on negocio.clientes to
'accesoclientes'@'localhost';
flush privileges;
