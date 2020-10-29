<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
<link href="assets/css/tabcss.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>

	.filterable {
    margin-top: 15px;
}
.filterable .panel-heading .pull-right {
    margin-top: -20px;
}
.filterable .filters input[disabled] {
    background-color: transparent;
    border: none;
    cursor: auto;
    box-shadow: none;
    padding: 0;
    height: auto;
}
.filterable .filters input[disabled]::-webkit-input-placeholder {
    color: #333;
}
.filterable .filters input[disabled]::-moz-placeholder {
    color: #333;
}
.filterable .filters input[disabled]:-ms-input-placeholder {
    color: #333;
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
<script>
function showHideDiv(ele,ele1) {
	var srcElement = document.getElementById(ele);
	var srcElement1 = document.getElementById(ele1);
	if (srcElement != null) {
		if (srcElement.style.display == "block") {
			srcElement.style.display = 'none';
		}
		else {
			srcElement.style.display = 'block';
		}
		
	}
	if (srcElement1 != null) {
		if (srcElement1.style.display == "block") {
			srcElement1.style.display = 'none';
		}
		else {
			srcElement1.style.display = 'block';
		}
		
	}
}
function openCity(evt, cityName) {
	  // Declare all variables
	  var i, tabcontent, tablinks;

	  // Get all elements with class="tabcontent" and hide them
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }

	  // Get all elements with class="tablinks" and remove the class "active"
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }

	  // Show the current tab, and add an "active" class to the button that opened the tab
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
</script>
<style>

.Showsme
    {
     
      margin-top:70px;
    }

.img-upload-btn { 
    position: relative; 
    overflow: hidden; 
    padding-top: 95%;
} 

.img-upload-btn input[type=file] { 
    position: absolute; 
    top: 0; 
    right: 0; 
    min-width: 100%; 
    min-height: 100%; 
    font-size: 100px; 
    text-align: right; 
    filter: alpha(opacity=0); 
    opacity: 0; 
    outline: none; 
    background: white; 
    cursor: inherit; 
    display: block; 
} 

.img-upload-btn i { 
    position: absolute;
    height: 16px;
    width: 16px;
    top: 50%;
    left: 50%;
    margin-top: -8px;
    margin-left: -8px;
}

.btn-radio {
    position: relative; 
    overflow: hidden; 
}

.btn-radio input[type=radio] { 
    position: absolute; 
    top: 0; 
    right: 0; 
    min-width: 100%; 
    min-height: 100%; 
    font-size: 100px; 
    text-align: right; 
    filter: alpha(opacity=0); 
    opacity: 0; 
    outline: none; 
    background: white; 
    cursor: inherit; 
    display: block; 
}
	.pic
{
     margin-top:50px; 
     width:120px;
     margin-left:50px;
     margin-bottom:-60px;
}

.panel
{
    background-image:url("images/Wallpaper.jpg"); 
    background-repeat: no-repeat;
    background-size: cover;
}

.name
{
    position:absolute;
    padding-left:200px;
    font-size:30px;
}

.dropdown
{
    position:absolute;
}

.change
{
 position:relative; 
 bottom:20px;
 padding:1px;
 color:white;
 text-decoration:none;
}


.change:hover
{
 text-decoration:none;
 background-color:black;
 color:white;
}

