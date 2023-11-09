CREATE DEFINER=`root`@`localhost` FUNCTION `f_aleatorio`(
pmin int,
pmax int) RETURNS int
    NO SQL
BEGIN
declare vresultado int;
select floor(rand()*(pmax-pmin+1))+pmin into vresultado;

RETURN vresultado;
END