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
<title>编辑新闻</title>

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
					<li class="active">编辑新闻</li>
				</ul>
			
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							发布新闻
							<span class="tools pull-right"> 
								<button class="btn btn-warning pull-left btn-submitNews">确认修改</button> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body" id="news" role="${role }">
						<input id="newsUuid" type="hidden" value="${news.uuid }"/><br/>
						<input id="title" class="form-control" type="text" placeholder="请输入新闻标题" value="${news.title }"/><br/>
						<c:if test="${role == 'doctor' }">
							<div class="form-group">
								<label class="control-label" style="margin-top:10px;">新闻类型:</label>
								<label class="radio-inline">
									<input type="radio" name="type" value="1" checked>每日健康
								</label>
								<label class="radio-inline">
									<input type="radio" name="type" value="0">医生寄语		
								</label>
							</div>	
						</c:if>
		                <div id="summernote">${news.content }</div>
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
	<script src="assets/adminex/js/scripts.js"></script>
	
	<!-- summernote -->
	<script src="assets/summernote/summernote.min.js"></script>
	<script src="assets/summernote/lang/summernote-zh-CN.min.js"></script>
	<script src="assets/js/news/editNews.js"></script>
	
</body>
</html>