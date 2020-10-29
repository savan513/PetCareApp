<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/Form.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Doctor Page</title>
    <style>
    h4{
    	color:blue;
    	font-weight:bold;
    	margin-left:30px;
    }
    	.Reptextbox{
    		padding:5px;
    		border-radius:6px;
    		width:240px;
    		margin:5px;
    		background-color:cyan;
    		color:red;
    	}
table {
  border-collapse: collapse;
  width: 100%;
  border:1px solid black;
}

th, td {
  text-align: left;
  padding: 8px;
  border:1px solid black;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: maroon;
  color: white;
}
    </style>
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

.active {
  background-color: #4CAF50;
}
</style>
    <script>
  function readURL(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#img')
                  .attr('src', e.target.result)
                  .width(300)
                  .height(230);
              document.getElementById("sv").disabled = false;
          };

          reader.readAsDataURL(input.files[0]);
      }
  }
  function Display()
  {
	  document.getElementById("divimg").style.visibility="visible";
  }
  function closeit()
  {
	  document.getElementById("divimg").style.visibility="hidden";
  }
  
  </script>
</head>
<body>
<%
          response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
          if(session.getAttribute("DoctorId")==null)
          {
              response.sendRedirect("index.jsp");
          }
          String Id=(String)session.getAttribute("DoctorId");
        %>
 <ul>
  <li>
    		<a class="nav-link" href="#" style="background-color:maroon;"><h4>Health Paw</h4></a>
    </li>
  <li><a href="DoctorPanel.jsp">Home</a></li>
  <li><a href="AddTips.jsp">Add Tips</a></li>
 
   <li style="float:right"><a class="active" href="Lgout"><i class="fa fa-user-md" style="font-size:28px;"></i> Logout</a></li>
</ul>
 <h1 style="margin-left:300px;border:3px solid maroon;padding:5px;border-radius:5px;text-align:center;color:green;background-color:orange"><i class="fa fa-ambulance" style="font-size:36px;"></i>Doctor Panel </h1>
 
<div class="container">
    <div class="row" style="margin-top:10px;border:2px solid green;padding:10px;">
        <div class="col-md-10" style="margin-left:80px;">
           <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from doctor where Id=<%= session.getAttribute("DoctorId")%>;
      </sql:query>
 		<c:forEach var = "row" items = "${result.rows}">
 			<div style="float:right">
  		
  		<img src="images/<c:out value = "${row.image}"/>" id="img" alt="Insert Your Pet Image" onclick="Display()" style="display:block;width:350px;height:230px;margin-left:5px;">
  		
 		<form id="divimg" action="DrImageChange" method="POST" style="color:black; float:right" enctype='multipart/form-data'>
	    	 <input type="file" name="image"  onchange="readURL(this);"><br/>
	    	
             <img src="#" id="img" alt="image is uploading make refresh" style="width:230px;height:230px;display:none"> 
             <input type="submit" id="sv" disabled=true value="Save_Changed_Image" class="btn btn-primary" name="EditHspDP"/> 
            	
    	</form>
 		
 		</div>
 		
			<b>Doctor Name : </b><c:out value = "${row.Name}"/><br/>
			<c:set var = "name" scope = "page" value = "${row.Name}"/>
			
			<b>Address : </b><c:out value = "${row.Address}"/><br/>
			<c:set var = "address" scope = "page" value = "${row.Address}"/>
			<b>Mobile No : </b><c:out value = "${row.Mobile_No}"/><br/>
			<c:set var = "MobileNo" scope = "page" value = "${row.Mobile_No}"/>
			<b>Expertise : </b><c:out value = "${row.Expertise}"/><br/>
			<c:set var = "Expertise" scope = "page" value = "${row.Expertise}"/>
			<b>Mobile No : </b><c:out value = "${row.yearofexp}"/><br/>
			<c:set var = "Exp" scope = "page" value = "${row.yearofexp}"/>
			<b>City : </b><c:out value = "${row.City}"/><br/>
			<c:set var = "city" scope = "page" value = "${row.City}"/>
			<b>State : </b><c:out value = "${row.State}"/><br/>
			<c:set var = "state" scope = "page" value = "${row.State}"/>
			<b>Country : </b><c:out value = "${row.Country}"/><br/>
			<c:set var = "country" scope = "page" value = "${row.Country}"/>
			<b>Email: </b><c:out value = "${row.email}"/><br/><br>
			<c:set var = "email" scope = "page" value = "${row.email}"/>
			<c:set var = "password" scope = "page" value = "${row.password}"/>
			<c:set var ="desc" scope="page" value="${row.Description}"/>
			
			<button id="EditDetails" class="btn btn-success" type="submit">Edit Details</button>
			
			
		 
		 
 	</c:forEach>
   </div>
		</div>
      </div>
      <div class="col-md-8" style="border:2px dashed maroon;width:700px;padding:10px;margin-top:10px;margin-left:200px;display:none;" id="EditForm">
    	<h4 style="color:orange">Edit Profile Form</h4>
    	
    	
   		 <form class="form-horizontal" role="form" action="HospitalRegister" style="border:5px dotted green;width:600px;" method="POST">
          <div class="form-group">
            <h4>Doctor Name</h4>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="<c:out value = "${name}"/>" name="R_Name">
            </div>
          </div>
          
          
          <div class="form-group">
             <h4>Address</h4>
            <div class="col-lg-8">
             <textarea rows="5" cols="42" style="border-radius:6px;" name="address"><c:out value="${address}"/></textarea>
            </div>
          </div>
         
          
          <div class="form-group">
             <h4>Email</h4>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${email }" name="email">
            </div>
          </div>
          
         <div class="form-group">
             <h4>Mobile No</h4>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${MobileNo }" name="Mb">
            </div>
          </div>
          <div class="form-group">
             <h4>Password</h4>
            <div class="col-md-8">
              <input class="form-control" type="password" value="${password }" name="Pass">
            </div>
          </div>
           <div class="form-group">
             <h4>Expertise</h4>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${Expertise}" name="Expert">
            </div>
          </div>
           <div class="form-group">
             <h4>Experience</h4>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${Exp}" name="Expirence">
            </div>
          </div>
          <div class="form-group">
             <h4>City</h4>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${city }" name="City">
            </div>
          </div>
          <div class="form-group">
             <h4>State</h4>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${state }" name="State">
            </div>
          </div>
          <div class="form-group">
             <h4>Country</h4>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${country }" name="Country">
            </div>
          </div>
          <div class="text-center">
   
        </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
            <input class="btn btn-primary" style="width:150px;" type="submit" name="Saveit" value="Update"/>
        	<a href="ReceptionistPage.jsp" class="btn btn-success" style="width:150px;height:50px;valign:middle;margin-top:30px;">Cancel</a>
            </div>
          </div>
        </form>
    </div>
