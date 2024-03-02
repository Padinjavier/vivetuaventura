<?php 
	class Opciones extends Controllers{
		public function __construct()
		{
			parent::__construct();
			session_start();
			getPermisos(MDOPCIONES);
		}

		public function opciones(){
			$data['page_tag'] = "Opciones";
			$data['page_title'] = "opciones";
			$data['page_name'] = "opciones";
			// $data['page_functions_js'] = "functions_usuarios.js";
			$this->views->getView($this,"opciones",$data);
		}

	}
 ?>
