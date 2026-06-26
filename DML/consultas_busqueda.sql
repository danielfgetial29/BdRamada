/** SCRIPT DE CONSULTAS  **/
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