<?php 
require_once("Models/TCategoria.php");
require_once("Models/TProducto.php");
require_once("Models/TPaginaLink.php");
	class Servicio extends Controllers{
		use TCategoria, TProducto,TPaginaLink;
		public function __construct()
		{
			parent::__construct();
			session_start();
			getPermisos(MDPAGINAS);
		}

		public function servicio()
		{
			$pageContent = getPageRout('servicio');
			if(empty($pageContent)){
				header("Location: ".base_url());
			}else{
				$data['page_tag'] = NOMBRE_EMPESA;
				$data['page_title'] = NOMBRE_EMPESA." - ".$pageContent['titulo'];
				$data['page_name'] = $pageContent['titulo'];
				$data['productos'] = $this->getProductosT();
				$data['page'] = $pageContent;
				$this->views->getView($this,"servicio",$data);  
			}

		}

	}
 ?>
