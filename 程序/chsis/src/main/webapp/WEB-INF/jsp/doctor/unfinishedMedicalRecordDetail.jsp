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
<title>待完成就诊记录详情</title>

<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!-- fileinput组件样式 -->
<link href="assets/fileinput/fileinput.min.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/doctor/index.css" rel="stylesheet">
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
					<li class="active">待完成记录</li>
					<li><a href="medicalRecord/unfinished">待完成就诊记录</a></li>
					<li class="active">待完成就诊记录详请</li>
				</ul>
				
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							就诊记录
							<span class="tools pull-right"> 
								<button class="btn btn-success pull-left btn-editDiseaseName">选择疾病名称</button>
								<sec:authorize access="hasRole('ROLE_f933dcf78539497bb52d33912089f979')">
									<button class="btn btn-warning pull-left btn-editResult">编辑疾病描述</button>
								</sec:authorize>	
								<sec:authorize access="hasRole('ROLE_1c1f6600aa4c42648d50c475bc630cd2')">
									<button class="btn btn-info pull-left btn-danger btn-editState" uuid="${medicalRecord.uuid }">完成本次就诊</button>
								</sec:authorize>
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal">
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>就诊病人：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${medicalRecord.patient.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>主治医生：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${medicalRecord.doctor.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>就诊医院：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											${medicalRecord.doctor.department.hospital.name }
										</label>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>疾病名称：</b></label>
									<div class="col-sm-10">
										<div id="diseaseName" style="margin-top:7px;">${medicalRecord.disease.name }</div>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>就诊结果：</b></label>
									<div class="col-sm-10">
										<div style="margin-top:7px;">${medicalRecord.result }</div>
									</div>
								</div>
							</div>
							<div class="row container">
								<div class="form-group">
									<label class="col-sm-2 control-label"><b>就诊状态：</b></label>
									<div class="col-sm-10">
										<label class="control-label">
											<c:if test="${medicalRecord.state==0 }"><div style="color:red;">未完成本次就诊</div></c:if>
											<c:if test="${medicalRecord.state==1 }"><div style="color:green;">已完成本次就诊</div></c:if>
										</label>
									</div>
								</div>
							</div>
						</form>
			        </div>
				</div>
				<!-- panel end -->
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							检查报告
							<span class="tools pull-right"> 
								<sec:authorize access="hasRole('ROLE_ffa068a06c0d4456b61bdb8799b9edf0')">
									<button class="btn btn-warning pull-left btn-add-checkReport">添加检查报告</button>
								</sec:authorize>
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>报告名称</th>
								<th>诊察时间</th>
								<th>病情描述</th>
								<th>检查报告单</th>
							</tr>
							<c:forEach items="${checkReports }" var="checkReport">
								<tr>
									<td>${checkReport.name }</td>
									<td>${checkReport.time }</td>
									<td><span data-toggle="tooltip" data-placement="top" title="${checkReport.description }">查看病情描述</span></td>
									<td><a class="checkReportPhoto" urlImg="${checkReport.url }">检查报告</a></td>
								</tr>
							</c:forEach>	
						</table>
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
	<div class="modal fade" id="editDiseaseName" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 就诊记录
					</h5>
				</div>
				<div class="modal-body row">
					<form class="form-inline" method="post" >
						<input type="hidden" name="uuid" value="${medicalRecord.uuid }">
						<div class="form-group container">
							<div id="selectDiv">
								<select id="initSelect" name="disease" class="form-control diseaseTypeSelect"></select>
							</div>
						</div>
						<div class="blank"></div>
						<div class="col-sm-offset-4">
							<button uuid="${medicalRecord.uuid }" class="btn btn-info" id="editm-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="editResult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title text-left">
						<img src="assets/image/hospital.png" alt="医院图标" style="height: 20px; width: 20px;" /> 就诊记录
					</h5>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="post" action="medicalRecord/edit">
						<input type="hidden" name="uuid" value="${medicalRecord.uuid }">
						<div class="row container">
							<div class="form-group" id="editm-resultGroup">
								<label class="col-sm-2 control-label">就诊结果：</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<textarea id="editm-result" class="form-control" name="result" rows="7" placeholder="请输入有关就诊结果的描述">${medicalRecord.result }</textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-4">
							<button class="btn btn-info" id="editmr-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="addCheckReport" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/hospital.png" alt="医院图标" style="height: 20px; width: 20px;" /> 医院信息
					</h5>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" method="post" action="medicalRecord/addCheckReport" enctype="multipart/form-data">
						<input type="hidden" name="medicalRecordUuid" value="${medicalRecord.uuid }">
						<div class="row container">
							<div class="form-group" id="addchr-nameGroup">
								<label class="col-sm-2 control-label">报告名称：</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addchr-name" class="form-control" name="name" type="text" placeholder="请输入报告名称">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addchr-descriptionGroup">
								<label class="col-sm-2 control-label">诊断结果：</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<textarea id="addchr-description" class="form-control" name="description" rows="7" placeholder="请输入诊断结果描述"></textarea>
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="addchr-imgGroup">
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
							<button class="btn btn-info addchr-submit">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End -->
	
	<!-- Modal Start -->
	<div class="modal fade" id="checkReportPhotoDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/url.png" alt="检查报告" style="height: 20px; width: 20px;" /> 检查报告
					</h5>
				</div>
				<div class="modal-body row">
					<div class="col-sm-12 container-fluid">
						<img class="urlImg" src="" alt="检查报告单" style="height: 100%; width: 100%;" />
					</div>
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
	<script src="assets/js/doctor/medicalRecordDetail.js"></script>
	
	<script>
		$(function(){
			/* 导航颜色 */
			$("#navi_doctor_unfinished").addClass('active');
		});	
	</script>
</body>
</html>