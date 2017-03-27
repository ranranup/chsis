$(function() {
	/*导航颜色*/
	$("#navi_admin_hospital").addClass('active');
	
	//绑定点击添加医院按钮事件
	$('.btn-add-hospital').on('click', function(){
		onAddHospital();
	});
});

//打开添加医院模态框
function onAddHospital() {
	//获取所有input元素并清空内容
	var inputs = $('#addHospital input');
	for(var i=0; i<inputs.length-1; i++) {
		$(inputs[i]).attr('value','');
	}
	$("textarea[name='description']").html('');
	
	//绑定input元素失去焦点事件
	$('#addh-number').on('blur', checkNumber_add);
	$('#addh-name').on('blur', checkName_add);
	$('#addh-address').on('blur', checkAddress_add);
	$('#addh-description').on('blur', checkDescription_add);
	
	//绑定保存按钮点击事件
	$('#addh-submit').on('click', function(){
		//表单校验
		var pass = validate_addh();
		if(pass) {
			return true;
		}
		return false;
	});
	
	$('#addHospital').modal();
}

//表单校验
function validate_addh() {
	if(checkNumber_add() && checkName_add() && checkAddress_add() && checkDescription_add()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function checkNumber_add() {
	var flag = false;
	var number = $('#addh-number').val();
	if(number == null || $.trim(number) == '') {
		$('#addh-numberGroup').removeClass('has-success');
		$('#addh-numberGroup').addClass('has-error');
		$('#addh-numberGroup .help-block').html('请输入医院编号');
		return false;
	} else {
		$.ajax({
			url : "hospital/checkNumberUnique/" + number ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#addh-numberGroup').removeClass('has-success');
					$('#addh-numberGroup').addClass('has-error');
					$('#addh-numberGroup .help-block').html('医院编号已存在');
				} else {
					$('#addh-numberGroup').removeClass('has-error');
					$('#addh-numberGroup').addClass('has-success');
					$('#addh-numberGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}

function checkName_add() {
	var name = $('#addh-name').val();
	if(name == null || $.trim(name) == '') {
		$('#addh-nameGroup').removeClass('has-success');
		$('#addh-nameGroup').addClass('has-error');
		$('#addh-nameGroup .help-block').html('请输入医院名称');
		return false;
	} else {
		$('#addh-nameGroup').removeClass('has-error');
		$('#addh-nameGroup').addClass('has-success');
		$('#addh-nameGroup .help-block').html('');
		return true;
	}
}

function checkAddress_add() {
	var address = $('#addh-address').val();
	if(address == null || $.trim(address) == '') {
		$('#addh-addressGroup').removeClass('has-success');
		$('#addh-addressGroup').addClass('has-error');
		$('#addh-addressGroup .help-block').html('请输入医院地址');
		return false;
	} else {
		$('#addh-addressGroup').removeClass('has-error');
		$('#addh-addressGroup').addClass('has-success');
		$('#addh-addressGroup .help-block').html('');
		return true;
	}
}
function checkDescription_add() {
	var description = $('#addh-description').val();
	if(description == null || $.trim(description) == '') {
		$('#addh-descriptionGroup').removeClass('has-success');
		$('#addh-descriptionGroup').addClass('has-error');
		$('#addh-descriptionGroup .help-block').html('请输入医院地址');
		return false;
	} else {
		$('#addh-descriptionGroup').removeClass('has-error');
		$('#addh-descriptionGroup').addClass('has-success');
		$('#addh-descriptionGroup .help-block').html('');
		return true;
	}
}

//删除医院操作
function deleteHospital(uuid) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除医院',
			content : '此操作会删除该医院，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "hospital/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该医院！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = 'hospital/list'
						} else {
							$.confirm({
										keyboardEnabled : true,
										title : '操作失败',
										content : data.result,
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
						}
					}
				});
			}
	});
}
