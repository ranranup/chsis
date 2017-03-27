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
							<span class="tools pull-right"> 
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<sec:authorize access="hasRole('ROLE_98c19dcc1db740418a2bf02bbd0ce0e1')">
							<form class="form-inline" action="news/search">
			                    <input class="form-control" name="title" type="text" placeholder="请输入新闻标题">
			                    <input class="form-control" name="submitTime" type="text" placeholder="请输入提交时间">
		                    	<select name="type" class="form-control">
		                    		<option value="">新闻类型</option>
		                    		<option value="0" <c:if test="${type==0 }">selected</c:if>>医生寄语</option>
		                    		<option value="1" <c:if test="${type==1 }">selected</c:if>>每日健康</option>
		                    		<option value="2" <c:if test="${type==2 }">selected</c:if>>医院通知</option>
		                    		<option value="3" <c:if test="${type==3 }">selected</c:if>>社区公告</option>
		                    	</select>
		                    	<select name="state" class="form-control">
		                    		<option value="-1">新闻状态</option>
		                    		<option value="0" <c:if test="${state==0 }">selected</c:if>>审核中</option>
		                    		<option value="1" <c:if test="${state==1 }">selected</c:if>>审核未通过</option>
		                    		<option value="2" <c:if test="${state==2 }">selected</c:if>>审核通过</option>
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
			                        <td class="td-state" newsUuid='${news.uuid }'>
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
												<sec:authorize access="hasRole('ROLE_3141bd0792f04d88b4ccc1a6619c6d25')">
													<c:if test="${news.state == 0 }">
														<li><a class="btn-pass" newsUuid="${news.uuid }">审核通过</a></li>
													</c:if>
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_05e78782d11b4e44b5ab9ea5a813c029')">
													<c:if test="${news.state == 0 }">
														<li><a class="btn-notPass" newsUuid="${news.uuid }">审核不通过</a></li>
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

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
    
    <!-- Custome Javascript -->
	<script src="assets/js/news/newsManageChecker.js"></script> 
	
</body>
</html>
