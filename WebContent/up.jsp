<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String ID;
	HttpSession a = request.getSession();
	if (a.getAttribute("ID") == null) {
		response.sendRedirect("needlogin.jsp");
		session.invalidate();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<%
		Connection conn = null;
		Statement stmt = null;
		Statement stmt2 = null;
		Statement stmt3 = null;

		try {
			conn = DriverManager.getConnection(
);
			if (conn == null)
				throw new Exception("연결 실패");
			stmt = conn.createStatement();
			stmt2 = conn.createStatement();
			stmt3 = conn.createStatement();
		} catch (Exception e) {
			throw new ServletException(e);
		}

		int num = Integer.parseInt(request.getParameter("num"));
		String id = session.getAttribute("ID").toString();
		String sql2 = "SELECT * FROM one WHERE num=" + num + " and (up='" + id + "' or down='" + id + "')";
		stmt2 = conn.prepareStatement(sql2);
		stmt.executeQuery(sql2);
		ResultSet rs = stmt2.executeQuery(sql2);

		if (!rs.next()) {
			String sql3 = "insert into one (num,up) values (" + num + ",'" + id + "')";
			stmt3 = conn.prepareStatement(sql3);
			stmt3.executeUpdate(sql3);

			String sql = "UPDATE class2 SET up=up+1 WHERE num=" + num;
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate(sql);
	%>
	<script>
		alert('좋아요를 눌렀습니다');
		history.back();
	</script>
	<%
		} else {
	%>
	<script>
		alert('이미 좋아요나 싫어요를 눌렀습니다');
		history.back();
	</script>
	<%
		}
	%>

</body>
</html>