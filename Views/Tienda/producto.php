<?php 
headerTienda($data);

// Cambiar de 'producto' a 'servicio'
$arrServicio = $data['servicio']; 
$arrImages = $arrServicio['url_image']; 
$arrServicios = $data['servicios'];  // Lista de servicios relacionados

	// Pasar el resultado a JavaScript
	echo "<script type='text/javascript'>
	// Convertimos el resultado de PHP a JSON para usarlo en JavaScript
	var resultadoServicio = " . json_encode($arrServicios) . ";

	// Imprimir el resultado en la consola de Google
	console.log('Resultado del servicio:', resultadoServicio);
  </script>";
// Actualiza la ruta de categoría a algo relacionado con servicios, si corresponde
$rutaServicio = $arrServicio['idservicio'].'/'.$arrServicio['ruta']; 

// Enlazar el producto o servicio para compartir en redes sociales
$urlShared = base_url()."/tienda/producto/".$arrServicio['idservicio']."/".$arrServicio['ruta'];
?>
<br><br><br>
<hr>
	<!-- breadcrumb -->
<div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
        <a href="<?= base_url(); ?>" class="stext-109 cl8 hov-cl1 trans-04">
            Inicio
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>
        <!-- Cambié 'categoria' a algo más apropiado para los servicios -->
        <a href="<?= base_url().'/servicio'?>" class="stext-109 cl8 hov-cl1 trans-04">
            Servicio
            <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
        </a>
        <span class="stext-109 cl4">
            <?= $arrServicio['nombre'] ?> <!-- Cambié 'producto' a 'servicio' -->
        </span>
    </div>
</div>
<!-- Detalle del servicio -->
<section class="sec-product-detail bg0 p-t-65 p-b-60">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-lg-7 p-b-30">
                <div class="p-l-25 p-r-30 p-lr-0-lg">
                    <div class="wrap-slick3 flex-sb flex-w">

                        <div class="slick3 gallery-lb">
							<?php 
								// Verificar si hay imágenes disponibles para el servicio
								if(!empty($arrImages)){
							?>
								<div class="item-slick3" data-thumb="<?= $arrImages ?>">
									<div class="wrap-pic-w pos-relative">
										<!-- Mostrar la imagen pequeña en miniatura -->
										<img src="<?= $arrImages ?>" alt="<?= $arrServicio['nombre']; ?>">
										
										<!-- Botón para expandir la imagen al hacer clic -->
										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="<?= $arrImages ?>">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							<?php 
									
								} else {
									// Si no hay imágenes, se puede mostrar una imagen predeterminada o un mensaje
									echo '<p>No hay imágenes disponibles para este servicio.</p>';
								}
							?>
						</div>


                    </div>
                </div>
            </div>
            <!-- Detalles del servicio -->
            <div class="col-md-6 col-lg-5 p-b-30">
                <div class="p-l-25 p-r-30 p-lr-0-lg">
                    <h4 class="mtext-105 cl2 js-name-detail p-b-14">
                        <?= $arrServicio['nombre'] ?>
                    </h4>
						<span class="mtext-106 cl2">
							<?= SMONEY.formatMoney($arrServicio['precio']); ?>
						</span>
						<p class="stext-102 cl3 p-t-23"></p>
						<?= $arrServicio['descripcion']; ?>
						<!--  -->
						<div class="p-t-33">
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<div class="wrap-num-product flex-w m-r-20 m-tb-10">
										<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-minus"></i>
										</div>

										<input id="cant-product" class="mtext-104 cl3 txt-center num-product" type="number" name="num-product" value="1" min="1">

										<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
											<i class="fs-16 zmdi zmdi-plus"></i>
										</div>
									</div>

									<button id="<?= openssl_encrypt($arrServicio['idservicio'],METHODENCRIPT,KEY); ?>" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
										Agregar al carrito
									</button>
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Related Products -->
	<section class="sec-relate-product bg0 p-b-105">
    <div class="flex-c-m flex-w size-302">
        <h3>Servicios relacionados</h3>
    </div>
    <div class="container">
        <!-- Slide2 -->
        <div class="wrap-slick2">
            <div class="slick2">

            <?php 
                // Verifica si el array $arrServicios tiene elementos
                if (!empty($arrServicios) && is_array($arrServicios)) {
                    foreach ($arrServicios as $servicio) {
                        // Asignación de valores desde el JSON
                        $ruta = $servicio['ruta'];
                        $portada = !empty($servicio['url_image']) ? $servicio['url_image'] : media() . '/images/uploads/product.png'; // Valor predeterminado si no existe la imagen
                        $nombre = $servicio['nombre'];
                        $precio = $servicio['precio']; // Se obtiene el precio
                        $idServicio = $servicio['idservicio'];
            ?>
                <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 p-r-20 p-l-20 isotope-item women">
            <div class="block2">
                <div class="block2-pic hov-img0" style="height: 150px;">
				<img src="<?= $portada ?>" alt="<?= $nombre ?>" style="height: 100%;">

                            <a href="<?= base_url().'/tienda/producto/'.$idServicio.'/'.$ruta; ?>" 
									class="block2-btn flex-c-m stext-103 cl2 size-102 bg-orange bor2 hov-btn1 p-lr-15 trans-04">
								Ver producto
							</a>
                        </div>

						<div class="block2-txt flex-w flex-t p-t-14">
						<div class="block2-txt-child1 flex-col-l ">
                                <a href="<?= base_url().'/tienda/producto/'.$idServicio.'/'.$ruta; ?>" 
								class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                                    <?= $nombre ?>
                                </a>
                                <span class="stext-105 cl3">
								<b>
                                    S/. <?= number_format($precio, 2) ?>
									</b>
                                </span>
								</div>

                                <div class="block2-txt-child2 flex-r p-t-3">
									<a href="#" id="<?= openssl_encrypt($idServicio ?? 0, METHODENCRIPT, KEY); ?>"
										class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addcart-detail
										icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11
										">
										<i class="bi bi-calendar cl11"></i>
										</a>
                    </div>
                </div>
            </div>
        </div>
<?php
    }
} else {
    echo "<p>No hay productos disponibles.</p>";
}
?>

</section>




<?php 
	footerTienda($data);
?>
