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
<title>科室管理</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/hospitalManager/index.css" rel="stylesheet">

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
							科室管理
							<sec:authorize access="hasRole('ROLE_790d5474983c47e08cd7fabb35dbd20c')">
								<span class="tools pull-right"> 
									<button class="btn btn-warning pull-left btn-add-department">添加科室</button>
									<a class="fa fa-chevron-down" href="javascript:;"></a>
								</span>
							</sec:authorize>
						</h3>
					</div>
					<div class="panel-body">
						<sec:authorize access="hasRole('ROLE_5b71d03556c946e09acd9c7416d9b9d9')">
							<form class="form-inline" action="department/search">
								<input class="form-control" name="number" type="text" placeholder="请输入科室编号"> 
								<input class="form-control" name="name" type="text" placeholder="请输入科室名称">
								<button class="btn btn-info">搜索</button>
							</form>
						</sec:authorize>
						<div class="blank"></div>
						<table class="table table-bordered table-responsive table-hover">
							<tr>
								<th colspan="4">科室信息</th>
							</tr>
							<tr class="info">
								<th>科室编号</th>
								<th>科室名称</th>
								<th>所属医院</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${departments }" var="department">
								<tr>
									<td>${department.number }</td>
									<td>${department.name }</td>
									<td>${department.hospital.name }</td>
									<td>
										<sec:authorize access="hasRole('ROLE_61482f1e49f0491eab45e6af01d09fd9')">
											<buttun class="btn btn-danger btn-sm" onclick="deleteDepartment('${department.uuid}','${url }')">删除</buttun> 
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_58b78211eb6b40cc85ee7eab5f84335a')">
											<a href="department/detail/${department.uuid }" class="btn btn-primary btn-sm">详情</a>
										</sec:authorize>
									</td>
								</tr>
							</c:forEach>
						</table>

						<div>查询到${totals }条记录/共${totalPages }页</div>
		                <!-- pagination start -->
		                <%@include file="/include/page.jsp" %>
						<!-- pagination end -->
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
	
	<!-- Modal Start -->
	<div class="modal fade" id="addDepartment" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加科室</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="department/addDepartment">
						<div class="row container">
							<div class="form-group" id="adddep-numberGroup">
								<label class="col-sm-2 control-label">科室编号</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddep-number" class="form-control" name="number" type="text" placeholder="科室编号">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddep-nameGroup">
								<label class="col-sm-2 control-label">科室名称</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddep-name" class="form-control" name="name" type="text" placeholder="科室名称">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddep-descriptionGroup">
								<label class="col-sm-2 control-label">科室描述</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<textarea id="adddep-description" class="form-control" name="description" rows="5" placeholder="请输入科室描述"></textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info" id="adddep-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
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

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/hospitalManager/department.js"></script>

</body>
</html>
