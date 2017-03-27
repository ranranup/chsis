<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>首页</title>

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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							首页
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<div class="col-sm-6">
							<br/><br/><br/>
							<img src="assets/image/school.jpg" alt="美丽工大"/>
						</div>
						<div class="col-sm-6">
							<br/><br/>		
							<h1 class="text-success">社区</h1><br/>
							<div class="col-sm-offset-3">
								<h4 class="text-warning">健康服务是城市卫生工作的重要组成部分，</h4><br/>
							</div>	
							<div class="col-sm-offset-2">
								<h4 class="text-info">是实现人人享有初级卫生保健目标的基础环节，</h4><br/>
							</div>	
							<div class="col-sm-offset-1">
								<h4 class="text-danger">社区健康服务的基本任务是使居民在社区可以享受</h4><br/>
							</div>
							<h4 class="text-success">
								公共卫生服务和一般常见病、多发病的基本医疗服务。
							</h4>	
						</div>
					</div>
				</div>
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
	<script src="assets/js/resident/dropDownList.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	
	<script>
		$(function(){
			/* 导航颜色 */
			$("#navi_index").addClass('active');
		});	
	</script>

</body>
</html>
