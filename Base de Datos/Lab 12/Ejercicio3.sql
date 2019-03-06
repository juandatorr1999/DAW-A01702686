SELECT * from Materiales ;
SELECT * from Proyectos ;
SELECT * from Proveedores ;

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0) ;

Delete from Entregan where Clave = 0

ALTER TABLE entregan add constraint cfentreganclave
  foreign key (clave) references materiales(clave);

INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0) ;

ALTER TABLE entregan add constraint cfentreganrfc
  foreign key (rfc) references Proveedores(rfc);

ALTER TABLE entregan add constraint cfentregannumero
  foreign key (Numero) references Proyectos(numero);

sp_helpconstraint Entregan

