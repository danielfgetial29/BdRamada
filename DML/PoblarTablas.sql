/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbMenu(id_Categoria,Producto, Precio)
		VALUES  (4, 'Porcion de Torta - Red Velvet',14.000),
                (4, 'Porcion de Torta - Naranja',14.000);
                


    COMMIT TRANSACTION;

END TRY
BEGIN CATCH

    SELECT
        ERROR_NUMBER() AS Numero,
        ERROR_MESSAGE() AS Mensaje,
        ERROR_LINE() AS Linea;

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

END CATCH


--SELECT @@TRANCOUNT;
--DBCC CHECKIDENT ('tbMenu', RESEED, 25)
