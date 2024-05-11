<?php 

	class EmpleadosModel extends Mysql
	{
		private $intIdEmpleado;
		private $strIdentificacion;
		private $strNombre;
		private $strApellido;
		private $intTelefono;
		private $strEmail;
		private $strPassword;
		private $strToken;
		private $intTipoId;
		private $intStatus;
		private $strNit;
		private $strNomFiscal;
		private $strDirFiscal;

		public function __construct()
		{
			parent::__construct();
		}	

		public function insertEmpleado(string $identificacion, string $nombre, string $apellido, int $telefono, string $email, int $tipoid, int $status){

			$this->strIdentificacion = $identificacion;
			$this->strNombre = $nombre;
			$this->strApellido = $apellido;
			$this->intTelefono = $telefono;
			$this->strEmail = $email;
			$this->intTipoId = $tipoid;
			$this->intStatus = $status;
			$return = 0;

			$sql = "SELECT * FROM persona WHERE 
					email_user = '{$this->strEmail}' or identificacion = '{$this->strIdentificacion}' ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				$query_insert  = "INSERT INTO persona(identificacion,nombres,apellidos,telefono,email_user,rolid,status) 
								  VALUES(?,?,?,?,?,?,?)";
	        	$arrData = array($this->strIdentificacion,
        						$this->strNombre,
        						$this->strApellido,
        						$this->intTelefono,
        						$this->strEmail,
        						$this->intTipoId,
        						$this->intStatus);
	        	$request_insert = $this->insert($query_insert,$arrData);


				$query_insertop  = "INSERT INTO opciones(personaid, idioma, tema, formato_moneda) VALUES(?,?,?,?)";
					$arrDataop = array($request_insert , 1, 1, 1); 
					$request_insertop = $this->insert($query_insertop, $arrDataop);
	        	$return = $request_insertop;
			}else{
				$return = -1;
			}
	        return $return;
		}
		
		public function selectEmpleados()
		{
			$whereAdmin = "";
			if($_SESSION['idUser'] != 1 ){
				$whereAdmin = " and p.idpersona != 1 ";
			}
			$sql = "SELECT p.idpersona,p.identificacion,p.nombres,p.apellidos,p.telefono,p.email_user,p.status,r.idrolusuario,r.nombrerolusuario 
					FROM persona p 
					INNER JOIN rol_usuario r
					ON p.rolid = r.idrolusuario
					WHERE p.status != 0 ".$whereAdmin;
					$request = $this->select_all($sql);
					return $request;
		}
		public function selectEmpleado(int $idpersona){
			$this->intIdEmpleado = $idpersona;
			$sql = "SELECT p.idpersona,p.identificacion,p.nombres,p.apellidos,p.telefono,p.email_user,p.nit,p.nombrefiscal,p.direccionfiscal,r.idrolusuario,r.nombrerolusuario,p.status, DATE_FORMAT(p.datecreated, '%d-%m-%Y | %h:%i:%s %p')			as fechaRegistro 
					FROM persona p
					INNER JOIN rol_usuario r
					ON p.rolid = r.idrolusuario
					WHERE p.idpersona = $this->intIdEmpleado";
			$request = $this->select($sql);
			return $request;
		}

		public function updateEmpleado(int $idEmpleado, string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $password, int $tipoid, int $status){

			$this->intIdEmpleado = $idEmpleado;
			$this->strIdentificacion = $identificacion;
			$this->strNombre = $nombre;
			$this->strApellido = $apellido;
			$this->intTelefono = $telefono;
			$this->strEmail = $email;
			$this->strPassword = $password;
			$this->intTipoId = $tipoid;
			$this->intStatus = $status;

			$sql = "SELECT * FROM persona WHERE (email_user = '{$this->strEmail}' AND idpersona != $this->intIdEmpleado)
										  OR (identificacion = '{$this->strIdentificacion}' AND idpersona != $this->intIdEmpleado) ";
			$request = $this->select_all($sql);

			if(empty($request))
			{
				if($this->strPassword  != "")
				{
					$sql = "UPDATE persona SET identificacion=?, nombres=?, apellidos=?, telefono=?, email_user=?, password=?, rolid=?, status=? 
							WHERE idpersona = $this->intIdEmpleado ";
					$arrData = array($this->strIdentificacion,
	        						$this->strNombre,
	        						$this->strApellido,
	        						$this->intTelefono,
	        						$this->strEmail,
	        						$this->strPassword,
	        						$this->intTipoId,
	        						$this->intStatus);
				}else{
					$sql = "UPDATE persona SET identificacion=?, nombres=?, apellidos=?, telefono=?, email_user=?, rolid=?, status=? 
							WHERE idpersona = $this->intIdEmpleado ";
					$arrData = array($this->strIdentificacion,
	        						$this->strNombre,
	        						$this->strApellido,
	        						$this->intTelefono,
	        						$this->strEmail,
	        						$this->intTipoId,
	        						$this->intStatus);
				}
				$request = $this->update($sql,$arrData);
			}else{
				$request = -1;
			}
			return $request;
		
		}
		public function deleteEmpleado(int $intIdpersona)
		{
			$this->intIdEmpleado = $intIdpersona;
			$sql = "UPDATE persona SET status = ? WHERE idpersona = $this->intIdEmpleado ";
			$arrData = array(0);
			$request = $this->update($sql,$arrData);
			return $request;
		}

		public function updatePerfil(int $idEmpleado, string $identificacion, string $nombre, string $apellido, int $telefono, string $password){
			$this->intIdEmpleado = $idEmpleado;
			$this->strIdentificacion = $identificacion;
			$this->strNombre = $nombre;
			$this->strApellido = $apellido;
			$this->intTelefono = $telefono;
			$this->strPassword = $password;

			if($this->strPassword != "")
			{
				$sql = "UPDATE persona SET identificacion=?, nombres=?, apellidos=?, telefono=?, password=? 
						WHERE idpersona = $this->intIdEmpleado ";
				$arrData = array($this->strIdentificacion,
								$this->strNombre,
								$this->strApellido,
								$this->intTelefono,
								$this->strPassword);
			}else{
				$sql = "UPDATE persona SET identificacion=?, nombres=?, apellidos=?, telefono=? 
						WHERE idpersona = $this->intIdEmpleado ";
				$arrData = array($this->strIdentificacion,
								$this->strNombre,
								$this->strApellido,
								$this->intTelefono);
			}
			$request = $this->update($sql,$arrData);
		    return $request;
		}

		public function updateDataFiscal(int $idEmpleado, string $strNit, string $strNomFiscal, string $strDirFiscal){
			$this->intIdEmpleado = $idEmpleado;
			$this->strNit = $strNit;
			$this->strNomFiscal = $strNomFiscal;
			$this->strDirFiscal = $strDirFiscal;
			$sql = "UPDATE persona SET nit=?, nombrefiscal=?, direccionfiscal=? 
						WHERE idpersona = $this->intIdEmpleado ";
			$arrData = array($this->strNit,
							$this->strNomFiscal,
							$this->strDirFiscal);
			$request = $this->update($sql,$arrData);
		    return $request;
		}

	}
 ?>