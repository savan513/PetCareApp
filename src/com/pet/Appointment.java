package com.pet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Appointment
 */
@WebServlet("/Appointment")
public class Appointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Appointment() {
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
	
		String Name="",Email="",Type="",Date="",Time="",pettype;
		int Did,Hid;
		Did=Integer.parseInt(request.getParameter("Did"));
		Cookie c[]=request.getCookies();
		String  H=null;
		for(int i=1;i<c.length;i++)
		{
			Cookie co=c[i];
			H= co.getValue();
			
		}
		Hid=Integer.parseInt(H);
		PrintWriter out=response.getWriter();
		out.print(Did);
		out.print(Hid);
		Name=request.getParameter("name");
		Email=request.getParameter("email");
		pettype=request.getParameter("Pt");
		Date=request.getParameter("date");
		Time=request.getParameter("time");
		String HName=request.getParameter("Hname");
		String DName=request.getParameter("Dname");
		Type=request.getParameter("appointmentfor");
		String Mobile=request.getParameter("Mb");
		HttpSession session=request.getSession(false);
		String Oid=(String)session.getAttribute("UserId");
		int o_id=Integer.parseInt(Oid);
		try{  
			//	System.out.println("HELLL");
			    Class.forName("com.mysql.jdbc.Driver");  
				//System.out.println("Hello");
				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
				//Statement stmt=con.createStatement();  
				PreparedStatement stmt=con.prepareStatement("insert into Appointment(H_id,D_Id,Name,Email,Pet_Type,Date,Time,Reason,HName,DName,Mobile_No,o_id,Status)values(?,?,?,?,?,?,?,?,?,?,?,?,?)");  
				//InputStream is = part.getInputStream();
				stmt.setInt(1,Hid);
				stmt.setInt(2, Did);
				stmt.setString(3,Name);//1 specifies the first parameter in the query  
				stmt.setString(4,Email);
				stmt.setString(5,pettype);
				stmt.setString(6, Date);
				stmt.setString(7, Time);
				stmt.setString(8, Type);
				stmt.setString(9, HName);
				stmt.setString(10,DName);
				stmt.setString(11, Mobile);
				stmt.setInt(12,o_id);
				stmt.setString(13, "0");
				int i=stmt.executeUpdate();
				if(i>0)
				{
					request.setAttribute("Message", "SuccessFully Submitted");
	                RequestDispatcher rd = request.getRequestDispatcher("/TakeAppointment.jsp?Id="+Hid);
	                rd.forward(request, response); 
				}
				else
				{
					out.print("<h1>Something Went Wrong</h1>");
				}
				  
			  	
				
		}catch(Exception e) {System.out.println(e);}
	}

}
