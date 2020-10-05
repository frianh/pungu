<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function getDataTitle() {
		var table = document.getElementById("tbl_title");
		rows = table.rows.length;
		var arrTitle = [];
		
		var j = 0;
		for (var i = 2; i<rows; i++) {
		   row = table.rows[i];
		   cell = row.cells[0].childNodes[0].value;
		   arrTitle[j] = cell.replace(/,/g, '');
		   j++;
		}
		
		document.getElementById("arrTitle").value = arrTitle;
		
		if (confirm('Save ?')) {
			document.getElementById("invoice_update").submit();
		}else{
			return;
		}
	}

	function deleteRow(btn) {
		  var row = btn.parentNode.parentNode;
		  row.parentNode.removeChild(row);
	}

	function addRow(tableID) {
		var table = document.getElementById(tableID);
	
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
	
		var cell1 = row.insertCell(0);
		var element1 = document.createElement("textarea");
		element1.setAttribute('class','form-control');
		element1.setAttribute('rows','3');
		element1.setAttribute('cols','');
		cell1.appendChild(element1);
		
		var cell2 = row.insertCell(1);
		var element2 = document.createElement("input");
		element2.type = "button";
		element2.value = "delete";
		element2.setAttribute('onclick','deleteRow(this)');
		element2.setAttribute('class','btn-danger');
		cell2.appendChild(element2);
	}

	function onlyNumber(evt) {
	  	var charCode = (evt.which) ? evt.which : event.keyCode
	  	if (charCode > 31 && (charCode < 48 || charCode > 57)){
				return false;
		  	}
	  	return true;
	}
	
	function filterInvoice() {
		var invoiceStatus = document.getElementById('invoiceStatus').value;
		var invoiceCreatedByFilter = document.getElementById('invoiceCreatedByFilter').value;
		
		document.getElementById("hidden_invoice_status").value = invoiceStatus;
		document.getElementById("hidden_invoice_created_by_filter").value = invoiceCreatedByFilter;
		document.getElementById("form_invoice_filter").submit();
	}
	
	function filterByInvoiceNo() {
		var invoiceNoFilter = document.getElementById('invoiceNoFilter').value;
		
		document.getElementById("hidden_invoice_no_filter").value = invoiceNoFilter;
		document.getElementById("form_filter_by_invoice").submit();
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
		var price = document.getElementById('create_rate').value;
	    var qty = document.getElementById('create_qty').value;
	    
	    price = price.replace(/[,]+/g, '');
	    qty = qty.replace(/[,]+/g, '');
	    
	    if (price == "")
	    	price = 0;
	    if (qty == "")
	    	qty = 0;
	    
	    var result = parseFloat(price) * parseFloat(qty);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	    	var elms = document.querySelectorAll("[id='create_total']");

	    	for(var i = 0; i < elms.length; i++) 
	    	  elms[i].value=result;
	    }
	    
	    var elms = document.querySelectorAll("[id='create_total']");

    	for(var i = 0; i < elms.length; i++) 
    	  elms[i].onchange();
	}
	
	function sum5() {
		var create_total = document.getElementById('create_total').value;
		var create_discount = document.getElementById('create_discount').value;
	    
		create_total = create_total.replace(/[,]+/g, '');
		create_discount = create_discount.replace(/[,]+/g, '');
		
	    if (create_total == "")
	    	create_total = 0;
	    if (create_discount == "")
	    	create_discount = 0;
	    
	    var result = parseFloat(create_total) - parseFloat(create_discount);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	        document.getElementById('create_grand_total').value = result;
	    }
	    
	    document.getElementById('create_grand_total').onchange();
	}
	
	function sum6() {
		var create_total = document.getElementById('create_total').value;
		var create_discount = document.getElementById('create_discount').value;
		
		create_total = create_total.replace(/[,]+/g, '');
		create_discount = create_discount.replace(/[,]+/g, '');
	    
		if (create_total == "")
			create_total = 0;
	    if (create_discount == "")
	    	create_discount = 0;
	    
	    var result = parseFloat(create_total) - parseFloat(create_discount);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	    	var elms = document.querySelectorAll("[id='create_grand_total']");

	    	for(var i = 0; i < elms.length; i++) 
	    	  elms[i].value=result;
	    }
	    
	    var elms = document.querySelectorAll("[id='create_grand_total']");

    	for(var i = 0; i < elms.length; i++) 
    	  elms[i].onchange();
	}
	
	function sum7() {
		var create_grand_total = document.getElementById('create_grand_total').value;
		var create_dp = document.getElementById('create_dp').value;
		
		create_grand_total = create_grand_total.replace(/[,]+/g, '');
		create_dp = create_dp.replace(/[,]+/g, '');
	    
		if (create_grand_total == "")
			create_grand_total = 0;
	    if (create_dp == "")
	    	create_dp = 0;
	    
	    var result = parseFloat(create_grand_total) - parseFloat(create_dp);
	    result = result.toFixed(2);
	    if (!isNaN(result)) {
	    	var elms = document.querySelectorAll("[id='create_remaining_pay']");

	    	for(var i = 0; i < elms.length; i++) 
	    	  elms[i].value=result;
	    }
	    
	    var elms = document.querySelectorAll("[id='create_remaining_pay']");

    	for(var i = 0; i < elms.length; i++) 
    	  elms[i].onchange();
	}
	
	function getData() {
		var create_to = document.getElementById("create_to").value;
		var create_address = document.getElementById("create_address").value;
		var create_title = document.getElementById("create_title").value;
		var create_description = document.getElementById("create_description").value;
		var create_rate = document.getElementById("create_rate").value;
		var create_qty = document.getElementById("create_qty").value;
		var create_remark = document.getElementById("create_remark").value;
		var create_total = document.getElementById("create_total").value;
		var create_discount = document.getElementById("create_discount").value;
		var create_grand_total = document.getElementById("create_grand_total").value;
		var create_dp = document.getElementById("create_dp").value;
		var create_remaining_pay = document.getElementById("create_remaining_pay").value;
		
		if(create_to.trim()==""){
			alert("Nama customer belum di isi.");
			document.getElementById("create_to").focus();
			return;
		}
		
		if(create_address.trim()==""){
			alert("Alamat customer belum di isi.");
			document.getElementById("create_address").focus();
			return;
		}
		
		if(create_title.trim()=="pilih"){
			alert("Title belum di pilih.");
			document.getElementById("create_title").focus();
			return;
		}
		
		if(create_description.trim()==""){
			alert("Deskripsi belum di isi.");
			document.getElementById("create_description").focus();
			return;
		}
		
		if(create_rate.trim()==""){
			alert("Rate belum di isi.");
			document.getElementById("create_rate").focus();
			return;
		}
		
		if(create_qty.trim()==""){
			alert("Quantity belum di isi.");
			document.getElementById("create_qty").focus();
			return;
		}
		
		if(create_qty.trim()<=1){
			alert("Quantity setidaknya 1.");
			document.getElementById("create_qty").focus();
			return;
		}
		
		if(create_dp.trim()==""){
			alert("Down Payment belum di isi.");
			document.getElementById("create_dp").focus();
			return;
		}
		
		if(create_grand_total.trim()==""){
			alert("Maaf silahkan ulangi pengisian qty.");
			document.getElementById("create_qty").value="";
			document.getElementById("create_qty").focus();
			return;
		}
		
		if(create_remaining_pay.replace(/,/g, "").trim()<0){
			alert("Silahkan perbaiki nilai down payment.");
			document.getElementById("create_dp").value="";
			document.getElementById("create_dp").focus();
			return;
		}
		
		document.getElementById("hidden_create_to").value = create_to;
		document.getElementById("hidden_create_address").value = create_address;
		document.getElementById("hidden_create_title").value = create_title;
		document.getElementById("hidden_create_description").value = create_description;
		document.getElementById("hidden_create_rate").value = create_rate;
		document.getElementById("hidden_create_qty").value = create_qty;
		document.getElementById("hidden_create_remark").value = create_remark;
		document.getElementById("hidden_create_total").value = create_total;
		document.getElementById("hidden_create_discount").value = create_discount;
		document.getElementById("hidden_create_grand_total").value = create_grand_total;
		document.getElementById("hidden_create_dp").value = create_dp;
		document.getElementById("hidden_create_remaining_pay").value = create_remaining_pay;
		document.getElementById("form_invoice_review").submit();
	}
	
	function getDataReview() {
		var rev_create_to = document.getElementById("rev_create_to").value;
		var rev_create_address = document.getElementById("rev_create_address").value;
		var rev_create_title = document.getElementById("rev_create_title").value;
		var rev_create_description = document.getElementById("rev_create_description").value;
		var rev_create_rate = document.getElementById("rev_create_rate").value;
		var rev_create_qty = document.getElementById("rev_create_qty").value;
		var rev_create_remark = document.getElementById("rev_create_remark").value;
		var rev_create_total = document.getElementById("rev_create_total").value;
		var rev_create_discount = document.getElementById("rev_create_discount").value;
		var rev_create_grand_total = document.getElementById("rev_create_grand_total").value;
		var rev_create_dp = document.getElementById("rev_create_dp").value;
		var rev_create_remaining_pay = document.getElementById("rev_create_remaining_pay").value;
		var rev_current_time = document.getElementById("rev_current_time").value;
		
		document.getElementById("hidden_rev_create_to").value = rev_create_to;
		document.getElementById("hidden_rev_create_address").value = rev_create_address;
		document.getElementById("hidden_rev_create_title").value = rev_create_title;
		document.getElementById("hidden_rev_create_description").value = rev_create_description;
		document.getElementById("hidden_rev_create_rate").value = rev_create_rate;
		document.getElementById("hidden_rev_create_qty").value = rev_create_qty;
		document.getElementById("hidden_rev_create_remark").value = rev_create_remark;
		document.getElementById("hidden_rev_create_total").value = rev_create_total;
		document.getElementById("hidden_rev_create_discount").value = rev_create_discount;
		document.getElementById("hidden_rev_create_grand_total").value = rev_create_grand_total;
		document.getElementById("hidden_rev_create_dp").value = rev_create_dp;
		document.getElementById("hidden_rev_create_remaining_pay").value = rev_create_remaining_pay;
		document.getElementById("hidden_rev_current_time").value = rev_current_time;
		
		if (confirm('Submit invoice ?')) {
			document.getElementById("form_rev_invoice_review").submit();
		}else{
			return;
		}
	}
	
	function approveInvoice() {
		var invoice_no = document.getElementById("rev_invoice_number").value;
		var paid = document.getElementById("paid");
		var unpaid = document.getElementById("unpaid");
		
		if((!paid.checked) && (!unpaid.checked)){
			alert("Status DP Belum dipilih !");
			return;
		}
		
		if(!paid.checked){
			alert("Status down payment harus PAID !");
			return;
		}
		
		document.getElementById("invoiceNo").value = invoice_no;
		document.getElementById("invoiceAction").value = "approve";
		document.getElementById("remarkHistory").value = "down payment sudah dibayar";
		
		if (confirm("Approve invoice ?")) {
			document.getElementById("form_invoice_action").submit();
		}else{
			return;
		}
	}
	
	function rejectInvoice() {
		var invoice_no = document.getElementById("rev_invoice_number").value;
		var text_remark = document.getElementById("text_remark").value;
		
		if(text_remark.trim()==""){
			document.getElementById("text_remark").style.display = 'block';
			document.getElementById("text_remark").focus();
			return;
		}
		
		document.getElementById("invoiceNo").value = invoice_no;
		document.getElementById("invoiceAction").value = "reject";
		document.getElementById("remarkHistory").value = text_remark;
		
		if (confirm('Reject invoice ?')) {
			document.getElementById("form_invoice_action").submit();
		}else{
			return;
		}
	}
	
	function finishInvoice() {
		var invoice_no = document.getElementById("rev_invoice_number").value;
		
		document.getElementById("invoiceNo").value = invoice_no;
		document.getElementById("invoiceAction").value = "finish";
		document.getElementById("remarkHistory").value = "sisa pembayaran sudah dibayar";
		
		if (confirm('Pastikan sisa pembayaran sudah dilunasi !\nSelesaikan invoice ?')) {
			document.getElementById("form_invoice_action").submit();
		}else{
			return;
		}
	}
	
	function cancelInvoice() {
		var invoice_no = document.getElementById("rev_invoice_number").value;
		var text_remark = document.getElementById("text_remark").value;
		
		if(text_remark.trim()==""){
			document.getElementById("text_remark").style.display = 'block';
			document.getElementById("text_remark").focus();
			return;
		}
		document.getElementById("invoiceNo").value = invoice_no;
		document.getElementById("invoiceAction").value = "cancel";
		document.getElementById("remarkHistory").value = text_remark;
		
		if (confirm('Cancel invoice ?')) {
			document.getElementById("form_invoice_action").submit();
		}else{
			return;
		}
	}
