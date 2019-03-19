SELECT P.Denominacion, SUM(E.Cantidad) as 'Entregas totales'
FROM Proyectos AS P, Entregan AS E
WHERE P.Numero=E.Numero AND (E.Fecha BETWEEN '01/01/1997' AND '31/12/1997')
GROUP BY P.Denominacion
ORDER BY 'Entregas totales' DESC

CREATE VIEW Entregas_total2 AS
(SELECT E.Clave, E.RFC, E.Numero, E.Fecha, E.Cantidad, M.Descripcion, M.Costo, M.PorcentajeImpuesto, (M.Costo*E.Cantidad)*(1+M.PorcentajeImpuesto/100) as TOTAL
FROM Entregan E, Materiales M
WHERE M.Clave = E.Clave);


--  La suma de las cantidades e importe total de todas las entregas realizadas durante el 97.
SELECT SUM(E.Cantidad) as CantidadTotal, SUM((M.Costo*E.Cantidad)*(1+M.PorcentajeImpuesto/100)) as GranTotal
FROM Entregan E, Materiales M
WHERE E.Clave = M.Clave AND YEAR(Fecha) = 1997;

/*
546.00	44789.4720000000
rows 1
*/

-- Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe
-- total de las entregas realizadas.

SELECT P.RazonSocial, SUM(E.Cantidad) as CantidadTotal, SUM((M.Costo*E.Cantidad)*(1+M.PorcentajeImpuesto/100)) as GranTotal
FROM Proveedores P, Entregan E, Materiales M
WHERE P.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY RazonSocial

/*
Alvin	5390.00	794295.2064000000
Cecoferre	6039.00	860441.9770000000
Comex	4895.00	801930.5980000000
rows 8
*/

-- Por cada material obtener la clave y descripción del material, la cantidad total entregada,
-- la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas
-- de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.

SELECT M.Clave, M.Descripcion, SUM(E.Cantidad) as CantidadTotal, MIN(E.Cantidad) as CantidadMin,
MAX(E.Cantidad) as CantidadMax, SUM((M.Costo*E.Cantidad)*(1+M.PorcentajeImpuesto/100)) as GranTotal
FROM Materiales M, Entregan E
WHERE E.Clave = M.Clave
GROUP BY M.Clave, M.Descripcion
HAVING AVG(Cantidad) > 400;

/*
1010	Varilla 4/32	1718.00	523.00	667.00	201560.9140000000
1040	Varilla 3/18	1349.00	263.00	546.00	220329.4720000000
1050	Varilla 4/34	1216.00	90.00	623.00	217268.8000000000
15 rows
*/
-- Para cada proveedor, indicar su razón social y mostrar la cantidad promedio de cada material
-- entregado, detallando la clave y descripción del material, excluyendo aquellos proveedores
-- para los que la cantidad promedio sea menor a 500.

SELECT P.RazonSocial, M.Clave, M.Descripcion, AVG(E.Cantidad) as 'Cantidad Promedio'
FROM Proveedores P, Materiales M, Entregan E
WHERE P.RFC = E.RFC AND E.Clave = M.Clave
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 500;

/*
Oviedo	1010	Varilla 4/32	572.666666
La Ferre	1100	Block	562.666666
Oviedo	1410	Pintura B1021	509.666666
3 rows
*/

-- Mostrar en una solo consulta los mismos datos que en la consulta anterior pero para dos grupos
-- de proveedores: aquellos para los que la cantidad promedio entregada es menor a 370 y aquellos
-- para los que la cantidad promedio entregada sea mayor a 450.

SELECT P.RazonSocial, M.Clave, M.Descripcion, AVG(E.Cantidad) as 'Cantidad Promedio'
FROM Proveedores P, Materiales M, Entregan E
WHERE P.RFC = E.RFC AND E.Clave = M.Clave
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 450 OR AVG(E.Cantidad) < 370;

