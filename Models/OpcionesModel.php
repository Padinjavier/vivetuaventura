<?php

// require_once 'Mysql.php'; // Asegúrate de incluir el archivo que contiene la clase Mysql si no lo has hecho

class OpcionesModel extends Mysql
{
    private $intIdProveedor;
    private $strNombre;
    private $strDireccion;
    private $strTelefono;
    private $strRuc;

    public function __construct()
    {
        parent::__construct();
    }

    public function selectOpciones(int $idpersona)
    {
        $sql = "SELECT * FROM opciones
                WHERE personaid =". $idpersona;
        $request = $this->select_all($sql);
        return $request;
    }

}
