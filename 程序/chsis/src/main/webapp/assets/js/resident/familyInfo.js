$(function(){
	/* 导航颜色 */
	$("#navi_resident_familyInfo").addClass('active');
	
	//绑定点击疾病史的事件
	$('.a-diseaseHistory').on('click',function(){
		onShowDiseaseHistory($(this).attr('residentUuid'));
	});
	//绑定点击体检记录的事件
	$('.a-healthRecord').on('click',function(){
		onShowHealthRecord($(this).attr('residentUuid'));
	});
	//绑定点击免疫记录的事件
	$('.a-immuneRecord').on('click',function(){
		onShowImmuneRecord($(this).attr('residentUuid'));
	});
	
	//绑定点击居民详情按钮事件
	$('.btn-residentDetail').on('click',function(){
		onShowResident($(this).attr('uuid'));
	})
	
	//绑定点击修改家庭基本信息按钮事件
	$('.btn-edit-family').on('click',function(){
		var communityName = $('#community').attr('communityName');
		$.ajax({
			url : "community/getCommunityType",
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == "success") {
					for(var i in data.communities) {
						if(data.communities[i].name == communityName){
				           	$('#community').append('<option value="' + data.communities[i].uuid + '" selected>' + data.communities[i].name + '</option>');
						}else{
			           		$('#community').append('<option value="' + data.communities[i].uuid + '">' + data.communities[i].name + '</option>');
						}	
			        }
				} else {
					alert('失败');
				}
			} 		
		});
		onEditFamily();
	})
})

//打开修改家庭基本信息的模态框
function onEditFamily() {
	//绑定input元素失去焦点事件
	$('#editf-phone').on('blur', checkPhone_edit);
	$('#editf-address').on('blur', checkAddress_edit);
	
	//绑定保存按钮点击事件
	$('#editf-submit').on('click', function(){
		//表单校验
		var pass = validate_editf();
		if(pass) {
			return true;
		}
		return false;
	});
	
	$('#editFamily').modal();
}

function validate_editf(){
	if(checkPhone_edit() && checkAddress_edit()) {
		return true;
	} else {
		return false;
	}
}

function checkPhone_edit() {
	var phone = $('#editf-phone').val();
	if(phone == null || $.trim(phone) == '') {
		$('#editf-phoneGroup').removeClass('has-success');
		$('#editf-phoneGroup').addClass('has-error');
		$('#editf-phoneGroup .help-block').html('请输入家庭电话');
		return false;
	} else {
		$('#editf-phoneGroup').removeClass('has-error');
		$('#editf-phoneGroup').addClass('has-success');
		$('#editf-phoneGroup .help-block').html('');
		return true;
	}
}

