<?php
    require_once("biblio.php");
    require_once("model.php");

    session_start();
    include("_header.html");
    if ($_SERVER['REQUEST_METHOD'] == "POST"){
        if ($_POST["Accion"] != ""){
            
        } elseif ($_POST["Accion"] == ""){
            $nueva = 1;
        }
        
    }
    header("location:index.php");
    include("_footer.html");

?>