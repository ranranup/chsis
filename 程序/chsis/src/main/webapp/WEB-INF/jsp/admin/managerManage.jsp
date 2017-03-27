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

<title>管理员管理</title>

<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">
<link href="assets/css/jquery-confirm.css" rel="stylesheet" type="text/css"/>

<!--你自己的样式文件 -->
<link href="assets/css/common.css" rel="stylesheet" type="text/css">
<link href="assets/css/admin/index.css" rel="stylesheet">
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
						管理员管理
						<span class="tools pull-right">
							<sec:authorize access="hasRole('ROLE_c7422de1780647d6921d75ade9c11180')">
								<button id="btn-add" class="btn btn-warning pull-left">添加管理员</button>
							</sec:authorize> 
							<a class="fa fa-chevron-down" href="javascript:;"></a>
						</span>
					</h3>
				</div>
				<div class="panel-body">
					<sec:authorize access="hasRole('ROLE_e7717d1a09c0480faddc26d97c0c13b3')">
						<!-- 管理员查询 -->
						<form class="form-inline" action="manager/search">
							<div class="form-group">
								<input type="text" class="form-control" name="userName" placeholder="请输入用户名">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="name" placeholder="请输入姓名">
							</div>
							<button type="submit" class="btn btn-info">搜索</button>
						</form>
					</sec:authorize>
					
					<div class="blank"></div>

					<table class="table table-bordered table-responsive table-hover text-center">
						<thead>
							<tr class="info">
								<th class="text-center">序号</th>
								<th class="text-center">用户名</th>
								<th class="text-center">姓名</th>
								<th class="text-center">电话</th>
								<th class="text-center">类型</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${managers}" var="manager" varStatus="id">
								<tr>
									<td>${id.index+1 }</td>
									<td>${manager.userName }</td>
									<td>${manager.name }</td>
									<td>${manager.phone }</td>
									<td>
										<c:if test="${manager.type==0 }">医院管理员</c:if>
										<c:if test="${manager.type==1 }">审核员</c:if>
										<c:if test="${manager.type==2 }">系统管理员</c:if>
									</td>
									<td>
										<div class="btn-group">
											<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												操作 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" style="min-width: 60px">
												<sec:authorize access="hasRole('ROLE_54fc88ee4ed542d182c943d2137978c8')">
													<li><a class="btn btn-default btn-sm btn-managerDetail" uuid="${manager.uuid }" style="border:none;">详情</a></li>
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_df058fe97463410285200ca37cee019f')">
													<li><a class="btn btn-default btn-sm btn-editManager" uuid="${manager.uuid }" style="border:none;">编辑</a></li>
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_a88629b29e904acb92f01c4430c04028')">
													<li><a href="manager/toAllocateRole/${manager.uuid }">分配角色</a></li>
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_37af9c88f43a4015b0570f8d9429b918')">
													<li><a onclick="deleteManager('${manager.uuid}')">删除</a></li>
												</sec:authorize>
											</ul>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<input id="url" type="hidden" value="${url }">
					<input id="pageIndex" type="hidden" value="${pageIndex }">
					<div>查询到${totals }条记录/共${totalPages }页</div>

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
	
	<!-- Modal Start-->
	<div class="modal fade" id="managerDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 管理员信息详情
					</h4>
				</div>
				<div class="modal-body container col-sm-12">
					<div class="row">
						<div class="col-sm-3 col-sm-offset-3">
							<h5>
								<b>管理员姓名：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="manager-name"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 col-sm-offset-3">
							<h5>
								<b>管理员电话：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="manager-phone"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 col-sm-offset-3">
							<h5>
								<b>管理员类型：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="manager-type"></h5>
						</div>
					</div>
					<div id="div-hide" class="row">
						<div class="col-sm-3 col-sm-offset-3">
							<h5>
								<b>其所在医院：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="hospital-name"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 col-sm-offset-3">
							<h5>
								<b>拥有的角色：</b>
							</h5>
						</div>
						<div id="role" class="col-sm-3 text-left"></div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	<!-- Modal Start -->
	<div class="modal fade" id="editManager" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 修改管理员信息
					</h4>
				</div>
				<div class="modal-body row">
					<form id="managerInfoForm" class="form-horizontal" method="POST">
						<input id="managerUuid" type="hidden" name="uuid">
						<div class="row container">
							<div class="form-group" id="editm-nameGroup">
								<label class="col-sm-2 control-label">管理员姓名</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editm-name" class="form-control" name="name" type="text" placeholder="管理员姓名">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editm-phoneGroup">
								<label class="col-sm-2 control-label">管理员电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editm-phone" class="form-control" name="phone" type="text" placeholder="管理员电话">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<div class="blank"></div>
							<button class="btn btn-info" id="submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
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

	<!-- Custom JS -->
	<script src="assets/js/admin/managerManage.js"></script>
</body>
</html>