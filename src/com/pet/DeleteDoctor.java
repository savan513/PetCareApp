package com.pet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteDoctor
 */
@WebServlet("/DeleteDoctor")
public class DeleteDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String id=request.getParameter("id");
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			//Statement stmt=con.createStatement();  
			PreparedStatement stmt=con.prepareStatement("delete from hospital_doctor where D_Id=?");  
			
			stmt.setString(1,id);  
			int rs=stmt.executeUpdate();
			
		     response.sendRedirect("ReceptionistPage.jsp");
		
		}catch(Exception e) 
		{
			System.out.println(e);
			
		}
	}

}
