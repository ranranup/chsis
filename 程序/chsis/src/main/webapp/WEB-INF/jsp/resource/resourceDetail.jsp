<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="shortcut icon" href="assets/image/favicon.ico">

<title>资源详情</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">
<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="assets/css/resourceDetail.css" rel="stylesheet" type="text/css">
</head>
<body class="sticky-header">
	<section> <!-- 左侧导航栏  开始 -->
		<div><%@ include file="/include/left-side.jsp"%></div>
		<!-- 左侧导航栏  结束--> <!-- 主要内容  开始-->
		<div class="main-content">
			<!-- 头部  开始-->
			<div><%@ include file="/include/header.jsp"%></div>
			<!-- 头部  结束 -->
	
			<!-- 页面标题	开始 -->
			<div class="page-heading"></div>
			<!-- 页面标题	结束-->
	
			<!--页面主体  开始-->
			<div class="wrapper">
				<ul class="breadcrumb">
					<li>当前位置：</li>
					<li><a href="resource/manager">资源管理</a></li>
					<li class="active">资源信息详情</li>
				</ul>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							资源信息详情
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<br>
						<div class="row">
							<label class="col-sm-2 text-right">资源名称:</label> <label class="col-sm-8 text-left">${resource.name}</label>
						</div>
						
						<div class="row">
							<label class="col-sm-2 text-right">资源URL:</label> <label class="col-sm-8 text-left">${resource.url}</label>
						</div>
				
						<div class="row">
							<label class="col-sm-2 text-right">资源描述:</label> <label class="col-sm-8">${resource.description}</label>
						</div>
				
						<br><br><br>
						<div class="row">
							<br>
							<div class="col-sm-offset-1">
								<sec:authorize access="hasRole('ROLE_b7a6f4539d82457aae13b0667bd523eb')">
									<a href="resource/toUpdate/${resource.uuid}"  class="btn btn-warning" type="button">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_0ace598e0bd24b528e2fe7136e6f68d7')">
									<a class="btn btn-danger" onclick="deleteResource('${resource.uuid}')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_ada7dc08b7b440d4a83249062c065a20')">
									<a href="resource/manager" class="btn btn-primary"  type="button">查看资源列表</a>
								</sec:authorize>
							</div>
						</div>
					</div>
				</div>
			</div>
	
			<!--页脚区域  开始-->
			<div><%@ include file="/include/footer.jsp"%></div>
			<!--页脚区域  结束-->
		</div>
	</section>
	
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<!-- Custom JS -->
	<script src="assets/js/resource/resourceDetail.js"></script>
</body>

</html>
