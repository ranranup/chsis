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

<title>添加管理员</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- Custom Style -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
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
				<ul class="breadcrumb">
					<li>当前位置：</li>
					<li><a href="manager/manage">管理员管理</a></li>
					<li class="active">添加管理员</li>
				</ul>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							添加管理员
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form id="form" class="form-horizontal" method="post" action="manager/addManager" role="form">
							<br>
							<div class="form-group" id="userNameGroup">
								<label for="userName" class="col-sm-3 control-label">用户名</label>
                                <div class="col-lg-3">
                                    <div class="iconic-input right">
                                        <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
                                        <p class="help-block"></p>
                                    </div>
                                </div>
							</div>
							<div class="form-group" id="passwordGroup">
								<label for="password" class="col-sm-3 control-label">初始密码</label>
                                <div class="col-lg-3">
                                    <div class="iconic-input right">
                                        <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                                        <p class="help-block"></p>
                                    </div>
                                </div>
							</div>
							<div class="form-group" id="nameGroup">
								<label for="name" class="col-sm-3 control-label">姓名</label>
								<div class="col-lg-3">
                                    <div class="iconic-input right">
										<input type="text" class="form-control" id="name" name="name" placeholder="请输入姓名">
                                        <p class="help-block"></p>
                                    </div>
                                </div>
							</div>
							<div class="form-group" id="phoneGroup">
								<label for="name" class="col-sm-3 control-label">联系电话</label>
								<div class="col-lg-3">
                                    <div class="iconic-input right">
										<input type="text" class="form-control" id="phone" name="phone" placeholder="请输入联系电话">
                                        <p class="help-block"></p>
                                    </div>
                                </div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">管理员类别</label>
								<div class="col-sm-3">
									<select class="form-control" name="type" id="type-select">
										<optgroup label="请选择所属管理员类别（只能选一个）">
						             		<option value="2">系统管理员</option>
						             		<option value="1">审核员</option>
						             		<option value="0">医院管理员</option>
						        		</optgroup>
									</select>
								</div>
							</div>
							<div class="form-group" id="div-hide" hidden>
								<label class="col-sm-3 control-label">所属医院</label>
								<div class="col-sm-3">
									<select class="form-control" id="hospitalName" name="hospitalUuid">
										<optgroup label="请选择所属医院（只能选一个）">
						             		<c:forEach items="${hospitals}" var="hospital" varStatus="id">
						             			<option value="${hospital.uuid}">${hospital.name}</option>
						             		</c:forEach>
						        		</optgroup>
									</select>
								</div>
							</div>
							<div class="panel-body">
								<label class="col-sm-3 control-label"></label>
								<sec:authorize access="hasRole('ROLE_e3669d837bab4fdaad327ea096303005')">	
									<button class="btn btn-primary" type="submit" id="submit">保存</button>
								</sec:authorize>
							</div>
						</form>
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
	<script src="assets/js/admin/addManager.js"></script>
</body>
</html>
