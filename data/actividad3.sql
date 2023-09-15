drop database if exists HOTEL;
create database HOTEL;
use HOTEL;

-- tabla categorias de hoteles
create table CATEGORIAS (
ID int auto_increment primary key,
NOMBRE varchar(20),
DESCRIPCION varchar(200),
PRECIO_BASE decimal(6,2)
);

-- insertamos datos
insert into CATEGORIAS values (null,'5 estrellas','lujo',300.25);
insert into CATEGORIAS values (null,'3 estrellas','lujo',200);

-- probamos datos 
select * from categorias;

-- tabla hoteles
create table HOTELES (
	ID int auto_increment primary key,
    NOMBRE varchar(20) not null,
	DIRECCION varchar(30),
    CP varchar(5),
    POBLACION varchar(50),
    PROVINCIA varchar(20),
    TELEFONO varchar(9),
    ANOCONSTRUCCION year,
    CATEGORIA int,
    foreign key (CATEGORIA) references CATEGORIAS (ID)
    );
    -- insertamos datos
    insert into HOTELES (NOMBRE,DIRECCION,CP,POBLACION,PROVINCIA,TELEFONO)
    values ("Majestic","carrer pau claris 10","08014","barcelona","barcelona","632802737");
    
    insert into HOTELES values (null,"hotel2","calle menos","08034","granada","granada","640606388","2010",1);
    -- probamos datos 
    select* from HOTELES;
    
    -- tabla de habitaciones
create table HABITACIONES (
	CODIGO int primary key,
    TIPO_HABITACION varchar(1) not null,  -- I = INDIVIDUAL, D= DOBLE
    PRECION_NOCHE decimal(6,2),
    HOTEL int not null,
    foreign key (HOTEL) references HOTELES(ID),
    check (TIPO_HABITACION='I' or TIPO_HABITACION='D') 
);

-- insertamos datos 
	insert into HABITACIONES values (1,'I','200',1);
	insert into HABITACIONES values (2,'I','100',2);
	insert into HABITACIONES values (3,'D','400',2);

-- probamos datos 
select * from HABITACIONES;

-- tabla de servicios
create table SERVICIOS (
	COD int primary key,
    NOMBRE varchar(20) not null,
    DESCRIPCION varchar(20)
);
-- insertamos datos
insert into SERVICIOS values(1,'SERVICIO1','desc1');
insert into SERVICIOS values(2,'servicio2','desc2');
insert into SERVICIOS values(3,'servicio3','desc3');
insert into SERVICIOS values(4,'servicio4','desc4');

-- probamos datos 
select * from SERVICIOS;

-- tabla clientes
create table CLIENTES (
	DNI varchar(9) primary key,
    NOMBRE varchar(20) not null,
    APELLIDO1 varchar(20) not null,
    APELLIDO2 varchar (20) not null,
    TELEFONO varchar(9) not null
);
-- insertamos datos
insert into CLIENTES values('123456789','JOAQUIN','RIQUELME','LEON','632802737');
insert into CLIENTES values('987654321','JOAQUIN2','RIQUELME2','LEON2','632802738');
-- probamos datos 
select * from CLIENTES;

-- tabla de reservas
create table RESERVAS(
	ID_RESERVA varchar(10),
    HABITACION int,
    CLIENTE varchar(9) not null,
    PRECIO_TOTAL decimal(6,2) not null,
    FECHA_ENTRADA date not null,
    FECHA_SALIDA date not null,
    primary key (ID_RESERVA),
    foreign key (HABITACION) references HABITACIONES (CODIGO),
    foreign key (CLIENTE) references CLIENTES (DNI)
    );
    -- insertamos datos 
    insert into RESERVAS values ('RES1',1,'123456789',4000,'2022-01-20','2022-01-21');
    insert into RESERVAS values ('RES2',2,'123456789',4000,'2022-01-20','2022-01-21');
    insert into RESERVAS values ('RES3',3,'123456789',4000,'2022-01-23','2022-01-24');
    
    -- probamos datos 
    select * from RESERVAS;
    
    -- tabla hoteles servicios
    create table HOTELES_SERVICIOS(
		HOTEL int,
        SERVICIO int,
        PRECIO decimal(6,2),
        primary key (HOTEL,SERVICIO),
        foreign key (HOTEL) references HOTELES(ID),
        foreign key (SERVICIO) references SERVICIOS(COD)
    );
    
    -- insertamos datos 
    insert into HOTELES_SERVICIOS values (1,1,230);
	insert into HOTELES_SERVICIOS values (1,2,100);
	insert into HOTELES_SERVICIOS values (2,3,200);
	insert into HOTELES_SERVICIOS values (2,4,250);
	insert into HOTELES_SERVICIOS values (1,3,400);
	insert into HOTELES_SERVICIOS values (2,1,300);
   
   -- probamos datos
	select * from HOTELES_SERVICIOS;
    select * from HOTELES;
    select * from SERVICIOS;
    
