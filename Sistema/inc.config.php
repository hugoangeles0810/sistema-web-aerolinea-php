<?php

function conectarse() {
    $servidor = "localhost";
    $database = "aerolinea";
    $user = "root";
    $pass = "angeles05";

    if (!($link = mysql_connect($servidor, $user, $pass))) {
        echo "Error conectando a la base de datos.";
        exit();
    }

    if (!mysql_select_db($database, $link)) {
        echo "Error seleccionando la base de datos.";
        exit();
    }

    return $link;
}

?>