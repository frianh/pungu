<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function onlyNumber(evt) {
	  	var charCode = (evt.which) ? evt.which : event.keyCode
	  	if (charCode > 31 && (charCode < 48 || charCode > 57)){
  			return false;
  	  	}
	  	return true;
	}
</script>
<head>
	<title>Pungu Jaya Abadi</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
	  <c:if test="${type=='reset'}">
		  <div class="d-flex justify-content-center mt-5">
		    <form autocomplete="off" name="formRecovery" action="<%=request.getContextPath()%>/recovery/reset-password" method="post">
		      <div class="h1 text-muted text-center">Recovery Account</div>
		      <label>
		        <span class="small text-center">Masukan email anda :</span>
		      </label>
		      <input type="email" name="email_recover" class="form-control" placeholder="Email" required autofocus>
		      <div id="recovery_message">
				<span class="text-danger small"><%=(request.getAttribute("errMessage") == null) ? ""
	        		: request.getAttribute("errMessage")%>
	        	</span>
			  </div>
			  <button class="btn btn-sm btn-success btn-block mt-1" type="submit">Submit</button>
		    </form>
		  </div>
	  </c:if>
	  
	  <c:if test="${type=='auth'}">
		  <div class="d-flex justify-content-center mt-5">
		    <form autocomplete="off" name="formAuth" action="<%=request.getContextPath()%>/recovery/auth" method="post">
		      <div class="h1 text-muted text-center">Authentication</div>
		      <label>
		        <span class="small text-center">Masukan kode OTP :</span>
		      </label>
		      <input type="hidden" name="emailRecover" value="<%=request.getAttribute("emailRecover")%>">
		      <input type="hidden" name="nameRecover" value="<%=request.getAttribute("nameRecover")%>">
		      <input type="text" name="auth" class="form-control" style="width: 70px" maxlength="4" onkeypress="return onlyNumber(event)" required autofocus>
		      <div id="auth_message">
				<span class="text-danger small"><%=(request.getAttribute("errMessage") == null) ? ""
	        		: request.getAttribute("errMessage")%>
	        	</span>
			  </div>
			  <button class="btn btn-sm btn-success btn-block mt-1" type="submit">Submit</button>
		    </form>
		  </div>
	  </c:if>
	</div>
</body>
</html>