use sakila;



create table pais(
	id_pais int primary key,
	nombre varchar(50) not null,
	ultima_actualizacion timestamp);



create table ciudad(
	id_ciudad int primary key,
	nombre varchar(50) not null,
	id_pais int not null,
	foreign key(id_pais) references pais(id_pais));


create table direccion(
	id_direccion int primary key,
	direccion varchar(50) not null,
	direccion2 varchar(50),
	distrito varchar(20) not null,
	id_ciudad int not null,
	codigo_postal varchar(10) not null,
	telefono varchar(20) not null,
	ultima_actualizacion timestamp,
	foreign key(id_ciudad) references ciudad(id_ciudad));



create table empleado(
	id_empleado int primary key,
	nombre varchar(45) not null,
	apellidos varchar(45) not null,
	id_direccion int not null,
	imagen blob,
	email varchar(50) not null,
	id_almacen int not null,
	activo tinyint(1),
	username varchar(16) not null,
	password varchar(40) not null,
	ultima_actualizacion timestamp,
	foreign key(id_direccion) references direccion(id_direccion));
	

create table idioma (
	id_idioma int primary key,
	nombre char(20) not null,
	ultima_actualizacion timestamp);



create table pelicula(
	id_pelicula int primary key,
	titulo varchar(255),
	descripcion text,
	anyo_lanzamiento year,
	id_idioma int,
	id_idioma_original int,
	duracion_alquiler int,
	rental_rate decimal(4,2),
	duracion smallint unsigned,
	replacement_cost decimal(5,2),
	clasificacion enum('G','PG','PG-13','R','NC-17'),
	caracteristicas_especiales set('Trailers','Commentaries','Deleted Scenes','Behind the Scenes'),
	ultima_actualizacion timestamp);



create table almacen(
	id_almacen int primary key,
	id_empleado_jefe int not null,
	id_direccion int not null,
	ultima_actualizacion timestamp,
	foreign key(id_empleado_jefe) references empleado(id_empleado),
	foreign key(id_direccion) references direccion(id_direccion));



create table cliente (
	id_cliente int primary key,
	id_almacen int not null,
	nombre varchar(45) not null,
	apellidos varchar(45) not null,
	email varchar(50) not null,
	id_direccion int not null,
	activo tinyint(1),
	fecha_creacion datetime,
	ultima_actualizacion timestamp,
	foreign key(id_almacen) references almacen(id_almacen),
	foreign key(id_direccion) references direccion(id_direccion));





create table inventario(
	id_inventario int primary key,
	id_pelicula int not null,
	id_almacen int not null,
	ultima_actualizacion timestamp,
	foreign key(id_pelicula) references pelicula(id_pelicula),
	foreign key(id_almacen) references almacen(id_almacen));





create table alquiler(
	id_alquiler int primary key,
	fecha_alquiler datetime,
	id_inventario int not null,
	id_cliente int not null,
	fecha_devolucion datetime,
	id_empleado int not null,
	ultima_actualizacion timestamp,
	foreign key(id_inventario) references inventario(id_inventario),
	foreign key(id_cliente) references cliente(id_cliente),
	foreign key(id_empleado) references empleado(id_empleado));





create table pago(
	id_pago int primary key,
	id_cliente int not null,
	id_empleado int not null,
	id_alquiler int not null,
	total decimal(5,2),
	fecha_pago datetime,
	ultima_actualizacion timestamp,
	foreign key(id_cliente) references cliente(id_cliente),
	foreign key(id_empleado) references empleado(id_empleado),
	foreign key(id_alquiler) references alquiler (id_alquiler));

select * from pelicula;


create table actor(
	id_actor int primary key,
	nombre varchar(45),
	apellidos varchar(45),
	ultima_actualizacion timestamp);

drop table pelicula_actor;

create table pelicula_actor(
	id_actor int primary key,
	id_pelicula int not null,
	foreign key(id_actor) references actor(id_actor),
	foreign key(id_pelicula) references pelicula(id_pelicula));




create table film_text(
	film_id int primary key,
	title varchar(255),
	description text);
	




drop table categoria;
create table categoria(
	id_categoria int primary key,
	nombre varchar(25),
	ultima_actualizacion timestamp);    