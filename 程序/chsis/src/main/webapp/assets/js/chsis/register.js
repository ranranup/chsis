$(function(){
	$.ajax({
			url : "community/getCommunityType",
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "success") {
					for(var i in data.communities) {
	           			$('#community').append('<option value="' + data.communities[i].uuid + '">' + data.communities[i].name + '</option>');
			        }
				} else {
					alert('失败');
				}
			} 		
		});
	 
	/*绑定失焦事件*/
	$('#userName').on('blur',checkUserName);
	$('#password').on('blur',checkPassword);
	$('#repassword').on('blur',checkRePassword);
	$('#name').on('blur',checkName);
	$('#idNo').on('blur',checkIdNo);
	$('#familyNumber').on('blur',checkFamilyNumber);
	
	$('#c-userName').on('blur',c_checkUserName);
	$('#c-password').on('blur',c_checkPassword);
	$('#c-repassword').on('blur',c_checkRePassword);
	$('#c-name').on('blur',c_checkName);
	$('#c-idNo').on('blur',c_checkIdNo);
	$('#c-phone').on('blur',c_checkPhone);
	$('#c-familyPhone').on('blur',c_checkFamilyPhoneGroup);
	$('#c-familyAddress').on('blur',c_checkFamilyAddressGroup);
	
	/*注册时已知家庭编号，绑定提交按钮事件*/
	$('#join-submit').on('click', function(){
		//表单校验
		var pass = validate();
		if(pass) {
			handleBeforeSubmit();
			joinSubmit();
		}
		return false;
	});
	
	/*注册时新建家庭，绑定提交按钮事件*/
	$('#create-submit').on('click', function(){
		//表单校验
		var c_pass = c_validate();
		if(c_pass) {
			c_handleBeforeSubmit();
			createSubmit();
		}
		return false;
	});
});

