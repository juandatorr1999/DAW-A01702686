CREATE TABLE Clientes_Banca
(
  NoCuenta varchar(5) not null primary key,
  Nombre varchar(30) ,
  Saldo numeric(10,2)
)

CREATE TABLE Tipos_Movimiento
(
  ClaveM varchar(2) not null primary key,
  Descripcion varchar(30) ,

)

SET DATEFORMAT dmy

CREATE TABLE Movimientos
(
  NoCuenta varchar(5) foreign key references  clientes_banca(NoCuenta),
  ClaveM varchar(2) foreign key references  Tipos_movimiento(ClaveM),
  fecha datetime,
  Monto numeric(10,2),
  primary key (NoCuenta,ClaveM,fecha)
)
drop table Movimientos
drop table Tipos_Movimiento
drop table Clientes_Banca

BEGIN TRANSACTION PRUEBA1
INSERT INTO CLIENTES_BANCA VALUES('001', 'Manuel Rios Maldonado', 9000);
INSERT INTO CLIENTES_BANCA VALUES('002', 'Pablo Perez Ortiz', 5000);
INSERT INTO CLIENTES_BANCA VALUES('003', 'Luis Flores Alvarado', 8000);
COMMIT TRANSACTION PRUEBA1

SELECT * FROM CLIENTES_BANCA

BEGIN TRANSACTION PRUEBA2
INSERT INTO CLIENTES_BANCA VALUES('004','Ricardo Rios Maldonado',19000);
INSERT INTO CLIENTES_BANCA VALUES('005','Pablo Ortiz Arana',15000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Manuel Alvarado',18000);




SELECT * FROM CLIENTES_BANCA

--¿Que pasa cuando deseas realizar esta consulta? Se muestran las tablas como estaban
-- ¿Qué pasa cuando deseas realizar esta consulta? En la segunda sesion no se muestra la tabla con los nuevos datos mientras que en la primera si porque en la primera no se hizo el commit y en la primera se queda cargando

SELECT * FROM CLIENTES_BANCA where NoCuenta='001'

--Explica por qué ocurre dicho evento. Se queda cargando cuando
ROLLBACK TRANSACTION PRUEBA2
SELECT * FROM CLIENTES_BANCA

--¿Qué ocurrió y por qué? Cuando se hace el Rollback como estaba commited entonces lo que ocurrio fue que se fue para atras con los datos o los borro en la primera sesion

BEGIN TRANSACTION PRUEBA3
INSERT INTO TIPOS_MOVIMIENTO VALUES('A','Retiro Cajero Automatico');
INSERT INTO TIPOS_MOVIMIENTO VALUES('B','Deposito Ventanilla');
COMMIT TRANSACTION PRUEBA3

BEGIN TRANSACTION PRUEBA4
INSERT INTO MOVIMIENTOS VALUES('001','A',GETDATE(),500);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -500
WHERE NoCuenta='001'
COMMIT TRANSACTION PRUEBA4

SELECT * FROM CLIENTES_BANCA
-- Se cambio el saldo de los usuarios

BEGIN TRANSACTION PRUEBA5
INSERT INTO CLIENTES_BANCA VALUES('005','Rosa Ruiz Maldonado',9000);
INSERT INTO CLIENTES_BANCA VALUES('006','Luis Camino Ortiz',5000);
INSERT INTO CLIENTES_BANCA VALUES('001','Oscar Perez Alvarado',8000);

IF @@ERROR = 0
COMMIT TRANSACTION PRUEBA5
ELSE
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA5
END


-- ¿Para qué sirve el comando @@ERROR revisa la ayuda en línea? Revisa si hay un error al insertar los datos de la transaccion
--
-- ¿Qué hace la transacción? No hace nada porque ocurre un error tratando de meter la primary key 001,005 y 006 porque esta duplicada
--
-- ¿Hubo alguna modificación en la tabla? Explica qué pasó y por qué. No hubo modifiaciones en las tablas porque se hizo un rolback de la transaccion ya que hubo un erro de duplicado

--Una transacción que registre el retiro de una cajero. nombre del store procedure REGISTRAR_RETIRO_CAJERO que recibe 2 parámetros en NoCuenta y el monto a retirar.


CREATE PROCEDURE REGISTRAR_RETIRO_CAJERO @nocuenta varchar(5), @monto numeric(10,2)
AS

BEGIN TRANSACTION PRUEBA6
INSERT INTO MOVIMIENTOS VALUES(@nocuenta,'A',GETDATE(),@monto);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -@monto
WHERE NoCuenta=@nocuenta
if @@error=0
COMMIT TRANSACTION PRUEBA6
else
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA6
END

GO;

--Una transacción que registre el deposito en ventanilla. Nombre del store procedure REGISTRAR_DEPOSITO_VENTANILLA que recibe 2 parámetros en NoCuenta y el monto a depositar.

CREATE PROCEDURE REGISTRAR_DEPOSITO_VENTANILLA  @nocuenta varchar(5), @monto numeric(10,2)
AS

BEGIN TRANSACTION PRUEBA7
INSERT INTO MOVIMIENTOS VALUES(@nocuenta,'B',GETDATE(),@monto);
UPDATE CLIENTES_BANCA SET SALDO = SALDO -@monto
WHERE NoCuenta=@nocuenta
if @@error=0
COMMIT TRANSACTION PRUEBA7
else
BEGIN
PRINT 'A transaction needs to be rolled back'
ROLLBACK TRANSACTION PRUEBA7
END

GO;
