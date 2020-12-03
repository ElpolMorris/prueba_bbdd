create database prueba;
\c prueba
create table clientes (id int primary key, nombre varchar(80) not null, rut varchar(10), direccion varchar(100));
create table categorias (id smallint primary key, nombre varchar(50) not null, descripcion varchar(100));
create table productos (id int primary key, nombre varchar(50), descripcion varchar(100), valor_unitario int not null, id_cat smallint references categorias(id));
create table factura (num_fact int primary key, fecha date not null, id_cliente smallint references clientes(id), subtotal int default 0, precio_total float8 default 0, iva float8 default 0);
create table listado_productos (cod_detalle smallint, cantidad smallint not null, id_prod smallint references productos(id), id_fact int references factura(num_fact));
-- agregar registros a tablas
-- agregar 5 clientes
insert into clientes (id, nombre, rut, direccion) values (1,'Pablo Morales', '17836998-9', 'Calle Falsa 123'),(2,'Roberta Mendez', '23146156-7', 'Avenida Siempreviva 742')
,(3,'Ruben Aguirre', '10025695-3', 'Marin 014'),(4,'Josefina Alvarez', '08080823-4', 'Calle 13'),(5,'Andrea Bonucci', '12345678-k', 'Av grecia 2001');
-- agregar 3 categorias
insert into categorias (id,nombre, descripcion) values (1, 'Microfonia','articulos de microfonía'), (2, 'Audio Pro', 'caja activas, pasivas'), (3, 'Accesorios', 'utiles como atriles, baquetas, afinadores, etc');
-- agregar 8 productos
insert into productos (id, nombre, descripcion, valor_unitario, id_cat) values 
(1,'Baqueta Zingjian', 'Baqueta de Madera Z5A de ZILDJIAN', 9468, 3),
(2, 'Atril de micrófono Hercules MS631B', 'Atril de micrófono con boom Hercules, incluye Adaptador para micrófono de instalación instantánea.',12990,3),
(3,'Micrófono inalámbrico de mano Sennheiser','El set incluye un receptor estacionario intuitivo para una rápida configuración y fácil manejo',239990, 1),
(4,'Micrófono condensador Saramonic VMIC MINI','micrófono de condensador direccional compacto grabación de audio para su video.', 74990,1),
(5, 'Micrófono vocal Shure dinámico', 'micrófono dinámico vocal unidireccional diseñado para uso vocal profesional', 108000,1),
(6,'Parlante de instalacion de pared WHAFEDALE','Parlante de sistema pasivo de 2 vias, soporte de pared incluido',135000,2),
(7,'Caja acústica Activa JBL', 'El JBL PRX812W es un altavoz activo de gama completa ideal para PA o monitoreo.',969900,2),
(8,'Caja activa HH audio','caja activa de 2 vías con woofer de 8 pulgadas', 80742,2);
-- agregar 10 facturas cod_detalle
-- 2 facturas cliente #1
begin;
insert into factura (num_fact, fecha, id_cliente) values (1, '2020-06-01', 1);
insert into listado_productos (cod_detalle, cantidad, id_prod, id_fact) values (1,1,7,1);
insert into listado_productos (cod_detalle, cantidad, id_prod, id_fact) values (2,1,8,1);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 1) as valor_bruto where num_fact = 1;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;

begin;
insert into factura (num_fact, fecha, id_cliente) values (2, '2020-06-29',1);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,1,3,2);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (2,1,4,2);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (3,1,5,2);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 2) as valor_bruto where num_fact = 2;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;
--3 facturas cliente #2
begin;
insert into factura (num_fact, fecha, id_cliente) values (3, '2020-07-04',2);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,1,5,3);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (2,2,2,3);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (3,1,1,3);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 3) as valor_bruto where num_fact = 3;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;

begin;
insert into factura (num_fact, fecha, id_cliente) values (4, '2020-07-15',2);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,2,6,4);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (2,2,7,4);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 4) as valor_bruto where num_fact = 4;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;

begin;
insert into factura (num_fact, fecha, id_cliente) values (5, '2020-08-03',2);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,1,8,5);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (2,1,4,5);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (3,2,3,5);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 5) as valor_bruto where num_fact = 5;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;
--1 factura cliente #3
begin;
insert into factura (num_fact, fecha, id_cliente) values (6, '2020-08-14',3);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,1,6,6);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 6) as valor_bruto where num_fact = 6;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;
--4 facturas cliente #4
begin;
insert into factura (num_fact, fecha, id_cliente) values (7, '2020-09-11',4);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,1,1,7);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (2,4,2,7);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 7) as valor_bruto where num_fact = 7;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;

begin;
insert into factura (num_fact, fecha, id_cliente) values (8, '2020-09-27',4);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,2,3,8);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (2,1,6,8);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (3,2,5,8);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 8) as valor_bruto where num_fact = 8;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;

begin;
insert into factura (num_fact, fecha, id_cliente) values (9, '2020-10-05',4);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,2,6,9);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (2,1,7,9);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (3,3,8,9);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (4,5,1,9);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 9) as valor_bruto where num_fact = 9;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;

begin;
insert into factura (num_fact, fecha, id_cliente) values (10, '2020-11-30',4);
insert into listado_productos(cod_detalle, cantidad, id_prod, id_fact) values (1,3,2,10);
update factura set subtotal = valor_bruto.subtotal from (select sum(x.cantidad * y.valor_unitario) as subtotal  from listado_productos as x inner join productos as y on x.id_prod = y.id where x.id_fact = 10) as valor_bruto where num_fact = 10;
update factura set iva = round(subtotal * 0.19);
update factura set precio_total = round(subtotal * 1.19);
commit;

--diccionario
SELECT
t1.TABLE_NAME AS tabla_nombre,
t1.COLUMN_NAME AS columna_nombre,
t1.ORDINAL_POSITION AS position ,
t1.IS_NULLABLE AS nulo,
t1.DATA_TYPE AS tipo_dato,
COALESCE (t1.NUMERIC_PRECISION,
t1.CHARACTER_MAXIMUM_LENGTH) AS longitud,
t1.column_default as defecto
FROM
INFORMATION_SCHEMA.COLUMNS t1
WHERE
t1.TABLE_SCHEMA = 'public'
ORDER BY
t1.TABLE_NAME;


-- cliente que hizo la compra de mayor valor
select id_cliente, precio_total from factura where precio_total = (select max(precio_total) from factura);

-- ¿Qué cliente pagó sobre 100 de monto?
select id_cliente from factura where precio_total > 1000000 group by id_cliente;
--cantidad de clientes que compraron producto 6 
select count(distinct id_cliente) from factura where num_fact in ( select id_fact from listado_productos where id_prod = 6);
