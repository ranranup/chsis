$(function() {
	/*导航颜色*/
	$("#navi_admin_family").addClass('active');
	
	//绑定点击家庭成员详情按钮事件
	$('.btn-residentDetail').on('click',function(){
		onShowResident($(this).attr('uuid'));
	})
});

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
					
					$('#residentDetail').modal();
				} else {
					$.confirm({
						keyboardEnabled : true,
						title : '查询失败',
						content : '您查询的家庭成员不存在！',
						autoClose : 'confirm|3000'
					});
				}
			} 
	});
}

//获取年龄段信息
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

//获取婚姻状况
function getMarriage(num) {
	switch(num) {
		case 0 : return '未婚';
		case 1 : return '已婚';
		case 2 : return '离异';
		default : return '未知';
	}
}

//获取民族
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