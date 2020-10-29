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
    			
    	<button class="btn btn-primary" id="Ad" style="margin-left:50px">Add Doctor's Details <i class="fa fa-user-md" style="font-size:28px;"></i></button>
    	</div>
    <div id="EditDoctorData" style="margin-top:10px;">
    <div id="addDoctorData" style="display:none" class="col-md-10">
    			
   		 <form class="form-horizontal" role="form" action="AddDtoH" style="border:5px solid red;background-color:orange;margin-left:250px;width:500px;" method="POST">
          
         
          	<div class="form-group md-6">
            <label class="col-lg-3 control-label md-4">Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="D_Name">
            </div>
          </div>
          <div class="form-group md-6">
            <label class="col-lg-3 control-label">Expertise:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="exp">
            </div>
          </div>
         
         
          <div class="form-group">
            <label class="col-lg-3 control-label">Year of Experience:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="YOE">
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Address:</label>
            <div class="col-lg-8">
             <textarea rows="5" cols="42" style="border-radius:6px;" name="address"></textarea>
            </div>
          </div>
         
         <div class="form-group">
            <label class="col-lg-3 control-label">Schedule:</label>
            <div class="col-lg-8">
             <textarea rows="5" cols="42" style="border-radius:6px;" name="Schedule"></textarea>
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="email">
            </div>
          </div>
          
         <div class="form-group">
            <label class="col-lg-3 control-label">Mobile No:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="Mb">
            </div>
          </div>
         
        
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
        
            <input class="btn btn-primary" type="submit"/>
        	<button type="button" class="btn btn-success" id="close">Cancel</button>
            </div>
          </div>
        </form>
    	</div>

	</div>
	


	
		
    
        <div class="row">
		
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
                            <th>Edit</th>
                            <th>Delete</th>
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
							
                            <th>Edit</th>
                            <th>Delete</th>
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
$("#Ad").click(function(){
		
		$("#addDoctorData").fadeToggle(1000);
});
   $("#close").click(function(){
	   $("#addDoctorData").css('display','none');
   });

	$('#datatable').dataTable();
    
     $("[data-toggle=tooltip]").tooltip();
    
} );

</script>
</body>
</html>