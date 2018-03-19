
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class CourShowServlet
 */
@WebServlet("/CourShowServlet")
public class CourShowServlet extends HttpServlet {
	String name = null;
	String pro = null;
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CourShowServlet() {
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
		String s = request.getParameter("num");

		int upperSeqNo;
		if (strUpperSeqNo == null)
			upperSeqNo = 100;
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo);
		CourListbean list = readDB(upperSeqNo, s);
		EstListbean estList = readEst(upperSeqNo, s);

		request.setAttribute("LEC", list);
		request.setAttribute("Name", name);
		request.setAttribute("Pro", pro);
		request.setAttribute("num", s);
		request.setAttribute("EST", estList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/lecture1.jsp");
		dispatcher.forward(request, response);

	}

	private CourListbean readDB(int upperSeqNo, String num) throws ServletException {
		CourListbean list = new CourListbean();
		Connection conn = null;
		Statement stmt = null;
		Statement s1 = null;
		Statement s2 = null;

		int cnt = 0;

		try {
			conn = DriverManager.getConnection(
);
			if (conn == null)
				throw new Exception("데이터베이스에서 불러올 수 없습니다.");
			stmt = conn.createStatement();

			s1 = conn.createStatement();
			s2 = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from est_board where num=" + num + ";");
			ResultSet rs2 = s1.executeQuery("select * from class2 where num=" + num + ";");
			ResultSet rs3 = s2.executeQuery("select * from class2 ;");

			rs2.next();
			name = rs2.getString("subject");
			pro = rs2.getString("pro");

			while (true) {
				if (!rs3.next())
					break;
				list.setSubject(cnt, rs3.getString("subject"));
				list.setPro(cnt, rs3.getString("pro"));
				list.setNum(cnt, rs3.getInt("num"));
				list.setUp(cnt, rs3.getInt("up"));
				list.setDown(cnt, rs3.getInt("down"));
				list.setSeqno(cnt, rs3.getInt("seqno"));
				cnt++;
			}
			cnt = 0;
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

	private EstListbean readEst(int upperSeqNo, String num) throws ServletException {
		EstListbean estList = new EstListbean();
		Connection conn = null;
		Statement stmt = null;
		int cnt = 0;
		try {
			conn = DriverManager.getConnection(
					);
			if (conn == null)
				throw new Exception("데이터베이스에서 불러올 수 없습니다.");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from est_board where num=" + Integer.parseInt(num) + ";");
			while (rs.next()) {
				estList.setEst(cnt, rs.getString("contents"));
				cnt++;
			}
			
			estList.setSize(cnt);
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
		return estList;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
