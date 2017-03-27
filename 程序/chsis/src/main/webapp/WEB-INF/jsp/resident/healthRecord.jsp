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
<title>居民体检记录</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/doctor/index.css" rel="stylesheet">
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
					<li><a href="resident/healthRecord">体检记录</a></li>
				</ul>
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							体检记录
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<sec:authorize access="hasRole('ROLE_b01acd3af35545d38c5098c649a518a0')">
							<form class="form-inline" action="resident/searchHealthRecord">
			                    <input name="time" class="form-control" type="text" placeholder="请输入体检时间">
		                    	<button class="btn btn-info">搜索</button>
	                		</form>
						</sec:authorize>
		                <div class="blank"></div>
		                <table class="table table-bordered table-responsive table-hover">
		                    <tr class="info">
		                        <th>体检医院</th>
		                        <th>体检时间</th>
		                        <th>体检描述</th>
		                        <th>体检报告</th>
		                    </tr>
		                    <c:forEach items="${checkReports }" var="checkReport">
			                    <tr>
			                        <td>${checkReport.hospital.name }</td>
			                        <td>${checkReport.time }</td>
			                        <td><span data-toggle="tooltip" data-placement="top" title="${checkReport.description }">查看体检描述</span></td>
			                        <td><a class="checkReportPhoto" urlImg="${checkReport.url }">体检报告单</a></td>
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
	<div class="modal fade" id="checkReportPhotoDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/url.png" alt="检查报告" style="height: 20px; width: 20px;margin-top:-5px;" /> 检查报告
					</h5>
				</div>
				<div class="modal-body row">
					<div class="col-sm-12 container-fluid">
						<img id="urlImg" src="" alt="检查报告单" style="height: 100%; width: 100%;" />
					</div>
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
	<script src="assets/js/doctor/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/resident/healthRecord.js"></script>
</body>
</html>