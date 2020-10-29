package com.pet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLoginProcess
 */
@WebServlet("/AdminLoginProcess")
public class AdminLoginProcess extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String A_Name=request.getParameter("aname");
		String A_pass=request.getParameter("psw");
		System.out.println(A_Name);
		System.out.println(A_pass);
		if(A_Name.equals("Harsh") && A_pass.equals("Harsh@2811"))
		{
			response.sendRedirect("DashBoard.jsp");
			HttpSession session=request.getSession();
	         session.setAttribute("AdminName",A_Name);
		}
		else
		{
			request.setAttribute("errorMessage", "Invalid user or password or Make Sure You have Registred");
            RequestDispatcher rd = request.getRequestDispatcher("AdminLogin.jsp");
            rd.forward(request, response); 
		}
	}

}
