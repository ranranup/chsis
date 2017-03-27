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
	<link href="assets/css/chsis/bootstrap.css" rel="stylesheet" type="text/css" media="all">
	<link href="assets/css/chsis/animate.css" rel="stylesheet" type="text/css" media="all">
	<link href="assets/css/chsis/style.css" rel="stylesheet" type="text/css" media="all"/>
	<link href="assets/css/chsis/header-footer.css" rel="stylesheet" type="text/css" media="all"/>
	<title>社区健康信息服务系统</title>
</head>
<body>
<!--header start here-->
<%@ include file="/include/chsis/header.jsp"%>
<!--header end here-->

<!--contact start here-->
<div class="contact">
	<div class="container">
		<div class="contact-main">
			<div class="contact-top">
				<h3>联系我们</h3>
				<p>阳光社区自建立以来，坚持政府指导，充分发挥社区力量，合理配置社区资源，不断提高居民的素质和整个社区大的文明程度，努力建设管理有序、服务完善、环境优美、治安良好、生活便利、人际关系和谐的新型现代化社区。将整规活动作为一种长效机制纳入社区党建工作范畴之中。</p>
			</div>
			<div class="col-md-12 contact-left footer-grid wow bounceIn" data-wow-delay="0.4s">
				<h4>社区负责人:王文静 </h4>
				<p>联系电话：0931-2970108&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				电子邮箱：admin@chsis.top&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				联系地址：甘肃省兰州市七里河区-阳光社区</p>
			</div>
		  <div class="clearfix"></div>
		</div>
	</div>
</div>
<!--contact end here-->
<!--map start here-->
<div id="map" style="width:100%;height:400px;"></div>
<!--map end here-->

<!--footer start here-->
<%@ include file="/include/chsis/footer.jsp"%>
<!--footer end here-->

</body>

<script src="assets/js/chsis/jquery.min.js"></script>
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=c05f5d7fa9800dbf0de169ac8ecd9a4f"></script>
<script type="text/javascript">
	$(function(){
		/* 导航颜色 */
		$("#navi_contact").addClass('ser active');
	});	
	
	var map = new AMap.Map('map',{
	    zoom: 12,
	    center: [103.776693,36.055021]
	});
	var marker = new AMap.Marker({
        position: [103.776693,36.055021],
        map:map
    });
	
	var infowindow = new AMap.InfoWindow({
		content : '<h3>阳光社区</h3><div>社区开始为居民和单位提供送餐、存车、物业管理等后勤社会化服务，开辟了社区服务业发展的新领域。</div>',
		offset : new AMap.Pixel(0, -30),
		size : new AMap.Size(230, 0)
	})
	
	var clickHandle = AMap.event.addListener(marker, 'click', function() {
	    infowindow.open(map, marker.getPosition())
	})
</script>
</html>
