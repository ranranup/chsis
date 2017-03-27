<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="shortcut icon" href="assets/image/favicon.ico" type="image/png">
<title>多疾病发病率走势统计</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/doctor/index.css" rel="stylesheet">
</head>
<body class="sticky-header">
	<section>
		<!-- left-side start -->
		<%@ include file="/include/left-side.jsp"%>
		<!-- left-side end -->

		<!-- main content start-->
		<div class="main-content">
			<!-- header start -->
			<%@ include file="/include/header.jsp"%>
			<!-- header end -->

			<!--body wrapper start-->
			<div class="wrapper">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							多疾病发病率走势分析
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="form-inline">
							<div class="form-group">
								<button class="btn btn-success diseaseNameBtn">请选择疾病</button>
								<button class="btn btn-warning diseaseNameBtn">请选择疾病</button>
								<button class="btn btn-info diseaseNameBtn">请选择疾病</button>
							</div>
							<div class="form-group">
								<select id="yearSelect" class="form-control" name="year">
									<option value="2014">2014</option>
									<option value="2015">2015</option>
									<option value="2016">2016</option>
								</select>
							</div>
							<div class="form-group">
								<button class="btn btn-primary" id="submit">确定</button>
							</div>
						</div>
						<br/>
						<div id="main" style="height: 400px"></div><div id="main" style="height: 400px"></div>
					</div>
				</div>		
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>
	
	<!-- Modal Start -->
	<div class="modal fade" id="selectDiseaseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 疾病统计
					</h5>
				</div>
				<div class="modal-body row">
					<form class="form-inline" method="post" >
						<div class="form-group col-sm-offset-1">
							<div id="selectDiv">
								<select id="initSelect" class="form-control diseaseTypeSelect" name="disease"></select>
							</div>
						</div>
						<br/><br/>
						<div class="col-sm-offset-4">
							<button class="btn btn-success" id="confirmSelectBtn">确定</button>
							<button class="btn btn-warning" id="removeSelectBtn">清除</button>
							<button class="btn btn-info" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	<script src="assets/js/doctor/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/echarts/echarts.js"></script>
	
	<script src="assets/js/statistics/multipleDisease.js"></script>
	
	<script>
		$(function(){
			/* 导航颜色 */
			$("#navi_multipleDisease").addClass('active');
			$("#navi_multipleDisease").parent('ul').show();
			$("#navi_multipleDisease").parent().parent('li').addClass('nav-active');
		});	
	</script>
</body>
</html>