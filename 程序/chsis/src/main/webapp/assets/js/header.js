$(function(){
	$('#a-changePassword').on('click',function() {
		$('#changePassword').modal();
	});
	
	/*绑定提交按钮事件*/
	$('.header-btn-submit').on('click', function(){
		//表单校验
		var pass = header_validate();
		if(pass) {
			header_handleBeforeSubmit();
			header_submit();
		}
		return false;
	});
	
	/*绑定失焦事件*/
	$('#oldPassword').on('blur',checkOldPassword);
	$('#newPassword').on('blur',checkNewPassword);
	$('#newPassword2').on('blur',checkNewPassword2);
	
});

//异步修改密码，若成功提示修改成功
function header_submit(){
	$.ajax({
			url : "changePassword" ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			data:  $('#changePasswordForm').serialize() ,
			success : function(data) {
				if (data.result == "success") {
					$.confirm({
						keyboardEnabled : true,
						title : '修改成功',
						content : '您已成功修改密码！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
					$('#changePassword').modal('hide')
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '密码修改失败！',
						content : data.result,
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//表单校验
function header_validate() {
	if(checkOldPassword() && checkNewPassword() && checkNewPassword2()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function header_handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#newPassword');
	$password.val( $.base64('encode', $password.val()) );
}

function checkOldPassword() {
	var flag = false;
	var password = $('#oldPassword').val();
	console.log(password);
	if(password == null || $.trim(password).length < 6) {
		$('#oldPasswordGroup').removeClass('has-success');
		$('#oldPasswordGroup').addClass('has-error');
		$('#oldPasswordGroup .help-block').html('请输入原密码');
		return false;
	} else {
			$.ajax({
				url : "checkOldPassword/" + password ,
				type : "GET" ,
				cache : false , 
				async : false , 
				dataType : "json" ,
				success : function(data) {
					if(data.result == "no") {
						$('#oldPasswordGroup').removeClass('has-success');
						$('#oldPasswordGroup').addClass('has-error');
						$('#oldPasswordGroup .help-block').html('您输入的原密码不正确！');
					} else {
						$('#oldPasswordGroup').removeClass('has-error');
						$('#oldPasswordGroup').addClass('has-success');
						$('#oldPasswordGroup .help-block').html('');
						flag = true;
					}
				}
			});	
			return flag;
	}
}
function checkNewPassword() {
	var password = $('#newPassword').val();
	if(password == null || $.trim(password).length < 6) {
		$('#newPasswordGroup').removeClass('has-success');
		$('#newPasswordGroup').addClass('has-error');
		$('#newPasswordGroup .help-block').html('请输入至少6位密码');
		return false;
	} else {
		$('#newPasswordGroup').removeClass('has-error');
		$('#newPasswordGroup').addClass('has-success');
		$('#newPasswordGroup .help-block').html('');
		return true;
	}
}

function checkNewPassword2() {
	var repassword = $('#newPassword2').val();
	var password = $('#newPassword').val();
	if(repassword == null || $.trim(repassword).length < 6) {
		$('#newPassword2Group').removeClass('has-success');
		$('#newPassword2Group').addClass('has-error');
		$('#newPassword2Group .help-block').html('请输入确认密码');
		return false;
	} if(repassword != password) {
		$('#newPassword2Group').removeClass('has-success');
		$('#newPassword2Group').addClass('has-error');
		$('#newPassword2Group .help-block').html('您输入的两次密码不一致');
		return false;
	} else {
		$('#newPassword2Group').removeClass('has-error');
		$('#newPassword2Group').addClass('has-success');
		$('#newPassword2Group .help-block').html('');
		return true;
	}
}