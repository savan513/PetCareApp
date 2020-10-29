
package com.pet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.*;
import javax.crypto.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;
import java.util.Properties;  

import javax.mail.*;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
/**
 * Servlet implementation class Register
 */
@WebServlet("/register")

@MultipartConfig(maxFileSize = 16177216)
public class Register extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//Part part = request.getPart("image");
		String email=request.getParameter("email");
       
        String password=request.getParameter("pass");
        String Name=request.getParameter("first_name");
        String Mobile=request.getParameter("mb");
        String Image=request.getParameter("image");
        String City=request.getParameter("City");
        String State=request.getParameter("State");
        String Country=request.getParameter("Country");
        String encrypted="";
        String gender="";
        String Gd=request.getParameter("Gender");
        if(Gd=="male")
        {
        	gender="Male";
        }
        else
        {gender="FeMale";}
     /*   try
        {
        	SecretKey key = KeyGenerator.getInstance("DES").generateKey();
        	 EncryptDecrypt encrypter = new EncryptDecrypt(key);

				//Pass variable I should get from the form with the request.getParameter("Pass");
				String Pass = password; //Just to make it work

				// Encrypt
				encrypted = encrypter.encrypt(Pass);

				// Decrypt
				String decrypted = encrypter.decrypt(encrypted);

				// Output

				System.out.println("Encrypted: "+encrypted);
				System.out.println("Decrypted: "+decrypted);
        }catch(Exception e) {}
       */ try{  
		//	System.out.println("HELLL");
		    Class.forName("com.mysql.jdbc.Driver");  
			//System.out.println("Hello");
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			//Statement stmt=con.createStatement();  
			PreparedStatement stmt=con.prepareStatement("insert into ownerreg(Name,email,password,Gender,Mobile_No,City,State,Country,image)values(?,?,?,?,?,?,?,?,?)");  
			//InputStream is = part.getInputStream();
			stmt.setString(1,Name);//1 specifies the first parameter in the query  
			stmt.setString(2,email);  
			stmt.setString(3,password); 
			stmt.setString(4, gender);
			stmt.setString(5,Mobile);
			stmt.setString(6,City);
			stmt.setString(7,State);
			stmt.setString(8,Country);
			stmt.setString(9, "editclip.jpg");
			
			  
		  	
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

