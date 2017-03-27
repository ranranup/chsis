$(function(){
	/* 导航颜色 */
	$("#navi_resident_healthInfo").addClass('active');
	
	var eyesightCode = $('#eyesightCode').attr('eyesightCode');
	$('#eyesightCode').html(getEyesight(eyesightCode));
	
	onloadModal();
	
	//绑定点击疾病史详情按钮事件
	$('.btn-diseaseHistoryDetail').on('click',function(){
		onShowDiseaseHistory($(this).attr('uuid'));
	});
	
	//绑定点击添加疾病史按钮事件
	$('.btn-add-diseaseHistory').on('click', function(){
		onAddDiseaseHistory();
	});
	
	//日期选框
	$(".default-date-picker").datepicker({
        format: "yyyy-mm-dd",
        todayBtn: "linked",
        clearBtn: true,
        language: "zh-CN",
        todayHighlight: true
    });
})

function onloadModal(){
	$.getJSON('assets/json/bloodType.json',function(data) {
        for(var i in data) {
    		$('#bloodType').append('<option value="' + data[i].value + '">' + data[i].name + '</option>');
        }
    });
    
	var eyesightCode = $('#eyesightCode').attr('eyesightCode');
	if(eyesightCode == null || eyesightCode==''){
		$('#eyesightCode').html("未填");
	} else {
		var eye = eyesightCode.split(',');
		$('#editdis-leftEyesight').val(eye[0]);
		$('#editdis-rightEyesight').val(eye[1]);
	}
	//绑定点击修改基本信息按钮事件
	$('.btn-edit-commonHealthInfo').on('click', function(){
		onEditCommonHealthInfo();
	});
}
//打开修改常规健康信息的模态框
function onEditCommonHealthInfo() {
	//绑定input元素失去焦点事件
	$('#editdis-height').on('blur', checkHeight_edit);
	$('#editdis-weight').on('blur', checkWeight_edit);
	$('#editdis-leftEyesight').on('blur', checkLeftEyesight_edit);
	$('#editdis-rightEyesight').on('blur', checkRightEyesight_edit);
	
	//绑定保存按钮点击事件
	$('#editdis-submit').on('click', function(){
		//表单校验
		var pass = validate_editdis();
		if(pass) {
			return true;
		}
		return false;
	});
	
	$('#editCommonHealthInfo').modal();
}

//表单校验
function validate_editdis() {
	if(checkHeight_edit() && checkWeight_edit() && checkLeftEyesight_edit() && checkRightEyesight_edit()) {
		return true;
	} else {
		return false;
	}
}

function checkHeight_edit() {
	var height = $('#editdis-height').val();
	if(height == null || $.trim(height) == '') {
		$('#editdis-heightGroup').removeClass('has-success');
		$('#editdis-heightGroup').addClass('has-error');
		$('#editdis-heightGroup .help-block').html('请输入身高');
		return false;
	} else {
		$('#editdis-heightGroup').removeClass('has-error');
		$('#editdis-heightGroup').addClass('has-success');
		$('#editdis-heightGroup .help-block').html('');
		return true;
	}
}

function checkWeight_edit() {
	var weight = $('#editdis-weight').val();
	if(weight == null || $.trim(weight) == '') {
		$('#editdis-weightGroup').removeClass('has-success');
		$('#editdis-weightGroup').addClass('has-error');
		$('#editdis-weightGroup .help-block').html('请输入体重');
		return false;
	} else {
		$('#editdis-weightGroup').removeClass('has-error');
		$('#editdis-weightGroup').addClass('has-success');
		$('#editdis-weightGroup .help-block').html('');
		return true;
	}
}

