<?php

require_once ('inc.config.php');
require_once (dirname(__FILE__).'/../Domain/Pais.php');

class PaisDao {

    private $link;

    public function __construct() {
        $this->link = Conexion::conectar();
    }

    public function getPaises() {
        $query = "SELECT * FROM pais";
        $result = mysql_query($query, $this->link);
        $lista = array();
        
        while ($row = mysql_fetch_array($result)) {
            $pais = new Pais();
            $pais->setId($row['id']);
            $pais->setNombre($row['nombre']);
            $lista[]=$pais;
            
        }
        return $lista;
    }
}

?>
