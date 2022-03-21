<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>감사감사</title>

<!-- Google Font -->
 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Custom fonts for this template-->
<link href="/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
     
    <!-- Custom styles for this template-->
    <link href="/resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

 
 
<Style>

.logo {
	width: 210px;
	height: 50px;
	
}

</Style>
<body>


  
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary2 sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
		 
			 <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                 
                <div class="sidebar-brand-text mx-3"><h3>통계를 보자</h3> <sup></sup></div>
            </a>
		 

			<!-- Divider -->
			<hr class="sidebar-divider my-0">



			<!-- Divider -->
			<hr class="sidebar-divider">





			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-chart-area"></i> <b>통계</b>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">

						<a class="collapse-item" href="/statistics/income">매출액 통계</a> <a
							class="collapse-item" href="/statistics/visitor">방문자 통계 안됨</a>


					</div>
				</div></li>
				<div style="margin: 80px; font-size:15px;">
			<sec:authorize access="isAnonymous()">
								<li><a href="/login" style="color:white;" class="login-panel">Login</a></li>
							</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
				 <a href="/login/logout"  style="color:white;" class="login-panel">Logout</a>
			</sec:authorize></div>
		 	
		 	
		 	<div class="col-lg-1">
						 
						<a href="/">
						<img src="/resources/img/logo.jpg" class="logo"  alt=""></a>
					</div>


		</ul>
		<!-- End of Sidebar -->

 <!-- Bootstrap core JavaScript-->
    <script src="/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/admin/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/admin/js/demo/chart-area-demo.js"></script>
    <script src="/resources/admin/js/demo/chart-pie-demo.js"></script>

</body>

</html>