import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String password = request.getParameter("password");

		session.setAttribute("ID", id);

		try {
			Connection con = null;
			con = DriverManager.getConnection(
);
			java.sql.Statement st = null;
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select password from student where id = '" + id + "'");
			if (!rs.next()){
				out.println("<script language='javascript'>");
				out.println("alert('등록되지 않은 아이디 입니다. 다시 입력하여 주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();	
			} else {
				String real_password = rs.getString("password");
				session.setAttribute("password", real_password);
				if (password.equals(real_password)) {
					session.setAttribute("userID", id);
					out.println("<script language='javascript'>");
					out.println("alert('환영합니다!');");
					out.println("location.href='MainPage.jsp';");
					out.println("</script>");
					out.close();
				} else {
					out.println("<script language='javascript'>");
					out.println("alert('비밀번호가 맞지 않습니다. 다시 입력하여 주세요.');");
					out.println("history.back();");
					out.println("</script>");
					out.close();	
				}
			}

		} catch (SQLException sqex) {
			System.out.println("getMessage : " + sqex.getMessage());
			System.out.println("getSQLState : " + sqex.getSQLState());
		}
		response.setContentType("text/html;charset=utf-8");
	}
}
