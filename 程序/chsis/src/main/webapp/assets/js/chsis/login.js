$(function(){
	/*绑定失焦事件*/
	$('#username').on('blur',checkUsername);
	$('#password').on('blur',checkPassword);
	
	/*绑定提交按钮事件*/
	$('#submit').on('click', function(){
		//表单校验
		var pass = validate();
		if(pass) {
			handleBeforeSubmit();
			return true;
		}
		return false;
	});
})

//表单校验
function validate() {
	if(checkUsername() && checkPassword()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	var roleType = $('input[name="roleType"]:checked').val();
	if(roleType == "resident") {
		$password.val( $.base64('encode', $password.val() + '% ') );
	} else if(roleType == "doctor"){
		$password.val( $.base64('encode', $password.val() + '%doctor') );
	}
}

function checkUsername() {
	var username = $('#username').val();
	if(username == null || $.trim(username) == '') {
		$('#msg').html('请输入用户名');
		return false;
	} else {
		$('#msg').html('');
		return true;
	}
}

function checkPassword() {
	var password = $('#password').val();
	if(password == null || $.trim(password).length < 6) {
		$('#msg').html('请输入至少6位密码');
		return false;
	} else {
		$('#msg').html('');
		return true;
	}
}

