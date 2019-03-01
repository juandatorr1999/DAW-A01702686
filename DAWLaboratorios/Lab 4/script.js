function cuadradosycubos(){
	let num = prompt("Ingresa el numero de cuadrados y cubos limite para desplegar");
	let i = 1;
	while (num > 0){
		document.write("Numero: "+i + "Cuadrado: " + i*i + "Cubo: " + i*i*i + "<br>");
		i++;
		num--;
	}
}

function suma_random(){
	let rand1 = Math.floor((Math.random()*100));
	let rand2=Math.floor(Math.random()*100);
	let rand=rand1+rand2;
	let guess = prompt("Ingrese la suma entre "+rand1+"+"+rand2);
	if (guess === rand) {
		document.write("Muy bien!");
	}
	else document.write("Que mal era " + rand);
}

function pos_neg(){
	let tam = prompt("Ingresa el tamaño del arreglo");
	let arg = [];
	while (tam > 0){
		let num = prompt("Ingrese un número")
		arg.push(num);
		tam--;
	}
	let ceros = 0;
	let negativos = 0;
	let positivos = 0;
	for (let i = 0; i < arg.length; i++) {
		if (arg[i] === 0)
			ceros++;
		else if(arg[i] < 0){
			
				negativos++;
		}else{
		    positivos++;
		}
		
	}
	document.write("Ceros: " + ceros);
	document.write("<br>Positivos: " + positivos);
	document.write("<br>Negativos: " + negativos);
}

function promedios(){
	let filas = prompt("Ingrese número de filas");
	let columnas = prompt("Ingrese número de columnas");
	let matriz = [];
	let arg = [];
	let tmp = columnas;
	let index = 0;
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
	document.write(promedios);
}

function inverso(){
	var num = prompt("Ingrese un número");
	var inv = 0;
	var tmp;
	while (num > 0){
		tmp = num % 10;
		inv = inv * 10 + tmp;  
		num = Math.floor(num / 10);
	}
	document.write(inv);
}

var car = {
	brand: "Ferrari",
	color: "Red",
	readSpecs: function (){
		return this.brand + " " + this.color;
	},
	modifySpecs: function (brand, color){
		this.brand = brand;
		this.color = color;
	}
};

function getter(){
	document.write(car.readSpecs());
}

function setter(){
	var brand = prompt("Nueva marca");
	var color = prompt("Nuevo color");
	car.modifySpecs(brand,color);
}