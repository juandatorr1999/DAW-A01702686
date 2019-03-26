<?php

    function connect(){
        $conexion = mysqli_connect("localhost","root","","lab14");
        if($conexion == NULL) {
            die("Error al conectarse con la base de datos");
        }
        return $conexion;
    };

    function disconnect($conexion) {
        mysqli_close($conexion);
    }
  function login($usuario, $password) {
        $conexion = connect();

        $usuario = $conexion->real_escape_string($usuario);
        $password = $conexion->real_escape_string($password);

         //Specification of the SQL query
        $query='SELECT usuario FROM Usuarios WHERE usuario = "'.$usuario.'" AND contrasena = "'.$password.'"';
         // Query execution; returns identifier of the result group

        $results = $conexion->query($query);
         // cycle to explode every line of the results
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) {
        // Options: MYSQLI_NUM to use only numeric indexes
        //          MYSQLI_ASSOC to use only name (string) indexes
        //          MYSQLI_BOTH, to use both

            mysqli_free_result($results);
            disconnect($conexion);
            return $row["usuario"];
        }
        // it releases the associated results
        mysqli_free_result($results);
        disconnect($conexion);
        return false;
    }

function getcotizaciones(){
     $conexion = connect();

        $cotizaciones = '<div class = "row justify-content-center"> <div class = "col-5"> <table class = "table text-center table-hover"><tr><th>Accion</th><th>Precio</th><th>Actualizar</th></tr>';

         //Specification of the SQL query
        $query='SELECT Accion, Precio FROM Cotizaciones';
         // Query execution; returns identifier of the result group

        $results = $conexion->query($query);
         // cycle to explode every line of the results
        while ($row = mysqli_fetch_array($results, MYSQLI_BOTH)) {

            $cotizaciones .= '<form method="POST" action="editar_controller.php"><tr><td name = "Accion">'.$row["Accion"].'</td><td>'.$row["Precio"].'</td><td><button name = "Accion" value = "'.$row["Accion"].'" class = "btn btn-primary" type ="submit">Actualizar</button></tr>';
               
        }

        $cotizaciones .= '<th></th><th><button name = "Accion" value = "" class = "btn btn-primary">+Nuevo Registro</button></th><th></th></table> </form></div> </div>';
        // it releases the associated results
        mysqli_free_result($results);
        disconnect($conexion);
        return $cotizaciones;

}




?>
