import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.File;
import java.util.ArrayList;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/AddLostItemServlet")
public class AddLostItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddLostItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		HttpSession session=request.getSession();
		HttpSession ch = request.getSession();
		if (ch.getAttribute("ID") == null) {
			session.invalidate();
			out.println("<script language='javascript'>");
			out.println("location.href='needlogin.jsp';");
			out.println("</script>");
			out.close();
		}
		
		String itemname = "1";
		String lostplace = "1";
		String lostname = "1";
		String phone = "1";
		String lostdate = "1";
		String lostimg = "1";
		String id = ch.getAttribute("ID").toString();

		ServletContext context = this.getServletContext();
		String path="C:/Users/FAN-TEST/workspace/Fashion/WebContent/";
		String dirName = path + File.separator + "upload";
		File dir = new File(dirName);
		
		if (!dir.exists()) {
			dir.mkdir();
		}
		
		DiskFileItemFactory dfif = new DiskFileItemFactory();
		dfif.setSizeThreshold(10 * 1024);
		dfif.setRepository(dir);
		ServletFileUpload upload = new ServletFileUpload(dfif);
		upload.setFileSizeMax(1000 * 1000 * 1024);
		upload.setHeaderEncoding("UTF-8");
		
		try {
			ArrayList items = (ArrayList) upload.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem item = (FileItem) items.get(i);
				if (item.getFieldName().equals("lostimg")) {
					File file = new File(dir, item.getName());
					item.write(file);
					lostimg = item.getName();
					System.out.println("file saved in " + dir.getPath());
				} else if (item.getFieldName().equals("itemname")) {
					itemname = new String(item.getString().getBytes("8859_1"), "UTF-8");
				} else if (item.getFieldName().equals("lostplace")) {
					lostplace = new String(item.getString().getBytes("8859_1"), "UTF-8");
				} else if (item.getFieldName().equals("lostname")) {
					lostname = new String(item.getString().getBytes("8859_1"), "UTF-8");
				} else if (item.getFieldName().equals("phone")) {
					phone = new String(item.getString().getBytes("8859_1"), "UTF-8");
				} else if (item.getFieldName().equals("lostdate")) {
					lostdate = new String(item.getString().getBytes("8859_1"), "UTF-8");
				}
			}
		} catch (Exception ex) {
			System.out.println("Error: " + ex.getLocalizedMessage());
		}
		

		try {
			Connection con = null;
			con = DriverManager.getConnection(
					);
			java.sql.Statement st = null;
			st = con.createStatement();
			st.executeUpdate("insert into lostitem(itemname,lostplace,lostname,lostdate,lostimg,phone,id) value ('" + itemname + "','" + lostplace + "','" + lostname + "','"
					+ lostdate + "','" + lostimg + "','" + phone + "','" + id +"')");
		} catch (SQLException sqex) {
			System.out.println("error: " + sqex.getMessage());
			System.out.println("error: " + sqex.getSQLState());
		}
		response.setContentType("text/html;charset=utf-8");
		response.sendRedirect("ReadLostItem");
	}
}
