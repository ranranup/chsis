<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="assets/css/jquery-confirm.css" rel="stylesheet">
<!-- header section start-->
<div class="header-section">
	<!--toggle button start-->
	<a class="toggle-btn"><i class="fa fa-bars"></i></a>
	<!--toggle button end-->

	<!--search start-->
	<form class="searchform" action="index.html" method="post">
		<input type="text" class="form-control" name="keyword" placeholder="Search here..." />
	</form>
	<!--search end-->
	<!--notification menu start -->
	<div class="menu-right">
		<ul class="notification-menu">
			<li><a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <img src="assets/adminex/images/photos/user.png" alt="" /> ${loginUser.userName } 欢迎您！ <span class="caret"></span>
			</a>
				<ul class="dropdown-menu dropdown-menu-usermenu pull-right">
					<li><a><i class="fa fa-user"></i> ${loginUser.name }</a></li>
					<li><a id="a-changePassword"><i class="fa fa-cog"></i> 修改密码</a></li>
					<li><a href="logout"><i class="fa fa-sign-out"></i> 登 出</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<!--notification menu end -->
</div>
<!-- header section end-->

<!-- Modal Start-->
<div class="modal fade" id="changePassword" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title text-left" id="myModalLabel">
					<img src="assets/image/settings.png" alt="图标" style="height: 20px; width: 20px;margin-top:-5px;" />
					修改密码
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="post" id="changePasswordForm">
					<div class="row container">
						<div class="form-group" id="oldPasswordGroup">
							<label class="col-sm-2 control-label">原密码：</label>
							<div class="col-sm-3">
								<div class="iconic-input right">
									<input id="oldPassword" class="form-control" type="password" placeholder="请输入原密码">
									<p class="help-block"></p>
								</div>
							</div>
						</div>
					</div>
					<div class="row container">
						<div class="form-group" id="newPasswordGroup">
							<label class="col-sm-2 control-label">新密码：</label>
							<div class="col-sm-3">
								<div class="iconic-input right">
									<input id="newPassword" class="form-control" type="password" name="password" placeholder="请输入新密码">
									<p class="help-block"></p>
								</div>
							</div>
						</div>
					</div>
					<div class="row container">
						<div class="form-group" id="newPassword2Group">
							<label class="col-sm-2 control-label">确认密码：</label>
							<div class="col-sm-3">
								<div class="iconic-input right">
									<input id="newPassword2" class="form-control" type="password" placeholder="请输入确认密码">
									<p class="help-block"></p>
								</div>
							</div>
						</div>
					</div>
					<div class="row container">
						<div class="form-group">
							<div class="col-sm-3 col-sm-offset-2">
								<button class="btn btn-default" data-dismiss="modal">取消</button>
								<button class="btn btn-primary header-btn-submit">保存</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>

<!-- Custome Javascript -->
<script src="assets/adminex/js/jquery-1.10.2.min.js"></script>
<script src="assets/js/jquery-confirm.js"></script>
<script src="assets/js/jquery.base64.js"></script>
<script src="assets/js/header.js"></script>