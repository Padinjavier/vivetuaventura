<?php 
require_once("Libraries/Core/Mysql.php");
trait TCategoria{
	private $con;

	public function getCategoriasT(string $categorias){
		$this->con = new Mysql();
		$sql = "SELECT idcategoria, nombre, descripcion, portada, ruta
				 FROM recuerdos WHERE status != 0 AND idcategoria IN ($categorias)";
		$request = $this->con->select_all($sql);
		if(count($request) > 0){
			for ($c=0; $c < count($request) ; $c++) { 
				$request[$c]['portada'] = BASE_URL.'/Assets/images/uploads/'.$request[$c]['portada'];		
			}
		}
		return $request;
	}

	public function getCategorias(){
		$this->con = new Mysql();
		$sql = "SELECT c.idcategoria, c.nombre, c.portada, c.ruta, count(p.categoriaid) AS cantidad
				FROM producto p 
				INNER JOIN recuerdos c
				ON p.categoriaid = c.idcategoria
				-- AND p.status = 1 para que solo se muestren los productos existentes
				WHERE c.status = 1 AND p.status = 1
				GROUP BY p.categoriaid, c.idcategoria";
		$request = $this->con->select_all($sql);
		if(count($request) > 0){
			for ($c=0; $c < count($request) ; $c++) { 
				$request[$c]['portada'] = BASE_URL.'/Assets/images/uploads/'.$request[$c]['portada'];		
			}
		}
		return $request;
	}
}

 ?>