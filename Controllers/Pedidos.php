<?php 
require_once("Models/TTipoPago.php"); 
class Pedidos extends Controllers{
	use TTipoPago;
	public function __construct()
	{
		parent::__construct();
		session_start();
		if(empty($_SESSION['login']))
		{
			header('Location: '.base_url().'/login');
			die();
		}
		getPermisos(MPEDIDOS);
	}

	public function Pedidos()
	{
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$data['page_tag'] = "Pedidos";
		$data['page_title'] = "PEDIDOS <small>Tienda Virtual</small>";
		$data['page_name'] = "pedidos";
		$data['page_functions_js'] = "functions_pedidos.js";
		$this->views->getView($this,"pedidos",$data);
	}

	public function getPedidos(){
		if($_SESSION['permisosMod']['r']){
			$idpersona = "";
			if( $_SESSION['userData']['idrolusuario'] == RCLIENTES ){
				$idpersona = $_SESSION['userData']['idpersona'];
			}
			$arrData = $this->model->selectPedidos($idpersona);
			//dep($arrData);
			for ($i=0; $i < count($arrData); $i++) {
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';

				$arrData[$i]['transaccion'] = $arrData[$i]['referenciacobro'];
				if($arrData[$i]['idtransaccionpaypal'] != ""){
					$arrData[$i]['transaccion'] = $arrData[$i]['idtransaccionpaypal'];
				}

				$arrData[$i]['monto'] = SMONEY.formatMoney($arrData[$i]['monto']);

				
				if($_SESSION['permisosMod']['r']){
					
					$btnView .= ' <a title="Ver Detalle" href="'.base_url().'/pedidos/orden/'.$arrData[$i]['idpedido'].'" target="_blanck" class="btn btn-info btn-sm"> <i class="far fa-eye"></i> </a>

						<a title="Generar PDF" href="'.base_url().'/factura/generarFactura/'.$arrData[$i]['idpedido'].'" target="_blanck" class="btn btn-danger btn-sm"> <i class="fas fa-file-pdf"></i> </a> ';

					if($arrData[$i]['idtipopago'] == 1){
						$btnView .= '<a title="Ver Transacción" href="'.base_url().'/pedidos/transaccion/'.$arrData[$i]['idtransaccionpaypal'].'" target="_blanck" class="btn btn-info btn-sm"> <i class="fa fa-paypal" aria-hidden="true"></i> </a> ';
					}else{
						$btnView .= '<button class="btn btn-secondary btn-sm" disabled=""><i class="fa fa-paypal" aria-hidden="true"></i></button> ';
					}
				}
				if($_SESSION['permisosMod']['u']){
					$btnEdit = '<button class="btn btn-primary  btn-sm" onClick="fntEditInfo(this,'.$arrData[$i]['idpedido'].')" title="Editar pedido"><i class="fas fa-pencil-alt"></i></button>';
				}
				$arrData[$i]['options'] = '<div class="text-center"  style="display:flex; flex-direction:row; justify-content:space-evenly; gap:10px;">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
		}
		die();
	}

	public function orden($idpedido){
		if(!is_numeric($idpedido)){
			header("Location:".base_url().'/pedidos');
		}
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$idpersona = "";
		if( $_SESSION['userData']['idrolusuario'] == RCLIENTES ){
			$idpersona = $_SESSION['userData']['idpersona'];
		}
		
		$data['page_tag'] = "Pedido - Tienda Virtual";
		$data['page_title'] = "PEDIDO <small>Tienda Virtual</small>";
		$data['page_name'] = "pedido";
		$data['arrPedido'] = $this->model->selectPedido($idpedido,$idpersona);
		$this->views->getView($this,"orden",$data);
	}

	public function transaccion($transaccion){
		if(empty($_SESSION['permisosMod']['r'])){
			header("Location:".base_url().'/dashboard');
		}
		$idpersona = "";
		if( $_SESSION['userData']['idrolusuario'] == RCLIENTES ){
			$idpersona = $_SESSION['userData']['idpersona'];
		}
		$requestTransaccion = $this->model->selectTransPaypal($transaccion,$idpersona);	
		$data['page_tag'] = "Detalles de la transacción - Tienda Virtual";
		$data['page_title'] = "Detalles de la transacción";
		$data['page_name'] = "detalle_transaccion";
		$data['page_functions_js'] = "functions_pedidos.js";
		$data['objTransaccion'] = $requestTransaccion;
		$this->views->getView($this,"transaccion",$data);
	}

	public function getTransaccion(string $transaccion){
		if($_SESSION['permisosMod']['r'] and $_SESSION['userData']['idrolusuario'] != RCLIENTES){
			if($transaccion == ""){
				$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
			}else{
				$transaccion = strClean($transaccion);
				$requestTransaccion = $this->model->selectTransPaypal($transaccion);
				if(empty($requestTransaccion)){
					$arrResponse = array("status" => false, "msg" => "Datos no disponibles.");
				}else{
					$htmlModal = getFile("Template/Modals/modalReembolso",$requestTransaccion);
					$arrResponse = array("status" => true, "html" => $htmlModal);
				}
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	}

	public function setReembolso(){
		if($_POST){
			if($_SESSION['permisosMod']['u'] and $_SESSION['userData']['idrolusuario'] != RCLIENTES){
				//dep($_POST);
				$transaccion = strClean($_POST['idtransaccion']);
				$observacion = strClean($_POST['observacion']);
				$requestTransaccion = $this->model->reembolsoPaypal($transaccion,$observacion);
				if($requestTransaccion){
					$arrResponse = array("status" => true, "msg" => "El reembolso se ha procesado.");
				}else{
					$arrResponse = array("status" => false, "msg" => "No es posible procesar el reembolso.");
				}
			}else{
				$arrResponse = array("status" => false, "msg" => "No es posible realizar el proceso, consulte al administrador.");
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	}

	public function getPedido(string $pedido){
		if($_SESSION['permisosMod']['u'] and $_SESSION['userData']['idrolusuario'] != RCLIENTES){
			if($pedido == ""){
				$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
			}else{
				$requestPedido = $this->model->selectPedido($pedido,"");
				if(empty($requestPedido)){
					$arrResponse = array("status" => false, "msg" => "Datos no disponibles.");
				}else{
					$requestPedido['tipospago'] = $this->getTiposPagoT();
					$htmlModal = getFile("Template/Modals/modalPedido",$requestPedido);
					$arrResponse = array("status" => true, "html" => $htmlModal);
				}
			}
			echo json_encode($arrResponse,JSON_UNESCAPED_UNICODE);
		}
		die();
	}

// -----------------------
// -----------------------
// -----------------------
	public function setPedido(){
		if($_POST){
			if($_SESSION['permisosMod']['u'] && $_SESSION['userData']['idrolusuario'] != RCLIENTES){
	
				// Obtener datos JSON
				$codigoVenta = isset($_POST['codigoVenta']) ? strClean($_POST['codigoVenta']) : '';
				$codigoSalida = isset($_POST['codigoSalida']) ? strClean($_POST['codigoSalida']) : '';
				$fechaHora = isset($_POST['fechaHora']) ? strClean($_POST['fechaHora']) : '';
				$idvendedor = $_SESSION['userData']['idpersona'];
				$dni_cliente = isset($_POST['dni']) ? strClean($_POST['dni']) : '';
				$nombre_cliente = isset($_POST['nombre']) ? strClean($_POST['nombre']) : '';
				$apellido_cliente = isset($_POST['apellido']) ? strClean($_POST['apellido']) : '';
				$descripcion = isset($_POST['descripcion']) ? strClean($_POST['descripcion']) : '';
				$dynamicRoles = isset($_POST['dynamicRoles']) ? json_decode($_POST['dynamicRoles'], true) : [];
				$cargadores = isset($_POST['cargadores']) ? json_decode($_POST['cargadores'], true) : [];
				$servicios = isset($_POST['servicios']) ? json_decode($_POST['servicios'], true) : [];
	
				// Verificar campos obligatorios
				if($codigoVenta == '' || $codigoSalida == '' || $fechaHora == '' || $dni_cliente == '' || $nombre_cliente == '' || $apellido_cliente == '') {
					$arrResponse = array("status" => false, "msg" => 'Datos incorrectos.');
				} else {
					// Inserción del pedido en la base de datos
					$requestPedido = $this->model->inserPedido($codigoVenta, $codigoSalida, $fechaHora, $idvendedor, $dni_cliente, $nombre_cliente, $apellido_cliente, $descripcion, $dynamicRoles, $cargadores, $servicios);
					if($requestPedido) {
						$arrResponse = array("status" => true, "msg" => "Datos guardados correctamente");
					} else {
						$arrResponse = array("status" => false, "msg" => "No es posible guardar la información.");
					}
				}
	
				echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
			}
		}
		die();
	}
	
	


	
	public function getVentas(){
		if($_SESSION['permisosMod']['r']){
			$idpersona = "";
			if( $_SESSION['userData']['idrolusuario'] == RCLIENTES ){
				$idpersona = $_SESSION['userData']['idpersona'];
			}
			$arrData = $this->model->selectVentas($idpersona);
			//dep($arrData);
			for ($i=0; $i < count($arrData); $i++) {
				$btnView = '';
				$btnEdit = '';
				$btnDelete = '';
	
				// Cambios en los nombres de las claves de los datos obtenidos
				$arrData[$i]['transaccion'] = $arrData[$i]['codigo_venta'];
				// Se elimina la comprobación para 'idtransaccionpaypal'
	
				// Se mantiene la forma de dar formato al monto
	
				if($_SESSION['permisosMod']['r']){
	
					$btnView .= ' <a title="Ver Detalle" href="'.base_url().'/pedidos/orden/'.$arrData[$i]['idventa'].'" target="_blanck" class="btn btn-info btn-sm"> <i class="far fa-eye"></i> </a>
	
						<a title="Generar PDF" href="'.base_url().'/factura/generarFactura/'.$arrData[$i]['idventa'].'" target="_blanck" class="btn btn-danger btn-sm"> <i class="fas fa-file-pdf"></i> </a> ';
	
					if($arrData[$i]['idtipopago'] == 2){ // Se cambia la comprobación para idtipopago == 2
						$btnView .= '<button class="btn btn-secondary btn-sm" disabled=""><i class="fa fa-paypal" aria-hidden="true"></i></button> ';
					}else{
						$btnView .= '<a title="Ver Transacción" href="'.base_url().'/pedidos/transaccion/'.$arrData[$i]['transaccion'].'" target="_blanck" class="btn btn-info btn-sm"> <i class="fa fa-paypal" aria-hidden="true"></i> </a> '; // Se usa la clave 'transaccion'
					}
				}
				if($_SESSION['permisosMod']['u']){
					$btnEdit = '<button class="btn btn-primary  btn-sm" onClick="fntEditInfo(this,'.$arrData[$i]['idventa'].')" title="Editar pedido"><i class="fas fa-pencil-alt"></i></button>';
				}
				$arrData[$i]['options'] = '<div class="text-center"  style="display:flex; flex-direction:row; justify-content:space-evenly; gap:10px;">'.$btnView.' '.$btnEdit.' '.$btnDelete.'</div>';
			}
			echo json_encode($arrData,JSON_UNESCAPED_UNICODE);
		}
		die();
	}
	
// -----------------------
// -----------------------
// -----------------------
}
 ?>