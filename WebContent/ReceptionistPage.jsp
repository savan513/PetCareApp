<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Hospital Page</title>
    <style>
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
    	
    	.Reptextbox{
    		padding:5px;
    		border-radius:6px;
    		width:240px;
    		margin:5px;
    		background-color:cyan;
    		color:red;
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
<body style="background-color:pink">
<%
          response.addHeader("Cache-Control","no-cache,no-store,must-revalidate");//prevent back button
          if(session.getAttribute("RepId")==null)
          {
              response.sendRedirect("index.jsp");
          }
          String ID =(String)request.getParameter("Id");
          String Hid=(String)session.getAttribute("RepId");
          int i;
          String Name="";
          if(ID!=null)
          {
        	  i=Integer.parseInt(ID);
        	  try{
      			Class.forName("com.mysql.jdbc.Driver");  
      		
      			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
      			//Statement stmt=con.createStatement();  
      			PreparedStatement stmt=con.prepareStatement("select * from patient where Id=?");  
      			
      			stmt.setInt(1,i);  
      			ResultSet rs=stmt.executeQuery();
      			if(rs.next())
      			{	    
      				
      				Name=rs.getString("Name");
      				 request.setAttribute("Name",Name);
      				 
      		      	
      			}
      			 
      	   }catch(Exception e){ System.out.println(e);} 
          }
          
        %>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark  mt-2">
  <a class="navbar-brand" href="#">Health Paw</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
    
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Hspital_Doctors.jsp">Our Doctors</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="OurPetient.jsp">Patients History</a>
      </li>
    </ul>

  <form class="form-inline">
    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    
  </form>
<form action="RepLogout">
    <button class="btn btn-warning" type="submit" style="margin-left:10px">Logout</button>
</form>
  </div>
</nav>
<h1 style="border:3px solid maroon;padding:5px;border-radius:5px;color:green;background-color:orange"><marquee><i class="fa fa-ambulance" style="font-size:36px;"></i> This is Hospital Pannel Accessed by Receptionist</marquee> </h1>
<div class="container">
    <div class="row" style="margin-top:10px;border:2px solid green;padding:10px;">
        <div class="col-md-10" style="margin-left:80px;">
           <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from hospital where Id=<%= session.getAttribute("RepId")%>;
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
    <div class="col-md-8" style="border:2px dashed maroon;padding:10px;margin-top:10px;margin-left:200px;display:none;" id="EditForm">
    	<h4 style="color:orange">Edit Profile Form</h4>
    	
    	
   		 <form class="form-horizontal" role="form" action="HospitalRegister" style="border:5px dotted green" method="POST">
          <div class="form-group">
            <label class="col-lg-3 control-label">Receptionist Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="<c:out value = "${R_name}"/>" name="R_Name">
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Hospital Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${H_name }" name="H_Name">
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Address:</label>
            <div class="col-lg-8">
             <textarea rows="5" cols="42" style="border-radius:6px;" name="address"><c:out value="${address}"/></textarea>
            </div>
          </div>
         
          <div class="form-group">
            <label class="col-lg-3 control-label">Description:</label>
            <div class="col-lg-8">
             <textarea rows="5" cols="42" style="border-radius:6px;" name="desc"><c:out value="${desc}"/></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${email }" name="email">
            </div>
          </div>
          
         <div class="form-group">
            <label class="col-lg-3 control-label">Mobile No:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" value="${MobileNo }" name="Mb">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" value="${password }" name="Pass">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">City:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${city }" name="City">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">State:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${state }" name="State">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Country:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" value="${country }" name="Country">
            </div>
          </div>
          <div class="text-center">
          
         
        <hr>
        
        </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
        
            <input class="btn btn-primary" type="submit" name="Saveit" value="Update"/>
        	<a href="ReceptionistPage.jsp"><button type="button" class="btn btn-success">Cancel</button></a>
            </div>
          </div>
        </form>
    </div>
    
    <div style="margin-top:15px;" id="PatientArea">
    	<h4 style="border:2px solid green;border-radius:5px;padding:5px;text-align:center;background-color:#60eb8c;color:#07098f;">Patient Area</h4>
    	<button class="btn btn-success" style="margin-top:10px;" id="ap"> Add or Edit Patients </button>
    </div>
        <div id="addPatientData" style="display:none" class="col-md-10">
    			
   		 <form class="form-horizontal" role="form" action="AddPtoH" style="border:5px solid red;width:500px;background-color:aqua;margin-left:200px;" method="POST">
    
         <div class="form-group">
            <label class="col-lg-3 control-label">Patient Name:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="P_Name">
            </div>
          </div>
          
           <div class="form-group">
            <label class="col-lg-3 control-label">Pet Type:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="Pet_Name">
            </div>
          </div>
         
            <div style="font-size:20;margin:10px;dislpay:inline-block;margin-left:15px;" class="form-group">
				<h5>Gender: </h5> 
                <input type="radio" id="Gender"  name="Gender"  value="male" required>Male
                <input type="radio" id="Gender"  name="Gender"  value="Female" required>FeMale
             
               
              </div>
        
          <div class="form-group">
            <label class="col-lg-3 control-label">Address:</label>
            <div class="col-lg-8">
             <textarea rows="5" cols="42" style="border-radius:6px;" name="address"></textarea>
            </div>
          </div>
         
         <div class="form-group">
            <label class="col-lg-3 control-label">Mobile NO:</label>
            <div class="col-lg-8">
            <input class="form-control" type="text"  name="Mb">
            </div>
          </div>
          
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="email">
            </div>
          </div>
          
         <div class="form-group">
            <label class="col-lg-3 control-label"><p>Doctor Name:</p></label>
            <div class="col-lg-8">
              <input class="form-control" type="text"  name="D_Name">
            </div>
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
    <div>
    <c:set var = "now" value = "<%= new java.util.Date()%>" />
    Date : <fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}" />
  <table class="w3-table-all" style="margin-left:0px;">
    <thead>
      <tr class="green-header" style="background-color:green;border:1px solid green">
      	<th>Id</th>
        <th>Patient Name</th>
        <th>Address</th>
        <th>Mobile No</th>
        <th>Email</th>
        <th>Doctor Name</th>
       	<th width="180x">Manipulate Record</th>
      </tr>
    </thead>
    <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from patient where H_Id=<%= session.getAttribute("RepId")%> and Date="<fmt:formatDate pattern = "yyyy-MM-dd" value = "${now}" />";
      </sql:query>
  <c:forEach var = "row" items = "${result.rows}">
    <tr>
     <td>${row.Id}</td>
     <td>${row.Name}</td>
       <td>${row.Address}</td>
     <td>${row.Mobile_No}</td>
     <td>${row.Email}</td>
     <td>${row.Doctor_Name}</td>
   
    
     
      <td><a href="DeletePatient?id=${row.Id}" class="btn btn-danger" style="margin-left:5px;">Delete</a></td>
    </tr>
    </c:forEach>
  </table>
    </div>
</div>

<div class="container" style="margin-top:10px;">
<h1>Appointments Arrived</h1>
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
         SELECT * from appointment where H_Id="<%=Hid %>" and Status = "0"
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
    						
    						<td><a href="ActionOnReq?Id=${row.Id }&Action=Accept"><button class="btn btn-primary" value="HAccept">Accept</button></a></td>
    						<td><a href="ActionOnReq?Id=${row.Id }&Action=Cancel"><button class="btn btn-warning" value="HCancel">Cancel</button></a></td>
						</tr>
		</c:forEach>
</table>
</div>


<div class="container" style="margin-top:10px;">
<h1>Appointments Pending(For Doctors Response)</h1>
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
    
  </tr>
   <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from appointment where H_Id="<%=Hid %>" and Status = "1"
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
    						
    					
						</tr>
		</c:forEach>
</table>
</div>
<script src="js/jquery.js"></script>
<script>
	$("#EditDetails").click(function(){
			$("#EditForm").fadeToggle();
	});
	$("#Ad").click(function(){
		
			$("#addDoctorData").fadeToggle(1000);
	});
	$("#ap").click(function(){
		
		$("#addPatientData").fadeToggle(1000);
});
	
</script>
</body>
</html>
