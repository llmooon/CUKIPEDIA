<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ID;
	HttpSession a = request.getSession();
	if (a.getAttribute("ID") == null) {
		response.sendRedirect("needlogin.jsp");
		session.invalidate();
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>CUKipedia-Lecture List</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/freelancer.min.css" rel="stylesheet">


<!-- 내정보 CSS -->
<link href="css/myinformation.css" rel="stylesheet">
<link href="css/banana1.css" rel="stylesheet">

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
					<li class="page-scroll"><a href="./MainPage.jsp">HOME</a></li>
					<li class="page-scroll"><a href="./LogOutAction.jsp">LOGOUT</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!-- Header -->
	<header>
		<div class="container">
			<div class="row transparent result">

				<div style="width: 80%; margin: auto;">
					<div class="tuyin first">
						<span class="title">강의목록</span>
						<div class="plan-name">Click :)</div>
						<div class="text">
							<p>
								<br>
							<table class="list" border="1" style="width: 80%;">
								<tr>
									<td class="left" style="color: #4b4b4b">번호</td>
									<td class="left" style="color: #4b4b4b">과목명</td>
									<td class="left" style="color: #4b4b4b">교수님</td>
									<td class="left" style="color: #4b4b4b">좋아요</td>
									<td class="left" style="color: #4b4b4b">싫어요</td>
								</tr>
								<c:if test="${LEC.size-1>=0 }">
									<c:forEach var="cnt" begin="0" end="${LEC.size-1}">

										<tr>
											<td class="right" style="color: #ffffff">${cnt+1}</td>
											<td class="right" style="color: #ffffff"><a
												href="CourShowServlet?num=${LEC.seqno[cnt]}"
												style="text-decoration: none; color: white;">${LEC.subject[cnt]}</td>
											<td class="right" style="color: #ffffff">${LEC.pro[cnt]}</td>
											<td class="right" style="color: #ffffff">${LEC.up[cnt]}</td>
											<td class="right" style="color: #ffffff">${LEC.down[cnt]}</td>
										</tr>
									</c:forEach>
								</c:if>
							</table>
							</p>
						</div>
					</div>

				</div>
			</div>
			<BR> <BR> <BR>


		</div>
	</header>



	<!-- LOGIN Section -->


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
