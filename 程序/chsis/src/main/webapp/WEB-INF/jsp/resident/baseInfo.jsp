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
<title>居民基本信息</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/resident/index.css" rel="stylesheet">
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
							<sec:authorize access="hasRole('ROLE_4989828159714b6c83e6943f7c3b5c94')">
								<span class="tools pull-right"> 
									<button class="btn btn-warning pull-left btn-edit-baseInfo">修改基本信息</button>
									<a class="fa fa-chevron-down" href="javascript:;"></a>
								</span>
							</sec:authorize>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>居民姓名：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${resident.name }
									</header>
								</session>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>居民性别：
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${resident.sex==0 }">男</c:if>
										<c:if test="${resident.sex==1 }">女</c:if>
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>身份证号：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${resident.idNo }
									</header>
								</session>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>所属民族：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading" id="nationCode" nationCode="${resident.nation }">
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>出生日期：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										${resident.birth }
									</header>
								</session>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>居民年龄：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${resident.age==null }">未填</c:if>
										<c:if test="${resident.age!=null }">${resident.age }岁</c:if>
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>年龄分段：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${resident.period==0 }">婴幼儿</c:if>
										<c:if test="${resident.period==1 }">儿童</c:if>
										<c:if test="${resident.period==2 }">青少年</c:if>
										<c:if test="${resident.period==3 }">青年</c:if>
										<c:if test="${resident.period==4 }">中年</c:if>
										<c:if test="${resident.period==5 }">中老年</c:if>
										<c:if test="${resident.period==6 }">老年</c:if>
										<c:if test="${resident.period==null }">未填</c:if>
									</header>
								</session>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>联系电话：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${resident.phone==null }">未填</c:if>
										${resident.phone }
									</header>
								</session>
							</div>
						</div>	
						<div class="row">
							<div class="col-sm-2 col-sm-offset-3">
								<session class="panel">
									<header class="panel-heading text-center">
										<b>婚姻状况：</b>
									</header>
								</session>
							</div>
							<div class="col-sm-3">
								<session class="panel">
									<header class="panel-heading">
										<c:if test="${resident.marriage==0 }">未婚</c:if>
										<c:if test="${resident.marriage==1 }">已婚</c:if>
										<c:if test="${resident.marriage==2 }">离异</c:if>
										<c:if test="${resident.marriage==null }">未填</c:if>
									</header>
								</session>
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

	<!-- Modal Start-->
	<div class="modal fade" id="editBaseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 修改基本信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="POST" action="resident/edit">
						<input id="residentUuid" type="hidden" name="uuid" value="${resident.uuid }">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民姓名:</label>
								<div class="col-sm-3">
									<label class="control-label">
										${resident.name }
									</label>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民性别:</label>
								<div class="col-sm-3">
									<label class="control-label">
										<c:if test="${resident.sex==0 }">男</c:if>
										<c:if test="${resident.sex==1 }">女</c:if>
									</label>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">身份证号:</label>
								<div class="col-sm-3">
									<label class="control-label">
										${resident.idNo }
									</label>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所属民族:</label>
								<div class="col-sm-3">
									<select id="nation" class="form-control" name="nation" nationCode="${resident.nation }"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="edit-birthGroup">
								<label class="col-sm-1 col-sm-offset-1 control-label">出生日期:</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="birth" class="form-control" type="text" name="birth" placeholder="出生日期，如：19931201" value="${resident.birth }">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="edit-ageGroup">
								<label class="col-sm-1 col-sm-offset-1 control-label">居民年龄:</label>
								<div class="col-sm-3">
									<select id="age-select" name="age" class="form-control"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">年龄分段:</label>
								<div class="col-sm-3">
									<select id="period" class="form-control" name="period" periodCode="${resident.period }"></select>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="edit-phoneGroup">
								<label class="col-sm-1 col-sm-offset-1 control-label">联系电话:</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="phone" class="form-control" type="text" name="phone" placeholder="请输入您的联系电话" value="${resident.phone }">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">婚姻状况:</label>
								<div class="col-sm-3">
									<select id="marriage" class="form-control" name="marriage" marriageCode="${resident.marriage }"></select>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-5">
							<button class="btn btn-info" id="submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/resident/baseInfo.js"></script>
</body>
</html>
