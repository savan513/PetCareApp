<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Health Paw</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  
<style type="text/css">
    .bs-example{
        margin: 8px;
    }
    .submit : hover{
    	background-color:orange;
    	border-color:red;
    }
    .card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 280px;
  border-radius: 5px;
  margin-top:5px;
  height:480px;
  background-color:#e6a5e0;
}
.card-content
{
	background-color:#e6a5e0;
}
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
  border-radius: 5px 5px 0 0;
}

</style>
</head>
<body style="background-color:#f2b527;">
<%
          response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
          if(session.getAttribute("UserId")==null)
          {
              response.sendRedirect("index.jsp");
          }
          String Id=(String)session.getAttribute("UserId");
%>
        
<div class="bs-example">
   <nav class="navbar navbar-inverse" style="margin:0px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Health Paw</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="Home.jsp">Home</a></li>
      
      <li><a href="Profile.jsp">Profile</a></li>
      <li><a href="CareTip.jsp">Health Care</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
        <select name="Search By" id="Filter" onchange="Filter()"style="padding:6px;width:160px;margin-top:8px;border-radius:5px;">
        	<option value="City">Search By City</option>
        	<option value="State">Search By State</option>
        	<option value="Country">Search By Country</option>
        </select>
      </li>
    
      <li><a href="Lgout"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
    </ul>
  </div>
</nav>
 
</div>
<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from ownerreg where UID="<%= Id %>";
      </sql:query>
       <c:forEach var = "row" items = "${result.rows}">
       	<c:set var="city" value="${row.City }"></c:set>
       	<c:set var="state" value="${row.State }"></c:set>
       	<c:set var="country" value="${row.Country }"></c:set>
       </c:forEach>
<div class="container">
	<div class="row" id="ForCity"> 
		<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from hospital where City = "${city }" or City = "${fn:toLowerCase(city)}";
      </sql:query>
 	 <c:forEach var = "row" items = "${result.rows}">
		<div class="col-md-3">
		<div class="card">
		  <img src="images/<c:out value = "${row.image}"/>" alt="Avatar" style="width:100%;height:200px;">
		  <div class="card-content" style="padding:5px;">
		    <h4><b>${row.Hospital_Name}</b></h4> 
		    
		    <p>${row.Description}</p> 
		    <b>Address : </b><c:out value = "${row.Hospital_Address}"/><br/>
			
			<b>Mobile No : </b><c:out value = "${row.Mobile_No}"/><br/>
		
			<b>City : </b><c:out value = "${row.City}"/><br/>
		
			<b>State : </b><c:out value = "${row.State}"/><br/>
		
			<b>Country : </b><c:out value = "${row.Country}"/><br/>
			
			<b>Email: </b><c:out value = "${row.Email}"/><br/><br>
		      <a href="TakeAppointment.jsp?Id=${row.Id }" class="btn btn-success">See More</a><br/>
		  </div>
		</div>
		</div>
		</c:forEach>
	</div>
	
	<div class="row" id="ForState" style="display:none;"> 
		<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from hospital where State = "${state }" or State = "${fn:toLowerCase(state)}";
      </sql:query>
 	 <c:forEach var = "row" items = "${result.rows}">
		<div class="col-md-3">
		<div class="card">
		  <img src="images/<c:out value = "${row.image}"/>" alt="Avatar" style="width:100%;height:200px;">
		  <div class="card-content" style="padding:5px;">
		    <h4><b>${row.Hospital_Name}</b></h4> 
		    
		    <p>${row.Description}</p> 
		    <b>Address : </b><c:out value = "${row.Hospital_Address}"/><br/>
			
			<b>Mobile No : </b><c:out value = "${row.Mobile_No}"/><br/>
		
			<b>City : </b><c:out value = "${row.City}"/><br/>
		
			<b>State : </b><c:out value = "${row.State}"/><br/>
		
			<b>Country : </b><c:out value = "${row.Country}"/><br/>
			
			<b>Email: </b><c:out value = "${row.Email}"/><br/><br>
		      <a href="TakeAppointment.jsp?Id=${row.Id }" class="btn btn-success">See More</a><br/>
		  </div>
		</div>
		</div>
		</c:forEach>
	</div>
	
	
	<div class="row" id="ForCountry" style="display:none;"> 
		<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from hospital where Country = "${country }" or Country = "${fn:toLowerCase(country)}";
      </sql:query>
 	 <c:forEach var = "row" items = "${result.rows}">
		<div class="col-md-3">
		<div class="card">
		  <img src="images/<c:out value = "${row.image}"/>" alt="Avatar" style="width:100%;height:200px;">
		  <div class="card-content" style="padding:5px;">
		    <h4><b>${row.Hospital_Name}</b></h4> 
		    
		    <p>${row.Description}</p> 
		    <b>Address : </b><c:out value = "${row.Hospital_Address}"/><br/>
			
			<b>Mobile No : </b><c:out value = "${row.Mobile_No}"/><br/>
		
			<b>City : </b><c:out value = "${row.City}"/><br/>
		
			<b>State : </b><c:out value = "${row.State}"/><br/>
		
			<b>Country : </b><c:out value = "${row.Country}"/><br/>
			
			<b>Email: </b><c:out value = "${row.Email}"/><br/><br>
		    <a href="TakeAppointment.jsp?Id=${row.Id }" class="btn btn-success">See More</a><br/>
		  </div>
		</div>
		</div>
		</c:forEach>
	</div>
</div>
<script src="js/jquery.js"></script>
<script>
	function Filter()
	{
		var x = document.getElementById("Filter").value;
		if(x=="City")
		 {
			$("#ForState").css("display","none");
			$("#ForCountry").css("display","none");
			$("#ForCity").css("display","block");
		 }
		if(x=="State")
		{
			$("#ForCity").css("display","none");
			$("#ForState").css("display","block");
			$("#ForCountry").css("display","none");
		}
		if(x=="Country")
		{
			$("#ForCity").css("display","none");
			$("#ForCountry").css("display","block");
			$("#ForState").css("display","none");
		}
	}
</script>
</body>
</html>                            