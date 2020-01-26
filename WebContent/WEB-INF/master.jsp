<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/custom.css">
	<link rel="icon" href="image/logo.png">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  		<a class="navbar-brand" href="#">
    		<img src="image/logo.png" width="50" height="50" alt="">
  		</a>
  
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>

  		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      			<li class="nav-item">
        			<a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="profile.jsp">Profil</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="service.jsp">Service</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="contact.jsp">Info Kontak</a>
      			</li>
    		</ul>
    		
    		<form class="form-inline my-2 my-lg-0">
      			<input class="form-control mr-sm-2" type="search" placeholder="Search">
      			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    		</form>
  		</div>
	</nav>
	
	<div class="container-fluid">
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
	  		<ol class="carousel-indicators">
	    		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
	    		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
	    		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
	  		</ol>
	  		
	  		<div class="carousel-inner">
	    		<div class="carousel-item active">
	      			<img class="d-block w-100" src="image/master1.jpg" alt="First slide" style="height: 400px">
	  				<div class="carousel-caption text-right d-none d-md-block">
	    				<h4>Pungu Jaya Logistic</h4>
	    				<p>Murah Cepat Aman</p>
	    				<p>Kami Komitmen menjaga kepercayaan customer</p>
	  				</div>
	    		</div>
	    		<div class="carousel-item">
	  				<img class="d-block w-100" src="image/master2.jpeg" alt="Second slide" style="height: 400px">
	  				<div class="carousel-caption text-right d-none d-md-block">
	    				<h4>Pungu Jaya Logistic</h4>
	    				<p>Mudah menghubungi kami</p>
	  				</div>
				</div>
	    		<div class="carousel-item">
	  				<img class="d-block w-100" src="image/master3.jpeg" alt="Third slide" style="height: 400px">
	  				<div class="carousel-caption text-right d-none d-md-block">
	    				<h4>Pungu Jaya Logistic</h4>
	    				<p>Berpengalaman Dalam Pengiriman Barang</p>
	  				</div>
				</div>
	  		</div>
	  		
	  		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
	    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    		<span class="sr-only">Previous</span>
	  		</a>
	  		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
	    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
	    		<span class="sr-only">Next</span>
	  		</a>
		</div>
	</div>
</body>

<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
	$('.carousel').carousel({
		interval: 5000
		})
</script>
</html>