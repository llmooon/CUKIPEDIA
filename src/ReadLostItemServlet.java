import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class ReadLostItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		response.setContentType("text/html;charset=utf-8");
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO");
		int upperSeqNo;
		if (strUpperSeqNo == null)
			upperSeqNo = Integer.MAX_VALUE;
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo);
		ReadLostItem list = readDB(upperSeqNo);
		request.setAttribute("LOST_LIST", list);
		if (strUpperSeqNo == null)
			list.setstartpage(true);
		else
			list.setstartpage(false);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Lost.jsp");
		dispatcher.forward(request, response);
	}

	private ReadLostItem readDB(int upperSeqNo) throws ServletException {
		ReadLostItem list = new ReadLostItem();
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection(
);
			if (conn == null)
				throw new Exception("");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from lostitem where seqno < " + upperSeqNo + " order by seqno desc;");
			
			for (int cnt = 0; cnt < 5; cnt++) {
				if (!rs.next())
					break;
				list.setseqno(cnt, rs.getInt("seqno"));
				list.setitemname(cnt, rs.getString("itemname"));
				list.setlostplace(cnt, rs.getString("lostplace"));
				list.setlostname(cnt, rs.getString("lostname"));
				list.setlostdate(cnt, rs.getString("lostdate"));
				list.setphone(cnt, rs.getString("phone"));
				list.setlostimg(cnt, "./upload/"+rs.getString("lostimg"));
			}
			if (!rs.next()){
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