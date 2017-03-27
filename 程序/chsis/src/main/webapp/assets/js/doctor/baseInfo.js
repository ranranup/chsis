$(function(){
	/*导航颜色*/
	$("#navi_doctor_baseInfo").addClass('active');
	
	onloadModal();
})

function onloadModal() {
	$.getJSON('assets/json/diploma.json',function(data) {
		var diplomaCode = $('#diploma').attr('diplomaCode');
        for(var i in data) {
        	if(diplomaCode == data[i].value){
        		$('#diploma').append('<option value="' + data[i].value + '" selected>' + data[i].name + '</option>');
        	}else{
           		$('#diploma').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        	}	
        }
    });
    $.getJSON('assets/json/title.json',function(data) {
    	var titleCode = $('#title').attr('titleCode');
        for(var i in data) {
        	if(titleCode == data[i].value){
        		$('#title').append('<option value="' + data[i].value + '" selected>' + data[i].name + '</option>');
        	}else{
        		$('#title').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        	}
        }
    });
    
	//绑定点击修改基本信息按钮事件
	$('.btn-edit-baseInfo').on('click', function(){
		onEditBaseInfo();
	});
}

//打开修改医生基本信息的模态框
function onEditBaseInfo(){
	//绑定input元素失去焦点事件
	$('#editdoc-phone').on('blur', checkPhone_edit);
	
	//绑定保存按钮点击事件
	$('#editdoc-submit').on('click', function(){
		//表单校验
		var pass = checkPhone_edit();
		if(pass) {
			return true;
		}
		return false;
	});
	$('#editBaseInfo').modal();
}

function checkPhone_edit() {
	var phone = $('#editdoc-phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#editdoc-phoneGroup').removeClass('has-success');
		$('#editdoc-phoneGroup').addClass('has-error');
		$('#editdoc-phoneGroup .help-block').html('请输入电话');
		return false;
	} else {
		$('#editdoc-phoneGroup').removeClass('has-error');
		$('#editdoc-phoneGroup').addClass('has-success');
		$('#editdoc-phoneGroup .help-block').html('');
		return true;
	}
}