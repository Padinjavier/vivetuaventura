<?php 
	require_once("Models/TCategoria.php");
	require_once("Models/TProducto.php");
	require_once("Models/TPaginaLink.php");
	class Home extends Controllers{
		use TCategoria, TProducto,TPaginaLink;
		public function __construct()
		{
			parent::__construct();
			session_start();
		}

		public function home()
		{
			$pageContent = getPageRout('inicio');
			$data['page_tag'] = NOMBRE_EMPESA;
			$data['page_title'] = NOMBRE_EMPESA;
			$data['page_name'] = "tienda_virtual";
			$data['page'] = $pageContent;
			$data['slider'] = $this->getslider(CAT_SLIDER);
			$data['banner'] = $this->getCategoriasT(CAT_BANNER);
			$data['productos'] = $this->getProductosT();
			$data['PaginasLink'] = $this->getPaginaLink();
			$this->views->getView($this,"home",$data); 
		}

	}
 ?>
