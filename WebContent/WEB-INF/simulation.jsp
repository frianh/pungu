<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function deleteRow(btn) {
		  var row = btn.parentNode.parentNode;
		  row.parentNode.removeChild(row);
	}
	
	function getData() {
		var rates = document.getElementById("rates").value;
		document.getElementById("rates_now").value = rates;
		
		var table = document.getElementById("tbl_price");
		rows = table.rows.length;
		var arrPrice = [];
		
		var j = 0;
		for (var i = 2; i<rows; i++) {
		   row = table.rows[i];
		   cell = row.cells[0].childNodes[0].value;
		   arrPrice[j] = cell.replace(/,/g, '');
		   j++;
		}
		
		document.getElementById("arrPrice").value = arrPrice;
		
		if (confirm('Save ?')) {
			document.getElementById("sim_update").submit();
		}else{
			return;
		}
	}
	
	function addRow(tableID) {
		var table = document.getElementById(tableID);
	
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
	
		var cell1 = row.insertCell(0);
		var element1 = document.createElement("input");
		element1.setAttribute('oninput','separator(this)');
		element1.setAttribute('onkeypress','validate()');
		element1.setAttribute('class','form-control-sm');
		element1.type = "text";
		cell1.appendChild(element1);
		
		var cell2 = row.insertCell(1);
		var element2 = document.createElement("input");
		element2.type = "button";
		element2.value = "delete";
		element2.setAttribute('onclick','deleteRow(this)');
		element2.setAttribute('class','btn-danger');
		cell2.appendChild(element2);
	}

	function inputToggle(e) {
	  var edit = true;
	  e.preventDefault();
	  $(':input').prop('readonly', edit = !edit);
	}
	
	function saveKurs(){
/* 		var newVal = document.getElementById('kurs');
		document.getElementById('kurs').value = newVal; */
		document.getElementById("kurs").setRangeText("1,200.09");
		/* document.getElementById("kurs").value = "1,234.12"; */
		document.getElementById('kurs').readOnly = true;
	}
	
	function validate(evt) {
	    var theEvent = evt || window.event;
	    var key = theEvent.keyCode || theEvent.which;
	    key = String.fromCharCode(key);
	    if (key.length == 0) return;
	    var regex = /^[0-9.,\b]+$/;
	    if (!regex.test(key)) {
	        theEvent.returnValue = false;
	        if (theEvent.preventDefault) theEvent.preventDefault();
	    }
	}
	
	function separator(input) { 
	    let nums = input.value.replace(/,/g, '');
	    if (!nums || nums.endsWith('.')) return;
	    input.value = parseFloat(nums).toLocaleString(); 
	}
	
	function sum1() {
		var price_1 = document.getElementById('price_1').value;
	    var qty_1 = document.getElementById('qty_1').value;
	    var kurs = document.getElementById('kurs').value;
	    price_1 = price_1.replace(/[,]+/g, '');
	    qty_1 = qty_1.replace(/[,]+/g, '');
	    kurs = kurs.replace(/[,]+/g, '');
	    
	    if (price_1 == "")
	    	price_1 = 0;
	    if (qty_1 == "")
	    	qty_1 = 0;
	    if (kurs == "")
	    	kurs = 0;
	    
	    var result = (parseFloat(price_1) * parseFloat(qty_1)) * parseFloat(kurs);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	    	var elms = document.querySelectorAll("[id='totalprice_1']");

	    	for(var i = 0; i < elms.length; i++) 
	    	  elms[i].value=result;
	        /* document.getElementById('totalprice_1').value = result; */
	    }
	    
	    var elms = document.querySelectorAll("[id='totalprice_1']");

    	for(var i = 0; i < elms.length; i++) 
    	  elms[i].onchange();
	    /* document.getElementById('totalprice_1').onchange(); */
	}
	
	function sum2() {
		var price_2 = document.getElementById('price_2').value;
	    var kurs = document.getElementById('kurs').value;
	    price_2 = price_2.replace(/[,]+/g, '');
	    kurs = kurs.replace(/[,]+/g, '');
	    
	    if (price_2 == "")
	    	price_2 = 0;
	    if (kurs == "")
	    	kurs = 0;
	    
	    var result = parseFloat(price_2) * parseFloat(kurs);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	    	var elms = document.querySelectorAll("[id='totalprice_2']");

	    	for(var i = 0; i < elms.length; i++) 
	    	  elms[i].value=result;
	        /* document.getElementById('totalprice_2').value = result; */
	    }
	    
        var elms = document.querySelectorAll("[id='totalprice_2']");

    	for(var i = 0; i < elms.length; i++) 
    	  elms[i].onchange();
	    /* document.getElementById('totalprice_2').onchange(); */
	}
	
	function sum3() {
		var length = document.getElementById('length').value;
	    var width = document.getElementById('width').value;
	    var height = document.getElementById('height').value;
	    length = length.replace(/[,]+/g, '');
	    width = width.replace(/[,]+/g, '');
	    height = height.replace(/[,]+/g, '');
	    
	    if (length == "")
	    	length = 0;
	    if (width == "")
	    	width = 0;
	    if (height == "")
	    	height = 0;
	    
	    var result = (parseFloat(length) * parseFloat(width) * parseFloat(height)) / 1000000;
	    var tempnumber = result * Math.pow(10, 3);
	    tempnumber = Math.ceil(tempnumber);
	    tempnumber = tempnumber / Math.pow(10, 3);
	    if (!isNaN(result)) {
	        document.getElementById('totalm3').value = tempnumber;
	    }
	}
	
	function sum4() {
		var m3 = document.getElementById('totalm3').value;
	    var price_3 = document.getElementById('price_3').value;
	    var qty_1 = document.getElementById('qty_1').value;
	    price_3 = price_3.replace(/[,]+/g, '');
	    qty_1 = qty_1.replace(/[,]+/g, '');
	    
	    if (m3 == "")
	    	m3 = 0;
	    if (price_3 == "Pilih Harga")
	    	price_3 = 0;
	    if (price_3 == "")
	    	price_3 = 0;
	    if (qty_1 == "")
	    	qty_1 = 0;
	    
	    var result = (parseFloat(m3) * parseFloat(price_3)) * parseFloat(qty_1);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	    	var elms = document.querySelectorAll("[id='totalprice_3']");

	    	for(var i = 0; i < elms.length; i++) 
	    	  elms[i].value=result;
	        /* document.getElementById('totalprice_3').value = result; */
	    }
	    
	    var elms = document.querySelectorAll("[id='totalprice_3']");

    	for(var i = 0; i < elms.length; i++) 
    	  elms[i].onchange();
	    /* document.getElementById('totalprice_3').onchange(); */
	}
	
	function sum5() {
		var totalprice_1 = document.getElementById('totalprice_1').value;
		var totalprice_2 = document.getElementById('totalprice_2').value;
		var totalprice_3 = document.getElementById('totalprice_3').value;
		var price_other = document.getElementById('price_other').value;
	    
		totalprice_1 = totalprice_1.replace(/[,]+/g, '');
		totalprice_2 = totalprice_2.replace(/[,]+/g, '');
		totalprice_3 = totalprice_3.replace(/[,]+/g, '');
		price_other = price_other.replace(/[,]+/g, '');
		
	    if (totalprice_1 == "")
	    	totalprice_1 = 0;
	    if (totalprice_2 == "")
	    	totalprice_2 = 0;
	    if (totalprice_3 == "")
	    	totalprice_3 = 0;
	    if (price_other == "")
	    	price_other = 0;
	    
	    var result = parseFloat(totalprice_1) + parseFloat(totalprice_2) + parseFloat(totalprice_3) + parseFloat(price_other);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	        document.getElementById('totalprice').value = result;
	    }
	    
	    document.getElementById('totalprice').onchange();
	}

	function sum6() {
		var price_other = document.getElementById('price_other').value;
		price_other = price_other.replace(/[,]+/g, '');
	    
	    if (price_other == "")
	    	price_other = 0;
	    
	    var result = parseFloat(price_other);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	    	var elms = document.querySelectorAll("[id='totalprice_other']");

	    	for(var i = 0; i < elms.length; i++) 
	    	  elms[i].value=result;
	        /* document.getElementById('totalprice_other').value = result; */
	    }
	    
	    var elms = document.querySelectorAll("[id='totalprice_other']");

    	for(var i = 0; i < elms.length; i++) 
    	  elms[i].onchange();
	    /* document.getElementById('totalprice_other').onchange(); */
	}
