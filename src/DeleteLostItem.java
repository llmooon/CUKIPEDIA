import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class DeleteLostItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		HttpSession ch = request.getSession();
		if (ch.getAttribute("ID") == null) {
			session.invalidate();
			out.println("<script language='javascript'>");
			out.println("location.href='needlogin.jsp';");
			out.println("</script>");
			out.close();
		}
		String id = ch.getAttribute("ID").toString();
		String seqno = request.getParameter("seqno");
		Connection conn = null;
		Statement stmt = null;
		Statement stmt2 = null;

		try {
			conn = DriverManager.getConnection(
					);
			if (conn == null)
				throw new Exception("");
			stmt = conn.createStatement();
			stmt2 = conn.createStatement();
			ResultSet rs = stmt2.executeQuery("select * from lostitem where seqno=" + seqno);
			String lostid = "1";
			if (rs.next()) {
				lostid = rs.getString("id");
				if (lostid.equals(id)) {
					stmt.executeUpdate("delete from lostitem where seqno=" + seqno + ";");
					stmt.executeUpdate("update lostitem set seqno=seqno-1 where seqno>" + seqno + ";");
					out.println("<script language='javascript'>");
					out.println("alert('글이 삭제되었습니다.');");
					out.println("location.href='ReadLostItem';");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script language='javascript'>");
					out.println("alert('본인이 아닙니다.');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
				}
			}
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				stmt.close();
			} catch (Exception ignored) {
			}
			try {
				conn.close();
			} catch (Exception ignored) {
			}
		}
		response.sendRedirect("ReadLostItem");
	}
}