</script>
<head>
	<title>Pungu Jaya Abadi | Invoice</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body style="padding-bottom: 30px">
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
	  <c:if test="${type=='edit'}">
	    <label class="badge badge-secondary badge-pill">Info Update Terakhir</label>
	  	<div class="border-bottom border-secondary"></div>
	  		
		<div><label class="small text-muted">Last update : <%= request.getAttribute("lastUpdate") %></label></div>
		<div><label class="small text-muted">By : <%= request.getAttribute("updateBy") %></label></div>
	  	
		<table id="tbl_title">
			<tr>
			   	<td></td>
			   	<th><input type="hidden"></th>
			 </tr>
			 <tr>
			    <th>
			    	<label class="badge badge-secondary badge-pill mt-4">Daftar Title</label>
 					<div class="border-bottom border-secondary"></div>
			    </th>
			    <th></th>
			 </tr>
			 <c:forEach var="invoiceBean" items="${titleList}">		  
			 	<tr>
			 		<td><textarea class="form-control" rows="3" cols="">${invoiceBean.getTitle()}</textarea></td>
 					<td><input class="btn-danger" type="button" value="delete" onclick="deleteRow(this)"></td>
				</tr>
			 </c:forEach>
		</table>
				
		<input class="btn-success mt-2" type="button" onclick="addRow('tbl_title')" value="Add" />
		<input class="btn-success" type="button" value="Submit" onclick="getDataTitle()"/>
	  </c:if>
	  
	  <c:if test="${type=='detail'}">
	    <button onclick="window.print();" class="small" style="position: fixed;bottom: 0px; right: 20px;">
	    	<img alt="" src="<%=request.getContextPath() %>/icons/printer.svg">
	    	Cetak
	    </button>
	  	<div id="detail_invoice">
		  <div id="corporate_info">
		    <c:if test="${updateResult== 'success'}">
		      <c:if test="${updateMessage!= null}">
		      	<div class="alert alert-success">
		      	  <label class="text-capitalize"><%=request.getAttribute("updateMessage")%></label>
		        </div>
		      </c:if>
		    </c:if>
		    
		    <c:if test="${updateResult== 'fail'}">
		      <c:if test="${updateMessage!= null}">
		        <div class="alert alert-danger">
		          <label class="text-capitalize"><%=request.getAttribute("updateMessage")%></label>
		        </div>
		      </c:if>
		    </c:if>
		    
		    <c:if test="${notifyDownPayment!=null}">
		    	<div class="alert alert-info">
		        	<label class="text-capitalize">Down Payment <%=request.getAttribute("notifyDownPayment")%></label>
		      </div>
		    </c:if>

		    <div class="text-center mb-2">
	      	  <img src="../image/logo.png" alt="logo" width="70" height="70">
	      	</div>
			<div class="h2 text-center">PT PUNGU JAYA ABADI</div>
			<div class="h6 text-center">Simpang Klender, Jl. I Gusti Ngurah Rai No. 44F Klender Jakarta Timur</div>
			<div class="h6 text-center">Telp : (021) 8944 5193; Website : www.pungujayaabadi.com</div>
		  </div>
		  
		  <table id="invoice_info" class="small table table-responsive table-borderless text-capitalize">
		    <tr>
		      <td>
		        INV#<%= request.getAttribute("invoice_number") %>
		  	    <input id="rev_invoice_number" type="hidden" value="<%= request.getAttribute("invoice_number") %>">
		      </td>
		    </tr>
		  </table>
		  
		  <table id="invoice_status" class="small table table-responsive table-borderless text-capitalize">
		    <tr>
		      <th>Status : </th>
		      <td>
		        <%= request.getAttribute("current_status") %>
		      </td>
		    </tr>
		  </table>
		
		  <table id="customer_info" class="small table table-responsive table-borderless text-capitalize">
		    <tr>
		      <th>To : </th>
		      <td>
		        <%= request.getAttribute("to") %>
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td style="max-width: 200px">
		        <%= request.getAttribute("address") %>  
		      </td>
		    </tr>
		  </table>
		  
		  <table id="transaction_info" class="small table table-responsive-sm table-borderless text-capitalize">
		    <tr>
		      <td>
		        <%= request.getAttribute("title") %>
		      </td>
		      <td></td>
		      <td></td>
		      <td>Tgl. Inv</td>
		      <td>
		        <%= request.getAttribute("create_date") %>
		      </td>
		    </tr>
		    <tr class="border-bottom">
		      <th>DESCRIPTION</th>
		      <th>QTY</th>
		      <th>KET</th>
		      <th>RATE</th>
		      <th>AMOUNT</th>
		    </tr>
		    <tr>
		      <td>
		        <%= request.getAttribute("description") %>
		      </td>
		      <td>
		        <%= request.getAttribute("qty") %>
		      </td>
		      <td>
		        <%= request.getAttribute("remark") %>
		      </td>
		      <td>
		        <%= request.getAttribute("rate") %>
		      </td>
		      <td>
		        <%= request.getAttribute("total") %>
		      </td>
		    </tr>
		    <tr>
		      <th></th>
		      <th></th>
		      <th></th>
		      <th class="border-bottom"></th>
		      <th class="border-bottom"></th>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>DISCOUNT</th>
		      <td>
		        <%= request.getAttribute("discount") %>
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>GRAND TOTAL</th>
		      <td>
		        <%= request.getAttribute("grand_total") %>
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>DOWN PAYMENT (DP)</th>
		      <td>
		        <%= request.getAttribute("dp") %>
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th></th>
		      <td>
		      	<b>Status DP</b>
		      	<br>
		        <input type="radio" id="paid" name="status_dp" ${dpStatus == 'paid' ? 'checked' : ''}>
		        <label for="paid" class="small">paid</label>
		        <br>
		        <input type="radio" id="unpaid" name="status_dp" ${dpStatus == 'unpaid' ? 'checked' : ''} ${current_status == 'dalam proses' || current_status == 'selesai' ? 'disabled' : ''}>
		        <label for="unpaid" class="small">unpaid</label>
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>SISA PEMBAYARAN</th>
		      <td>
		        <%= request.getAttribute("remaining_pay") %>
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td>
		        <img style="max-width: 500px; max-height: 100px" alt="stempel-pja" src="../image/stempel-pja.png">
		        <p>
		        <label class="small"><b>Pungu Jaya Abadi</b></label>
		      </td>
		      <td>
		        <c:if test="${current_status == 'selesai'}">
		          <img alt="lunas image" src="<%=request.getContextPath()%>/image/lunas.png">
		  		</c:if>
		      </td>
		    </tr>
		  </table>
		  
		  <table id="invoice_history" class="small table table-responsive-sm table-borderless">
		  	<tr>
		  	  <th>History</th>
		  	  <th>By</th>
		  	  <th>Tgl</th>
		  	  <th>Ket</th>
		  	</tr>
		  	<c:forEach var="invoiceBean" items="${invoiceHistory}">
		  	  <tr>
		  	  	<td>${invoiceBean.getAct()}</td>
		  	  	<td>${invoiceBean.getCreateBy()}</td>
		  	  	<td>${invoiceBean.getCreateDate()}</td>
		  	  	<td>${invoiceBean.getRemarkHistory()}</td>
		  	  </tr>
		  	</c:forEach>
		  </table>
		  
		  <div class="small text-sm-left alert alert-warning">
		    TRANSFER KE REKENING BCA, ACC. 5211568888, A/N PT PUNGU JAYA ABADI
		    <br>
		    DP dibayarkan paling lambat 3 hari kerja dari tanggal terbit invoice
		    <br>
		    Sisa Pembayaran dibayarkan pada saat barang sudah tiba digudang Jakarta.
		  </div>
		
		  <div class="small text-muted text-center">
		    Sea and Air International Domestic Freight Forwarder, Transporter, Warehouse, Mover, Custom Clearance Export - Import, Project Cargo and Door to Door Service.
		  </div>
		  
		  <c:if test="${sessionScope.role == 'admin' }">
			  <c:if test="${current_status == 'menunggu approval'}">
			  	<input class="btn-success" type="button" value="Approve" onclick="approveInvoice()">
			  	<input class="btn-danger" type="button" value="Reject" onclick="rejectInvoice()">
			  </c:if>
		  </c:if>
		  <c:if test="${current_status == 'dalam proses'}">
		    <input class="btn-success" type="button" value="Finish" onclick="finishInvoice()">
		    <input class="btn-danger" type="button" value="Cancel" onclick="cancelInvoice()">
		  </c:if>
		  
		  <textarea id="text_remark" style="display: none;" placeholder="Isi keterangan" class="form-control mt-2" rows="3" cols="3"></textarea>
		</div>
	  </c:if>
	  
	  <c:if test="${type=='list'}">
	    <label class="badge badge-secondary badge-pill">Search By Invoice</label>
	  	<div class="border-bottom border-secondary"></div>
	  	
	  	<table id="filter_by_invoice" class="mt-2">
	  	  <tr>
	  	  	<th class="small text-capitalize"><b>Invoice No</b></th>
	  	  	<td><input id="invoiceNoFilter" type="text" maxlength="20" onkeypress="return onlyNumber(event)"></td>
	  	  </tr>
	  	  <tr>
	  	  	<td></td>
	  	  	<td><input class="btn-success" value="Search" type="button" onclick="filterByInvoiceNo()"></td>
	  	  </tr>
	  	</table>
	  	
	  	<br>
	  	<label class="badge badge-secondary badge-pill">List Invoice</label>
	  	<div class="border-bottom border-secondary"></div>
	  	
	  	<table id="filter_invoice" class="mt-2">
	  	  <tr>
	  	    <th class="small text-capitalize"><b>Status</b></th>
	  	    <td>
	  	      <select class="form-control-sm" id="invoiceStatus">
	  	  		<option ${invoiceStatus == 'all' ? 'selected' : ''}>all</option>
	  	  		<option ${invoiceStatus == 'menunggu approval' ? 'selected' : ''}>menunggu approval</option>
	  	  		<option ${invoiceStatus == 'dalam proses' ? 'selected' : ''}>dalam proses</option>
	  	  		<option ${invoiceStatus == 'selesai' ? 'selected' : ''}>selesai</option>
	  	  		<option ${invoiceStatus == 'reject' ? 'selected' : ''}>reject</option>
	  	  		<option ${invoiceStatus == 'cancel' ? 'selected' : ''}>cancel</option>
	  		  </select>
	  		</td>
	  	  </tr>
	  	  <tr>
	  	  	<th class="small text-capitalize"><b>Created By</b></th>
	  	  	<td><input type="text" maxlength="3" value="${invoiceCreatedByFilter}" style="width: 70px" placeholder="ID" id="invoiceCreatedByFilter"></td>
	  	  </tr>
	  	  <tr>
	  	  	<td></td>
	  	  	<td><input class="btn-success" value="Search" type="button" onclick="filterInvoice()"></td>
	  	  </tr>
	  	</table>
	  	
	  	<div id="list_invoice" class="mt-2">
		  	<c:set var="rootContext" value="<%=request.getContextPath()%>"></c:set>
		  	<display:table class="table table-responsive-sm" name="invoiceList" id="row" pagesize="10" requestURI="/invoice">
		  		<display:column property="invoiceNumber" paramId="invoiceNo" title="Invoice" href="${rootContext}/invoice/detail?invoiceNo=${row.invoiceNumber}" class="btn-link"></display:column>
		  		<display:column property="name" title="Nama"></display:column>
		  		<display:column property="description" title="Deskripsi"></display:column>
		  		<display:column property="grandTotal" title="Grand Total" format="Rp. {0,number,0,000.00}"></display:column>
		  		<display:column property="createDate" title="Tgl. Inv"></display:column>
		  		<display:column property="createBy" title="Created By"></display:column>
		  		<display:column property="currentStatus" title="Status"></display:column>
		  	</display:table>
	  	</div>

		<c:if test="${emptyData == true }">
		  <div class="small bg-light">
		    Data tidak ditemukan.
		  </div>
		</c:if>
	  </c:if>
	  
	  <c:if test="${type=='add'}">
	  	<c:if test="${result== 'success'}">
	      <c:if test="${message!= null}">
	      	<div class="alert alert-success">
	      	  <label class="text-capitalize"><%=request.getAttribute("message")%></label>
	        </div>
	      </c:if>
	  	</c:if>
	  	
	  	<c:if test="${result== 'fail'}">
	      <c:if test="${message!= null}">
	      	<div class="alert alert-danger">
	      	  <label class="text-capitalize"><%=request.getAttribute("message")%></label>
	        </div>
	      </c:if>
	  	</c:if>
	  	
	  	<label class="badge badge-secondary badge-pill">Create Invoice</label>
	  	<div class="border-bottom border-secondary"></div>
			<div id="add_new_invoice">
				<table class="table table-responsive-sm small">
				  <tr>
				    <th>To</th>
				    <td><input id="create_to" placeholder="To" required autofocus></td>
				  </tr>
				  <tr>
				    <th>Alamat</th>
				    <td>
				      <textarea class="form-control" rows="3" cols="" id="create_address" placeholder="Alamat" required></textarea>
				    </td>
				  </tr>
				  <tr>
				    <th>Title</th>
				    <td>
				      <select id="create_title">
				      	<option>pilih</option>
				      	<c:forEach var="invoiceBean" items="${titleList}">
			        	  <option>${invoiceBean.getTitle()}</option>
			        	</c:forEach>
				      </select>
				    </td>
				    <td>
				      <a class="btn text-dark" href="<%=request.getContextPath()%>/invoice/edit">Edit</a>
				    </td>
				  </tr>
				  <tr>
				    <th>Deskripsi</th>
				    <td><textarea class="form-control" rows="3" cols="" id="create_description" placeholder="Deskripsi" required></textarea></td>
				  </tr>
				  <tr>
				    <th>Rate (Rp)</th>
				    <td><input onkeyup="sum1(); sum5(); sum7();" onKeyPress="validate()" oninput="separator(this)" id="create_rate" placeholder="Rate" required></td>
				  </tr>
				  <tr>
				    <th>Qty</th>
				    <td><input onkeyup="sum1(); sum5(); sum7();" onKeyPress="validate()" oninput="separator(this)" id="create_qty" placeholder="Qty" required></td>
				  </tr>
				  <tr>
				    <th>Keterangan</th>
				    <td><input id="create_remark" placeholder="Keterangan"></td>
				  </tr>
				  <tr>
				    <th>Total (Rp)</th>
				    <td><input onchange="sum5(); separator(this);" id="create_total" readonly></td>
				  </tr>
				  <tr>
				    <th>Discount (Rp)</th>
				    <td><input onKeyPress="validate()" onkeyup="sum6()" oninput="separator(this)" id="create_discount" placeholder="Discount"></td>
				  </tr>
				  <tr>
				    <th>Grand Total (Rp)</th>
				    <td><input onchange="separator(this); sum7()" id="create_grand_total" readonly></td>
				  </tr>
				  <tr>
				    <th>Down Payment (DP)</th>
				    <td><input onkeyup="sum7()" onKeyPress="validate()" oninput="separator(this)" id="create_dp" placeholder="Down Payment" required></td>
				  </tr>
				  <tr>
				    <th>Sisa Pembayaran</th>
				    <td><input onchange="separator(this);" id="create_remaining_pay" readonly></td>
				  </tr>
				</table>
				<input class="btn-success" type="button" value="Review" onclick="getData()">
			</div>
	  </c:if>
	  
	  <c:if test="${type=='review'}">
		<div id="review_invoice">
		  <div id="corporate_info">
		    <div class="text-center mb-2">
	      	  <img src="../image/logo.png" alt="logo" width="70" height="70">
	      	</div>
			<div class="h2 text-center">PT PUNGU JAYA ABADI</div>
			<div class="h6 text-center">Simpang Klender, Jl. I Gusti Ngurah Rai No. 44F Klender Jakarta Timur</div>
			<div class="h6 text-center">Telp : (021) 8944 5193; Website : www.pungujayaabadi.com</div>
		  </div>
		  
		  <table id="invoice_info" class="small table table-responsive table-borderless text-capitalize">
		    <tr>
		      <td>
		        <%= request.getAttribute("invoice_number") %>
		  	    <input id="rev_invoice_number" type="hidden" value="<%= request.getAttribute("invoice_number") %>">
		      </td>
		    </tr>
		  </table>
		  
		  <table id="customer_info" class="small table table-responsive table-borderless text-capitalize">
		    <tr>
		      <th>To : </th>
		      <td>
		        <%= request.getAttribute("create_to") %>
		        <input id="rev_create_to" type="hidden" value="<%= request.getAttribute("create_to") %>">
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td style="max-width: 200px">
		        <%= request.getAttribute("create_address") %>
		        <input id="rev_create_address" type="hidden" value="<%= request.getAttribute("create_address") %>">  
		      </td>
		    </tr>
		  </table>
		
		  <table id="transaction_info" class="small table table-responsive-sm table-borderless text-capitalize">
		    <tr>
		      <td>
		        <%= request.getAttribute("create_title") %>
		        <input id="rev_create_title" type="hidden" value="<%= request.getAttribute("create_title") %>">
		      </td>
		      <td></td>
		      <td></td>
		      <td>Tgl. Inv</td>
		      <td>
		        <%= request.getAttribute("current_time") %>
		        <input id="rev_current_time" type="hidden" value="<%= request.getAttribute("current_time") %>">
		      </td>
		    </tr>
		    <tr class="border-bottom">
		      <th>DESCRIPTION</th>
		      <th>QTY</th>
		      <th>KET</th>
		      <th>RATE</th>
		      <th>AMOUNT</th>
		    </tr>
		    <tr>
		      <td>
		        <%= request.getAttribute("create_description") %>
		        <input id="rev_create_description" type="hidden" value="<%= request.getAttribute("create_description") %>">
		      </td>
		      <td>
		        <%= request.getAttribute("create_qty") %>
		        <input id="rev_create_qty" type="hidden" value="<%= request.getAttribute("create_qty") %>">
		      </td>
		      <td>
		        <%= request.getAttribute("create_remark") %>
		        <input id="rev_create_remark" type="hidden" value="<%= request.getAttribute("create_remark") %>">
		      </td>
		      <td>
		        Rp. <%= request.getAttribute("create_rate") %>
		        <input id="rev_create_rate" type="hidden" value="<%= request.getAttribute("create_rate") %>">
		      </td>
		      <td>
		        Rp. <%= request.getAttribute("create_total") %>
		        <input id="rev_create_total" type="hidden" value="<%= request.getAttribute("create_total") %>">
		      </td>
		    </tr>
		    <tr>
		      <th></th>
		      <th></th>
		      <th></th>
		      <th class="border-bottom"></th>
		      <th class="border-bottom"></th>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>DISCOUNT</th>
		      <td>
		        Rp. <%= request.getAttribute("create_discount") %>
		        <input id="rev_create_discount" type="hidden" value="<%= request.getAttribute("create_discount") %>">
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>GRAND TOTAL</th>
		      <td>
		        Rp. <%= request.getAttribute("create_grand_total") %>
		        <input id="rev_create_grand_total" type="hidden" value="<%= request.getAttribute("create_grand_total") %>">
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>DOWN PAYMENT (DP)</th>
		      <td>
		        Rp. <%= request.getAttribute("create_dp") %>
		        <input id="rev_create_dp" type="hidden" value="<%= request.getAttribute("create_dp") %>">
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th>SISA PEMBAYARAN</th>
		      <td>
		        Rp. <%= request.getAttribute("create_remaining_pay") %>
		        <input id="rev_create_remaining_pay" type="hidden" value="<%= request.getAttribute("create_remaining_pay") %>">
		      </td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td>
		        <img style="max-width: 500px; max-height: 100px" alt="stempel-pja" src="../image/stempel-pja.png">
		        <p>
		        <label class="small"><b>Pungu Jaya Abadi</b></label>
		      </td>
		      <td></td>
		    </tr>
		    <tr>
		      <td></td>
		      <td></td>
		      <td></td>
		      <th class="h4">Pungu Jaya Abadi</th>
		      <td></td>
		    </tr>
		  </table>
		  
		  <div class="small text-sm-left alert alert-warning">
		    TRANSFER KE REKENING BCA, ACC. 5211568888, A/N PT PUNGU JAYA ABADI
		    <br>
		    DP dibayarkan paling lambat 3 hari kerja dari tanggal terbit invoice
		    <br>
		    Sisa Pembayaran dibayarkan pada saat barang sudah tiba digudang Jakarta.
		  </div>
		
		  <div class="small text-muted text-center">
		    Sea and Air International Domestic Freight Forwarder, Transporter, Warehouse, Mover, Custom Clearance Export - Import, Project Cargo and Door to Door Service.
		  </div>
		  
		  <input class="btn-success" type="button" value="Submit" onclick="getDataReview()">
		  <input class="btn-danger" type="button" value="Back" onclick="window.history.go(-1); return false;">
		</div>
	  </c:if>
	
	  <form id="form_invoice_review" action="<%=request.getContextPath()%>/invoice/review" method="post">
		<input type="hidden" id="hidden_create_to" name="hidden_create_to">
		<input type="hidden" id="hidden_create_address" name="hidden_create_address">
		<input type="hidden" id="hidden_create_title" name="hidden_create_title">
		<input type="hidden" id="hidden_create_description" name="hidden_create_description">
		<input type="hidden" id="hidden_create_rate" name="hidden_create_rate">
		<input type="hidden" id="hidden_create_qty" name="hidden_create_qty">
		<input type="hidden" id="hidden_create_remark" name="hidden_create_remark">
		<input type="hidden" id="hidden_create_total" name="hidden_create_total">
		<input type="hidden" id="hidden_create_discount" name="hidden_create_discount">
		<input type="hidden" id="hidden_create_grand_total" name="hidden_create_grand_total">
		<input type="hidden" id="hidden_create_dp" name="hidden_create_dp">
		<input type="hidden" id="hidden_create_remaining_pay" name="hidden_create_remaining_pay">
	  </form>
	
	  <form id="form_rev_invoice_review" action="<%=request.getContextPath()%>/invoice/new/create" method="post">
		<input type="hidden" id="hidden_rev_create_to" name="hidden_rev_create_to">
		<input type="hidden" id="hidden_rev_create_address" name="hidden_rev_create_address">
		<input type="hidden" id="hidden_rev_create_title" name="hidden_rev_create_title">
		<input type="hidden" id="hidden_rev_create_description" name="hidden_rev_create_description">
		<input type="hidden" id="hidden_rev_create_rate" name="hidden_rev_create_rate">
		<input type="hidden" id="hidden_rev_create_qty" name="hidden_rev_create_qty">
		<input type="hidden" id="hidden_rev_create_remark" name="hidden_rev_create_remark">
		<input type="hidden" id="hidden_rev_create_total" name="hidden_rev_create_total">
		<input type="hidden" id="hidden_rev_create_discount" name="hidden_rev_create_discount">
		<input type="hidden" id="hidden_rev_create_grand_total" name="hidden_rev_create_grand_total">
		<input type="hidden" id="hidden_rev_create_dp" name="hidden_rev_create_dp">
		<input type="hidden" id="hidden_rev_create_remaining_pay" name="hidden_rev_create_remaining_pay">
		<input type="hidden" id="hidden_rev_current_time" name="hidden_rev_current_time">
	  </form>
	
	  <form id="form_invoice_action" action="<%=request.getContextPath()%>/invoice/update" method="post">
	    <input type="hidden" id="invoiceNo" name="invoiceNo">
	    <input type="hidden" id="invoiceAction" name="invoiceAction">
	    <input type="hidden" id="remarkHistory" name="remarkHistory">
	  </form>
	
	  <form id="form_invoice_filter" action="<%=request.getContextPath()%>/invoice" method="get">
	    <input type="hidden" id="hidden_invoice_status" name="hidden_invoice_status">
	    <input type="hidden" id="hidden_invoice_created_by_filter" name="hidden_invoice_created_by_filter">
	  </form>
	  
	  <form id="form_filter_by_invoice" action="<%=request.getContextPath()%>/invoice" method="get">
	    <input type="hidden" id="hidden_invoice_no_filter" name="hidden_invoice_no_filter">
	  </form>
	  
	  <form id="invoice_update" action="<%=request.getContextPath()%>/invoice/update-form" method="post">
		<input type="hidden" id="arrTitle" name="arrTitle">
	</form>
	</div>
</body>
</html>