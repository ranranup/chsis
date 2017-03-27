$(function() {
	/*导航颜色*/
	$("#navi_newsManage").addClass('active');
	
	$('#summernote').summernote({
			  height: 400,                 // set editor height
			  minHeight: null,             // set minimum height of editor
			  maxHeight: null,             // set maximum height of editor
			  focus: true ,                 // set focus to editable area after initializing summernote
			  lang: 'zh-CN',
			  toolbar: [
			            ['style', ['bold', 'italic', 'underline', 'undo','redo','clear']],
			            ['font', ['strikethrough', 'superscript', 'subscript']],
			            ['fontsize', ['fontname','fontsize','color']],
			            ['insert', ['link','picture','video','table','hr']],
			            ['para', ['ul', 'ol', 'paragraph','style','height']],
			            ['Misc', ['fullscreen','codeview','help']]
			          ] ,
			  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Consolas', 'Courier New', 'sans-serif', '宋体', '新宋体', '黑体', '微软雅黑', '幼圆', '楷体', '隶书'], 
			  callbacks: {
				  onImageUpload: function (files) {
	                  sendFile(files[0]);
	              }
			  }
		});
		
		$('.btn-submitNews').on('click', function(){
			submitNews();
		});
});

function sendFile(file) {
    var data = new FormData();
    data.append("file", file);
    $.ajax({
        data : data,
        type : "POST",
        url : "uploadImage",
        cache : false,
        contentType : false,
        processData : false,
        success : function(result) {
        	if(result.url != '') {
            	$('#summernote').summernote('insertImage', result.url);
        	} else {
        		alert('图片上传失败');
        	}
        }
    });
}
 
function submitNews() {
	var title = $('#title').val();
	var content = $('#summernote').summernote('code');
	if($.trim(title) == '' || $.trim(content) == '') {
		$.confirm({
			keyboardEnabled : true,
			title : '提醒',
			content : '新闻标题和内容均不能为空！',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			autoClose : 'confirm|3000'
		});
	} else {
		var data = {"title": title, "content":content};
		var role = $('#news').attr('role');
		if(role == 'doctor') {
			var type = $('input[name="type"]:checked').val();
			data.type = type;
		}
		
		$.ajax({
			url : "news/add" ,
			type : "POST" ,
			cache : false , 
			data : data ,
			dataType : "json" ,
			success : function(data) {
				if(data.result == "success") {
					$.confirm({
						keyboardEnabled : true,
						title : '提交成功',
						content : '新闻已提交成功，等待审核员审核！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
					window.location.href = 'news/manage';
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '提交失败',
						content : '新闻提交失败，请检查标题或者内容是否为空！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',
						autoClose : 'confirm|3000'
					});
				}
			} 
		});
	}
}
    