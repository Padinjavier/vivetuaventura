<?php 
require_once("Libraries/Core/Mysql.php");
trait TPaginaLink{
	private $con;

	public function getPaginaLink(){
		$this->con = new Mysql();
		$sql = "SELECT idpost, titulo, DATE_FORMAT(datecreate, '%d/%m/%Y') as fecha, ruta, status
				FROM post  
				WHERE status != 0 AND idpost != 1 ";
		$request = $this->con->select_all($sql);
		return $request;
	}
}

 ?>