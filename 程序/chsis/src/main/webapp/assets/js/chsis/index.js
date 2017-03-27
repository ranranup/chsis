$(function(){
	/*导航颜色*/
	$("#navi_index").addClass('ser active');
	
	new WOW().init();
	
	$(".scroll").click(function(event){		
		event.preventDefault();
		$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
	});	
	
	$("#flexiselDemo4").flexisel({
		visibleItems: 3,
		animationSpeed: 1000,
		autoPlay: true,
		autoPlaySpeed: 3000,    		
		pauseOnHover: true,
		enableResponsiveBreakpoints: true,
    	responsiveBreakpoints: { 
    		portrait: { 
    			changePoint:480,
    			visibleItems: 1
    		}, 
    		landscape: { 
    			changePoint:640,
    			visibleItems: 2
    		},
    		tablet: { 
    			changePoint:768,
    			visibleItems: 3
    		}
    	}
    });
})