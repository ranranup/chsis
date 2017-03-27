<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
	<link rel="shortcut icon" href="assets/image/favicon.ico">

    <title>居民健康服务信息系统</title>

    <link href="assets/adminex/css/style.css" rel="stylesheet">
    <link href="assets/adminex/css/style-responsive.css" rel="stylesheet">
    <link href="assets/css/jquery-confirm.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">
	<!--body wrapper start-->
    <div class="wrapper">
    	<div class="row">
    		<div class="col-sm-4 col-sm-offset-4">
				<section class="panel">
				    <header class="panel-heading custom-tab turquoise-tab">
				        <ul class="nav nav-tabs">
				            <li class="active">
				                <a data-toggle="tab" href="#joinFamily">
				                    <i class="fa fa-user"></i>
				                                                  加入家庭
				                </a>
				            </li>
				            <li class="">
				                <a data-toggle="tab" href="#createFamily">
				                    <i class="fa fa-envelope-o"></i>
				                                                  新建家庭
				                </a>
				            </li>
				        </ul>
				    </header>
				    <div class="panel-body">
					    <div class="form-signin-heading text-center">
					        <img src="assets/image/logo_login.png" alt="" style="margin-left:-15px;"/>
					    </div>
				        <div class="tab-content">
				            <div id="joinFamily" class="tab-pane active">
				            	<form class="form-signin" id="joinForm" method="POST" style="margin:0 auto;">
									<div class="login-wrap">
								       	<div class="row container">
											<div class="form-group" id="userNameGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="userName" class="form-control" name="userName" type="text" placeholder="请输入用户名">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="passwordGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="password" class="form-control" name="password" type="password" placeholder="请输入密码">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="repasswordGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="repassword" class="form-control" type="password" placeholder="请输入确认密码">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="nameGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="name" class="form-control" type="text" name="name" placeholder="请输入姓名">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="idNoGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="idNo" class="form-control" name="idNo" type="text" placeholder="请输入身份证号">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="familyNumberGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="familyNumber" name="familyNumber" class="form-control" type="text" placeholder="请输入家庭编号">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
							           <button id="join-submit" class="btn btn-lg btn-login btn-block" type="submit">
							               <i class="fa fa-check"></i>
							           </button>
								    </div>
								</form>
				            </div>
				            <div id="createFamily" class="tab-pane ">
				            	<form id="createForm" class="form-signin" method="POST" style="margin:0 auto;">
									<div class="login-wrap">
								       	<div class="row container">
											<div class="form-group" id="c-userNameGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-userName" class="form-control" name="userName" type="text" placeholder="请输入用户名">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="c-passwordGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-password" class="form-control" name="password" type="password" placeholder="请输入密码">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="c-repasswordGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-repassword" class="form-control" type="password" placeholder="请输入确认密码">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="c-nameGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-name" class="form-control" type="text" name="name" placeholder="请输入姓名">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="c-idNoGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-idNo" class="form-control" name="idNo" type="text" placeholder="请输入身份证号">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="c-phoneGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-phone" class="form-control" type="text" name="phone" placeholder="请输入联系电话">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="c-familyPhoneGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-familyPhone" class="form-control" name="familyPhone" type="text" placeholder="请输入家庭电话">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group" id="c-familyAddressGroup">
												<div class="col-sm-3">
													<div class="iconic-input right">
														<input id="c-familyAddress" class="form-control" name="familyAddress" type="text" placeholder="请输入家庭地址">
														<p class="help-block"></p>
													</div>
												</div>
											</div>
										</div>
										<div class="row container">
											<div class="form-group">
												<div class="col-sm-3">
													<select id="community" name="communityUuid" class="form-control" style="height:40px;font-size:0.9em;">
														<optgroup label="请选择所属社区（只能选一个）"></optgroup>
													</select>
												</div>
											</div>
										</div>
							           <button id="create-submit" class="btn btn-lg btn-login btn-block" type="submit">
							               <i class="fa fa-check"></i>
							           </button>
								    </div>
								</form>
				            </div>
				        </div>
				    </div>
				</section>		
			</div>
		</div>		
	</div>	
	<!--body wrapper end-->	

	<!-- Placed js at the end of the document so the pages load faster -->
	<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
	<script src="assets/adminex/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery-confirm.js"></script>
	<script src="assets/adminex/js/modernizr.min.js"></script>
	<script src="assets/js/jquery.base64.js"></script>
	<script src="assets/js/chsis/register.js"></script>

</body>
</html>
