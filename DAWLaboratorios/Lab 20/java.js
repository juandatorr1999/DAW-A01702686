
$(document).ready(() => {
	var opacitySecondDiv = 0;

window.addEventListener("scroll", Scroll);
window.addEventListener("resize", Resize);

function Resize () {
	var size = window.innerWidth; 
	if (size > 1900) {
		document.body.style.backgroundSize = "100%";
	}
	else {
		document.body.style.backgroundSize = "auto";
	}
}
$('#buttonLogin').on('click', () => {
  $('#loginDiv').toggle();
});
$('.otro').on('click', () => {
  $('.loginDiv').toggle();
});

function scrollTo () {
	console.log("si");
}

function Scroll () {
	var top = document.getElementById("header");
	var ypos = window.pageYOffset;

	if (ypos > 300) {
		document.getElementById("header").className = "navBarB";
		document.getElementById("buttonLogin").className = "buttonChanged";
		document.getElementById("imagen").src = "appleBlack.png";
	}
	else {
		document.getElementById("header").className = "navBar";
		document.getElementById("buttonLogin").className = "otro";
		document.getElementById("imagen").src = "appleWhite.png";
	}
	if (this.opacitySecondDiv < 0.9){
		this.opacitySecondDiv += 0.05;
		document.getElementById("secondDiv").style.opacity = this.opacitySecondDiv.toString();
	}
	if (ypos > 500) {
		this.opacitySecondDiv = 1; 
		document.getElementById("secondDiv").style.opacity = this.opacitySecondDiv.toString();
	}

	if (ypos == 0) {
		this.opacitySecondDiv = 0;
		document.getElementById("secondDiv").style.opacity = this.opacitySecondDiv.toString();
	}
	
}
function onScrollFunction () {
	console.log(document.body.scrollTop);

}
});
