CREATE DEFINER=`root`@`localhost` FUNCTION `f_vendedor_aleatorio`() RETURNS varchar(5) CHARSET utf8mb4
    READS SQL DATA
BEGIN
declare vresultado varchar(5);
declare vmax int;
declare valeatorio int;

select count(*) into vmax from `empresa`.`vendedores`;
set valeatorio=`empresa`.`f_aleatorio`(1, vmax)-1;

SELECT MATRICULA
into vresultado
FROM `empresa`.`vendedores`
LIMIT valeatorio,1;

RETURN vresultado;
END