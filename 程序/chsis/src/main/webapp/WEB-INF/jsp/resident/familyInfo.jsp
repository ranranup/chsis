<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
<link rel="shortcut icon" href="assets/image/favicon.ico" type="image/png">
<title>居民家庭信息</title>
<!-- Bootstrap -->
<link href="assets/adminex/css/style.css" rel="stylesheet">
<link href="assets/adminex/css/style-responsive.css" rel="stylesheet">

<!--你自己的样式文件 -->
<link href="assets/css/resident/index.css" rel="stylesheet">
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							家庭成员信息
							<span class="tools pull-right">
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>姓名</th>
								<th>年龄</th>
								<th>电话</th>
								<th>疾病信息</th>
								<th>体检记录</th>
								<th>免疫记录</th>
								<th>操作</th>
							</tr>
							<c:forEach items="${residents }" var="resident">
								<tr>
									<td>${resident.name }</td>
									<td>${resident.age }</td>
									<td>${resident.phone }</td>
									<td><a class="a-diseaseHistory" residentUuid="${resident.uuid }">疾病史</a></td>
									<td><a class="a-healthRecord" residentUuid="${resident.uuid }">体检记录</a></td>
									<td><a class="a-immuneRecord" residentUuid="${resident.uuid }">免疫记录</a></td>
									<td>
										<c:if test="${householderName != resident.name }">
											<sec:authorize access="hasRole('ROLE_64dd9241f6f14444bb25bbdd63d9091e')">
												<button class="btn btn-danger btn-sm deleteMember" onclick="removeResident('${resident.uuid}')">移除</button> 
											</sec:authorize>
										</c:if>
										<sec:authorize access="hasRole('ROLE_ef36fad1e3774a11b233067b3bf5f6a1')">
											<button class="btn btn-primary btn-sm btn-residentDetail" uuid="${resident.uuid }">详情</button> 
										</sec:authorize>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							家庭基本信息
							<span class="tools pull-right">
								<a class="fa fa-chevron-down" href="javascript:;"></a>
							</span>
						</h3>
					</div>
					<div class="panel-body">
						<table class="table table-bordered table-responsive table-hover">
							<tr class="info">
								<th>户主</th>
								<th>家庭编号</th>
								<th>家庭电话</th>
								<th>家庭地址</th>
								<th>所在社区</th>
								<th>操作</th>
							</tr>
							<tr>
								<td>${householderName }</td>
								<td>${family.number }</td>
								<td>${family.phone }</td>
								<td>${family.address }</td>
								<td>${family.community.name }</td>
								<td>
									<sec:authorize access="hasRole('ROLE_defce548a8664d42a425628e112fbe09')">
										<button class="btn btn-success btn-sm btn-edit-family">修改</button> 
									</sec:authorize>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<!--body wrapper end-->

			<!--footer section start-->
			<%@ include file="/include/footer.jsp"%>
			<!--footer section end-->
		</div>
		<!-- main content end-->
	</section>

	<!-- Modal Start-->
	<div class="modal fade" id="diseaseHistoryDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 疾病史
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-12">
						<table id="table-diseaseHistory" class="table table-responsive table-hover">
							<tr>
								<th>疾病名称</th>
								<th>疾病类型</th>
								<th>开始时间</th>
								<th>痊愈时间</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->

	<!-- Modal Start-->
	<div class="modal fade" id="healthRecord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 体检记录
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-12">
						<table id="table-healthRecord" class="table table-responsive table-hover">
							<tr>
								<th>体检人</th>
								<th>体检医院</th>
								<th>体检时间</th>
								<th>体检描述</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	<!-- Modal Start-->
	<div class="modal fade" id="immuneRecord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 免疫记录
					</h4>
				</div>
				<div class="modal-body row">
					<div class="col-sm-12">
						<table id="table-immuneRecord" class="table table-responsive table-hover">
							<tr>
								<th>接种人</th>
								<th>接种医院</th>
								<th>接种时间</th>
								<th>疫苗名称</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	<!-- Modal Start-->
	<div class="modal fade" id="residentDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 家庭成员信息
					</h4>
				</div>
				<div class="modal-body container col-sm-12">
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>居民姓名：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="resident-name"></h5>
						</div>
						<div class="col-sm-3 text-right">
							<h5>
								<b>居民性别：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-sex"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>身份证号：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="resident-idNo"></h5>
						</div>
						<div class="col-sm-3 text-right">
							<h5>
								<b>所属民族：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-nation"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>出生日期：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-birth"></h5>
						</div>
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>居民年龄：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-age"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>年龄分段：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-period"></h5>
						</div>
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>联系电话：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-phone"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>婚姻状况：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-marriage"></h5>
						</div>
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>居民身高：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-height"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>居民体重：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-weight"></h5>
						</div>
						<div class="col-sm-3 text-right col-sm-offset-1">
							<h5>
								<b>居民血型：</b>
							</h5>
						</div>
						<div class="col-sm-2 text-left">
							<h5 id="resident-bloodType"></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3 text-right">
							<h5>
								<b>居民视力：</b>
							</h5>
						</div>
						<div class="col-sm-3 text-left">
							<h5 id="resident-eyesight"></h5>
						</div>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	<!-- Modal Start-->
	<div class="modal fade" id="editFamily" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title text-left">
						<img src="assets/image/modal.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" /> 修改家庭信息
					</h4>
				</div>
				<div class="modal-body row">
					<form class="form-horizontal" method="POST" action="family/editFamily">
						<input name="uuid" type="hidden" value="${family.uuid }">
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">家庭编号</label>
								<div class="col-sm-3">
									<input class="form-control" name="number" type="text" placeholder="家庭编号" value="${family.number }" readonly>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editf-phoneGroup">
								<label class="col-sm-2 control-label">家庭电话</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editf-phone" class="form-control" name="phone" type="text" placeholder="家庭电话" value="${family.phone }">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group" id="editf-addressGroup">
								<label class="col-sm-2 control-label">家庭地址</label>
								<div class="col-sm-3">
									<div class="iconic-input right">
										<input id="editf-address" class="form-control" name="address" type="text" placeholder="家庭地址" value="${family.address }">
										<p class="help-block"></p>
									</div>
								</div>
							</div>
						</div>
						<div class="row container">
							<div class="form-group">
								<label class="col-sm-1 col-sm-offset-1 control-label">所在社区</label>
								<div class="col-sm-3">
									<select id="community" name="communityUuid" class="form-control" communityName="${family.community.name }"></select>
								</div>
							</div>
						</div>
						<div class="col-sm-offset-5">
							<button id="editf-submit" class="btn btn-success">保存</button>
							<button class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
				
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	
	
	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script src="assets/adminex/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/adminex/js/jquery.nicescroll.js"></script>

	<!--common scripts for all pages-->
	<script src="assets/adminex/js/scripts.js"></script>
	<script src="assets/js/resident/familyInfo.js"></script>

</body>
</html>
