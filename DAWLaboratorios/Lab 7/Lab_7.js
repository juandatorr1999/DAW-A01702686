var p1 = document.getElementById("p1");
p1.onmouseover = function azul(){
    p1.style.color = "blue";
};
p1.onmouseout = function negro(){
    p1.style.color = "black";
};
var p2 = document.getElementById("p2");
p2.onmousedown = function subrayar(){
    p2.style.textDecoration = "underline";
}
p2.onmouseup = function quitarsubrayar(){
    p2.style.textDecoration = "none";
}
var p3 = document.getElementById("p3");
p3.ondblclick = function cambiofuente(){
    p3.style.fontFamily = "serif";
}
var ayuda = document.getElementById("ayuda");
var p4 = document.getElementById("p4");
p4.onmouseover = function aparece(){
    ayuda.style.visibility = "visible";
}
p4.onmouseout = function desaparece(){
    ayuda.style.visibility = "hidden";
}
document.getElementById("boton1").onclick = function tiempo(){setTimeout(alerta,5000)}
function alerta(){
    alert("Esto es una alerta generada con setTimeout")
}
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}