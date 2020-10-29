package com.pet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ActionOnReq
 */
@WebServlet("/ActionOnReq")
public class ActionOnReq extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String Id=request.getParameter("Id");
		String action=request.getParameter("Action");
		
		if(action.equals("Accept"))
		{
			try{  
				//	System.out.println("HELLL");
				    Class.forName("com.mysql.jdbc.Driver");  
					//System.out.println("Hello");
					Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
					//Statement stmt=con.createStatement();  
					PreparedStatement stmt=con.prepareStatement("update appointment set Status = 1 where Id = ?");  
					//InputStream is = part.getInputStream();
					stmt.setInt(1, Integer.parseInt(Id));
					int i=stmt.executeUpdate();
					if(i>0)
					{
						response.sendRedirect("ReceptionistPage.jsp");
					}
					else
					{
						response.getWriter().print("<h1>Something Went Wrong</h1>");
					}
					  
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
		if(action.equals("Cancel"))
		{
			try{  
				//	System.out.println("HELLL");
				    Class.forName("com.mysql.jdbc.Driver");  
					//System.out.println("Hello");
					Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
					//Statement stmt=con.createStatement();  
					PreparedStatement stmt=con.prepareStatement("update appointment set Status = 3 where Id = ?");  
					//InputStream is = part.getInputStream();
					stmt.setInt(1, Integer.parseInt(Id));
					int i=stmt.executeUpdate();
					if(i>0)
					{
						response.sendRedirect("ReceptionistPage.jsp");
					}
					else
					{
						response.getWriter().print("<h1>Something Went Wrong</h1>");
					}
					  
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
		if(action.equals("DAccept"))
		{
			try{  
				//	System.out.println("HELLL");
				    Class.forName("com.mysql.jdbc.Driver");  
					//System.out.println("Hello");
					Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
					//Statement stmt=con.createStatement();  
					PreparedStatement stmt=con.prepareStatement("update appointment set Status = 2 where Id = ?");  
					//InputStream is = part.getInputStream();
					stmt.setInt(1, Integer.parseInt(Id));
					int i=stmt.executeUpdate();
					if(i>0)
					{
						response.sendRedirect("DoctorPanel.jsp");
					}
					else
					{
						response.getWriter().print("<h1>Something Went Wrong</h1>");
					}
					  
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
		if(action.equals("DCancel"))
		{
			try{  
				//	System.out.println("HELLL");
				    Class.forName("com.mysql.jdbc.Driver");  
					//System.out.println("Hello");
					Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
					//Statement stmt=con.createStatement();  
					PreparedStatement stmt=con.prepareStatement("update appointment set Status = 3 where Id = ?");  
					//InputStream is = part.getInputStream();
					stmt.setInt(1, Integer.parseInt(Id));
					int i=stmt.executeUpdate();
					if(i>0)
					{
						response.sendRedirect("DoctorPanel.jsp");
					}
					else
					{
						response.getWriter().print("<h1>Something Went Wrong</h1>");
					}
					  
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
	}


}
