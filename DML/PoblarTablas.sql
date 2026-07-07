/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbMenu(id_Categoria,Producto, Precio)
		VALUES  (6, 'Porcion Tostadas',8.000),
                (6, 'Bofe ahumado',20.000),
                (6, 'Bofe ahumado',20.000),
                (6, 'Costilla ahumada',22.000),
                (6, 'Morcilla caserá',18.000),
                (6, 'Marranitas',9.000),
                (6, 'Chicharrón con chip de plátano',20.000),
                (6, 'Chorizo santarrosano',12.000),
                (6, 'Empanadas caseras',16.000);
                


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
