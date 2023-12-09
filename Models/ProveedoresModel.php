<?php

class ProveedoresModel extends Mysql
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

    public function selectProveedores()
    {
        $sql = "SELECT idproveedor,
                       nombre,
                       direccion,
                       telefono,
                       ruc
                FROM proveedor
                WHERE status != 0 ";
        $request = $this->select_all($sql);
        return $request;
    }

    // Agrega aquí otros métodos según sea necesario para la gestión de proveedores

    // Ejemplo de método para insertar un proveedor
    public function insertProveedor($nombre, $direccion, $telefono, $ruc)
    {
        $this->strNombre = $nombre;
        $this->strDireccion = $direccion;
        $this->strTelefono = $telefono;
        $this->strRuc = $ruc;

        $sql = "INSERT INTO proveedor (nombre, direccion, telefono, ruc, status)
                VALUES (?, ?, ?, ?, 1)";

        $arrData = array($this->strNombre, $this->strDireccion, $this->strTelefono, $this->strRuc);

        $request = $this->insert($sql, $arrData);
        return $request;
    }

    // Agrega otros métodos según sea necesario para actualizar, eliminar, obtener un proveedor específico, etc.
}
