<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="css/freelancer.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

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
					<li class="hidden"><a href="#page-top"></a></li>
					<li class="page-scroll"><a href="#about">LOGIN</a></li>
					<li class="page-scroll"><a href="#join">JOIN</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Header -->
	<header>
		<div class="container" id="maincontent" tabindex="-1">
			<div class="row">
				<div class="col-lg-12">
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br> <br> <br> <br> <br>
					<div class="intro-text">
						<h1 class="name">WELCOME TO CUKIPEDIA</h1>
						<hr>
						<span class="skills">Catholic University - Sharing
							Knowledge - Communication</span>
					</div>
				</div>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>
			</div>
		</div>
	</header>



	<!-- LOGIN Section -->
	<section class="login" id="about">
		<div class="container">
			<div class="row">
				<br> <br>
				<div class="col-lg-12 text-center">
					<h2 style="color: white">HELLO STUDENT</h2>
					<hr class="star-light">
				</div>
			</div>
			<br> <br>

			<div class="row">
				<div class="col-lg-12" align="center">
					<form action="LoginServlet" method="POST">
						<input name="id" type="text" placeholder="Enter your ID"
							style="border: 5px #ac8f5d solid; width: 300px; height: 50px; border-radius: 10px; padding: 10px;" required>
						<br></br> <input name="password" type="password"
							placeholder="Enter your PW"
							style="border: 5px #ac8f5d solid; width: 300px; height: 50px; border-radius: 10px; padding: 10px;" required>
						<br></br> <br> <br>
						<div></div>
						<div class="row">
							<div class="form-group col-xs-12" style="">
								<button type="submit" class="btn btn-success btn-lg">LOGIN</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<br> <br>
		</div>
	</section>


	<!-- JOIN Section -->
	<section id="join">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2>JOIN US</h2>
					<hr class="star-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<form action="JoinServlet" method="POST" name="sentMessage"
						novalidate>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="name">이름</label> <input type="text"
									class="form-control" name="name" placeholder="Name" required>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="id">아이디</label> 
								<input type="text" class="form-control" name="id" placeholder="ID" required>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="phone">비밀번호</label> <input type="password"
									class="form-control" name="password" placeholder="PassWord" required>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="phone">학번</label> 
								<input type="text" class="form-control" name="number" placeholder="Student Number" required>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="row control-group">
							<div
								class="form-group col-xs-12 floating-label-form-group controls">
								<label for="phone">전공</label> <input type="text" class="form-control" name="major" placeholder="Major" required>
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<br>
						<div id="success"></div>
						<div class="row">
							<div class="form-group col-xs-12" style="">
								<button type="submit" class="btn btn-success btn-lg">JOIN</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

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
