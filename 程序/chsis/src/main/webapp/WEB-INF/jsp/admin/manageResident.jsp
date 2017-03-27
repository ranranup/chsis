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
<title>居民管理</title>

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
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							居民管理
							 <span class="tools pull-right"> 
							 	<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<sec:authorize access="hasRole('ROLE_2d783fa1f7404e479d73686b80f8a706')">
							<form class="form-inline" action="resident/search">
		                    	<input name="userName" class="form-control" type="text" placeholder="请输入用户名">
		                    	<input name="name" class="form-control" type="text" placeholder="请输入姓名">
		                    	<select name="sex" class="form-control">
		                    		<option value="">性别</option>
		                    		<option value="0">男</option>
		                    		<option value="1">女</option>
		                    	</select>
		                   	 	<input name="idNo" class="form-control" type="text" placeholder="请输入身份证号">
		                   	 	<input name="familyNumber" class="form-control" type="text" placeholder="请输入家庭编号">
		                    	<button class="btn btn-info">搜索</button>
	                		</form>
                		</sec:authorize>
               			<div class="blank"></div>

						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>用户名</th>
								<th>姓名</th>
								<th>性别</th>
								<th>身份证号</th>
								<th>电话</th>
								<th>家庭编号</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${residents }" var="residentVO">
								<tr>
									<td>${residentVO.userName }</td>
									<td>${residentVO.name }</td>
									<td>
										<c:if test="${residentVO.sex == '0' }">男</c:if>
										<c:if test="${residentVO.sex == '1' }">女</c:if>
									</td>
									<td>${residentVO.idNo }</td>
									<td>${residentVO.phone }</td>
									<td>${residentVO.familyNumber }</td>
									<td>
										<sec:authorize access="hasRole('ROLE_2b5cfbe32aff47eaaa93074950c6b75b')">
											<button class="btn btn-danger btn-sm" onclick="deleteResident('${residentVO.uuid}','${url }')">删除</button>
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_ef36fad1e3774a11b233067b3bf5f6a1')">
											<button class="btn btn-primary btn-sm btn-residentDetail"  uuid="${residentVO.uuid }">详情</button>
										</sec:authorize>
										<sec:authorize access="hasRole('ROLE_4989828159714b6c83e6943f7c3b5c94')">
											<button class="btn btn-info btn-sm btn-edit-resident" uuid="${residentVO.uuid }">修改</button>
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
	<div class="modal fade" id="residentDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 居民基本信息
					</h4>
				</div>
				<div class="modal-body container col-sm-12">
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>居民姓名：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="resident-name"></h5>
						</div>
						<div class="col-sm-3 text-right">
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
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>家庭编号：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="family-number"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>家庭电话：</b>
							</h5>
						</div>
						<div class="col-sm-9 text-left">
							<h5 id="family-phone"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>家庭地址：</b>
							</h5>
						</div>
						<div class="col-sm-9 text-left">
							<h5 id="family-address"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>所在社区：</b>
							</h5>
						</div>
						<div class="col-sm-9 text-left">
							<h5 id="community-name"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>社区地址：</b>
							</h5>
						</div>
						<div class="col-sm-9 text-left">
							<h5 id="community-address"></h5>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="edit-resident" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;" /> 修改居民信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="POST" action="resident/edit">
						<input id="editr-uuid" type="hidden" name="uuid" value="" />
						<input type="hidden" name="url" value="${url }page=${pageIndex }" />
						<div class="row container">
							<div class="form-group" id="editr-nameGroup">
								<label class="col-sm-2 control-label">居民姓名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-name" name="name" class="form-control" type="text" placeholder="请输入居民姓名">
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
											<input type="radio" name="sex" id="male" value="0"> 男
										</label> 
										<label class="radio-inline"> 
											<input type="radio" name="sex" id="female" value="1"> 女
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
										<input id="editr-idNo" name="idNo" class="form-control" type="text" placeholder="身份证号">
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
										<select id="nation" name="nation" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-birthGroup">
								<label class="col-sm-2 control-label">出生日期</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-birth" name="birth" class="form-control" type="text" placeholder="出生日期，如：19931201">
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
										<input id="editr-age" name="age" class="form-control" type="text" placeholder="居民年龄">
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
										<select id="period" name="period" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-phoneGroup">
								<label class="col-sm-2 control-label">联系电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-phone" name="phone" class="form-control" type="text" placeholder="联系电话">
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
										<select id="marriage" name="marriage" class="form-control"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-familyNumberGroup">
								<label class="col-sm-2 control-label">家庭编号</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-familyNumber" readonly class="form-control" type="text" placeholder="家庭编号">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-familyPhoneGroup">
								<label class="col-sm-2 control-label">家庭电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-familyPhone" readonly class="form-control" type="text" placeholder="家庭电话">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-familyAddressGroup">
								<label class="col-sm-2 control-label">家庭地址</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-familyAddress" readonly class="form-control" type="text" placeholder="家庭地址">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-communityNameGroup">
								<label class="col-sm-2 control-label">所在社区</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-communityName" readonly class="form-control" type="text" placeholder="所在社区">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editr-communityAddressGroup">
								<label class="col-sm-2 control-label">社区地址</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editr-communityAddress" readonly class="form-control" type="text" placeholder="社区地址">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="col-sm-offset-2">
								<button class="btn btn-info" id="editr-submit">保存</button>
								<button class="btn btn-default" data-dismiss="modal">取消</button>
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
    <script src="assets/js/admin/resident.js"></script>
    
</body>
</html>