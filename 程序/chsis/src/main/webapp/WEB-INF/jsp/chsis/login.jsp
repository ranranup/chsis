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

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">

<div class="container">
    <form class="form-signin" method="POST" action="login">
        <div class="form-signin-heading text-center">
            <img src="assets/image/logo_login.png" alt="" style="margin-left:-15px;"/>
        </div>
        <div class="login-wrap">
            <input type="text" class="form-control" placeholder="请输入用户名" autofocus name="username" id="username"/>
            <input type="password" class="form-control" placeholder="请输入密码" name="password" id="password" />
			<div class="form-group">
				<label class="control-label" style="margin-top:10px;">请选择您的身份:</label>
				<label class="radio-inline">
					<input type="radio" name="roleType" value="resident" checked> 居民
				</label>
				<label class="radio-inline">
					<input type="radio" name="roleType" value="doctor"> 医生
				</label>
			</div>	
            <button id="submit" class="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </button>
            <div>
				<p id="msg" style="text-align:center;color:red"></p>
			</div>
        </div>
    </form>
</div>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
<script src="assets/adminex/js/bootstrap.min.js"></script>
<script src="assets/adminex/js/modernizr.min.js"></script>
<script src="assets/js/jquery.base64.js"></script>
<script src="assets/js/chsis/login.js"></script>

</body>
</html>
