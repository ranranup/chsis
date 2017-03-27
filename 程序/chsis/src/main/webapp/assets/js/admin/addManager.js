$(function(){
	/*导航颜色*/
	$("#navi_admin_manager").addClass('active');
	
	$("#type-select").change(function(){
		if($("#type-select").val() == 0){
			$("#div-hide").show();
		} else {
			$("#div-hide").hide();
		}
	});
	
	/*绑定失焦事件*/
	$('#userName').on('blur',checkUserName);
	$('#password').on('blur',checkPassword);
	$('#name').on('blur',checkName);
	$('#phone').on('blur',checkPhone);
	
	
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
	if(checkUserName() && checkPassword() && checkName() && checkPhone() ) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#password');
	$password.val( $.base64('encode', $password.val()) );
}

function checkUserName() {
	var userName = $('#userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#userNameGroup').removeClass('has-success');
		$('#userNameGroup').addClass('has-error');
		$('#userNameGroup .help-block').html('请输入用户名');
		return false;
	} else {
		return $.ajax({
			url : "manager/checkUserNameUnique/" + userName ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#userNameGroup').removeClass('has-success');
					$('#userNameGroup').addClass('has-error');
					$('#userNameGroup .help-block').html('用户名已存在');
					return false;
				} else {
					$('#userNameGroup').removeClass('has-error');
					$('#userNameGroup').addClass('has-success');
					$('#userNameGroup .help-block').html('');
					return true;
				}
			} 
		});
	}
}

function checkPassword() {
	var password = $('#password').val();
	if(password == null || $.trim(password).length < 6) {
		$('#passwordGroup').removeClass('has-success');
		$('#passwordGroup').addClass('has-error');
		$('#passwordGroup .help-block').html('请输入至少6位密码');
		return false;
	} else {
		$('#passwordGroup').removeClass('has-error');
		$('#passwordGroup').addClass('has-success');
		$('#passwordGroup .help-block').html('');
		return true;
	}
}

function checkName() {
	var name = $('#name').val();
	if(name == null || $.trim(name) == '') {
		$('#nameGroup').removeClass('has-success');
		$('#nameGroup').addClass('has-error');
		$('#nameGroup .help-block').html('请输入姓名');
		return false;
	} else {
		$('#nameGroup').removeClass('has-error');
		$('#nameGroup').addClass('has-success');
		$('#nameGroup .help-block').html('');
		return true;
	}
}

function checkPhone() {
	var phone = $('#phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#phoneGroup').removeClass('has-success');
		$('#phoneGroup').addClass('has-error');
		$('#phoneGroup .help-block').html('请输入联系电话');
		return false;
	} else {
		$('#phoneGroup').removeClass('has-error');
		$('#phoneGroup').addClass('has-success');
		$('#phoneGroup .help-block').html('');
		return true;
	}
}