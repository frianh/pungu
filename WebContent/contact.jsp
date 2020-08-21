<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<title>Pungu Jaya Abadi | Info Kontak</title>
	<link rel="icon" href="image/logo.png">
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid" style="margin-top: 20px">
		<jsp:include page="/WEB-INF/carousel.jsp"></jsp:include>
		<div class="row">
			<div class="col-sm-8">
				<div class="h5 border-bottom bg-light">Tetap Terhubung</div>
				<div class="row">
					<div class="col-4">
						<div class="row">
							<div class="col-2">
								<span><img alt="" src="image/address.png" style="height: 20px; width: 20px"></span>
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
								<span><img alt="" src="image/address.png" style="height: 20px; width: 20px"></span>
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
								<span><img alt="" src="image/phone.png" style="height: 20px; width: 20px"></span>
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
								<span><img alt="" src="image/phone.png" style="height: 20px; width: 20px"></span>
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
								<span><img alt="" src="image/wa.png" style="height: 20px; width: 20px"></span>
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
								<span><img alt="" src="image/email.png" style="height: 20px; width: 20px"></span>
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
								<span><img alt="" src="image/email.png" style="height: 20px; width: 20px"></span>
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
				<form action="">
					<div class="form-group">
    					<label>Kirimkan kami email :</label>
    					<textarea class="form-control" id="" rows="5"></textarea>
  					</div>
  					<div class="row">
  						<div class="col-8"></div>
  						<div class="col-4">
  							<button type="button" class="btn badge-pill btn-block btn-success">Kirim</button>
  						</div>
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
</body>
<script src="bootstrap/js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script>
	$('.carousel').carousel({
		interval: 5000
		})
</script>
</html>