-------
SELECT p.NOMBRE,prod.descripcion FROM PROYECTO p
	JOIN PRODUCTO_PROYECTO pp ON p.PROYECTO = pp.PROYECTO
    JOIN PRODUCTO prod ON pp.PRODUCTO = prod.PRODUCTO
WHERE prod.DESCRIPCION IN ('Premia','Konmi','Yujule');

-------
SELECT DESCRIPCION
FROM PRODUCTO prod 
WHERE DESCRIPCION IN ('Premia Clásica','Premia Oro','Premia Platinum');	

-------
SELECT t.COD_TIPO, t.NOMBRE
FROM TIPO t 
	JOIN FORMATO_MENSAJE fm ON t.COD_TIPO=fm.COD_TIPO
              JOIN TIPO_INFORMACION ti ON 
                         fm.COD_TIPO_INFORMACION=ti.COD_TIPO_INFORMACION  
              WHERE ti.NOMBRE IN ('mensaje de texto','mail'
                                                     ,'mensaje en el estado de cuenta');

-------
SELECT ti.*,fm.*
FROM TIPO t 
	JOIN FORMATO_MENSAJE fm ON t.COD_TIPO=fm.COD_TIPO
              JOIN TIPO_INFORMACION ti ON 
                         fm.COD_TIPO_INFORMACION=ti.COD_TIPO_INFORMACION  
              WHERE ti.NOMBRE IN ('mensaje de bienvenida','mensaje de mora'
                                                     ,'mensaje de promoción');

-------													 
SELECT * FROM FORMATO_MENSAJE

-------
SELECT p.PROYECTO,prod.PRODUCTO,m.cod_mensaje
FROM PROYECTO p
	JOIN PRODUCTO_PROYECTO pp ON p.PROYECTO = pp.PROYECTO
             JOIN PRODUCTO prod ON pp.PRODUCTO = prod.PRODUCTO
             JOIN MENSAJE m ON p.PROYECTO = m.PROYECTO AND 
                                                    prod.PRODUCTO = m.PRODUCTO
WHERE prod.DESCRIPCION IN ('Premia','Konmi','Yujule');

-------A
SELECT p.NOMBRE, p.PRODUCTO, p.DESCRIPCION
FROM PROYECTO p
	JOIN PRODUCTO_PROYECTO pp ON p.PROYECTO = pp.PROYECTO
             JOIN PRODUCTO prod ON pp.PRODUCTO = prod.PRODUCTO
WHERE p.PROYECTO = 1

-------B
SELECT p.PROYECTO,prod.PRODUCTO,m.cod_mensaje
FROM MENSAJE m 
              JOIN PROYECTO p ON p.PROYECTO = m.PROYECTO AND 
                                                     prod.PRODUCTO = m.PRODUCTO
	JOIN PRODUCTO_PROYECTO pp ON p.PROYECTO = pp.PROYECTO
             JOIN PRODUCTO prod ON pp.PRODUCTO = prod.PRODUCTO
        
-------C		
    --FALTA OPTIMIZACION; para pocos valores la consulta funcionaria bien. 
		SELECT DISTINCT pp.PROYECTO,m.COD_MENSAJE,'TODOS' PRODUCTO
		FROM PRODUCTO_PROYECTO pp
			JOIN MENSAJE m ON pp.PROYECTO = m.PROYECTO AND pp.PRODUCTO = m.PRODUCTO
		WHERE 
			NOT (pp.PROYECTO,m.cod_mensaje) IN (
				SELECT tmp.PROYECTO,tmp.COD_MENSAJE
				FROM (
					SELECT DISTINCT pp.PROYECTO, pp.PRODUCTO, prod_mens.COD_MENSAJE  
					FROM ( 
						SELECT distinct pp.PROYECTO, m.COD_MENSAJE 
						FROM  PRODUCTO_PROYECTO pp
							JOIN MENSAJE m ON pp.PROYECTO = m.PROYECTO
					) prod_mens 
					JOIN PRODUCTO_PROYECTO pp ON prod_mens.PROYECTO = pp.PROYECTO
				) tmp 
					LEFT JOIN MENSAJE m ON tmp.PROYECTO = m.PROYECTO 
										   AND tmp.PRODUCTO = m.PRODUCTO
										   AND tmp.COD_MENSAJE = m.COD_MENSAJE
				WHERE m.COD_MENSAJE IS NULL		
			)
		UNION
		SELECT pp.PROYECTO,m.COD_MENSAJE,pp.PRODUCTO
		FROM PRODUCTO_PROYECTO pp
			JOIN MENSAJE m ON pp.PROYECTO = m.PROYECTO AND pp.PRODUCTO = m.PRODUCTO
		WHERE 
			(pp.PROYECTO,m.cod_mensaje) IN (
				SELECT tmp.PROYECTO,tmp.COD_MENSAJE
				FROM (
					SELECT DISTINCT pp.PROYECTO, pp.PRODUCTO, prod_mens.COD_MENSAJE  
					FROM ( 
						SELECT distinct pp.PROYECTO, m.COD_MENSAJE 
						FROM  PRODUCTO_PROYECTO pp
							JOIN MENSAJE m ON pp.PROYECTO = m.PROYECTO
					) prod_mens 
					JOIN PRODUCTO_PROYECTO pp ON prod_mens.PROYECTO = pp.PROYECTO
				) tmp 
					LEFT JOIN MENSAJE m ON tmp.PROYECTO = m.PROYECTO 
										   AND tmp.PRODUCTO = m.PRODUCTO
										   AND tmp.COD_MENSAJE = m.COD_MENSAJE
				WHERE m.COD_MENSAJE IS NULL		
			)	
        													 
