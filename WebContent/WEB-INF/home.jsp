<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Pungu Jaya Abadi | Home</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
	<style type="text/css">
	@media (min-width: 100px) {
    	.card-columns {
        	column-count: 1;
    	}
	}
	
	@media (min-width: 700px) {
    	.card-columns {
        	column-count: 5;
        	}
    	}
	}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
	  <div class="d-flex justify-content-center mt-5">
		<div class="row ml-2">
			<div class="card-columns">
				<div class="card" style="max-width: 200px">
  					<img class="card-img-top" src="<%=request.getContextPath()%>/image/invoice-logo.png" alt="invoice image">
  					<div class="card-body">
    					<h5 class="card-title">Invoice</h5>
    					<a href="<%=request.getContextPath()%>/invoice/new" class="btn btn-sm btn-outline-secondary">Create Invoice</a>
    					<a href="<%=request.getContextPath()%>/invoice" class="btn btn-sm btn-outline-secondary mt-1">Tracking Invoice</a>
    					<c:if test="${sessionScope.role == 'admin' }">
    						<a href="<%=request.getContextPath()%>/invoice?hidden_invoice_status=menunggu approval" class="btn btn-sm btn-outline-secondary mt-1">
    							Menuggu Approval
    							<c:if test="${waitApproveInvoice > 0 }">
    								<label class="badge-pill badge-danger">${waitApproveInvoice }</label>
    							</c:if>
    						</a>
    					</c:if>
  					</div>
				</div>
				
				<c:if test="${sessionScope.role == 'admin' }">
		  			<div class="card" style="max-width: 200px">
	  					<img class="card-img-top" src="<%=request.getContextPath()%>/image/user-logo.png" alt="user image">
	  					<div class="card-body">
	    					<h5 class="card-title">Manage Users</h5>
	    					<a href="<%=request.getContextPath()%>/users/new" class="btn btn-sm btn-outline-secondary">Create User</a>
	    					<a href="<%=request.getContextPath()%>/users" class="btn btn-sm btn-outline-secondary mt-1">Update User</a>
	  					</div>
					</div>
			  	</c:if>
			  	
	  			<div class="card" style="max-width: 200px">
  					<img class="card-img-top" src="<%=request.getContextPath()%>/image/manage-web-logo.png" alt="manage web image">
  					<div class="card-body">
    					<h5 class="card-title">Manage Web Page</h5>
    					<a href="<%=request.getContextPath()%>/simulation/edit" class="btn btn-sm btn-outline-secondary">Simulasi</a>
  					</div>
				</div>
				
				<div class="card" style="max-width: 200px">
  					<img class="card-img-top" src="<%=request.getContextPath()%>/image/myprofile.png" alt="my profile image">
  					<div class="card-body">
    					<a href="<%=request.getContextPath()%>/users/my-profile" class="btn btn-sm btn-outline-secondary">My Profile</a>
  					</div>
				</div>
			</div>
		</div>
	  </div>
	</div>
</body>
</html>