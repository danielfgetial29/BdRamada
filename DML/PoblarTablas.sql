/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbDetallePedido (id_Pedido, id_Menu, Cantidad, PrecioUnitario, Desc_Pedido)
        SELECT  1 id_Pedido,
                M.id_Menu,
                V.Cantidad,
                M.Precio, 
                V.Desc_Pedido
        FROM tbMenu M
        INNER JOIN
        (
            VALUES -- donde creo los valores que necesito 
                (3,1,NULL),
                (53,2,'Mora')
        ) AS V(id_Menu, Cantidad,  Desc_Pedido) -- es el nombre de mis filas que usare
        ON M.id_Menu = V.id_Menu; -- donde se unen 

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
