INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);

Delete from Entregan where Cantidad = 0
ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ; 

INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), -10);

sp_helpconstraint Proyectos ;

sp_helpconstraint Entregan ;
sp_helpconstraint Proveedores ;
sp_helpconstraint Materiales ;
