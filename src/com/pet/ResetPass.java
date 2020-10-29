package com.pet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class ResetPass
 */
@WebServlet("/ResetPass")
public class ResetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static String fetch_Pass(String email_inserted)
    {
    	 try{  
    		 	String email="",pass="";
				email=email_inserted;
			    Class.forName("com.mysql.jdbc.Driver");  
			
				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
				//Statement stmt=con.createStatement();  
				PreparedStatement stmt=con.prepareStatement("select password from ownerreg where email=?");  
				stmt.setString(1, email);
				
				ResultSet rs=stmt.executeQuery();
				if(rs.next())
				{	    
					pass = rs.getString("password");
					
				}
				con.close();
				return pass;
				
		 }catch(Exception e){ System.out.println(e);}  
    	 return "No member";
    }
	protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {

      //  final String err = "/error.jsp";
        //final String succ = "/success.jsp";
		HttpSession session1 =request.getSession();
	
        String from = "harshpatel281199@gmail.com";
        String to = (String)session1.getAttribute("Email");
        String subject = "About Reset Password";
        //String  pass_secure=Security_Password(6);
        String message = "Your Password is : "+fetch_Pass(to);
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
            request.setAttribute("MSGSENT", "your password sent on your email");
            RequestDispatcher rd = request.getRequestDispatcher("/forget.jsp");
            rd.forward(request, response);
            session1.removeAttribute("SecurityCode");
            session1.invalidate();
            
        } catch (AuthenticationFailedException ex) {
            
        	request.setAttribute("Nomemeber", "Something went Wrong");
            RequestDispatcher rd = request.getRequestDispatcher("/forget.jsp");
            rd.forward(request, response);

        } catch (AddressException ex) {
        	request.setAttribute("Nomemeber", "Something went Wrong");
            RequestDispatcher rd = request.getRequestDispatcher("/forget.jsp");
            rd.forward(request, response);

        } catch (MessagingException ex) {
        	request.setAttribute("Nomemeber", "Something went Wrong");
            RequestDispatcher rd = request.getRequestDispatcher("/forget.jsp");
            rd.forward(request, response);
        }
		

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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Inserted_Code=request.getParameter("S_Code");
		HttpSession session =request.getSession();
		System.out.println(Inserted_Code);
		String test=(String)session.getAttribute("SecurityCode");
		System.out.println(test);
		if(Inserted_Code.equals(test))
		{
			ResetPass rs=new ResetPass();
			rs.processRequest(request, response);
		}
		else
		{
			response.sendRedirect("forget.jsp");
		}
	}

}