function checkAddress_edit() {
	var address = $('#editf-address').val();
	if(address == null || $.trim(address) == '') {
		$('#editf-addressGroup').removeClass('has-success');
		$('#editf-addressGroup').addClass('has-error');
		$('#editf-addressGroup .help-block').html('请输入家庭地址');
		return false;
	} else {
		$('#editf-addressGroup').removeClass('has-error');
		$('#editf-addressGroup').addClass('has-success');
		$('#editf-addressGroup .help-block').html('');
		return true;
	}
}
//打开疾病史详情模态框
function onShowDiseaseHistory(residentUuid) {
	//异步获取疾病史信息
	$.ajax({
			url : "diseaseHistory/getDiseaseHistoryByResidentUuid/" + residentUuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					var trs = $('#table-diseaseHistory tr');
					for(var i=1; i<trs.length; i++) {
						$(trs[i]).remove();
					}
					//赋值
					for(var i in data.diseaseHistories) {
						$('#table-diseaseHistory').append('<tr><td>' + data.diseaseHistories[i].name + "</td><td>" + 
														  getType(data.diseaseHistories[i].type) + "</td><td>" + 
														  data.diseaseHistories[i].startTime + "</td><td>" + 
														  data.diseaseHistories[i].endTime + "</td></tr>");
					}
					
					$('#diseaseHistoryDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的疾病史信息不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//打开体检记录模态框
function onShowHealthRecord(residentUuid) {
	//异步获取体检信息
	$.ajax({
			url : "healthRecord/getHealthRecord/" + residentUuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					var trs = $('#table-healthRecord tr');
					for(var i=1; i<trs.length; i++) {
						$(trs[i]).remove();
					}
					//赋值
					for(var i in data.checkReports) {
						$('#table-healthRecord').append('<tr><td>' + data.checkReports[i].patient.name + "</td><td>" + 
														  data.checkReports[i].hospital.name + "</td><td>" + 
														  data.checkReports[i].time + "</td><td><span data-toggle='tooltip' data-placement='top' title=" + data.checkReports[i].description + ">" +
														  "查看体检描述" + "</span></td></tr>");
					}
					
					$('#healthRecord').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的体检信息不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//打开免疫记录模态框
function onShowImmuneRecord(residentUuid) {
	//异步获取免疫信息
	$.ajax({
			url : "immuneRecord/getImmuneRecord/" + residentUuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					var trs = $('#table-immuneRecord tr');
					for(var i=1; i<trs.length; i++) {
						$(trs[i]).remove();
					}
					//赋值
					for(var i in data.immuneRecords) {
						$('#table-immuneRecord').append('<tr><td>' + data.immuneRecords[i].patient.name + "</td><td>" + 
														  data.immuneRecords[i].hospital.name + "</td><td>" + 
														  data.immuneRecords[i].immuneTime + "</td><td>" + 
														  data.immuneRecords[i].vaccine + "</td></tr>");
					}
					
					$('#immuneRecord').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的免疫信息不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//打开家庭成员详情模态框
function onShowResident(uuid) {
	//异步获取家庭成员信息
	$.ajax({
			url : "resident/get/" + uuid ,
			type : "GET" ,
			cache : false , 
			dataType : "json" ,
			success : function(data) {
				if(data.result == 'success') {
					//赋值
					$('#resident-name').html(data.resident.name);
					$('#resident-sex').html(data.resident.sex == 0?'男':'女');
					$('#resident-idNo').html(data.resident.idNo);
					var nation = Number(data.resident.nation);
					$('#resident-nation').html(getNation(nation));
					$('#resident-birth').html(data.resident.birth);
					$('#resident-age').html(data.resident.age);
					$('#resident-period').html(getPeriod(data.resident.period));
					$('#resident-phone').html(data.resident.phone);
					$('#resident-marriage').html(getMarriage(data.resident.marriage));
					$('#resident-height').html(data.resident.height + 'cm');
					$('#resident-weight').html(data.resident.weight + 'kg');
					
					var beforeEye = data.resident.eyesight;
					var eye = beforeEye.split(',');
					var left_eye = eye[0];
					var right_eye = eye[1];
					
					$('#resident-eyesight').html('左眼' + left_eye + '，右眼' + right_eye);
					/*$('#resident-eyesight').html(data.resident.eyesight);*/
					$('#resident-bloodType').html(getBloodType(data.resident.bloodType));
					
					$('#residentDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的居民不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//删除居民的操作
function removeResident(uuid) {
	$.confirm({
		keyboardEnabled : true,
			title : '移除用户',
			content : '此操作会将该居民移除本家庭，而且操作不可撤销，确定移除？',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			confirm : function() {
				$.ajax({
					url : "resident/remove/" + uuid,
					type : "GET",
					cache : false,
					dataType : "json",
					success : function(data) {
						if (data.result == "success") {
							$.confirm({
										keyboardEnabled : true,
										title : '移除成功',
										content : '成功移除该居民！',
										confirmButtonClass : 'btn-info',
										cancelButtonClass : 'btn-danger',
										autoClose : 'confirm|3000'
							});
							window.location.href = "family/familyInfo";
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
	});
}

function getNation(num) {
	switch(num) {
		case 0 : return '汉族';
		case 1 : return '壮族';
		case 2 : return '回族';
		case 3 : return '满族';
		case 4 : return '维吾尔族';
		case 5 : return '苗族';
		case 6 : return '彝族';
		case 7 : return '土家族';
		case 8 : return '藏族';
		case 9 : return '蒙古族';
		case 10 : return '侗族';
		case 11 : return '布依族';
		case 12 : return '瑶族';
		case 13 : return '朝鲜族';
		case 14 : return '哈尼族';
		case 15 : return '黎族';
		case 16 : return '哈萨克族';
		case 17 : return '傣族';
		case 18 : return '畲族';
		case 19 : return '傈僳族';
		case 20 : return '东乡族';
		case 21 : return '仡佬族';
		case 22 : return '拉祜族';
		case 23 : return '佤族';
		case 24 : return '水族';
		case 25 : return '纳西族';
		case 26 : return '羌族';
		case 27 : return '土族';
		case 28 : return '仫佬族';
		case 29 : return '锡伯族';
		case 30 : return '柯尔克孜族';
		case 31 : return '景颇族';
		case 32 : return '达斡尔族';
		case 33 : return '撒拉族';
		case 34 : return '布朗族';
		case 35 : return '毛南族';
		case 36 : return '塔吉克族';
		case 37 : return '普米族';
		case 38 : return '阿昌族';
		case 39 : return '怒族';
		case 40 : return '鄂温克族';
		case 41 : return '京族';
		case 42 : return '基诺族';
		case 43 : return '德昂族';
		case 44 : return '保安族';
		case 45 : return '俄罗斯族';
		case 46 : return '裕固族';
		case 47 : return '乌孜别克族';
		case 48 : return '门巴族';
		case 49 : return '鄂伦春族';
		case 50 : return '独龙族';
		case 51 : return '赫哲族';
		case 52 : return '高山族';
		case 53 : return '珞巴族';
		case 54 : return '塔塔尔族';
		case 55 : return '未识别民族';
		case 56 : return '入籍外国人';
		default : return '未知';
	}
}

function getPeriod(num) {
	switch(num) {
		case 0 : return '婴幼儿';
		case 1 : return '儿童';
		case 2 : return '青少年';
		case 3 : return '青年';
		case 4 : return '中年';
		case 5 : return '中老年';
		case 6 : return '老年';
		default : return '未知';
	}
}

function getMarriage(num) {
	switch(num) {
		case 0 : return '未婚';
		case 1 : return '已婚';
		case 2 : return '离异';
		default : return '未知';
	}
}

function getType(num) {
	switch(num) {
		case 0 : return '遗传病史'; 
		case 1 : return '重大疾病史'; 
		case 2 : return '手术史'; 
		case 3 : return '过敏史'; 
		default : return '未知';
	}
}
function getBloodType(num) {
	switch(num) {
		case 0 : return 'A-型'; 
		case 1 : return 'B-型'; 
		case 2 : return 'AB-型'; 
		case 3 : return 'O-型'; 
		default : return '未知';
	}
}