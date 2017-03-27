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
<title>新闻详情</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- summernote -->
<link href="assets/summernote/summernote.css" rel="stylesheet" />

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
					<li><a href="news/manage">新闻管理</a></li>
					<li class="active">新闻详情</li>
				</ul>
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							新闻详情
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body" id="news">
						<h4 class="text-center">${news.title }</h4><div style="margin-top:15px;"></div>
						<h5 class="text-center">
							<b>作者：</b>${news.authorName } &nbsp;&nbsp;&nbsp;
							<b>类型：</b><c:if test="${news.type == 0 }">医生寄语</c:if>
					              	    <c:if test="${news.type == 1 }">每日健康</c:if>
					              	    <c:if test="${news.type == 2 }">医院通知</c:if>
					              	    <c:if test="${news.type == 3 }">社区公告</c:if>
					              	    &nbsp;&nbsp;&nbsp;
					        <b>新闻状态：</b><c:if test="${news.state == 0 }"><span style="color:#FF8C00">审核中</span></c:if>
		                        		   <c:if test="${news.state == 1 }"><span style="color:red">审核未通过</span></c:if>
		                        		   <c:if test="${news.state == 2 }"><span style="color:green">审核通过</span></c:if> 
		                        		   &nbsp;&nbsp;&nbsp;      	
		                    <b>提交时间：</b>${news.submitTime }&nbsp;&nbsp;&nbsp;     	
                           	<c:if test="${news.publishTime != null }"><b>发布时间：</b>${news.publishTime }</c:if>
						</h5>
						${news.content }
			        </div>
				</div>
				<!-- panel end -->
				<c:if test="${news.state == 1 }">
					<c:forEach items="${checkRecords }" var="checkRecord">
						<ul class="chats cool-chat">
							<li class="in">
								<img class="avatar" alt="" src="assets/adminex/images/photos/checker.png">
								<div class="message">
									<span class="arrow"></span>
									<a class="name" href="#">${checkRecord.checker.name }</a>
									<span class="datetime">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${checkRecord.time }</span>
									<span class="body"> ${checkRecord.reason } </span>
								</div>
							</li>
						</ul>
					</c:forEach>
				</c:if>		
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
	<script src="assets/adminex/js/scripts.js"></script>
	
	<!-- summernote -->
	<script src="assets/summernote/summernote.min.js"></script>
	<script src="assets/summernote/lang/summernote-zh-CN.min.js"></script>
	
</body>
</html>