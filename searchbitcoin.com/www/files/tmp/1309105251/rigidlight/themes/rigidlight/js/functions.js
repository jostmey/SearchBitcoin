
Cufon.replace(".simple-logo-block .largeWhite, .cta .ctaTitle, #mainShell h1, #mainShell h2, #mainShell h3", { fontFamily: "WhitneyCondensed" });
Cufon.replace(".powerSlide .largeText", { fontFamily: "WhitneyCondensed", textShadow: "2px 2px #000" });
Cufon.replace(".simple-logo-block .largeYellow", { fontFamily: "WhitneyCondensedSemiBold" });
Cufon.replace("header nav>ul>li>a", { fontFamily: "WhitneyCondensedSemiBold", textShadow: "1px 1px #fff" });

$(document).ready(function() {
						   
	//Add a Last Item class to a few things
	$("nav ul li:last-child").addClass("lastItem");
			
	//cool little animation on sub li hover
	$("header nav>ul>li>ul>li>a").hover(
		function(){
			$(this).animate({ left: "5px" }, 200 );
		},
		function(){
			$(this).animate({ left: "0px" }, 200 );
		}
	);
	
	//give order to ctas
	var ctaOrder = 1
	$("#ctaShell .cta").each(function(){
		$(this).addClass("cta" + ctaOrder);
		ctaOrder++
	});
	
	//add spacers to footer nav
	$("footer nav ul li:not(:first-child)").before("<li>&nbsp;| </li>");

});