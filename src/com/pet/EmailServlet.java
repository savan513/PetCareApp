package com.pet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class EmailServlet
 */
@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
	 protected boolean processRequest(HttpServletRequest request,
	            HttpServletResponse response)
	            throws IOException, ServletException {

	      //  final String err = "/error.jsp";
	        //final String succ = "/success.jsp";

	        String from = "harshpatel281199@gmail.com";
	        String to = request.getParameter("email");
	        String subject = "About Login or Membership in Health Paw";
	        String message = "Welcome Pet lover u have make account in best website for pets owner";
	        String login = "harshpatel281199@gmail.com";
	        String password = "hbnr9854";

	        

	        try {
	            Properties props = new Properties();            
	            
	            props.setProperty("mail.smtp.auth", "true");
	            props.setProperty("mail.smtp.starttls.enable", "true");
	            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	    		props.put("mail.smtp.host", "smtp.gmail.com");

	            props.setProperty("mail.smtp.port", "587");
	            Authenticator auth = new SMTPAuthenticator(login, password);

	            Session session = Session.getInstance(props, auth);

	            MimeMessage msg = new MimeMessage(session);
	            msg.setText(message);
	            msg.setSubject(subject);
	            msg.setFrom(new InternetAddress(from));
	            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	            Transport.send(msg);
	            return true;
	            
	        } catch (AuthenticationFailedException ex) {
	            
	            request.setAttribute("ErrorMessage", "Authentication failed");
	            response.sendRedirect("ErrorEmail.jsp");
//	            dispatcher = request.getRequestDispatcher(err);

	        } catch (AddressException ex) {
	            request.setAttribute("ErrorMessage", "Wrong email address");
	            response.sendRedirect("ErrorEmail.jsp");
//	            dispatcher = request.getRequestDispatcher(err);

	        } catch (MessagingException ex) {
	            
	//            dispatcher = request.getRequestDispatcher(err);
	        }
			return false;
			

	  //      dispatcher.forward(request, response);
	    }

	    private class SMTPAuthenticator extends Authenticator {

	        private PasswordAuthentication authentication;

	        public SMTPAuthenticator(String login, String password) {
	            authentication = new PasswordAuthentication(login, password);
	        }

	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return authentication;
	        }
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
