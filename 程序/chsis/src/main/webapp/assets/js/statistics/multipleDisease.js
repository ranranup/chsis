var targetBtn;

$(function() {
	$.ajax({
		url : "diseaseType/getDiseaseType/one",
		type : "GET" ,
		cache : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				for(var i in data.diseaseTypes) {
           			$('#initSelect').append('<option last="'+ data.diseaseTypes[i].last + '" value="' + data.diseaseTypes[i].uuid + '">' + data.diseaseTypes[i].name + '</option>');
		        }
			}
		} 		
	});
	$('.diseaseTypeSelect').on('change', onSelect);
	
	//选择疾病名称确定时的点击事件
	$('#confirmSelectBtn').on('click', function() {
		selectDisease($(this).attr('uuid'));
		return false;
	});
	
	//清除选择疾病按钮的点击事件
	$('#removeSelectBtn').on('click', function() {
		removeSelect();
		return false;
	});
	
	//三个请选择疾病按钮点击事件
	$('.diseaseNameBtn').on('click', function(){
		$('#selectDiseaseModal').modal();
		targetBtn = $(this);
	});
	
	//路径配置
	require.config({
		paths : {
			echarts : 'assets/echarts'
		}
	});

	//提交请求生成图
	$('#submit').on('click', function() {
		onSubmit();
		return false;
	});

});	

function removeSelect() {
	targetBtn.removeAttr('diseaseUuid');
	targetBtn.text('请选择疾病');
	$('#selectDiseaseModal').modal('hide');
}

function onSubmit() {
	//拿到用户选择的疾病
	var btns = $('.diseaseNameBtn');
	var diseaseUuids = [];
	var diseaseNames = [];
	for(var i=0; i<3; i++) {
		if($(btns[i]).text() != '请选择疾病') {
			diseaseUuids.push($(btns[i]).attr('diseaseUuid'));
			diseaseNames.push($(btns[i]).text());
		}
	}
	//判断是否选择疾病
	if(diseaseUuids.length == 0) {
		$.confirm({
			keyboardEnabled : true,
			title : '选择错误',
			content : '请至少选择一个疾病',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			autoClose : 'confirm|3000'
		});
		return;
	}
	var year = $('#yearSelect').val();
	// 使用
	require( [ 'echarts',
	           'echarts/chart/bar', 
	           'echarts/chart/line'
	    ] ,
	    function(ec) {
			draw(ec, diseaseUuids, diseaseNames, year);
		}
	);
}
	
//弹出的模态框选择疾病
function selectDisease(uuid) {
	//取到最后一个select框的选中的 option
	var option = $('#selectDiv').find('select').last().find('option:selected');
	//判断有没有last属性，如果有且last属性是0或1,说明选择的是疾病类型而非疾病，提醒。
	var last = $(option).attr('last');
	if(last == '0' || last== '1') {
		$.confirm({
			keyboardEnabled : true,
			title : '选择错误',
			content : '请选择具体疾病',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			autoClose : 'confirm|3000'
		});
		return;
	}
	
	//如果选择的是疾病，则获取疾病的uuid，更改就诊记录的疾病属性。
	var diseaseUuid = $(option).attr('value');
	var diseaseName = $(option).text();
	var otherDiseaseBtns = targetBtn.siblings();
	//判断有没有重复选取
	if($(otherDiseaseBtns[0]).text() == diseaseName || $(otherDiseaseBtns[1]).text() == diseaseName) {
		$.confirm({
			keyboardEnabled : true,
			title : '选择错误',
			content : '您已选择过该疾病,请勿重复选取',
			confirmButtonClass : 'btn-info',
			cancelButtonClass : 'btn-danger',
			autoClose : 'confirm|3000'
		});
		return;
	}
	targetBtn.attr('diseaseUuid',diseaseUuid);
	targetBtn.text(diseaseName);
	$('#selectDiseaseModal').modal('hide');
}

//级联查询疾病，放在select里
function onSelect() {
	$(this).nextAll('select').remove();
	var last = $(this).find('option:selected').attr('last');
	var value = $(this).attr('value');
	if(last == '0') {
		onSelectDiseaseType(value);
	} else {
		onSelectDisease(value);
	}
}

function onSelectDiseaseType(diseaseTypeUuid) {
	$.ajax({
		url : "diseaseType/getByParent/" + diseaseTypeUuid ,
		type : "GET" ,
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				if(data.diseaseTypes.length != 0) {
					var newSelect = '<select class="form-control diseaseTypeSelect">';
					for(var i in data.diseaseTypes) {
						newSelect += '<option last="'+ data.diseaseTypes[i].last + '" value="'+ data.diseaseTypes[i].uuid + '">'+ data.diseaseTypes[i].name +'</option>';
					}
					newSelect += '</select>';
					$('#selectDiv').append(newSelect);
					$('.diseaseTypeSelect').on('change', onSelect);
				}
			} 
		} 
	});
}

function onSelectDisease(diseaseTypeUuid) {
	$.ajax({
		url : "disease/getByDiseaseType/" + diseaseTypeUuid ,
		type : "GET" ,
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			if(data.result == "success") {
				if(data.diseases.length != 0) {
					var newSelect = '<select class="form-control" style="margin-left:5px;">';
					for(var i in data.diseases) {
						newSelect += '<option value="'+ data.diseases[i].uuid + '">'+ data.diseases[i].name +'</option>';
					}
					newSelect += '</select>';
					$('#selectDiv').append(newSelect);
				}
			} 
		} 
	});
}

function draw(ec, diseaseUuids, diseaseNames, year) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('main'));
	var returnData = null;
	
	$.ajax({
		url : "statistics/multipleDisease" ,
		type : "POST" ,
		data : {'diseaseUuids' : diseaseUuids, 'year' : year},
		cache : false , 
		async : false , 
		traditional : true ,
		dataType : "json" ,
		success : function(data) {
			console.log(data);
			returnData = data;
		} 
	});
	
	var series = [];
	for(var i=0; i<diseaseUuids.length; i++) {
		var temp = {
			name : diseaseNames[i],
			type : 'bar',
			data : returnData.data[i],
			markPoint : {
				data : [ {
					type : 'max',
					name : '最大值'
				}, {
					type : 'min',
					name : '最小值'
				} ]
			},
			markLine : {
				data : [ {
					type : 'average',
					name : '平均值'
				} ]
			}
		}
		series.push(temp);
	}

	option = {
			title : {
				text : diseaseNames + ' 疾病全年发病数量走势',
				subtext : year + '年', 
				textStyle : {fontSize: 14}
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : diseaseNames
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'line', 'bar' ]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			calculable : true,
			xAxis : [ {
				type : 'category',
				data : [ '1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月',
						'10月', '11月', '12月' ]
			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : series
		};

	// 为echarts对象加载数据 
	myChart.setOption(option);
}
