<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>新建记录</title>

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
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							基本信息
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row container">
							<label class="col-sm-2 control-label" style="margin-top:5px;">请输入病人的身份证号：</label>
							<div class="col-sm-4" id="idNo-inputGroup">
								<div class="iconic-input right">
									<input id="idNo-input" class="form-control" type="text" placeholder="请输入病人的身份证号" data-provide="typeahead" data-items="4">
									<p class="help-block"></p>
								</div>	
							</div>
							<button id="btn-clear" class="btn btn-default">清空</button>
							<sec:authorize access="hasRole('ROLE_f1ac35ed65c04140b5d4b50410f2fffa')">
								<button class="btn btn-danger btn-createMedicalRecord">新建就诊记录</button>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_0bafaf6024924aa18c5bcbe728c75b02')">
								<button class="btn btn-success btn-createHealthRecord">新建体检记录</button>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_e88511afa07d41df8d6e62d546f4f055')">
								<button class="btn btn-warning btn-createImmuneRecord">新建预防免疫记录</button>
							</sec:authorize>
						</div>
						<div class="blank"></div>
						<div id="detail" class="col-sm-12" hidden>
							<div class="row col-sm-offset-2">
								<div class="col-sm-2">
									<h5>病人姓名 ：</h5>
								</div>
								<div class="col-sm-6">
									<h5 id="name"></h5>
								</div>
							</div>
							<div class="row col-sm-offset-2">
								<div class="col-sm-2">
									<h5>身份证号 ：</h5>
								</div>
								<div class="col-sm-6">
									<h5 id="idNo"></h5>
								</div>
							</div>
							<div class="row col-sm-offset-2">
								<div class="col-sm-2">
									<h5>病人性别 ：</h5>
								</div>
								<div class="col-sm-6">
									<h5 id="sex"></h5>
								</div>
							</div>
							<div class="row col-sm-offset-2">
								<div class="col-sm-2">
									<h5>病人年龄 ：</h5>
								</div>
								<div class="col-sm-6">
									<h5 id="age"></h5>
								</div>
							</div>
							<div class="row col-sm-offset-2">
								<div class="col-sm-2">
									<h5>疾病史 ：</h5>
								</div>
								<div class="col-sm-6">
									<h5 id="diseaseHistory"></h5>
								</div>
							</div>
							<div class="blank"></div>
						</div>
			        </div>
				</div>
				<!-- panel end -->
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	<script src="assets/js/bootstrap-typeahead.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/doctor/record.js"></script>
</body>
</html>