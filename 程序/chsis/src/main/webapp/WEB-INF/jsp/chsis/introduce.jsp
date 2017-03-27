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
	
	<!--about start here-->
	<div class="about">
		<div class="container">
			<div class="about-main">
				<div class="col-md-4 about-left wow bounceIn" data-wow-delay="0.4s">
					<h3>社区服务</h3>
					<h4>有指导，有组织，有系统的服务体系</h4>
					<div class="text">
						<p>服务内容包括妇女、儿童、老年人、残疾人、青壮年人和优抚对象、驻社区单位等各类群体，社区卫生、社区文化、社区环境、社区治安、社区保障等服务项目普遍展开，多种便民生活服务圈不断涌现，社区居民需求得到不同程度的满足。尤其是伴随着市场经济体制的建立，一些社区服务企业开始为社区内居民和单位提供送餐、存车、物业管理等后勤社会化服务，开辟了社区服务业发展的新领域。目前初步构筑起以社会救助为基础的集家政服务、物业管理、职业中介、心理咨询、健康保健等内容于一体的综合服务体系。 </p>
					</div>
				</div>
				<div class="col-md-4 about-left wow bounceIn" data-wow-delay="0.4s">
					<h3>社区环境</h3>
					<h4>逐渐完善社区服务硬件的建设</h4>
					<div class="text">
						<p>目前，已建立一站式办证大厅，实现计生、低保、维权、就业、入学等方面“居事居办”的“一条龙”服务。其二，建设社区宣传栏、宣传窗口，社区的各项服务措施、程序全部公开上墙，大大促进了社区的服务和精神文明的宣传。其三，推动社区休闲娱乐场所的建设。社区组织人员对社区居民休闲娱乐的意愿所进行调查，充分利用社区的公共土地进行休闲娱乐场所的建设，目前已向政府部门申请进行社区广场的建设。其四，加强市政、环卫等设施的完善，已争取市政管理部门逐步完善了社区路灯的设置和小巷路面硬化的建设。 </p>
					</div>
				</div>
				<div class="col-md-4 about-left wow bounceIn" data-wow-delay="0.4s">
					<h3>发展重点</h3>
					<h4>因地制宜，改革创新</h4>
					<div class="text">
						<p>坚持政府指导和社会共同参与相结合，充分发挥社区力量，合理配置社区资源，大力发展社区事业，不断提高居民的素质和整个社区大的文明程度，努力建设管理有序、服务完善、环境优美、治安良好、生活便利、人际关系和谐的新型现代化社区。坚决执行“防反弹、禁新建、拆重点”的指示，做到社区无违建、乱建的现象发生。将整规活动作为一种长效机制纳入社区党建工作范畴之中。</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--about end here-->
	
	<!--team start here-->
	<div class="team">
		<div class="container">
			<div class="team-main wow bounceIn" > 
				<h3>社区一览</h3>
				 <div class="col-md-3 team-grids wow bounceIn" data-wow-delay="0.4s">
				 	<img src="assets/image/chsis/community_1.png" alt=""/>
				 </div>
				 <div class="col-md-3 team-grids wow bounceIn" data-wow-delay="0.4s">
				 	<img src="assets/image/chsis/community_2.png" alt=""/>
				 </div>
				 <div class="col-md-3 team-grids wow bounceIn" data-wow-delay="0.4s">
				 	<img src="assets/image/chsis/community_3.png" alt=""/>
				 </div>
				 <div class="col-md-3 team-grids wow bounceIn" data-wow-delay="0.4s">
				 	<img src="assets/image/chsis/community_4.png" alt=""/>
				 </div>
			  <div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--team end here-->
	
	<!--team start here-->
	<div class="team">
		<div class="container">
			<div class="team-main wow bounceIn" > 
				<h3>社区健康概况</h3>
				 <div class="col-md-4 team-grids wow bounceIn" data-wow-delay="0.4s">
				 	<img src="assets/image/chsis/p1.jpg" alt=""/>
				 </div>
				 <div class="col-md-4 team-grids wow bounceIn" data-wow-delay="0.4s">
				 	<img src="assets/image/chsis/p2.jpg" alt=""/>
				 </div>
				 <div class="col-md-4 team-grids wow bounceIn" data-wow-delay="0.4s">
				 	<img src="assets/image/chsis/p3.jpg" alt=""/>
				 </div>
			  <div class="clearfix"> </div>
			</div>
		</div>
	</div>
	<!--team end here-->

	<!--footer start here-->
	<%@ include file="/include/chsis/footer.jsp"%>
	<!--footer end here-->
	
	<script src="assets/js/chsis/jquery.min.js"></script>
	<script src="assets/js/chsis/wow.min.js"></script>
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
			$("#navi_introduce").addClass('ser active');
	</script>
</body>
</html>
