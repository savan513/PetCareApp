package com.pet;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class SecurityCodesSend
 */
@WebServlet("/SecurityCodesSend")
public class SecurityCodesSend extends HttpServlet {
	static String Security_Password(int len) 
	{ 
		//System.out.println("Generating password using random() : "); 
		//System.out.print("Your new password is : "); 

		// A strong password has Cap_chars, Lower_chars, 
		// numeric value and symbols. So we are using all of 
		// them to generate our password 
		String Capital_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; 
		String Small_chars = "abcdefghijklmnopqrstuvwxyz"; 
		String numbers = "0123456789"; 
				


		String values = Capital_chars + Small_chars + 
						numbers; 

		// Using random method 
		Random rndm_method = new Random(); 

		char[] password = new char[len]; 

		for (int i = 0; i < len; i++) 
		{ 
			// Use of charAt() method : to get character value 
			// Use of nextInt() as it is scanning the value as int 
			password[i] = 
			values.charAt(rndm_method.nextInt(values.length())); 

		} 
		String pass=new String(password);
		return pass; 
	} 
	 protected String processRequest(HttpServletRequest request,
	            HttpServletResponse response)
	            throws IOException, ServletException {

	      //  final String err = "/error.jsp";
	        //final String succ = "/success.jsp";

	        String from = "harshpatel281199@gmail.com";
	        String to = request.getParameter("email");
	        String subject = "About Reset Password";
	        String  pass_secure=Security_Password(6);
	        String message = "Security Code: "+pass_secure;
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
	            return pass_secure;
	            
	        } catch (AuthenticationFailedException ex) {
	            
	            request.setAttribute("ErrorMessage", "Authentication failed");
	            
//	            dispatcher = request.getRequestDispatcher(err);

	        } catch (AddressException ex) {
	            request.setAttribute("ErrorMessage", "Wrong email address");
	            
//	            dispatcher = request.getRequestDispatcher(err);

	        } catch (MessagingException ex) {
	            
	//            dispatcher = request.getRequestDispatcher(err);
	        }
			return "Fails";
			

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
