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
<title>居民就诊记录</title>

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
					<li><a href="resident/medicalRecord">就诊记录</a></li>
				</ul>
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							就诊记录
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<sec:authorize access="hasRole('ROLE_24cb1f69f5ad4ee2911943050eea8526')">
							<form class="form-inline" action="resident/searchMedicalRecord">
			                    <input name="diseaseName" class="form-control" type="text" placeholder="请输入疾病名称">
			                    <input name="time" class="form-control" type="text" placeholder="请输入就诊时间">
			                    <select name="state" class="form-control">
		                    		<option value="">就诊状态</option>
		                    		<option value="0">未完成就诊</option>
		                    		<option value="1">已完成就诊</option>
		                    	</select>
		                    	<button class="btn btn-info">搜索</button>
	                		</form>
						</sec:authorize>
		                <div class="blank"></div>
		                <table class="table table-bordered table-responsive table-hover">
		                    <tr class="info">
		                        <th>主诊医生</th>
		                        <th>疾病名称</th>
		                        <th>就诊时间</th>
		                        <th>就诊状态</th>
		                        <th>就诊结果</th>
		                        <th>操作</th>
		                    </tr>
		                    <c:forEach items="${medicalRecords }" var="medicalRecord">
			                    <tr>
			                        <td>${medicalRecord.doctor.name }</td>
			                        <td>${medicalRecord.disease.name }</td>
			                        <td>${medicalRecord.time }</td>
			                        <td>
			                        	<c:if test="${medicalRecord.state==0 }"><span style="color:red;">未完成就诊</span></c:if>
			                        	<c:if test="${medicalRecord.state==1 }"><span style="color:green;">已完成就诊</span></c:if>
			                        </td>
			                        <td><span data-toggle="tooltip" data-placement="top" title="${medicalRecord.result }">查看病情描述</span></td>
			                        <td>
			                        	<sec:authorize access="hasRole('ROLE_c461fbe667074d8ab1e517a48de71546')">
				                        	<a class="btn btn-warning btn-sm" href="resident/medicalRecordDetail/${medicalRecord.uuid }">详情</a>
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
			$("#navi_resident_medicalRecord").addClass('active');
		});	
	</script>
</body>
</html>