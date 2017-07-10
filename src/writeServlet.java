import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/writeServlet")
public class writeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public writeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session=request.getSession();
		String ID;
		HttpSession ch = request.getSession();
		if (ch.getAttribute("ID") == null) {
			response.sendRedirect("needlogin.jsp");
			session.invalidate();
		}
		response.setContentType("text/html; charset=utf-8");
		// TODO Auto-generated method stub

		String contents = new String(request.getParameter("estContent").getBytes("8859_1"), "UTF-8");
		String s = request.getParameter("hide");
		Integer.parseInt(s);
		try {
			Connection conn = null;
			conn = DriverManager.getConnection(
);
			java.sql.Statement st = null;
			st = conn.createStatement();
			st.executeUpdate("insert into est_board values ('" + contents + "', " + s + ")");

			javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("writingSuc.jsp");
			dispatcher.forward(request, response);

		} catch (SQLException sqex) {
			System.out.println("getMessage : " + sqex.getMessage());
			System.out.println("getSQLState : " + sqex.getSQLState());
		}

	}

}
