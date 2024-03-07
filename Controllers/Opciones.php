<?php
class Opciones extends Controllers
{
	public function __construct()
	{
		parent::__construct();
		session_start();
		if (empty($_SESSION['login'])) {
			header('Location: ' . base_url() . '/login');
			die();
		}
		getPermisos(MUSUARIOS);
	}

	public function Opciones()
	{
		$data['page_id'] = 3;
		$data['page_tag'] = "Opciones";
		$data['page_title'] = "opcionesoooo";
		$data['page_name'] = "opciones";
		$data['page_functions_js'] = "functions_opciones.js"; // Asegúrate de tener el archivo JS correspondiente
        $this->views->getView($this, "opciones", $data);
    }

    public function getOpciones()
    {
        if ($_SESSION['permisosMod']['r']) {
            $idpersona= $_SESSION['userData']['idpersona'];
            $arrData = $this->model->selectOpciones($idpersona);
           
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
        }
        die();
    }

}
?>