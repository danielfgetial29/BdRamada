/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

BEGIN TRY 
	BEGIN TRANSACTION 
    
		INSERT INTO tbMenu(id_Categoria,Producto, Precio)
		VALUES  (1, 'Bandeja Paisa', 44.000),                   (1, 'Costilla San Luis a la BBQ', 46.000),
                (1, 'Sancocho con Pollo', 42.000),              (1, 'Pechuga de pollo a la parrilla', 42.000),    
                (1, 'Sancocho de Gallina', 42.000),             (1, 'Picada especial', 200.000),
                (1, 'Churrasco', 48.000),                       (1, 'Picada mediana', 120.000),
                (1, 'Sobrebarriga Criolla', 44.000),            (1, 'Parrilla campestre tres carnes', 54.000),   
                (1, 'Sancocho trifásico con Pollo', 44.000),    (1, 'Plato vegetariano', 30.000),
                (1, 'Sancocho trifásico con Gallina', 44.000),
                (1, 'Chuleta de Cerdo', 42.000),
                (1, 'Chuleta de Pllo', 42.000),
                (1, 'Chuletón a la plancha', 42.000),
                (1,'Baby beef', 52.000),
                (1, 'Bife chorizo a la parrilla',48.000),
                (1, 'Sobrebarriga a la planca', 44.000),
                (1, 'Costillón montañero',48.000),
                (1,'Salmón a la parrilla',52.000),
                (1, 'Tilapia a la parrilla', 48.000),
                (1, 'Trucha a la parrilla o frita', 46.000),
                (1, 'Plato Infantil',30.000),
                (1, 'Punta de Anca', 48.000);
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

