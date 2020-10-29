<!DOCTYPE HTML>
<!--
	Urban by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Health Paw</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		<style>
		p{
	font-size:20px;
}
				.body
				{
					background-image: url("images/pet.jpg");
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
        %>
		<!-- Header -->
			<header id="header" class="alt">
				<div class="logo"><a href="Home.jsp">Welcome ${UserName} to Health Paw</a></div>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					
					<li><a href="Profile.jsp">My Profile</a></li>
					
					<li><a href="clinics.jsp">Clinics and NGO's</a></li>
					<li><a href="CareTip.jsp">Pet Care Tips</a></li>
					<li><a href="http://127.0.0.1:8000/">Food and Accessories</a></li>
					
					<li><a href="Lgout?">LogOut</a></li>
				</ul>
			</nav>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Welcome Pet Lovers</h1>
						<p>Offers Everything pet owner need to Care for pets<br>Website is to manage and provide pet related information and also track pet's location<br /></p>
					</header>
					<a href="#main" class="button big scrolly">Learn More</a>
				</div>
			</section>
	<marquee>
	<div style="margin-top:10px">		  
			
				<img src="images/Slide_1.jpg" width="500" height="300">
				<img src="images/Slide_2.jpg" width="500" height="300" style="margin-left:10px">
				<img src="images/Slide_3.jpg" width="500" height="300" style="margin-left:10px">
				<img src="images/Slide_4.jpg" width="500" height="300" style="margin-left:10px">
				<img src="images/Slide_5.jpg" width="500" height="300" style="margin-left:10px">
				<img src="images/Slide_6.jpg" width="500" height="300" style="margin-left:10px">
				<img src="images/Slide_7.jpg" width="500" height="300" style="margin-left:10px">
			
	</div>
	</marquee>
		<!-- Main -->
			<div id="main">

				<!-- Section -->
					<section class="wrapper style1">
						<div class="inner">
							<!-- 2 Columns -->
								<div class="flex flex-2">
									<div class="col col1">
										<div class="image round fit">
											<img class="img-rounded" src="images/PetOwner.jpg" alt="" />
										</div>
									</div>
									<div class="col col2">
										<h3>Somthing About Pets</h3>
										
										<p>A pet, or companion animal, is an animal kept primarily for a person's company, entertainment or as an act of compassion such as taking in and protecting a stray cat, rather than as a working animal, livestock or laboratory animal. Popular pets are often considered to have attractive appearances, intelligence and relatable personalities, but some pets may be taken in on an altruistic basis and accepted as they are.
											<br/>Popular Pets are:
											<ul>
											<li>Dogs</li>
											<li>Cats</li>
											<li>Rabits</li>
											<li>Horse</li>
											<li>Birds</li>
											</ul>
											 </p>
										
									</div>
								</div>
						</div>
					</section>

				<!-- Section -->
					<section class="wrapper style2">
						<div class="inner">
							<div class="flex flex-2">
								<div class="col col2">
									<h2>Basic Needs of a Pet</h2>
									
									<p>Having any pet requires taking of responsibility. It is never an easy thing to do as all pets, whatever you pet is, needs to be provided with their basic needs. Providing your pet's needs will tell them you
									 care for them and you love them. Hence, below are the basic needs any pet should be provided. You can meet a pet's basic welfare needs by giving it food, water, ventilation, and by protecting it from injury or ill health. Taking care of your pet also means meeting a pet's emotional needs, too </p>
									
								</div>
								<div class="col col1 first">
									<div class="image round fit">
									<img src="images/NeedOfPets.jpg" alt="" width="650" height="250"/>
									</div>
								</div>
							</div>
						</div>
					</section>

				<!-- Section -->
				

			</div>
			<div class="container">
		<h1 style="align:center">About Health Paw Website</h1>
		<p>This is Platform Where you get all information of Pets For Example How To select Pets ,
		 what are basic needs of Pets Homemade Treatment for Pets and etc. <br/>Other thing is That This website Provides you nearby pets clinic and NGOs. You Can Take Appointment for
		  your pets in clinics according to time table.<br/>There is Section where you buy or order online foods and Accessories for Your Pets </p>
		
		</div>
		<!-- Footer -->
			<footer id="footer">
				<div class="copyright">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-snapchat"><span class="label">Snapchat</span></a></li>
					</ul>
					<p>&copy; Untitled. All rights reserved. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Unsplash</a>.</p>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>