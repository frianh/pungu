<!DOCTYPE html>
<html lang="en">
<head></head>

<body>
	<h5 class="h5 bg-dark text-white text-sm-left">Follow Instagram Kami</h5>
	<nav class="navbar navbar-light">
	  <a class="navbar-brand" href="https://www.instagram.com/pungujayaabadi/" target="_blank">
	    <img src="<%=request.getContextPath()%>/image/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
	    Pungu Jaya Abadi
	  </a>
	</nav>
	
	<div class="gallery">
		<div class="row">
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/1.jpeg" style="height: 100px; width: 100px">
			</div>
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/2.jpeg" style="height: 100px; width: 100px">
			</div>
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/3.jpeg" style="height: 100px; width: 100px">
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/4.jpeg" style="height: 100px; width: 100px">
			</div>
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/5.jpeg" style="height: 100px; width: 100px">
			</div>
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/6.jpeg" style="height: 100px; width: 100px">
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/7.jpeg" style="height: 100px; width: 100px">
			</div>
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/8.jpeg" style="height: 100px; width: 100px">
			</div>
			<div class="col-4">
				<img alt="instagram image" src="<%=request.getContextPath()%>/image/9.jpeg" style="height: 100px; width: 100px">
			</div>
		</div>
		<br>
	</div>
	
	<br>
	<div>
		<small>
			<a href="https://www.instagram.com/pungujayaabadi/" target="_blank">Untuk lihat lebih banyak, silahkan kunjungi INSTAGRAM kami
			<img alt="instagram icon" src="<%=request.getContextPath()%>/image/ig.png" style="height: 20px; width: 20px">
			</a>
		</small>
	</div>
	
	<br>
	<div id="social-med" class="text-center text-black-50">
		<small>
			Ikuti Kami :
			<br>
			<img alt="instagram icon" src="<%=request.getContextPath()%>/image/ig.png" height="15px" width="15px">
			<img alt="facebook icon" src="<%=request.getContextPath()%>/image/fb.png" height="15px" width="15px">
			<img alt="twitter icon" src="<%=request.getContextPath()%>/image/twitter.png" height="15px" width="15px">
			<br>
		</small>
	</div>
	<br>
	<div class="bg-light text-center text-black-50">
		<small>
			<a href="index.jsp">Home | </a> 
			<a href="<%=request.getContextPath()%>/profile">Profil | </a>
			<a href="<%=request.getContextPath()%>/service">Service | </a>
			<a href="<%=request.getContextPath()%>/contact">Info Kontak</a>
		</small>
	</div>
</body>
</html>