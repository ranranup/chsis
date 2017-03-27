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
	<meta name="keywords" content="Lobortis Responsive web template, Bootstrap Web Templates, Flat Web Templates, AndriodCompatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
	<link rel="shortcut icon" href="assets/image/favicon.ico" type="image/png">
	<link href="assets/css/chsis/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<link href="assets/css/chsis/header-footer.css" rel="stylesheet" type="text/css" media="all">
	<link href="assets/css/chsis/style.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="assets/css/chsis/hover.css" rel="stylesheet" media="all">
	<link href='http://fonts.useso.com/css?family=Source+Sans+Pro:200,300,400,600,700,900,200italic,300italic,400italic,600italic,700italic,900italic' rel='stylesheet' type='text/css'>
	<link href="assets/css/chsis/animate.css" rel="stylesheet" type="text/css" media="all">
	<title>社区健康信息服务系统</title>
</head>
<body>
	<!--header start here-->
	<%@ include file="/include/chsis/header.jsp"%>
	<!--header end here-->
	
	<!--banner start here-->
	<div class="banner">
		<div class="container">
			<div class="banner-main">
				<div class="col-md-6 banner-left">
					<a id="login" href="login">登陆</a>
					<a id="register" href="register">注册</a>
					<div class="lobo">
						<h3>欢迎来到阳光社区!</h3>
						<P>WELCOME TO SUNSHINE COMMUNITY.</P>
					</div>
				</div>
				<div class="col-md-6 banner-right">
					<img src="assets/image/chsis/welcome.png" alt="welcome" />
				</div>
			   <div class="clearefix"> </div>
			</div>
		</div>
	</div>
	<!--banner end here-->
	
	<!--info-grid start here-->
	<div class="info-grid wow bounce" data-wow-delay="0.1s">
		<div class="container">
			<div class="info-grid-main">
				<div class="col-md-4 info-grids-cr wow bounceIn" data-wow-delay="0.4s">
					<div class="info-top">
						<h3>医院通知 <span class="gd-clr">(Hospital Notice)</span> </h3>
					</div>
					<div class="info-bott">
						<ul>
							<c:forEach items="${hospitalNotice }" var="news">
								<li><a href="detail/${news.uuid }">${news.title }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="infogrid-bwn">
						<a href="newsList?type=2">READ MORE</a>
					</div>
				</div>
				<div class="col-md-4 info-grids-cr wow bounceIn" data-wow-delay="0.4s">
					<div class="info-top">
						<h3>医生寄语 <span class="gd-clr">(Doctor Words)</h3></span>
					</div>
					<div class="info-bott">
					    <ul>
							<c:forEach items="${doctorWords }" var="news">
								<li><a href="detail/${news.uuid }">${news.title }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="infogrid-bwn">
						<a href="newsList?type=0">READ MORE</a>
					</div>
				</div>
				<div class="col-md-4 info-grids-cr wow bounceIn" data-wow-delay="0.4s">
					<div class="info-top">
						<h3>每日健康 <span class="gd-clr">(Daily Health)</h3></span>
					</div>
					<div class="info-bott">
						<ul>
							<c:forEach items="${dailyHealth }" var="news">
								<li><a href="detail/${news.uuid }">${news.title }</a></li>
							</c:forEach>
						</ul>
					</div>
					<div class="infogrid-bwn">
						<a href="newsList?type=1">READ MORE</a>
					</div>
				</div>
			  <div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--info-grid end here-->
	
	<!--movergrid start here-->
	<div class="flex-slider wow bounceInLeft" data-wow-delay="0.4s">
		<div class="wow bounceInLeft star-department" data-wow-delay="0.6s">
			<span class="h3">社区公告<span class="wrapText">(Community Announcement)</span></span>
		</div>
		<div class="container">
			<ul id="flexiselDemo4">
				<c:forEach items="${announcements }" var="news">
					<li>
					    <div class="grid">
							<a href="detail/${news.uuid }">
								<h3>${news.title }</h3>
								<div class="mov-bwn">
									<a href="">${news.publishTime }</a>
								</div>
							</a>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!--movegrid end here-->
	
	<!--footer start here-->
	<%@ include file="/include/chsis/footer.jsp"%>
	<!--footer end here-->

	<script src="assets/js/chsis/jquery.min.js"></script>
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }</script>
	<script type="text/javascript" src="assets/js/chsis/move-top.js"></script>
	<script type="text/javascript" src="assets/js/chsis/div-change.js"></script>
	<script type="text/javascript" src="assets/js/chsis/easing.js"></script>
	<script src="assets/js/chsis/wow.min.js"></script>
    <script type="text/javascript" src="assets/js/chsis/jquery.flexisel.js"></script>
    <script type="text/javascript" src="assets/js/chsis/index.js"></script>
	
</body>
</html>