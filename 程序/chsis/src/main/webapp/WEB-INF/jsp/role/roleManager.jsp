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

<title>角色管理</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/roleManager.css" rel="stylesheet" type="text/css">
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
						角色管理
						<span class="tools pull-right"> 
							<a class="fa fa-chevron-down" href="javascript:;"></a>
						</span>
					</h3>
				</div>
				<div class="panel-body">
					<!-- 员工查询 -->
					<div class="row">
						<sec:authorize access="hasRole('ROLE_a1e00ec329a74bfeb6bbc719d718f911')">
							<div class="col-lg-2" >
								<a href="role/toAddRole" class="btn btn-warning" type="button">+添加新角色</a>
							</div>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_5aef36ca7e8143f7938c41a35ce004c6')">
							<form class="form-inline" action="role/search">
								<div class="col-lg-2">
									<div class="form-group">
										<input type="text" class="form-control" name="cName" placeholder="请输入中文角色名">&nbsp;&nbsp;&nbsp;&nbsp;
									</div>
								</div>
								<div class="col-lg-2">
									<div class="form-group">
										<input type="text" class="form-control" name="eName" placeholder="请输入英文角色名">&nbsp;&nbsp;&nbsp;&nbsp;
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
											<th class="text-center">中文角色名</th>
											<th class="text-center">英文角色名</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${roleList}" var="role" varStatus="id">
											<tr>
												<td>${id.index+1 }</td>
												<td>${role.cName }</td>
												<td>${role.eName }</td>
												<td>
													<div class="btn-group">
														<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
															操作 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu" style="min-width: 60px">
															<sec:authorize access="hasRole('ROLE_bf5f545551724ce9b75e33b8cdd6348b')">
																<li><a href="role/detail/${role.uuid }">详情</a></li>
															</sec:authorize>
															<c:if test="${role.uuid != '0' && role.uuid !='1' && role.uuid !='2' && role.uuid !='3' && role.uuid !='4' && role.uuid !='5'}">
																<sec:authorize access="hasRole('ROLE_a9278833f99f44eda6eb5dc12f954a0f')">
																	<li><a href="role/toUpdate/${role.uuid }">编辑</a></li>
																</sec:authorize>
															</c:if>
															<sec:authorize access="hasRole('ROLE_5888fb0706114603b6a18e052c39c8c3')">
																<li><a href="role/toAllocateResource/${role.uuid }">分配资源</a></li>
															</sec:authorize>
															<c:if test="${role.uuid != '0' && role.uuid !='1' && role.uuid !='2' && role.uuid !='3' && role.uuid !='4' && role.uuid !='5'}">
																<sec:authorize access="hasRole('ROLE_d9b4cebbad0a456189612e79111e6626')">
																	<li><a onclick="deleteRole('${role.uuid}')">删除</a></li>
																</sec:authorize>
															</c:if>
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
	<script src="assets/js/role/roleManager.js"></script>
</body>
</html>