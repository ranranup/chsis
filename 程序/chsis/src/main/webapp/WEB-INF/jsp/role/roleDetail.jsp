<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>角色详情</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">
<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="assets/css/companyDetail.css" rel="stylesheet" type="text/css">
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
					<li><a href="role/manager">角色管理</a></li>
					<li class="active">角色信息详情</li>
				</ul>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							角色信息详情
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<br>
						<div class="row">
							<label class="col-sm-2 text-right">角色中文名:</label> <label class="col-sm-8 text-left">${role.cName}</label>
						</div>
						
						<div class="row">
							<label class="col-sm-2 text-right">角色英文名:</label> <label class="col-sm-8 text-left">${role.eName}</label>
						</div>
				
						<div class="row">
							<label class="col-sm-2 text-right">角色描述:</label> <label class="col-sm-8">${role.description}</label>
						</div>
						
						<c:forEach items="${roleResourceList}" var="roleResource" varStatus="id">
							<div class="row">
								<c:if test="${id.index+1 == 1 }"><label class="col-sm-2 text-right">资源列表:</label></c:if>
								<c:if test="${id.index+1 != 1 }"><label class="col-sm-2 text-right"></label></c:if>
								<label class="col-sm-8">${roleResource.resource.name }&nbsp;&nbsp;|&nbsp;&nbsp;${roleResource.resource.url }</label><br>
							</div>
						</c:forEach>
				
						<div class="row">
							<br>
							<div class="col-sm-offset-3  col-sm-20">
								<c:if test="${role.uuid !=0 && role.uuid !=1 && role.uuid !=2 && role.uuid !=3 && role.uuid !=4 && role.uuid !=5}">
									<sec:authorize access="hasRole('ROLE_a9278833f99f44eda6eb5dc12f954a0f')">
										<a href="role/toUpdate/${role.uuid}"  class="btn btn-warning" type="button">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</sec:authorize>
								</c:if>
								<sec:authorize access="hasRole('ROLE_5888fb0706114603b6a18e052c39c8c3')">
									<a href="role/toAllocateResource/${role.uuid}"  class="btn btn-info" type="button">分配资源</a>&nbsp;&nbsp;&nbsp;&nbsp;
								</sec:authorize>
								<c:if test="${role.uuid !=0 && role.uuid !=1 && role.uuid !=2 && role.uuid !=3 && role.uuid !=4 && role.uuid !=5}">
									<sec:authorize access="hasRole('ROLE_d9b4cebbad0a456189612e79111e6626')">
										<a class="btn btn-danger" onclick="deleteRole('${role.uuid}')">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
									</sec:authorize>
								</c:if>
								<sec:authorize access="hasRole('ROLE_c698654dd2254608920cdb3d7f1bbe9d')">
									<a href="role/manager" class="btn btn-primary"  type="button">查看角色列表</a>
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
	<script src="assets/js/role/roleDetail.js"></script>
</body>

</html>
