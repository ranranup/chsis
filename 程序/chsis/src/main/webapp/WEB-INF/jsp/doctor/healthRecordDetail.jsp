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
<title>体检记录</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- fileinput组件样式 -->
<link href="assets/fileinput/fileinput.min.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/doctor/index.css" rel="stylesheet">
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
					<li><a href="medicalRecord/toCreate">新建记录</a></li>
					<li class="active">体检记录</li>
				</ul>
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							体检记录
							<span class="tools pull-right"> 
								<sec:authorize access="hasRole('ROLE_18302a123c6e4075a64d368920fd69fc')">
									<button class="btn btn-warning pull-left btn-edit">编辑</button>
								</sec:authorize>
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal">
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>报告名称：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${checkReport.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>体检人：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${checkReport.patient.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>体检医院：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${checkReport.hospital.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>体检时间：</b></label>
									<div class="col-sm-10">
										<div style="margin-top:7px;">${checkReport.time }</div>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>体检描述：</b></label>
									<div class="col-sm-10">
										<div style="margin-top:7px;">${checkReport.description }</div>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>体检报告：</b></label>
									<div class="col-sm-10">
										<div style="margin-top:7px;">
											<img id="urlImg" src="${checkReport.url }" alt="暂无" width="70%" height="70%" />
										</div>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>体检状态：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											<c:if test="${checkReport.state==0 }"><div style="color:red;">未完成本次体检</div></c:if>
											<c:if test="${checkReport.state==1 }"><div style="color:green;">已完成本次体检</div></c:if>
										</label>
									</div>
								</div>
							</div>
						</form>
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
	<div class="modal fade" id="editHealthReport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 体检记录
					</h5>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="post" action="healthRecord/edit" enctype="multipart/form-data">
						<input type="hidden" name="uuid" value="${checkReport.uuid }">
						<div class="row container">
							<div class="form-group" id="edithealth-descriptionGroup">
								<label class="col-sm-2 control-label">体检描述：</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<textarea id="edithealth-description" class="form-control" name="description" rows="7" placeholder="请输入体检描述">${checkReport.description }</textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="edithealth-imgGroup">
								<label class="col-sm-2 control-label">上传报告单：</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input type="file" id="input-id" name="file_data" />
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info" id="edithealth-submit">保存</button>
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
	<script src="assets/js/doctor/dropDownList.js"></script>
	
	<!-- fileinput组件 -->
	<script type="text/javascript" src="assets/fileinput/fileinput.min.js"></script>
	<script type="text/javascript" src="assets/fileinput/fileinput_locale_zh.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/js/file.js"></script>
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/doctor/healthRecord.js"></script>
</body>
</html>