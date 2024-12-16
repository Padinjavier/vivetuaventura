<?php
headerTienda($data);

$subtotal = 0;
$total = 0;
foreach ($_SESSION['arrCarrito'] as $producto) {
	$subtotal += $producto['precio'] * $producto['cantidad'];
}
$total = $subtotal + COSTOENVIO;

$tituloTerminos = !empty(getInfoPage(PTERMINOS)) ? getInfoPage(PTERMINOS)['titulo'] : "";
$infoTerminos = !empty(getInfoPage(PTERMINOS)) ? getInfoPage(PTERMINOS)['contenido'] : "";

?>

<!-- Modal -->
<div class="modal fade" id="modalTerminos" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<?= $tituloTerminos ?>
				</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="page-content">
					<?= $infoTerminos ?>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>

<br><br><br>
<hr>
<!-- breadcrumb -->
<div class="container">
	<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		<a href="<?= base_url() ?>" class="stext-109 cl8 hov-cl1 trans-04">
			Inicio
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
		</a>
		<span class="stext-109 cl4">
			<?= $data['page_title'] ?>
		</span>
	</div>
</div>
<br>
<div class="container">
	<div class="row">
		<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
			<div class="bor10 p-lr-20 p-t-30 p-b-40  m-r--38 m-lr-0-xl">
				<div>
					<?php
					if (isset($_SESSION['login'])) {
						?>
						<form id="datosreserva">
						<div class="container mt-4">
									<!-- Primera fila (3 columnas) -->
									<div class="row">
										<!-- Columna 1: N° de celular -->
										<div class="col-md-4 mb-3">
											<label for="numeroCelular">N° de celular</label>
											<input type="text" class="form-control" id="numeroCelular" name="numeroCelular" placeholder="N° de celular" value="<?= $_SESSION['userData']['telefono']; ?>">
										</div>
										
										<!-- Columna 2: Modalidad de pago -->
										<div class="col-md-4 mb-3">
											<label>Modalidad de pago</label>
											<div class="form-check d-flex align-items-center mb-2">
												<input class="form-check-input me-2" type="radio" id="modalidadYape" name="modalidadPago" value="yape">
												<label class="form-check-label" for="modalidadYape">Yape</label>
											</div>
											<div class="form-check d-flex align-items-center">
												<input class="form-check-input me-2" type="radio" id="modalidadBCP" name="modalidadPago" value="bcp">
												<label class="form-check-label" for="modalidadBCP">BCP</label>
											</div>
										</div>
										
										<!-- Columna 3: Información de pago -->
										<div class="col-md-4 mb-3">
											<label for="informacionPago">Información de pago</label>
											<p>
												<span>Yape (Yesenia Arbizu): <br>
													- N° de celular: 910089718</span><br><br>
												<span>BCP (Yesenia Arbizu): <br>
												- N° Cuenta: 04-029-958659</span>
											</p>
										</div>
									</div>

									<!-- Segunda fila (3 columnas) -->
									<div class="row">
										<!-- Columna 1: Fecha de pago -->
										<div class="col-md-6 mb-3">
											<label for="fechaPago">Fecha de pago</label>
											<input type="date" class="form-control" id="fechaPago" name="fechaPago">
										</div>

										<!-- Columna 2 y 3: Código de voucher -->
										<div class="col-md-6 mb-3">
											<label for="codigoVoucher">Código de voucher</label>
											<input type="text" class="form-control" id="codigoVoucher" name="codigoVoucher" placeholder="Código de voucher">
										</div>
									</div>

									<!-- Tercera fila (3 columnas) -->
									<div class="row">
										<!-- Columna 1: Adjuntar voucher -->
										<div class="col-md-12 mb-3">
											<label for="adjuntarVoucher">Adjuntar voucher de pago</label>
											<input type="file" class="form-control" id="adjuntarVoucher" name="adjuntarVoucher" accept=".jpg, .png">
										</div>

									</div>

									<!-- Cuarta fila (2 columnas) -->
									<div class="row mt-4">
										<!-- Columna 1: Botón de reserva -->
										<div class="col-md-4 mb-3">
											<button type="submit" class="btn stext-101 cl0 bor13 w-100 bg-orange">Reservar</button>
										</div>
									</div>
							</div>

						</form>
					<?php } else { ?>

						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active" id="home-tab" data-toggle="tab" href="#login" role="tab"
									aria-controls="home" aria-selected="true">Iniciar Sesión</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="profile-tab" data-toggle="tab" href="#registro" role="tab"
									aria-controls="profile" aria-selected="false">Crear cuenta</a>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="home-tab">
								<br>
								<form id="formLogin">
									<div class="form-group">
										<label for="txtEmail">Usuario</label>
										<input type="email" class="form-control" id="txtEmail" name="txtEmail">
									</div>
									<div class="form-group">
										<label for="txtPassword">Contraseña</label>
										<input type="password" class="form-control" id="txtPassword" name="txtPassword">
									</div>
									<button type="submit" class="btn btn-primary">Iniciar sesión</button>
								</form>

							</div>
							<div class="tab-pane fade" id="registro" role="tabpanel" aria-labelledby="profile-tab">
								<br>
								<form id="formRegister">
									<div class="row">
										<div class="col col-md-6 form-group">
											<label for="txtIdentificacion">Identificacion</label>
											<input type="text" class="form-control" id="txtIdentificacion"
												name="txtIdentificacion" required="">
										</div>
										<div class="col col-md-6 form-group">
											<label for="txtNombre">Nombres</label>
											<input type="text" class="form-control valid validText" id="txtNombre"
												name="txtNombre" required="">
										</div>
									</div>
									<div class="row">
										<div class="col col-md-6 form-group">
											<label for="txtApellido">Apellidos</label>
											<input type="text" class="form-control valid validText" id="txtApellido"
												name="txtApellido" required="">
											</div>
										<div class="col col-md-6 form-group">
											<label for="txtTelefono">Teléfono</label>
											<input type="text" class="form-control valid validNumber" id="txtTelefono"
												name="txtTelefono" required="" onkeypress="return controlTag(event);">
										</div>
									</div>
									<div class="row">
										<div class="col col-md-6 form-group">
											<label for="txtEmailCliente">Email</label>
											<input type="email" class="form-control valid validEmail" id="txtEmailCliente"
												name="txtEmailCliente" required="">
										</div>
										<div class="col col-md-6 form-group">
											<label for="txtpasscliente">Contraseña</label>
											<input type="password" class="form-control " id="txtpasscliente"
												name="txtpasscliente" required="">
										</div>
									</div>
									<button type="submit" class="btn btn-primary">Regístrate</button>
								</form>
							</div>
						</div>

					<?php } ?>
				</div>
			</div>
		</div>

		<div class="col-sm-10 col-lg-7 col-xl-4 m-lr-auto m-b-50">
			<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-40 m-r-40 m-lr-0-xl p-lr-15-sm">
				<h4 class="mtext-109 cl2 p-b-30">
					Resumen
				</h4>

				<div class="flex-w flex-t bor12 p-b-13">
					<div class="size-208">
						<span class="stext-110 cl2">
							Subtotal:
						</span>
					</div>

					<div class="size-209">
						<span id="subTotalCompra" class="mtext-110 cl2">
							<?= SMONEY . formatMoney($subtotal) ?>
						</span>
					</div>
				</div>
				<div class="flex-w flex-t p-t-27 p-b-33">
					<div class="size-208">
						<span class="mtext-101 cl2">
							Total:
						</span>
					</div>

					<div class="size-209 p-t-1">
						<span id="totalCompra" class="mtext-110 cl2">
							<?= SMONEY . formatMoney($total) ?>
						</span>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
</div>

<?php
footerTienda($data);
?>