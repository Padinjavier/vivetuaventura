<?php
$cantCarrito = 0;
if (isset($_SESSION['arrCarrito']) and count($_SESSION['arrCarrito']) > 0) {
	foreach ($_SESSION['arrCarrito'] as $product) {
		$cantCarrito += $product['cantidad'];
	}
}
$tituloPreguntas = !empty(getInfoPage(PPREGUNTAS)) ? getInfoPage(PPREGUNTAS)['titulo'] : "";
$infoPreguntas = !empty(getInfoPage(PPREGUNTAS)) ? getInfoPage(PPREGUNTAS)['contenido'] : "";
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>
		<?= $data['page_tag']; ?>
	</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<?php
	$nombreSitio = NOMBRE_EMPESA;
	$descripcion = DESCRIPCION;
	$nombreProducto = NOMBRE_EMPESA;
	$urlWeb = base_url();
	$urlImg = media() . "/images/portada.jpg";
	
if (!empty($data['servicio'])) {
    // Asignar valores a las variables
    $descripcion = !empty($data['servicio']['descripcion']) ? $data['servicio']['descripcion'] : 'Descripción no disponible';  // Verifica que exista 'descripcion'
    $nombreServicio = !empty($data['servicio']['nombre']) ? $data['servicio']['nombre'] : 'Nombre no disponible'; // Verifica que exista 'nombre'
    $urlWeb = base_url() . "/tienda/producto/" . $data['servicio']['idservicio'] . "/" . $data['servicio']['ruta'];

    // Verifica si 'images' existe y tiene al menos un elemento
    if (!empty($data['servicio']['images']) && isset($data['servicio']['images'][0]['url_image'])) {
        $urlImg = $data['servicio']['images'][0]['url_image'];  // Obtén la imagen
    } else {
        $urlImg = 'ruta/default/image.png';  // Imagen predeterminada si no hay imágenes
    }
} else {
    // Si no hay 'servicio', asigna valores predeterminados
    $descripcion = 'Descripción no disponible';
    $nombreServicio = 'Nombre no disponible';
    $urlWeb = base_url();  // Página principal como fallback
    $urlImg = 'ruta/default/image.png';  // Imagen predeterminada
}
?>

	<meta property="og:locale" content='es_ES' />
	<meta property="og:type" content="website" />
	<meta property="og:site_name" content="<?= $nombreSitio; ?>" />
	<meta property="og:description" content="<?= $descripcion; ?>" />
	<meta property="og:title" content="<?= $nombreProducto; ?>" />
	<meta property="og:url" content="<?= $urlWeb; ?>" />
	<meta property="og:image" content="<?= $urlImg; ?>" />

	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="<?= media() ?>/tienda/images/favicon.ico" />
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css"
		href="<?= media() ?>/tienda/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css"
		href="<?= media() ?>/tienda/fonts/iconic/css/material-design-iconic-font.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/fonts/linearicons-v1.0.0/icon-font.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/animsition/css/animsition.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/daterangepicker/daterangepicker.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/slick/slick.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/MagnificPopup/magnific-popup.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/vendor/perfect-scrollbar/perfect-scrollbar.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/css/util.css">
	<link rel="stylesheet" type="text/css" href="<?= media() ?>/tienda/css/main.css">
	<link rel="stylesheet" type="text/css" href="<?= media(); ?>/css/style.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<style>@import url("https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css");</style>
</head>

