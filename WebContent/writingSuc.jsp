<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<script>
		alert("글쓰기 성공!");
		location.replace("CourListServlet");
	</script>
</body>
</html> 