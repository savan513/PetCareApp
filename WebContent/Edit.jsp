<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Health Paw</title>
  <meta charset="utf-8">
   <meta charset="utf-8">
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
  <style type="text/css">
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
}


  </style>
</head>
<body>
<%
          response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
          if(session.getAttribute("UserId")==null)
          {
              response.sendRedirect("index.jsp");
          }
          String Uname="",pwd="",Name="",Uid="",Mob,img="",FPIC="",ct,st,country;
          try{  
				
				Uid=(String)session.getAttribute("UserId");
			    Class.forName("com.mysql.jdbc.Driver");  
			
				Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
				//Statement stmt=con.createStatement();  
				PreparedStatement stmt=con.prepareStatement("select * from ownerreg where UID=?");  
				
				stmt.setString(1,Uid);  
				
				 
				ResultSet rs=stmt.executeQuery();
				if(rs.next())
				{	    
					Uid = rs.getString(1);
				
					Name=rs.getString(2);
					 request.setAttribute("User_Name",Name);
					 
			      	Uname=rs.getString(3);     	
			      	request.setAttribute("User_Email",Uname);
			      	Mob=rs.getString(6);
			      	request.setAttribute("Mobile",Mob);
			      	pwd=rs.getString(4);
			      	request.setAttribute("Pass", pwd);
			      	img=rs.getString("image");
			      	request.setAttribute("image", img);
			      	ct=rs.getString("City");
			      	request.setAttribute("City", ct);
			      	st=rs.getString("State");
			      	request.setAttribute("State", st);
			      	country=rs.getString("Country");
			      	request.setAttribute("Country", country);
			      	FPIC="images/"+img;
				}
				 
				}catch(Exception e){ System.out.println(e);}  
         
    %>
  
 <div class="container">
    <h1>Edit Profile</h1>
  	<hr>
	<div class="row">
     
      <!-- edit form column -->
      <div class="col-md-6" style="margin-left:250px">
        
        <h3>Personal info</h3>
            <form method="POST" action="EditDp" style="border:5px dotted red;" enctype='multipart/form-data'>
            <input type="file" name="image_DP" required="required" onchange="readURL(this);" value="Choose Profile ">
           
 			<img src="<%=FPIC %>" class="pic img-circle" alt="Your Image" width="160" height="180" id="img">
 			<input class="btn btn-primary col-sm-5" type="submit" value="Save Image"/>
           </form>
           <br>
        <form class="form-horizontal" role="form" action="EditProfile" style="border:5px dotted green" method="POST">
          <div class="form-group">
            <label class="col-lg-3 control-label">First name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${User_Name }" name="Name">
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${User_Email }" name="email">
            </div>
          </div>
          
         <div class="form-group">
            <label class="col-lg-3 control-label">Mobile No:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${Mobile }" name="Mb">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" value="${Pass }" name="Pass">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">City:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${City }" name="City">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">State:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${State }" name="State">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Country:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${Country }" name="Country">
            </div>
          </div>
          <div class="text-center">
          
         
        <hr>
        
        </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
        
            <input class="btn btn-primary" type="submit"/>
        	<a href="Profile.jsp"><button type="button" class="btn btn-success">Cancel</button></a>
            </div>
          </div>
        </form>
      </div>
  </div>
</div>
<hr>
</body>
</html>
