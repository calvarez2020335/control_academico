<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Login</title>
        <link rel="stylesheet" href="assets/css/estilos.css">

    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center pt-5 mt-5 m-1">
                <div class="col-md-6 col-sm-8 col-xl-4 col-lg-5 formulario">
                    <form action="ServletUsuario">
                        <div class="form-group text-center pt-3">
                            <h1 class="text-light">INICIAR SESI�N</h1>
                        </div>
                        <div class="form-group mx-sm-4 pt-3">
                            <input type="text" class="form-control" name="txtnom" placeholder="Ingrese su Usuario">
                        </div>
                        <div class="form-group mx-sm-4 pb-3">
                            <input type="text" class="form-control" name="txtpass" placeholder="Ingrese su Contrase�a">
                        </div>
                        <div class="form-group mx-sm-4 pb-2">
                            <input type="submit" class="btn btn-block ingresar" name="accion" value="Ingresar">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>  
    </body>
</html>