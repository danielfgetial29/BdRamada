[1mdiff --git a/DML/PoblarTablas.sql b/DML/PoblarTablas.sql[m
[1mindex 57d3bcf..12025e8 100644[m
[1m--- a/DML/PoblarTablas.sql[m
[1m+++ b/DML/PoblarTablas.sql[m
[36m@@ -2,27 +2,15 @@[m
 [m
 USE BdRamadaValluna[m
 GO[m
[31m-[m
[32m+[m[32mSET NOCOUNT ON[m
 BEGIN TRY [m
 	BEGIN TRANSACTION [m
[31m-[m
[31m-		INSERT INTO tbEmpleados (Nombre, Apellido, id_Cargo,Telefono, FechaContrato)[m
[31m-		VALUES  ('JEIMY ALEXANDRA', 'JIMENEZ', 9, '3023456789', '2018-01-16'),[m
[31m-                ('JOHAN STEVAN', 'ANDRADE', 1, '3847795527', '2026-02-15'),[m
[31m-                ('DIANA CAROLINA', 'MUNOZ', 1, '3472530388', '2023-06-11'),[m
[31m-                ('MARCELA', 'RIASCOS', 1, '3979349735', '2021-04-20'),[m
[31m-                ('KAROL NATHALIA', 'YACUMAL CAMPO', 3, '3579757971', '2015-07-16'),[m
[31m-                ('CARLOS ALBERTO', 'YACUMAL', 12, '3007255081', '2008-07-16'),[m
[31m-                ('JOHN', 'PASTUSAL', 7, '3579757971', '2025-12-02'),[m
[31m-                ('YEYO', 'BALCAZAR', 7, '3479838739', '2015-10-06'),[m
[31m-                ('MARITZA', 'PANTOJA', 5, '3976442173', '2009-09-20'),[m
[31m-                ('DORIS', 'TOMBE', 4, '3544234313', '2014-10-01'),[m
[31m-                ('BERENICE', 'LARGACHA', 4, '3880293328', '2022-06-01'),[m
[31m-                ('MATEO', 'CORREA', 10, '3400144855', '2026-01-01'),[m
[31m-                ('YANARA', 'ARAUJO', 8, '3221305956', '2024-08-03'),[m
[31m-                ('DAYANA', 'RODIRGUEZ', 9, '3435197703', '2025-09-30'),[m
[31m-                ('ROSA', 'MANZANARES', 4, '3007255081', '2024-05-14'),[m
[31m-                ('KAREN GISELLA', 'MENA LARGACHA', 2, '3790276868', '2021-01-15');[m
[32m+[m[41m    [m
[32m+[m		[32mINSERT INTO tbMesa (id_Zona	,NumMesa)[m
[32m+[m		[32mVALUES  (4, 1),[m
[32m+[m[32m                (4, 2),[m
[32m+[m[32m                (4, 3),[m
[32m+[m[32m                (4, 4);[m
 	COMMIT TRANSACTION[m
 END TRY[m
 BEGIN CATCH[m
[36m@@ -39,20 +27,3 @@[m [mEND CATCH[m
 --DBCC CHECKIDENT ('tbEmpleados', RESEED, 0);[m
 --DELETE tbEmpleados[m
 --select @@TRANCOUNT [m
[31m-[m
[31m-SELECT * FROM tbEmpleados [m
[31m-WHERE  Apellido LIKE '%YACUMAL%'[m
[31m-[m
[31m-[m
[31m-SELECT * FROM tbEmpleados [m
[31m-WHERE  Apellido LIKE 'YACUMAL%'[m
[31m-[m
[31m-[m
[31m-SELECT * FROM tbEmpleados [m
[31m-WHERE  Nombre = 'EVELYN'[m
[31m-[m
[31m-[m
[31m-[m
[31m-UPDATE tbEmpleados[m
[31m-SET Apellido = 'NORIEGA'[m
[31m-WHERE id_empleado = 7[m
\ No newline at end of file[m
