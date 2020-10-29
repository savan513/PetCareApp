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
 * Servlet implementation class DoctorRegister
 */
@WebServlet("/DoctorRegister")
public class DoctorRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoctorRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
	       
        String password=request.getParameter("pass");
        String Name=request.getParameter("first_name");
        String Mobile=request.getParameter("mb");
        String Image=request.getParameter("image");
        String City=request.getParameter("City");
        String State=request.getParameter("State");
        String Country=request.getParameter("Country");
        String expertise=request.getParameter("Expertise");
        String YOE=request.getParameter("YearOfExperience");
        String encrypted="";
        String gender="";
        String Gd=request.getParameter("Gender");
        if(Gd.equals("Male"))
        {
        	gender="Male";
        }
        else if(Gd.equals("Male"))
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
			PreparedStatement stmt=con.prepareStatement("insert into doctor(Name,email,password,Mobile_No,Gender,City,State,Country,Expertise,yearofexp,image)values(?,?,?,?,?,?,?,?,?,?,?)");  
			//InputStream is = part.getInputStream();
			stmt.setString(1,Name);//1 specifies the first parameter in the query  
			stmt.setString(2,email);  
			stmt.setString(3,password);  
			stmt.setString(4,Mobile);
			stmt.setString(5, gender);
			stmt.setString(6,City);
			stmt.setString(7,State);
			stmt.setString(8,Country);
			stmt.setString(9, expertise);
			stmt.setString(10, YOE);
			stmt.setString(11, "editclip.jpg");
			
			  
		  	
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

