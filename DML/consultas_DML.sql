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
	
		DELETE FROM tbMenu
		WHERE id_Categoria = 4 

	COMMIT TRANSACTION
END TRY
BEGIN CATCH 

		IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

	THROW 

END CATCH 