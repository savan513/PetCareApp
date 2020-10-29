package com.pet;
 
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
@WebServlet("/ChangeImage")
@MultipartConfig()
public class ChangeImage extends HttpServlet{
 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String UID="";
		HttpSession session=req.getSession();
		UID=(String)session.getAttribute("UserId");
		String connectionURL = "jdbc:mysql://localhost:3306/db1";
		String user = "root";
		String pass = "";
 
		int result = 0;
		Connection con = null;
		Part part = req.getPart("image");
 
		if(part != null){
			try{
				 Class.forName("com.mysql.jdbc.Driver");  
			    con = DriverManager.getConnection(connectionURL, user, pass);
			    System.out.print("Here");
			    PreparedStatement ps = con.prepareStatement("update ownerreg set image=? where UID=?");
			    InputStream is = part.getInputStream();
			    ps.setBlob(1, is);
			    ps.setString(2, UID);
			    
			    result = ps.executeUpdate();
			    resp.sendRedirect("Profile.jsp");
			}
			catch(Exception e){
				e.printStackTrace();
				System.out.print(e);
			}	
			finally{
				if(con != null){
					try{
						con.close();
					}
					catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
		
		
	}
}