package com.pet;


import java.io.File;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class EditDp
 */
@WebServlet("/EditDp")
public class EditDp extends HttpServlet {
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		
			String Uid=(String)session.getAttribute("UserId");
			String d=request.getParameter("dummy");
			System.out.println(d);
			if(Uid!=null)
			{
				try {
					
					ServletFileUpload sf=new ServletFileUpload(new DiskFileItemFactory());
					List<FileItem> items=sf.parseRequest(request);
					
					for(FileItem item:items)
					{
						System.out.println(item.getName());
						File f = new File("C:\\Users\\abc\\eclipse-workspace\\PetCareApp\\WebContent\\images\\"+item.getName()); 
						
				        if (f.exists()) 
				            System.out.println("Exists"); 
				        else
				        {
				        	item.write(new File("C:\\Users\\abc\\eclipse-workspace\\PetCareApp\\WebContent\\images\\"+item.getName()));
							
				        }

						Class.forName("com.mysql.jdbc.Driver");  
						
						Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
						//Statement stmt=con.createStatement();  
						PreparedStatement stmt=con.prepareStatement("UPDATE ownerreg SET  image = ? WHERE UID = ?");  
						stmt.setString(1, item.getName());
						stmt.setString(2, Uid);
						
						stmt.executeUpdate();
						PrintWriter out=response.getWriter();
						
						System.out.println("Inserted");
					}
				}catch(Exception e) {System.out.println(e);}
				System.out.println("Success");
			
				response.sendRedirect("Edit.jsp");
			}
				}

}

