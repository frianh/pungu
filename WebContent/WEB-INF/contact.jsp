<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Pungu Jaya Abadi | Info Kontak</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
		<jsp:include page="/WEB-INF/carousel.jsp"></jsp:include>
		<div class="row">
			<div class="col-sm-8">
				<div class="h5 border-bottom bg-light">Tetap Terhubung</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="<%=request.getContextPath()%>/image/address.png" style="height: 20px; width: 20px"></span>
							</div>
							<div class="col-10">
								Alamat
							</div>
						</div>
					</div>
					<div class="col-8">
						<p>
							Jl. Harmoni 13 No. 6 Harapan Indah, Pusaka Rakyat
							<br>
							Tarumajaya
							<br>
							Bekasi Utara, Jawa Barat 17214
							<br>
							Indonesia
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="<%=request.getContextPath()%>/image/address.png" style="height: 20px; width: 20px"></span>
							</div>
							<div class="col-10">
								Alamat (Office dan Gudang)
							</div>
						</div>
					</div>
					<div class="col-8">
						<p>
							PT PUNGU JAYA ABADI (PJA CARGO)
							<br>
							Ruko Simpang Klender
							<br>
							Jl. I Gusti Ngurah Rai No. 44F, Klender
							<br>
							Jakarta Timur 13470 Indonesia
							<br>
							Telp. 021-2232 1520
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="<%=request.getContextPath()%>/image/phone.png" style="height: 20px; width: 20px"></span>
							</div>
							<div class="col-10">
								Phone (Hunting)
							</div>
						</div>
					</div>
					<div class="col-8">
						<p>021 89445193</p>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="<%=request.getContextPath()%>/image/phone.png" style="height: 20px; width: 20px"></span>
							</div>
							<div class="col-10">
								Phone
							</div>
						</div>
					</div>
					<div class="col-8">
						<p>
							<a class="text-body" style="text-decoration: none;" href="tel:081315508469">0813-1550-8469 Roy</a>
							<br>
							<a class="text-body" style="text-decoration: none;" href="tel:085882008864">0858-8200-8864 Charles</a>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="<%=request.getContextPath()%>/image/wa.png" style="height: 20px; width: 20px"></span>
							</div>
							<div class="col-10">
								WhatsApp
							</div>
						</div>
					</div>
					<div class="col-8">
						<p>
							<a class="text-body" style="text-decoration: none;" href="https://wa.me/6281315508469?text=Hi%20admin,%20saya%20tertarik%20untuk%20mendapatkan%20informasi%20logistik%20anda" target="_blank">0813-1550-8469 Roy</a>
							<br>
							<a class="text-body" style="text-decoration: none;" href="https://wa.me/6285882008864?text=Hi%20admin,%20saya%20tertarik%20untuk%20mendapatkan%20informasi%20logistik%20anda" target="_blank">0858-8200-8864 Charles</a>
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="<%=request.getContextPath()%>/image/email.png" style="height: 20px; width: 20px"></span>
							</div>
							<div class="col-10">
								Email (Official)
							</div>
						</div>
					</div>
					<div class="col-8">office@pungujayaabadi.com</div>
				</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="<%=request.getContextPath()%>/image/email.png" style="height: 20px; width: 20px"></span>
							</div>
							<div class="col-10">
								Email
							</div>
						</div>
					</div>
					<div class="col-8">
						<p>
						roy@pungujayaabadi.com
						<br>
						charles@pungujayaabadi.com
						</p>
					</div>
				</div>
				<div id="note"><small><em>*klik nomor telepon untuk akses lebih mudah</em></small></div>
				
				<br>
				<c:if test="${result== 'success'}">
		      		<div class="alert alert-success"><%=request.getAttribute("message")%></div>
		    	</c:if>
		    
		    	<c:if test="${result== 'fail'}">
		      		<div class="alert alert-danger"><%=request.getAttribute("message")%></div>
		    	</c:if>
		    	
				<form action="<%=request.getContextPath()%>/contact/send-email" method="post">
					<div class="form-group">
						<label class="h5">Kirimkan kami email</label>
						<p>
    					<label class="small">Pesan :</label>
    					<textarea class="form-control" name="body_email" id="body_email" rows="5" required></textarea>
    					<label class="small">Email :</label>
    					<input class="form-control" style="max-width: 400px" type="email" name="sender_email" id="sender_email" required>
  						<label class="small">Nama :</label>
  						<input class="form-control" style="max-width: 400px" type="text" name="sender_name" id="sender_name" required>
  						<button type="submit" class="btn badge-pill btn-block btn-success mt-3">Kirim</button>
  					</div>
				</form>
				<br>
			</div>
			
			<div class="col-sm-4">
				<jsp:include page="/WEB-INF/instagram.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	
	<form id="form_send_email" action="<%=request.getContextPath()%>/invoice/update" method="post">
	  <input type="hidden" id="invoiceNo" name="invoiceNo">
	  <input type="hidden" id="invoiceAction" name="invoiceAction">
	  <input type="hidden" id="remarkHistory" name="remarkHistory">
	</form>
</body>
</html>