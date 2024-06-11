<?php 
	class PedidosModel extends Mysql
	{
		private $objCategoria;
		public function __construct()
		{
			parent::__construct();
		}

		public function selectPedidos($idpersona = null){
			$where = "";
			if($idpersona != null){
				$where = " WHERE p.personaid = ".$idpersona;
			}
			$sql = "SELECT p.idpedido,
							p.referenciacobro,
							p.idtransaccionpaypal,
							DATE_FORMAT(p.fecha, '%d/%m/%Y') as fecha,
							p.monto,
							tp.tipopago,
							tp.idtipopago,
							p.status 
					FROM pedido p 
					INNER JOIN tipopago tp
					ON p.tipopagoid = tp.idtipopago $where ";
			$request = $this->select_all($sql);
			return $request;

		}	

		public function selectPedido(int $idpedido, $idpersona = NULL){
			$busqueda = "";
			if($idpersona != NULL){
				$busqueda = " AND p.personaid =".$idpersona;
			}
			$request = array();
			$sql = "SELECT p.idpedido,
							p.referenciacobro,
							p.idtransaccionpaypal,
							p.personaid,
							DATE_FORMAT(p.fecha, '%d/%m/%Y') as fecha,
							p.costo_envio,
							p.monto,
							p.tipopagoid,
							t.tipopago,
							p.direccion_envio,
							p.status
					FROM pedido as p
					INNER JOIN tipopago t
					ON p.tipopagoid = t.idtipopago
					WHERE p.idpedido =  $idpedido ".$busqueda;
			$requestPedido = $this->select($sql);
			if(!empty($requestPedido)){
				$idpersona = $requestPedido['personaid'];
				$sql_cliente = "SELECT idpersona,
										nombres,
										apellidos,
										telefono,
										email_user,
										hotel
								FROM persona WHERE idpersona = $idpersona ";
				$requestcliente = $this->select($sql_cliente);
				$sql_detalle = "SELECT s.idservicio,
										s.nombre AS servicio,
										d.precio,
										d.cantidad
								FROM detalle_pedido d
								INNER JOIN servicio s ON d.productoid = s.idservicio
								WHERE d.pedidoid = $idpedido;
								";
				$requestProductos = $this->select_all($sql_detalle);
				$request = array('cliente' => $requestcliente,
								'orden' => $requestPedido,
								'detalle' => $requestProductos
								 );
			}
			return $request;
		}

		public function selectTransPaypal(string $idtransaccion, $idpersona = NULL){
			$busqueda = "";
			if($idpersona != NULL){
				$busqueda = " AND personaid =".$idpersona;
			}
			$objTransaccion = array();
			$sql = "SELECT datospaypal FROM pedido WHERE idtransaccionpaypal = '{$idtransaccion}' ".$busqueda;
			$requestData = $this->select($sql);
			if(!empty($requestData)){
				$objData = json_decode($requestData['datospaypal']);
				//$urlOrden = $objData->purchase_units[0]->payments->captures[0]->links[2]->href;
				$urlOrden = $objData->links[0]->href;
				$objTransaccion = CurlConnectionGet($urlOrden,"application/json",getTokenPaypal());
			}
			return $objTransaccion;
		}

		public function reembolsoPaypal(string $idtransaccion, string $observacion){
			$response = false;
			$sql = "SELECT idpedido,datospaypal FROM pedido WHERE idtransaccionpaypal = '{$idtransaccion}' ";
			$requestData = $this->select($sql);
			if(!empty($requestData)){
				$objData = json_decode($requestData['datospaypal']);
				$urlReembolso = $objData->purchase_units[0]->payments->captures[0]->links[1]->href;
				$objTransaccion = CurlConnectionPost($urlReembolso,"application/json",getTokenPaypal());
				if(isset($objTransaccion->status) and  $objTransaccion->status == "COMPLETED"){
					$idpedido = $requestData['idpedido'];
					$idtrasaccion = $objTransaccion->id;
					$status = $objTransaccion->status;
					$jsonData = json_encode($objTransaccion);
					$observacion = $observacion;
					$query_insert  = "INSERT INTO reembolso(pedidoid,
														idtransaccion,
														datosreembolso,
														observacion,
														status) 
								  	VALUES(?,?,?,?,?)";
					$arrData = array($idpedido,
	        						$idtrasaccion,
	        						$jsonData,
	        						$observacion,
	        						$status
	        					);
					$request_insert = $this->insert($query_insert,$arrData);
					if($request_insert > 0){
	        			$updatePedido  = "UPDATE pedido SET status = ? WHERE idpedido = $idpedido";
			        	$arrPedido = array("Reembolsado");
			        	$request = $this->update($updatePedido,$arrPedido);
			        	$response = true;
	        		}
				}
				return $response;
			}
		}

		public function updatePedido(int $idpedido, $transaccion = NULL, $idtipopago = NULL, string $estado){
			if($transaccion == NULL){
				$query_insert  = "UPDATE pedido SET status = ?  WHERE idpedido = $idpedido ";
	        	$arrData = array($estado);
			}else{
				$query_insert  = "UPDATE pedido SET referenciacobro = ?, tipopagoid = ?,status = ? WHERE idpedido = $idpedido";
	        	$arrData = array($transaccion,
	        					$idtipopago,
	    						$estado
	    					);
			}
			$request_insert = $this->update($query_insert,$arrData);
        	return $request_insert;
		}


		// ----------------------------------------
		// ----------------------------------------
		// ----------------------------------------
		public function inserPedido($dni_cliente, $idvendedor, $metodopago, $total, $servicios) {
			// Generar código de venta
			$codigoVenta = $this->generateCodigoVenta();
		
			// Inserción en la tabla venta
			$sqlVenta = "INSERT INTO venta (codigo_venta, dni_cliente, idvendedor, idtipopago, total)
						 VALUES (?, ?, ?, ?, ?)";
			$arrDataVenta = array($codigoVenta, $dni_cliente, $idvendedor, $metodopago, $total);
			$requestVenta = $this->insert($sqlVenta, $arrDataVenta);
		
			if($requestVenta) {
				// Obtener el ID de la última inserción
				$idVenta = $this->getLastInsertId();
		
				// Inserción en la tabla detalle_venta
				foreach ($servicios as $servicio) {
					$idservicio = $servicio['id'];
					$cantidad = $servicio['cantidad'];
					$precio = $servicio['precio'];
		
					$sqlDetalleVenta = "INSERT INTO detalle_venta (idventa, idservicio, cantidad, precio)
										VALUES (?, ?, ?, ?)";
					$arrDataDetalleVenta = array($idVenta, $idservicio, $cantidad, $precio);
					$this->insert($sqlDetalleVenta, $arrDataDetalleVenta);
				}
		
				return true;
			} else {
				return false;
			}
		}
		
		private function generateCodigoVenta() {
			// Obtener el último código de venta insertado
			$sql = "SELECT codigo_venta FROM venta ORDER BY idventa DESC LIMIT 1";
			$request = $this->select($sql);
		
			if(empty($request)) {
				return 'v_1';
			} else {
				$lastCodigo = $request['codigo_venta'];
				$number = intval(str_replace('v_', '', $lastCodigo)) + 1;
				return 'v_' . $number;
			}
		}
		
		

		public function selectVentas($idpersona = null){
			$where = "";
			if($idpersona != null){
				$where = " WHERE v.idvendedor = ".$idpersona;
			}
			$sql = "SELECT v.idventa,
							v.codigo_venta,
							 DATE_FORMAT(datecreated, '%d-%m-%Y | %h:%i:%s %p') as datecreated,
							v.idvendedor,
							v.dni_cliente,
							v.idtipopago,
							tp.tipopago as tipopago_nombre,
							v.total,
							v.status
					FROM venta v
					INNER JOIN tipopago tp
					ON v.idtipopago = tp.idtipopago $where ";
			$request = $this->select_all($sql);
			return $request;
		}
	
		public function selectTipopago()
		{
			$sql = "SELECT * FROM tipopago 
					WHERE  status != 0 "; 
			$request = $this->select_all($sql);
			return $request;
		}
// ----------------
// ----------------
// ----------------



	}
 ?>