<?php
    require_once("biblio.php");
    require_once("model.php");

    session_start();

    if (isset($_SESSION["usuario"])){
        include("_header.html");
        include("_formulario.html");

    } else if ($_SERVER['REQUEST_METHOD'] == "POST"){

            // Limpieza de variables
            if (isset($_POST["usuario"])) {
                $_POST["usuario"] = clean($_POST["usuario"]);
            }
            if (isset($_POST["pass"])) {
                $_POST["pass"] = clean($_POST["pass"]);
            }

            //Validacion de que los campos no esten en blanco
            if ($_POST["usuario"] == "juandatorr123" && $_POST["pass"] == "123"){
                $error_login = "<div class = 'required'>*Favor llenar los campos de usuario y contraseña</div><br>";
                include("_header.html");
                include("_login.html");
            } else {
                //Validacion de usuario y contraseña
                if (login($_POST["usuario"],$_POST["pass"]) != false)
                    {
                    $_SESSION["usuario"] = $_POST["usuario"];
                    include("_header.html");
                    include("_formulario.html");
                } else {
                    $error_login = "<div class = 'required'>*El usuario o la contraseña son incorrectos</div><br>";
                    include("_header.html");
                    include("_login.html");
                }
            }

        } else {
            include("_header.html");
            include("_login.html");
        }
        include("_footer.html");

?>
