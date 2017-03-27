$(function(){
	/*导航颜色*/
	$("#navi_doctor_toCreate").addClass('active');
	
	//绑定input元素失去焦点事件
	$('#editImmune-vaccine').on('blur', checkVaccine_edit);
	
	//绑定保存按钮点击事件
	$('#editimmune-submit').on('click', function(){
		//表单校验
		var pass = checkVaccine_edit();
		
		if(pass == true) {
			return true;
		}
		return false;
	});
})

function checkVaccine_edit() {
	var vaccine = $('#editImmune-vaccine').val();
	if(vaccine == null || $.trim(vaccine) == '') {
		$('#editImmune-vaccineGroup').removeClass('has-success');
		$('#editImmune-vaccineGroup').addClass('has-error');
		$('#editImmune-vaccineGroup .help-block').html('请输入疫苗名称');
		return false;
	} else {
		$('#editImmune-vaccineGroup').removeClass('has-error');
		$('#editImmune-vaccineGroup').addClass('has-success');
		$('#editImmune-vaccineGroup .help-block').html('');
		return true;
	}
}