<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="assets/image/favicon.ico" type="image/png">
	<!-- Bootstrap -->
	<link href="assets/adminex/css/style.css" rel="stylesheet">
	<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">
	<link href="assets/css/chsis/animate.css" rel="stylesheet" type="text/css" media="all">
	<link href="assets/css/chsis/header-footer.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="assets/css/chsis/news.css" rel="stylesheet" type="text/css" media="all"/>
	<title>社区健康信息服务系统</title>
</head>
<body>
	<!--header start here-->
	<%@ include file="/include/chsis/header.jsp"%>
	<!--header end here-->
	
	<!--主体内容开始-->
	<div class="main">
	
		<!-- 展示当前所在位置的层开始 -->
		<ul class="breadcrumb panel">
			<li><a href="index"> <i class="fa fa-home"></i>社区首页</a></li>
			<li>
				<a href="newsList?type=${news.type }">
					<c:if test="${news.type == 0 }">医生寄语</c:if>
                   	<c:if test="${news.type == 1 }">每日健康</c:if>
                   	<c:if test="${news.type == 2 }">医院通知</c:if>
                   	<c:if test="${news.type == 3 }">社区公告</c:if>
				</a>
			</li>
			<li class="active">新闻详情</li>
		</ul>
		<!-- 展示当前所在位置的层结束 -->
		
		<div id="newstitle" class="title">${news.title }</div>
		
		<div id="newsinfo" class="newsinfo">
			作者:${news.authorName } &nbsp;&nbsp; 
			类型:<c:if test="${news.type == 0 }">医生寄语</c:if>
               	<c:if test="${news.type == 1 }">每日健康</c:if>
               	<c:if test="${news.type == 2 }">医院通知</c:if>
               	<c:if test="${news.type == 3 }">社区公告</c:if>
               	&nbsp;&nbsp;
                              发布时间:${news.publishTime }&nbsp;&nbsp;
                              点击量:${news.click }
		</div>
		
		<!-- 存放新闻内容 -->
		<div id="newscontent" class="text">
			${news.content }
		</div>
		
	</div>
	<!--主体内容结束-->
		
	<!--footer start here-->
	<%@ include file="/include/chsis/footer.jsp"%>
	<!--footer end here-->
	
	
	<script src="assets/js/chsis/jquery.min.js"></script>
	<script src="assets/js/chsis/wow.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script type="application/x-javascript"> 
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	</script>
	<script type="text/javascript" src="assets/js/chsis/move-top.js"></script>
	<script type="text/javascript" src="assets/js/chsis/easing.js"></script>
	<script type="text/javascript">
			new WOW().init();
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
			
			/* 导航颜色 */
			$("#navi_news").addClass('ser active');
	</script>
</body>
</html>
