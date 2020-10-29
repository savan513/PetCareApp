package com.pet;

import java.io.IOException;
import java.security.*;
import javax.crypto.*;
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
 * Servlet implementation class LoginDemo
 */
@WebServlet("/Login")
public class LoginDemo extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out=response.getWriter();
	        
	       
	        
	        String encrypted="";
	       /* try
	        {
	        	SecretKey key = KeyGenerator.getInstance("DES").generateKey();
	        	 EncryptDecrypt encrypter = new EncryptDecrypt(key);

					//Pass variable I should get from the form with the request.getParameter("Pass");
					String Pass = pass; //Just to make it work

					// Encrypt
					//encrypted = encrypter.encrypt(Pass);

					// Decrypt
					//String decrypted = encrypter.decrypt(encrypted);

					// Output

					//System.out.println("Encrypted: "+encrypted);
					//System.out.println("Decrypted: "+decrypted);
	        }catch(Exception e) {}*/
	        String Name=""; 
	        String type=request.getParameter("LoginType");
	        System.out.println("Helo");
	        if(type.equals("Owner"))
	        {
	        	 try{  
	        		 String Uname=request.getParameter("email");
	     	        String pass=request.getParameter("pass");
	 			    Class.forName("com.mysql.jdbc.Driver");  
	 			
	 				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
	 				//Statement stmt=con.createStatement();  
	 				PreparedStatement stmt=con.prepareStatement("select * from ownerreg where email=? and Password=?");  
	 				
	 				stmt.setString(1,Uname);  
	 				stmt.setString(2,pass);  
	 				 
	 				ResultSet rs=stmt.executeQuery();
	 				if(rs.next())
	 				{	    
	 					String Uid = rs.getString(1);
	 					Name=rs.getString(2);
	 					HttpSession session=request.getSession();
	 			          session.setAttribute("UserName",Name);
	 			          session.setAttribute("UserId",Uid);
	 			     //     System.out.println("User id "+Uid);
	 			          session.setAttribute("Id", session.getId());
	 			          response.sendRedirect("Home.jsp");
	 			          
	 				}
	 				 else
	 			        {
	 			           	request.setAttribute("errorMessage", "Invalid user or password or Make Sure You have Registred");
	 		                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
	 		                rd.forward(request, response); 
	 			        }
	 				}catch(Exception e){ System.out.println(e);}  
	        }
	        else if(type.equals("Doctor"))
	        {
	        	 try{  
	        		 System.out.println("DOctort");
		 				
		 			    Class.forName("com.mysql.jdbc.Driver");  
		 			   String Uname=request.getParameter("email");
		 		        String pass=request.getParameter("pass");
		 				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
		 				//Statement stmt=con.createStatement();  
		 				PreparedStatement stmt=con.prepareStatement("select * from doctor where email=? and password=?");  
		 				
		 				stmt.setString(1,Uname);  
		 				stmt.setString(2,pass);  
		 				 
		 				ResultSet rs=stmt.executeQuery();
		 				if(rs.next())
		 				{	    
		 					String Uid = rs.getString(1);
		 					Name=rs.getString(2);
		 					HttpSession session=request.getSession();
		 			          
		 			          session.setAttribute("DoctorId",Uid);
		 			     //     System.out.println("User id "+Uid);
		 			          response.sendRedirect("DoctorPanel.jsp");
		 				}
		 				 else
		 			        {
		 			           	request.setAttribute("errorMessage", "Invalid user or password or Make Sure You have Registred");
		 		                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		 		                rd.forward(request, response); 
		 			        }
		 				}catch(Exception e){ System.out.println(e);}  
	        }
	        else if(type.equals("Receptionist"))
	        {
	        	 try{  
		 				
		 			    Class.forName("com.mysql.jdbc.Driver");  
		 			   String Uname=request.getParameter("email");
		 		        String pass=request.getParameter("pass");
		 				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
		 				//Statement stmt=con.createStatement();  
		 				PreparedStatement stmt=con.prepareStatement("select * from hospital where email=? and Password=?");  
		 				
		 				stmt.setString(1,Uname);  
		 				stmt.setString(2,pass);  
		 				 
		 				ResultSet rs=stmt.executeQuery();
		 				if(rs.next())
		 				{	    
		 					String Uid = rs.getString(1);
		 					Name=rs.getString(2);
		 					HttpSession session=request.getSession();
		 			          
		 			          session.setAttribute("RepId",Uid);
		 			     //     System.out.println("User id "+Uid);
		 			          response.sendRedirect("ReceptionistPage.jsp");
		 				}
		 				 else
		 			        {
		 			           	request.setAttribute("errorMessage", "Invalid user or password or Make Sure You have Registred");
		 		                RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
		 		                rd.forward(request, response); 
		 			        }
		 				}catch(Exception e){ System.out.println(e);}  
	        }
	}

	

}
