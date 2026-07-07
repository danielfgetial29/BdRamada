/** SCRIPT DE CONSULTAS  consultas_busquedas.sql **/
/*
	---* En este script registrare las diferentes consultas que realice a mis tablas
	incluire inner join, lef, right join y diferentes consultas que vaya aprendiendo
*/

-- consulta para ver las zonas y todas las mesas de tbMesas
SELECT M.id_Zona, Z.Zona, M.NumMesa
FROM tbMesa M
INNER JOIN tbZona Z ON (M.id_zona = Z.id_Zona)
--WHERE Z.id_Zona = 9
order by id_Zona

-- Consulta para ver TODOS los registros de tbMenu
SELECT id_Menu, 
	   id_Categoria,
	   Producto, 
	   Precio, 
	   DescripcionP
FROM tbMenu

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