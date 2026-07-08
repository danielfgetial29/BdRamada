/** SCRIPT DE LENGUAJE DE MANIPULACION DE DATOS (DML) **/
/*
	--* Utilizare este script para tener en un solo lugar las ejecucciones que realice al manipular los datos
		para llevar un registro de mi aprendizaje
*/

USE BdRamadaValluna
GO 

SET NOCOUNT ON
GO

BEGIN TRY
	BEGIN TRANSACTION
	
		UPDATE tbPedidos
		SET FechaCreacion = GETDATE()
		WHERE id_Pedido IN (1,3)

	COMMIT TRANSACTION
END TRY
BEGIN CATCH 

		IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

	THROW 

END CATCH 