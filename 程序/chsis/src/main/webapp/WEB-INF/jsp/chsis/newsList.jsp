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
	<link href="assets/css/chsis/newslist.css" rel="stylesheet" type="text/css" media="all"/>
	<title>社区健康信息服务系统</title>
</head>
<body>
	<!--header start here-->
	<%@ include file="/include/chsis/header.jsp"%>
	<!--header end here-->
	
	<!--主体内容开始！-->
	<div class="main">
		<!-- 展示当前所在位置的层开始 -->
		<ul class="breadcrumb panel">
			<li><a href="index"> <i class="fa fa-home"></i>社区首页</a></li>
			<c:if test="${type != null}">
				<li class="active">
					<c:if test="${type == '0' }">医生寄语</c:if>
	               	<c:if test="${type == '1' }">每日健康</c:if>
	               	<c:if test="${type == '2' }">医院通知</c:if>
	               	<c:if test="${type == '3' }">社区公告</c:if>
				</li>
			</c:if>
			<div class="pull-right">
				<select id="select_type" class="form-control" style="height:26px;padding:0px;margin-top:-3px;">
					<option value="newsList">社区新闻</option>
					<option value="newsList?type=0" <c:if test='${type == "0" }'>selected</c:if> >医生寄语</option>
					<option value="newsList?type=1" <c:if test='${type == "1" }'>selected</c:if> >每日健康</option>
					<option value="newsList?type=2" <c:if test='${type == "2" }'>selected</c:if> >医院通知</option>
					<option value="newsList?type=3" <c:if test='${type == "3" }'>selected</c:if> >社区公告</option>
				</select>
			</div>
		</ul>
		<!-- 展示当前所在位置的层结束 -->
		<!--存放新闻列表的层开始-->
		<div class="news_list">
			<ul id="list">
				<c:forEach items="${newsList }" var="news">
					<li><a href="detail/${news.uuid }" target="_blank">${news.title }</a><span>${news.publishTime }</span></li>	
				</c:forEach>
			</ul>
		</div>
		<!--存放新闻列表的层结束-->
		<!--展示分页的层开始-->
		<div style="margin-left:15px;">查询到${totals }条记录/共${totalPages }页</div>
        <!-- pagination start -->
        <%@include file="/include/page.jsp" %>
		<!-- pagination end -->
		<!--展示分页的层结束-->
	</div>
	<!--主体内容结束！-->
		
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
	<script type="text/javascript" src="assets/js/chsis/newsList.js"></script>
</body>
</html>
