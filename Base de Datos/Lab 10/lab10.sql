CREATE TABLE Materiales
(
  Clave numeric(5),
  Descripcion varchar(50),
  Costo numeric(8,2)
)

create table Proveedores
    (
        RFC char(13),
        RazonSocial varchar(50)
    )

create table Proyectos(
    numero numeric(5),
    Denominacion varchar(50)
    )

create table Entregan
    (
    Clave numeric (5),
    RFC numeric(13),
    numero numeric(5),
    fecha datetime,
    cantidad numeric(8,2)
    )


sp_help materiales

//Borrar tabla
DROP TABLE Materiales

//Verificar si hay tablas
select * from sysobjects where xtype='U'
