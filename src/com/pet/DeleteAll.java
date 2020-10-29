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
 * Servlet implementation class DeleteAll
 */
@WebServlet("/DeleteAll")
public class DeleteAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String Id=request.getParameter("Id");
		String action=request.getParameter("Action");
		
		if(action.equals("Owner"))
		{
			try{  
				//	System.out.println("HELLL");
				    Class.forName("com.mysql.jdbc.Driver");  
					//System.out.println("Hello");
					Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
					//Statement stmt=con.createStatement();  
					PreparedStatement stmt=con.prepareStatement("delete from ownerreg where Id = ?");  
					//InputStream is = part.getInputStream();
					stmt.setInt(1, Integer.parseInt(Id));
					int i=stmt.executeUpdate();
					if(i>0)
					{
						response.sendRedirect("DashBoard.jsp");
					}
					else
					{
						response.getWriter().print("<h1>Something Went Wrong</h1>");
					}
					  
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
		if(action.equals("Doctor"))
		{
			try{  
				//	System.out.println("HELLL");
				Class.forName("com.mysql.jdbc.Driver");  
				//System.out.println("Hello");
				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
				//Statement stmt=con.createStatement();  
				PreparedStatement stmt=con.prepareStatement("delete from doctor where Id = ?");  
				//InputStream is = part.getInputStream();
				stmt.setInt(1, Integer.parseInt(Id));
				int i=stmt.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("DashBoard.jsp");
				}
				else
				{
					response.getWriter().print("<h1>Something Went Wrong</h1>");
				}
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
		if(action.equals("Tip"))
		{
			try{  
				//	System.out.println("HELLL");
				Class.forName("com.mysql.jdbc.Driver");  
				//System.out.println("Hello");
				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
				//Statement stmt=con.createStatement();  
				PreparedStatement stmt=con.prepareStatement("delete from tips where Number = ?");  
				//InputStream is = part.getInputStream();
				stmt.setInt(1, Integer.parseInt(Id));
				int i=stmt.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("DashBoard.jsp");
				}
				else
				{
					response.getWriter().print("<h1>Something Went Wrong</h1>");
				}
					  
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
		if(action.equals("Hospital"))
		{
			try{  
				//	System.out.println("HELLL");
				Class.forName("com.mysql.jdbc.Driver");  
				//System.out.println("Hello");
				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
				//Statement stmt=con.createStatement();  
				PreparedStatement stmt=con.prepareStatement("delete from hospital where Id = ?");  
				//InputStream is = part.getInputStream();
				stmt.setInt(1, Integer.parseInt(Id));
				int i=stmt.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("DashBoard.jsp");
				}
				else
				{
					response.getWriter().print("<h1>Something Went Wrong</h1>");
				}
					  
				  	
					
			}catch(Exception e) {System.out.println(e);}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
