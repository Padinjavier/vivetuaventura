	<?php 
		$catFotter = getCatFooter();
	 ?>
	<!-- Footer -->
	<footer class="bg-orange p-t-75 p-b-32">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-lg-4 p-b-50">
					<h4 class="stext-301 cl0 p-b-30 ">
						Categorías
					</h4>
					<ul class="text-white">
						<li>Deportes de aventura</li>
						<br>
						<li>Tours</li>
						<br>
						<li>Deportes extremos</li>
					</ul>
				</div>

				<div class="col-sm-6 col-lg-4 p-b-50 text-white">
					<h4 class="stext-301 cl0 p-b-30">
						Cotacto
					</h4>

					<p class="stext-107 cl7 size-201 text-white">
						<?= DIRECCION ?> <br>
						Tel: <a class="linkFooter" href="tel:<?= TELEMPRESA ?>"><?= TELEMPRESA ?></a><br>
						Email: <a class="linkFooter" href="mailto:<?= EMAIL_EMPRESA ?>"><?= EMAIL_EMPRESA ?></a>
					</p>

					<div class="p-t-27 ">
						
						<a href="<?= INSTAGRAM ?>" target="_blanck"  class="fs-18 cl7 hov-cl1 trans-04 m-r-16 text-white">
							<i class="fa fa-instagram"></i>
						</a>
						
						<a href="https://wa.me/<?= WHATSAPP ?>" target="_blanck"  class="fs-18 cl7 hov-cl1 trans-04 m-r-16 text-white">
							<i class="fab fa-whatsapp"></i>
						</a>
						<a href="<?= FACEBOOK ?>" target="_blanck" class="fs-18 cl7 hov-cl1 trans-04 m-r-16 text-white">
							<i class="fa fa-facebook"></i>
						</a>
					</div>
				</div>

				<?php if (isset($_SESSION['login'])) { ?>
						<div class="col-sm-6 col-lg-4 p-b-50">
							<h4 class="stext-301 cl0 p-b-30">
								Inicia sesión
							</h4>
							<div class="stext-107 cl7 size-201 text-white">
								Usted ya tiene la sección iniciada.
							</div>
							<div class="p-t-18">
								<a href="<?= base_url() ?>/logout" class="flex-c-m stext-101 cl0 size-103 bg-light bor2 hov-btn2 p-lr-15 trans-04 text-warning">
									Cerrar sesión
								</a>
							</div>
						</div>
				<?php } else { ?>
						<div class="col-sm-6 col-lg-4 p-b-50">
							<h4 class="stext-301 cl0 p-b-30">
								Inicia sesión
							</h4>
							<form class="login-form " name="formLogin" id="formLogin" action="">
								<div class="wrap-input1 w-full p-b-4">
									<input class="input1 bg-none plh1 stext-107 cl7" type="text" id="txtEmail" name="txtEmail" placeholder="Nombre completo" required>
									<div class="focus-input1 trans-04"></div>
								</div>
								<br>
								<div class="wrap-input1 w-full p-b-4">
									<input class="input1 bg-none plh1 stext-107 cl7" type="password" id="txtPassword" name="txtPassword" placeholder="Contraseña" required>
									<div class="focus-input1 trans-04"></div>
								</div>
								<div class="p-t-18">
									<button class="flex-c-m stext-101 cl0 size-103 bg-light bor2 hov-btn2 p-lr-15 trans-04 text-warning">
										Ingresar
									</button>
								</div>
							</form>
						</div>
				<?php } ?>
			</div>

			<div class="p-t-40">
				<p class="stext-107 cl6 txt-center text-white">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<?= NOMBRE_EMPESA; ?> | <?= WEB_EMPRESA; ?>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>
	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>
	<script>
	    const base_url = "<?= base_url(); ?>";
		const smony = "<?= SMONEY; ?>";
	</script>
<!--===============================================================================================-->	
	<script src="<?= media() ?>/tienda/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/bootstrap/js/popper.js"></script>
	<script src="<?= media() ?>/tienda/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/daterangepicker/moment.min.js"></script>
	<script src="<?= media() ?>/tienda/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/slick/slick.min.js"></script>
	<script src="<?= media() ?>/tienda/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/parallax100/parallax100.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/sweetalert/sweetalert.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media() ?>/tienda/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<!--===============================================================================================-->
	<script src="<?= media();?>/js/fontawesome.js"></script>
	<script src="<?= media() ?>/tienda/js/main.js"></script>
	<script src="<?= media();?>/js/functions_admin.js"></script>
	<script src="<?= media() ?>/js/functions_login.js"></script>
	<script src="<?= media() ?>/tienda/js/functions.js"></script>
</body>
</html>