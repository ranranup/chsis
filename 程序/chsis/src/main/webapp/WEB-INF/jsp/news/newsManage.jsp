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
<title>新闻管理</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">
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
					<li class="active">新闻列表</li>
				</ul>
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							新闻列表
							<sec:authorize access="hasRole('ROLE_a6d865146ea84ebe9a34b8737502f013')">
								<span class="tools pull-right"> 
									<button class="btn btn-warning pull-left btn-toPublishNews">发布新闻</button> 
									<a class="fa fa-chevron-down" href="javascript:;"></a>
								</span>
							</sec:authorize>
						</h3>
					</div>
					<div class="panel-body">
						<sec:authorize access="hasRole('ROLE_98c19dcc1db740418a2bf02bbd0ce0e1')">
							<form class="form-inline" action="news/search">
			                    <input class="form-control" name="title" type="text" placeholder="请输入新闻标题">
			                    <input class="form-control" name="submitTime" type="text" placeholder="请输入提交时间">
		                    	<select name="state" class="form-control">
		                    		<option value="">新闻状态</option>
		                    		<option value="0">审核中</option>
		                    		<option value="1">审核未通过</option>
		                    		<option value="2">审核通过</option>
		                    	</select>
			                    <button class="btn btn-info">搜索</button>
		                    </form><br/>
						</sec:authorize>
	                    <div class="blank"></div>
	                    <table class="table table-bordered table-responsive table-hover text-center">
		                    <tr class="info">
		                        <th class="text-center">新闻标题</th>
		                        <th class="text-center">新闻类型</th>
		                        <th class="text-center">提交时间</th>
		                        <th class="text-center">新闻状态</th>
		                        <th class="text-center">操作</th>
		                    </tr>
		                    <c:forEach items="${newsList}" var="news">
			                    <tr>
			                        <td>${news.title }</td>
			                        <td>
			                        	<c:if test="${news.type == 0 }">医生寄语</c:if>
			                        	<c:if test="${news.type == 1 }">每日健康</c:if>
			                        	<c:if test="${news.type == 2 }">医院通知</c:if>
			                        	<c:if test="${news.type == 3 }">社区公告</c:if>
			                        </td>
			                        <td>${news.submitTime }</td>
			                        <td>
			                        	<c:if test="${news.state == 0 }">审核中</c:if>
			                        	<c:if test="${news.state == 1 }">审核未通过</c:if>
			                        	<c:if test="${news.state == 2 }">审核通过</c:if>
			                        </td>
			                        <td>
										<div class="btn-group">
											<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
												操作 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" style="min-width: 60px">
												<sec:authorize access="hasRole('ROLE_e2ceb979e1ec42b8beee4c072546c38f')">
													<li><a href="news/detail/${news.uuid }">详情</a></li>
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_f9bd86b397f94ac59b8c623fc67673b0')">
													<c:if test="${news.state == 1 }">
														<li><a href="news/toEdit/${news.uuid }">编辑</a></li>
													</c:if>
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_8242e413f50c4d2593e65c0f1bcea783')">
													<c:if test="${news.state == 1 }">
														<li><a onclick="deleteNews('${news.uuid}')">删除</a></li>
													</c:if>
												</sec:authorize>
											</ul>
										</div>
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

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
    
    <!-- Custome Javascript -->
	<script src="assets/js/news/newsManage.js"></script>    
	
</body>
</html>
