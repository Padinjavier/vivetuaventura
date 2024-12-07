<?php 
require_once("Libraries/Core/Mysql.php");
trait TProducto{
	private $con;
	private $strCategoria;
	private $intIdcategoria;
	private $intIdProducto;
	private $strProducto;
	private $cant;
	private $option;
	private $strRuta;
	private $strRutaCategoria;
	public function getProductosT(){
		$this->con = new Mysql();
		$sql = "SELECT idservicio, nombre, descripcion, precio, portada, ruta
				 FROM servicio WHERE status != 0 ORDER BY idservicio DESC LIMIT ".CANTPORDHOME;
		$request = $this->con->select_all($sql);
		if(count($request) > 0){
			for ($c=0; $c < count($request) ; $c++) { 
				$request[$c]['portada'] = BASE_URL.'/Assets/images/uploads/'.$request[$c]['portada'];		
			}
		}
		return $request;
	}
	

	public function getProductosPage($desde, $porpagina){
		$this->con = new Mysql();
		$sql = "SELECT p.idproducto,
						p.codigo,
						p.nombre,
						p.descripcion,
						p.categoriaid,
						c.nombre as categoria,
						p.precio,
						p.ruta,
						p.stock
				FROM producto p 
				INNER JOIN categoria c
				ON p.categoriaid = c.idcategoria
				WHERE p.status = 1 ORDER BY p.idproducto DESC LIMIT $desde,$porpagina";
				$request = $this->con->select_all($sql);
				if(count($request) > 0){
					for ($c=0; $c < count($request) ; $c++) { 
						$intIdProducto = $request[$c]['idproducto'];
						$sqlImg = "SELECT img
								FROM imagen
								WHERE productoid = $intIdProducto";
						$arrImg = $this->con->select_all($sqlImg);
						if(count($arrImg) > 0){
							for ($i=0; $i < count($arrImg); $i++) { 
								$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['img'];
							}
						}
						$request[$c]['images'] = $arrImg;
					}
				}
		return $request;
	}

	public function getProductosCategoriaT(int $idcategoria, string $ruta, $desde = null, $porpagina = null){
		$this->intIdcategoria = $idcategoria;
		$this->strRuta = $ruta;
		$where = "";
		if(is_numeric($desde) AND is_numeric($porpagina)){
			$where = " LIMIT ".$desde.",".$porpagina;
		}

		$this->con = new Mysql();
		$sql_cat = "SELECT idservicio,nombre,ruta FROM servicio WHERE idservicio = '{$this->intIdcategoria}'";
		$request = $this->con->select($sql_cat);

		if(!empty($request)){
			$this->strCategoria = $request['nombre'];
			$this->strRutaCategoria = $request['ruta'];
			$sql = "SELECT p.idproducto,
							p.codigo,
							p.nombre,
							p.descripcion,
							p.categoriaid,
							c.nombre as categoria,
							p.precio,
							p.ruta,
							p.stock
					FROM producto p 
					INNER JOIN categoria c
					ON p.categoriaid = c.idcategoria
					WHERE p.status != 0 AND p.categoriaid = $this->intIdcategoria AND c.ruta = '{$this->strRuta}'
					ORDER BY p.idproducto DESC ".$where;
					$request = $this->con->select_all($sql);
					if(count($request) > 0){
						for ($c=0; $c < count($request) ; $c++) { 
							$intIdProducto = $request[$c]['idproducto'];
							$sqlImg = "SELECT img
									FROM imagen
									WHERE productoid = $intIdProducto";
							$arrImg = $this->con->select_all($sqlImg);
							if(count($arrImg) > 0){
								for ($i=0; $i < count($arrImg); $i++) { 
									$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['img'];
								}
							}
							$request[$c]['images'] = $arrImg;
						}
					}
			$request = array('idcategoria' => $this->intIdcategoria,
								'ruta' => $this->strRutaCategoria,
								'categoria' => $this->strCategoria,
								'productos' => $request
							);

		}
		return $request;
	}

	public function getServicio(int $idservicio, string $ruta){
		$this->con = new Mysql();
		$this->intIdServicio = $idservicio;
		$this->strRuta = $ruta;
		
		// Consulta principal para obtener el servicio
		$sql = "SELECT s.idservicio,
						s.nombre,
						s.descripcion,
						s.precio,
						s.portada,
						s.ruta,
						s.status
				FROM servicio s
				WHERE s.status != 0 AND s.idservicio = '{$this->intIdServicio}' AND s.ruta = '{$this->strRuta}'";
		
		$request = $this->con->select($sql);
		
		if (!empty($request)) {
			// Se verifica si la imagen (portada) existe
			if (!empty($request['portada'])) {
				$request['url_image'] = media() . '/images/uploads/' . $request['portada'];
			} else {
				// Si no hay portada, se asigna una imagen por defecto
				$request['url_image'] = media() . '/images/uploads/product.png';
			}
		}
	
		return $request;
	}
	
	
	

