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
<title>待完成就诊记录</title>

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
					<li class="active">待完成记录</li>
					<li><a href="medicalRecord/unfinished">待完成就诊记录</a></li>
				</ul>
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							待完成就诊记录
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" action="medicalRecord/search">
							<input name="state" class="form-control" type="hidden" value="0">
		                    <input name="name" class="form-control" type="text" placeholder="请输入病人姓名">
		                    <input name="idNo" class="form-control" type="text" placeholder="请输入病人身份证号">
		                    <input name="time" class="form-control" type="text" placeholder="请输入就诊时间">
	                    	<select name="sex" class="form-control">
	                    		<option value="">性别</option>
	                    		<option value="0">男</option>
	                    		<option value="1">女</option>
	                    	</select>
	                    	<button class="btn btn-info">搜索</button>
                		</form>
		                <div class="blank"></div>
		                <table class="table table-bordered table-responsive table-hover">
		                    <tr class="info">
		                        <th>就诊病人</th>
		                        <th>病人性别</th>
		                        <th>病人身份证号</th>
		                        <th>就诊时间</th>
		                        <th>疾病名称</th>
		                        <th>操作</th>
		                    </tr>
		                    <c:forEach items="${medicalRecords }" var="medicalRecord">
			                    <tr>
			                        <td>${medicalRecord.name }</td>
			                        <td>
			                        	<c:if test="${medicalRecord.sex==0 }">男</c:if>
			                        	<c:if test="${medicalRecord.sex==1 }">女</c:if>
			                        </td>
			                        <td>${medicalRecord.idNo }</td>
			                        <td>${medicalRecord.time }</td>
			                        <td>${medicalRecord.disease.name }</td>
			                        <td>
			                        	<sec:authorize access="hasRole('ROLE_c8d62d803d364b819a04800644ecbc83')">
				                        	<a class="btn btn-warning btn-sm" href="medicalRecord/unfinishedMedicalRecordDetail/${medicalRecord.uuid }">完善</a>
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
    
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>
	<script src="assets/js/doctor/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	
	<script>
		$(function(){
			/* 导航颜色 */
			$("#navi_doctor_unfinished").addClass('active');
		});	
	</script>
	
</body>
</html>