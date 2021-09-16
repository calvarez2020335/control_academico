<%-- 
    Document   : index
    Created on : 29/08/2021, 07:19:03 AM
    Author     : Carlos Adolfo Alvarez Crúz
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <title>Control Academico - inicio</title>
    </head>
    <body>


        <!-- Aqui empieza BOOSTRAPPPPPPPP******************************************-->

        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <section class="main" class="py-6 mb-6">

            <div class="container py-5">

                <div class="row py-5">
                    <div class="col-lg-7 pt-5 text-center">
                        <h1 class="pt-5">Bienvenido, desde aquí puede tener el control académico!</h1>
                    </div>
                </div>

            </div>

        </section>


        <!-- Seccion 2 -->

        <section class="new">
            <div class="container py-5">
                <div class="row pt-5">
                    <div class="col-lg-7 m-auto">
                        <div class="row text-center">
                            <h2>Puedes ...</h2>
                            <h1></h1>
                            <h1></h1>
                            <h1></h1>
                            <div class="col-lg-4" >
                                <img src="assets/images/editar.png" class="img-luid" alt="">
                                <h6 >EDITAR </h6>
                            </div>
                            <div class="col-lg-4">
                                <img src="assets/images/agregar-archivo.png" class="img-luid" alt="">
                                <h6>AGREGAR</h6>
                            </div>
                            <div class="col-lg-4">
                                <img src="assets/images/remove.png" class="img-luid" alt="">
                                <h6>ELIMINAR</h6> 
                            </div>
                            <h1></h1>
                            <h1></h1>
                            <h1></h1>
                            <h2>Registros</h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CREDITOS -->

        <section class="product te">
            <div class="container py-5">
                <div class="row py-5 ">
                    <div class="col-lg-5 m-auto text-center">
                        <h1>Colaboradores</h1>
                        <h6 style="color: red;">Developer´s</h6>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-sm-4">
                        <!-- empieza carusel   *********************************-->

                        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="5" aria-label="Slide 6"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="6" aria-label="Slide 7"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="assets/images/Cuatote.jpg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Curso</h5>
                                        <p>Puedes comunicarte con el:</p>
                                        <p>scua-2020220@kinal.edu.gt</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/images/De la Cruz.jpeg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Salón</h5>
                                        <p>Puedes contartarte con el:</p>
                                        <p>adelacruz-2020390@kinal.edu.gt</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/images/Enrique.jpeg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Horario</h5>
                                        <p>Puedes contactarte con el:</p>
                                        <p>dhernandez-2020394@kinal.edu.gt</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/images/Marroquin.jpeg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Asignnación de alumnos</h5>
                                        <p>Puedes contactarte con el:</p>
                                        <p>jmarroquin-2020296@kinal.edu.gt</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/images/Vicente.jpeg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Carrera tecnica</h5>
                                        <p>Puedes contactarte con el:</p>
                                        <p>evicente-2020325@kinal.edu.gt</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/images/Gonzales.jpeg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Instructor</h5>
                                        <p>Puedes contactarte con el:</p>
                                        <p>cgonzalez-2020261@kinal.edu.gt</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img src="assets/images/Pichola.jpeg" class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>Alumno</h5>
                                        <p>Puedes contactarte con el</p>
                                        <p>cpichola-2020284@kinal.edu.gt</p>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>

                        <!-- Aqui termina carrosel *****************************-->

                    </div>
                </div>
            </div>
        </section>

        <!--Contactos-->

        <section class="contact py-5">
            <div class="conteiner py-5">
                <div class="row">
                    <div class="col-lg-5 m-auto text-center">
                        <h1>Contactanos</h1>
                        <h6 style="color: red;">Sera un gusto atenderte</h6>
                    </div>
                </div>
                <div class="row py-5">
                    <div class="col-lg-9 ms-auto">
                        <div class="row">
                            <div class="col-lg-4">
                                <h6>Encuentranos en:</h6>
                                <p>6A Avenida 13-54, Cdad. de Guatemala</p>
                                <h6>Llamanos</h6>
                                <p>2216 0000</p>
                                <h6>Escribenos</h6>
                                <p>calvarez-2020335@kinal.edu.gt</p>
                            </div>

                            <div class="col-lg-7">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <br>
                                        <br>

                                        <h3>No dudes en contactarnos, sera un gusto atenderte</h3>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!--Contactos-->

        <!-- FOOTERRRRRRRRRR -->

        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <!-- FOOTERRRRRRRRRR -->

        <!-- Aqui termina BOOSTRAPPPPPPPP******************************************-->


        <script src="./assets/js/jquery-3.6.0.js"></script> 
        <script src="./assets/js/bootstrap.bundle.js"></script>

    </body>
</html>
