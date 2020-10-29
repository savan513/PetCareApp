package com.pet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class EditProfile
 */
@WebServlet("/EditProfile")
public class EditProfile extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Uid="",Name="",email="",password="",mobile_no="",image="";
		 try{  
			 HttpSession session=request.getSession();
				
				Uid=(String)session.getAttribute("UserId");
				Name=request.getParameter("Name");
				System.out.println(Name);
				System.out.println(Uid);
				email=request.getParameter("email");
				password=request.getParameter("Pass");
				mobile_no=request.getParameter("Mb");
				image=request.getParameter("image");
				
		        String City=request.getParameter("City");
		        String State=request.getParameter("State");
		        String Country=request.getParameter("Country");
			    Class.forName("com.mysql.jdbc.Driver");  
			
				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
				//Statement stmt=con.createStatement();  
				PreparedStatement stmt=con.prepareStatement("UPDATE ownerreg SET  Name = ?, email = ?, password = ?,Mobile_No = ?,City=? ,State=?,Country=? WHERE UID = ?");  
				stmt.setString(1, Name);
				stmt.setString(2, email);
				stmt.setString(3, password);
				stmt.setString(4,mobile_no);
				stmt.setString(5,City);
				stmt.setString(6,State);
				stmt.setString(7,Country);
				stmt.setString(8,Uid);
				stmt.executeUpdate();
				PrintWriter out=response.getWriter();
				
				System.out.println("Success");
				response.sendRedirect("Profile.jsp");
				
		 }catch(Exception e){ System.out.println(e);}  
		
	}

}
