<!DOCTYPE html>
<html>
    <head>
        <? include ('./Tags/head.php'); ?>
    </head>

    <body>
        <div class="container">
            <br><br>
            <div class="row">
                <div class="col-md-4 col-md-offset-4">
                    <section>
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title"><span class="glyphicon glyphicon-user"></span> Viajeros.com</h3>
                            </div>
                            <div class="panel-body">
                                <img src="img/logo-empresa.jpg" width="100%" >
                                <form class="form-signin" role="form" action="validar.php" method="POST">
                                    <h2 class="form-signin-heading" style="text-align: center;">Inicia sessión</h2>
                                    <input type="email" class="form-control" placeholder="Email address" required autofocus>
                                    <input type="password" class="form-control" placeholder="Password" required>
                                    <label class="checkbox">
                                        <input type="checkbox" value="remember-me"> Recuerdame
                                    </label>
                                    <button class="btn btn-lg btn-primary btn-block" type="submit">Ingresar</button>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </body>
</html>