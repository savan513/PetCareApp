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
 * Servlet implementation class ForgetPass
 */
@WebServlet("/ForgetPass")
public class ForgetPass extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String Email=request.getParameter("email");
		HttpSession session=request.getSession();
		session.setAttribute("Email", Email);
		SecurityCodesSend em=new SecurityCodesSend();
		String Code=em.processRequest(request, response);
		session.setAttribute("SecurityCode",Code);
		if(Code=="Fails")
		{
			request.setAttribute("ErrorMessage", "Error in sending email plz try again");
            RequestDispatcher rd = request.getRequestDispatcher("/forget.jsp");
            rd.forward(request, response);
		}
		else
		{
			request.setAttribute("Success", "Security Code Sent");
			
	        
            RequestDispatcher rd = request.getRequestDispatcher("/forget.jsp");
            rd.forward(request, response);
			
		}
		
	}


}
