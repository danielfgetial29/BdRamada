/** SCRIPT DE CONSULTAS  consultas_busquedas.sql **/
/*
	---* En este script registrare las diferentes consultas que realice a mis tablas
	incluire inner join, lef, right join y diferentes consultas que vaya aprendiendo
*/

-- Todos los datos de tbCliente
SELECT id_Cliente, 
	   Nombre,
	   Telefono, 
	   Email, 
	   Direccion, 
	   FechaCreacion
FROM tbClientes

-- consulta para ver las zonas y todas las mesas de tbMesas
SELECT M.id_Mesa, 
	   Z.Zona,
	   M.id_Zona, 
	   M.NumMesa
FROM tbMesa M
INNER JOIN tbZona Z ON (M.id_zona = Z.id_Zona)
--WHERE Z.id_Zona = 9
order by Z.Zona

--Todos los datos en tbEmpleados
--SELECT id_Empleado, 
--	   id_Cargo, 
--	   Nombre, 
--	   Apellido,
--	   Telefono,
--	   FechaContrato
--FROM tbEmpleados 

/*-- Consulta para ver que cargo tiene cada empleado y columna Nombre y Apellido concatenadas */
SELECT	E.id_Empleado, 
		E.id_Cargo,
		CONCAT (E.Nombre,' ', E.Apellido) NombreApellido,
		C.NombreCargo
FROM tbEmpleados E
INNER JOIN tbCargo C
	ON (E.id_Cargo = C.id_Cargo)
WHERE E.id_Cargo = 1
ORDER BY C.NombreCargo asc

-- Todos los datos de tbEstadoPedido
SELECT id_EstadoPedido, NombreEstado
FROM tbEstadoPedido


-- Consulta para ver TODOS los registros de tbMenu
SELECT id_Menu, 
	   id_Categoria,
	   Producto, 
	   Precio, 
	   DescripcionP
FROM tbMenu

-- Ver TODOS los datos en tbPedidos
SELECT id_Pedido,
	   id_Cliente,
	   id_Mesa,
	   id_Empleado,
	   id_EstadoPedido, 
	   FechaCreacion
FROM tbPedidos


--- Consulta las diferentes categorias que tenemos en tbmenu
SELECT DISTINCT id_Categoria
FROM tbMenu

-- Consulta para ver las categorias que aun faltan en tbMenu
SELECT DISTINCT C.id_Categoria AS Categorias_tbCategorias, 
				M.id_Categoria AS Categorias_tbMenu,
				C.NombreCategoria
FROM tbCategorias C 
LEFT JOIN tbMenu M
	ON (M.id_Categoria = C.id_Categoria)
--WHERE M.id_Categoria IS NULL

--- Consultar tbMenu pero solo las que son de una categoria especifica
SELECT id_Menu, 
	   id_Categoria,
	   Producto, 
	   Precio, 
	   DescripcionP
FROM tbMenu
WHERE id_Categoria = 4

-- Para ver TODOS los registros de tbCategorias
SELECT id_Categoria,
		NombreCategoria, 
		Descripcion
FROM tbCategorias

-- Toda los datos de tbPedidos
SELECT id_Pedido,
	   id_Cliente,
	   id_Mesa, 
	   id_Empleado,
	   FechaCreacion
FROM tbPedidos

-- Consulta para ver los pedidos con todas sus descripciones
-- mesero, cliente, productos, etc

SELECT P.id_Pedido,		 C.Nombre AS NombreCliente,
	   Z.Zona,					     M.NumMesa,
	   ME.Producto,	
	   DP.Cantidad,					 DP.PrecioUnitario, 
	   DP.Desc_Pedido,				 EP.NombreEstado,
	   E.Nombre + ' '+ E.Apellido AS Mesero
FROM tbDetallePedido DP
INNER JOIN tbPedidos P 
	ON (DP.id_Pedido = P.id_Pedido)
INNER JOIN tbClientes C
	ON (P.id_Cliente = C.id_Cliente)
INNER JOIN tbMesa M
	ON (P.id_Mesa = M.id_Mesa)
INNER JOIN tbZona Z
	ON (M.id_Zona = Z.id_Zona)
INNER JOIN tbEmpleados E
	ON (P.id_Empleado = E.id_Empleado)
INNER JOIN tbEstadoPedido EP
	ON (P.id_EstadoPedido = EP.id_EstadoPedido)
INNER JOIN tbMenu ME
	ON (DP.id_Menu = ME.id_Menu)
ORDER BY P.id_Pedido;

-- Consulta para ver todos los datos de los pedidos pero VISUALIZAR los pedidos sin CLIENTES
SELECT P.id_Pedido,		 C.Nombre AS NombreCliente,
	   Z.Zona,					     M.NumMesa,
	   ME.Producto,	
	   DP.Cantidad,					 DP.PrecioUnitario, 
	   DP.Desc_Pedido,				 EP.NombreEstado,
	   E.Nombre + ' '+ E.Apellido AS Mesero
FROM tbDetallePedido DP
INNER JOIN tbPedidos P 
	ON (DP.id_Pedido = P.id_Pedido)
LEFT JOIN tbClientes C
	ON (P.id_Cliente = C.id_Cliente)
INNER JOIN tbMesa M
	ON (P.id_Mesa = M.id_Mesa)
INNER JOIN tbZona Z
	ON (M.id_Zona = Z.id_Zona)
INNER JOIN tbEmpleados E
	ON (P.id_Empleado = E.id_Empleado)
INNER JOIN tbEstadoPedido EP
	ON (P.id_EstadoPedido = EP.id_EstadoPedido)
INNER JOIN tbMenu ME
	ON (DP.id_Menu = ME.id_Menu)
ORDER BY P.id_Pedido;