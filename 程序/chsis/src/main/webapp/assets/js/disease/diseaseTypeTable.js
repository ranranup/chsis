$(function(){
	//添加疾病类型按钮
	$('.btn-add-diseaseType').on('click', function(){
		$('#addDiseaseTypeModal').modal();
	});
	
	//删除疾病类型按钮
	$('.btn-delete-diseaseType').on('click', function(){
		var uuid = $(this).attr('uuid');
		deleteDiseaseType(uuid);
	});
	
	//添加疾病类型提交按钮
	$('#addDiseaseType-submit').on('click', function(){
		return checkDiseaseTypeName_add();
	});
	
	$('#addDiseaseType-name').on('blur',checkDiseaseTypeName_add);
})


function checkDiseaseTypeName_add() {
	var name = $('#addDiseaseType-name').val();
	var flag = false;
	if(name == null || $.trim(name) == '') {
		$('#addDiseaseTypeNameGroup').removeClass('has-success');
		$('#addDiseaseTypeNameGroup').addClass('has-error');
		$('#addDiseaseTypeNameGroup .help-block').html('请输入疾病类型名称');
		return false;
	} else {
			$.ajax({
				url : "diseaseType/checkDiseaseTypeNameUnique/" + name ,
				type : "GET" ,
				cache : false , 
				async : false , 
				dataType : "json" ,
				success : function(data) {
					if(data.result == "exist") {
						$('#addDiseaseTypeNameGroup').removeClass('has-success');
						$('#addDiseaseTypeNameGroup').addClass('has-error');
						$('#addDiseaseTypeNameGroup .help-block').html('您输入的疾病类型名称已存在！');
					} else {
						$('#addDiseaseTypeNameGroup').removeClass('has-error');
						$('#addDiseaseTypeNameGroup').addClass('has-success');
						$('#addDiseaseTypeNameGroup .help-block').html('');
						flag = true;
					}
				}
			});	
			return flag;
	}
}

function deleteDiseaseType(uuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除疾病类型',
		content : '此操作会当前疾病类型、子类型以及所有类型下的所有疾病，确认删除吗？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(uuid);
		}
	});
}

//异步删除疾病类型
function ajaxDelete(uuid) {
	$.ajax({
		url : "diseaseType/delete/" + uuid ,
		type : "GET" ,
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除疾病类型成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href='diseaseType/manage'
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