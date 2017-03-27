<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- left side start-->
<div class="left-side sticky-left-side">
	<!--logo and iconic logo start-->
	<div class="logo">
		<a href="index.html"><img src="assets/adminex/images/logo.png" alt=""></a>
	</div>

	<div class="logo-icon text-center">
		<a href="index.html"><img src="assets/adminex/images/logo_icon.png" alt=""></a>
	</div>
	<!--logo and iconic logo end-->

	<div class="left-side-inner">
		<!-- visible to small devices only -->
		<div class="visible-xs hidden-sm hidden-md hidden-lg">
			<div class="media logged-user">
				<img alt="" src="assets/adminex/images/photos/user-avatar.png" class="media-object">
				<div class="media-body">
					<h4>
						<a href="#">${loginUser.userName }</a>
					</h4>
					<span>"欢迎您的登陆！"</span>
				</div>
			</div>

			<h5 class="left-nav-title">用户信息</h5>
			<ul class="nav nav-pills nav-stacked custom-nav">
				<li><a><i class="fa fa-user"></i> ${loginUser.name }</a></li>
				<li><a href="#"><i class="fa fa-cog"></i> 修改密码</a></li>
				<li><a href="logout"><i class="fa fa-sign-out"></i> 登 出</a></li>
			</ul>
		</div>

		<!--sidebar nav start-->
		<ul class="nav nav-pills nav-stacked custom-nav">
			<sec:authorize access="hasRole('ROLE_0604e260e1964c099bcdc0c87dad42c5')">	
				<li id="navi_index"><a href="userIndex"><i class="fa fa-home"></i> <span>首页</span></a></li>
			</sec:authorize>	
			<!-- resident start -->
			<sec:authorize access="hasRole('ROLE_9020fe55a21f487480bce4840b42f433')">	
				<li id="navi_resident_baseInfo"><a href="resident/baseInfo"><i class="fa fa-laptop"></i> <span>基本信息</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_d79782ab79c546d28022742d36840dc8')">	
				<li id="navi_resident_healthInfo"><a href="resident/healthInfo"><i class="fa fa-book"></i> <span>健康信息</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_c0fb8b5ef0134ddaa29fd49e262cadae')">	
				<li id="navi_resident_medicalRecord"><a href="resident/medicalRecord"><i class="fa fa-bar-chart-o"></i> <span>就诊记录</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_4552efe831b747b9af64b5d255861022')">	
				<li id="navi_resident_immuneRecord"><a href="resident/immuneRecord"><i class="fa fa-file-text"></i> <span>免疫记录</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ce0cb7ea8e734ea99b22e185dd55aaff')">	
				<li id="navi_resident_healthRecord"><a href="resident/healthRecord"><i class="fa fa-folder"></i> <span>体检记录</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_b1612b0c44c84604b7bf2fe699ffa8e4')">	
				<li id="navi_resident_familyInfo"><a href="family/familyInfo"><i class="fa fa-tasks"></i> <span>家庭信息</span></a></li>
			</sec:authorize>
			<!-- resident end -->
			
			<!-- admin start -->
			<sec:authorize access="hasRole('ROLE_33593600ece148d8b897a443d3192279')">	
				<li id="navi_admin_hospital"><a href="hospital/list"><i class="fa fa-gift"></i> <span>医院管理</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_13d9d180d3ba45e680ef573d49e62761')">	
				<li id="navi_admin_family"><a href="family/manage"><i class="fa fa-crosshairs"></i> <span>家庭管理</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_083e10f097ef4cc88db52988fb135933')">	
				<li id="navi_admin_resident"><a href="resident/manage"><i class="fa fa-file"></i> <span>居民管理</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_02d4cd3bd5cd4b1ebdd312de2447ced0')">	
				<li id="navi_admin_manager"><a href="manager/manage"><i class="fa fa-credit-card"></i> <span>管理员管理</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_ada7dc08b7b440d4a83249062c065a20')">	
				<li id="navi_admin_resource"><a href="resource/manager"><i class="fa fa-bullhorn"></i> <span>资源管理</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_c698654dd2254608920cdb3d7f1bbe9d')">	
				<li id="navi_admin_role"><a href="role/manager"><i class="fa fa-users"></i> <span>角色管理</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_b5af00b6c8604b1cb0036df26bdc52ff')">
				<li id="navi_diseaseType"><a href="diseaseType/manage"><i class="fa fa-calendar"></i> <span>疾病类型管理</span></a></li>
			</sec:authorize>	
			<sec:authorize access="hasRole('ROLE_b15ed26f7a31445693d3d26c67be3583')">
				<li class="menu-list"><a href=""><i class="fa fa-fire"></i> <span>疾病类型统计</span></a>
	                <ul class="sub-menu-list">
	                    <li id="navi_singleDisease"><a href="statistics/toSingleDisease"> 单一疾病发病率走势统计</a></li>
	                    <li id="navi_multipleDisease"><a href="statistics/toMultipleDisease"> 多疾病发病率走势统计</a></li>
	                    <li id="navi_diseasePercent"><a href="statistics/toDiseasePercent"> 发病率比率统计</a></li>
	                </ul>
				</li>
			</sec:authorize>	
			
			<!-- admin end -->
			
			<!-- doctor start -->
			<sec:authorize access="hasRole('ROLE_26861743a0d641c696437a1d929a0c29')">	
				<li id="navi_doctor_baseInfo"><a href="doctor/baseInfo"><i class="fa fa-laptop"></i> <span>基本信息</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_f1ac35ed65c04140b5d4b50410f2fffa')">	
				<li id="navi_doctor_toCreate"><a href="medicalRecord/toCreate"><i class="fa fa-book"></i> <span>新建记录</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_8b8af33315224f47b04dfda0a81d5c1e')">	
				<li id="navi_doctor_finished"><a href="medicalRecord/finished"><i class="fa fa-file-text"></i> <span>已完成就诊记录</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_5205bd061ea242f99186f3b272fe312d')">	
				<li id="navi_doctor_unfinished"><a href="medicalRecord/unfinished"><i class="fa fa-th-list"></i> <span>待完成就诊记录</span></a></li>
			</sec:authorize>
			<!-- doctor end -->
			
			<!-- hospitalManager start -->
			<sec:authorize access="hasRole('ROLE_0984ce00a6ca4c79ad5cd69e05772c4b')">	
				<li id="navi_hospitalManager_department"><a href="department/manage"><i class="fa fa-gift"></i> <span>科室管理</span></a></li>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_d079fc6f75eb49148b9be9fe63c5a526')">	
				<li id="navi_hospitalManager_doctor"><a href="doctor/manage"><i class="fa fa-crosshairs"></i> <span>医生管理</span></a></li>
			</sec:authorize>
			<!-- hospitalManager end -->
			
			<sec:authorize access="hasRole('ROLE_1d3a4457d5a94b188e9916ba1474296c')">	
				<li id="navi_newsManage"><a href="news/manage"><i class="fa fa-bar-chart-o"></i> <span>新闻管理</span></a></li>
			</sec:authorize>
		</ul>
		<!--sidebar nav end-->
	</div>
</div>
<!-- left side end-->