</script>

<head>
	<title>Pungu Jaya Abadi | Simulasi</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
	<style type="text/css">
		div.form-row > div.col-8{
			margin-bottom: 2px;
		}
		
		div[id*=div_]{
			margin-bottom: 20px
		}
		
		input[readonly]{
			background-color: lightyellow;
		}
		
		input, select{
			max-width: 200px;
		}
		
		::-webkit-input-placeholder {
            font-size: 13px!important;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
	  <div class="h3 text-center">Simulasi</div>
	  
	  	<c:if test="${type== 'default'}">
	  	
	  	  <c:if test="${result== 'success'}">
		      <c:if test="${message!= null}">
		      	<div class="alert alert-success">
		      	  <label class="text-capitalize"><%=request.getAttribute("message")%></label>
		        </div>
		      </c:if>
		  </c:if>
	  	  
	      <c:if test="${sessionScope.id != null}">
		    <div id="edit_simulation">
		    	<a class="btn float-right text-dark" href="<%=request.getContextPath()%>/simulation/edit">Edit</a>
	   		</div>
	  	  </c:if>
	   		
		  <label class="badge badge-success badge-pill">Kurs</label>
		  <div class="border-bottom border-dark"></div>
		  <p>
		  <div id="div_kurs" class="bg-light">		  
			  <div class="form-row">
			    <div class="col-4">
			      <small>Kurs 1 CNY - IDR</small>
			    </div>
			    <div class="col-8">
			      <input value="<%= request.getAttribute("rates") %>" oninput="separator(this)" onKeyPress="validate()" type="text" class="form-control border-0 bg-light" id="kurs" readonly>
			    </div>
			  </div>
		  </div>
		  
		  <label class="badge badge-success badge-pill">Harga Barang</label>
		  <div class="border-bottom border-success"></div>
		  <p>
		  <div id="div_goods" class="bg-light">
			  <div class="form-row">
			    <div class="col-4">
			      <small>Harga Barang (CNY)</small>
			    </div>
			    <div class="col-8">
			      <input onKeyPress="validate()" onkeyup="sum1()" oninput="separator(this)" type="text" class="form-control" id="price_1" placeholder="Harga (CNY)">
			    </div>
		      </div>
		      
		      <div class="form-row">
		        <div class="col-4">
			      <small>Qty</small>
			    </div>
			    <div class="col-8">
			     <input onKeyPress="validate()" onkeyup="sum1(); sum4();" oninput="separator(this)" type="text" class="form-control" id="qty_1" placeholder="Quantity">
			    </div>
		      </div>
		      
		      <div class="form-row">
		        <div class="col-4">
			      <small>Total (IDR)</small>
			    </div>
			    <div class="col-8">
			     <input onchange="sum5(); separator(this);" type="text" class="form-control-plaintext" name="totalprice_1" id="totalprice_1" readonly>
			    </div>
			  </div>
		  </div>
		  
	      <label class="badge badge-success badge-pill">Biaya Pengiriman Lokal (Chinese)</label>
		  <div class="border-bottom border-success"></div>
		  <p>
		  <div id="div_supplier" class="bg-light">
			  <div class="form-row">
			    <div class="col-4">
			      <small>Harga (CNY)</small>
			    </div>
			    <div class="col-8">
			      <input onKeyPress="validate()" onkeyup="sum2()" oninput="separator(this)" type="text" class="form-control" id="price_2" placeholder="Harga (CNY)">
			    </div>
		      </div>
		      <div class="form-row">
		        <div class="col-4">
			      <small>Total (IDR)</small>
			    </div>  
			      <div class="col-8">
			        <input onchange="sum5(); separator(this);" type="text" class="form-control-plaintext" name="totalprice_2" id="totalprice_2" readonly>
			      </div>
			  </div>
		  </div>
		  	
	      <label class="badge badge-success badge-pill">Biaya Jasa Import</label>
		  <div class="border-bottom border-success"></div>
		  <p>
		  <div id="div_import" class="bg-light">
			  <div class="form-row">
			    <div class="col-4">
			      <small class="text-danger border-bottom border-danger"><b>Kubikasi</b></small>
			    </div>
			    <div class="col-8">
			      
			    </div>
		      </div>
			  <div class="form-row">
			    <div class="col-4">
			      <small>Panjang (cm)</small>
			    </div>
			    <div class="col-8">
			      <input onKeyPress="validate()" onkeyup="sum3()" oninput="separator(this)" type="text" class="form-control" id="length" placeholder="Panjang (cm)">
			    </div>
		      </div>
		      <div class="form-row">
		        <div class="col-4">
			      <small>Lebar (cm)</small>
			    </div>
			    <div class="col-8">
			      <input onKeyPress="validate()" onkeyup="sum3()" oninput="separator(this)" type="text" class="form-control" id="width" placeholder="Lebar (cm)">
			    </div>
		      </div>
		      <div class="form-row">
		        <div class="col-4">
			      <small>Tinggi (cm)</small>
			    </div>
			    <div class="col-8">
			      <input onKeyPress="validate()" onkeyup="sum3()" oninput="separator(this)" type="text" class="form-control" id="height" placeholder="Tinggi (cm)">
			    </div>
		      </div>
		      <div class="form-row">
		        <div class="col-4">
			      <small>Total (m3)</small>
			    </div>
			    <div class="col-8">
			      <input type="text" class="form-control-plaintext" name="totalm3" id="totalm3" readonly="readonly">
			    </div>
			  </div>
			  <div class="form-row">
			    <div class="col-4">
			      <small>Harga (IDR)</small>
			    </div>
			    <div class="col-8">
			      <select onchange="sum4(); separator(this);" id="price_3" class="form-control form-control-sm">
			        <option>Pilih Harga</option>
			        <c:forEach var="priceBean" items="${priceList}">
			        	<option>${priceBean.getPrice()}</option>
			        </c:forEach>
			      </select>
			    </div>
			  </div>
			  <div class="form-row">
			    <div class="col-4">
			      <small>Total (IDR)</small>
			    </div>
			    <div class="col-8">
			      <input onchange="sum5(); separator(this);" type="text" class="form-control-plaintext" name="totalprice_3" id="totalprice_3" readonly>
			    </div>
			  </div>
			  <div class="form-row">
			      <small id="note" class="text-muted" style="margin-top: 20px">*Hitungan volume(m3) di simulasi tidak menjadi acuan. Acuan ukuran dikeluarkan oleh Agen Pengiriman di Chinese.</small>
			  </div>
		  </div>
			
			
	      <label class="badge badge-success badge-pill">Biaya Lainnya</label>
		  <div class="border-bottom border-success"></div>
		  <p>
		  <div id="div_other" class="bg-light">
			  <div class="form-row">
			    <div class="col-4">
			      <small>Biaya Lainnya (IDR)</small>
			    </div>
			    <div class="col-8">
			      <input onKeyPress="validate()" onkeyup="sum6()" oninput="separator(this)" type="text" class="form-control" id="price_other" placeholder="Biaya Lainnya (IDR)">
			    </div>
		      </div>
		      <div class="form-row" style="display: none;">
		        <div class="col-4">
			    </div>  
			      <div class="col-8">
			        <input onchange="sum5(); separator(this);" type="text" class="form-control-plaintext" name="totalprice_other" id="totalprice_other" readonly>
			      </div>
			  </div>
		  </div>
		  
			
		  <label class="badge badge-primary badge-pill">Total Biaya (IDR)</label>
		  <div class="border-bottom border-primary"></div>
		  <p>
		  <div id="total_summary" class="bg-light">
			  <div class="form-row">
			    <div class="col-4">
			      <small>Total Harga Barang</small>
			    </div>
			    <div class="col-8">
			      <input onchange="separator(this)" type="text" class="form-control-plaintext" id="totalprice_1" readonly="readonly">
			    </div>
			    <div class="col-4">
			      <small>Total Biaya Pengiriman Lokal</small>
			    </div>
			    <div class="col-8">
			      <input onchange="separator(this)" type="text" class="form-control-plaintext" id="totalprice_2" readonly="readonly">
			    </div>
			    <div class="col-4">
			      <small>Total Biaya Import</small>
			    </div>
			    <div class="col-8">
			      <input onchange="separator(this)" type="text" class="form-control-plaintext" id="totalprice_3" readonly="readonly">
			    </div>
			    <div class="col-4">
			      <small>Biaya Lainnya</small>
			    </div>
			    <div class="col-8">
			      <input onchange="separator(this)" type="text" class="form-control-plaintext" id="totalprice_other" readonly="readonly">
			    </div>
			    <div class="col-4">
			      <small class="text-right"><b>Total</b></small>
			    </div>
			    <div class="col-8">
			      <input onchange="separator(this)" type="text" class="form-control-plaintext font-weight-bold" name="totalprice" id="totalprice" readonly>
			    </div>
			  </div>
			</div>
		</c:if>
		
		<c:if test="${type== 'edit'}">
			<div class="" id="edit_page">
				<label class="badge badge-secondary badge-pill">Info Update Terakhir</label>
	  			<div class="border-bottom border-secondary"></div>
	  		
				<div><label class="small text-muted">Last update : <%= request.getAttribute("lastUpdate") %></label></div>
				<div><label class="small text-muted">By : <%= request.getAttribute("updateBy") %></label></div>
				
	  			<label class="badge badge-secondary badge-pill mt-2">Info Kurs</label>
	  			<div class="border-bottom border-secondary"></div>
	  		
				<table id="tbl_price">
					<tr>
					   	<td>Kurs</td>
					   	<th><input class="form-control-sm" id="rates" oninput="separator(this)" onKeyPress="validate()" value="<%= request.getAttribute("rates") %>"></th>
					 </tr>
					 <tr>
					    <th>
					    	<label class="badge badge-secondary badge-pill mt-4">Daftar Harga</label>
	  						<div class="border-bottom border-secondary"></div>
					    </th>
					    <th></th>
					 </tr>
					 <c:forEach var="priceBean" items="${priceList}">		  
	  				 	<tr>
	    					<td><input class="form-control-sm" oninput="separator(this)" onKeyPress="validate()" type="text" value="${priceBean.getPrice()}"></td>
	    					<td><input class="btn-danger" type="button" value="delete" onclick="deleteRow(this)"></td>
	  					</tr>
	  				 </c:forEach>
				</table>
				
				<input class="btn-success mt-2" type="button" onclick="addRow('tbl_price')" value="Add" />
				<input class="btn-success" type="button" value="Submit" onclick="getData()"/>
			</div>
		</c:if>
	</div>
	
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	
	<form id="sim_update" action="<%=request.getContextPath()%>/simulation/update" method="post">
		<input type="hidden" id="rates_now" name="rates_now">
		<input type="hidden" id="arrPrice" name="arrPrice">
	</form>
</body>
</html>