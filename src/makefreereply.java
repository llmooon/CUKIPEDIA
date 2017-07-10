

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class makefreereply
 */
@WebServlet("/makefreereply")
public class makefreereply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public makefreereply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		  response.setContentType("text/html;charset=utf-8");
	      PrintWriter out = new PrintWriter(response.getWriter());
	      BoardInfo info = new BoardInfo();
	      //String memo = request.getParameter("question");
	      String tempmemo = new String(request.getParameter("question").getBytes("8859_1"), "UTF-8");
	      String size = new String(request.getParameter("abc").getBytes("8859_1"), "UTF-8");
	      String memo="->RE:"+tempmemo;
	         memo = memo.replaceAll("\\\\","\\\\\\\\");
	         String []filter_word={"\\\"","\\'","\""};
	         String temp = "\\";
	         for(int i = 0; i<filter_word.length;i++){
	        	 memo = memo.replaceAll(filter_word[i],temp.concat(filter_word[i]));

	         }
	      String lsize= (String) session.getAttribute("l");
	      
	      
	      int cnt = 0;
	      try {
	          Connection con = null;
	          con = DriverManager.getConnection(
);
	          java.sql.Statement st = null;
	          st = con.createStatement();
	          
	          st.executeUpdate("insert into free (con, seq, level) values ('" + memo + "',"+ size + ", "+lsize+" )");
	          response.sendRedirect("MakeFreeBoard");
	          }
	        catch (SQLException sqex) {
	          System.out.println("getMessage : " + sqex.getMessage());
	          System.out.println("getSQLState : " + sqex.getSQLState());
	       }
	       
	       request.setAttribute("search_info", info);
	    }
	}


