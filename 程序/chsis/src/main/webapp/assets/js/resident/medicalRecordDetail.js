$(function(){
	/* 导航颜色 */
	$("#navi_resident_medicalRecord").addClass('active');
	
	$('#checkReportPhoto').on('click', function() {
		var urlImg = $('#checkReportPhoto').attr('urlImg');
		$('#urlImg').attr('src',urlImg);
		$('#checkReportPhotoDetail').modal();
	})
})