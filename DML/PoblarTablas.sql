/** INSERCCION DE DATOS  **/

USE BdRamadaValluna
GO

BEGIN TRY 
	BEGIN TRANSACTION 

		INSERT INTO tbEmpleados (Nombre, Apellido, id_Cargo,Telefono, FechaContrato)
		VALUES  ('JEIMY ALEXANDRA', 'JIMENEZ', 9, '3023456789', '2018-01-16'),
                ('JOHAN STEVAN', 'ANDRADE', 1, '3847795527', '2026-02-15'),
                ('DIANA CAROLINA', 'MUNOZ', 1, '3472530388', '2023-06-11'),
                ('MARCELA', 'RIASCOS', 1, '3979349735', '2021-04-20'),
                ('KAROL NATHALIA', 'YACUMAL CAMPO', 3, '3579757971', '2015-07-16'),
                ('CARLOS ALBERTO', 'YACUMAL', 12, '3007255081', '2008-07-16'),
                ('JOHN', 'PASTUSAL', 7, '3579757971', '2025-12-02'),
                ('YEYO', 'BALCAZAR', 7, '3479838739', '2015-10-06'),
                ('MARITZA', 'PANTOJA', 5, '3976442173', '2009-09-20'),
                ('DORIS', 'TOMBE', 4, '3544234313', '2014-10-01'),
                ('BERENICE', 'LARGACHA', 4, '3880293328', '2022-06-01'),
                ('MATEO', 'CORREA', 10, '3400144855', '2026-01-01'),
                ('YANARA', 'ARAUJO', 8, '3221305956', '2024-08-03'),
                ('DAYANA', 'RODIRGUEZ', 9, '3435197703', '2025-09-30'),
                ('ROSA', 'MANZANARES', 4, '3007255081', '2024-05-14'),
                ('KAREN GISELLA', 'MENA LARGACHA', 2, '3790276868', '2021-01-15');
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

SELECT * FROM tbEmpleados 
WHERE  Apellido LIKE '%YACUMAL%'


SELECT * FROM tbEmpleados 
WHERE  Apellido LIKE 'YACUMAL%'


SELECT * FROM tbEmpleados 
WHERE  Nombre = 'EVELYN'



UPDATE tbEmpleados
SET Apellido = 'NORIEGA'
WHERE id_empleado = 7