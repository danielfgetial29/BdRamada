/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbMenu(id_Categoria,Producto, Precio)
		VALUES  (2, 'Carne asada', 28.000),                  (2, 'Huevos Rancheros', 15.000),
                (2, 'Calentado Cacerola', 20.000),           (2, 'Calentado Revuelto', 20.000), 
                (2, 'Calentado Perico', 20.000),             (2, 'Calentado Ranchero', 20.000),                      
                (2, 'Omelette', 20.000),                     (2, 'Huevos Pericos', 15.000),
                (2, 'Huevos Revueltos', 15.000),             (2, 'Huevos Cacerola', 34.000),
                (2, 'Areppa queso', 5.000);
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

