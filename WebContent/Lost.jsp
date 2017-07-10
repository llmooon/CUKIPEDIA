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
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>confirm lost items</title>

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

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<style>
input.temp2:-ms-input-placeholder {
	color: #523e32;
}

input.temp2::-webkit-input-placeholder {
	color: #523e32;
}

input.temp2::-moz-placeholder {
	color: #523e32;
}

input.temp2::-moz-placeholder {
	color: #523e32;
}
</style>
</head>

<body id="page-top" class="index">
	<div id="skipnav">
		<a href="#maincontent">Skip to main content</a>
	</div>

	<!-- Navigation -->
	<nav id="mainNav"
		class="navbar navbar-default navbar-fixed-top navbar-custom">
		<div class="container">
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
					<li class="page-scroll"><a href="./LogOutAction.jsp">LOGOUT</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header>
		<div class="container" id="maincontent" tabindex="-1">
			<div class="row">
				<div class="col-lg-12">
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<div class="intro-text">
						<h1 class="name">confirm&nbsp&nbsplost&nbsp&nbspitems</h1>
						<hr>
						<span class="skills page-scroll font"> <a
							href="LostAndFind.jsp#join" style="color: white">주인을 찾아요(습득물)</a>
							&nbsp&nbsp&nbsp - &nbsp&nbsp&nbsp <a href="LostAndFind.jsp#about"
							style="color: white">잃어버리셨나요?(분실물)</a> &nbsp&nbsp&nbsp -
							&nbsp&nbsp&nbsp <a href="ReadFindItem" style="color: white">습득물
								확인</a> &nbsp&nbsp&nbsp - &nbsp&nbsp&nbsp <a href="#join"
							style="color: white">분실물 확인</a>
						</span>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</div>
				<br>
				<br>
			</div>
		</div>
	</header>

	<!-- JOIN Section -->
	<section id="join">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="font">분실물 목록</h2>
					<hr class="star-primary">
				</div>
			</div>
			<br>
			<c:if test="${LOST_LIST.listsize - 1 >= 0}">
				<c:forEach var="cnt" begin="0" end="${LOST_LIST.listsize - 1}">
					<hr style="width: 1200px; border: 2px solid #997058;">
					<br>
					<div class="row">
						<br>
						<table class="font"
							style="text-align: center; border: 3px solid white; margin-left: 3%;">
							<tr>
								<td rowspan="4"><img src="${LOST_LIST.lostimg[cnt]}"
									style="width: 400px; height: auto;"></td>
								<td colspan="4"
									style="padding-left: 100px; padding-bottom: 28px; font-size: 40px; font-weight: bold;">
									분실물
									명&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${LOST_LIST.itemname[cnt]}
								</td>
							</tr>
							<tr>
								<td
									style="padding-left: 100px; font-size: 21px; font-weight: bold;">
									분실자 명</td>
								<td style="padding-left: 50px; font-size: 20px;">
									${LOST_LIST.lostname[cnt]}</td>
								<td
									style="padding-left: 50px; font-size: 21px; font-weight: bold;">
									분실 장소</td>
								<td style="padding-left: 50px; font-size: 20px;">
									${LOST_LIST.lostplace[cnt]}</td>
							</tr>
							<tr>
								<td
									style="padding-left: 100px; font-size: 21px; font-weight: bold;">
									분실 날짜</td>
								<td style="padding-left: 50px; font-size: 20px;">
									${LOST_LIST.lostdate[cnt]}</td>
								<td
									style="padding-left: 50px; font-size: 21px; font-weight: bold;">
									연락처</td>
								<td style="padding-left: 50px; font-size: 20px;">
									${LOST_LIST.phone[cnt]}</td>
							</tr>
							<tr>
								<td colspan="4"
									style="padding-left: 100px; padding-top: 17px; font-size: 20px;">
									<input type="submit" value="FIND"
									class="btn btn-success btn-lg"
									onclick="location.href='DeleteLostItem?seqno=${LOST_LIST.seqno[cnt]}'" />
								</td>
							</tr>
						</table>
					</div>
				</c:forEach>
			</c:if>
			<hr style="width: 1200px; border: 2px solid #997058;">
			<br>
			<br>
			<div class="intro-text" style="text-align: center;">
				<h3 class="name">
					<c:if test="${!LOST_LIST.lastpage}">
						<span class="skills page-scroll font"> <a
							href='ReadLostItem?LAST_SEQ_NO=${LOST_LIST.seqno[LOST_LIST.listsize - 1]}'>
								다음 페이지 </a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</span>
					</c:if>
					<c:if test="${!LOST_LIST.startpage}">
						<span class="skills page-scroll font">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
							href='javascript:history.back()'> 이전 페이지 </a>
						</span>
					</c:if>
				</h3>
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
