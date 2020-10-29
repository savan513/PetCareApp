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
<title>Insert title here</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 <div>
 <h2>Enter Name Here</h2>
  <p>Type something in the input field to search the table for first names, last names or emails:</p>  
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  <table class="w3-table-all" style="margin-left:0px;">
    <thead>
      <tr class="green-header" style="background-color:green;border:1px solid green">
      	<th>Id</th>
        <th>Patient Name</th>
        <th>Address</th>
        <th>Mobile No</th>
        <th>Email</th>
        <th>Doctor Name</th>
       	<th>Delete Record</th>
      </tr>
    </thead>
    <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from patient where H_Id=<%= session.getAttribute("RepId")%>;
      </sql:query>
  <c:forEach var = "row" items = "${result.rows}">
    <tr>
     <td>${row.Id}</td>
     <td>${row.Name}</td>
       <td>${row.Address}</td>
     <td>${row.Mobile_No}</td>
     <td>${row.Email}</td>
     <td>${row.Doctor_Name}</td>
   
    
     
      <td><!-- <a href="" id="edit" class="btn btn-success" >Edit</a> -->  <a href="DeletePatient?id=${row.Id}" class="btn btn-danger" style="margin-left:5px;">Delete</a></td>
    </tr>
    </c:forEach>
  </table>
    </div>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>