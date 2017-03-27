$(function(){
	/*导航颜色*/
	$("#navi_doctor_toCreate").addClass('active');
	
	var flag = false;
	$('.btn-edit').on('click', function() {
		onEdit();
	})
})

//打开编辑体检信息的模态框
function onEdit(){
	//绑定input元素失去焦点事件
	$('#edithealth-description').on('blur', checkDescription_edit);
	$('#input-id').on('fileloaded', function(event, file, previewId, index, reader) {
		$('#edithealth-imgGroup').removeClass('has-error');
		$('#edithealth-imgGroup').addClass('has-success');
		$('#edithealth-imgGroup .help-block').html('');
	   flag = true;
	});
	
	//绑定保存按钮点击事件
	$('#edithealth-submit').on('click', function(){
		//表单校验
		var pass = checkDescription_edit();
		if($('#input-id').fileinput('getFileStack').length==0){
			$('#edithealth-imgGroup').removeClass('has-success');
			$('#edithealth-imgGroup').addClass('has-error');
			$('#edithealth-imgGroup .help-block').html('请上传报告单');
			flag = false;
		} else {
			$('#edithealth-imgGroup').removeClass('has-error');
			$('#edithealth-imgGroup').addClass('has-success');
			$('#edithealth-imgGroup .help-block').html('');
			flag = true
		}
		if(pass && flag == true) {
			return true;
		}
		return false;
	});
	$('#editHealthReport').modal();
}

function checkDescription_edit() {
	var description = $('#edithealth-description').val();
	if(description == null || $.trim(description) == '') {
		$('#edithealth-descriptionGroup').removeClass('has-success');
		$('#edithealth-descriptionGroup').addClass('has-error');
		$('#edithealth-descriptionGroup .help-block').html('请输入体检描述');
		return false;
	} else {
		$('#edithealth-descriptionGroup').removeClass('has-error');
		$('#edithealth-descriptionGroup').addClass('has-success');
		$('#edithealth-descriptionGroup .help-block').html('');
		return true;
	}
}