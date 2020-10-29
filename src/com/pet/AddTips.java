package com.pet;

import java.io.File;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
 * Servlet implementation class AddTips
 */
@WebServlet("/AddTips")
public class AddTips extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTips() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		String Did=(String)session.getAttribute("DoctorId");
		String IName="",Name="";
		
		String title="";
		String Type="";
		String Content="";
		
		try
		{
			
			List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
			   String inputName = null;
			for(FileItem item : multiparts){
			 if(!item.isFormField()){   // Check regular field.
			  IName = new File(item.getName()).getName();
			  File f = new File("C:\\Users\\abc\\eclipse-workspace\\PetCareApp\\WebContent\\images\\"+item.getName()); 
				
		        if (f.exists()) 
		            System.out.println("Exists"); 
		        else
		        	item.write( new File("C:\\Users\\abc\\eclipse-workspace\\PetCareApp\\WebContent\\images\\" + IName));
			 }
			 if(item.isFormField()){  // Check regular field.
			  inputName = (String)item.getFieldName(); 
			  if(inputName.equalsIgnoreCase("Title")){ 
			   title = (String)item.getString(); 
			          System.out.println("Title is:"+title); 
			  }
			  if(inputName.equalsIgnoreCase("type")){ 
				   Type = (String)item.getString(); 
				          System.out.println("Type is:"+Type); 
				  }
			  if(inputName.equalsIgnoreCase("Dcp")){ 
				  Content = (String)item.getString(); 
				          System.out.println("Content is:"+Content); 
				  }
			 } 
			}
			
			
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			PreparedStatement ptmt=con.prepareStatement("select * from doctor where Id = ?");
			ptmt.setString(1, Did);
			
			ResultSet rs=ptmt.executeQuery();
			if(rs.next())
				Name = rs.getString("Name");
			
			PreparedStatement pt=con.prepareStatement("insert into tips(Heading,Specially,Content,D_Id,Doctor_Name,image) values(?,?,?,?,?,?)");
			pt.setString(1, title);
			pt.setString(2, Type);
			pt.setString(3, Content);
			pt.setString(4, Did);
			pt.setString(5, Name);
			pt.setString(6, IName);
			int i=pt.executeUpdate();
			if(i>0)
				System.out.println("Inserted");
		
			response.sendRedirect("AddTips.jsp");
		}catch(Exception e) {System.out.println(e);}
		
	}

}
