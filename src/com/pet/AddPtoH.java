package com.pet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddPtoH
 */
@WebServlet("/AddPtoH")
public class AddPtoH extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPtoH() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String hid=(String)session.getAttribute("RepId");
		String name=request.getParameter("P_Name");
		String pet=request.getParameter("Pet_Name");
		String add=request.getParameter("address");
		String email=request.getParameter("email");
		String Mb=request.getParameter("Mb");
		String dname=request.getParameter("D_Name");
		String gender="";
        String Gd=request.getParameter("Gender");
        if(Gd=="male")
        {
        	gender="Male";
        }
        else
        {gender="FeMale";}
		try {
			
			Class.forName("com.mysql.jdbc.Driver");  
			//System.out.println("Hello");
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			//Statement stmt=con.createStatement();  
			PreparedStatement stmt=con.prepareStatement("insert into patient (H_Id,Name,Pet_Type,Gender,Address,Mobile_No,Email,Doctor_Name) values(?,?,?,?,?,?,?,?)");  
			//InputStream is = part.getInputStream();
			stmt.setString(1,hid);//1 specifies the first parameter in the query
			stmt.setString(2, name);
			stmt.setString(3, pet);
			stmt.setString(4, gender);
			stmt.setString(5, add);
			stmt.setString(6, Mb);
			stmt.setString(7, email);
			stmt.setString(8, dname);
			
			stmt.executeUpdate();
			PrintWriter out=response.getWriter();
			
			System.out.println("Success");
			response.sendRedirect("ReceptionistPage.jsp");
		}catch(Exception e) {System.out.println(e);}
	}

}
