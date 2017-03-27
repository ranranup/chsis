$(function(){
	//鼠标滑过时，首页里“明星科室”后面的(Star Department)显示，鼠标移出隐藏
	$(".star-department").hover(
		function() {
			$(".wrapText").show();
		},
		function(){
			$(".wrapText").hide();	
		}
	);

	//鼠标滑过时，首页里“科室”一栏，显示详细信息，鼠标移出隐藏
	$(".department-bott").hover(
		function() {
			$(this).children(".wrapper").show('400', function(){});
		},
		function(){
			$(this).children(".wrapper").hide('fast', function(){});	
		}
	);

	//鼠标滑过时，医院简介里的“明星科室”后面的(Star Department)显示，鼠标移出隐藏
	$(".department-bott").hover(
		function() {
			$(this).children(".wrapper").show('400', function(){});
		},
		function(){
			$(this).children(".wrapper").hide('fast', function(){});	
		}
	);

	//鼠标滑过时，首页里“科室”一栏，显示详细信息，鼠标移出隐藏
	$(".service-right").hover(
		function() {
			$(this).children(".wrapper").show('400', function(){});
		},
		function(){
			$(this).children(".wrapper").hide('fast', function(){});	
		}
	);

});