create database empresa;
use empresa;
create table empleados(
idEmpleado int,
nombre varchar(50),
apellido varchar (50),
departamento varchar(100),
edad int, 
primary key (idEmpleado)
);


insert into empleados (idEmpleado, nombre, apellido, departamento, edad)
values (101, 'Valentina', 'Rodriguez', 'Ventas', 35),
       (102, 'Carlos', 'Martinez', 'Ventas', 24),
       (103, 'Juan', 'Gamboa', 'Administracion', 30),
       (104, 'Daniela', 'Torres', 'Marketing', 21);
       
DELIMITER $$
create function getPromedio() returns int
begin
	declare suma int;
    declare total int;
    declare _edad int;
    declare i int;
    
    declare c1 cursor for select edad from empresa;		
			
    set suma=0;
    set i = 1;
    set total = 0;
    
    select count(*) into total from empresa;
    
    open c1;
    while i<=total do
    fetch c1 into _edad;
    set i = i+1;
    
    end while;
    close c1;
    
    return suma / total;
			
	END 
	delimiter ;

    