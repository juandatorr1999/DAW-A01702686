<?php
    require_once("biblio.php");
    require_once("model.php");

    session_start();
    include("_header.html");

    if ($_SERVER['REQUEST_METHOD'] == "POST"){ 
      if (isset($_POST["Accion"]) && $_POST["Accion"] != ""){
            $conexion = connect();
            $accion = $_POST["Accion"];
            $query='SELECT id,Precio FROM Cotizaciones WHERE Accion = "'.$_POST["Accion"].'"';         
            $results = $conexion->query($query);
            $row = mysqli_fetch_array($results, MYSQLI_BOTH);
            $precio = $row["Precio"];
            mysqli_free_result($results);
            disconnect($conexion);
            $actualizar = 1;
            include("_editar.html");
        } elseif (isset($_POST["Accion"]) && $_POST["Accion"] == ""){
            $nueva = 1;
            include("_editar.html");
        } elseif ($_POST["Nueva_Accion"] != "" || $_POST["Nuevo_Precio"] != "") {
            $conexion = connect();
            $query1='SELECT id,Precio FROM Cotizaciones WHERE Accion = "'.$_POST["Nueva_Accion"].'"';         
            $results1 = $conexion->query($query1);
            $row1 = mysqli_fetch_array($results1, MYSQLI_BOTH);
            $id1 = $row1["id"];
            mysqli_free_result($results1);
            disconnect($conexion); 
            if ($id1 == NULL){
                $accion = $_POST["Nueva_Accion"];
                $precio = $_POST["Nuevo_Precio"];
                $conexion = connect();
                // insert command specification 
                $query='INSERT INTO Cotizaciones (Accion,Precio) VALUES (?,?) ';
                // Preparing the statement 
                if (!($statement = $conexion->prepare($query))) {
                    disconnect($conexion); 
                    die("Preparation failed: (" . $mysql->errno . ") " . $mysql->error);
                }
                // Binding statement params 
                $accion = $conexion->real_escape_string($accion);
                $precio = $conexion->real_escape_string($precio);

                if (!$statement->bind_param("ss", $accion, $precio)) {
                    disconnect($conexion); 
                    die("Parameter vinculation failed: (" . $statement->errno . ") " . $statement->error); 
                }
                 // Executing the statement
                 if (!$statement->execute()) {
                    disconnect($conexion); 
                    return false;
                } 
                disconnect($conexion);
            } else {
                $accion = $_POST["Nueva_Accion"];
                $precio = $_POST["Nuevo_Precio"];
                $conexion = connect();
                $accion = $conexion->real_escape_string($accion);
                $precio = $conexion->real_escape_string($precio);
                var_dump ($id1);
                var_dump($precio);
                $query='UPDATE Cotizaciones SET Precio = "'.$precio.'" WHERE Accion = "'.$accion.'";';
                $conexion->query($query);
                disconnect($conexion);
                
            }
            header("location:index.php");
        } elseif ($_POST["Nueva_Accion"] == "" || $_POST["Nuevo_Precio"] == "") {
            $nueva = 1;
            $error = "Favor llenar ambos campos";
            include("_editar.html");
        } 
    } else {include("_formulario.html");}
    include("_footer.html");

?>