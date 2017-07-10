<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%request.setCharacterEncoding("UTF-8"); %>
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
   <style>
   @import url(http://fonts.googleapis.com/earlyaccess/hanna.css);
      tr{ border: 3px solid white; height:100px;
         }
      table {margin:auto;}
      th {text-align:center;}
      div.a {font-size:30px;
            color:white;
            font-family: "Hanna";}
      h1.title{font-size:40px;
            color: #ffe87c;;
            font-family: "Hanna";}
      th.thclass {text-align:center;
                  color: #009933;
             border-radius:50px;
}

      div.answer{color:white;
            font-size:20px;
            font-weight:bold;
            DISPLAY: none;}
      button{margin-left:10px;}
      a.question {font-family:"Verdata Italic";
     color: #fff04e;;
      background-color: #54452d;
      font-weight:bold;
      font-size:20px;}
      textarea.textclass{color:black;
      font-size:10px;
      margin:auto
  }
      header.hi{
         background-image:url(./img/img1.jpg);
      }
       textarea.feedback{
         margin:auto;
         border:5px solid #ac8f5d;
         border-radius: 20px;
         color:black;
         font-size:20px;
      }
     span.answer2 {
    background-color: #d3a254;
    color: #ffffff;
}

   </style>
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
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
</head>

<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
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
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header class="hi">
       <br><br><br><br>
       <h1 class="title"><%=request.getAttribute("subject")%>-<%=request.getAttribute("pro")%> 교수님</h1><br>
      <div class="tabbable"> <!-- 왼쪽과 오른쪽 탭에만 필요 -->
      <div class="tab-content">
          <form name=input method=post action="write_ok">
               <div class="a"></div>
               <br>
               <textarea class="feedback" rows="5" cols="100" style="margin:auto" name="question" ></textarea>
               <br><br>
               <input type=submit value="작성하기" class="btn btn-success"></button>
               <br><br><br>
           </form>
     </div>
   </br>
   <table border="1" width="90%" height="100">
   <div class="a">Q & A</div>
   
   <c:if test="${BOARD_INFO.size>=1}">
   
               
      <c:forEach var="cnt" begin="0" end="${BOARD_INFO.size-1}"> 
      <tr>
         
        <th class="thclass">
         <a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" 
                                         href="javascript:void(0)" class="question"  >
        ${BOARD_INFO.con[cnt]}</a>

        <c:if test="${BOARD_INFO.level[cnt]==1}"> 
        
        
            <br>
             <form name=input method=post action="makereply">
              <textarea class="feedback" rows="1" cols="100" style=" margin-left:5%;" class="textclass" name=question></textarea> 
              <input type="text" hidden="hidden" name="abc" value="${BOARD_INFO.seq[cnt]}" >
              <input type=submit value="답변하기" style="margin-top:-30px" class="btn btn-success">
             <br>
             </form>
             </c:if>
       
        </th></tr>
    </c:forEach> 
    </c:if>
    
   </table>
   </br></br><br><br>
     
   </div>
   <br><br>

    </header>

   
   
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
                                <a href="https://www.facebook.com/CUKbby/" target="_blank"class="btn-social btn-outline"><span class="sr-only">Facebook</span><i class="fa fa-fw fa-facebook"></i></a>
                            </li>
                            <li>
                                <a href="http://e-cyber.catholic.ac.kr/" target="_blank"class="btn-social btn-outline"><span class="sr-only">Google Plus</span><i class="fa fa-fw fa-google-plus"></i></a>
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
                        Copyright &copy; &nbsp  GUEST FASHION&nbsp 2017
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

