$(function(){
	
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
	
	//上传图片组件
	$("#input-id").fileinput({
		language : 'zh', 
		allowedFileExtensions : [ 'jpg', 'png', 'jpeg' ] ,
		overwriteInitial : false,
		maxFileSize : 100,
		maxFilesCount : 1,
		showRemove : false ,
		showUpload : false ,
		slugCallback : function(filename) {
			return filename.replace('(', '_').replace(']', '_');
		}
	});
})





