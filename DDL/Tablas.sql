 -- QUERY DE CREACION DE DATOS DDL
USE BdRamadaValluna
GO

--EXEC sp_helpdb BdRamadaValluna

BEGIN TRY -- envolvemos el codigo que vamos a ejecutar para administrar errores

    BEGIN TRANSACTION
-- CREACION DE LAS TABLAS EN SUS FG 
/*=== TABLAS PADRES ===*/
        DROP TABLE IF EXISTS tbDetallePedido;
        DROP TABLE IF EXISTS tbPedidos;
        
        DROP TABLE IF EXISTS tbMenu;
        DROP TABLE IF EXISTS tbEmpleados;
        DROP TABLE IF EXISTS tbMesa;
        
        DROP TABLE IF EXISTS tbEstadoPedido;
        DROP TABLE IF EXISTS tbCategorias;
        DROP TABLE IF EXISTS tbCargo;
        DROP TABLE IF EXISTS tbZona;
        DROP TABLE IF EXISTS tbClientes;
       
        CREATE TABLE tbClientes (
 	        id_Cliente INT IDENTITY(1,1) Primary Key,
 	        Nombre VARCHAR(50) NOT NULL,
 	        Telefono VARCHAR(15) NOT NULL,
 	        Email VARCHAR(120) NOT NULL UNIQUE,
 	        Direccion VARCHAR(200),
 	        FechaCreacion DATETIME NOT NULL DEFAULT GETDATE()
        ) ON FG_MAESTRO
 
        CREATE TABLE tbZona (
        	id_Zona INT PRIMARY KEY IDENTITY,
        	Zona VARCHAR(50) NOT NULL UNIQUE
        ) ON FG_MAESTRO
        
        CREATE TABLE tbCargo (
        	id_Cargo INT PRIMARY KEY IDENTITY,
        	NombreCargo VARCHAR(100) NOT NULL UNIQUE,
        	Descripcion VARCHAR(200)
        ) ON FG_MAESTRO;
        
        CREATE TABLE tbCategorias (
        	id_Categoria INT PRIMARY KEY IDENTITY,
        	NombreCategoria VARCHAR(100) NOT NULL UNIQUE,
        	Descripcion VARCHAR(200)
        ) ON FG_MAESTRO

        CREATE TABLE tbEstadoPedido (
            id_EstadoPedido INT PRIMARY KEY IDENTITY,
            NombreEstado VARCHAR(30) NOT NULL UNIQUE
        ) ON FG_MAESTRO;

/*=== TABLAS HIJAS ===*/
        CREATE TABLE tbMesa (
            id_Mesa INT PRIMARY KEY IDENTITY,
            id_Zona INT NOT NULL,
            NumMesa INT NOT NULL,
            CONSTRAINT FK_tbMesa_tbZona FOREIGN KEY (id_Zona)
                REFERENCES tbZona (id_Zona)
        ) ON FG_MAESTRO;

        CREATE TABLE tbEmpleados (
            id_Empleado INT PRIMARY KEY IDENTITY,
            id_Cargo INT NOT NULL,
            Nombre VARCHAR(100) NOT NULL,
            Apellido VARCHAR(100) NOT NULL,
            Telefono VARCHAR(20) NOT NULL,
            FechaContrato DATETIME NOT NULL DEFAULT GETDATE(),
            CONSTRAINT FK_tbEmpleados_tbCargo FOREIGN KEY (id_Cargo)
                REFERENCES tbCargo (id_Cargo)
        ) ON FG_MAESTRO;

        CREATE TABLE tbMenu (
            id_Menu INT PRIMARY KEY IDENTITY,
            id_Categoria INT NOT NULL,
            Producto VARCHAR(150) NOT NULL,
            Precio DECIMAL(10,2) NOT NULL,
            DescripcionP VARCHAR(200),
            CONSTRAINT FK_tbMenu_tbCategoria FOREIGN KEY (id_Categoria)
                REFERENCES tbCategorias (id_Categoria),
            CONSTRAINT CK_tbMenu_Precio CHECK (Precio > 0)
        ) ON FG_MAESTRO

        CREATE TABLE tbPedidos (
            id_Pedido INT PRIMARY KEY IDENTITY,
            id_Cliente INT NOT NULL,
            id_Mesa INT NOT NULL,
            id_Empleado INT NOT NULL,
            id_EstadoPedido INT NOT NULL,
            FechaCreacion DATETIME NOT NULL DEFAULT GETDATE(),
            CONSTRAINT FK_tbPedidos_tbCliente FOREIGN KEY (id_Cliente)
                REFERENCES tbClientes (id_Cliente),
            CONSTRAINT FK_tbPedidos_tbMesa FOREIGN KEY (id_Mesa)
                REFERENCES tbMesa (id_Mesa),
            CONSTRAINT FK_tbPedidos_tbEmpleados FOREIGN KEY (id_Empleado)
                REFERENCES tbEmpleados (id_Empleado),
            CONSTRAINT FK_tbPedidos_tbEstadoPedido FOREIGN KEY (id_EstadoPedido)
                REFERENCES tbEstadoPedido (id_EstadoPedido)
        ) ON FG_VENTAS

        CREATE TABLE tbDetallePedido (
           id_DetallePedido INT PRIMARY KEY IDENTITY,
           id_Pedido INT NOT NULL,
           id_Menu INT NOT NULL,
           Cantidad INT NOT NULL,
           PrecioUnitario DECIMAL (10,2) NOT NULL,
           CONSTRAINT FK_tbDetallePedido_tbPedidos FOREIGN KEY (id_Pedido)
                REFERENCES tbPedidos (id_Pedido),
            CONSTRAINT FK_tbDetallePedido_tbMenu FOREIGN KEY (id_Menu)
                REFERENCES tbMenu (id_Menu),
            CONSTRAINT CK_tbDetallePedido_Cantidad CHECK (Cantidad > 0)
        ) ON FG_VENTAS;

    COMMIT TRANSACTION
END TRY
BEGIN CATCH

    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;

END CATCH