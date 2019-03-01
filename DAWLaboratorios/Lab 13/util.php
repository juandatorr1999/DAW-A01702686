<?php
    function login($email, $password) {
        $usuario = "";
        
        if ($email == "mariana@ms.mx" && $password == "1234") {
            $usuario = "Mariana Sala";
        } 
        
        return $usuario;
    }
    
?>