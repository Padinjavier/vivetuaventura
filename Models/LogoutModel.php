<?php 
class LogoutModel extends Mysql {
    public function __construct() {
        parent::__construct();
    }   

    public function cerrarconeccionuser(int $idusuario) {
        $conec = 0; // Definimos el valor de la conexión como 0 (desconectado)
        
        // Preparamos la consulta SQL para actualizar el estado de conexión y la fecha/hora de la última conexión
        $sql = "UPDATE persona SET conexion = ?, time_conexion = NOW() WHERE idpersona = ?";
        
        // Los datos que queremos pasar a la consulta (el valor de conexión y el ID del usuario)
        $arrData = array($conec, $idusuario);
        
        // Ejecutamos la consulta utilizando el método update y pasamos los datos
        $request = $this->update($sql, $arrData);
        
        // Retornamos el resultado de la operación
        return $request;
    }
    
}
?>
