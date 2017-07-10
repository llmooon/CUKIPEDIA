import javax.servlet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.charset.CharsetEncoder;

import org.apache.jasper.tagplugins.jstl.core.Out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/SearchClass")
public class SearchClass extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
  
    public SearchClass() {
        super();
    }
    

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
	 	   
     response.setContentType("text/html;charset=utf-8");
     
      searchInfo info = new searchInfo();
      
      String subject = new String(request.getParameter("search_lecture").getBytes("8859_1"), "UTF-8");
      if(subject.equals("")||subject.equals("%")||subject.equals("\'")||subject.equals("\"")||subject.equals("_")) response.sendRedirect("NoSearch.jsp");
      else{
      int cnt = 0;
      try {
         Connection con = null;
         con = DriverManager.getConnection(
);
         java.sql.Statement st = null;
         st = con.createStatement();
        
         ResultSet rs= st.executeQuery("select * from class where subject like '%"+subject+"%'");
       
         if (!rs.next())
            response.sendRedirect("NoSearch.jsp"); //나중에 할것 - :에 대한 결과가 없읍니다. 창 만들기
         else {
            while(true){
               info.setsubject(cnt, rs.getString("subject"));
               info.setpro(cnt, rs.getString("pro"));
               info.setgro(cnt,rs.getInt("num"));
               cnt++;
               if(!rs.next())
                  break;
            }
            request.setAttribute("subject",subject);
            request.setAttribute("SEARCH_INFO", info);
            RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
            dispatcher.forward(request, response); 
         }
      } catch (SQLException sqex) {
         System.out.println("getMessage : " + sqex.getMessage());
         System.out.println("getSQLState : " + sqex.getSQLState());
      }
      
      request.setAttribute("search_info", info);
   }}
}