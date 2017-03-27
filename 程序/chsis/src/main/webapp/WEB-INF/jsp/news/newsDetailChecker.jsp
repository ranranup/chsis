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
<title>审核新闻</title>

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
								<c:if test="${news.state == 0 }">
									<sec:authorize access="hasRole('ROLE_3141bd0792f04d88b4ccc1a6619c6d25')">
										<button class="btn btn-default pull-left btn-pass" newsUuid="${news.uuid }" style="margin-right:5px;">审核通过</button>
									</sec:authorize>
									<sec:authorize access="hasRole('ROLE_05e78782d11b4e44b5ab9ea5a813c029')">
										<button class="btn btn-warning pull-left btn-notPass" newsUuid="${news.uuid }">审核不通过</button>
									</sec:authorize>
								</c:if>
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
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>
    
    <!-- Modal Start -->
	<div class="modal fade" id="notPassModal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">审核不通过原因</h4>
				</div>
				<div class="modal-body">
					<form id="notPassForm" class="form-horizontal" method="POST">
						<input id="newsUuid" name="newsUuid" type="hidden" />
						<div class="row container">
							<div class="form-group" id="reasonGroup">
								<label class="col-sm-1 control-label">原因</label>
								<div class="col-sm-5">
									<div class="iconic-input right">
										<textarea id="reason" class="form-control" row="3" name="reason" placeholder="请输入审核不通过原因"></textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info" id="reason-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
    
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
	
	<!-- Custome Javascript -->
	<script src="assets/js/news/newsDetailChecker.js"></script> 
	
</body>
</html>