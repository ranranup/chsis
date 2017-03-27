$(function(){
	/*导航颜色*/
	$("#navi_admin_resource").addClass('active');
})

function deleteResource(resourceUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除资源',
		content : '此操作会删除该资源的所有信息，而且操作不可撤销，确定删除该资源？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(resourceUuid);
		}
	});
}

function ajaxDelete(resourceUuid) {
	$.ajax({
		url : "resource/delete/" + resourceUuid ,
		type : "GET" ,
		cache : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除资源成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href='resource/manager'
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