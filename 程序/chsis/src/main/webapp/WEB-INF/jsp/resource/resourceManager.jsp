<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>资源管理</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
</head>
<body class="sticky-header">
	<section> <!-- 左侧导航栏  开始 -->
	<div><%@ include file="/include/left-side.jsp"%></div>
	<!-- 左侧导航栏  结束--> <!-- 主要内容  开始-->
	<div class="main-content">
		<!-- 头部  开始-->
		<div><%@ include file="/include/header.jsp"%></div>
		<!-- 头部  结束 -->


		<!--页面主体  开始-->
		<div class="wrapper">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						资源管理
						<span class="tools pull-right"> 
							<a class="fa fa-chevron-down" href="javascript:;"></a>
						</span>
					</h3>
				</div>
				<div class="panel-body">
					<!-- 员工查询 -->
					<div class="row">
						<sec:authorize access="hasRole('ROLE_490cfe600e5c4b55a3581dad619eca48')">
							<div class="col-lg-2" >
								<a href="resource/toAddResource" class="btn btn-warning" type="button">+添加新资源</a>
							</div>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_cd906dea2fa449ddabd20275cdfe3f03')">
							<form class="form-inline" action="resource/search">
								<div class="col-lg-2">
									<div class="form-group">
										<input type="text" class="form-control" name="name" placeholder="请输入资源名称">&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
								<div class="col-lg-2">
									<div class="form-group">
										<input type="text" class="form-control" name="url" placeholder="请输入资源URL">&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
								<div class="col-lg-2">
									<button type="submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;搜 &nbsp; 索&nbsp;&nbsp;&nbsp;</button>
								</div>
							</form>	
						</sec:authorize>
					</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="table-responsive">
								<table class="table table-bordered text-center">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">资源编号</th>
											<th class="text-center">资源URL</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${resourceList}" var="resource" varStatus="id">
											<tr>
												<td>${id.index+1 }</td>
												<td>${resource.name }</td>
												<td>${resource.url }</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															操作 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" style="min-width: 60px">
															<sec:authorize access="hasRole('ROLE_ba6069d6c63b4268b95ed96bf922f05e')">
																<li><a href="resource/detail/${resource.uuid }">详情</a></li>
															</sec:authorize>
															<sec:authorize access="hasRole('ROLE_b7a6f4539d82457aae13b0667bd523eb')">
																<li><a href="resource/toUpdate/${resource.uuid }">编辑</a></li>
															</sec:authorize>
															<sec:authorize access="hasRole('ROLE_0ace598e0bd24b528e2fe7136e6f68d7')">
																<li><a onclick="deleteResource('${resource.uuid}')">删除</a></li>
															</sec:authorize>
														</ul>
													</div>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div>查询到${totals }条记录/共${totalPages }页</div>
							</div>
						</div>
					</div>
					<!-- 分页组件 -->
					<%@ include file="/include/page.jsp"%>
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
	<script src="assets/js/resource/resourceManager.js"></script>
</body>
</html>