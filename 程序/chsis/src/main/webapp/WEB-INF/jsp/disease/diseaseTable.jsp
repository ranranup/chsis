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
<title>疾病类型</title>

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
					<li><a href="diseaseType/manage">疾病类型</a></li>
					<c:if test="${currentType != null}">
						<c:if test="${parentType != null }">
							<li><a href="diseaseType/list/${parentType.uuid }">${parentType.name }</a></li>
						</c:if>
						<li class="active">${currentType.name }</li>
					</c:if>
				</ul>
				<!-- panel start -->
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<c:if test="${currentType != null}">${currentType.name}</c:if>
							<c:if test="${currentType == null}">疾病类型</c:if>
							<span class="tools pull-right"> 
								<sec:authorize access="hasRole('ROLE_f0365f80b4e1484a8682b3a8f8e89251')">	
									<button class="btn btn-warning pull-left btn-add-disease" style="margin-right:5px;">添加疾病</button>
								</sec:authorize>
								<sec:authorize access="hasRole('ROLE_d9584d4b35824d4890b5edc1d61d80ca')">	
									<button class="btn btn-danger pull-left btn-delete-diseaseType" uuid="${currentType.uuid }">删除类型</button>
								</sec:authorize>	
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table">
							<c:forEach begin="0" end="${size / 5 + 1}" step="1" varStatus="id">
								<tr>
									<c:forEach begin="${id.index * 5 }" end="${id.index * 5 + 4}" step="1" items="${diseases }" var="disease">
										<td>
											${disease.name }
											<sec:authorize access="hasRole('ROLE_cb3e9b91078a4458adda2aa4f716a2d4')">		
												<span class="but btn-primary btn-sm" onclick="deleteDisease('${disease.uuid}','${currentType.uuid }')" style="margin-left:5px;">删除</span>
											</sec:authorize>	
										</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</table>
			        </div>
				</div>
				<!-- panel end -->
			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>

	<!-- Modal Start -->
	<div class="modal fade" id="addDiseaseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h5 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;" /> 添加疾病
					</h5>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="post" action="disease/add">
						<input type="hidden" name="diseaseType.uuid" value="${currentType.uuid }">
						<div class="row container">
							<div class="form-group" id="addDiseaseNameGroup">
								<label class="col-sm-2 control-label">疾病名称：</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="addDisease-name" class="form-control" type="text" name="name" placeholder="请输入疾病名称" ">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-sm-offset-4">
							<sec:authorize access="hasRole('ROLE_f0365f80b4e1484a8682b3a8f8e89251')">
								<button class="btn btn-info" id="addDisease-submit">保存</button>
							</sec:authorize>	
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
	<script src="assets/js/disease/diseaseTable.js"></script>
	
	<script>
		$(function(){
			/* 导航颜色 */
			$("#navi_diseaseType").addClass('active');
		});	
	</script>
</body>
</html>