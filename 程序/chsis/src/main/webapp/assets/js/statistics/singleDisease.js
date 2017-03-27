$(function() {
	
	//路径配置
	require.config({
		paths : {
			echarts : 'assets/echarts'
		}
	});

	//页面加载时先把一级疾病加载出来
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
	$('#submit').on('click', function() {
		selectDisease($(this).attr('uuid'));
		return false;
	});

});	
	
function draw(ec, diseaseUuid, diseaseName, year) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('main'));
	var returnData = null;
	
	$.ajax({
		url : "statistics/singleDisease" ,
		type : "POST" ,
		data : {'diseaseUuid' : diseaseUuid, 'year' : year},
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			returnData = data;
		} 
	});

	option = {
			title : {
				text : diseaseName + ' 疾病全年发病数量走势',
				subtext : year + '年'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ diseaseName ]
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
			series : [
					{
						name : diseaseName,
						type : 'bar',
						data : returnData.data,
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
				]
		};

	// 为echarts对象加载数据 
	myChart.setOption(option);
}

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
	var year = $('#yearSelect').val();
	// 使用
	require( [ 'echarts',
	           'echarts/chart/bar', 
	           'echarts/chart/line'
	    ] ,
	    function(ec) {
			draw(ec, diseaseUuid, diseaseName, year);
		}
	);
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