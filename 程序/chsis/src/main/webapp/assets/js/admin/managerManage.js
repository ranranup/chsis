$(function() {
	/*导航颜色*/
	$("#navi_admin_manager").addClass('active');
	
	//绑定添加管理员按钮事件
	$("#btn-add").on('click', function(){
		window.location.href = "manager/toAddManager";
	});
	
	//绑定点击管理员详情按钮事件
	$('.btn-managerDetail').on('click',function(){
		onShowManager($(this).attr('uuid'));
	})
	
	//绑定点击编辑管理员按钮事件
	$('.btn-editManager').on('click',function(){
		onEditManager($(this).attr('uuid'));
	})
	
	//绑定编辑管理员的点击保存按钮事件
	$('#editm-submit').on('click',function(){
		editmOnSubmit();
		return false;
	})
		
})

//打开管理员详情模态框
function onShowManager(uuid) {
	//异步获取管理员信息
	$.ajax({
			url : "manager/detail/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#manager-name').html(data.manager.name);
					$('#manager-phone').html(data.manager.phone);
					var type = Number(data.manager.type);
					$('#manager-type').html(getType(type));
					
					if(type == 0) {
						$('#hospital-name').html(data.hospitalName);
						$('#div-hide').show();
					} else {
						$('#div-hide').hide();
					}
					$('#role').empty();
					if(data.userRoles.length == null){
						
					}
					for(var i=0;i<data.userRoles.length;i++) {
						$('#role').append('<h5>' + i + ') ' + data.userRoles[i].role.cName + '</h5>');					
					}
					$('#managerDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的管理员不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//打开编辑管理员模态框
function onEditManager(uuid) {
	//异步获取管理员信息
	$.ajax({
			url : "manager/detail/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#editm-name').val(data.manager.name);
					$('#editm-phone').val(data.manager.phone);
					
					$('#managerUuid').attr('value',data.manager.uuid);
					$('#editManager').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的管理员不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

function editmOnSubmit(){
	var url = $('#url').val() + "page=" + $('#pageIndex').val();
	//异步修改管理员信息
	$.ajax({
			url : "manager/edit",
			type : "POST" ,
			cache : false , 
			dataType : "json" ,
			data: $("#managerInfoForm").serialize(),
			success : function(data) {
				if(data.result == 'success') {
					$.confirm({
						keyboardEnabled : true,
						title : '修改成功',
						content : '成功修改管理员信息！',
						confirmButtonClass : 'btn-info',
						cancelButtonClass : 'btn-danger',	
						autoClose : 'confirm|3000'
					});
					window.location.href = url;
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '修改失败',
						content : '修改管理员信息失败！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}


function deleteManager(managerUuid) {
	$.confirm({
		keyboardEnabled : true,
		title : '删除管理员',
		content : '此操作会删除该管理员的所有信息，而且操作不可撤销，确定删除该管理员？',
		confirmButtonClass : 'btn-info',
		cancelButtonClass : 'btn-danger',
		confirm : function() {
			ajaxDelete(managerUuid);
		}
	});
}

function ajaxDelete(managerUuid) {
	$.ajax({
		url : "manager/delete/" + managerUuid,
		type : "GET",
		cache : false,
		dataType : "json",
		success : function(data) {
			if (data.result == "success") {
				$.confirm({
					keyboardEnabled : true,
					title : '删除成功',
					content : '删除管理员成功！',
					confirmButtonClass : 'btn-info',
					cancelButtonClass : 'btn-danger',
					autoClose : 'confirm|3000'
				});
				window.location.href = 'manager/manage'
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

function getType(num) {
	switch(num){
		case 0 : return '医院管理员';
		case 1 : return '审核员';
		case 2 : return '系统管理员';
		default : return '未知';
	}
}