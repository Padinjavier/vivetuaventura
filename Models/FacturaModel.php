<?php 
	class FacturaModel extends Mysql
	{
		public function __construct()
		{
			parent::__construct();
		}

		// public function selectPedido(int $idpedido, $idpersona = NULL){
		// 	$busqueda = "";
		// 	if($idpersona != NULL){
		// 		$busqueda = " AND p.personaid =".$idpersona;
		// 	}
		// 	$request = array();
		// 	$sql = "SELECT p.idpedido,
		// 					p.referenciacobro,
		// 					p.idtransaccionpaypal,
		// 					p.personaid,
		// 					DATE_FORMAT(p.fecha, '%d/%m/%Y') as fecha,
		// 					p.costo_envio,
		// 					p.monto,
		// 					p.tipopagoid,
		// 					t.tipopago,
		// 					p.direccion_envio,
		// 					p.status
		// 			FROM pedido as p
		// 			INNER JOIN tipopago t
		// 			ON p.tipopagoid = t.idtipopago
		// 			WHERE p.idpedido =  $idpedido ".$busqueda;
		// 	$requestPedido = $this->select($sql);
		// 	if(!empty($requestPedido)){
		// 		$idpersona = $requestPedido['personaid'];
		// 		$sql_cliente = "SELECT idpersona,
		// 								identificacion,
		// 								nombres,
		// 								apellidos,
		// 								telefono,
		// 								email_user
										
		// 						FROM persona WHERE idpersona = $idpersona ";
		// 		$requestcliente = $this->select($sql_cliente);
		// 		// $sql_detalle = "SELECT p.idproducto,
		// 		// 							p.nombre as producto,
		// 		// 							d.precio,
		// 		// 							d.cantidad
		// 		// 					FROM detalle_pedido d
		// 		// 					INNER JOIN producto p
		// 		// 					ON d.productoid = p.idproducto
		// 		// 					WHERE d.pedidoid = $idpedido";
		// 		// $requestProductos = $this->select_all($sql_detalle);
		// 		$sql_detalle = "SELECT s.idservicio,
		// 								s.nombre as servicio,
		// 								d.precio,
		// 								d.cantidad
		// 						FROM detalle_pedido d
		// 						INNER JOIN servicio s
		// 						ON d.productoid = s.idservicio
		// 						WHERE d.pedidoid = $idpedido";
		// 				$requestProductos = $this->select_all($sql_detalle);

		// 		$request = array('cliente' => $requestcliente,
		// 						'orden' => $requestPedido,
		// 						'detalle' => $requestProductos
		// 						 );
		// 	}
		// 	return $request;
		// }
		public function selectPedido(int $idpedido, $idpersona = NULL){
		
			$request = array();
			$sql = "SELECT v.idventa,
							v.codigo_venta,
							DATE_FORMAT(v.datecreated, '%d/%m/%Y') as fecha,
							v.idvendedor,
							v.dni_cliente,
							v.idtipopago,
							v.total,
							v.status,
							t.tipopago
					FROM venta as v
					INNER JOIN tipopago t ON v.idtipopago = t.idtipopago
					WHERE v.idventa =  $idpedido ";
			$requestPedido = $this->select($sql);
			if(!empty($requestPedido)){
				$dnipersona = $requestPedido['dni_cliente'];
				$sql_cliente = "SELECT idpersona,
										identificacion,
										nombres,
										apellidos,
										telefono,
										hotel,
										email_user
								FROM persona WHERE identificacion = $dnipersona ";
				$requestcliente = $this->select($sql_cliente);
				$sql_detalle = "SELECT p.idproducto,
											p.nombre as producto,
											d.precio,
											d.cantidad
									FROM detalle_pedido d
									INNER JOIN producto p
									ON d.productoid = p.idproducto
									WHERE d.pedidoid = $idpedido";
				$requestProductos = $this->select_all($sql_detalle);
				$sql_detalle = "SELECT s.idservicio,
										s.nombre as servicio,
										d.precio,
										d.cantidad
								FROM detalle_pedido d
								INNER JOIN servicio s
								ON d.productoid = s.idservicio
								WHERE d.pedidoid = $idpedido";
						$requestProductos = $this->select_all($sql_detalle);

				$request = array('cliente' => $requestcliente,
								'orden' => $requestPedido,
								'detalle' => $requestProductos
								 );
			}
			return $request;
		}
		

	}
 ?>