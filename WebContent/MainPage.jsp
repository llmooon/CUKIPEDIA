<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
	String ID;
	HttpSession a = request.getSession();
	if (a.getAttribute("ID") == null) {
		response.sendRedirect("needlogin.jsp");
		session.invalidate();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>CUKipedia</title>
<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/main.css" rel="stylesheet">
<link href="css/freelancer.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body id="page-top" class="index">
	<div id="skipnav">
		<a href="#maincontent">Skip to main content</a>
	</div>

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header page-scroll">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> Menu <i
						class="fa fa-bars"></i>
				</button>
				<a class="navbar-brand" href="#page-top">CUKipedia</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li class="page-scroll"><a href="./MainPage.jsp">HOME</a></li>

					<li class="page-scroll"><a href="./LogOutAction.jsp">LOGOUT</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>


	<!-- Header -->
	<header class="Main_header">
		<br> <BR>
		<div class="container" id="maincontent" tabindex="-1">
			<div class="row">
				<div class="col-lg-12">
					<div>
						<h2 id="Main_title">CUKIPEDIA</h2>
					</div>
					<br> <br>

					<!--검색기능-->
					<form action="SearchClass" method="POST" id="form2">
						<div class="search_section">
							<input type="text" id="search_lecture" name="search_lecture"
								placeholder=" 어떤 강의를 검색하실래요?" /> &nbsp <input type="submit"
								id="search_button" value="SEARCH" />
						</div>
					</form>
					<br> <br> <br> <br> <br>


					<!-- 버튼 -->
					<div>
						<div class="col-lg-4" id="hover_class">
							<a href="MakeFreeBoard" class="button_class"> <img
								src="img/board.png">
							</a> <a href="MakeFreeBoard" class="button_class" id="tag_name">
								<h4>Free board</h4>
							</a>

						</div>

						<div class="col-lg-4" id="hover_class">
							<a href="./LostAndFind.jsp" class="button_class"> <img
								src="img/lost.png">
							</a> <a href="./LostAndFind.jsp" class="button_class" id="tag_name">
								<h4>Lost & Found</h4>
							</a>
						</div>

						<div class="col-lg-4" id="hover_class">
							<a href="./CourListServlet" class="button_class"> <img
								src="img/evaluation.png">
							</a> <a href="./CourListServlet" class="button_class" id="tag_name">
								<h4>
									Lecture<br>evaluation
								</h4>
							</a>

						</div>
					</div>
				</div>

			</div>
			<br> <br> <br>
			<div class="row">
				<div class="col-lg-12">
					<br> <br> <br>
					<div class="col-lg-4" id="hover_class">
						<a href="http://www.catholic.ac.kr" target="_blank"> <img
							src="img/school-campus.png">
						</a> <a href="http://www.catholic.ac.kr" target="_blank" id="tag_name">
							<h4>School Campus</h4>
						</a>

					</div>
					<div class="col-lg-4" id="hover_class">
						<a href="http://e-cyber.catholic.ac.kr/ilos/main/main_form.acl"
							target="_blank"> <img src="img/cyber-campus.png">
						</a> <a href="http://e-cyber.catholic.ac.kr/ilos/main/main_form.acl"
							target="_blank" id="tag_name">
							<h4>Cyber Campus</h4>
						</a>
					</div>
					<div class="col-lg-4" id="hover_class">
						<a href="https://www.facebook.com/CUKbby/" target="_blank"> <img
							src="img/bamboo.png">
						</a> <a href="https://www.facebook.com/CUKbby/" target="_blank"
							id="tag_name">
							<h4>Bamboo Forest</h4>
						</a>

					</div>



				</div>
			</div>
		</div>
		<br> <br> <br> <br>

	</header>


	</header>


	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3>ABOUT US</h3>
						<p>
							CSIE <br>By GUEST FASHION
						</p>
					</div>
					<div class="footer-col col-md-4">
						<h3>Around the Web</h3>
						<ul class="list-inline">
							<li><a href="https://www.facebook.com/CUKbby/"
								target="_blank" class="btn-social btn-outline"><span
									class="sr-only">Facebook</span><i class="fa fa-fw fa-facebook"></i></a>
							</li>
							<li><a href="http://e-cyber.catholic.ac.kr/" target="_blank"
								class="btn-social btn-outline"><span class="sr-only">Google
										Plus</span><i class="fa fa-fw fa-google-plus"></i></a></li>
							<li><a href="http://catholic.ac.kr" target="_blank"
								class="btn-social btn-outline"><span class="sr-only">Twitter</span><i
									class="fa fa-fw fa-twitter"></i></a></li>
						</ul>
					</div>
					<div class="footer-col col-md-4">
						<h3>About GUEST FASHION</h3>
						<p>For the CUK</p>
						<p>Of the CUK</p>
						<p>By the CUK</p>

					</div>
				</div>
			</div>
		</div>
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">Copyright &copy; &nbsp GUEST
						FASHION&nbsp 2017</div>
				</div>
			</div>
		</div>
	</footer>


	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/freelancer.min.js"></script>

</body>

</html>
