<?php 
headerTienda($data);
$arrProductos = $data['productos'];
//$banner = media()."/tienda/images/bg-01.jpg";
 $banner = $data['page']['portada'];
 $idpagina = $data['page']['idpost'];
 ?>


 <script>
 	document.querySelector('header').classList.add('header-v4');
 </script>

 <!-- Product -->
<section class="bg0 p-t-60 p-b-100">
	<div class="container">
		<div class="p-b-10">
			<h3 class="ltext-103 cl5">
				Servicion
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
                        <span class="stext-105 cl11 ">
							<b>
								<?= SMONEY . formatMoney($precioProducto); ?>
							</b>
                        </span>
                    </div>
                    <div class="block2-txt-child2 flex-r p-t-3">
                        <a href="#" id="<?= openssl_encrypt($arrProductos[$p]['idservicio'] ?? 0, METHODENCRIPT, KEY); ?>"
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


		</div>
		<!-- Load more -->
		<div class="flex-c-m flex-w w-full p-t-45">
			<a href="<?= base_url() ?>/tienda"
				class="flex-c-m stext-101 cl5 size-103 bg-orange bor1 hov-btn1 p-lr-15 trans-04">
				Ver más
			</a>
		</div>
	</div>
</section>
<!-- Title page -->
<section class="bg-img1 txt-center p-lr-15 p-tb-92 d-none" style="background-image: url(<?= $banner ?>);">
	<h2 class="ltext-105 cl0 txt-center">
		<?= $data['page']['titulo'] ?>
	</h2>
</section>
<!-- Content page -->
<?php
	if(viewPage($idpagina)){
		echo $data['page']['contenido'];
	}else{
  ?>
<div>
	<div class="container-fluid py-5 text-center" >
		<img src="<?= media() ?>/images/construction.png" alt="En construcción">
		<h3>Estamos trabajando para usted.</h3>
	</div>
</div>
<?php 
	}

	footerTienda($data);
?>