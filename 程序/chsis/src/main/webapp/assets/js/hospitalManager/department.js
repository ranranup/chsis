$(function() {
	/*导航颜色*/
	$("#navi_hospitalManager_department").addClass('active');
	
	//绑定点击添加科室按钮事件
	$('.btn-add-department').on('click', function(){
		onAddDepartment();
	});
});

//打开添加科室模态框
function onAddDepartment() {
	//获取所有input元素并清空内容
	var inputs = $('#addDepartment input');
	for(var i=0; i<inputs.length-1; i++) {
		$(inputs[i]).attr('value','');
	}
	$("textarea[name='description']").html('');
	
	//绑定input元素失去焦点事件
	$('#adddep-number').on('blur', checkNumber_add);
	$('#adddep-name').on('blur', checkName_add);
	$('#adddep-description').on('blur', checkDescription_add);
	
	//绑定保存按钮点击事件
	$('#adddep-submit').on('click', function(){
		//表单校验
		var pass = validate_addh();
		if(pass) {
			return true;
		}
		return false;
	});
	
	$('#addDepartment').modal();
}

//表单校验
function validate_addh() {
	if(checkNumber_add() && checkName_add() && checkDescription_add()) {
		return true;
	} else {
		return false;
	}
}

//提交前处理
function checkNumber_add() {
	var flag = false;
	var number = $('#adddep-number').val();
	if(number == null || $.trim(number) == '') {
		$('#adddep-numberGroup').removeClass('has-success');
		$('#adddep-numberGroup').addClass('has-error');
		$('#adddep-numberGroup .help-block').html('请输入科室编号');
		return false;
	} else {
		$.ajax({
			url : "department/checkNumberUnique/" + number ,
			type : "GET" ,
			cache : false , 
			async : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#adddep-numberGroup').removeClass('has-success');
					$('#adddep-numberGroup').addClass('has-error');
					$('#adddep-numberGroup .help-block').html('科室编号已存在');
				} else {
					$('#adddep-numberGroup').removeClass('has-error');
					$('#adddep-numberGroup').addClass('has-success');
					$('#adddep-numberGroup .help-block').html('');
					flag = true;
				}
			} 
		});
	}
	return flag;
}

function checkName_add() {
	var name = $('#adddep-name').val();
	if(name == null || $.trim(name) == '') {
		$('#adddep-nameGroup').removeClass('has-success');
		$('#adddep-nameGroup').addClass('has-error');
		$('#adddep-nameGroup .help-block').html('请输入科室名称');
		return false;
	} else {
		$('#adddep-nameGroup').removeClass('has-error');
		$('#adddep-nameGroup').addClass('has-success');
		$('#adddep-nameGroup .help-block').html('');
		return true;
	}
}

function checkDescription_add() {
	var description = $('#adddep-description').val();
	if(description == null || $.trim(description) == '') {
		$('#adddep-descriptionGroup').removeClass('has-success');
		$('#adddep-descriptionGroup').addClass('has-error');
		$('#adddep-descriptionGroup .help-block').html('请输入科室描述');
		return false;
	} else {
		$('#adddep-descriptionGroup').removeClass('has-error');
		$('#adddep-descriptionGroup').addClass('has-success');
		$('#adddep-descriptionGroup .help-block').html('');
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
