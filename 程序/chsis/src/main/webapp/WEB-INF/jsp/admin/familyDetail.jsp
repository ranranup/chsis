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
<title>家庭详情</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/admin/index.css" rel="stylesheet">
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
					<li><a href="family/manage">家庭管理</a></li>
					<li class="active">家庭信息详请</li>
				</ul>
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							家庭基本信息
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="row">
							<section class="panel col-sm-6">
								<header class="panel-heading">
									家庭编号：${family.number }
								</header>
								<header class="panel-heading">
									户主姓名：${householderName }
								</header>
								<header class="panel-heading">
									家庭电话：${family.phone }
								</header>
								<header class="panel-heading">
									家庭地址：${family.address }
								</header>
							</section>
							<section class="panel col-sm-6">
								<header class="panel-heading">
									所在社区：${family.community.name }
								</header>
								<header class="panel-heading">
									社区地址：${family.community.address }
								</header>
								<header class="panel-heading">
									社区描述：
								</header>
								<div class="panel-body">
									${family.community.description }
								</div>
							</section>
						</div>
					</div>
				</div>
				<!-- panel end -->

				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							家庭成员信息
							 <span class="tools pull-right"> 
							 	<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>用户名</th>
								<th>姓名</th>
								<th>性别</th>
								<th>身份证号</th>
								<th>电话</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${residents}" var="resident">
								<tr>
									<td>${resident.userName }</td>
									<td>${resident.name }</td>
									<td>
										<c:if test="${resident.sex=='0' }">男</c:if>
										<c:if test="${resident.sex=='1' }">女</c:if>
									</td>
									<td>${resident.idNo }</td>
									<td>${resident.phone }</td>
									<td>
										<%-- <sec:authorize access="hasRole('ROLE_2b5cfbe32aff47eaaa93074950c6b75b')">	
											<button class="btn btn-danger btn-sm deleteResident" onclick="deleteResident('${resident.uuid}')">删除</button> 
										</sec:authorize> --%>
										<sec:authorize access="hasRole('ROLE_ef36fad1e3774a11b233067b3bf5f6a1')">	
											<button class="btn btn-primary btn-sm btn-residentDetail" uuid="${resident.uuid }">详情</button> 
										</sec:authorize>
										<%-- <sec:authorize access="hasRole('ROLE_4989828159714b6c83e6943f7c3b5c94')">	
											<button class="btn btn-info btn-sm btn-edit-resident" uuid="${resident.uuid }">修改</button>
										</sec:authorize> --%>
									</td>
								</tr>
							</c:forEach>
						</table>
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
	<div class="modal fade" id="residentDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 查看家庭成员信息
					</h4>
				</div>
				<div class="modal-body container col-sm-12">
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>居民姓名：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-name"></h5>
						</div>
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>居民性别：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-sex"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>身份证号：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="resident-idNo"></h5>
						</div>
						<div class="col-sm-3 text-right">
							<h5>
								<b>所属民族：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-nation"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>出生日期：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-birth"></h5>
						</div>
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>居民年龄：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-age"></h5>
						</div>
					</div>
					
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>年龄分段：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-period"></h5>
						</div>
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>联系电话：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-phone"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>婚姻状况：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-marriage"></h5>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="editResident" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;" /> 修改家庭成员信息
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="POST" action="family/editResident">
						<input id="editr-uuid" type="hidden" name="uuid" value="" />
						<div class="row container">
							<div class="form-group" id="editr-nameGroup">
								<label class="col-sm-2 control-label">居民姓名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-name" class="form-control" type="text" placeholder="请输入居民姓名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-sexGroup">
								<label class="col-sm-2 control-label">居民性别</label>
								<div class="col-sm-3 text-left">
									<div class="iconic-input right">
										<label class="radio-inline"> 
											<input type="radio" name="inlineRadioOptions" id="male" value="0" checked> 男
										</label> 
										<label class="radio-inline"> 
											<input type="radio" name="inlineRadioOptions" id="female" value="1"> 女
										</label>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-idNoGroup">
								<label class="col-sm-2 control-label">身份证号</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-idNo" class="form-control" type="text" placeholder="身份证号">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-nationGroup">
								<label class="col-sm-2 control-label">所属民族</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="nation" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-birthGroup">
								<label class="col-sm-2 control-label">出生日期</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-birth" class="form-control" type="text" placeholder="出生日期，如：19931201">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-ageGroup">
								<label class="col-sm-2 control-label">居民年龄</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-age" class="form-control" type="text" placeholder="居民年龄">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-periodGroup">
								<label class="col-sm-2 control-label">年龄分段</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="period" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-phoneGroup">
								<label class="col-sm-2 control-label">联系电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-phone" class="form-control" type="text" placeholder="联系电话" value="18222993338">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-marriageGroup">
								<label class="col-sm-2 control-label">婚姻状况</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<select id="marriage" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-offset-2">
								<sec:authorize access="hasRole('ROLE_4989828159714b6c83e6943f7c3b5c94')">	
									<button class="btn btn-info">保存</button>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_4989828159714b6c83e6943f7c3b5c94')">	
									<button class="btn btn-default">取消</button>
								</sec:authorize>
							</div>
						</div>
					</form>
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
    <script src="assets/js/admin/dropDownList.js"></script>
    <script src="assets/js/admin/familyDetail.js"></script>
</body>
</html>