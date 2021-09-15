<%-- 
    Document   : editar-salon
    Created on : 29/08/2021, 08:40:05 AM
    Author     : Carlos Adolfo Alvarez Crúz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Glory:ital,wght@1,200;1,500&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="./assets/css/style-css.css"/>
        <script src="https://kit.fontawesome.com/f90d3bf50d.js"></script>
        <link rel="stylesheet" href="assets/css/style-css.css"/>
        <!-- bootsrap -->
        <link rel="stylesheet" href="./assets/css/bootstrap.css">

        <title>Listado de Salones</title>

    </head>
    <body class="bg-dark">
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <section id="actions" class="py-3 mb-3 bg-info bg-opacity-50">
            <div class="container">
                <div class="row">
                    <div class="col-3">
                        <a href="salon/listarSalon.jsp" class="btn btn-danger btn-block">
                            <i class="fa fa-arrow-left"></i> Regresar A Salones
                        </a>

                    </div>
                    <div class="col-md-3">

                    </div>
                    <div class="col-md-3">

                    </div>                
                </div>
            </div>
        </section>


        <main class="container pb-5">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header bg-secondary bg-opacity-75 text-white">
                            <h4>Editar Salones</h4>
                        </div>
                        <div class="card-body bg-dark bg-opacity-75  text-white">
                            <form method="POST" action="${pageContext.request.contextPath}/ServletSalon">
                                <div class="modal-body">

                                    <div class="mb-3">
                                        <label for="capacidad" class="form-label">Capacidad del Salon</label>
                                        <input type="number" id="capacidad" name="capacidad" class="form-control" value="${salon.capacidad}">
                                    </div>

                                    <div class="mb-3">
                                        <label form="descripcion" class="form-label" >Descripcion Del Salon</label>
                                        <input type="text" id="descripcion" name="descripcion" class="form-control" value="${salon.descripcion}">
                                    </div>

                                    <div class="mb-3">
                                        <label for="nombreSalon" class="form-label">Nombre Del Salon</label>
                                        <input type="text" id="nombreSalon" name="nombreSalon" class="form-control" value="${salon.nombreSalon}">                         
                                    </div>
                                    <input type="hidden" name="salonId" value="${salon.salonId}">

                                    <input type="hidden"  name="accion" value="actualizar">                           

                                </div>
                                <div class="modal-footer p-1">
                                    
                                    <button type="submit" class="btn btn-info">Guardar Cambios</button>                    
                                </div>
                            </form>

                        </div>
                    </div>

                </div>
            </div>
        </main>




        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <script src="./assets/js/jquery-3.6.0.js"></script>
        <script src="./assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
