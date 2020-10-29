<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
	<head>
		<title>Admin Panel</title>
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<style>
		.custab{
    border: 1px solid #ccc;
    padding: 5px;
    margin: 5% 0;
    box-shadow: 3px 3px 2px #ccc;
    transition: 0.5s;
    }
	.custab:hover{
	    box-shadow: 3px 3px 0px transparent;
	    transition: 0.5s;
	    }
	 .Header
	 {
	 	background-image:url('images/Desk.jpg');
	 	background-size:cover;
	 	background-repeat:no-repeat;
	 }
	</style>
	</head>
	<body>
	<%
	 response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
    if(session.getAttribute("AdminName")==null)
    {
        response.sendRedirect("AdminLogin.jsp");
    }
	 request.setAttribute("AdminName",(String)session.getAttribute("AdminName"));
	%>
	<div style="width:100%;height:500px;" class="Header">
				<h1 style="color:red;text-align:center;background-color:black;padding:10px;">Welcome Admin ${AdminName }</h1>
				<div class="row">
					<div class="col-md-4"><a href="#petOwner"><button style="margin-left:300px;padding:60px;width:300px;font-size:30px;" class="btn btn-success" >Pet Owners</button></a></div>
					<div class="col-md-4"><a href="#Doctors"><button style="margin-left:400px;padding:60px;width:300px;font-size:30px;" class="btn btn-primary" >Doctors</button></a></div>
					<div class="col-md-4"><a href="AdminLogout"><button style="margin-left:400px;padding:20px;" class="btn btn-danger" >Logout</button></a></div>
				</div>
				<div class="row" style="margin-top:30px;" >
					<div class="col-md-4"><a href="#Hospitals"><button style="margin-left:300px;padding:60px;width:300px;font-size:30px;" class="btn btn-warning" >Hospitals</button></a></div>
					<div class="col-md-4"><a href="#Tips"><button style="margin-left:400px;padding:60px;width:300px;font-size:30px;" class="btn btn-info" >Pet Care Tips</button></a></div>
					
				</div>
   </div>
		<div class="container">
			<div id="petOwner">
			
			 <div class="row">
		    <h2 style="font-weight:bold;color:blue;text-align:center;">Pet Owners</h2>
		    <table class="table table-striped custab">
		    <thead>
		   
		        <tr>
		            <th>ID</th>
		            <th>Name</th>
		            <th>Email</th>
		            <th>Gender</th>
		            <th>Mobile No</th>
		            <th>City</th>
		            <th>State</th>
		            <th>Country</th>
		            
		            <th class="text-center" width="200px">Action</th>
		        </tr>
		    </thead>
		    <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      	<sql:query dataSource = "${db}" var = "result">
         SELECT * from ownerreg
   	   </sql:query>
  		<c:forEach var = "row" items = "${result.rows}">
		            <tr>
		                <td>${row.UID }</td>
		                <td>${row.Name }</td>
		                <td>${row.Email }</td>
		                <td>${row.Gender }</td>
		                <td>${row.Mobile_No }</td>
		                <td>${row.City }</td>
		                <td>${row.State }</td>
		                <td>${row.Country }</td>
		                <td class="text-center"><a href="DeleteAll?Id=${row.UID }&Action=Owner" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
		            </tr>
		  </c:forEach>        
		    </table>
		    </div>
			</div>
		  
		  
		  
		  
		  <div id="Doctors">
			
			 <div class="row">
		    <h2 style="font-weight:bold;color:blue;text-align:center;">Doctors</h2>
		    <table class="table table-striped custab">
		    <thead>
		   
		        <tr>
		            <th>ID</th>
		            <th>Name</th>
		            <th>Email</th>
		            <th>Gender</th>
		            <th>Mobile No</th>
		            <th>City</th>
		            <th>State</th>
		            <th>Country</th>
		            <th>Expertise</th>
		            <th>Year Of Exp</th>
		            
		            <th class="text-center" width="200px">Action</th>
		        </tr>
		    </thead>
		    <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      	<sql:query dataSource = "${db}" var = "result">
         SELECT * from doctor
   	   </sql:query>
  		<c:forEach var = "row" items = "${result.rows}">
		            <tr>
		                <td>${row.Id }</td>
		                <td>${row.Name }</td>
		                <td>${row.Email }</td>
		                <td>${row.Gender }</td>
		                <td>${row.Mobile_No }</td>
		                <td>${row.City }</td>
		                <td>${row.State }</td>
		                <td>${row.Country }</td>
		                <td>${row.Expertise }</td>
		                <td>${row.yearofexp }</td>
		                <td class="text-center"><a href="DeleteAll?Id=${row.Id }&Action=Doctor"  class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
		            </tr>
		  </c:forEach>        
		    </table>
		    </div>
			</div>
		
		
		<div id="Tips">
			
			 <div class="row">
		    <h2 style="font-weight:bold;color:blue;text-align:center;">Pet Care Tips</h2>
		    <table class="table table-striped custab">
		    <thead>
		   
		        <tr>
		            <th>ID</th>
		            <th>Heading</th>
		            <th>Specially</th>
		            <th>Content</th>
		            <th>D_Id</th>
		            <th>Doctor Name</th>
		           
		           
		            
		            <th class="text-center" width="200px">Action</th>
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
		                <td>${row.Number}</td>
		                <td>${row.Heading }</td>
		                <td>${row.Specially }</td>
		                <td>${row.Content }</td>
		                <td>${row.D_Id }</td>
		                <td>${row.Doctor_Name }</td>
		             
		               
		                <td class="text-center"><a href="DeleteAll?Id=${row.Number }&Action=Tip"  class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
		            </tr>
		  </c:forEach>        
		    </table>
		    </div>
			</div>
			
			
			
					<div id="Hospitals">
			
			 <div class="row">
		    <h2 style="font-weight:bold;color:blue;text-align:center;">Hospitals</h2>
		    <table class="table table-striped custab">
		    <thead>
		   
		        <tr>
		            <th>ID</th>
		            <th>Name</th>
		            <th>Email</th>
		            <th>Address</th>
		            <th>Mobile No</th>
		            <th>City</th>
		            <th>State</th>
		            <th>Country</th>
		            <th>Description</th>
		           
		            
		            <th class="text-center" width="200px">Action</th>
		        </tr>
		    </thead>
		    <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      	<sql:query dataSource = "${db}" var = "result">
         SELECT * from hospital
   	   </sql:query>
  		<c:forEach var = "row" items = "${result.rows}">
		            <tr>
		                <td>${row.Id }</td>
		                <td>${row.Hospital_Name }</td>
		                <td>${row.Email }</td>
		                <td>${row.Hospital_Address }</td>
		                <td>${row.Mobile_No }</td>
		                <td>${row.City }</td>
		                <td>${row.State }</td>
		                <td>${row.Country }</td>
		                <td>${row.Description }</td>
		               
		                <td class="text-center"><a href="DeleteAll?Id=${row.Id }&Action=Hospital"  class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
		            </tr>
		  </c:forEach>        
		    </table>
		    </div>
			</div>
		</div>
	</body>
</html>
