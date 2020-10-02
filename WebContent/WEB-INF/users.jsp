<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function getData() {
		var create_id = document.getElementById("create_id").value;
		var create_email = document.getElementById("create_email").value;
		var create_name = document.getElementById("create_name").value;
		var create_role = document.getElementById("create_role").value;
		var create_by = document.getElementById("current_user_id").value;
		
		if(create_email == ""){
			alert("Email harus di isi.");
			document.getElementById("create_email").focus();
			return;
		}
		
		if(create_name == ""){
			alert("Nama harus di isi.");
			document.getElementById("create_name").focus();
			return;
		}
		
		if(create_id == ""){
			alert("Id harus di isi.");
			document.getElementById("create_id").focus();
			return;
		}
		
		if(create_role == "pilih role"){
			alert("Role belum di pilih.");
			document.getElementById("create_role").focus();
			return;
		}
		
		document.getElementById("hidden_create_id").value = create_id;
		document.getElementById("hidden_create_email").value = create_email;
		document.getElementById("hidden_create_name").value = create_name;
		document.getElementById("hidden_create_role").value = create_role;
		document.getElementById("hidden_create_by").value = create_by;
		
		if (confirm('Submit ?')) {
			document.getElementById("form_add_new_user").submit();
		}else{
			return;
		}
	}
	
	function save() {
		var current_role = document.getElementById("current_role").value;
		var new_role = document.getElementById("new_role").value;
		var idToUpdate = document.getElementById("user_id").value;
		
		if(new_role == current_role){
			alert("Anda belum melakukan perubahan apapun.");
			document.getElementById("new_role").focus();
			return;
		}
		
		document.getElementById("hidden_new_role").value = new_role;
		document.getElementById("hidden_user_id").value = idToUpdate;
		
		if (confirm('Simpan perubahan ?')) {
			document.getElementById("form_edit_user").submit();
		}else{
			return;
		}
	}
	
	function deleteUser() {
		var idToUpdate = document.getElementById("user_id").value;
		document.getElementById("hidden_delete_user_id").value = idToUpdate;
		
		if (confirm('Hapus user ini ?')) {
			document.getElementById("form_delete_user").submit();
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
	<title>Pungu Jaya Abadi | Users</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
		<input type="hidden" id="current_user_id" value="${sessionScope.id}">
		
		<c:if test="${type=='list'}">
			<label class="badge badge-secondary badge-pill">List User</label>
	  		<div class="border-bottom border-secondary"></div>
			<div id="list_user">
				<table class="table table-responsive-sm small">
				  <tr>
				    <th>ID</th>
				    <th>Nama</th>
				    <th>Role</th>
				    <th></th>
				  </tr>
				  <c:forEach var="userBean" items="${userList}">
		        	<tr>
		        	  <td>${userBean.getId()}</td>
		        	  <td>${userBean.getName()}</td>
		        	  <td>${userBean.getRole()}</td>
		        	  <td>
					    <form action="<%=request.getContextPath()%>/users/edit" method="get">
							<input type="hidden" name="user_id" value="${userBean.getId()}"/>
							<input id="button" type="submit" value="edit" class="btn btn-link">
						</form>
					  </td>
		        	</tr>
		          </c:forEach>
		        </table>
			</div>
		</c:if>
		
		<c:if test="${type=='add'}">
			<label class="badge badge-secondary badge-pill">Add User</label>
	  		<div class="border-bottom border-secondary"></div>
	  		
	  		<c:if test="${result== 'success'}">
		      <div class="alert alert-success">
		        <%=request.getAttribute("message")%>
		      </div>
		    </c:if>
		    
		    <c:if test="${result== 'fail'}">
		      <div class="alert alert-danger">
		        <%=request.getAttribute("message")%>
		      </div>
		    </c:if>
		    
			<div id="add_new_user">
				<table class="table table-responsive-sm small">
				  <tr>
				    <th>Email</th>
				    <td><input value="<%=(request.getAttribute("hidden_create_email") == null) ? "": request.getAttribute("hidden_create_email")%>" id="create_email" type="email" placeholder="Email" required></td>
				  </tr>
				  <tr>
				    <th>Nama</th>
				    <td><input value="<%=(request.getAttribute("hidden_create_name") == null) ? "": request.getAttribute("hidden_create_name")%>" id="create_name" placeholder="Nama" required></td>
				  </tr>
				  <tr>
				    <th>ID</th>
				    <td><input onkeypress="preventSpace(event)" maxlength="3" value="<%=(request.getAttribute("hidden_create_id") == null) ? "": request.getAttribute("hidden_create_id")%>" id="create_id" placeholder="ID" required></td>
				  </tr>
				  <tr>
				    <th>Role</th>
				    <td>
				      <select id="create_role">
				        <option>pilih role</option>
				        <c:forEach var="roleBean" items="${roleList}">
				          <option>${roleBean.getRole()}</option>
				        </c:forEach>
				      </select>
				    </td>
				  </tr>
				</table>
				<input class="btn-success mt-2" type="button" value="Create" onclick="getData()">
			</div>
		</c:if>
		
		<c:if test="${type=='edit'}">
			<label class="h6 badge-secondary badge-pill">Info User</label>
	  		<div class="border-bottom border-secondary"></div>
	  		
	  		<c:if test="${result== 'success'}">
		      <div class="alert alert-success">
		        <%=request.getAttribute("message")%>
		      </div>
		    </c:if>
		    
		    <c:if test="${result== 'fail'}">
		      <div class="alert alert-danger">
		        <%=request.getAttribute("message")%>
		      </div>
		    </c:if>
		    
			<div id="edit_user">
				<table class="table table-responsive-sm small">
				  <tr>
				    <th>ID</th>
				    <td><input id="user_id" value="<%=request.getAttribute("user_id")%>" readonly></td>
				  </tr>
				  <tr>
				    <th>Email</th>
				    <td><%=request.getAttribute("email")%></td>
				  </tr>
				  <tr>
				    <th>Nama</th>
				    <td><%=request.getAttribute("name")%></td>
				  </tr>
				  <tr>
				    <th>Role</th>
				    <td><input id="current_role" value="<%=request.getAttribute("role")%>" readonly></td>
				  </tr>
				  <tr>
				    <th>Create Date</th>
				    <td><%=request.getAttribute("createDate")%></td>
				  </tr>
				  <tr>
				    <th>Create By</th>
				    <td><%=request.getAttribute("createBy")%></td>
				  </tr>
				  <tr>
				    <th>Last Update</th>
				    <td><%=request.getAttribute("lastUpdate") %></td>
				  </tr>
				  <tr>
				    <th>Last Update By</th>
				    <td><%=request.getAttribute("lastUpdateBy")%></td>
				  </tr>
				</table>
			</div>
			
			<label class="h6 badge-secondary badge-pill">Update Role</label>
	  		<div class="border-bottom border-secondary"></div>
	  		<div>
		  		<select id="new_role" class="mt-2 form-control-sm">
		  		  <c:forEach var="roleBean" items="${roleList}">
				    <option>${roleBean.getRole()}</option>
				  </c:forEach>
		  		</select>
	  		</div>
			<input class="btn-success mt-2" type="submit" value="Save" onclick="save()">
			<input class="btn-danger" type="submit" value="Delete" onclick="deleteUser()">
		</c:if>
		
		<form id="form_add_new_user" action="<%=request.getContextPath()%>/users/new/create" method="post">
		  <input type="hidden" id="hidden_create_id" name="hidden_create_id">
		  <input type="hidden" id="hidden_create_name" name="hidden_create_name">
		  <input type="hidden" id="hidden_create_email" name="hidden_create_email">
		  <input type="hidden" id="hidden_create_role" name="hidden_create_role">
		  <input type="hidden" id="hidden_create_by" name="hidden_create_by">
		</form>

		<form id="form_edit_user" action="<%=request.getContextPath()%>/users/edit" method="post">
		  <input type="hidden" id="hidden_new_role" name="hidden_new_role">
		  <input type="hidden" id="hidden_user_id" name="hidden_user_id">
		</form>
		
		<form id="form_delete_user" action="<%=request.getContextPath()%>/users/delete" method="post">
		  <input type="hidden" id="hidden_delete_user_id" name="hidden_delete_user_id">
		</form>
	</div>
</body>
</html>