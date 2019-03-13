  Select DISTINCT Descripcion
  FROM Materiales  , Proyectos , Entregan
  WHERE Materiales.Clave = Entregan.clave and Proyectos.numero=Entregan.Numero and Proyectos.Denominacion='Teleton Qro'
  Order by descripcion




SET DATEFORMAT DMY
SELECT P.Denominacion, SUM(E.Cantidad) as 'Entregas totales'
FROM Proyectos AS P, Entregan AS E
WHERE P.Numero=E.Numero AND (E.Fecha BETWEEN '01/01/2010' AND '31/12/2010')
GROUP BY P.Denominacion
ORDER BY 'Entregas totales' DESC

Select Clave, Descripcion
From Materiales as M
where M.clave not in(Select distinct M.Clave
from Materiales as M, Entregan as E
where M.clave=E.Clave)


select clave,Descripcion
from Materiales as M
where not exists(select * from entregan as e where m.clave=e.clave)

