<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top small">
  		<a class="navbar-brand" href="<%=request.getContextPath()%>">
    		<img src="<%=request.getContextPath()%>/image/logo.png" width="50" height="50" alt="">
  		</a>
  
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>

  		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      			<li class="nav-item">
        			<a class="nav-link border-bottom" href="<%=request.getContextPath()%>">Dashboard<span class="sr-only">(current)</span></a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link border-bottom" href="<%=request.getContextPath()%>/profile">Profil</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link border-bottom" href="<%=request.getContextPath()%>/service">Service</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link border-bottom" href="<%=request.getContextPath()%>/contact">Info Kontak</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link border-bottom" href="<%=request.getContextPath()%>/simulation">Simulasi</a>
      			</li>
      			<c:if test="${sessionScope.id == null}">
      				<li class="nav-item">
		        		<a class="nav-link border-bottom" href="<%=request.getContextPath()%>/login">Login</a>
		      		</li>
      			</c:if>
      			<c:if test="${sessionScope.id != null}">
	      			<li class="nav-item">
	        			<a class="nav-link border-bottom" href="<%=request.getContextPath()%>/home">Home</a>
	      			</li>
      			</c:if>
    		</ul>
    		
    		<c:if test="${sessionScope.id != null}">
    			<a href="<%=request.getContextPath()%>/users/my-profile" class="small nav-link text-primary">
    			  <img alt="icon-user" src="<%=request.getContextPath()%>/icons/person-fill.svg">
    			  ${sessionScope.name}
    			</a>
    			<a class="small nav-link text-danger" href="<%=request.getContextPath()%>/logout">Logout</a>
    		</c:if>
  		</div>
	</nav>
</body>
<script src="<%=request.getContextPath()%>/bootstrap/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<script>
	$('.carousel').carousel({
		interval: 5000
		})
</script>
</html>