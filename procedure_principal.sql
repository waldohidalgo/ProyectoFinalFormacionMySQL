DELIMITER $$
USE `empresa`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_venta`(
fecha date,
max_items int,
max_cantidad int)
BEGIN
declare vcliente varchar(11);
declare vproducto varchar(10);
declare vvendedor varchar(5);
declare vcantidad int;
declare vprecio decimal(10,5);
declare vitems int;
declare vfactura int;
declare vcontador int default 1;
declare vcantidad_productos int;
declare vnumero_items int;

select count(*) into vcantidad_productos from `empresa`.`productos`;

select max(CONVERT(NUMERO, SIGNED))+1 into vfactura from `empresa`.`facturas`;
select `empresa`.`f_cliente_aleatorio`() into vcliente;
select `empresa`.`f_vendedor_aleatorio`() into vvendedor;

insert into `empresa`.`facturas`
(NUMERO,FECHA,DNI,MATRICULA,IMPUESTO
) values(vfactura,fecha,vcliente,vvendedor,0.16);

select `empresa`.`f_aleatorio`(1, max_items) into vitems;


while  (vcontador <= max_items ) do
select `empresa`.`f_producto_aleatorio`() into vproducto;

select count(*) into vnumero_items from `empresa`.`items`
where NUMERO=vfactura and CODIGO=vproducto;

if vnumero_items=0 then
	select `empresa`.`f_aleatorio`(1, max_cantidad) into vcantidad;
	select PRECIO into vprecio from `empresa`.`productos` where CODIGO=vproducto;
	insert into `empresa`.`items`(NUMERO,CODIGO,CANTIDAD,PRECIO)
	values(vfactura,vproducto,vcantidad,vprecio);
end if;
set vcontador=vcontador+1;
end while;
END$$