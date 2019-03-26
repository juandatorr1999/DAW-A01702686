<?php
function clean($x){
    $x = trim($x);
    $x = htmlspecialchars($x);
    $x = stripcslashes($x);
    return $x;

}

function cinco(){
                $ticker = "Coca Cola";
                $x = [10,10.1,10.08,10.03,10.05];
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
                    $elementosp = $elementosp." ".$d;
                }
            foreach($rendimientos as $d){
                    $elementosr = $elementosr." ".$d;
                }

            echo "<br>La accion ".$ticker." con precios diarios de".$elementosp." tiene rendimientos de ".$elementosr." lo que lleva a un rendimiento promedio diario de " .$promedio1. " con una desviacion estandar diaria de " .$desvi;

            }

?>
