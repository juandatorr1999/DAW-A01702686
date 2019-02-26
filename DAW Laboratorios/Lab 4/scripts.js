function problema1(){

	var num = prompt("Ingrese el limite de numeros para desplegar cuadrados y cubos");
    var table = document.getElementById("tabla");
    table.innerHTML = "";
    var head = table.createTHead();
    var rowh = head.insertRow(0);
    var head1 = rowh.insertCell(0);
    var head2 = rowh.insertCell(1);
    var head3 = rowh.insertCell(2);
    head1.innerHTML = "Numero";
    head2.innerHTML = "Cuadrado";
    head3.innerHTML = "Cubo";
    var i = 1;
   while (i<=num){
        var row = table.insertRow(i);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        cell1.innerHTML = i;
        cell2.innerHTML = i * i;
        cell3.innerHTML = i * i * i;
        i = i + 1 ;
    };
}

function problema2(){

    var rand1=Math.round (Math.random()*101)
    var rand2=Math.round (Math.random()*101)
    var result = rand1+rand2;
    var inicio = Date.now();
	var guess = prompt("Ingrese la suma de los numeros "+rand1+"+"+rand2);
    var fin = Date.now();
    var tiempo = Math.round((fin - inicio) / 1000)
	if (guess == result) {
		document.getElementById("respuesta2").innerHTML =("Muy bien! Te demoraste "+tiempo+" segundos");
	}
	else document.getElementById("respuesta2").innerHTML =("Lo siento el resultado era " + result+".<br> Te demoraste "+tiempo+" segundos");
}

function problema3(){
	var size = prompt("Ingrese el tamaño del arreglo");
	var arg = [];
	while (size > 0){
		var num = prompt("Ingrese un número")
		arg.push(num);
		size--;
	}
	var ceros = 0;
	var negativos = 0;
	var positivos = 0;
	for (var i = 0; i < arg.length; i++) {
		if (arg[i] == 0)
			ceros++;
		else{
			if (arg[i] < 0)
				negativos++;
			if (arg[i] > 0)
				positivos++;
		}
	}
	document.getElementById("respuesta3").innerHTML ="Ceros: " + ceros+ "<br>Positivos: " + positivos +"<br>Negativos: " + negativos ;
}

function problema4(){
	var filas = prompt("Ingrese número de filas");
	var columnas = prompt("Ingrese número de columnas");
	var matriz = [];
	var arg = [];
	var tmp = columnas;
	var index = 0;
	while (filas > 0){
		while (columnas > 0){
			var num = prompt("Ingrese un número")
			arg.push(num);
			columnas--;
		}
		matriz[index] = arg;
		index++;
		columnas = tmp;
		arg = [];
		filas--;
	}
	var promedios = [];
	var mean = 0;
	for (var i = 0; i < matriz.length; i++) {
		for (var j = 0; j < matriz[i].length; j++) {
			mean = mean + parseInt(matriz[i][j]);
		}
		mean = mean / matriz[i].length;
		promedios.push(mean);
		mean = 0;
	}
	document.getElementById("respuesta4").innerHTML =promedios;

}

function problema5(){
	var num = prompt("Ingrese un número");
	var inv = 0;
	var tmp;
	while (num > 0){
		tmp = num % 10;
		inv = inv * 10 + tmp;
		num = Math.floor(num / 10);
	}
	document.getElementById("respuesta5").innerHTML =inv;
}

function problema6(){

        var accion_a = {
            Ticker: "APPLE",
            Precios: [12.1,12.25,12.2,12.4,12.7,12.6],
            Rendimientos: function rend() {
                var rendimientos = [];
                rendimientos [0]="N/A";
                for(i = 1; i < this.Precios.length; i++){
                    var a = this.Precios[i] / this.Precios[i - 1] - 1;
                    rendimientos[i] = Number(a.toFixed(4));
                }
                return rendimientos;
            },
            Promedio: function prom () {
               var promedio1 = 0;
                for(j = 1; j < accion_a.Rendimientos().length; j++){
                   promedio1 = promedio1 + accion_a.Rendimientos()[j];
               }

            var b = promedio1 / (accion_a.Rendimientos().length - 1);
            promedio1 = Number(b.toFixed(4));
            return promedio1;
            },
            Desviacion: function desv () {
            var sum = 0;
            for(h = 1; h < accion_a.Rendimientos().length; h++){
                   sum = sum + Math.pow(accion_a.Rendimientos()[h] - this.Promedio(),2);
               }
            var a = sum / ((accion_a.Rendimientos().length) - 2);
            var desvi = Number(a.toFixed(6));
            return desvi;
        }
        };
        document.getElementById("respuesta6").innerHTML = "La accion " + accion_a.Ticker + " con precios diarios de " + accion_a.Precios + " tiene rendimientos de " + accion_a.Rendimientos() + " lo que lleva a un rendimiento promedio diario de " + accion_a.Promedio() + " con una desviacion estandar diaria de " + accion_a.Desviacion();
}
