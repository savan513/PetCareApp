<!DOCTYPE html>
<html lang="en">
<head>
  <title>Health Paw</title>
  <meta charset="utf-8">
   <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="js/OwnerValidation.js"></script>
   <script src="js/DoctorValidation.js"></script>
  
  <style type="text/css">
 :root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background-image: url("images/Wallpaper.jpg");
  background-repeat: no-repeat;
   height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-img-left {
  width: 45%;
  /* Link to your background image using in the property below! */
  background: scroll center url("images/pet.jpg");
  background-size: cover;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}
  </style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-9 mx-auto">
        <div class="card card-signin flex-row my-5">
          <div class="card-img-left d-none d-md-flex">
             <!-- Background image for card set in CSS! -->
          </div>
          <div class="card-body">
            <h5 class="card-title text-center"><b>Register</b></h5>
			<label class="radio-inline"><input type="radio" id="rd1" name="optradio" value="Owner" checked>Owner</label>
			<label class="radio-inline"><input type="radio" id="rd2" name="optradio" value="Doctor">Doctor</label>
			<label class="radio-inline"><input type="radio" id="rd3" name="optradio" value="Rep">Receptionist</label>
            <div id="Owner">
			 <form class="form-signin" onSubmit="return fun1()" action="register" method = "POST">
              <div class="form-label-group">
                <input type="text" id="inputUserame" name="first_name"class="form-control" placeholder="Username" required autofocus>
                <label for="inputUserame">Username</label>
              </div>
			<div class="form-label-group">
                <input type="text" id="Mobile" class="form-control" placeholder="Mobile No"  name="mb" required >
                <label for="Mobile">Mobile No</label>
               
              </div>
			<div style="font-size:20;margin:10px;dislpay:inline-block;">
				<h5>Gender: </h5> 
                <input type="radio" id="Gender"   name="mb"  value="male" required>Male
                <input type="radio" id="Gender"   name="mb"  value="Female" required>FeMale
             
               
              </div>
				 
              <div class="form-label-group">
                <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="email" required>
                <label for="inputEmail">Email address</label>
              </div>
              
              
              <div class="form-label-group">
                <input type="password" id="inputPassword" class="form-control" placeholder="Password"  name="pass" required>
                <label for="inputPassword">Password</label>
              </div>
              <div class="form-label-group">
                <input type="password" id="inputPasswordC" class="form-control" placeholder="Password"  name="passc" required>
                <label for="inputPasswordC">Confirm Password</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="City" class="form-control" placeholder="City"  name="City" required>
                <label for="City">City</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="State" class="form-control" placeholder="State"  name="State" required>
                <label for="State">State</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="Country" class="form-control" placeholder="Country"  name="Country" required>
                <label for="Country">Country</label>
              </div>
  				<!-- <div class="form-label-group">
            	<input type="file" name="image" required="required"/><br/><br/>
             	</div> -->
              <input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">
              <a class="d-block text-center mt-2 small" href="#">Sign In</a>
              <hr class="my-4">
            <!--   <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign up with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook</button> -->
            </form>
			</div>
			
			
			<div id="Doctor" style="display:none">
			 <form class="form-signin" onSubmit="return fun2()" action="DoctorRegister" method = "POST">
              <div class="form-label-group">
                <input type="text" id="DrUserame" name="first_name"class="form-control" placeholder="Username" required autofocus>
                <label for="DrUserame">Username</label>
              </div>
				<div style="font-size:20;margin:10px;dislpay:inline-block;">
				<h5>Gender: </h5> 
                <input type="radio" id="Gender"   name="Gender"  value="Male" required>Male
                <input type="radio" id="Gender"   name="Gender"  value="FeMale" required>FeMale
             
               
              </div>
				 
              <div class="form-label-group">
                <input type="email" id="DrEmail" class="form-control" placeholder="Email address" name="email" required>
                <label for="DrEmail">Email address</label>
              </div>
              
              <div class="form-label-group">
                <input type="text" id="DrMobile" class="form-control" placeholder="Mobile No"  name="mb" required >
                <label for="DrMobile">Mobile No</label>
               
              </div>
				 
              <div class="form-label-group">
                <input type="password" id="DrPassword" class="form-control" placeholder="Password"  name="pass" required>
                <label for="DrPassword">Password</label>
              </div>
              <div class="form-label-group">
                <input type="password" id="DrPasswordC" class="form-control" placeholder="Password"  name="passc" required>
                <label for="DrPasswordC">Confirm Password</label>
              </div>
			  <div class="form-label-group">
                <input type="text" id="YOE" class="form-control" placeholder="YearOfExperience"  name="YearOfExperience" required >
                <label for="YOE">Year Of Experiance</label>
               
              </div>
			  <div class="form-label-group">
                <input type="text" id="Exprt" class="form-control" placeholder="Expertise"  name="Expertise" required >
                <label for="Exprt">Expertise</label>
               
              </div>
              <div class="form-label-group">
                <input type="text" id="DrCity" class="form-control" placeholder="City"  name="City" required>
                <label for="DrCity">City</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="DrState" class="form-control" placeholder="State"  name="State" required>
                <label for="DrState">State</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="DrCountry" class="form-control" placeholder="Country"  name="Country" required>
                <label for="DrCountry">Country</label>
              </div>
  				<!-- <div class="form-label-group">
            	<input type="file" name="image" required="required"/><br/><br/>
             	</div> -->
              <input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">
              <a class="d-block text-center mt-2 small" href="#">Sign In</a>
              <hr class="my-4">
            <!--   <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign up with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook</button> -->
            </form>
            
            
			</div>
				<div id="Rep" style="display:none">
			 <form class="form-signin" onSubmit="return fun3()" action="HospitalRegister" method = "POST">
              <div class="form-label-group">
                <input type="text" id="HpUserame" name="first_name"class="form-control" placeholder="Username" required autofocus>
                <label for="HpUserame">Username</label>
              </div>

              <div class="form-label-group">
                <input type="email" id="HpEmail" class="form-control" placeholder="Email address" name="email" required>
                <label for="HpEmail">Email address</label>
              </div>
              <div style="font-size:20;margin:10px;dislpay:inline-block;">
				<h5>Gender: </h5> 
                <input type="radio" id="Gender"  name="Gender"  value="male" required>Male
                <input type="radio" id="Gender"  name="Gender"  value="Female" required>FeMale
             
               
              </div>
				 
              <div class="form-label-group">
                <input type="text" id="HpMobile" class="form-control" placeholder="Mobile No"  name="mb" required >
                <label for="HpMobile">Mobile No</label>
               
              </div>
				 
              <div class="form-label-group">
                <input type="password" id="HpPassword" class="form-control" placeholder="Password"  name="pass" required>
                <label for="HpPassword">Password</label>
              </div>
              <div class="form-label-group">
                <input type="password" id="HpPasswordC" class="form-control" placeholder="Password"  name="passc" required>
                <label for="HpPasswordC">Confirm Password</label>
              </div>
			  <div class="form-label-group">
                <input type="text" id="Hospital_Name" class="form-control" placeholder="Hospital_Name"  name="Hospital_Name" required >
                <label for="Hospital_Name">Hospital_Name</label>
               
              </div>
              <div class="form-label-group">
                <textarea rows="8" cols="40" id="HpDept" name="Descritption"></textarea>
                <label for="HpDept">Hospital_Description</label>
               
              </div>
			  <div class="form-label-group">
                <input type="text" id="Hospital_Add" class="form-control" placeholder="Hospital_Add"  name="Hospital_Add" required >
                <label for="Hospital_Add">Hospital_Add</label>
               
              </div>
              <div class="form-label-group">
                <input type="text" id="DrCity" class="form-control" placeholder="City"  name="City" required>
                <label for="DrCity">City</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="DrState" class="form-control" placeholder="State"  name="State" required>
                <label for="DrState">State</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="DrCountry" class="form-control" placeholder="Country"  name="Country" required>
                <label for="DrCountry">Country</label>
              </div>
  				<!-- <div class="form-label-group">
            	<input type="file" name="image" required="required"/><br/><br/>
             	</div> -->
              <input class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" name="Saveit" value="Insert">
              <a class="d-block text-center mt-2 small" href="#">Sign In</a>
              <hr class="my-4">
            <!--   <button class="btn btn-lg btn-google btn-block text-uppercase" type="submit"><i class="fab fa-google mr-2"></i> Sign up with Google</button>
              <button class="btn btn-lg btn-facebook btn-block text-uppercase" type="submit"><i class="fab fa-facebook-f mr-2"></i> Sign up with Facebook</button> -->
            </form>
			</div>
            <% 
					if(null!=request.getAttribute("ErrorMessage"))
				    {
						out.println("<style=\"font-color:red\">");
				        out.println("<b>"+request.getAttribute("ErrorMessage")+"<b>");
				    }
					%>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="js/jquery.js"></script>
  <script>
  
		$("#rd1").click(function(){
			check();
		})
		$("#rd2").click(function(){
			check();
		})
		$("#rd3").click(function(){
			check();
		})
		function check(){
	
			if($("#rd1").prop("checked"))
  			{
  				$("#Owner").show();
  				$("#Doctor").hide();
  				$("#Rep").hide();
  			}
  		else if($("#rd2").prop("checked"))
			{
  			
				$("#Doctor").show();
				$("#Owner").hide();
				$("#Rep").hide();
			}
  		else if($("#rd3").prop("checked"))
		{
			
			$("#Doctor").hide();
			$("#Owner").hide();
			$("#Rep").show();
		}
		}
  		
  		
  </script>
</body>
</html>
