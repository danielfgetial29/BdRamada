/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbMesa (id_Zona	,NumMesa)
		VALUES  (9, 1),
                (9, 2),
                (9, 3),
                (9, 4),
                (9, 5);
	COMMIT TRANSACTION
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

