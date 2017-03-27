$(function() {
	/*导航颜色*/
	$("#navi_newsManage").addClass('active');
	
	//绑定点击审核不通过按钮事件
	$('.btn-notPass').on('click', function(){
		notPass($(this).attr('newsUuid'));
		return false;
	});
	
	$('.btn-pass').on('click', function(){
		pass($(this).attr('newsUuid'));
		return false;
	});
	
	$('#reason').on('blur',checkReason);
	
	$('#reason-submit').on('click', function(){
		if(checkReason()) {
			doNotPass();
		}
		return false;
	});
	
	
});


//打开模态框
function notPass(newsUuid) {
	$('#newsUuid').val(newsUuid);	
	$('#notPassModal').modal();
}

function pass(newsUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '审核新闻',
		content : '确定审核通过吗？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			doPass(newsUuid);
		}
	});
}

function checkReason() {
	var reason = $('#reason').val();
	if(reason == null || $.trim(reason) == '') {
		$('#reasonGroup').removeClass('has-success');
		$('#reasonGroup').addClass('has-error');
		$('#reasonGroup .help-block').html('请输入审核未通过原因');
		return false;
	} else {
		$('#reasonGroup').removeClass('has-error');
		$('#reasonGroup').addClass('has-success');
		$('#reasonGroup .help-block').html('');
		return true;
	}
}

function doPass(newsUuid) {
	 $.ajax({
        data : {"newsUuid" : newsUuid} ,
        type : "POST",
        url : "news/pass",
        cache : false,
        dataType : 'json',
        success : function(data) {
        	if(data.result == 'success') {
            	$('.td-state[newsUuid="'+ newsUuid +'"]').html('审核通过');
        	} else {
        		$.confirm({
					keyboardEnabled : true,
					title : '提醒',
					content : '审核失败！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
        	}
        }
    });
}

function doNotPass() {
	 var newsUuid = $('#newsUuid').val();	
	 $.ajax({
        data : $('#notPassForm').serialize() ,
        type : "POST",
        url : "news/notPass",
        cache : false,
        dataType : 'json',
        success : function(data) {
        	if(data.result == 'success') {
            	$('.td-state[newsUuid="'+ newsUuid +'"]').html('审核未通过');
            	$('#notPassModal').modal('hide');
        	} else {
        		$.confirm({
					keyboardEnabled : true,
					title : '提醒',
					content : '审核失败！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
        	}
        }
    });
}