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
<title>科室详情</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- fileinput组件样式 -->
<link href="assets/fileinput/fileinput.min.css" rel="stylesheet">

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
				<ul class="breadcrumb">
					<li>当前位置：</li>
					<li><a href="department/manage">科室管理</a></li>
					<li class="active">科室信息详请</li>
				</ul>
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">科室详情</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<section class="panel col-sm-3">
								<header class="panel-heading">
									<b>科室编号：</b>${department.number }
								</header>
								<header class="panel-heading">
									<b>科室名称：</b>${department.name }
								</header>
								<header class="panel-heading">
									<b>所属医院：</b>${department.hospital.name }
								</header>
								<header class="panel-heading">
									<b>科室描述：</b>
								</header>
								<div class="panel-body">
									${department.description }
								</div>
							</section>
							<div class="panel col-sm-9">
								<div class="panel-heading">
									<h3 class="panel-title">
										医生信息 
										<sec:authorize access="hasRole('ROLE_a4e1e6643411452ebaf5d0730108800e')">
											<span class="tools pull-right"> 
												<button class="btn btn-warning pull-left btn-add-doctor">添加医生</button>
											</span>
										</sec:authorize>
									</h3>
								</div>
								<div class="panel-body">
									<table class="table table-bordered table-responsive table-hover">
										<tr class="info">
											<th>编号</th>
											<th>姓名</th>
											<th>电话</th>
											<th>学历</th>
											<th>职称</th>
											<th>操作</th>
										</tr>
										<c:forEach items="${doctors }" var="doctor">
											<tr>
												<td>${doctor.number }</td>
												<td>${doctor.name }</td>
												<td>${doctor.phone }</td>
												<td>
													<c:if test="${doctor.diploma == 0}">专科</c:if>
													<c:if test="${doctor.diploma == 1}">本科</c:if>
													<c:if test="${doctor.diploma == 2}">硕士</c:if>
													<c:if test="${doctor.diploma == 3}">博士</c:if>
													<c:if test="${doctor.diploma == 4}">博士后</c:if>
												</td>
												<td>
													<c:if test="${doctor.title == 0}">护士</c:if>
													<c:if test="${doctor.title == 1}">医师</c:if>
													<c:if test="${doctor.title == 2}">主治医师</c:if>
													<c:if test="${doctor.title == 3}">副主任医师</c:if>
													<c:if test="${doctor.title == 4}">主任医师</c:if>
												</td>
												<td>
													<sec:authorize access="hasRole('ROLE_0a4991bf50ec4330bb552300be758258')">
														<button class="btn btn-danger btn-sm" onclick="deleteDoctor('${doctor.uuid}','${department.uuid }')">删除</button> 
													</sec:authorize>
													<sec:authorize access="hasRole('ROLE_484f2fba719f45a1b58a7a876e9f7b2e')">
														<button class="btn btn-primary btn-sm btn-doctorDetail" uuid="${doctor.uuid }">详情</button>
													</sec:authorize>
												</td>
										</tr>
										</c:forEach>
									</table>
								</div>
							</div>
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
	
	<!-- Modal Start -->
	<div class="modal fade" id="addDoctor" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加医生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="doctor/addDoctor" enctype="multipart/form-data">
						<input id="departmentUuid" type="hidden" name="departmentUuid" value="${department.uuid }" />
						<div class="row container">
							<div class="form-group" id="adddoc-userNameGroup">
								<label class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-userName" class="form-control" name="userName" type="text" placeholder="用户名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-passwordGroup">
								<label class="col-sm-2 control-label">密码</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-password" class="form-control" name="password" type="password" placeholder="密码">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-numberGroup">
								<label class="col-sm-2 control-label">医生编号</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-number" class="form-control" name="number" type="text" placeholder="医生编号">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-nameGroup">
								<label class="col-sm-2 control-label">医生姓名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-name" class="form-control" name="name" type="text" placeholder="医生姓名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-imgGroup">
								<label class="col-sm-2 control-label">医生照片</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input type="file" id="input-id" name="file_data" />
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-sexGroup">
								<label class="col-sm-2 control-label">医生性别</label>
								<div class="col-sm-3 text-left">
									<div class="iconic-input right">
										<label class="radio-inline"> 
											<input type="radio" name="sex" checked id="male" value="0"> 男
										</label> 
										<label class="radio-inline"> 
											<input type="radio" name="sex" id="female" value="1"> 女
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-phoneGroup">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="adddoc-phone" class="form-control" name="phone" type="text" placeholder="电话">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-diplomaGroup">
								<label class="col-sm-2 control-label">学历</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="diploma" name="diploma" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-titleGroup">
								<label class="col-sm-2 control-label">职称</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="title" name="title" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="adddoc-descriptionGroup">
								<label class="col-sm-2 control-label">医生描述</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<textarea id="adddoc-description" class="form-control" name="description" rows="5" placeholder="请输入对医生的描述信息"></textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info adddoc-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="doctorDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/doctor.png" alt="医生图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 查看医生信息
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-3">
						<img id="doctor-photo" src="" alt="医生照片" style="height: auto; width: 145px;" />
					</div>
					<div class="col-sm-9">
						<session class="panel col-sm-6">
							<header class="panel-heading">
								编号 ：<span id="doctor-number"></span>
							</header>
							<header class="panel-heading">
								姓名 ：<span id="doctor-name"></span>
							</header>
							<header class="panel-heading">
								性别：<span id="doctor-sex"></span>
							</header>
						</session>
						<session class="panel col-sm-6">
							<header class="panel-heading">
								电话 ：<span id="doctor-phone"></span>
							</header>
							<header class="panel-heading">
								学历：<span id="doctor-diploma"></span>
							</header>
							<header class="panel-heading">
								职称：<span id="doctor-title"></span>
							</header>
						</session>
						<session class="panel col-sm-12">
							<header class="panel-heading">
								医生描述：
							</header>
							<div class="panel-body" id="doctor-description"></div>
						</session>
					</div>
				</div>
				<div class="modal-footer"></div>
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
	
	<!-- fileinput组件 -->
	<script type="text/javascript" src="assets/fileinput/fileinput.min.js"></script>
	<script type="text/javascript" src="assets/fileinput/fileinput_locale_zh.js"></script>
	
	<!-- Custom JS -->
	<script src="assets/js/file.js"></script>
	<script src="assets/js/hospitalManager/dropDownList.js"></script>
	<script src="assets/js/hospitalManager/departmentDetail.js"></script>
    
</body>
</html>