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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddPetDetail
 */
@WebServlet("/AddPetDetail")
public class AddPetDetail extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
	
		String id =(String)session.getAttribute("UserId");
		String Name=request.getParameter("P_name");
		String Age=request.getParameter("P_age");
		int Ag=Integer.parseInt(Age);
		String Type=request.getParameter("P_type");
		String dipt=request.getParameter("Other");
		int U_id=Integer.parseInt(id);
		
		String Add=request.getParameter("Add");
		String Edit=request.getParameter("Edit");
		RequestDispatcher rs = request.getRequestDispatcher("PetImageChange");
		rs.include(request,response);
		if(Add!=null)
		{
			try{  
				//	System.out.println("HELLL");
				    Class.forName("com.mysql.jdbc.Driver");  
					//System.out.println("Hello");
					Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
					//Statement stmt=con.createStatement();  
					PreparedStatement stmt=con.prepareStatement("insert into petdetails(UID,P_Name,P_Age,P_Type,Other_Dip,image)values(?,?,?,?,?,?)");  
					
					stmt.setInt(1,U_id);
					stmt.setString(2, Name);
					stmt.setInt(3, Ag);
					stmt.setString(4,Type);
					stmt.setString(5, dipt);
					stmt.setString(6, "ImageInsert.jpg");
					response.sendRedirect("AddPet.jsp");
					int i=stmt.executeUpdate();  
					System.out.println(i+" records inserted");  
					con.close();
						

				   
					}catch(Exception e){ System.out.println(e);} 
		}
		if(Edit!=null)
		{
			String pud=request.getParameter("id");
			int pid=Integer.parseInt(pud);
			try{  
				//	System.out.println("HELLL");
				    Class.forName("com.mysql.jdbc.Driver");  
					//System.out.println("Hello");
					Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
					//Statement stmt=con.createStatement();  
					PreparedStatement stmt=con.prepareStatement("update petdetails set UID=?,P_Name=?,P_Age=?,P_Type=?,Other_Dip=? where Id=?");  
					
					stmt.setInt(1,U_id);
					stmt.setString(2, Name);
					stmt.setInt(3, Ag);
					stmt.setString(4,Type);
					stmt.setString(5, dipt);
				
					stmt.setInt(6, pid);
					response.sendRedirect("AddPet.jsp");
					int i=stmt.executeUpdate();  
					System.out.println(i+" records Updated");  
					con.close();
						

				   
					}catch(Exception e){ System.out.println(e);} 		
				
		}
		}
		/*else {
			
			
		}
		*/
		
	}


