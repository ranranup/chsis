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
<title>免疫记录</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- fileinput组件样式 -->
<link href="assets/fileinput/fileinput.min.css" rel="stylesheet">

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
				<ul class="breadcrumb">
					<li>当前位置：</li>
					<li><a href="medicalRecord/toCreate">新建记录</a></li>
					<li class="active">预防免疫记录</li>
				</ul>
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							预防免疫记录
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal" method="post" action="immuneRecord/edit">
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>疫苗名称：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${immuneRecord.vaccine }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>接种病人：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${immuneRecord.patient.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>接种医院：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${immuneRecord.hospital.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>接种时间：</b></label>
									<div class="col-sm-10">
										<div style="margin-top:7px;">${immuneRecord.immuneTime }</div>
									</div>
								</div>
							</div>
						</form>
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
	<script src="assets/js/doctor/dropDownList.js"></script>
	
	<!-- fileinput组件 -->
	<script type="text/javascript" src="assets/fileinput/fileinput.min.js"></script>
	<script type="text/javascript" src="assets/fileinput/fileinput_locale_zh.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/js/file.js"></script>
	<script src="assets/adminex/js/scripts.js"></script>
	
	<script>
		$(function(){
			/* 导航颜色 */
			$("#navi_doctor_toCreate").addClass('active');
		});	
	</script>
</body>
</html>