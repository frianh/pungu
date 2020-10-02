<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Pungu Jaya Abadi</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
		<div id="result">
			<c:if test="${result == 'success'}">
				<div class="alert alert-success">
					<label class="small"><%=request.getAttribute("message")%></label>
				</div>
			</c:if>
			<c:if test="${result == 'fail'}">
			<div class="alert alert-danger">
					<label class="small"><%=request.getAttribute("message")%></label>
				</div>
			</c:if>
		</div>
		
		<div id="back_to_admin_page">
			<a href="<%=request.getContextPath()%>/home"><button class="btn-info">Kembali ke home page</button></a>
		</div>
	</div>
</body>
</html>