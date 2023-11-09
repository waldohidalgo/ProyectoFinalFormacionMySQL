CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
    READS SQL DATA
BEGIN
declare vresultado varchar(11);
declare vmax int;
declare valeatorio int;

select count(*) into vmax from clientes;
set valeatorio=`empresa`.`f_aleatorio`(1, vmax)-1;

SELECT DNI
into vresultado
FROM clientes 
LIMIT valeatorio,1;

RETURN vresultado;
END