/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbPedidos(id_Cliente, id_Mesa, id_Empleado, id_EstadoPedido, FechaCreacion)
		VALUES  (1, 45, 2, 1, ' '),     (1, 45, 2, 1, ' '),
                (, , , , ' '),     (, , , , ' '),
                (, , , , ' '),     (, , , , ' '),
                (, , , , ' '),     (, , , , ' '),
                (, , , , ' '),     (, , , , ' '),
                (, , , , ' '),     (, , , , ' '),
                (, , , , ' '),     (, , , , ' '),
                (, , , , ' '),     (, , , , ' ');
                


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
