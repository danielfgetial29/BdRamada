/** SCRIPT PARA AÑADIR CONSTRAINTS A LAS TABLAS  (DDL) **/
/*
	-- UNIQUE en tbMesa para el campo de id_zona y NumMesa, esto para poder evitar la duplicidad 
		del mismo numero de mesa con el mismo numero de zona, como si la mesa existiria dos veces en la misma zona

	-- Cambio de campo id_Cliente NOT NULL por NULL en tbPedidos

	** Agrego un CHECK a tbDetallePedido al campo PrecioUnirario para asegurar su valor positivo
*/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO
-- Unique en tbMesa
ALTER TABLE tbMesa
	ADD CONSTRAINT Uq_tbMesa_idZona_NumMesa 
	UNIQUE (id_Zona, NumMesa);

-- Unique para tbDetallePedido
ALTER TABLE tbDetallePedido
	ADD CONSTRAINT CK_tbDetallePedido_PrecioUnitario
	CHECK (PrecioUnitario > 0)

-- Cambiar campo NOT NULL por NULL
AlTER TABLE tbPedidos
ALTER COLUMN id_Cliente INT  NULL;
	
