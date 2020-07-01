-- Ejercicios Funciones de Usuario

/* 1. Crear una función que permita calcular el valor de venta de un producto
sabiendo que tiene un costo y porcentaje de ganancia. Por ejemplo, si el costo
es $1500 y el porcentaje de ganancia es 10%, el valor de venta sería $1650. */
delimiter //
create function f_valorventa (acosto decimal(7,2), aganancia int)
returns decimal (7,2)
begin
	declare valorventa decimal (7,2);
    set valorventa = acosto + (acosto * aganancia / 100);
	return valorventa;
end;
// delimiter ;

-- Ejemplo: Costo de $1500 y ganancia de 10%: Valor de $1650.
select f_valorventa(1500,10) from dual;

/* 2. Crear una función que calcule el volumen de una esfera cuyo radio de tipo
float se pasará como parámetro. Realizar una consulta después para calcular el
volumen de una esfera. */
delimiter //
create function f_volumen (aradio float)
returns float
begin
	declare volumen float;
    set volumen = 4/3 * PI() * power(aradio, 3);
    return volumen;
end;
// delimiter ;

-- Ejemplo: Esfera de radio 1: Volumen de 4,18879
select f_volumen(1) from dual;

/* 3. Realizar una función que calcule el factorial de un número. Por ejemplo,
el factorial de 4 se calcula de la siguiente forma: 4! = 4 * 3 * 2 * 1 = 24. */
delimiter //
create function f_factorial (anumero int)
returns int
begin
	declare factorial int;
    declare numero int;
    set numero = anumero;
    set factorial = 1;
    while numero >= 1 do
		set factorial = factorial * numero;
        set numero = numero - 1;
	end while;
    return factorial;
end;
// delimiter ;

-- Ejemplo: El factorial de 4 da 4 * 3 * 2 * 1 = 24.
select f_factorial(4) from dual;
