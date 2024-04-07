-- DDL Data Definition Language, Foreing key relacion entre dos tablas 
create database ventas; 

-- Yo puedo acceder a la tabla 
USE ventas;

-- Crear una tabla
CREATE TABLE cabecera_factura (
numero varchar(20) primary key,
fecha datetime not null,
codigo_cliente int not null
)
CREATE TABLE detalle_factura(
numero_factura varchar(20) not null,
linea int not null,
codigo_producto int not null,
cantidad decimal(10,2) not null,
precio decimal(10,2) not null,
total decimal(10,2) not null
)

CREATE TABLE producto(
codigo int not null primary key,
nombre varchar(100) not null,
precio_actual decimal(10,2) not null
)

CREATE TABLE cliente(
codigo int not null primary key,
primer_nombre varchar(100) not null,
primer_apellido varchar(100) not null,
direccion varchar(100) null,
nit varchar(20) not null
)

ALTER TABLE cabecera_factura ADD CONSTRAINT FK_FACTURA_CLIENTE FOREIGN KEY
(codigo_cliente) REFERENCES cliente(codigo);

ALTER TABLE detalle_factura ADD CONSTRAINT FK_DETALLE_FACTURA_PRODUCTO FOREIGN KEY
(codigo_producto) REFERENCES producto(codigo);

ALTER TABLE detalle_factura ADD CONSTRAINT FK_DETALLE_ENCABEZADO_FACTUTA FOREIGN KEY 
(numero_factura) REFERENCES cabecera_factura(numero);

ALTER TABLE detalle_factura ADD CONSTRAINT PK_DETALLE_FACTURA PRIMARY KEY
(numero_factura, linea);

INSERT INTO cliente (codigo, primer_nombre, primer_apellido, direccion, NIT)
VALUES (1, 'Juan', 'Perez', 'Jalapa', '92290'),
(2, 'Dani', 'Ignacio', 'Jalapa', '32445'),
(3, 'Diego', 'Catalan', 'Jalapa', '23456');

INSERT INTO producto (codigo, nombre, precio_actual)
VALUES (1, 'Xiaomi Redmi 13', 4000),
(2, 'IPhone 15', 12000),
(3, 'Alcatel', 1000);

INSERT INTO cabecera_factura (numero, fecha, codigo_cliente)
VALUES ('102030F', NOW(), 1),
('203040D', NOW(), 2),
('304050W', NOW(), 3);

INSERT INTO detalle_factura (numero_factura, linea, codigo_producto, cantidad, precio, total)
VALUES ('102030F', 1, 2, 1, 12000, 12000),
('203040D', 1, 3, 2, 1000, 2000),
('304050W', 1, 1, 3, 4000, 12000),
('102030F', 1, 1, 1, 4000, 4000);

SELECT * 
FROM detalle_factura
WHERE numero_factura = '102030F'

-- El comando IN se usa para filtrar un listado de valores separados por comas.

SELECT *
FROM producto
WHERE codigo IN (1, 3)
 
 -- JOINS
 -- SELECT usando JOINs para identificar que productos se vendieron en X factura
 SELECT detalle_factura.numero_factura, producto.nombre
 FROM detalle_factura
 JOIN producto ON detalle_factura.codigo_producto = producto. codigo
 WHERE detalle_factura.numero_factura = '203040D';
 
 
 SELECT cabecera_factura.numero, cliente.pimer_nombre, cliente.primer_apellido
 FROM cabecera_factura
 JOIN cliente ON cabecera_factura.codigo_cliente = cliente.codigo
 WHERE cabecera_factura.numero = '203040D'
 
 
