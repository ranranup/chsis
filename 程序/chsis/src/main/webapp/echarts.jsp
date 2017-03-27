<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>测试</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="description" content="This is my page">
</head>

<body>
	<div id="main" style="height: 400px"></div>
</body>
<script src="assets/js/chsis/jquery.min.js"></script>
<script src="assets/echarts/echarts.js"></script>

<script type="text/javascript">
	//路径配置
	require.config({
		paths : {
			echarts : 'assets/echarts'
		}
	});

	// 使用
	require(
		[ 'echarts',
		  'echarts/chart/bar', 
		  'echarts/chart/line', 
		  'echarts/chart/pie' 
		], draw);

	function draw(ec) {
		// 基于准备好的dom，初始化echarts图表
		var myChart = ec.init(document.getElementById('main'));

		
	option = {
			title : {
				text : '某地区蒸发量和降水量',
				subtext : '纯属虚构'
			},
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				data : [ '蒸发量', '降水量' ]
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
						name : '蒸发量',
						type : 'bar',
						data : [ 2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2,
								32.6, 20.0, 6.4, 3.3 ],
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
					},
					{
						name : '降水量',
						type : 'bar',
						data : [ 2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2,
								48.7, 18.8, 6.0, 2.3 ],
						markPoint : {
							data : [ {
								name : '年最高',
								value : 182.2,
								xAxis : 7,
								yAxis : 183,
								symbolSize : 18
							}, {
								name : '年最低',
								value : 2.3,
								xAxis : 11,
								yAxis : 3
							} ]
						},
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						}
					} ]
		};

		// 为echarts对象加载数据 
		myChart.setOption(option);
	}
</script>
</html>