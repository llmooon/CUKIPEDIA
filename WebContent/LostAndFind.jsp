<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <title>Lost & Find</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#imgInp").on('change', function(){
                readURL(this);
            });
        });
		$(function() {
            $("#imgInp2").on('change', function(){
                readURL2(this);
            });
        });
        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
		function readURL2(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah2').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
	
	<style>
		input.temp:-ms-input-placeholder { color: white; } 
		input.temp::-webkit-input-placeholder { color: white; }
		input.temp::-moz-placeholder { color: white; }
		input.temp::-moz-placeholder { color: white; }
		
		input.temp2:-ms-input-placeholder { color: #523e32; } 
		input.temp2::-webkit-input-placeholder { color: #523e32; }
		input.temp2::-moz-placeholder { color: #523e32; }
		input.temp2::-moz-placeholder { color: #523e32; }	
		
		.file_input label 
		{
			position:relative;
			cursor:pointer;
			display:inline-block;
			vertical-align:middle;
			overflow:hidden;
			width:100px;
			height:30px;
			background:#ac8f5d;
			color:#fff;
			text-align:center;
			line-height:30px;
		}
		.file_input label input 
		{
			position:absolute;
			width:0;
			height:0;
			overflow:hidden;
		}
		.file_input input[type=text] 
		{
			vertical-align:middle;
			display:inline-block;
			width:400px;
			height:28px;
			line-height:28px;
			font-size:11px;
			padding:0;
			border:0;
			border:1px solid #777;
		}
	</style>
</head>

<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">CUKipedia</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="page-scroll">
                        <a href="./MainPage.jsp">HOME</a>
                    </li>
					<li class="page-scroll">
                        <a href="./LogOutAction.jsp">LOGOUT</a>
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
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    <div class="intro-text"> 
                        <h1 class="name">L O S T &nbsp;&nbsp; &&nbsp;&nbsp;&nbsp; F I N D</h1>
                        <hr >
						<span class="skills page-scroll font">
							<a href="#join" style="color:white; font-family: 'Hanna', serif;ss">주인을 찾아요(습득물)</a>
							&nbsp&nbsp&nbsp - &nbsp&nbsp&nbsp 
							<a href="#about" style="color:white">잃어버렸나요?(분실물)</a>
							&nbsp&nbsp&nbsp - &nbsp&nbsp&nbsp 
							<a href="ReadFindItem" style="color:white">습득물 확인</a>
							&nbsp&nbsp&nbsp - &nbsp&nbsp&nbsp 
							<a href="ReadLostItem" style="color:white">분실물 확인</a>
						</span>
                    </div>
					<br><br><br><br><br><br><br><br>
                </div>
                <br><br>
            </div>
        </div>
    </header>

	<!-- JOIN Section -->
    <section id="join">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="font">습득물 신고</h2>
                    <hr class="star-primary">
                </div>
            </div>
			<br><br>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2"> 
				   <form action="AddFindItemServlet" id="form1" method="POST" enctype="multipart/form-data">
                       <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                      			<label for="itemname">습득물 명</label>
                      			<input type="text" name="itemname" class="form-control temp2" placeholder="습득물 명" required>
                      			<p class="help-block text-danger"></p>
                      		</div>
                      	</div>
                      	<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label for="findplace">습득 장소</label>
                      			<input type="text" name="findplace" class="form-control temp2" placeholder="습득 장소" required>
                      			<p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label for="storage">보관 장소</label>
                                <input type="text" name="storage" class="form-control temp2" placeholder="보관 장소" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label for="lostname">분실자 명</label>
                                <input type="text" name="lostname" class="form-control temp2" placeholder="분실자 명" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>        
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label for="findname">습득자 명</label>
                                <input type="text" name="findname" class="form-control temp2" placeholder="습득자 명" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label for="phone">전화 번호</label>
                                <input type="text" name="phone" class="form-control temp2" placeholder="전화 번호" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>                
						<div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label for="finddate">습득 날짜</label>
                                <input type="date" name="finddate" class="form-control temp2" placeholder="습득 날짜" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        
                        <br><br>					
						<div class="file_input font">	
								<label>사진 첨부
									<input type="file" name="findimg" id="imgInp"/>
								</label>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<img id="blah" src="#"  onerror="this.src='./img/null1.png'" style="width: 300px; height: auto;"/>
						</div>
						<br><br><br>				
						<div style="text-align:center;">
                                <input type="submit" value="RECEIPT" class="btn btn-success btn-lg"/>
                        </div>
					</form>
                </div>
            </div>
        </div>
    </section>
	
	
	
    <!-- LOGIN Section -->
    <section class="login" id="about">
        <div class="container">
            <div class="row">
            <br><br>
                <div class="col-lg-12 text-center">
                    <h2 style="color:white" class="font">분실물 신고</h2>
                    <hr class="star-light">
                </div>
            </div> 
			<br><br>
			<div class="row">
                <div class="col-lg-8 col-lg-offset-2">
				   <form action="AddLostItemServlet" method="POST" enctype="multipart/form-data">
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label style="color:white;" for="itemname">분실물 명</label>
                                <input style="color:white;" type="text" class="form-control temp" placeholder="분실물 명" name="itemname" required>
                                <p class="help-block text-danger"></p>                            
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label style="color:white;" for="lostplace">분실 장소</label>
                                <input style="color:white;" type="text" class="form-control temp" name="lostplace" placeholder="분실 장소" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label  style="color:white;" for="lostname">분실자 명</label>
                                <input style="color:white;" type="text" class="form-control temp" name="lostname" placeholder="분실자 명" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label  style="color:white;" for="phone">전화 번호</label>
                                <input style="color:white;" type="text" class="form-control temp" name="phone" placeholder="전화 번호" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls font">
                                <label style="color:white;" for="lostdate">분실 날짜</label>
                                <input style="color:white;" type="date" class="form-control temp" name="lostdate" placeholder="분실 날짜" required>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
						<br><br>					
						<div class="file_input font">	
							<label>사진 첨부
									<input type="file" name="lostimg" id="imgInp2"/>
								</label>
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								<img id="blah2" src="#"  onerror="this.src='./img/null2.png'" style="width: 300px; height: auto;"/>
						</div>
						<br><br>
                        <br><br>
						<div style="text-align:center;">
                                <input type="submit" value="RECEIPT" class="btn btn-success btn-lg"/>
                        </div>
                    </form>
                </div>
            </div>
            <br><br>
        </div>
    </section>

	

    <!-- Footer -->
 <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>ABOUT US</h3>
                        <p>CSIE
                            <br>By GUEST FASHION</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Around the Web</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="https://www.facebook.com/CUKbby/" target="_blank" class="btn-social btn-outline"><span class="sr-only">Facebook</span><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="http://e-cyber.catholic.ac.kr/" target="_blank" class="btn-social btn-outline"><span class="sr-only">Google Plus</span><i class="fa fa-fw fa-google-plus"></i></a>
                            </li>
                            <li>
                                <a href="http://catholic.ac.kr" target="_blank" class="btn-social btn-outline"><span class="sr-only">Twitter</span><i class="fa fa-fw fa-twitter"></i></a>
                            </li>
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
                    <div class="col-lg-12">
                        Copyright &copy; &nbsp GUEST FASHION&nbsp 2017
                    </div>
                </div>
            </div>
        </div>
    </footer>

   

    <!-- jQuery -->
    <script src="vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script>

</body>

</html>