function checkLeftEyesight_edit() {
	var leftEyesight = $('#editdis-leftEyesight').val();
	if(leftEyesight == null || $.trim(leftEyesight) == '') {
		$('#editdis-leftEyesightGroup').removeClass('has-success');
		$('#editdis-leftEyesightGroup').addClass('has-error');
		$('#editdis-leftEyesightGroup .help-block').html('请输入左眼视力');
		return false;
	} else {
		$('#editdis-leftEyesightGroup').removeClass('has-error');
		$('#editdis-leftEyesightGroup').addClass('has-success');
		$('#editdis-leftEyesightGroup .help-block').html('');
		return true;
	}
}
function checkRightEyesight_edit() {
	var rightEyesight = $('#editdis-rightEyesight').val();
	if(rightEyesight == null || $.trim(rightEyesight) == '') {
		$('#editdis-rightEyesightGroup').removeClass('has-success');
		$('#editdis-rightEyesightGroup').addClass('has-error');
		$('#editdis-rightEyesightGroup .help-block').html('请输入右眼视力');
		return false;
	} else {
		$('#editdis-rightEyesightGroup').removeClass('has-error');
		$('#editdis-rightEyesightGroup').addClass('has-success');
		$('#editdis-rightEyesightGroup .help-block').html('');
		return true;
	}
}


function getEyesight(eyesight) {
	var eye = eyesight.split(',');
	return '左眼' + eye[0] + '，右眼' + eye[1];
}

//打开疾病史详情模态框
function onShowDiseaseHistory(uuid) {
	//异步获取疾病史信息
	$.ajax({
			url : "diseaseHistory/diseaseHistoryDetail/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#diseaseHistory-name').html(data.diseaseHistory.name);
					$('#diseaseHistory-type').html(getType(data.diseaseHistory.type));
					$('#diseaseHistory-startTime').html(data.diseaseHistory.startTime);
					$('#diseaseHistory-endTime').html(data.diseaseHistory.endTime);
					$('#diseaseHistory-description').html(data.diseaseHistory.description);
					$('#diseaseHistoryDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的疾病史信息不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}
//删除疾病史
function deleteDiseaseHistory(btn) {
	$.confirm({
		keyboardEnabled : true,
			title : '删除疾病史',
			content : '此操作会删除该疾病史，而且操作不可撤销，确定删除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "diseaseHistory/delete/" + $(btn).attr('uuid'),
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '删除成功',
										content : '成功删除该疾病史！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							$(btn).parent().parent().remove();
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


//打开添加疾病史模态框
function onAddDiseaseHistory() {
	//绑定input元素失去焦点事件
	$('#adddis-name').on('blur', checkName_add);
	$('#adddis-startTime').on('blur', checkStartTime_add);
	
	//绑定保存按钮点击事件
	$('#adddis-submit').on('click', function(){
		//表单校验
		var pass = validate_adddis();
		if(pass) {
			return true;
		}
		return false;
	});
	
	$('#addDiseaseHistory').modal();
}

//表单校验
function validate_adddis() {
	if(checkName_add() && checkStartTime_add()) {
		return true;
	} else {
		return false;
	}
}

function checkName_add() {
	var name = $('#adddis-name').val();
	if(name == null || $.trim(name) == '') {
		$('#adddis-nameGroup').removeClass('has-success');
		$('#adddis-nameGroup').addClass('has-error');
		$('#adddis-nameGroup .help-block').html('请输入疾病名称');
		return false;
	} else {
		$('#adddis-nameGroup').removeClass('has-error');
		$('#adddis-nameGroup').addClass('has-success');
		$('#adddis-nameGroup .help-block').html('');
		return true;
	}
}

function checkStartTime_add() {
	var startTime = $('#adddis-startTime').val();
	if(startTime == null || $.trim(startTime) == '') {
		$('#adddis-startTimeGroup').removeClass('has-success');
		$('#adddis-startTimeGroup').addClass('has-error');
		$('#adddis-startTimeGroup .help-block').html('请选择疾病开始时间');
		return false;
	} else {
		$('#adddis-startTimeGroup').removeClass('has-error');
		$('#adddis-startTimeGroup').addClass('has-success');
		$('#adddis-startTimeGroup .help-block').html('');
		return true;
	}
}

function getType(num) {
	switch(num) {
		case 0 : return '遗传病史'; 
		case 1 : return '重大疾病史'; 
		case 2 : return '手术史'; 
		case 3 : return '过敏史'; 
		default : return '未知';
	}
}