img {
   background-image: url("images/clipart.jpg"); 
}
hr {
  border-top: 1px dashed green;
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
    %>
	<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<nav class="navbar navbar-inverse container" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Health Paw</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    
      <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
          <a href="#" > Hello ${UserName} </a>
         
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<div class="container">
	<div class="row well">
		<div class="col-md-2">
    	    <ul class="nav nav-pills nav-stacked well">
     
              <li><a href="Home.jsp"><i class="fa fa-home"></i> Home</a></li>
              <li><a href="Edit.jsp"><i class="fa fa-user"></i>Edit Profile</a></li>
              <li><a href="AddPet.jsp"><i class="fa fa-key"></i> Add Pet Details</a></li>
              <li><a href="Lgout"><i class="fa fa-sign-out"></i> Logout</a></li>
            </ul>
        </div>
        <div class="col-md-10">
                <div class="panel">
                	<%
                	 String Pic="",Uid="";
                	String FPIC="";
                    try{
                    Class.forName("com.mysql.jdbc.Driver");  
          			 Uid=(String)session.getAttribute("UserId");
          			Connection con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/db1","root","");  
          			//Statement stmt=con.createStatement();  
          			PreparedStatement stmt=con.prepareStatement("select * from ownerreg where UID=?");  
          			
          			stmt.setString(1,Uid);  
          			ResultSet rs=stmt.executeQuery();
          			if(rs.next())
          			{	    
 						Pic=rs.getString("image");
          				FPIC="images/"+Pic;
          				//System.out.print(FPIC);
                	%>     		
                	
   					<img class="pic img-circle" src="<%=FPIC%>">
					
					<%
          			}
                    }catch(Exception e)
                    {}
					%>              
                </div>
               
    <br><br><br>
    
 
    </div>

     </div>
	</div>
  
</div>
<div class="container">
<div class="tab">
  <button class="tablinks col-md-6" onclick="openCity(event, 'My Pet Info')">My Pet Info</button>
 
  <button class="tablinks col-md-6" onclick="openCity(event, 'Hosiptal Appointment')">Hosiptal Appointment</button>
</div>
</div>
<div class="container tabcontent" id="My Pet Info">
	<sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from petdetails where UID=<%= session.getAttribute("UserId")%>;
      </sql:query>
 	<c:forEach var = "row" items = "${result.rows}">
 		<div>
 		<div style="float:right">
  		
  		<img src="images/<c:out value = "${row.image}"/>" id="img" alt="Insert Your Pet Image" onclick="Display()" style="display:block;width:350px;height:230px;margin-left:5px;">
  		
 		<form id="divimg" action="PetImageChange?id=	<c:out value="${row.id }"/>" method="POST" style="color:black; float:right" enctype='multipart/form-data'>
	    	 <input type="file" name="image"  onchange="readURL(this);"><br/>
             <img src="#"  style="width:230px;height:230px;display:none"> 
             <input type="submit" id="sv" disabled=true value="Save Changed Image" class="btn btn-primary"/> 
            	
    	</form>
 		
 		</div>
 		
 			<br><br>	
			<b>Pet Name : </b><c:out value = "${row.P_Name}"/><br/>
			<b>Pet Age : </b><c:out value = "${row.P_Age}"/><br/>
			<b>Pet Type : </b><c:out value = "${row.P_Type}"/><br/>
			<b>Other Description: </b><c:out value = "${row.Other_Dip}"/><br/><br>
			<a href="AddPet.jsp?id=<c:out value = "${row.id}"/>" class="btn btn-success">Edit Details</a>
			<a href="DeletePet?id=<c:out value = "${row.id}"/>" class="btn btn-warning">Delete</a>
			
			 
			 <br><br><hr width="80%">
		 </div>
		 
 	</c:forEach>
  
</div>
<div class="container tabcontent" id="Hosiptal Appointment">

      <div class="panel panel-primary filterable">
            <div class="panel-heading">
                <h3 class="panel-title">Users</h3>
                <div class="pull-right">
                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr class="filters" style="background-color:cyan;font-color:white">
                        <th><input type="text" class="form-control" placeholder="#" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Email" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Doctor Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Hospital_Name" disabled></th>
                        <th><input type="text" class="form-control" placeholder="PetType" disabled></th>
                        <th><input type="text" class="form-control" placeholder="Date" disabled></th>
                        
                        <th><input type="text" class="form-control" placeholder="Time" disabled></th>
                         <th><input type="text" class="form-control" placeholder="Reason" disabled></th>
                         <th><input type="text" class="form-control" placeholder="Status" disabled></th>
                    </tr>
                </thead>
                <tbody>
          <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      <sql:query dataSource = "${db}" var = "result">
         SELECT * from appointment where o_id="<%=Id %>"
      </sql:query>
  <c:forEach var = "row" items = "${result.rows}">
                            <tr style="background-color:lightpink;">
                            <td>${row.Id }</td>
							<td>${row.Name }</td>
							<td>${row.Email }</td>
							<td>${row.DName}</td>
							<td>${row.HName}</td>
							<td>${row.Pet_Type }</td>
							
							<td>${row.Date }</td>                     
    						<td>${row.Time }</td>
    						<td>${row.Reason }</td>
    						
    						<c:if test = "${row.Status == 0}">
    						<td style="color:blue;font-weight:bold;">Pending</td>
    						</c:if>
    						<c:if test = "${row.Status == 1}">
    						<td style="color:yellow;font-weight:bold;">Wait For Doctor</td>
    						</c:if>
    						<c:if test = "${row.Status == 2}">
    						<td style="color:green;font-weight:bold;">Success</td>
    						</c:if>
    						<c:if test = "${row.Status == 3}">
    						<td style="color:red;font-weight:bold;">Cancel</td>
    						</c:if>
						</tr>
</c:forEach>
                </tbody>
            </table>
        </div>
</div>
<script>
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
});
</script>
</body>
</html>