<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointments</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}
    	
    	.Reptextbox{
    		padding:5px;
    		border-radius:6px;
    		width:240px;
    		margin:5px;
    		background-color:cyan;
    		color:red;
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
	String Id=(String)session.getAttribute("UserId");
	String Hid=request.getParameter("Id");
	Cookie c=new Cookie("Hid",Hid);
	response.addCookie(c);
%>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark  mt-2">
  <a class="navbar-brand" href="#">Health Paw</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
    
      <li class="nav-item active">
        <a class="nav-link" href="Home.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="Profile.jsp">Profile</a>
      </li>
      
      
    </ul>

  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    
  </form>
<form action="Lgout">
    <button class="btn btn-warning" type="submit" style="margin-left:10px">Logout</button>
</form>
  </div>
</nav>
<div class="container">
    <div class="row" style="margin-top:10px;border:2px solid green;padding:10px;">
        <div class="col-md-10" style="margin-left:80px;">
           <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from hospital where Id=<%= request.getParameter("Id")%>;
      </sql:query>
 		<c:forEach var = "row" items = "${result.rows}">
 			<div style="float:right">
  		
  		<img src="images/<c:out value = "${row.image}"/>" id="img" alt="Insert Your Pet Image" onclick="Display()" style="display:block;width:350px;height:230px;margin-left:5px;">
  		
 		<form id="divimg" action="HpImageChange" method="POST" style="color:black; float:right" enctype='multipart/form-data'>
	    	 <input type="file" name="image"  onchange="readURL(this);"><br/>
	    	
             <img src="#" id="img" alt="image is uploading make refresh" style="width:230px;height:230px;display:none"> 
             <input type="submit" id="sv" disabled=true value="Save_Changed_Image" class="btn btn-primary" name="EditHspDP"/> 
            	
    	</form>
 		
 		</div>
 		
			<b>Receptionist Name : </b><c:out value = "${row.Receptionist_Name}"/><br/>
			<c:set var = "R_name" scope = "page" value = "${row.Receptionist_Name}"/>
			<b>Hospital Name : </b><c:out value = "${row.Hospital_Name}"/><br/>
			<c:set var = "H_name" scope = "page" value = "${row.Hospital_Name}"/>
			<b>Address : </b><c:out value = "${row.Hospital_Address}"/><br/>
			<c:set var = "address" scope = "page" value = "${row.Hospital_Address}"/>
			<b>Mobile No : </b><c:out value = "${row.Mobile_No}"/><br/>
			<c:set var = "MobileNo" scope = "page" value = "${row.Mobile_No}"/>
			<b>City : </b><c:out value = "${row.City}"/><br/>
			<c:set var = "city" scope = "page" value = "${row.City}"/>
			<b>State : </b><c:out value = "${row.State}"/><br/>
			<c:set var = "state" scope = "page" value = "${row.State}"/>
			<b>Country : </b><c:out value = "${row.Country}"/><br/>
			<c:set var = "country" scope = "page" value = "${row.Country}"/>
			<b>Email: </b><c:out value = "${row.Email}"/><br/><br>
			<c:set var = "email" scope = "page" value = "${row.Email}"/>
			<c:set var = "password" scope = "page" value = "${row.password}"/>
			<c:set var ="desc" scope="page" value="${row.Description}"/>
			
			<button id="EditDetails" class="btn btn-success" type="submit">Edit Details</button>
			
			
		 
		 
 	</c:forEach>
   
		</div>
</div>
</div>
<div class="col-md-12">
            <h2 class="text-center">Our Doctor History</h2>
	
            
<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
    				<thead>
						<tr>
							<th>Name</th>
							<th>Pet Type</th>
							<th>Mobile No</th>
							<th>Email</th>
							<th>Address</th>
							<th>Doctor Name</th>
                          
                         
                           <th>Appointment</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>Name</th>
							<th>Expertise</th>
							<th>Year of Exp</th>
							<th>Mobile No</th>
							<th>Email</th>
							<th>Address</th>
							
                           
                            <th>Appointment</th>
						</tr>
					</tfoot>

					<tbody>
	 <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from hospital_doctor
      </sql:query>
  <c:forEach var = "row" items = "${result.rows}">
                            <tr>
							<td>${row.Name }</td>
							<td>${row.Expertise }</td>
							<td>${row.YOE }</td>
							<td>${row.Mobile_No }</td>
							<td>${row.Email }</td>
							
							<td>${row.Address }</td>                     
    						
    						
    						<td><a href="TakeDate.jsp?Did=${row.D_Id }&DName=${row.Name }&HName=${H_name}"><button class="btn btn-warning">Take Date</button></a></td>
    					
						</tr>
	</c:forEach>
</tbody>
</table>
</div>
<% 
					if(null!=request.getAttribute("Message"))
				    {
					%>
					<script>
						function myFunction(Str) {
						  alert("Submitted");
						}
						myFunction("No Member");
				 </script>
					<%
				    }
					%>
<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" > 
    </script> 
<link href= 
'https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/jquery-ui.css'
          rel='stylesheet'> 
      
    <script src= 
"https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" > 
    </script> 
<script>
$( "#dateinput" ).datepicker({ 
	 dateFormat: 'dd-mm-yy'
}); 
</script>
</body>
</html>