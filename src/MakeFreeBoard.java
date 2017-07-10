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

/**
 * Servlet implementation class MakeBoard
 */
@WebServlet("/MakeFreeBoard")
public class MakeFreeBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MakeFreeBoard() {
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

		HttpSession session = request.getSession();

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
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
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from free order by seq;");

			if (!rs.next()) {

				session.setAttribute("seqsize", "0");
				session.setAttribute("l", "0");

				request.setAttribute("BOARD_INFO", info);
				RequestDispatcher dispatcher = request.getRequestDispatcher("freeboard.jsp");
				dispatcher.forward(request, response); // 나중에 할것 - :에 대한 결과가
														// 없읍니다. 창 만들기
			} else {

				while (true) {

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

				request.setAttribute("BOARD_INFO", info);
				session.setAttribute("seqsize", s);
				session.setAttribute("l", l);

				RequestDispatcher dispatcher = request.getRequestDispatcher("freeboard.jsp");
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
