<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Our Patient</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/Datatablecss.css">
<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
</head>
<body>
<%
          response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
          if(session.getAttribute("RepId")==null)
          {
              response.sendRedirect("index.jsp");
          }
          %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Health Paw</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="ReceptionistPage.jsp">Home</a></li>
      <li><a href="Hspital_Doctors.jsp">Our Doctors</a></li>
      <li class="active"><a href="OurPetient.jsp">Our Patient</a></li>
      
    </ul>
  </div>
</nav>
<div class="container">
	<div class="row">
		<h2 class="text-center">Our Patients History</h2>
	</div>
    
        <div class="row">
		
            <div class="col-md-12">
            
            
<table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
    				<thead>
						<tr>
							<th>Name</th>
							<th>Pet Type</th>
							<th>Mobile No</th>
							<th>Email</th>
							<th>Address</th>
							<th>Doctor Name</th>
                            <th>Edit</th>
                            <th>Delete</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>Name</th>
							<th>Pet Type</th>
							<th>Mobile No</th>
							<th>Email</th>
							<th>Address</th>
							<th>Doctor Name</th>
                            <th>Edit</th>
                            <th>Delete</th>
						</tr>
					</tfoot>

					<tbody>
						  <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from patient
      </sql:query>
  <c:forEach var = "row" items = "${result.rows}">
                            <tr>
							<td>${row.Name }</td>
							<td>${row.Pet_Type }</td>
							<td>${row.Mobile_No }</td>
							<td>${row.Email }</td>
							<td>${row.Address }</td>
							<td>${row.Doctor_Name }</td>
                            <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><a href="DeletePatient?id=${row.Id }"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a></p></td>
						</tr>
	</c:forEach>
</tbody>
</table>
</div>
</div></div>
<script>
$(document).ready(function() {
    $('#datatable').dataTable();
    
     $("[data-toggle=tooltip]").tooltip();
    
} );

</script>
</body>
</html>