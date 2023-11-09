CREATE TABLE facturacion(
FECHA DATE NULL,
VENTA_TOTAL FLOAT
);




CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_triggers`()
BEGIN
DELETE FROM facturacion;
  INSERT INTO facturacion
  SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
  FROM facturas A
  INNER JOIN
  items B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.FECHA;
END



DELIMITER $$
CREATE TRIGGER TG_FACTURACION_UPDATE
AFTER UPDATE ON items
FOR EACH ROW BEGIN
  CALL `empresa`.`sp_triggers`();
END $$


DELIMITER $$
CREATE TRIGGER TG_FACTURACION_INSERT 
AFTER INSERT ON items
FOR EACH ROW BEGIN
  CALL `empresa`.`sp_triggers`();
END $$


DELIMITER $$
CREATE TRIGGER TG_FACTURACION_DELETE
AFTER DELETE ON items
FOR EACH ROW BEGIN
  CALL `empresa`.`sp_triggers`();
END $$


CALL `empresa`.`sp_venta`('2023-08-13', 15, 100);


select * from facturas as A
inner join items B 
on A.NUMERO=B.NUMERO
WHERE A.FECHA='2023-08-13';


select * from facturacion where FECHA='2023-08-13';