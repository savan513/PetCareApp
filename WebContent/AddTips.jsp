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
<title>Add Pet Care Tips</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    <style>
      html, body {
      min-height: 100%;
      }
      body, div, form, input, select, p { 
      padding: 0;
      margin: 0;
      outline: none;
      font-family: Roboto, Arial, sans-serif;
      font-size: 14px;
      color: #666;
      line-height: 22px;
      }
      h1 {
      position: absolute;
      margin: 0;
      font-size: 32px;
      color: #fff;
      z-index: 2;
      }
      h2 {
      font-weight: 400;
      }
      .testbox {
      display: flex;
      justify-content: center;
      align-items: center;
      height: inherit;
      padding: 20px;
      }
      form {
      width: 100%;
      padding: 20px;
      border-radius: 6px;
      background: #fff;
      box-shadow: 0 0 20px 0 #095484; 
      }
      .banner {
      position: relative;
      height: 210px;
      background-image: url("images/HomeTreatment.jpg");  
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      }
      .banner::after {
      content: "";
      background-color: rgba(0, 0, 0, 0.4); 
      position: absolute;
      width: 100%;
      height: 100%;
      }
      input, select {
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
      }
      input {
      width: calc(100% - 10px);
      padding: 5px;
      }
      select {
      width: 100%;
      padding: 7px 0;
      background: transparent;
      }
      .item:hover p, .item:hover i, .question:hover p, .question label:hover, input:hover::placeholder, a {
      color: #095484;
      }
      .item input:hover, .item select:hover {
      border: 1px solid transparent;
      box-shadow: 0 0 6px 0 #095484;
      color: #095484;
      }
      .item {
      position: relative;
      margin: 10px 0;
      }
      input[type="date"]::-webkit-inner-spin-button {
      display: none;
      }
      .item i, input[type="date"]::-webkit-calendar-picker-indicator {
      position: absolute;
      font-size: 20px;
      color: #a9a9a9;
      }
      .item i {
      right: 2%;
      top: 30px;
      z-index: 1;
      }
      [type="date"]::-webkit-calendar-picker-indicator {
      right: 1%;
      z-index: 2;
      opacity: 0;
      cursor: pointer;
      }
      input[type=checkbox]  {
      display: none;
      }
      label.check {
      position: relative;
      display: inline-block;
      margin: 5px 20px 10px 0;
      cursor: pointer;
      }
      .question span {
      margin-left: 30px;
      }
      span.required {
      margin-left: 0;
      color: red;
      }
      label.check:before {
      content: "";
      position: absolute;
      top: 2px;
      left: 0;
      width: 16px;
      height: 16px;
      border-radius: 2px;
      border: 1px solid #095484;
      }
      input[type=checkbox]:checked + .check:before {
      background: #095484;
      }
      label.check:after {
      content: "";
      position: absolute;
      top: 6px;
      left: 4px;
      width: 8px;
      height: 4px;
      border: 3px solid #fff;
      border-top: none;
      border-right: none;
      transform: rotate(-45deg);
      opacity: 0;
      }
      input[type=checkbox]:checked + label:after {
      opacity: 1;
      }
      .btn-block {
      margin-top: 10px;
      text-align: center;
      }
      button {
      width: 150px;
      padding: 10px;
      border: none;
      border-radius: 5px; 
      background: #095484;
      font-size: 16px;
      color: #fff;
      cursor: pointer;
      }
      button:hover {
      background: #0666a3;
      }
      @media (min-width: 568px) {
      .name-item, .city-item {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      }
      .name-item input, .city-item input {
      width: calc(50% - 20px);
      }
      .city-item select {
      width: calc(50% - 8px);
      }
      }
    </style>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
  border-radius:5px; 
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
   <a href="#" style="background-color:maroon;font-weight:bold;">Health Paw</a>
    </li>
  <li><a href="DoctorPanel.jsp">Home</a></li>
  <li><a href="AddTips.jsp">Add Tips</a></li>
 
   <li style="float:right"><a class="active" href="Lgout"><i class="fa fa-user-md"></i> Logout</a></li>
</ul>

<div class="row container" style="margin-top:10px;">
<div class="md-4" style="margin-left:100px;width:350px;padding:20px;">
	<h3 style="color:green;padding:10px;border:2px solid red;border-radius:4px;background-color:pink;">Insert Image Here</h3>
	<img src="images/ImageInsert.jpg" id="img" alt="Insert Your Pet Image" onclick="Display()" style="display:block;width:350px;height:230px;margin-left:5px;">
  		
 		<form id="divimg" action="AddTipImage" method="POST" style="color:black; float:right" enctype='multipart/form-data'>
	    	
	    	
             <input type="submit" id="sv" disabled=true value="Save_Changed_Image" class="btn btn-primary" name="EditHspDP"/> 
            	
    	</form>
</div>
<div class="md-8" style="margin-left:50px;width:600px;padding:20px;" >
	<h3 style="color:orange;padding:10px;border:2px solid purple;border-radius:4px;background-color:cyan;text-align:center;">Insert Home Made Care Tips</h3>
	<div class="testbox">
      <form action="AddTips" method="POST" enctype='multipart/form-data'>
        <div class="banner">
          <h1>Tips Application Form</h1>
        </div>
        <h2>Details</h2>
        <div class="item">
          <p>Title</p>
          <div class="name-item">
            <input type="text" name="Title" style="width:300px;"placeholder="First"/>
            
          </div>
        </div>
        <div class="item">
          <p>Specially For(Pet Type)</p>
          <div class="name-item">
            <input type="text" name="type" placeholder="Type"/>
            
          </div>
        </div>
        <div class="item">
          <p>Title</p>
          <div class="name-item">
            <textarea rows="10" cols="60" name="Dcp">Insert Description Here</textarea>
          </div>
        </div>
         <input type="file" name="image"  onchange="readURL(this);"><br/>
        <div class="item">
          
          <div class="name-item">
            <input type="submit" value="Submit" class="btn btn-success">
          </div>
        </div>
       </form>
       </div>
</div>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>