<?php

require_once ('inc.config.php');
require_once (dirname(__FILE__).'/../Domain/Ciudad.php');

class CiudadDao {
    
    private $link;

    public function __construct() {
        $this->link = Conexion::conectar();
    }
    
    public function getCiudadesByIdPais($idPais) {
        $query =  "SELECT * FROM ciudad ";
        $query .= "WHERE idpais='$idPais'";
        $result = mysql_query($query, $this->link);
        $lista = array();
        
        while ($row = mysql_fetch_array($result)) {
            $ciudad = new Ciudad();
            $ciudad->setId($row['id']);
            $ciudad->setNombre($row['nombre']);
            $lista[]=$ciudad;
            
        }
        return $lista;
    }
    
}

?>
