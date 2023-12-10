<?php
class Proveedores extends Controllers
{
    public function __construct()
    {
        parent::__construct();
        session_start();
        if (empty($_SESSION['login'])) {
            header('Location: ' . base_url() . '/login');
            die();
        }
        getPermisos(MPROVEEDORES);
    }

    public function Proveedores()
    {
        if (empty($_SESSION['permisosMod']['r'])) {
            header("Location:" . base_url() . '/dashboard');
        }
        $data['page_tag'] = "Proveedores";
        $data['page_title'] = "PROVEEDORES <small>Tienda Virtual</small>";
        $data['page_name'] = "proveedores";
        $data['page_functions_js'] = "functions_proveedores.js"; // Asegúrate de tener el archivo JS correspondiente
        $this->views->getView($this, "proveedores", $data);
    }

    public function getProveedores()
    {
        if ($_SESSION['permisosMod']['r']) {
            $arrData = $this->model->selectProveedores();
            for ($i = 0; $i < count($arrData); $i++) {
                $btnView = '';
                $btnEdit = '';
                $btnDelete = '';

                // Agrega aquí cualquier lógica adicional necesaria para formatear datos o aplicar estilos

                if ($_SESSION['permisosMod']['r']) {
                    $btnView = '<button class="btn btn-info btn-sm" onClick="fntViewInfo(' . $arrData[$i]['idproveedor'] . ')" title="Ver proveedor"><i class="far fa-eye"></i></button>';
                }
                if ($_SESSION['permisosMod']['u']) {
                    $btnEdit = '<button class="btn btn-primary btn-sm" onClick="fntEditInfo(this,' . $arrData[$i]['idproveedor'] . ')" title="Editar proveedor"><i class="fas fa-pencil-alt"></i></button>';
                }
                if ($_SESSION['permisosMod']['d']) {
                    $btnDelete = '<button class="btn btn-danger btn-sm" onClick="fntDelInfo(' . $arrData[$i]['idproveedor'] . ')" title="Eliminar proveedor"><i class="far fa-trash-alt"></i></button>';
                }
                $arrData[$i]['options'] = '<div class="text-center">' . $btnView . ' ' . $btnEdit . ' ' . $btnDelete . '</div>';
            }
            echo json_encode($arrData, JSON_UNESCAPED_UNICODE);
        }
        die();
    }

}
?>