<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
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
	    if(!nums)return;
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
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/custom.css">
	<title>Pungu Jaya Abadi | Simulasi</title>
	<link rel="icon" href="image/logo.png">
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
	<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
  		<a class="navbar-brand" href="#">
    		<img src="image/logo.png" width="50" height="50" alt="">
  		</a>
  
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>

  		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    		<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      			<li class="nav-item">
        			<a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="profile.jsp">Profil</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="service.jsp">Service</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="contact.jsp">Info Kontak</a>
      			</li>
      			<li class="nav-item">
        			<a class="nav-link" href="simulation.jsp">Simulasi</a>
      			</li>
    		</ul>
    		
    		<form class="form-inline my-2 my-lg-0">
      			<input class="form-control mr-sm-2" type="search" placeholder="Search">
      			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    		</form>
  		</div>
	</nav>
	
	
    <div class="container">
      <br>
	  <div class="h3 text-center">Simulasi</div>
	  
	  <label class="badge badge-success badge-pill">Kurs</label>
	  <div class="border-bottom border-dark"></div>
	  <p>
	  <div id="div_kurs" class="bg-light">		  
		  <div class="form-row">
		    <div class="col-4">
		      <small>Kurs 1 CNY - IDR</small>
		    </div>
		    <div class="col-8">
		      <input onKeyPress="validate()" type="text" class="form-control" id="kurs">
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
	  	        <option>6,000,000</option>
	  	        <option>6,500,000</option>
	  	        <option>7,000,000</option>
	  	        <option>7,500,000</option>
	  	        <option>8,000,000</option>
	  	        <option>8,500,000</option>
	  	        <option>9,000,000</option>
	  	        <option>9,500,000</option>
	  	        <option>10,000,000</option>
	  	        <option>10,500,000</option>
	  	        <option>11,000,000</option>
	  	        <option>11,500,000</option>
	  	        <option>12,000,000</option>
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
	</div>
	
	<div id="footer">
 		<div class="bg-light text-center text-black-50">
 			<small>Pungu Jaya Abadi © 2020 Copyright</small>
	 	</div>
 	</div>
 	
 	<div class="fixed-bottom">
		<a href="https://wa.me/6281315508469?text=Hi%20admin,%20saya%20tertarik%20untuk%20mendapatkan%20informasi%20logistik%20anda" target="_blank">
			<span class="float-right">
				<img alt="" src="image/wa.png" style="width: 50px">
			</span>
		</a>
	</div>
</body>
<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
	$('.carousel').carousel({
		interval: 5000
		})
</script>
</html>