function problema1(){

	let num = prompt("Ingrese el limite de numeros para desplegar cuadrados y cubos");
    let table = document.getElementById("tabla");
    table.innerHTML = "";
    let head = table.createTHead();
    let rowh = head.insertRow(0);
    let head1 = rowh.insertCell(0);
    let head2 = rowh.insertCell(1);
    let head3 = rowh.insertCell(2);
    head1.innerHTML = "Numero";
    head2.innerHTML = "Cuadrado";
    head3.innerHTML = "Cubo";
    let i = 1;
   while (i<=num){
        let row = table.insertRow(i);
        let cell1 = row.insertCell(0);
        let cell2 = row.insertCell(1);
        let cell3 = row.insertCell(2);
        cell1.innerHTML = i;
        cell2.innerHTML = i * i;
        cell3.innerHTML = i * i * i;
        i = i + 1 ;
    };
}

function problema2(){

    let rand1=Math.round (Math.random()*101)
    let rand2=Math.round (Math.random()*101)
    let result = rand1+rand2;
    let inicio = Date.now();
	let guess = prompt("Ingrese la suma de los numeros "+rand1+"+"+rand2);
    let fin = Date.now();
    let tiempo = Math.round((fin - inicio) / 1000)
	if (guess == result) {
		document.getElementById("respuesta2").innerHTML =("Muy bien! Te demoraste "+tiempo+" segundos");
	}
	else document.getElementById("respuesta2").innerHTML =("Lo siento el resultado era " + result+".<br> Te demoraste "+tiempo+" segundos");
}

function problema3(){
	let size = prompt("Ingrese el tamaño del arreglo");
	let arg = [];
	while (size > 0){
		let num = prompt("Ingrese un número")
		arg.push(num);
		size--;
	}
	let ceros = 0;
	let negativos = 0;
	let positivos = 0;
	for (let i = 0; i < arg.length; i++) {
		if (arg[i] == 0)
			ceros++;
		else{
			if (arg[i] < 0)
				negativos++;
			if (arg[i] > 0)
				positivos++;
		}
	}
	document.write("Ceros: " + ceros);
	document.write("<br>Positivos: " + positivos);
	document.write("<br>Negativos: " + negativos);
}

function script4(){
	let filas = prompt("Ingrese número de filas");
	let columnas = prompt("Ingrese número de columnas");
	let matriz = [];
	let arg = [];
	let tmp = columnas;
	let index = 0;
	while (filas > 0){
		while (columnas > 0){
			let num = prompt("Ingrese un número")
			arg.push(num);
			columnas--;
		}
		matriz[index] = arg;
		index++;
		columnas = tmp;
		arg = [];
		filas--;
	}
	let promedios = [];
	let mean = 0;
	for (let i = 0; i < matriz.length; i++) {
		for (let j = 0; j < matriz[i].length; j++) {
			mean = mean + parseInt(matriz[i][j]);
		}
		mean = mean / matriz[i].length;
		promedios.push(mean);
		mean = 0;
	}
	document.write(promedios);
}

function script5(){
	let num = prompt("Ingrese un número");
	let inv = 0;
	let tmp;
	while (num > 0){
		tmp = num % 10;
		inv = inv * 10 + tmp;
		num = Math.floor(num / 10);
	}
	document.write(inv);
}

let car = {
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

function script6(){
	document.write(car.readSpecs());
}

function script7(){
	let brand = prompt("Nueva marca");
	let color = prompt("Nuevo color");
	car.modifySpecs(brand,color);
}
