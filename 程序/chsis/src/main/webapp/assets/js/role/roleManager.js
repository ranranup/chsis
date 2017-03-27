$(function(){
	/*导航颜色*/
	$("#navi_admin_role").addClass('active');
	
	$("#navi_role").addClass('active');
})

function deleteRole(roleUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除角色',
		content : '此操作会删除该角色的所有信息，而且操作不可撤销，确定删除该角色？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(roleUuid);
		}
	});
}

function ajaxDelete(roleUuid) {
	$.ajax({
		url : "role/delete/" + roleUuid ,
		type : "GET" ,
		cache : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除角色成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href='role/manager'
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