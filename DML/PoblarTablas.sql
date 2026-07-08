/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbPedidos(id_Cliente, id_Mesa, id_Empleado, id_EstadoPedido, FechaCreacion)
		VALUES  (1, 45, 2, 1, ' '),                 (NULL, 60, 5, 2, '2026-07-08 08:30'),
                (NULL, 46, 2, 1, ' '),              (4, 47, 2, 2, '2026-07-08 11:57'),
                (6, 48, 2, 3, '2026-07-08 10:07'),  (NULL, 50, 1, 5, ' 2026-07-08 09:00'),
                (5, 49, 2, 4, ' 2026-06-08 12:43');
                


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
