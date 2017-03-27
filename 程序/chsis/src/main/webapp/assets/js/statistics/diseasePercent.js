$(function() {
	
	//路径配置
	require.config({
		paths : {
			echarts : 'assets/echarts'
		}
	});

	//选择疾病名称确定时的点击事件
	$('#submit').on('click', function() {
		var period = $('#period').val();
		var periodCN = $('#period').find('option:selected').text();
		require( [ 'echarts',
		           'echarts/chart/pie', 
		           'echarts/chart/funnel'
		    ] ,
		    function(ec) {
				draw(ec, period, periodCN);
			}
		);
		return false;
	});

});	
	
function draw(ec, period, periodCN) {
	// 基于准备好的dom，初始化echarts图表
	var myChart = ec.init(document.getElementById('main'));
	var returnData = null;
	
	$.ajax({
		url : "statistics/diseasePercent" ,
		type : "POST" ,
		data : {'period' : period},
		cache : false , 
		async : false , 
		dataType : "json" ,
		success : function(data) {
			returnData = data;
		} 
	});

	option = {
		    title : {
		        text: periodCN + '发病率统计',
		        subtext: '阳光社区',
		        x:'center'
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient : 'vertical',
		        x : 'left',
		        data: returnData.diseaseNames
		    },
		    toolbox: {
		        show : true,
		        feature : {
		            mark : {show: true},
		            dataView : {show: true, readOnly: false},
		            magicType : {
		                show: true, 
		                type: ['pie', 'funnel'],
		                option: {
		                    funnel: {
		                        x: '25%',
		                        width: '50%',
		                        funnelAlign: 'center',
		                        max: returnData.piePairs[0].value
		                    }
		                }
		            },
		            restore : {show: true},
		            saveAsImage : {show: true}
		        }
		    },
		    calculable : true,
		    series : [
		        {
		            name:'疾病名称',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data: returnData.piePairs
		        }
		    ]
		};

	// 为echarts对象加载数据 
	myChart.setOption(option);
}
