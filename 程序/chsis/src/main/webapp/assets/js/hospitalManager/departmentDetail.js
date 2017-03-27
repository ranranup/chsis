var flag = false;
$(function() {
	/*导航颜色*/
	$("#navi_hospitalManager_department").addClass('active');
	
	//绑定点击添加医生按钮事件
	$('.btn-add-doctor').on('click', function(){
		onAddDoctor();
	});
	//绑定点击医生详情按钮事件
	$('.btn-doctorDetail').on('click',function(){
		onShowDoctor($(this).attr('uuid'));
	})
});

//提交前处理
function handleBeforeSubmit() {
	$.base64.utf8encode = true;
	var $password = $('#adddoc-password');
	$password.val( $.base64('encode', $password.val()) );
}


//打开添加医生模态框
function onAddDoctor() {
	
	//绑定input元素失去焦点事件
	$('#adddoc-userName').on('blur', checkUserName_add);
	$('#adddoc-password').on('blur', checkPassword_add);
	$('#adddoc-number').on('blur', checkNumber_add);
	$('#adddoc-name').on('blur', checkName_add);
	
	$('#input-id').on('fileloaded', function(event, file, previewId, index, reader) {
		$('#adddoc-imgGroup').removeClass('has-error');
		$('#adddoc-imgGroup').addClass('has-success');
		$('#adddoc-imgGroup .help-block').html('');
	   flag = true;
	});
	
	$('#adddoc-phone').on('blur', checkPhone_add);
	$('#adddoc-description').on('blur', checkDescription_add);
	
	//绑定保存按钮点击事件
	$('.adddoc-submit').on('click', function(){
		//表单校验
		var pass = validate_adddoc();
		if($('#input-id').fileinput('getFileStack').length==0){
			$('#adddoc-imgGroup').removeClass('has-success');
			$('#adddoc-imgGroup').addClass('has-error');
			$('#adddoc-imgGroup .help-block').html('请上传医生照片');
			return false;
		} else {
			$('#adddoc-imgGroup').removeClass('has-error');
			$('#adddoc-imgGroup').addClass('has-success');
			$('#adddoc-imgGroup .help-block').html('');
		}
		if(pass && flag == true) {
			handleBeforeSubmit();
			return true;
		}
		return false;
	});
	
	$('#addDoctor').modal();
}

//删除医生操作
function deleteDoctor(uuid,DepartmentUuid) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除医生',
			content : '此操作会删除该医生，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "doctor/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该医生！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = 'department/detail/' + DepartmentUuid;
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

//打开医生详情模态框
function onShowDoctor(uuid) {
	//异步获取医生信息
	$.ajax({
			url : "doctor/get/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#doctor-number').html(data.doctor.number);
					$('#doctor-name').html(data.doctor.name);
					$('#doctor-photo').attr('src',data.doctor.photo);
					$('#doctor-sex').html(data.doctor.sex == 0?'男':'女');
					$('#doctor-phone').html(data.doctor.phone);
					$('#doctor-diploma').html(getDiploma(data.doctor.diploma));
					$('#doctor-title').html(getTitle(data.doctor.title));
					$('#doctor-description').html(data.doctor.description);
					
					//打开模态框
					$('#doctorDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的家庭成员不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

function getDiploma(num){
	switch(num) {
		case 0 : return '专科';
		case 1 : return '本科';
		case 2 : return '硕士';
		case 3 : return '博士';
		case 4 : return '博士后';
		default : return '未知';
	}
}
function getTitle(num){
	switch(num) {
		case 0 : return '护士';
		case 1 : return '医师';
		case 2 : return '主治医师';
		case 3 : return '副主任医师';
		case 4 : return '主任医师';
		default : return '未知';
	}
}

//表单校验
function validate_adddoc() {
	if(checkUserName_add() && checkPassword_add() && checkNumber_add() && checkName_add() && checkPhone_add() && checkDescription_add()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function checkUserName_add() {
	var userName = $('#adddoc-userName').val();
	if(userName == null || $.trim(userName) == '') {
		$('#adddoc-userNameGroup').removeClass('has-success');
		$('#adddoc-userNameGroup').addClass('has-error');
		$('#adddoc-userNameGroup .help-block').html('请输入医生的用户名');
		return false;
	} else {
		$('#adddoc-userNameGroup').removeClass('has-error');
		$('#adddoc-userNameGroup').addClass('has-success');
		$('#adddoc-userNameGroup .help-block').html('');
		return true;
	}
}
function checkPassword_add() {
	var password = $('#adddoc-password').val();
	if(password == null || $.trim(password) == '' || password.length < 6) {
		$('#adddoc-passwordGroup').removeClass('has-success');
		$('#adddoc-passwordGroup').addClass('has-error');
		$('#adddoc-passwordGroup .help-block').html('请输入6位以上的密码');
		return false;
	} else {
		$('#adddoc-passwordGroup').removeClass('has-error');
		$('#adddoc-passwordGroup').addClass('has-success');
		$('#adddoc-passwordGroup .help-block').html('');
		return true;
	}
}

function checkNumber_add() {
	var flag = false;
	var number = $('#adddoc-number').val();
	if(number == null || $.trim(number) == '') {
		$('#adddoc-numberGroup').removeClass('has-success');
		$('#adddoc-numberGroup').addClass('has-error');
		$('#adddoc-numberGroup .help-block').html('请输入医生编号');
		return false;
	} else {
		$.ajax({
			url : "doctor/checkNumberUnique/" + number ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#adddoc-numberGroup').removeClass('has-success');
					$('#adddoc-numberGroup').addClass('has-error');
					$('#adddoc-numberGroup .help-block').html('医生编号已存在');
				} else {
					$('#adddoc-numberGroup').removeClass('has-error');
					$('#adddoc-numberGroup').addClass('has-success');
					$('#adddoc-numberGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}

function checkName_add() {
	var name = $('#adddoc-name').val();
	if(name == null || $.trim(name) == '') {
		$('#adddoc-nameGroup').removeClass('has-success');
		$('#adddoc-nameGroup').addClass('has-error');
		$('#adddoc-nameGroup .help-block').html('请输入医生姓名');
		return false;
	} else {
		$('#adddoc-nameGroup').removeClass('has-error');
		$('#adddoc-nameGroup').addClass('has-success');
		$('#adddoc-nameGroup .help-block').html('');
		return true;
	}
}
function checkPhone_add() {
	var phone = $('#adddoc-phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#adddoc-phoneGroup').removeClass('has-success');
		$('#adddoc-phoneGroup').addClass('has-error');
		$('#adddoc-phoneGroup .help-block').html('请输入医生电话');
		return false;
	} else {
		$('#adddoc-phoneGroup').removeClass('has-error');
		$('#adddoc-phoneGroup').addClass('has-success');
		$('#adddoc-phoneGroup .help-block').html('');
		return true;
	}
}

function checkDescription_add() {
	var description = $('#adddoc-description').val();
	if(description == null || $.trim(description) == '') {
		$('#adddoc-descriptionGroup').removeClass('has-success');
		$('#adddoc-descriptionGroup').addClass('has-error');
		$('#adddoc-descriptionGroup .help-block').html('请输入医生描述');
		return false;
	} else {
		$('#adddoc-descriptionGroup').removeClass('has-error');
		$('#adddoc-descriptionGroup').addClass('has-success');
		$('#adddoc-descriptionGroup .help-block').html('');
		return true;
	}
}

//删除科室操作
function deleteDepartment(uuid,url) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除科室',
			content : '此操作会删除该科室，该科室下的所有医生也将被删除，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "department/delete/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该科室！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = url;
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