	public function getProductosRandom(int $idservicio, int $cant, string $option){
		$this->intIdServicio = $idservicio;
		$this->cant = $cant;
		$this->option = $option;
	
		// Ajustamos las opciones de ordenamiento
		if($option == "r"){
			$this->option = " RAND() ";
		}else if($option == "a"){
			$this->option = " idservicio ASC ";
		}else{
			$this->option = " idservicio DESC ";
		}
	
		$this->con = new Mysql();
	
		// Consulta modificada para trabajar con servicios
		$sql = "SELECT s.idservicio,
						s.nombre,
						s.descripcion,
						s.precio,
						s.portada,
						s.ruta,
						s.status
				FROM servicio s
				WHERE s.status != 0 AND s.idservicio != {$this->intIdServicio}
				ORDER BY {$this->option} LIMIT {$this->cant}";
	
		// Ejecutar consulta
		$request = $this->con->select_all($sql);
	
		if(count($request) > 0){
			for ($c=0; $c < count($request); $c++) {
				// Asignar la URL de la imagen (portada)
				if(!empty($request[$c]['portada'])){
					$request[$c]['url_image'] = media().'/images/uploads/'.$request[$c]['portada'];
				} else {
					$request[$c]['url_image'] = media().'/images/uploads/product.png';  // Imagen predeterminada
				}
			}
		}
	
		return $request;
	}
	

	public function getServicioIDT(int $idservicio) {
		$this->con = new Mysql();
		$this->intIdServicio = $idservicio;
	
		// Consulta para obtener los detalles del servicio
		$sql = "SELECT s.idservicio,
						s.nombre,
						s.descripcion,
						s.precio,
						s.portada,
						s.ruta,
						s.status
				FROM servicio s
				WHERE s.status != 0 AND s.idservicio = '{$this->intIdServicio}'";
	
		// Ejecutar consulta
		$request = $this->con->select($sql);
	
		if (!empty($request)) {
			// Asignar la URL completa para la imagen (portada)
			$request['portada_url'] = media() . '/images/uploads/' . $request['portada'];
		} else {
			// Si no hay servicio, asignar una imagen por defecto
			$request['portada_url'] = media() . '/images/uploads/default_service.png';
		}
	
		return $request;
	}
	// Función para guardar el carrito en la base de datos
public function guardarCarritoEnBD($idpersona, $servicio){
    // Consulta para insertar los datos en la tabla carrito
    $sql = "INSERT INTO carrito (idpersona, idservicio, cantidad) 
            VALUES (?, ?, ?)";

    // Preparar la consulta
    $this->con = new Mysql();
    $stmt = $this->con->insert($sql);

    // Vincular los parámetros
    $stmt->bind_param("iii", $idpersona, $servicio['idservicio'], $servicio['cantidad']);

    // Ejecutar la consulta
    $stmt->execute();

    // Cerrar la declaración
    $stmt->close();
}

	// Función para obtener los detalles del carrito
public function obtenerCarrito($idpersona){
    // Consulta para obtener los servicios del carrito y sus detalles, incluyendo el precio actual de la tabla `servicio`
    $sql = "SELECT c.idcarrito, c.idservicio, c.cantidad, s.nombre, s.precio, s.portada
            FROM carrito c
            JOIN servicio s ON c.idservicio = s.idservicio
            WHERE c.idpersona = ?";

    $this->con = new Mysql();
    $stmt = $this->con->select($sql);
    $stmt->bind_param("i", $idpersona);
    $stmt->execute();
    $result = $stmt->get_result();

    $carrito = array();
    while($row = $result->fetch_assoc()){
        $carrito[] = $row;
    }
    $stmt->close();

    return $carrito;
}

	public function cantProductos($categoria = null){
		$where = "";
		if($categoria != null){
			$where = " AND categoriaid = ".$categoria;
		}
		$this->con = new Mysql();
		$sql = "SELECT COUNT(*) as total_registro FROM producto WHERE status = 1 ".$where;
		$result_register = $this->con->select($sql);
		$total_registro = $result_register;
		return $total_registro;

	}

	public function cantProdSearch($busqueda){
		$this->con = new Mysql();
		$sql = "SELECT COUNT(*) as total_registro FROM producto WHERE nombre LIKE '%$busqueda%' AND status = 1 ";
		$result_register = $this->con->select($sql);
		$total_registro = $result_register;
		return $total_registro;
	}

	public function getProdSearch($busqueda, $desde, $porpagina){
		$this->con = new Mysql();
		$sql = "SELECT p.idproducto,
						p.codigo,
						p.nombre,
						p.descripcion,
						p.categoriaid,
						c.nombre as categoria,
						p.precio,
						p.ruta,
						p.stock
				FROM producto p 
				INNER JOIN categoria c
				ON p.categoriaid = c.idcategoria
				WHERE p.status = 1 AND p.nombre LIKE '%$busqueda%' ORDER BY p.idproducto DESC LIMIT $desde,$porpagina";
				$request = $this->con->select_all($sql);
				if(count($request) > 0){
					for ($c=0; $c < count($request) ; $c++) { 
						$intIdProducto = $request[$c]['idproducto'];
						$sqlImg = "SELECT img
								FROM imagen
								WHERE productoid = $intIdProducto";
						$arrImg = $this->con->select_all($sqlImg);
						if(count($arrImg) > 0){
							for ($i=0; $i < count($arrImg); $i++) { 
								$arrImg[$i]['url_image'] = media().'/images/uploads/'.$arrImg[$i]['img'];
							}
						}
						$request[$c]['images'] = $arrImg;
					}
				}
		return $request;
	}
}

 ?>