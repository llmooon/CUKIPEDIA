import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/MakeBoard")
public class MakeBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MakeBoard() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();

		HttpSession ch = request.getSession();
		if (ch.getAttribute("ID") == null) {
			session.invalidate();
			out.println("<script language='javascript'>");
			out.println("location.href='needlogin.jsp';");
			out.println("</script>");
			out.close();
		}
		
		request.setCharacterEncoding("utf-8");
		String check = request.getParameter("subject")==null?"error":request.getParameter("subject");
		String num = new String(check.getBytes("8859_1"), "UTF-8");
		BoardInfo info = new BoardInfo();
		int seqsize;
		int numbering;
		int lsize;

		int cnt = 0;
		try {
			Connection con = null;
			con = DriverManager.getConnection(
);
			java.sql.Statement st = null;
			java.sql.Statement st2 = null;
			java.sql.Statement st3 = null;
			st = con.createStatement();
			st2 = con.createStatement();
			st3 = con.createStatement();

			ResultSet rs = st.executeQuery("select * from board where gr = " + num + " order by seq;");
			ResultSet rs2 = st2.executeQuery("select subject from class where num like " + num);
			ResultSet rs3 = st3.executeQuery("select pro from class where num like " + num);

			rs2.next();
			rs3.next();
			String subject = rs2.getString("subject");
			String pro = rs3.getString("pro");
			if (!rs.next()) {

				session.setAttribute("gr", (num));
				session.setAttribute("seqsize", "0");
				session.setAttribute("l", "0");

				request.setAttribute("subject", subject);
				request.setAttribute("pro", pro);
				request.setAttribute("BOARD_INFO", info);

				RequestDispatcher dispatcher = request.getRequestDispatcher("board.jsp");
				dispatcher.forward(request, response); // 나중에 할것 - :에 대한 결과가
														// 없읍니다. 창 만들기
			} else {

				while (true) {

					info.setgr(rs.getInt("gr"));
					numbering = rs.getInt("gr");
					info.setseq(rs.getInt("seq"));
					seqsize = rs.getInt("seq");
					info.setlevel(rs.getInt("level"));
					lsize = rs.getInt("level");
					info.setcon(rs.getString("con"));
					cnt++;
					if (!rs.next())
						break;
				}

				String s = Integer.toString(seqsize + 1);
				String l = Integer.toString(lsize + 1);
				String a = Integer.toString(numbering);

				request.setAttribute("subject", subject);
				request.setAttribute("pro", pro);
				request.setAttribute("BOARD_INFO", info);
				request.setAttribute("seqsize", seqsize);

				session.setAttribute("gr", a);
				session.setAttribute("seqsize", s);
				session.setAttribute("l", l);

				RequestDispatcher dispatcher = request.getRequestDispatcher("board.jsp");
				dispatcher.forward(request, response);
			}

		} catch (SQLException sqex) {
			System.out.println("getMessage : " + sqex.getMessage());
			System.out.println("getSQLState : " + sqex.getSQLState());
		}

		request.setAttribute("BOARD_INFO", info);
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
