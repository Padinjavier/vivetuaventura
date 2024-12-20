<?php

class Reservas extends Controllers
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        //session_regenerate_id(true);
        if (empty($_SESSION['login'])) {
            header('Location: ' . base_url() . '/login');
            die();
        }
        // getPermisos(MCLIENTES);
    }

    public function Reservas()
    {
        if (empty($_SESSION['permisosMod']['r'])) {
            header("Location:" . base_url() . '/dashboard');
        }
        $data['page_tag'] = "Reservas";
        $data['page_title'] = "Reservas <small> </small>";
        $data['page_name'] = "Reservas";
        $data['page_functions_js'] = "functions_reservas.js";
        $this->views->getView($this, "reservas", $data);
    }


    public function getReservas()
    {
        if ($_SESSION['permisosMod']['r']) {
            $arrData = $this->model->selectReservas();
            for ($i = 0; $i < count($arrData); $i++) {
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


                if ($_SESSION['permisosMod']['r']) {
                    $btnView = '<button class="btn btn-info btn-sm btnView btnViewInfo" onClick="fntViewReserva(' . $arrData[$i]['idreserva'] . ')" title="Ver cliente"><i class="far fa-eye"></i></button>';
                }
                if ($_SESSION['permisosMod']['u']) {
                    $btnEdit = '<button class="btn btn-primary  btn-sm btnEdit btnEditInfo" onClick="fntEditInfo(this,' . $arrData[$i]['idreserva'] . ')" title="Editar cliente"><i class="fas fa-pencil-alt"></i></button>';
                }
                if ($_SESSION['permisosMod']['d']) {
                    $btnDelete = '<button class="btn btn-danger btn-sm btnDel btnDelInfo" onClick="fntDelInfo(' . $arrData[$i]['idreserva'] . ')" title="Eliminar cliente"><i class="far fa-trash-alt"></i></button>';
                }
                $arrData[$i]['options'] = '<div class="text-center" style="display:flex; flex-direction:row; justify-content:space-evenly; gap:10px;">' . $btnView . ' ' . $btnEdit . ' ' . $btnDelete . '</div>';
            }
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
        }
        die();
    }
    public function getReserva(int $idreserva)
    {
        if ($_SESSION['permisosMod']['r']) {
            $idreserva = intval($idreserva);
            if ($idreserva > 0) {
                $arrData = $this->model->getReservaConDetalle($idreserva);
                if (empty($arrData)) {
                    $arrResponse = array("status" => false, "msg" => "Datos no disponibles.");
                } else {
                    // Acceder correctamente al campo captura_voucher dentro de 'reserva'
                    $arrData['reserva']['captura_voucher'] = media() . '/tienda/images/reservas/' . $arrData['reserva']['captura_voucher'];

                    // Respuesta exitosa
                    $arrResponse = array('status' => true, 'data' => $arrData);
                }
                echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
            }
        }
        die();
    }
    public function guardarReserva()
    {
        if ($_POST) {
            // Validar campos obligatorios
            if (empty($_POST['numeroCelular']) || empty($_POST['modalidadPago']) || empty($_POST['fechaPago']) || empty($_POST['codigoVoucher'])) {
                $arrResponse = array("status" => false, "msg" => "Todos los campos son obligatorios.");
            } else {
                // Obtener datos del formulario
                $idReserva = isset($_POST['idReserva']) ? intval($_POST['idReserva']) : 0; // Verificar si existe idReserva
                $codreserva = !empty($_POST['codreserva']) ? strClean($_POST['codreserva']) : 0;
                $modalidadPago = strClean($_POST['modalidadPago']);
                $fechaPago = $_POST['fechaPago'];
                $codigoVoucher = strClean($_POST['codigoVoucher']);
                $stadopago = !empty($_POST['stadopago']) ? strClean($_POST['stadopago']) : 0;
                // $serviciosReservados = json_decode($_POST['serviciosReservados'], true); // Decodificar JSON
                $serviciosReservados = !empty($_POST['serviciosReservados']) ? json_decode($_POST['serviciosReservados'], true) : $_SESSION['arrCarrito'];
                $total = 0.00;

                if ($idReserva == 0) {
                    // Obtener el último código de reserva
                    $ultimoCodigo = $this->model->getUltimoCodigoReserva(); // Consulta a la base de datos
                    if ($ultimoCodigo) {
                        // Extraer la parte numérica del código (después del guion bajo "_")
                        $codigoNumerico = intval(explode("_", $ultimoCodigo['cod_reserva'])[1]);
                        $nuevoCodigoNumerico = $codigoNumerico + 1; // Incrementar en 1
                    } else {
                        // Si no existe ninguna reserva, iniciar en 1
                        $nuevoCodigoNumerico = 1;
                    }
                    // Generar el nuevo código de reserva
                    $codReserva = "R_" . $nuevoCodigoNumerico;
                    // Crear nueva reserva
                    $capturaVoucher = $_FILES['adjuntarVoucher']['name'];
                    $idPersona = $_SESSION['userData']['idpersona'];
                    $idTipoPago = ($modalidadPago == 'yape') ? 6 : 8; // 6 = Yape, 8 = BCP
                    // Subir voucher
                    $uploadDir = "assets/tienda/images/reservas/";
                    $filePath = $uploadDir . $capturaVoucher;

                    if (!file_exists($uploadDir)) {
                        mkdir($uploadDir, 0777, true); // Crear directorio si no existe
                    }
                    move_uploaded_file($_FILES['adjuntarVoucher']['tmp_name'], $filePath);
                    // Insertar nueva reserva
                    $stadopago = 1; // Reserva activa
                    $idReserva = $this->model->insertReserva($codReserva, $idPersona, $idTipoPago, $fechaPago, $total, $codigoVoucher, $capturaVoucher, $stadopago);
                   
                    if ($idReserva > 0) {
                        foreach ($serviciosReservados as $detalle) {
                            $idServicio = $detalle['idproducto'];
                            $cantidad = intval($detalle['cantidad']);
                            $precio = floatval($detalle['precio']);
                            $this->model->insertDetalleReserva($codReserva, $idServicio, $precio, $cantidad);
                            $total += $precio * $cantidad;
                        }
                        // Actualizar el total de la reserva
                        $this->model->updateTotalReserva($idReserva, $total, $stadopago);
                        $arrResponse = array("status" => true, "msg" => "Reserva registrada correctamente.");
                    } else {
                        $arrResponse = array("status" => false, "msg" => "No se pudo registrar la reserva.");
                    }
                } else {
                    // Actualizar reserva existente
                    $this->model->deleteDetalleReserva($codreserva); // Eliminar detalles anteriores
                    // Insertar nuevos detalles usando serviciosReservados
                    foreach ($serviciosReservados as $detalle) {
                        $idServicio = $detalle['id'];
                        $cantidad = intval($detalle['cantidad']);
                        $precio = floatval($detalle['precio']);
                        $this->model->insertDetalleReserva($codreserva, $idServicio, $precio, $cantidad);
                        $total += $precio * $cantidad;
                    }
                    // Actualizar el total de la reserva
                    $this->model->updateTotalReserva($idReserva, $total, $stadopago);
                    $arrResponse = array("status" => true, "msg" => "Reserva actualizada correctamente.");
                }
            }
            echo json_encode($arrResponse, JSON_UNESCAPED_UNICODE);
        }
        // Limpiar la variable de sesión
        unset($_SESSION['arrCarrito']);
        die();
    }

}
?>