/** SCRIPT PARA AÑADIR CONSTRAINTS A LAS TABLAS  (DDL) **/
/*
	-- UNIQUE en tbMesa para el campo de id_zona y NumMesa, esto para poder evitar la duplicidad 
		del mismo numero de mesa con el mismo numero de zona, como si la mesa existiria dos veces en la misma zona
*/

USE BdRamadaValluna
GO

SET NOCOUNT ON
GO

ALTER TABLE tbMesa
	ADD CONSTRAINT Uq_tbMesa_idZona_NumMesa 
	UNIQUE (id_Zona, NumMesa);
	
