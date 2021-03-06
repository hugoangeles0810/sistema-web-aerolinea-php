<?
require_once (dirname(__FILE__).'/Model/Dao/CiudadDao.php');
?>
<!DOCTYPE html>
<html>
    <? include ('./Tags/head.php'); ?>
    <body >
        <div class="container">
            <header>                
                <div class="row">
                    <div class="col-md-12">
                        <div class="navbar navbar-inverse" role="navigation">
                            <div class="container">
                                <nav>
                                    <div class="navbar-header">
                                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".nav-collapse">
                                            <span class="sr-only">Toggle navigation</span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                            <span class="icon-bar"></span>
                                        </button>
                                        <a class="navbar-brand" href="#">Viajeros.com</a>
                                    </div>
                                    <div class="collapse navbar-collapse" id="menu">
                                        <ul class="nav navbar-nav">
                                            <li class="active"><a href="index.php">Inicio</a></li>
                                            <li><a href="consulta.php">Consulta</a></li>
                                            <li><a href="reserva.php">Reserva</a></li>
                                            <li><a href="compra.php">Compra</a></li>
                                            <li><a href="contactenos.php">Contáctenos</a></li>

                                        </ul>
                                        <ul class="nav navbar-form navbar-right">
                                            <a class="btn btn-primary" href="login.php">Inicia Sesion</a>
                                        </ul>

                                    </div>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>               
                <img class="" alt="" src="img/banner-empresa.jpg" width="100%" />
            </header> 
        </div>
        <?
        /* Bloque de codigo solo por motivo de pruebas */
        $br = "<br/>";
        $obj = new CiudadDao();
        $result = $obj->getCiudadesByIdPais(1);

        for ($index = 0; $index < sizeof($result); $index++) {
            $ciudad = $result[$index];
            echo "Id: ".$ciudad->getId().$br;
            echo "Nombre: ".$ciudad->getNombre().$br;
        }
        ?>
    </div>
</body>
</html>
