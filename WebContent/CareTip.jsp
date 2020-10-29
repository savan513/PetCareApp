<!doctype html>
<%@page import="java.sql.*,java.io.*,org.apache.commons.lang3.StringEscapeUtils" %>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
    <head>
        <title>Care Tips</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
      
        <style>
body {
  font-family: "Lato", sans-serif;
}

/* Fixed sidenav, full height */
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn, .button {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover, .button:hover {
  color: #f1f1f1;
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}
.dog , .cat , .horse{
    margin-left: 200px; /* Same as the width of the sidenav */
    font-size: 20px; /* Increased text to enable scrolling */
    padding: 0px 10px;
    display: none;
}

/* Add an active class to the active dropdown button */
.active {
  background-color: green;
  color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #262626;
  padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
  
</style>
    </head>
    <body>
        <div class="sidenav">
            <a href="Home.jsp">Home</a>
            <a href="Profile.jsp">Profile</a>
            <button class="dropdown-btn">Types 
              <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
           	  <button class="button" id="common" style="background-color:orange"> Common</button>
              <button class="button" id="b1"> Dog</button>
              <button class="button" id="catdta">Cat</button>
              <button class="button" onclick="horse()">Horse</button>
              <button class="button" id="Birdsdata">Birds</button>
            </div>
            <a href="Lgout">Logout</a>
          </div>
      <div class="container">
         <sql:setDataSource var = "db" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/db1"
         user = "root"  password = ""/>
 
      
      <!-- Main COntent -->
      <div class="main">
        <sql:query dataSource = "${db}" var = "result">
         SELECT * from tips;
      </sql:query>		

     
     <c:forEach var = "row" items = "${result.rows}">
     <div>
     <div style="float:right">
  	 <c:if test="${row.Image!=null}">
  		<img src="images/<c:out value = "${row.Image}"/>" alt="" style="display:block;width:350px;height:230px;margin-left:5px;">
  	</c:if>	
 	 </div>
 		<h3><c:out value = "${row.Number}"/> <c:out value = "${row.Heading}"/></h3>
 		<p style="font-size:15px;color:purple;text-indent:10%"><c:out value = "${row.Content}"/></p>
 		<small>Doctor Name : <c:out value="${row.Doctor_Name }"></c:out></small>
 	</div><br/><br/><br/><br/><br/><br/>
 	</c:forEach>
    
      </div>
      
     <div class="dog">
       <sql:query dataSource = "${db}" var = "result">
         SELECT * from tips where Specially="dogs" or Specially="Dogs";
      </sql:query>		

 		<c:forEach var = "row" items = "${result.rows}">
 		     <div style="float:right">
  			<c:if test="${row.Image!=null}">
  				<img src="images/<c:out value = "${row.Image}"/>" alt="" style="display:block;width:350px;height:230px;margin-left:5px;">
  			</c:if>
  			 
  			
 	 		</div>
 		<h3><c:out value = "${row.Number}"/> <c:out value = "${row.Heading}"/></h3>
 		<p style="font-size:15px;color:purple;text-indent:10%"><c:out value = "${row.Content}"/></p>
 	</c:forEach>
          </div>
          <div class="cat">
               <sql:query dataSource = "${db}" var = "result">
         SELECT * from tips where Specially="cat" or Specially="Cat";
      </sql:query>		

 		<c:forEach var = "row" items = "${result.rows}">
 		     <div style="float:right">
  			<c:if test="${row.Image!=null}">
  				<img src="images/<c:out value = "${row.Image}"/>" alt="" style="display:block;width:350px;height:230px;margin-left:5px;">
  			</c:if>
  			 
  			
 	 		</div>
 		<h3><c:out value = "${row.Number}"/>) <c:out value = "${row.Heading}"/></h3>
 		<p style="font-size:15px;color:purple;text-indent:10%"><c:out value = "${row.Content}"/></p>
 	</c:forEach>
          </div>
          <div class="horse">
               <sql:query dataSource = "${db}" var = "result">
         SELECT * from tips where Specially="horse" or Specially="Horse";
      </sql:query>		

 		<c:forEach var = "row" items = "${result.rows}">
 		     <div style="float:right">
  			<c:if test="${row.Image!=null}">
  				<img src="images/<c:out value = "${row.Image}"/>" alt="" style="display:block;width:350px;height:230px;margin-left:5px;">
  			</c:if>
  			 
  			
 	 		</div>
 		<h3><c:out value = "${row.Number}"/><c:out value = "${row.Heading}"/></h3>
 		<p style="font-size:15px;color:purple;text-indent:10%"><c:out value = "${row.Content}"/></p>
 	</c:forEach>
          </div>
         </div>
    </body>             
    <script src="js/jquery.js" type="text/javascript"></script>
   
    <script>
        var dropdown = document.getElementsByClassName("dropdown-btn");
        var i;

        for (i = 0; i < dropdown.length; i++) {
            dropdown[i].addEventListener("click", function() {
                this.classList.toggle("active");
                var dropdownContent = this.nextElementSibling;
                if (dropdownContent.style.display === "block") {
                    dropdownContent.style.display = "none";
                } else {
                    dropdownContent.style.display = "block";
            }
            });
        }
       
           $("#b1").click(function(){
            $(".main").css("display","none");
            $(".cat").css("display","none");
            $(".horse").css("display","none");
            $(".dog").fadeIn();

           });
           
           $("#common").click(function(){
               $(".dog").css("display","none");
               $(".cat").css("display","none");
               $(".horse").css("display","none");
               $(".main").fadeIn();

              });
        
           $("#catdta").click(function()
        {
            $(".main").css("display","none");
            $(".dog").css("display","none");
            $(".horse").css("display","none");
            $(".cat").fadeIn();
        });
        function horse()
        {
            $(".main").css("display","none");
            $(".cat").css("display","none");
            $(".dog").css("display","none");
            $(".horse").fadeIn();
        }
    </script>
</html>
