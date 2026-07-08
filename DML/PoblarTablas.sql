/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbDetallePedido (id_Pedido, id_Menu, Cantidad, PrecioUnitario)
		SELECT 1,
               id_Menu,
               1,
               Precio
        FROM tbMenu
        WHERE id_Menu = 1

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