<div class="container" style="margin-top:10px;">
<h1>Appointments </h1>
<table>

  <tr>
    <th>Name</th>
    <th>Email</th>
    <th>Mobile No</th>
     <th>PetType</th>
    <th>Date</th>
    <th>Time</th>
    <th>Doctor</th>
    <th>Reason</th>
    <th>Accept</th>
    <th>Delete</th>
  </tr>
   <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from appointment where H_Id="<%=Id %>" and Status = "1"
      </sql:query>
  <c:forEach var = "row" items = "${result.rows}">
                            <tr>
                            <td>${row.Name }</td>
							<td>${row.Email}</td>
							<td>${row.Mobile_No }</td>
							<td>${row.Pet_Type}</td>
					
							<td>${row.Date }</td>                     
    						<td>${row.Time }</td>
    						<td>${row.DName }</td>
    						<td>${row.Reason }</td>
    						
    						<td><a href="ActionOnReq?Id=${row.Id }&Action=DAccept"><button class="btn btn-primary" name="DAccept">Accept</button></a></td>
    						<td><a href="ActionOnReq?Id=${row.Id }&Action=DCancel"><button class="btn btn-warning" name="DCancel">Cancel</button></a></td>
						</tr>
		</c:forEach>
</table>
</div>

<div class="container ">
	<h3 style="color:green;font-weight:bold;">Pet Care Tips</h3>
<table class="w3-table-all" style="margin-top:10px;">
    <thead>
      <tr class="green-header" style="background-color:green;border:1px solid green">
      	
        <th>Title</th>
        <th>Specially For</th>
        <th>Content</th>
        <th>image</th>
        
       	<th width="180x">Manipulate Record</th>
      </tr>
    </thead>
    <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from tips
      </sql:query>
  <c:forEach var = "row" items = "${result.rows}">
    <tr>
    
     <td>${row.Heading}</td>
       <td>${row.Specially}</td>
     <td>${row.Content}</td>
     
     <td><img src="images/${row.image }" width="200px" height="200px"></td>
   
    
     
      <td><a href="DeletePatient?id=${row.Id}" class="btn btn-danger" style="margin-left:5px;">Delete</a></td>
    </tr>
    </c:forEach>
  </table>
</div>
<script src="js/jquery.js"></script>
<script>
	$("#EditDetails").click(function(){
			$("#EditForm").toggle();
	});
	
	
</script>
     </body>
 </html>