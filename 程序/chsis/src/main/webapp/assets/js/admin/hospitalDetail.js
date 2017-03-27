$(function() {
	/*导航颜色*/
	$("#navi_admin_hospital").addClass('active');
	
	//绑定点击添加医院管理员按钮事件
	$('.btn-add-manager').on('click', function(){
		onAddManager($(this).attr('uuid'));
	});
	//绑定修改医院管理员按钮事件
	$('.btn-edit-hospitalManager').on('click', function(){
		onEditManager($(this).attr('uuid'));
	})
});

//删除医院管理员操作
function deleteHospitalManager(uuid,hospitalUuid) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除医院管理员',
			content : '此操作会删除该医院管理员，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "manager/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除医院管理员！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = 'hospital/detail/' + hospitalUuid;
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

//打开添加医院管理员模态框
function onAddManager(hospitalUuid) {
	//获取所有input元素并清空内容
	var inputs = $('#addHospitalManager input');
	for(var i=0; i<inputs.length-1; i++) {
		$(inputs[i]).attr('value','');
	}
	//获取hidden元素设置hospitalUuid
	var hidden = $('#addHospitalManager input[type="hidden"]')[0];
	$(hidden).attr('value', hospitalUuid);
	
	//绑定input元素失去焦点事件
	$('#addm-userName').on('blur', checkUserName_add);
	$('#addm-password').on('blur', checkPassword_add);
	$('#addm-name').on('blur', checkName_add);
	$('#addm-phone').on('blur', checkPhone_add);
	
	//绑定保存按钮点击事件
	$('#addm-submit').on('click', function(){
		//表单校验
		var pass = validate_addm();
		if(pass) {
			handleBeforeSubmit();
			return true;
		}
		return false;
	});
	
	$('#addHospitalManager').modal();
}

//打开修改医院管理员模态框
function onEditManager(uuid) {
	//异步获取管理员信息
	$.ajax({
			url : "manager/detail/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#editm-uuid').attr('value', data.manager.uuid);
					$('#editm-userName').attr('value', data.manager.userName);
					$('#editm-name').attr('value', data.manager.name);
					$('#editm-phone').attr('value', data.manager.phone);
					//绑定input元素失去焦点事件
					$('#editm-name').on('blur', checkName_edit);
					$('#editm-phone').on('blur', checkPhone_edit);
					//绑定保存按钮点击事件
					$('#editm-submit').on('click', function(){
						//表单校验
						var pass = validate_editm();
						return pass;
					});
					$('#editHospitalManager').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的医院管理员不存在！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
	
}

//表单校验
function validate_addm() {
	if(checkUserName_add() && checkPassword_add() && checkName_add() && checkPhone_add()) {
		return true;
	} else {
		return false;
	}
}

//表单校验
function validate_editm() {
	if(checkName_edit() && checkPhone_edit()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#addm-password');
	$password.val( $.base64('encode', $password.val()) );
}

function checkUserName_add() {
	var flag = false;
	var userName = $('#addm-userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#addm-userNameGroup').removeClass('has-success');
		$('#addm-userNameGroup').addClass('has-error');
		$('#addm-userNameGroup .help-block').html('请输入用户名');
		return false;
	} else {
		$.ajax({
			url : "manager/checkUserNameUnique/" + userName ,
			type : "GET" ,
			cache : false , 
			async : false ,
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#addm-userNameGroup').removeClass('has-success');
					$('#addm-userNameGroup').addClass('has-error');
					$('#addm-userNameGroup .help-block').html('用户名已存在');
				} else {
					$('#addm-userNameGroup').removeClass('has-error');
					$('#addm-userNameGroup').addClass('has-success');
					$('#addm-userNameGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}

function checkPassword_add() {
	var password = $('#addm-password').val();
	if(password == null || $.trim(password).length < 6) {
		$('#addm-passwordGroup').removeClass('has-success');
		$('#addm-passwordGroup').addClass('has-error');
		$('#addm-passwordGroup .help-block').html('请输入至少6位密码');
		return false;
	} else {
		$('#addm-passwordGroup').removeClass('has-error');
		$('#addm-passwordGroup').addClass('has-success');
		$('#addm-passwordGroup .help-block').html('');
		return true;
	}
}

function checkName_add() {
	var name = $('#addm-name').val();
	if(name == null || $.trim(name) == '') {
		$('#addm-nameGroup').removeClass('has-success');
		$('#addm-nameGroup').addClass('has-error');
		$('#addm-nameGroup .help-block').html('请输入姓名');
		return false;
	} else {
		$('#addm-nameGroup').removeClass('has-error');
		$('#addm-nameGroup').addClass('has-success');
		$('#addm-nameGroup .help-block').html('');
		return true;
	}
}

function checkPhone_add() {
	var phone = $('#addm-phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#addm-phoneGroup').removeClass('has-success');
		$('#addm-phoneGroup').addClass('has-error');
		$('#addm-phoneGroup .help-block').html('请输入电话');
		return false;
	} else {
		$('#addm-phoneGroup').removeClass('has-error');
		$('#addm-phoneGroup').addClass('has-success');
		$('#addm-phoneGroup .help-block').html('');
		return true;
	}
}

function checkName_edit() {
	var name = $('#editm-name').val();
	if(name == null || $.trim(name) == '') {
		$('#editm-nameGroup').removeClass('has-success');
		$('#editm-nameGroup').addClass('has-error');
		$('#editm-nameGroup .help-block').html('请输入姓名');
		return false;
	} else {
		$('#editm-nameGroup').removeClass('has-error');
		$('#editm-nameGroup').addClass('has-success');
		$('#editm-nameGroup .help-block').html('');
		return true;
	}
}

function checkPhone_edit() {
	var phone = $('#editm-phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#editm-phoneGroup').removeClass('has-success');
		$('#editm-phoneGroup').addClass('has-error');
		$('#editm-phoneGroup .help-block').html('请输入电话');
		return false;
	} else {
		$('#editm-phoneGroup').removeClass('has-error');
		$('#editm-phoneGroup').addClass('has-success');
		$('#editm-phoneGroup .help-block').html('');
		return true;
	}
}

