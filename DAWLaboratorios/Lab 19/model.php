<?php

    function connect(){
        $conexion = mysqli_connect("localhost","root","","lab19");
        if($conexion == NULL) {
            die("Error al conectarse con la base de datos");
        }
        return $conexion;
    };

    function disconnect($conexion) {
        mysqli_close($conexion);
    }
  function resultado() {
        $conexion = connect();

         //Specification of the SQL query
        $query='SELECT Nombre FROM Datos';
         // Query execution; returns identifier of the result group
        $results = mysqli_query($conexion, $query);

        $rows = [];
        while($row = mysqli_fetch_array($results,MYSQLI_BOTH))
            {
                $rows[] = $row['Nombre'];
            }
        mysqli_free_result($results);
        disconnect($conexion);
        return $rows;
    }
?>
