<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function preventSpace(event){
		if(event.which ==32){
			event.preventDefault();
		    return false;
		}
	}
</script>
<head>
	<title>Pungu Jaya Abadi | Login</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
	<div class="container-fluid mt-3">
		<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
		<div class="d-flex justify-content-center">
			<form autocomplete="off" name="formLogin" action="<%=request.getContextPath()%>/home" method="post">
	      		<div class="text-center mb-2">
	      			<img src="<%=request.getContextPath()%>/image/logo.png" alt="logo" width="70" height="70">
	      		</div>
	      		<input onkeypress="preventSpace(event)" type="text" name="id" class="form-control" placeholder="ID / Email" required autofocus>
	      		<input onkeypress="preventSpace(event)" type="password" name="password" class="form-control" placeholder="Password" required>
	      		<div id="message">
					<span class="text-danger small"><%=(request.getAttribute("errMessage") == null) ? ""
        					: request.getAttribute("errMessage")%>
        			</span>
        			<span class="text-info small"><%=(request.getAttribute("logoutMessage") == null) ? ""
        					: request.getAttribute("logoutMessage")%>
        			</span>
        			<span class="text-danger small"><%=(request.getAttribute("sessionExpiredMessage") == null) ? ""
        					: request.getAttribute("sessionExpiredMessage")%>
        			</span>
        			<span class="text-info small"><%=(request.getAttribute("recoverMessage") == null) ? ""
        					: request.getAttribute("recoverMessage")%>
        			</span>
				</div>
	      		<button class="btn btn-sm btn-success btn-block mt-2" type="submit">Sign in</button>
				<a href="<%=request.getContextPath()%>/recovery" class="btn-link small">Lupa Password ?</a>
	      		<p class="small text-center text-muted mt-3">&copy; 2020 Copyright</p>
			</form>
		</div>
	</div>
</body>
</html>