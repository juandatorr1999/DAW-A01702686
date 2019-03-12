<?php
    require_once("biblio.php");
    
    if($_SERVER['REQUEST_METHOD'] == "POST"){
    
        if (isset($_POST["nombre"])) {
            $_POST["nombre"] = clean($_POST["nombre"]);
        }
        if (isset($_POST["apellido"])) {
            $_POST["apellido"] = clean($_POST["apellido"]);
        }
        if (isset($_POST["correo"])) {
            $_POST["correo"] = clean($_POST["correo"]);
        }
        if (isset($_POST["ticker"])) {
            $_POST["ticker"] = clean($_POST["ticker"]);
        }
        if (isset($_POST["mercado"])) {
            $_POST["mercado"] = clean($_POST["mercado"]);
        }
        if (isset($_POST["precios"])) {
            $_POST["precios"] = clean($_POST["precios"]);
        }

        if ($_POST["nombre"] == "" || $_POST["apellido"] == "" || 
        $_POST["correo"] == "" || $_POST["ticker"] == "" || 
        $_POST["precios"] == ""){
            if ($_POST["mercado"] != ""){
                $valor_mercado = 'value = "'.$_POST["mercado"].'"';
            }
            if ($_POST["nombre"] == ""){
                $error_nombre = "Por favor incluye tu nombre";
            } else {
               $valor_nombre = 'value = "'.$_POST["nombre"].'"'; 
            }
            if ($_POST["apellido"] == ""){
                $error_apellido = "Por favor incluye tu apellido";
            } else {
                $valor_apellido = 'value = "'.$_POST["apellido"].'"';
            }
            if ($_POST["correo"] == ""){
                $error_correo = "Por favor incluye tu correo";
            } else {
                $valor_correo = 'value = "'.$_POST["correo"].'"';
            }
            if ($_POST["ticker"] == ""){
                $error_ticker = "Por favor incluye el ticker";
            } else {
                $valor_ticker = 'value = "'.$_POST["ticker"].'"';
            }
            if ($_POST["precios"] == ""){
                $error_precios = "Por favor incluye los precios";
            } else {
                $valor_precios = 'value = "'.$_POST["precios"].'"';
            }
            include("_contenido.html");
        } else {
            $valor_nombre = 'value = "'.$_POST["nombre"].'"';
            $valor_apellido = 'value = "'.$_POST["apellido"].'"';
            $valor_correo = 'value = "'.$_POST["correo"].'"';
            $valor_ticker = 'value = "'.$_POST["ticker"].'"';
            $valor_mercado = 'value = "'.$_POST["mercado"].'"';
            $valor_precios = 'value = "'.$_POST["precios"].'"';
            
            $ticker = $_POST["ticker"];
            
            $precios = explode(",",$_POST["precios"]);
            
            for($i = 0; $i < count($precios); $i++){
                $a = $precios[$i];
                $float = floatval($a);
                $precios[$i] = $float;
            }
            
            $x = $precios;
          
            $rendimientos = [];
            $rendimientos [0]= null;
            for($i = 1; $i < count($x); $i++){
                $a = $x[$i] / $x[$i - 1] - 1;
                $rendimientos[$i] = round($a,4);
            }
            
            $promedio1 = 0;
            for ($j = 1; $j < count($rendimientos); $j++){
                $promedio1 = $promedio1 + $rendimientos[$j];
            } 
            $b = $promedio1 / (count($rendimientos) - 1);
            $promedio1 = round($b,4);    

            $sum = 0;
            for($h = 1; $h < count($rendimientos); $h++){
                $sum = $sum + (($rendimientos[$h] - $promedio1)*($rendimientos[$h] - $promedio1));
               } 
            $a = $sum / (count($rendimientos) - 2);
            $a = sqrt($a);
            $desvi = round($a,4);
            
            foreach($x as $d){
                    $elementosp = $elementosp.", ".$d;
            }
            $elementosp = substr($elementosp, 2);
            foreach($rendimientos as $d){
                    $elementosr = $elementosr.", ".$d;
            }
            $elementosr = substr($elementosr, 4);
            $tabla = "<tr><td><b>Ticker</b></td><td class = 'mayusculas'>".$ticker."</td></tr><tr> <td> <b>Precios</b> </td><td>".$elementosp."</td></tr><tr><td><b>Redimientos</b></td><td> ".$elementosr."</td></tr><tr><td><b> Rendimiento promedio</b></td><td> " .$promedio1. " </td></tr><tr><td><b>Desviacion estandar</b></td><td>" .$desvi. "</td></tr>";
            include("_contenido.html");
        }
    } else {
        include("_contenido.html");
    }
?>

