
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CourListServlet")
public class CourListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CourListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = new PrintWriter(response.getWriter());
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO");
		out.println(strUpperSeqNo);

		int upperSeqNo;
		if (strUpperSeqNo == null)
			upperSeqNo = Integer.MAX_VALUE;
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo);
		CourListbean list = readDB(upperSeqNo);
		request.setAttribute("LEC", list);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/lecture.jsp");
		dispatcher.forward(request, response);
	}

	private CourListbean readDB(int upperSeqNo) throws ServletException {
		CourListbean list = new CourListbean();
		Connection conn = null;
		Statement stmt = null;

		int cnt = 0;

		try {
			conn = DriverManager.getConnection();
			if (conn == null)
				throw new Exception("데이터베이스에서 불러올 수 없습니다.");
			stmt = conn.createStatement();

			ResultSet rs = stmt.executeQuery("select * from class2 order by up ASC;");

			while (true) {
				if (!rs.next())
					break;
				list.setSubject(cnt, rs.getString("subject"));
				list.setPro(cnt, rs.getString("pro"));
				list.setNum(cnt, rs.getInt("num"));
				list.setUp(cnt, rs.getInt("up"));
				list.setDown(cnt, rs.getInt("down"));
				list.setSeqno(cnt, rs.getInt("seqno"));
			}
			if (!rs.next()) {
				list.setlastpage(true);
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
		return list;
	}

}
