<?php 

class Reservas extends Controllers{
	public function __construct()
	{
		parent::__construct();
		session_start();
		//session_regenerate_id(true);
		if(empty($_SESSION['login']))
		{
			header('Location: '.base_url().'/login');
			die();
		}
		// getPermisos(MCLIENTES);
	}

	public function Reservas()
	{
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$data['page_tag'] = "Reservas";
		$data['page_title'] = "Reservas <small> </small>";
		$data['page_name'] = "Reservas";
		$data['page_functions_js'] = "functions_reservas.js";
		$this->views->getView($this,"reservas",$data);
	}


	public function getReservas()
	{
		if($_SESSION['permisosMod']['r']){
			$arrData = $this->model->selectReservas();
			for ($i=0; $i < count($arrData); $i++) {
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';

                switch ($arrData[$i]['status']) {
					case 2:
						$arrData[$i]['status'] = '<span style="background-color: green; color: white; border-radius: 5px; padding: 5px;">Pago / Aprobado</span>';
						break;
					case 1:
						$arrData[$i]['status'] = '<span style="background-color: yellow; color: black; border-radius: 5px; padding: 5px;">Pago / Por Aprobar</span>';
						break;
					case 3:
						$arrData[$i]['status'] = '<span style="background-color: red; color: white; border-radius: 5px; padding: 5px;">Pago / Erróneo</span>';
						break;
					default:
						$arrData[$i]['status'] = '<span>No definido</span>';
				}


				if($_SESSION['permisosMod']['r']){
					$btnView = '<button class="btn btn-info btn-sm btnView btnViewInfo" onClick="fntViewInfo('.$arrData[$i]['idreserva'].')" title="Ver cliente"><i class="far fa-eye"></i></button>';
				}
				if($_SESSION['permisosMod']['u']){
					$btnEdit = '<button class="btn btn-primary  btn-sm btnEdit btnEditInfo" onClick="fntEditInfo(this,'.$arrData[$i]['idreserva'].')" title="Editar cliente"><i class="fas fa-pencil-alt"></i></button>';
				}
				if($_SESSION['permisosMod']['d']){	
					$btnDelete = '<button class="btn btn-danger btn-sm btnDel btnDelInfo" onClick="fntDelInfo('.$arrData[$i]['idreserva'].')" title="Eliminar cliente"><i class="far fa-trash-alt"></i></button>';
				}
				$arrData[$i]['options'] = '<div class="text-center" style="display:flex; flex-direction:row; justify-content:space-evenly; gap:10px;">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
		}
		die();
	}

	public function getCliente($idpersona){
		if($_SESSION['permisosMod']['r']){
			$idusuario = intval($idpersona);
			if($idusuario > 0)
			{
				$arrData = $this->model->selectCliente($idusuario);
				if(empty($arrData))
				{
					$arrResponse = array('status' => false, 'msg' => 'Datos no encontrados.');
				}else{
					$arrResponse = array('status' => true, 'data' => $arrData);
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
		}
		die();
	}

	public function delCliente()
	{
		if($_POST){
			if($_SESSION['permisosMod']['d']){
				$intIdpersona = intval($_POST['idUsuario']);
				$requestDelete = $this->model->deleteCliente($intIdpersona);
				if($requestDelete)
				{
					$arrResponse = array('status' => true, 'msg' => 'Datos del cliente eliminado correctamente.');
				}else{
					$arrResponse = array('status' => false, 'msg' => 'Error al eliminar al cliente.');
				}
				echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
			}
		}
		die();
	}


	public function getlistclientes() {
		$htmlOptions = '<option value="">Seleccione una opción</option>';
		$arrData = $this->model->selectClientes();
		if (count($arrData) > 0) {
			foreach ($arrData as $row) {
				$htmlOptions .= '<option value="'.htmlspecialchars($row['identificacion']).'">'.htmlspecialchars($row['nombres']).' '.htmlspecialchars($row['apellidos']).'</option>';
			}
		}
		echo $htmlOptions;
		die();
	}

}

?>