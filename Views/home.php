<?php
headerTienda($data);
$arrSlider = $data['slider'];
$arrBanner = $data['banner'];
$arrProductos = $data['productos'];

$contentPage = "";
if (!empty($data['page'])) {
	$contentPage = $data['page']['contenido'];
}

?>
<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1">
		<div class="slick1">
			<?php
			for ($i = 0; $i < count($arrSlider); $i++) {
				$ruta = $arrSlider[$i]['ruta'];
				?>
				<div class="item-slick1" style="background-image: url(<?= $arrSlider[$i]['portada'] ?>); 
	background-size: cover !important;
	background-repeat: no-repeat;">
					<div class="container h-full d-flex justify-content-center flex-column align-items-end pt-5">
						<div class="flex-col-l-m h-full  respon5 bg-white"
							style="width: 400px; height: 350px; border-radius: 40px; padding: 20px 40px 20px 40px;">
							<div class="layer-slick1 animated visible-false mb-3" data-appear="fadeInUp" data-delay="800">
								<span class="ltext-103 cl11 p-t-19 p-b-43 respon1">
									<!-- <?= $arrSlider[$i]['nombre'] ?> -->
									Turismo en Lunahuaná
								</span>
							</div>
							<div class="layer-slick1 animated visible-false mb-3" data-appear="fadeInDown" data-delay="0">
								<span class="stext-107 cl10 respon2">
									<!-- <?= $arrSlider[$i]['descripcion'] ?> -->
									Desestrésate con los diversos servicios que te ofrecemos, como: Canotaje, cuatrimotos,
									canopy, juegos en el aire. <br>
									¡En Vive tu aventura Lunahuaná, la diversión está asegurada!
								</span>
							</div>


							<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
								<a href="<?= base_url() . '/tienda/categoria/' . $arrSlider[$i]['idcategoria'] . '/' . $ruta; ?>"
									class="flex-c-m stext-101 cl0 size-101  bg1 p-lr-15 trans-04"
									style="border-radius: 5px;">
									Mas informacion
								</a>
							</div>
						</div>
					</div>
				</div>
			<?php
			}
			?>
		</div>
	</div>
</section>

<!-- Banner -->
<div class="sec-banner bg0 p-t-80 p-b-50">
	<div class="container">
		<div class="row">
			<?php
			for ($j = 0; $j < count($arrBanner); $j++) {
				$ruta = $arrBanner[$j]['ruta'];
				?>
				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto" style="width: 300px; height:200px">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w" style="overflow: hidden; position: relative; width: 100%; height: 100%;">
						<img src="<?= $arrBanner[$j]['portada'] ?>" alt="<?= $arrBanner[$j]['nombre'] ?>"
							class="responsive-image">

						<a href="<?= base_url() . '/tienda/categoria/' . $arrBanner[$j]['idservicio'] . '/' . $ruta; ?>"
							class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l bg-orange" style="border-radius: 10px;">
								<span class="block1-name mtext-101 trans-04 p-b-8 text-white m-1 mr-3 ml-3">
									<?= $arrBanner[$j]['nombre'] ?>
								</span>
							</div>
							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									Ver mas
								</div>
							</div>
						</a>
					</div>
				</div>

			<?php
			}
			?>
		</div>
	</div>
</div>

<!-- Product -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				Nuestros servicion
			</h3>
		</div>
		<hr>
		<div class="row isotope-grid" style="background-color: white;">
		<?php
			if (!empty($arrProductos)) {
				for ($p = 0; $p < count($arrProductos); $p++) {
					$rutaProducto = $arrProductos[$p]['ruta'] ?? 'default-route';
					$portada = $arrProductos[$p]['portada'] ?? media() . '/images/uploads/product.png';
					$nombreProducto = $arrProductos[$p]['nombre'] ?? 'Producto desconocido';
					$precioProducto = $arrProductos[$p]['precio'] ?? 0.0;
		?>
        <div class="col-6 col-sm-6 col-md-4 col-lg-3 p-b-45 p-r-20 p-l-20 isotope-item women">
            <div class="block2">
                <div class="block2-pic hov-img0" style="height: 150px;">
                    <img src="<?= $portada ?>" alt="<?= $nombreProducto ?>" style="height: 100%;">
                    <a href="<?= base_url() . '/tienda/producto/' . ($arrProductos[$p]['idservicio'] ?? 0) . '/' . $rutaProducto; ?>"
                        class="block2-btn flex-c-m stext-103 cl2 size-102 bg-orange bor2 hov-btn1 p-lr-15 trans-04">
                        Ver producto
                    </a>
                </div>
                <div class="block2-txt flex-w flex-t p-t-14">
                    <div class="block2-txt-child1 flex-col-l ">
                        <a href="<?= base_url() . '/tienda/producto/' . ($arrProductos[$p]['idservicio'] ?? 0) . '/' . $rutaProducto; ?>"
                            class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                            <?= $nombreProducto ?>
                        </a>
                        <span class="stext-105 cl3">
                            <?= SMONEY . formatMoney($precioProducto); ?>
                        </span>
                    </div>
                    <div class="block2-txt-child2 flex-r p-t-3">
                        <a href="#" id="<?= openssl_encrypt($arrProductos[$p]['idservicio'] ?? 0, METHODENCRIPT, KEY); ?>"
                            class="btn-addwish-b2 dis-block pos-relative js-addwish-b2 js-addcart-detail
                            icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11
                            ">
                            <i class="zmdi zmdi-shopping-cart"></i>
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


		</div>
		<!-- Load more -->
		<div class="flex-c-m flex-w w-full p-t-45">
			<a href="<?= base_url() ?>/tienda"
				class="flex-c-m stext-101 cl5 size-103 bg-orange bor1 hov-btn1 p-lr-15 trans-04">
				Ver más
			</a>
		</div>
	</div>
	<div class="container text-center p-t-80">
		<hr>
		<?= $contentPage ?>
	</div>
</section>
<?php
footerTienda($data);
?>