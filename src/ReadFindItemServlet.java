import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;

public class ReadFindItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
	
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO");
		int upperSeqNo;
		if (strUpperSeqNo == null)
			upperSeqNo = Integer.MAX_VALUE;
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo);
		ReadFindItem list = readDB(upperSeqNo);
		request.setAttribute("FIND_LIST", list);
		if (strUpperSeqNo == null)
			list.setstartpage(true);
		else
			list.setstartpage(false);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Find.jsp");
		dispatcher.forward(request, response);
	}

	private ReadFindItem readDB(int upperSeqNo) throws ServletException {
		ReadFindItem list = new ReadFindItem();
		Connection conn = null;
		Statement stmt = null;
		try {
			conn = DriverManager.getConnection(
);
			if (conn == null)
				throw new Exception("");
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from finditem where seqno < " + upperSeqNo + " order by seqno desc;");
			
			for (int cnt = 0; cnt < 5; cnt++) {
				if (!rs.next())
					break;
				list.setseqno(cnt, rs.getInt("seqno"));
				list.setitemname(cnt, rs.getString("itemname"));
				list.setfindplace(cnt, rs.getString("findplace"));
				list.setstorage(cnt, rs.getString("storage"));
				list.setlostname(cnt, rs.getString("lostname"));
				list.setfinddate(cnt, rs.getString("finddate"));
				list.setfindname(cnt, rs.getString("findname"));
				list.setphone(cnt, rs.getString("phone"));
				list.setfindimg(cnt, "./upload/"+rs.getString("findimg"));
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