<?php 
class ReservasModel extends Mysql
{
	private $intIdUsuario;
	private $strIdentificacion;
	private $strNombre;
	private $strApellido;
	private $intTelefono;
	private $strEmail;
	private $strPassword;
	private $strToken;
	private $intTipoId;
	private $intStatus;
	private $strHotel;
	private $strNomFiscal;
	private $strDirFiscal;

	public function __construct()
	{
		parent::__construct();
	}	

	public function insertCliente(string $identificacion, string $nombre, string $apellido, int $telefono, string $email, int $tipoid, string $strHotel){

		$this->strIdentificacion = $identificacion;
		$this->strNombre = $nombre;
		$this->strApellido = $apellido;
		$this->intTelefono = $telefono;
		$this->strEmail = $email;
		$this->intTipoId = $tipoid;
		$this->strHotel = $strHotel;

		$return = 0;
		$sql = "SELECT * FROM persona WHERE 
				email_user = '{$this->strEmail}' or identificacion = '{$this->strIdentificacion}' ";
		$request = $this->select_all($sql);

		if(empty($request))
		{
			$query_insert  = "INSERT INTO persona(identificacion,nombres,apellidos,telefono,email_user,hotel,rolid) 
							  VALUES(?,?,?,?,?,?,?)";
        	$arrData = array($this->strIdentificacion,
    						$this->strNombre,
    						$this->strApellido,
    						$this->intTelefono,
    						$this->strEmail,
    						$this->strHotel,
    						$this->intTipoId);
        	$request_insert = $this->insert($query_insert,$arrData);
        	$return = $request_insert;
		}else{
			$return = -1;
		}
        return $return;
	}

	public function selectReservas()
	{
		$sql = "SELECT r.idreserva, r.cod_reserva, r.fecha_pago, r.total, r.status, 
                   CONCAT(p.nombres,' ',p.apellidos) AS persona, tp.tipopago 
            FROM reserva r
            INNER JOIN persona p ON r.idpersona = p.idpersona
            INNER JOIN tipopago tp ON r.idtipopago = tp.idtipopago
            WHERE r.status != 0"; 
		$request = $this->select_all($sql);
		return $request;
	}
    public function getReservaConDetalle(int $idreserva) {
		$request = array();
		// Consulta para obtener los datos de la reserva
		$sqlReserva = "SELECT r.idreserva,
							  r.cod_reserva, 
							  r.fecha_pago,
							  r.codigo_voucher, 
							  r.total,
							  r.captura_voucher,
							  r.status, 
							  p.nombres,
							  p.apellidos,
							  p.telefono,
							  tp.tipopago
					   FROM reserva r
					   INNER JOIN persona p ON r.idpersona = p.idpersona
					   INNER JOIN tipopago tp ON r.idtipopago = tp.idtipopago
					   WHERE r.status != 0 AND r.idreserva = $idreserva";
		$requestReserva = $this->select($sqlReserva);
		if (!empty($requestReserva)) {
			// Si se encuentra la reserva, obtener los detalles
			$cod_reserva = $requestReserva['cod_reserva'];
			$sqlDetalle = "SELECT dr.iddetalle, 
								  dr.cod_reserva, 
								  dr.idservicio, 
								  dr.precio, 
								  dr.cantidad, 
								  s.nombre AS servicio
						   FROM detalle_reserva dr
						   INNER JOIN servicio s ON dr.idservicio = s.idservicio
						   WHERE dr.cod_reserva = '$cod_reserva'";
			$requestDetalle = $this->select_all($sqlDetalle);
			// Combinar los resultados en un solo array
			$request = array(
				'reserva' => $requestReserva,
				'detalle_reserva' => $requestDetalle
			);
		}

		return $request;
	}

	public function selectCliente(int $idpersona){
		$this->intIdUsuario = $idpersona;
		$sql = "SELECT idpersona,identificacion,nombres,apellidos,telefono,email_user,hotel,status, DATE_FORMAT(datecreated, '%d-%m-%Y | %h:%i:%s %p') as datecreated 
				FROM persona
				WHERE idpersona = $this->intIdUsuario and rolid = ".RCLIENTES;
		$request = $this->select($sql);
		return $request;
	}

	public function updateCliente(int $idUsuario, string $identificacion, string $nombre, string $apellido, int $telefono, string $email, string $strHotel){

		$this->intIdUsuario = $idUsuario;
		$this->strIdentificacion = $identificacion;
		$this->strNombre = $nombre;
		$this->strApellido = $apellido;
		$this->intTelefono = $telefono;
		$this->strEmail = $email;
		$this->strHotel = $strHotel;

		$sql = "SELECT * FROM persona WHERE (email_user = '{$this->strEmail}' AND idpersona != $this->intIdUsuario)
									  OR (identificacion = '{$this->strIdentificacion}' AND idpersona != $this->intIdUsuario) ";
		$request = $this->select_all($sql);

		if(empty($request))
		{
				$sql = "UPDATE persona SET identificacion=?, nombres=?, apellidos=?, telefono=?, email_user=?, hotel=? 
						WHERE idpersona = $this->intIdUsuario ";
				$arrData = array($this->strIdentificacion,
        						$this->strNombre,
        						$this->strApellido,
        						$this->intTelefono,
        						$this->strEmail,
        						$this->strHotel,);
			
			$request = $this->update($sql,$arrData);
		}else{
			$request = -1;
		}
		return $request;
	}

	public function deleteCliente(int $intIdpersona)
	{
		$this->intIdUsuario = $intIdpersona;
		$sql = "UPDATE persona SET status = ? WHERE idpersona = $this->intIdUsuario ";
		$arrData = array(0);
		$request = $this->update($sql,$arrData);
		return $request;
	}




	public function insertReserva(string $codReserva, int $idPersona, int $idTipoPago, string $fechaPago, float $total, string $codigoVoucher, string $capturaVoucher, int $status) {
		$this->con = new Mysql(); // Inicializar conexión
		$query_insert = "INSERT INTO reserva (cod_reserva, idpersona, idtipopago, fecha_pago, total, codigo_voucher, captura_voucher, status) 
						 VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		$arrData = array($codReserva, $idPersona, $idTipoPago, $fechaPago, $total, $codigoVoucher, $capturaVoucher, $status);
		$request_insert = $this->con->insert($query_insert, $arrData);
		return $request_insert;
	}
	
	public function insertDetalleReserva(int $codReserva, int $idServicio, float $precio, int $cantidad) {
		$this->con = new Mysql(); // Inicializar conexión
		$query_insert = "INSERT INTO detalle_reserva (cod_reserva, idservicio, precio, cantidad) 
						 VALUES (?, ?, ?, ?)";
		$arrData = array($codReserva, $idServicio, $precio, $cantidad);
		$request_insert = $this->con->insert($query_insert, $arrData);
		return $request_insert;
	}
	
	public function updateTotalReserva(int $idReserva, float $total) {
		$this->con = new Mysql(); // Inicializar conexión
		$query_update = "UPDATE reserva SET total = ? WHERE idreserva = ?";
		$arrData = array($total, $idReserva);
		$request_update = $this->con->update($query_update, $arrData);
		return $request_update;
	}
	
}

 ?>