//异步加入家庭注册，若成功跳转到登陆界面
function joinSubmit(){
	$.ajax({
			url : "register_joinFamily" ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			data:  $('#joinForm').serialize() ,
			success : function(data) {
				if (data.result == "success") {
					$.confirm({
						keyboardEnabled : true,
						title : '注册成功',
						content : '您已注册成功，请登陆！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
					setTimeout(function(){
						window.location.href = 'login' ;
					},3000);
				} else {
						$.confirm({
							keyboardEnabled : true,
							title : '注册失败，请重新注册',
							content : data.result,
							confirmButtonClass : 'btn-info',
							cancelButtonClass : 'btn-danger',
							autoClose : 'confirm|3000'
						});
					}
			} 
		});
}

//异步创建家庭注册，若成功跳转到登陆界面
function createSubmit(){
	$.ajax({
			url : "register_createFamily" ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			data:  $('#createForm').serialize() ,
			success : function(data) {
				if (data.result == "success") {
					$.confirm({
						keyboardEnabled : true,
						title : '注册成功',
						content : '您已注册成功，请登陆！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
					setTimeout(function(){
						window.location.href = 'login' ;
					},3000);
				} else {
						$.confirm({
							keyboardEnabled : true,
							title : '注册失败，请重新注册',
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
function validate() {
	if(checkUserName() && checkPassword() && checkRePassword() && checkName() && checkIdNo() && checkFamilyNumber()) {
		return true;
	} else {
		return false;
	}
}

//表单校验
function c_validate() {
	if(c_checkUserName() && c_checkPassword() && c_checkRePassword() && c_checkName() && c_checkIdNo() && c_checkFamilyPhoneGroup && c_checkFamilyAddressGroup) {
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

//提交前处理
function c_handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#c-password');
	$password.val( $.base64('encode', $password.val()) );
}

function checkUserName() {
	var flag = false;
	var userName = $('#userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#userNameGroup').removeClass('has-success');
		$('#userNameGroup').addClass('has-error');
		$('#userNameGroup .help-block').html('请输入您的用户名');
		return false;
	} else {
		$.ajax({
			url : "checkUserNameUnique/" + userName ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#userNameGroup').removeClass('has-success');
					$('#userNameGroup').addClass('has-error');
					$('#userNameGroup .help-block').html('您输入的用户名已存在');
				} else {
					$('#userNameGroup').removeClass('has-error');
					$('#userNameGroup').addClass('has-success');
					$('#userNameGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}	
	return flag;
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

function checkRePassword() {
	var repassword = $('#repassword').val();
	var password = $('#password').val();
	if(repassword == null || $.trim(repassword).length < 6) {
		$('#repasswordGroup').removeClass('has-success');
		$('#repasswordGroup').addClass('has-error');
		$('#repasswordGroup .help-block').html('请输入确认密码');
		return false;
	} if(repassword != password) {
		$('#repasswordGroup').removeClass('has-success');
		$('#repasswordGroup').addClass('has-error');
		$('#repasswordGroup .help-block').html('您输入的两次密码不一致');
		return false;
	} else {
		$('#repasswordGroup').removeClass('has-error');
		$('#repasswordGroup').addClass('has-success');
		$('#repasswordGroup .help-block').html('');
		return true;
	}
}

function checkName() {
	var name = $('#name').val();
	if(name == null || $.trim(name) == '') {
		$('#nameGroup').removeClass('has-success');
		$('#nameGroup').addClass('has-error');
		$('#nameGroup .help-block').html('请输入您的姓名');
		return false;
	} else {
		$('#nameGroup').removeClass('has-error');
		$('#nameGroup').addClass('has-success');
		$('#nameGroup .help-block').html('');
		return true;
	}
}

function checkIdNo() {
	var flag = false;
	var idNo = $('#idNo').val();
	if(idNo == null || $.trim(idNo) == '') {
		$('#idNoGroup').removeClass('has-success');
		$('#idNoGroup').addClass('has-error');
		$('#idNoGroup .help-block').html('请输入您的身份证号');
		return false;
	} else if(idNo != null && $.trim(idNo) != '') {
		var re = /^[1-9]\d{16}[\d|x]$/i;
		if(!re.test(idNo)) {
			$('#idNoGroup').removeClass('has-success');
			$('#idNoGroup').addClass('has-error');
			$('#idNoGroup .help-block').html('您输入的身份证号格式不正确');
			return false;
		} else {
			$.ajax({
				url : "checkIdNoUnique/" + idNo ,
				type : "GET" ,
				cache : false , 
				async : false , 
				dataType : "json" ,
				success : function(data) {
					if(data.result == "exist") {
						$('#idNoGroup').removeClass('has-success');
						$('#idNoGroup').addClass('has-error');
						$('#idNoGroup .help-block').html('您输入的身份证号已存在');
					} else {
						$('#idNoGroup').removeClass('has-error');
						$('#idNoGroup').addClass('has-success');
						$('#idNoGroup .help-block').html('');
						flag = true;
					}
				} 
			});
		}
	}
	return flag;
}

function checkFamilyNumber() {
	var flag = false;
	var familyNumber = $('#familyNumber').val();
	if(familyNumber == null || $.trim(familyNumber) == '') {
		$('#familyNumberGroup').removeClass('has-success');
		$('#familyNumberGroup').addClass('has-error');
		$('#familyNumberGroup .help-block').html('请输入家庭编号');
		return false;
	} else {
		$.ajax({
			url : "checkNumberUnique/" + familyNumber ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result != "exist") {
					$('#familyNumberGroup').removeClass('has-success');
					$('#familyNumberGroup').addClass('has-error');
					$('#familyNumberGroup .help-block').html('您输入的家庭编号不存在');
				} else {
					$('#familyNumberGroup').removeClass('has-error');
					$('#familyNumberGroup').addClass('has-success');
					$('#familyNumberGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}
function c_checkUserName() {
	var flag = false;
	var userName = $('#c-userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#c-userNameGroup').removeClass('has-success');
		$('#c-userNameGroup').addClass('has-error');
		$('#c-userNameGroup .help-block').html('请输入您的用户名');
		return false;
	} else {
		$.ajax({
			url : "checkUserNameUnique/" + userName ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#c-userNameGroup').removeClass('has-success');
					$('#c-userNameGroup').addClass('has-error');
					$('#c-userNameGroup .help-block').html('您输入的用户名已存在');
				} else {
					$('#c-userNameGroup').removeClass('has-error');
					$('#c-userNameGroup').addClass('has-success');
					$('#c-userNameGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}	
	return flag;
}

//校验密码
function c_checkPassword() {
	var password = $('#c-password').val();
	if(password == null || $.trim(password).length < 6) {
		$('#c-passwordGroup').removeClass('has-success');
		$('#c-passwordGroup').addClass('has-error');
		$('#c-passwordGroup .help-block').html('请输入至少6位密码');
		return false;
	} else {
		$('#c-passwordGroup').removeClass('has-error');
		$('#c-passwordGroup').addClass('has-success');
		$('#c-passwordGroup .help-block').html('');
		return true;
	}
}

//校验两次输入的密码是否一致
function c_checkRePassword() {
	var repassword = $('#c-repassword').val();
	var password = $('#c-password').val();
	if(repassword == null || $.trim(repassword).length < 6) {
		$('#c-repasswordGroup').removeClass('has-success');
		$('#c-repasswordGroup').addClass('has-error');
		$('#c-repasswordGroup .help-block').html('请输入确认密码');
		return false;
	} if(repassword != password) {
		$('#c-repasswordGroup').removeClass('has-success');
		$('#c-repasswordGroup').addClass('has-error');
		$('#c-repasswordGroup .help-block').html('您输入的两次密码不一致');
		return false;
	} else {
		$('#c-repasswordGroup').removeClass('has-error');
		$('#c-repasswordGroup').addClass('has-success');
		$('#c-repasswordGroup .help-block').html('');
		return true;
	}
}

//校验姓名
function c_checkName() {
	var name = $('#c-name').val();
	if(name == null || $.trim(name) == '') {
		$('#c-nameGroup').removeClass('has-success');
		$('#c-nameGroup').addClass('has-error');
		$('#c-nameGroup .help-block').html('请输入您的姓名');
		return false;
	} else {
		$('#c-nameGroup').removeClass('has-error');
		$('#c-nameGroup').addClass('has-success');
		$('#c-nameGroup .help-block').html('');
		return true;
	}
}

//校验身份证号是否存在
function c_checkIdNo() {
	var flag = false;
	var idNo = $('#c-idNo').val();
	if(idNo == null || $.trim(idNo) == '') {
		$('#c-idNoGroup').removeClass('has-success');
		$('#c-idNoGroup').addClass('has-error');
		$('#c-idNoGroup .help-block').html('请输入您的身份证号');
		return false;
	} else if(idNo != null && $.trim(idNo) != '') {
		var re = /^[1-9]\d{16}[\d|x]$/i;
		if(!re.test(idNo)) {
			$('#c-idNoGroup').removeClass('has-success');
			$('#c-idNoGroup').addClass('has-error');
			$('#c-idNoGroup .help-block').html('您输入的身份证号格式不正确');
			return false;
		} else {
			$.ajax({
				url : "checkIdNoUnique/" + idNo ,
				type : "GET" ,
				cache : false , 
				async : false , 
				dataType : "json" ,
				success : function(data) {
					if(data.result == "exist") {
						$('#c-idNoGroup').removeClass('has-success');
						$('#c-idNoGroup').addClass('has-error');
						$('#c-idNoGroup .help-block').html('您输入的身份证号已存在');
					} else {
						$('#c-idNoGroup').removeClass('has-error');
						$('#c-idNoGroup').addClass('has-success');
						$('#c-idNoGroup .help-block').html('');
						flag = true;
					}
				} 
			});
		}
	}
	return flag;
}

//校验电话
function c_checkPhone() {
	var phone = $('#c-phone').val();
	if(phone != null && $.trim(phone) != '') {
		var re = /^1[3|4|5|7|8]\d{9}$/i;
		if(!re.test(phone)) {
			$('#c-phoneGroup').removeClass('has-success');
			$('#c-phoneGroup').addClass('has-error');
			$('#c-phoneGroup .help-block').html('您输入的电话号码格式不正确');
			return false;
		} else {
			$('#c-phoneGroup').removeClass('has-error');
			$('#c-phoneGroup').addClass('has-success');
			$('#c-phoneGroup .help-block').html('');
			return true;
		}
	} else {
		$('#c-phoneGroup').removeClass('has-success');
		$('#c-phoneGroup').addClass('has-error');
		$('#c-phoneGroup .help-block').html('请输入您的联系电话');
		return false;
	}
}


//校验家庭电话
function c_checkFamilyPhoneGroup() {
	var phone = $('#c-familyPhone').val();
	if(phone != null && $.trim(phone) != '') {
		var re = /^1[3|4|5|7|8]\d{9}$/i;
		if(!re.test(phone)) {
			$('#c-familyPhoneGroup').removeClass('has-success');
			$('#c-familyPhoneGroup').addClass('has-error');
			$('#c-familyPhoneGroup .help-block').html('您输入的电话号码格式不正确');
			return false;
		} else {
			$('#c-familyPhoneGroup').removeClass('has-error');
			$('#c-familyPhoneGroup').addClass('has-success');
			$('#c-familyPhoneGroup .help-block').html('');
			return true;
		}
	} else {
		$('#c-familyPhoneGroup').removeClass('has-success');
		$('#c-familyPhoneGroup').addClass('has-error');
		$('#c-familyPhoneGroup .help-block').html('请输入您的家庭电话');
		return false;
	}
}

//校验家庭地址
function c_checkFamilyAddressGroup() {
	var address = $('#c-familyAddress').val();
	if(address == null || $.trim(address) == '') {
		$('#c-familyAddress').removeClass('has-success');
		$('#c-familyAddress').addClass('has-error');
		$('#c-familyAddress .help-block').html('请输入您的家庭地址');
		return false;
	} else {
		$('#c-familyAddress').removeClass('has-error');
		$('#c-familyAddress').addClass('has-success');
		$('#c-familyAddress .help-block').html('');
		return true;
	}
}