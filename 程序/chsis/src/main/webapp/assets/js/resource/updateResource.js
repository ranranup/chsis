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
	var flag = false;
	var name = $('#name').val();
	var original = $('#name').attr('original');
	if(name == null || $.trim(name) == '') {
		$('#nameGroup').removeClass('has-success');
		$('#nameGroup').addClass('has-error');
		$('#nameGroup .help-block').html('请输入资源名称');
		return false;
	} else {
		if(original != name) {
			$.ajax({
				url : "resource/checkNameUnique/" + name ,
				type : "GET" ,
				cache : false , 
				dataType : "json" ,
				async : false, 
				success : function(data) {
					if(data.result == "exist") {
						$('#nameGroup').removeClass('has-success');
						$('#nameGroup').addClass('has-error');
						$('#nameGroup .help-block').html('资源名称已存在');
					} else {
						$('#nameGroup').removeClass('has-error');
						$('#nameGroup').addClass('has-success');
						$('#nameGroup .help-block').html('');
						flag = true;
					}
				} 
			});
		} else {
			flag = true;
		}
		alert(flag);
		return flag;
	}
}

function checkUrl() {
	var flag = false;
	var url = $('#url').val();
	var original = $('#url').attr('original');
	if(url == null || $.trim(url) == '') {
		$('#urlGroup').removeClass('has-success');
		$('#urlGroup').addClass('has-error');
		$('#urlGroup .help-block').html('请输入资源URL');
		return false;
	} else {
		if(original != url) {
			$.ajax({
				url : "resource/checkURLUnique" ,
				type : "POST" ,
				data : {url : url} ,
				cache : false , 
				async: false,
				dataType : "json" ,
				success : function(data) {
					if(data.result == "exist") {
						$('#urlGroup').removeClass('has-success');
						$('#urlGroup').addClass('has-error');
						$('#urlGroup .help-block').html('资源URL已存在');
					} else {
						$('#urlGroup').removeClass('has-error');
						$('#urlGroup').addClass('has-success');
						$('#urlGroup .help-block').html('');
						flag = true;
					}
				} 
			});
		} else {
			flag = true;
		}
		alert(flag);
		return flag;
	}
}
