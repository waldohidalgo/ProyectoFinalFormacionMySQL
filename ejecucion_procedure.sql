CALL `empresa`.`sp_venta`('2023-08-09', 15, 100);


select * from facturas as A
inner join items B 
on A.NUMERO=B.NUMERO
WHERE A.FECHA='2023-08-09';