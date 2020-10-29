package com.pet;

import java.sql.*;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddDtoH
 */
@WebServlet("/AddDtoH")
public class AddDtoH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDtoH() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String hid=(String)session.getAttribute("RepId");
		String name=request.getParameter("D_Name");
		String exp=request.getParameter("exp");
		String YOE=request.getParameter("YOE");
		String sch=request.getParameter("Schedule");
		String add=request.getParameter("address");
		String email=request.getParameter("email");
		String Mb=request.getParameter("Mb");
		try {
			
			Class.forName("com.mysql.jdbc.Driver");  
			//System.out.println("Hello");
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			//Statement stmt=con.createStatement();  
			PreparedStatement stmt=con.prepareStatement("insert into hospital_doctor (H_Id,Name,Expertise,YOE,Address,Schedule,Email,Mobile_No) values(?,?,?,?,?,?,?,?)");  
			//InputStream is = part.getInputStream();
			stmt.setString(1,hid);//1 specifies the first parameter in the query
			stmt.setString(2, name);
			stmt.setString(3, exp);
			stmt.setString(4,YOE);  
			stmt.setString(5,add);  
			stmt.setString(6,sch);
			stmt.setString(7,email);
			stmt.setString(8,Mb);
			
			stmt.executeUpdate();
			PrintWriter out=response.getWriter();
			
			System.out.println("Success");
			response.sendRedirect("ReceptionistPage.jsp");
		}catch(Exception e) {System.out.println(e);}
	}

}
