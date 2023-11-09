CREATE DEFINER=`root`@`localhost` FUNCTION `f_producto_aleatorio`() RETURNS varchar(10) CHARSET utf8mb4
    READS SQL DATA
BEGIN
declare vresultado varchar(10);
declare vmax int;
declare valeatorio int;

select count(*) into vmax from `empresa`.`productos`;
set valeatorio=`empresa`.`f_aleatorio`(1, vmax)-1;

SELECT CODIGO
into vresultado
FROM `empresa`.`productos`
LIMIT valeatorio,1;

RETURN vresultado;
END