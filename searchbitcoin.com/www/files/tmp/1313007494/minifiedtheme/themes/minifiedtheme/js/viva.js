$(document).ready(function () {	

	$("select, input:checkbox, input:radio, input:file").uniform();
	
	$('#nav li').hover(
		function () {
			//show its submenu
			$('ul', this).slideDown(100);

		}, 
		function () {
			//hide its submenu
			$('ul', this).slideUp(100);			
		}
	);
	
});

Cufon.replace('#nav li a',{hover:true,hoverables:{a:true}}); 
Cufon.replace('h3'); 
Cufon.replace('h4');
Cufon.replace('h1');
Cufon.replace('h2'); 