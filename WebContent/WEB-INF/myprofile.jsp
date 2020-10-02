<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function edit() {
		document.getElementById('name').readOnly = false;
		document.getElementById('email').readOnly = false;
		document.getElementById('btn_save').style.display = 'block';
		document.getElementById('btn_cancel').style.display = 'block';
		
		document.getElementById('reset_password').style.display = 'none';
		document.getElementById('btn_edit').style.display = 'none';
		
		document.getElementById('name').focus();
	}
	
	function cancel() {
		document.getElementById('name').readOnly = true;
		document.getElementById('email').readOnly = true;
		document.getElementById('btn_save').style.display = 'none';
		document.getElementById('btn_cancel').style.display = 'none';
		
		document.getElementById('reset_password').style.display = 'block';
		document.getElementById('btn_edit').style.display = 'block';
	}
	
	function resetPassword() {
		var old_password = document.getElementById("old_password").value;
		var new_password = document.getElementById("new_password").value;
		var confirm_password = document.getElementById("confirm_password").value;
		
		if(old_password==""){
			alert("Password anda harus di isi.");
			document.getElementById("old_password").focus();
			return;
		}
		
		if(new_password==""){
			alert("Password baru harus di isi.");
			document.getElementById("new_password").focus();
			return;
		}
		
		if(confirm_password==""){
			alert("Confirm password harus di isi.");
			document.getElementById("confirm_password").focus();
			return;
		}
		
		if(new_password!=confirm_password){
			alert("Confirm password tidak sesuai.");
			document.getElementById("confirm_password").focus();
			return;
		}
		
		if(old_password==new_password){
			alert("Password baru tidak boleh sama dengan password saat ini.");
			document.getElementById("new_password").focus();
			return;
		}
		
		document.getElementById("hidden_old_password").value = old_password;
		document.getElementById("hidden_new_password").value = new_password;
		
		if (confirm('Save ?')) {
			document.getElementById("form_reset_password").submit();
		}else{
			return;
		}
	}
	
	function updateProfile() {
		var current_name = document.getElementById("current_name").value;
		var current_email = document.getElementById("current_email").value;
		var new_name = document.getElementById("name").value;
		var new_email = document.getElementById("email").value;
		
		if((new_name==current_name) && (new_email==current_email)){
			alert("Anda tidak melakukan perubahan apapun.");
			return;
		}
		
		document.getElementById("hidden_new_name").value = new_name;
		document.getElementById("hidden_new_email").value = new_email;
		
		if (confirm('Save ?')) {
			document.getElementById("form_update_profile").submit();
		}else{
			return;
		}
	}
	
	function preventSpace(event){
		if(event.which ==32){
			event.preventDefault();
		    return false;
		}
	}
</script>
<head>
	<title>Pungu Jaya Abadi | My Profile</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
	  <div id="myprofile">
	    <c:if test="${type=='show'}">
	    	<input style="display: none;" id="current_name" value="<%=request.getAttribute("name")%>">
	    	<input style="display: none;" id="current_email" value="<%=request.getAttribute("email")%>">
	    	
			<label class="badge badge-secondary badge-pill">My Profile</label>
	  		<div class="border-bottom border-secondary"></div>
	  		
	  		<c:if test="${resultUpdateProfile== 'success'}">
		      <div class="alert alert-success">
		        <%=request.getAttribute("message")%>
		      </div>
		    </c:if>
		    
		    <c:if test="${resultUpdateProfile== 'fail'}">
		      <div class="alert alert-danger">
		        <%=request.getAttribute("message")%>
		      </div>
		    </c:if>
		    
			<div id="edit_user">
				<table class="table table-responsive-sm small">
				  <tr>
				    <th>Nama</th>
				    <td><input id="name" value="<%=request.getAttribute("name")%>" readonly></td>
				  </tr>
				  <tr>
				    <th>Email</th>
				    <td><input style="border: 0" id="email" value="<%=request.getAttribute("email")%>" readonly></td>
				  </tr>
				  <tr>
				    <th>ID</th>
				    <td><%=request.getAttribute("user_id")%></td>
				  </tr>
				  <tr>
				    <th>Role</th>
				    <td><%=request.getAttribute("role")%></td>
				  </tr>
				  <tr>
				    <th>Create Date</th>
				    <td><%=request.getAttribute("createDate")%></td>
				  </tr>
				</table>
				
				<table>
				  <tr>
				    <td>
				      <input onclick="updateProfile()" id="btn_save" type="submit" value="Submit" class="btn-success" style="display: none;">
				    </td>
				    <td>
				      <input onclick="cancel()" id="btn_cancel" type="submit" value="Cancel" class="btn-danger" style="display: none;">
				    </td>
				  </tr>
				</table>
				
				<input onclick="edit()" id="btn_edit" type="submit" value="Edit" class="btn-success">
			</div>
			
			<div class="mt-3" id="reset_password">
				<label class="badge badge-secondary badge-pill">Ubah Password</label>
		  		<div class="border-bottom border-secondary"></div>
		  		
		  		<c:if test="${resultResetPassword== 'success'}">
		      		<div class="alert alert-success">
		        		<%=request.getAttribute("message")%>
		      		</div>
		    	</c:if>
		    
		    	<c:if test="${resultResetPassword== 'fail'}">
		      		<div class="alert alert-danger">
		        		<%=request.getAttribute("message")%>
		      		</div>
		    	</c:if>
		    
		  		<div class="mt-1">
			  		<table>
			  		  <tr>
			  		    <td class="small">Password Anda</td>
			  		    <td><input onkeypress="preventSpace(event)" id="old_password" class="form-control-sm" type="password" placeholder="Password Anda"></td>
			  		  </tr>
			  		  <tr>
			  		    <td class="small">Password Baru</td>
			  		    <td><input onkeypress="preventSpace(event)" id="new_password" class="form-control-sm" type="password" placeholder="Password Baru"></td>
			  		  </tr>
			  		  <tr>
			  		    <td class="small">Ulangi Password Baru</td>
			  		    <td><input onkeypress="preventSpace(event)" id="confirm_password" class="form-control-sm" type="password" placeholder="Ulangi Password Baru"></td>
			  		  </tr>
			  		  <tr>
			  		    <td></td>
			  		    <td><input onclick="resetPassword()" type="submit" value="Submit" class="btn-success"></td>
			  		  </tr>
			  		</table>
		  		</div>
	  		</div>
  	    </c:if>
	  </div>
	</div>
	
	<form id="form_update_profile" action="<%=request.getContextPath()%>/users/my-profile/update" method="post">
		<input type="hidden" id="hidden_new_name" name="hidden_new_name">
		<input type="hidden" id="hidden_new_email" name="hidden_new_email">
	</form>
	
	<form id="form_reset_password" action="<%=request.getContextPath()%>/users/my-profile/reset-password" method="post">
		<input type="hidden" id="hidden_old_password" name="hidden_old_password">
		<input type="hidden" id="hidden_new_password" name="hidden_new_password">
	</form>
</body>
</html>