package com.pet;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class HospitalRegister
 */
@WebServlet("/HospitalRegister")
public class HospitalRegister extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
        String wtd=request.getParameter("Saveit");
        String id=(String)session.getAttribute("RepId");
        if(wtd.equals("Update"))
        {
        	System.out.println("Hello Woerlrd");
        	try{  
        		String email=request.getParameter("email");
     	       
                String password=request.getParameter("Pass");
                String Name=request.getParameter("R_Name");
                String Mobile=request.getParameter("Mb");
              
                String City=request.getParameter("City");
                String State=request.getParameter("State");
                String Country=request.getParameter("Country");
                String Hp_Name=request.getParameter("H_Name");
                String Hp_add=request.getParameter("address");
                String dcpt=request.getParameter("desc");
                String encrypted="";
                
    		    Class.forName("com.mysql.jdbc.Driver");  
    			//System.out.println("Hello");
    			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
    			//Statement stmt=con.createStatement();  
    			PreparedStatement stmt=con.prepareStatement("update hospital set Receptionist_Name=?,Hospital_Name=?,Hospital_Address=?,Email=?,password=?,Mobile_No=?,City=?,State=?,Country=?,Description=? where Id=?");  
    			//InputStream is = part.getInputStream();
    			stmt.setString(1,Name);//1 specifies the first parameter in the query
    			stmt.setString(2, Hp_Name);
    			stmt.setString(3, Hp_add);
    			stmt.setString(4,email);  
    			stmt.setString(5,password);  
    			stmt.setString(6,Mobile);
    			stmt.setString(7,City);
    			stmt.setString(8,State);
    			stmt.setString(9,Country);
    			stmt.setString(10,dcpt);
    			stmt.setString(11,id);
    			stmt.executeUpdate();
				PrintWriter out=response.getWriter();
				
				System.out.println("Success");
				response.sendRedirect("ReceptionistPage.jsp");
    			}catch(Exception e){ System.out.println(e);}  
        }
        else {
       try{  
    	   String email=request.getParameter("email");
	       
           String password=request.getParameter("pass");
           String Name=request.getParameter("first_name");
           String Mobile=request.getParameter("mb");
           String Image=request.getParameter("image");
           String City=request.getParameter("City");
           String State=request.getParameter("State");
           String Country=request.getParameter("Country");
           String Hp_Name=request.getParameter("Hospital_Name");
           String Hp_add=request.getParameter("Hospital_Add");
           String dcpt=request.getParameter("Descritption");
           String encrypted="";
		    Class.forName("com.mysql.jdbc.Driver");  
			//System.out.println("Hello");
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			//Statement stmt=con.createStatement();  
			PreparedStatement stmt=con.prepareStatement("insert into hospital(Receptionist_Name,Hospital_Name,Hospital_Address,Email,password,Mobile_No,City,State,Country,Description,image)values(?,?,?,?,?,?,?,?,?,?,?)");  
			//InputStream is = part.getInputStream();
			stmt.setString(1,Name);//1 specifies the first parameter in the query
			stmt.setString(2, Hp_Name);
			stmt.setString(3, Hp_add);
			stmt.setString(4,email);  
			stmt.setString(5,password);  
			stmt.setString(6,Mobile);
			stmt.setString(7,City);
			stmt.setString(8,State);
			stmt.setString(9,Country);
			stmt.setString(10,dcpt);
			stmt.setString(11, "Hospital.jpg");
			
			  
		  	
			EmailServlet em=new EmailServlet();
			if(em.processRequest(request, response))
					{
				response.sendRedirect("index.jsp");
				int i=stmt.executeUpdate();  
				System.out.println(i+" records inserted");  
				con.close();
					}
			else
			{
				request.setAttribute("ErrorMessage", "Error");
	            RequestDispatcher rd = request.getRequestDispatcher("/Register.jsp");
	            rd.forward(request, response);
			}
		   
			}catch(Exception e){ System.out.println(e);}  
	}
	}
}