<body class="animsition">
	<!-- Modal -->
	<div class="modal fade" id="modalAyuda" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">
						<?= $tituloPreguntas ?>
					</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="page-content">
						<?= $infoPreguntas; ?>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>
	<div id="divLoading">
		<div>
			<img src="<?= media(); ?>/images/loading.svg" alt="Loading">
		</div>
	</div>
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						<?php if (isset($_SESSION['login'])) { ?>
							Bienvenido:
							<?= $_SESSION['userData']['nombres'] . ' ' . $_SESSION['userData']['apellidos'] ?>
						<?php } ?>
					</div>

					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m trans-04 p-lr-25" data-toggle="modal" data-target="#modalAyuda">
							Help & FAQs
						</a>
						<?php
						if (isset($_SESSION['login'])) {
							?>
							<a href="<?= base_url() ?>/dashboard" class="flex-c-m trans-04 p-lr-25">
								Mi cuenta
							</a>
						<?php }
						if (isset($_SESSION['login'])) {
							?>
							<a href="<?= base_url() ?>/logout" class="flex-c-m trans-04 p-lr-25">
								Salir
							</a>
						<?php } else { ?>
							<a href="<?= base_url() ?>/login" class="flex-c-m trans-04 p-lr-25">
								Iniciar Sesión / Crear cuenta
							</a>
						<?php } ?>
						<div class="flex-c-m trans-04 p-lr-25">
					<!-- <button class="mode_color_dia botondianoche">
						<i class="far fa-sun"></i>
						Dia
              		</button>
					<button class="mode_color_noche botondianoche">
						<i class="fas fa-moon"></i>
						Noche
              		</button> -->
					</div>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop">
				<nav class="limiter-menu-desktop container">

					<!-- Logo desktop -->
					<a href="<?= base_url(); ?>" class="logo">
						<img src="<?= media() ?>/images/logo.jpg" alt="Tienda Virtual">
						<p class="text-dark m-0  ml-4">Vive tu aventura</p>
					</a>

					<!-- Menu desktop -->
					<!-- <div class="menu-desktop">
						<ul class="main-menu">
						<?php 
						// // Recorre cada elemento en $data['PaginasLink'] y genera un enlace
						// foreach ($data['PaginasLink'] as $pagina) { 
						// 	// Verifica si la página está activa antes de mostrar el enlace
						// 	if ($pagina['status'] == "1") { 
						// ?>
						// 	<li>
						// 		<a href="<?= base_url() . '/' . $pagina['ruta']; ?>"><?= $pagina['titulo']; ?></a>
						// 	</li>
						// <?php 
						// 	}
						// } 
						?>
						</ul>
					</div> -->
					<div class="menu-desktop">
						<ul class="main-menu color-">
							<li class="active-menu">
								<a href="<?= base_url(); ?>/home">Inicio</a>
							</li>
							<li>
								<a href="<?= base_url(); ?>/nosotros">Nosotros</a>
							</li>
							
							<li>
								<a href="<?= base_url(); ?>/servicio">Servicio</a>
							</li>
							<li>
								<a href="<?= base_url(); ?>/carrito">Reservas</a>
							</li>
							<li>
								<a href="<?= base_url(); ?>/contacto">Contacto</a>
							</li>
						</ul>
					</div>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m">
						<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
							<i class="zmdi zmdi-search"></i>
						</div>
						<?php if ($data['page_name'] != "carrito" and $data['page_name'] != "procesarpago") { ?>
							<div class="cantCarrito icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
								data-notify="<?= $cantCarrito; ?> ">
								<i class="bi bi-calendar"></i>
							</div>
						<?php } ?>
					</div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="<?= base_url(); ?>"><img src="<?= media() ?>/images/logo.jpg"
						alt="Tienda Virtual"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>
				<?php if ($data['page_name'] != "carrito" and $data['page_name'] != "procesarpago") { ?>
					<div class="cantCarrito icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart"
						data-notify="<?= $cantCarrito; ?>">
						<i class="zmdi zmdi-shopping-cart"></i>
					</div>
				<?php } ?>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box">
					<span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">
						<?php if (isset($_SESSION['login'])) { ?>
							Bienvenido:
							<?= $_SESSION['userData']['nombres'] . ' ' . $_SESSION['userData']['apellidos'] ?>
						<?php } ?>
					</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04" data-toggle="modal" data-target="#modalAyuda">
							Help & FAQs
						</a>
						<?php
						if (isset($_SESSION['login'])) {
							?>
							<a href="<?= base_url() ?>/dashboard" class="flex-c-m trans-04 p-lr-25">
								Mi cuenta
							</a>
						<?php }
						if (isset($_SESSION['login'])) {
							?>
							<a href="<?= base_url() ?>/logout" class="flex-c-m trans-04 p-lr-25">
								Salir
							</a>
						<?php } else { ?>
							<a href="<?= base_url() ?>/login" class="flex-c-m trans-04 p-lr-25">
								Iniciar Sesión / Crear cuenta
							</a>
						<?php } ?>
						<!-- <button class="mode_color_dia botondianoche">
						<i class="far fa-sun"></i>
						Dia
              		</button>
					<button class="mode_color_noche botondianoche">
						<i class="fas fa-moon"></i>
						Noche
              		</button> -->
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li>
					<a href="<?= base_url(); ?>/home">Inicio</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/tienda">Tienda</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/carrito">Carrito</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/nosotros">Nosotros</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/sucursales">Sucursales</a>
				</li>

				<li>
					<a href="<?= base_url(); ?>/contacto">Contacto</a>
				</li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="<?= media() ?>/tienda/images/icons/icon-close2.png" alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15" method="get" action="<?= base_url() ?>/tienda/search">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input type="hidden" name="p" value="1">
					<input class="plh3" type="text" name="s" placeholder="Buscar...">
				</form>
			</div>
		</div>
	</header>
	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>
		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Tu carrito
				</span>
				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			<div id="productosCarrito" class="header-cart-content flex-w js-pscroll">
				<?php getModal('modalCarrito', $data); ?>
			</div>
		</div>
	</div>