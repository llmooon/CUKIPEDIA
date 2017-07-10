import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.PrintWriter;

@WebServlet("/JoinServlet")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String number = request.getParameter("number");
		String major = request.getParameter("major");

		if (id.equals("") || id == null || id.equals("null")) {
			out.println("<script language='javascript'>");
			out.println("alert('아이디가 공백입니다. 다시 입력하여 주세요.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();			
		} else {
			try {
				Connection con = null;
				con = DriverManager.getConnection(
);
				java.sql.Statement st = null;
				java.sql.Statement st2 = null;

				st = con.createStatement();
				st2 = con.createStatement();
				ResultSet rs = st2.executeQuery("select * from student where id = '" + id + "'");
				if(!rs.next()){
					st.executeUpdate("insert into student value ('" + name + "','" + id + "','" + password + "','" + number
						+ "','" + major + "')");
				}
				else {
					out.println("<script language='javascript'>");
					out.println("alert('이미 등록된 아이디 입니다. 다시 입력하여 주세요.');");
					out.println("history.back();");
					out.println("</script>");
					out.close();				
				}
			} catch (SQLException sqex) {
				System.out.println("error: " + sqex.getMessage());
				System.out.println("error: " + sqex.getSQLState());
			}
			response.setContentType("text/html;charset=utf-8");
			out.println("<script language='javascript'>");
			out.println("alert('회원이 되신걸 축하드립니다. 이제 로그인을 해주세요!');");
			out.println("location.href='main.jsp#about';");
			out.println("</script>");
			out.close();			
		}
	}
}