/*
La fragua	1000	Varilla 3/16	142.000000
Oviedo	1010	Varilla 4/32	572.666666
La Ferre	1020	Varilla 3/17	356.000000
34 rows
*/

INSERT INTO Materiales VALUES (1001, 'Ladrillo de concreto', 60, 2.2);

INSERT INTO Materiales VALUES (1002, 'Tubo azul', 150, 2.17);

INSERT INTO Materiales VALUES (1003, 'Pintura C1111', 125, 2.8);

INSERT INTO Materiales VALUES (1004, 'Panel', 500, 2.4);

INSERT INTO Materiales VALUES (1005, 'Pintura B1111', 130, 2.7);

-- Clave y descripción de los materiales que nunca han sido entregados.

SELECT M.Clave, M.Descripcion
FROM Materiales M
WHERE M.Clave NOT IN (SELECT E.Clave FROM Entregan E);

/*
1001	Ladrillo de concreto
1002	Tubo azul
1003	Pintura C1111
1004	Panel
1005	Pintura B1111
5000	Varillas de prueba
6 rows
*/

-- Razón social de los proveedores que han realizado entregas tanto al proyecto 'Vamos México'
-- como al proyecto 'Querétaro Limpio'.

SELECT P.RazonSocial
FROM Proveedores P, Entregan E, Proyectos Pr
WHERE P.RFC = E.RFC AND E.Numero = Pr.Numero AND (Pr.Denominacion = 'Vamos Mexico' OR
Pr.Denominacion = 'Queretaro Limpio');

/*
La fragua
La fragua
La fragua
11 rows
*/

-- Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'.

SELECT M.Descripcion
FROM Materiales M
WHERE M.Clave NOT IN (SELECT E.Clave FROM Entregan E, Proyectos Pr WHERE Pr.Numero = E.Numero
AND Pr.Denominacion = 'CIT Yucatan');

/*
Varilla 3/16
Ladrillo de concreto
Tubo azul
rows 46
*/

-- Razón social y promedio de cantidad entregada de los proveedores cuyo promedio de cantidad
-- entregada es mayor al promedio de la cantidad entregada por el proveedor con el RFC
-- 'VAGO780901'.

SELECT P.RazonSocial, AVG(E.Cantidad) as 'Cantidad Promedio'
FROM Proveedores P, Entregan E
WHERE P.RFC = E.RFC
GROUP BY P.RazonSocial
HAVING AVG(E.Cantidad) > (SELECT AVG(E.Cantidad) FROM Proveedores P, Entregan E
WHERE P.RFC = E.RFC AND E.RFC = 'VAGO780901' GROUP BY P.RazonSocial);

/*
rows 0
Pues no hay ningun proveedor con ese RFC.
*/

-- RFC, razón social de los proveedores que participaron en el proyecto 'Infonavit Durango'
-- y cuyas cantidades totales entregadas en el 2000 fueron mayores a las cantidades totales
-- entregadas en el 2001.

SET DATEFORMAT dmy;

SELECT P.RFC, P.RazonSocial, SUM(E.Cantidad) as 'Cantidades Totales'
FROM Proveedores P, Entregan E, Proyectos Pr
WHERE P.RFC = E.RFC AND E.Numero = Pr.Numero AND Pr.Denominacion = 'Infonavit Durango' AND E.Fecha >
'31/12/1999' AND E.Fecha < '01/01/2001'
GROUP BY P.RFC, P.RazonSocial
HAVING SUM(E.Cantidad) > (SELECT SUM(E.Cantidad)
FROM Proveedores P, Entregan E, Proyectos Pr
WHERE P.RFC = E.RFC AND E.Numero = Pr.Numero AND Pr.Denominacion = 'Infonavit Durango' AND E.Fecha >
'31/12/2000' AND E.Fecha < '01/01/2002'
GROUP BY P.RFC, P.RazonSocial);

/*
rows 0
Pues el proveedor que entregaro a este proyecto en el 2000 no lo hizo en el 2001
*/