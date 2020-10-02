<!DOCTYPE html>
<html>
<head>
  	<title>Oops!</title>
  	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
  <jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
  <div class="container-fluid mt-3">
    <div class="h3 text-muted text-xl-left mt-5" id="error-page">
      Oops! Something went wrong.
    </div>
    <div class="mt-5" id="back_to_admin_page">
	  <a href="<%=request.getContextPath()%>"><button class="btn-info">Kembali ke dashboard</button></a>
	</div>
  </div>
</body>
</html>