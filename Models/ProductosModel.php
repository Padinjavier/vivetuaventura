<?php 

	class ProductosModel extends Mysql
	{
		private $intIdProducto;
		private $strNombre;
		private $strDescripcion;
		private $intCodigo;
		private $intCategoriaId;
		private $intPrecio;
		private $intStock;
		private $strfecha;
		private $intStatus;
		private $strRuta;
		private $strImagen;
		private $CodVenta;
		private $idNombre;
		private $Pago;
		private $Nombreexterno;
		private $descripcion;
		private $servicios;

		public function __construct()
		{
			parent::__construct();
		}

		public function selectProductos(){
			$sql = "SELECT s.idsalida,
							s.codigo_venta,
							s.personaid,
							p.nombres,
							p.apellidos,
							s.persona_externa,
							 DATE_FORMAT(s.datecreated, '%d-%m-%Y | %h:%i:%s %p') as datecreated,
							s.pago,
							s.status 
					FROM salida s 
					INNER JOIN persona p
					ON s.personaid = p.idpersona
					WHERE s.status != 0 ";
					$request = $this->select_all($sql);
			return $request;
		}

	public function insertProducto($CodVenta, $idNombre, $Nombreexterno, $descripcion, $Pago, $servicios)
	{
		// Asignar null a las variables si están vacías
		$CodVenta = !empty($CodVenta) ? $CodVenta : null;
		$idNombre = !empty($idNombre) ? $idNombre : null;
		$Nombreexterno = !empty($Nombreexterno) ? $Nombreexterno : null;
		$descripcion = !empty($descripcion) ? $descripcion : null;
		$Pago = !empty($Pago) ? $Pago : null;

		$query_insert = "INSERT INTO salida(codigo_venta, personaid, persona_externa, descripcion, pago) 
									  VALUES(?,?,?,?,?)";
		$arrData = array($CodVenta, $idNombre, $Nombreexterno, $descripcion, $Pago);
		$request_insert = $this->insert($query_insert, $arrData);
		// Verificar si la inserción en salida fue exitosa
		if ($request_insert > 0) {
			// Obtener el último ID de salida insertado
			$query_IdSalida = "SELECT idsalida FROM salida ORDER BY idsalida DESC LIMIT 1;";
			$ultimoIsSalida = $this->select($query_IdSalida);

			if ($ultimoIsSalida) {
				$idsalida = $ultimoIsSalida['idsalida'];

				foreach ($servicios as $servicio) {
					$idservicio = $servicio['idServicio'];
					$cantidad = $servicio['cantidad'];
					$sqlDetalleVenta = "INSERT INTO detalle_salida (idsalida, idservicio, cantidad)
												VALUES (?, ?, ?)";
					$arrDataDetalleVenta = array($idsalida, $idservicio, $cantidad);
					$request = $this->insert($sqlDetalleVenta, $arrDataDetalleVenta);
				}
				$return = $request;

			} else {
				$return = $ultimoIsSalida;
			}
		} else {
			$return = $request_insert;
		}
		return $return;
	}
		

		public function updateProducto(int $idproducto, string $nombre, string $descripcion, int $codigo, int $categoriaid, string $precio, int $stock, string $strfecha, string $ruta, int $status){
			$this->intIdProducto = $idproducto;
			$this->strNombre = $nombre;
			$this->strDescripcion = $descripcion;
			$this->intCodigo = $codigo;
			$this->intCategoriaId = $categoriaid;
			$this->strPrecio = $precio;
			$this->intStock = $stock;
			$this->strfecha = $strfecha;
			$this->strRuta = $ruta;
			$this->intStatus = $status;
			$return = 0;
			$sql = "SELECT * FROM producto WHERE codigo = '{$this->intCodigo}' AND idproducto != $this->intIdProducto ";
			$request = $this->select_all($sql);
			if(empty($request))
			{
				$sql = "UPDATE producto 
						SET categoriaid=?,
							codigo=?,
							nombre=?,
							descripcion=?,
							precio=?,
							stock=?,
							fecha_v=?,
							ruta=?,
							status=? 
						WHERE idproducto = $this->intIdProducto ";
				$arrData = array($this->intCategoriaId,
        						$this->intCodigo,
        						$this->strNombre,
        						$this->strDescripcion,
        						$this->strPrecio,
        						$this->intStock,
								$this->strfecha,
        						$this->strRuta,
        						$this->intStatus);

	        	$request = $this->update($sql,$arrData);
	        	$return = $request;
			}else{
				$return = "exist";
			}
	        return $return;
		}

		public function selectProducto(int $idproducto){
			$this->intIdProducto = $idproducto;
			$sql = "SELECT p.idproducto,
							p.codigo,
							p.nombre,
							p.descripcion,
							p.precio,
							p.stock,
							p.fecha_v,
							p.categoriaid,
							c.nombre as categoria,
							p.status
					FROM producto p
					INNER JOIN categoria c
					ON p.categoriaid = c.idcategoria
					WHERE idproducto = $this->intIdProducto";
			$request = $this->select($sql);
			return $request;

		}

		public function insertImage(int $idproducto, string $imagen){
			$this->intIdProducto = $idproducto;
			$this->strImagen = $imagen;
			$query_insert  = "INSERT INTO imagen(productoid,img) VALUES(?,?)";
	        $arrData = array($this->intIdProducto,
        					$this->strImagen);
	        $request_insert = $this->insert($query_insert,$arrData);
	        return $request_insert;
		}

		public function selectImages(int $idproducto){
			$this->intIdProducto = $idproducto;
			$sql = "SELECT productoid,img
					FROM imagen
					WHERE productoid = $this->intIdProducto";
			$request = $this->select_all($sql);
			return $request;
		}

		public function deleteImage(int $idproducto, string $imagen){
			$this->intIdProducto = $idproducto;
			$this->strImagen = $imagen;
			$query  = "DELETE FROM imagen 
						WHERE productoid = $this->intIdProducto 
						AND img = '{$this->strImagen}'";
	        $request_delete = $this->delete($query);
	        return $request_delete;
		}

		public function deleteProducto(int $idproducto){
			$this->intIdProducto = $idproducto;
			$sql = "UPDATE producto SET status = ? WHERE idproducto = $this->intIdProducto ";
			$arrData = array(0);
			$request = $this->update($sql,$arrData);
			return $request;
		}
	}
 ?>