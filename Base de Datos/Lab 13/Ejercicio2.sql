INSERT INTO Materiales values(1000, 'xxx', 1000)

Delete from Materiales where Clave = 1000 and Costo = 1000

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave)


INSERT INTO Materiales values(1000, 'xxx', 1000)

sp_helpconstraint materiales 

ALTER TABLE Proveedores add constraint llaveRFC PRIMARY KEY (RFC)
ALTER TABLE Proyectos add constraint llaveNumero PRIMARY KEY (Numero)

ALTER TABLE Entregan add constraint llaveEntregan PRIMARY KEY (Clave,RFC,Numero,Fecha)

sp_helpconstraint entregan 