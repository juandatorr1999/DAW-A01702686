CREATE TABLE Carrera(
  Codigo numeric (10) not null,
  Nombre char(70) not null
)

CREATE TABLE Alumno(
  Matricula numeric (10) not null,
  Nombre char(50) not null,
  Apellido char (50) not null,
  AMaterno char (50) not null,
  Codigo numeric (10) not null

)

ALTER TABLE Carrera add constraint llaveCodigo PRIMARY KEY (Codigo)
ALTER TABLE Alumno add constraint llaveMatricula PRIMARY KEY (Matricula)


ALTER TABLE Alumno add constraint cfcarreracodigo
  foreign key (Codigo) references Carrera(codigo) ;


INSERT INTO Carrera values (0203912, 'Ingenieria de Sistemas Computacionales') ;
INSERT INTO Carrera values (3829321, 'Ingenieria en Mecatronica') ;


INSERT INTO Alumno values(01702686, 'Juan David','Torres','Velasco',0203912) ;
INSERT INTO Alumno values(01703212, 'Andres','Pastrana','Llano',3829321) ;

Delete from Alumno where Matricula = 01703212;

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
where M.clave not in(Select distinct E.Clave
from  Entregan as E
where M.clave=E.Clave)

insert into materiales values (5000,'sss',34.32)
delete from materiales where clave=500