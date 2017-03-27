$(function() {
	/*导航颜色*/
	$("#navi_newsManage").addClass('active');
	
	//绑定点击发布新闻按钮事件
	$('.btn-toPublishNews').on('click', function(){
		window.location.href = "news/toPublish";
	});
});

function deleteNews(newsUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除新闻',
		content : '此操作会删除该新闻，而且操作不可撤销，确定删除？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(newsUuid);
		}
	});
}

function ajaxDelete(newsUuid) {
	$.ajax({
		url : "news/delete/" + newsUuid ,
		type : "GET" ,
		cache : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除新闻成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href='news/manage'
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