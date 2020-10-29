package com.pet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeletePet
 */
@WebServlet("/DeletePet")
public class DeletePet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String id=request.getParameter("id");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			//Statement stmt=con.createStatement();  
			PreparedStatement stmt=con.prepareStatement("delete from petdetails where id=?");  
			
			stmt.setString(1,id);  
			int rs=stmt.executeUpdate();
			
		     response.sendRedirect("Profile.jsp");
		
		}catch(Exception e) 
		{
			System.out.println(e);
			out.println("<b>Called "+id+"</b>");
		}
	}

}
