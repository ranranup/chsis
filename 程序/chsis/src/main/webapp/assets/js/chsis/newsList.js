$(function() {
	new WOW().init();
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});

	/* 导航颜色 */
	$("#navi_news").addClass('ser active');
	
	$('#select_type').on('change', function() {
		var url = $(this).val();
		window.location.href = url;
	});
})
