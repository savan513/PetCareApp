<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Pet Details</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script>
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#img')
                  .attr('src', e.target.result)
                  .width(150)
                  .height(200);
          };

          reader.readAsDataURL(input.files[0]);
      }
  }
  </script>
  <style>
   :root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}
  body {
  background-image: url("images/back.jpg");
  background-repeat: no-repeat;
   height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}</style>
</head>
<body>
<%
response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
if(session.getAttribute("UserId")==null)
{
    response.sendRedirect("index.jsp");
}
String Type="",Age="",Name="",img="",FPIC="",i,dip="";
int id;

		i=request.getParameter("id");
		
	   if(i!=null)
	   {
		   id=Integer.parseInt(i);
		   request.setAttribute("Pid", i);
		   try{
			Class.forName("com.mysql.jdbc.Driver");  
		
			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
			//Statement stmt=con.createStatement();  
			PreparedStatement stmt=con.prepareStatement("select * from petdetails where Id=?");  
			
			stmt.setInt(1,id);  
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{	    
				
				Name=rs.getString("P_Name");
				 request.setAttribute("Pet_Name",Name);
				 
		      	Age=rs.getString("P_Age");     	
		      	request.setAttribute("PetAge",Age);
		      	Type=rs.getString("P_Type");
		      	request.setAttribute("Type",Type);
		      	dip=rs.getString("Other_Dip");
		      	request.setAttribute("Dicription",dip);
		      	img=rs.getString("image");
		      	
		      	FPIC="images/"+img;
		      	request.setAttribute("image", FPIC);
			}
			 
	   }catch(Exception e){ System.out.println(e);} 
	   }
%>
<div class="container">
	<h2>Add Pet Details</h2><hr>
	<div class="row">
		<div class="col-md-6" style="margin-left:250px">
		<h3>Personal info</h3>
            
           <br>
        <form action="AddPetDetail?id=<%=i %>" method="post" style="border:5px dotted green" class="form-horizontal">
            
            <div class="form-group">
            <label class="col-lg-3 control-label">Pet Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${Pet_Name }" name="P_name" required/>
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-lg-3 control-label">Pet Age:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${PetAge }" name="P_age" required/>
            </div>
          </div>
          
         <div class="form-group">
            <label class="col-lg-3 control-label">Pet Type:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${Type }" name="P_type" required/>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-md-4 control-label">Other Decription:</label>
            <div class="col-md-8">
              <textarea rows="4" cols="70" name="Other" required/><c:out value = "${Dicription}"/></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label></div>
            <div class="col-md-8">
            <hr>
                       
            
           	<%if(i!=null){ %>
          		 <input class="btn btn-warning" type="submit"/ name="Edit">
           	<%} else{%><input class="btn btn-primary" type="submit"/ name="Add"><%} %>
        	<a href="Profile.jsp"><button type="button" class="btn btn-success">Cancel</button></a>
            </div>
  		</form>
	</div>
</div>
<hr>
<div>
	
           
</div>
      
		</div>
	</div>
</div>
</body>
</html>