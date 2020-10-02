<!DOCTYPE html>
<html lang="en">
<head>
	<title>Pungu Jaya Abadi | Profil</title>
	<link rel="icon" href="<%=request.getContextPath()%>/image/logo.png">
</head>
<body>
	<jsp:include page="/WEB-INF/nav.jsp"></jsp:include>
	<div class="container-fluid mt-3">
		<jsp:include page="/WEB-INF/carousel.jsp"></jsp:include>
		<div class="row">
			<div class="col-sm-8">
				<div class="h5 border-bottom bg-light">Tentang Kami</div>
				<div class="row">
					<div class="col-sm-4">
						<div id="logo" class="logo">
							<div class=" mx-auto " style="height: 200px; width: 200px">
								<img alt="" src="image/logo.png" class="card-img">
							</div>
						</div>
					</div>
					<br>
					<br>
					<div class="col-sm-8">
						<p class="p-sm-1">Berdiri sejak tahun 2008, Pungu Jaya Abadi adalah perusahaan yang bergerak dalam bidang Freight Forwarding dengan layanan pengiriman Door to Door untuk membantu rekanan dalam menangani proses ekspor dan impor dengan jangkauan pengiriman dari dan ke seluruh dunia.</p>
						<p class="p-sm-1">Head Office kami di Pusat Kota Bekasi, dalam tugas dan tanggungjawab kami akan berusaha maksimal agar setiap proses pengiriman mulai dari penerimaan barang dinegara asal hingga barang sampai negera tujuan dapat tepat waktu dan biaya yang sangat terjangkau.</p>
					</div>
				</div>
				
				<p class="p-sm-1">Kami akan memberikan pelayanan terbaik, menyeluruh dan flexible disesuaikan dengan kebutuhan rekanan melalui pilihan fasilitas pengiriman jalur laut (Sea Freight) maupun Udara (Air Freight) dengan sistim FOB (Free On Board), Ex Work, pengapalan domestik, logistik, trucking, pergudangan, custom clearance dan layanan terkait lainnya.</p>
				
				<div id="legal">
					<div class="h6 border-bottom bg-light text-success">Legalitas</div>
					<p class="p-1">
					Keputusan Menteri Hukum dan Hak Asasi Manusia Republik Indonesia
					<br>
					Daftar Perseroan Nomor AHU-0002490.AH.01.11.TAHUN 2020
					<br>
					Nomor Pendaftaran 4020010832100927
					</p>
				</div>
			</div>

			<div class="col-sm-4">
				<jsp:include page="/WEB-INF/instagram.jsp"></jsp:include>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
</body>
</html>