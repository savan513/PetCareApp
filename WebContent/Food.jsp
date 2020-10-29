<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Health Paw</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(document).ready(function() {
	  $("#Showme").click(function() {
	    $("#Block").toggle();
	    $("#hideonclick").toggle();
	  });
	});
  $(document).ready(function() {
	  $("#Showmeagain").click(function() {
	    $("#Block").toggle();
	    $("#hideonclick").toggle();
	  });
	});
  </script>
<style type="text/css">
    .bs-example{
        margin: 20px;
    }
    .Shopsme
    {
      display: none;
      margin-top:70px;
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
          String Name=(String)session.getAttribute("UserName");
        %>
<div class="bs-example">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a href="Home.jsp" class="navbar-brand">Health Paw</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav">
            	 <a href="#" class="nav-item nav-link"><b>Hi ${UserName}</b></a>
                <a href="Home.jsp" class="nav-item nav-link">Home</a>
                
                <a href="Profile.jsp" class="nav-item nav-link">My Profile</a>
                <a href="Lgout" class="nav-item nav-link">Logout</a>
               
            </div>
            
        </div>
        	<form action="#" method="post" novalidate="novalidate">
            <div class="row">
           
                <div class="col-lg-10">
                    <div class="row">
                        <div>
            	<input type='checkbox' name="Near"><font style="color:White">Nearby ME</font><i class='fas fa-map-marker-alt' style='font-size:24px;color:red'></i>
            </div>
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                        
                           <input type="text" class="form-control" placeholder="Search" style="margin-left:40px;width:170px">
                        </div>
                       
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <button type="button" class="btn btn-danger wrn-btn" style="margin-left:125px">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </nav>
</div>
<div class="container">
 <div  class="row mt-1" id="hideonclick"> 
  <div class="card img-fluid" style="width:500px">
    <img class="card-img-top" src="images/cart.jpg" alt="Card image" style="width:100%">
    <div class="card-img-overlay">
     <h4 class="card-title">Online</h4>
      <a href="#" class="btn btn-primary">See More</a>
    </div>
  </div>
  <div class="card img-fluid" style="width:500px;margin-left:80px">
    <img class="card-img-top" src="images/Shop.jpg" alt="Card image" style="width:100%">
    <div class="card-img-overlay">
     <h4 class="card-title">Shops</h4>
      <a href="#" class="btn btn-primary" id="Showme">See More</a>
    </div>
  </div>
  </div>
</div>
<div class="Shopsme" id="Block">
	<a href="#" class="btn btn-primary" id="Showmeagain">Up</a>
	<hr>
	<div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="images/foodshop1.jpg" target="_blank">
          <img src="images/foodshop1.jpg" alt="Lights" style="width:100%">
          <div class="caption">
            <p>Address: 430, Lake Garden Rd, Vishal Nagar, Surat, Gujarat 395004 Phone: 097258 60049.</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="images/foodshop2.jpg" target="_blank">
          <img src="images/foodshop2.jpg" alt="Nature" style="width:100%">
          <div class="caption">
            <p>Address: Shop no 18, Panchvati Vadi, Opp.Jolly Enclave, Near Varachha Zone office, Trikamnagar, L.H Road,Varachha, Surat, Gujarat 395006 
Phone: 099097 79259</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="images/foodshop3.jpg" target="_blank">
          <img src="images/foodshop3.jpg" alt="Fjords" style="width:100%">
          <div class="caption">
            <p>Address: Hari Om Apartment, Shop no S-3, Ground Floor, opposite K & mp school, Amroli, Surat, Gujarat 394107 
Phone: 097277 70502</p>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>
</body>
</html>                            