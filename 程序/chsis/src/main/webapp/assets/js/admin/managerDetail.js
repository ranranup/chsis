$(function() {
	$("#navi_user").addClass('active');
})

function deleteUser(userUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除人员',
		content : '此操作会删除该人员的所有信息，而且操作不可撤销，确定删除该人员？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(userUuid);
		}
	});
}

function ajaxDelete(userUuid) {
	$.ajax({
		url : "user/delete/" + userUuid,
		type : "GET",
		cache : false,
		dataType : "json",
		success : function(data) {
			if (data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除人员成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href = 'user/manager'
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