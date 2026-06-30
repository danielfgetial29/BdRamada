/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbMenu(id_Categoria,Producto, Precio)
		VALUES  (3, 'Chocolate en leche', 6.000),                   (3, 'Vaso de mandarina', 12.000),
                (3, 'Chocolate con queso', 10.000),                 (3, 'Jarra de mandarina', 34.000),
                (3, 'Jugos natural de la casa - Vaso', 12.000),     (3, 'Vaso de Naranja', 10.000),
                (3, 'Jugos natural de la casa - Jarra', 32.000),    (3, 'Jarra de Naranja', 34.000),
                (3, 'Jugo Natural - Vaso', 10.000),                 (3, 'Vaso de Limonada natural', 12.000),
                (3, 'Jugo Natural en Leche - Vaso', 12.000),        (3, 'Jarra de Limonada natural', 24.000),
                (3, 'Jugo Natural en Leche - Jarra', 30.000),       (3, 'Media Jarra de Limonada natural',10.000),
                (3, 'Jugo Natural en Agua - Jarra', 32.000),        (3, 'Jarra de Lulada',42.000),
                (3, 'Copa de Limonada cerezada',14.000),            (3, 'Jarra de Limonada cerezada',38.000),
                (3, 'Copa de Limonada coco',14.000),                (3, 'Jarra de Limonada Coco', 38.000),
                (3, 'Copa Limonada kiwi',14.000),                   (3, 'Jarra de Limonada Kiwi', 38.000),
                (3, 'Copa Limonada mango viche',14.000),            (3, 'Jarra Limonada mango viche', 38.000),
                (3, 'Soda Italiana Frutos rojos', 16.000),          (3, 'Jarra Limonada de hierbabuena',38.000),
                (3, 'Soda Italiana Maracuya',16.000),               (3, 'Soda Italiana Kiwi', 16.000),
                (3, 'Soda Italiana Lulo',16.000),                   (3, 'Rarra de Refajo', 34.000),
                (3, 'Copa Sangria', 22.000),                        (3, 'Media Jarra Sangria', 40.000),
                (3, 'Jarra Sangria',70.000),                        (3, 'Cervezas', 8.000),
                (3, 'Copa de Lulada', 16.000);
END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS Numero,
        ERROR_MESSAGE() AS Mensaje,
        ERROR_LINE() AS Linea;

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

END CATCH
--DBCC CHECKIDENT ('tbEmpleados', RESEED, 0);
--DELETE tbEmpleados
--select @@TRANCOUNT 

