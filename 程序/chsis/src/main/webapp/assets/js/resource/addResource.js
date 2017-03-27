$(function(){
	/*导航颜色*/
	$("#navi_admin_resource").addClass('active');
	
	/*绑定失焦事件*/
	$('#name').on('blur',checkName);
	$('#url').on('blur',checkUrl);
	
	
	/*绑定提交按钮事件*/
	$('#submit').on('click', function(){
		//表单校验
		var pass = validate();
		return pass;
	});
})

//表单校验
function validate() {
	if(checkName() && checkUrl() ) {
		return true;
	} else {
		return false;
	}
}

function checkName() {
	var name = $('#name').val();
	if(name == null || $.trim(name) == '') {
		$('#nameGroup').removeClass('has-success');
		$('#nameGroup').addClass('has-error');
		$('#nameGroup .help-block').html('请输入资源名称');
		return false;
	} else {
		return $.ajax({
			url : "resource/checkNameUnique/" + name ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#nameGroup').removeClass('has-success');
					$('#nameGroup').addClass('has-error');
					$('#nameGroup .help-block').html('资源名称已存在');
					return false;
				} else {
					$('#nameGroup').removeClass('has-error');
					$('#nameGroup').addClass('has-success');
					$('#nameGroup .help-block').html('');
					return true;
				}
			} 
		});
	}
}

function checkUrl() {
	var url = $('#url').val();
	if(url == null || $.trim(url) == '') {
		$('#urlGroup').removeClass('has-success');
		$('#urlGroup').addClass('has-error');
		$('#urlGroup .help-block').html('请输入资源URL');
		return false;
	} else {
		return $.ajax({
			url : "resource/checkURLUnique" ,
			type : "POST" ,
			data : {url : url} ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "exist") {
					$('#urlGroup').removeClass('has-success');
					$('#urlGroup').addClass('has-error');
					$('#urlGroup .help-block').html('资源URL已存在');
					return false;
				} else {
					$('#urlGroup').removeClass('has-error');
					$('#urlGroup').addClass('has-success');
					$('#urlGroup .help-block').html('');
					return true;
				}
			} 
		});
	}
}
