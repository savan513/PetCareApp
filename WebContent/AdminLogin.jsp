<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<style>
	body{
		 background-image: url("images/Woody.jpg");
		 background-repeat: no-repeat;
		 background-attachment: fixed;
  		 background-size: cover;
		 font-size: 1.600em;
	}
	form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>

<body  text="red">
<div class="container">
	<div class="col-sm-4" style="margin-left:360px;margin-right:360px">
	<h2>Admin Login Form</h2>

<form action="AdminLoginProcess" method="post">
  <div class="imgcontainer">
    <img src="images/editclip.jpg" alt="Avatar" class="avatar" style="width:150px;height:130px;">
  </div>

  <div class="container">
    <label for="uname"><b>Admin Name</b></label>
    <input type="text" placeholder="Enter Admin Name" name="aname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>
        
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
</div>
				<% 
					if(null!=request.getAttribute("errorMessage"))
				    {
					%>
					<script>
						function myFunction(Str) {
						  alert(Str);
						}
						myFunction("Wrong Password And Name");
						</script>
					<%
				    }
					%>
</div>
</body>
</html>